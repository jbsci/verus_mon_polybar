# verus_mon_polybar

Simple way to monitor verus mining with a polybar module. 
To use:
1. Copy to wherever you store your polybar scripts
2. Change the path to the verus executeable in verus_monitor.sh
3. Add the following module to your polybar config (with your own desired update interval and underline if you wish):

```
[module/verusmonitor]
type  = custom/script
exec  = /path/to/verus_monitor.sh
interval  = 30
format-underline  = #d9bf3f
```
4. add 'verusmonitor' to wherever you specify your bar items
