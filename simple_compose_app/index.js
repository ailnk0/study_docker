const express = require("express");
const redis = require("redis");

const client = redis.createClient({
  host: "redis-server",
  port: 6379,
});
client.set("visits", 0);

const app = express();
const port = 3000;

app.get("/", async (req, res) => {
  client.get("visits", (err, visits) => {
    client.set("visits", parseInt(visits) + 1);
    res.send("Number of visits is " + visits);
  });
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
