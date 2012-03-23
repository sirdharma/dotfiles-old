/*
Assuming:
localhost:3128 \-> proxy.ertos.in.nicta.com.au:3128
 */

function FindProxyForURL(url, host)
{
  if (   // domains that route through proxy
      dnsDomainIs(host, ".nicta.com.au") ||
      dnsDomainIs(host, ".nicta.net")
     )
    return "PROXY localhost:3128";
  else
    return "DIRECT";
}
