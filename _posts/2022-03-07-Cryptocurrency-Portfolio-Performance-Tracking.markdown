---
title:  "Cryptocurrency-Portfolio-Performance-Tracking"
date:  "2022-03-07
"
categories: investing crypto
---

Cryptocurrency is still young. It's hard to think of it that way when you've
been in the ecosystem for many years, but when you start to look at the
capabilities of modern exchanges compared to modern trading platforms like TD
Ameritrade, these differences become obvious.

I was originally tempted to start out with the usual, "this is not investment
advice" spiel, but this actually *is* investment advice:

> If you do not know whether you are making or losing money, there is a problem.

Although relatively sophisticated for its short lifespan, looking at a popular
exchange like Coinbase reveals that you actually have very little useful
information about your assets.

![picture of a coinbase asset](/img/coinbase-asset.png)

Most importantly, what's my bottom line?

It's great that PoopCoin is up 5% today, but if I'm $1,000 in the hole on my
investment, that's a relevant piece of information to have.

#### Aside
Your reply to this may be, "Well you shouldn't be storing your assets on an
exchange," which is very true. You shouldn't be. However, two things: a) if you
think that the majority of people aren't doing this anyway, you are
disillusioned my friend, and b) even if you don't do that, you still need a way
to get this information as the wallet is not going to tell you either.

TD Ameritrade (not without its own issues, of course) shows a wealth of relevant
information like net portfolio gain - both in percentage and in USD - as well as
daily gain/loss information broken down *per asset*. This kind of information is
invaluable for making informed decisions. What you choose to actually *do* with
that information *is* investment advice, but I'm just advocating for having it
available.

Realizing how vitally important this information is, I threw together a
prototype relatively quickly to calculate this for me in real time. It pains me
to present a shell script (essentially a polished turd) but I had no intention
of sharing this at the time and it was quick and easy for prototyping. If there
was enough demand for such a utility (and there should be) I would consider
rewriting it, but I am also very busy so no promises.

### Feature Wish List
- [X] Net portfolio gain/loss in USD
- [ ] Percentage portfolio gain/loss
- [ ] Net gain/loss in USD per asset
- [ ] Percentage of gain/loss per asset
- [ ] Daily net portfolio gain/loss in USD
- [ ] Daily percentage of portfolio gain/loss
- [ ] Daily Net gain/loss in USD per asset
- [ ] Daily Percentage of gain/loss per asset
- [ ] "Cost per share" (not sure how TD calculates this, really nice though)

Clearly this is not a comprehensive investment tool at this time, but it is a
step in the right direction.

### Source
Obviously, these numbers are all doctored and do not represent my actual
portfolio. This is also not an endorsement for any cryptocurrency listed here -
invest at your own risk.

{% highlight bash %}
#
#!/bin/bash
#
# bitbal - personal cryptocurrency portfolio tracker
#

# token used to get price data from CoinMarketCap
API_TOKEN=<redacted>

# commands used to sanity check the environment. query your wallets here,
# as if they are not running, this program is going to produce some terrible
# output
declare -A WALLET_CMDS=(
  [BTC]='bitcoin-cli getbalance'
  [DASH]='dash-cli getbalance'
  [LTC]='litecoin-cli -rpcwallet=litecoin getbalance'
  [SOL]='solana balance | cut -d ' ' -f1'
)

# fancy colors
RED="\e[91m"
GOLD="\e[93m"
GREEN="\e[94m"
WHITE="\e[0;97m"
RESET="\e[0m"

# sanity check - are wallets running?
for wallet in "${!WALLET_CMDS[@]}"; do
  if ! eval "${WALLET_CMDS[$wallet]} &> /dev/null"; then
    echo -e "${RED}Non-zero return code from $wallet wallet${RESET}"
    echo -e "${RED}Ensure that the $wallet daemon is running and your wallet is loaded${RESET}"
    exit 1
  fi
done

# total cost of your assets. needed to calculate profit margin.
COST=2912.34

declare -A ASSETS=(
  [AMP]=72.3938245
  [ANKR]=25.02894528
  [BAT]=30.30850969
  [BCH]=1.99999582
  [BTC]=$(${WALLET_CMDS[BTC]})
  [DASH]=$(${WALLET_CMDS[DASH]})
  [DOGE]=5.27693119
  [ETH]=.2
  [FET]=6.03318299
  [FIDA]=22.839705
  [GRT]=4.10445856
  [LTC]=$(${WALLET_CMDS[LTC]})
  [OMG]=0.0444308
  [PRO]=3.5156038
  [RNDR]=0.92260573
  [SOL]=$(${WALLET_CMDS[SOL]})
  [USDC]=100.001034
  [XLM]=22.9555687
)

# create array of current coin prices
declare -A PRICES=()
for key in "${!ASSETS[@]}"; do
  PRICES[$key]=$(curl -s -H \
    "X-CMC_PRO_API_KEY: ${API_TOKEN}" \
    -H "Accept: application/json" \
    -G "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=$key" \
    | jq ".data.$key.quote.USD.price")
done

# create array of current coin values (and track the total value)
TOTAL_VALUE=0
declare -A VALUES=()
for price in "${!PRICES[@]}"; do
  VALUE=$(echo "${ASSETS[$price]} * ${PRICES[$price]}" | bc)
  VALUES[$price]=${VALUE}
  TOTAL_VALUE=$(echo "${TOTAL_VALUE} + ${VALUE}" | bc)
