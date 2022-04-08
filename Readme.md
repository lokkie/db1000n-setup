## Original setipng:
https://www.youtube.com/watch?v=tFSQJW0vSfI&t=1066s

## Setuping influx sender
1. Setup influxdb & grafana
2. Create db1000n bucket in your incluxdb
3. Create API Token in your influxdb
4. Modify `writeinflux.sh` by setting `INF_HOST` & `INF_KEY`
5. Upload onto your server/VM/droplet
6. Run `chmod +x writeinflux.sh` 
7. Check if it's working by running it (you should see somethin like: 
```
HTTP/1.1 204 No Content
Server: nginx/1.18.0 (Ubuntu)
Date: Fri, 08 Apr 2022 14:34:44 GMT
Connection: keep-alive
X-Influxdb-Build: OSS
X-Influxdb-Version: 2.1.1

HTTP/1.1 204 No Content
Server: nginx/1.18.0 (Ubuntu)
Date: Fri, 08 Apr 2022 14:34:44 GMT
Connection: keep-alive
X-Influxdb-Build: OSS
X-Influxdb-Version: 2.1.1

HTTP/1.1 204 No Content
Server: nginx/1.18.0 (Ubuntu)
Date: Fri, 08 Apr 2022 14:35:44 GMT
Connection: keep-alive
X-Influxdb-Build: OSS
X-Influxdb-Version: 2.1.1
```
8.  Update `cronjob` with something like `* * * * * /root/writeinflux.sh >/dev/null 2>&1`
9.  Setup Grafana dashboard from `db1000n_stats_dashboard.json` (please select correct datasource during setup)
10.  Profit )


You'll get Dashboard like this:
![ScreenShot](https://github.com/lokkie/db1000n-setup/blob/98adcc6174df8c970fb27346818f621535290438/Screenshot%202022-04-08%20at%2017.35.20.png?raw=true)
