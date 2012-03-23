/*
** rockyluke
*/

function FindProxyForURL(url, host)
{
	if (host == "localhost" ||
	    isInNet(host, "127.0.0.1", "255.0.0.0"))
	    {
		return "DIRECT";
	    }
	if (isPlainHostName(host) || 
	    isInNet(host, "10.0.0.0", "255.0.0.0") || 
	    isInNet(host, "163.5.0.0", "255.255.0.0") || 
	    isInNet(host, "172.16.0.0", "255.255.0.0") || 
	    isInNet(host, "172.17.0.0", "255.255.0.0") || 
	    isInNet(host, "172.18.0.0", "255.255.0.0") || 
	    isInNet(host, "172.19.0.0", "255.255.0.0") || 
	    isInNet(host, "172.20.0.0", "255.255.0.0") || 
	    isInNet(host, "172.21.0.0", "255.255.0.0") || 
	    isInNet(host, "172.22.0.0", "255.255.0.0") || 
	    isInNet(host, "172.23.0.0", "255.255.0.0") || 
	    isInNet(host, "172.24.0.0", "255.255.0.0") || 
	    isInNet(host, "172.25.0.0", "255.255.0.0") || 
	    isInNet(host, "172.26.0.0", "255.255.0.0"))
	    {
		return "DIRECT";
	    }
	else
	    return "PROXY proxy.epitech.net:3128";
}
// EOF