done

# calculate and colorize profit
PROFIT=$(echo "${TOTAL_VALUE} - ${COST}" | bc)
if [[ $(echo "$PROFIT > 0" | bc) -eq 1 ]]; then
  PROFIT="${GREEN}${PROFIT}${RESET}"
else
  PROFIT="${RED}${PROFIT}${RESET}"
fi

if [[ $1 == "-v" ]]; then
  for coin in "${!PRICES[@]}"; do
    echo -e "\e[9$(echo "$(date +%s) % 8" |bc)m$coin${RESET}"
    echo "    price: ${PRICES[$coin]}"
    echo "    balance: ${ASSETS[$coin]}"
    echo "    market value: ${VALUES[$coin]}"
  done
fi

echo -e "${WHITE}----------------------------------------${RESET}"
echo -e "${GOLD}total portfolio value: ${GREEN}${TOTAL_VALUE}${RESET}"
echo -e "${GOLD}profit margin: ${PROFIT}${RESET}"
echo -e "${WHITE}----------------------------------------${RESET}"
{% endhighlight %}

For price data, we need to query a reliable source that has a lot of great data
we can leverage. I chose CoinMarketCap, but unfortunately the API requires an
account and limits you to some X amount of queries per day without a paid
account. Fortunately for me, without spastically checking the market every 10
minutes it's almost impossible to exceed the allotted 300 requests or whatever.

So you have to plop an API token in there from your CoinMarketCap account.

### Can We Do Better?
The main issue with this, of course, is that bash *can* be jank. It's not always
jank, but it's hard to test and can very often end up essentially held together
by duct tape and bailing wire. So while this is great for prototyping and creating
a proof-of-concept, if we are going to create a robust program we should really
consider using a programing language with a solid unit testing framework.

Enter the rust prototype.

{% highlight rust %}
use reqwest::{Error, Response};
use serde::Deserialize;

#[derive(Deserialize, Debug)]
struct MarketCapResponse {
    status: Status,
    data: Data
}

#[derive(Deserialize, Debug)]
struct Status {
    timestamp: String,
    error_code: i32,
    error_message: Option<String>,
    elapsed: u32,
    credit_count: i32,
    notice: Option<String>
}

#[derive(Deserialize, Debug)]
struct Data {
    #[serde(rename = "BTC")]
    btc: CurrencyInfo
}

#[derive(Deserialize, Debug)]
struct CurrencyInfo {
    id: u32,
    name: String,
    symbol: String,
    slug: String,
    num_market_pairs: u32,
    date_added: String,
    tags: Vec<String>,
    max_supply: f64,
    circulating_supply: f64,
    total_supply: f64,
    is_active: u8,
    platform: Option<String>,
    cmc_rank: u32,
    is_fiat: u8,
    self_reported_circulating_supply: Option<String>,
    self_reported_market_cap: Option<String>,
    last_updated: String,
    quote: Quote
}

#[derive(Deserialize, Debug)]
struct Quote {
    #[serde(rename = "USD")]
    usd: UsdQuote
}

#[derive(Deserialize, Debug)]
struct UsdQuote {
    price: f64,
    volume_24h: f64,
    volume_change_24h: f64,
    percent_change_1h: f64,
    percent_change_24h: f64,
    percent_change_7d: f64,
    percent_change_30d: f64,
    percent_change_60d: f64,
    percent_change_90d: f64,
    market_cap: f64,
    market_cap_dominance: f64,
    fully_diluted_market_cap: f64,
    last_updated: String
}

#[tokio::main]
async fn main() -> Result<(), Error> {
    let response = get_market_cap_response("btc", "<REDACTED>");
    println!("{:?}", response.await);
    Ok(())
}

async fn get_market_cap_response(key: &str, token: &str) -> Result<MarketCapResponse, Error> {
    let client = reqwest::Client::new();
    let request_url = format!(
        "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol={key}"
    );

    let response = match client.get(&request_url)
        .header("X-CMC_PRO_API_KEY", token)
        .send()
        .await {
            Ok(response) => response,
            Err(e) => return Err(e)
        };

    let info = match response.json().await {
        Ok(info) => info,
        Err(e) => return Err(e)
    };

    Ok(info)
}
{% endhighlight %}

So using serde I created some nested structs in the same format as the JSON response I was
getting back from CMC. This actually works really well, and makes me feel a lot better
about what I'm writing.

### The Rabbit Hole
After this was working, I went down a rabbit hole I should have gone down a decade ago:
**Creating a Terminal UI**

![terminal ui of program](/img/portfolio-ui.png)

This is pretty barebones, but I'd be lying if I said I didn't have fun making this.

If I decide to continue on this path, the next step here is to create a flow where users
can easily add their assets. Maybe by pressing 'A' or something, and having a help menu
on-screen. Then promps will pop up and ask users for the currency ticker symbol, their
current account balance, and most importantly, the cost.

Figuring out the cost might be tricky for some, but typically exchanges store that data
in an exportable format you can parse through. It's not the funnest activity you could
spend your time doing, but it *will* give you a clear picture on what your actual gains
and losses are on your cryptocurrency investments.
