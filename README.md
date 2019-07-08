# AudioFetchSDKEnergyImpact

If AudioFetch SDK is initialized when a device is connected 4G or a WiFi networking without AudioFetch hardware, then the SDK enters an infinite discovery loop and unnecessarily drains device batteries.

To reproduce this:

1. Connect a physical iOS device to 4G or a WiFi network without AudioFetch hardware.
2. Run this project on the iOS device.
3. Observe the energy impact before initializing the SDK (should be around zero)
4. Click on Init SDK button.
5. Observe the SDK enters a discovery loop that does not stop until the device enters a WiFi that has AudioFetch hardware (which may never happen for some users of Equinox app). Observe the average energy impact slowly climbing from Zero to High. After a couple of minutes, it reaches its peak and stays there.

I've run this test for 30 minutes, and the SDK kept trying to discover the entire time, keeping the energy impact high.

It would be better from battery saving point of view if the SDK timed out after a short while (maybe 1 minute or so) of unsuccessfully trying to discover AudioFetch hardware. Then try again only when `resetDiscovery` is called or the device entered a new network.
