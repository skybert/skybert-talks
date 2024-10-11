
## Agenda

---

---

Internally, Kafka opens 2 TCP connections per consumer. One for
figuring out which API versions are supported on the server and one
for actually fetching the data.

With the default configuration, a `KafkaConsumer` will open a maximum
of 1 + 1 + 1 + (2 * 100) = 203 TCP connections against Kafka.  ss is a
good tool for listing the number of connections to Kafka, the
--extended options gives also gives the inode of the file handle
backing the TCP connection, as well as the cgroup, so you can see that
Kafka opens a connection to itself too (!):

```
# watch "ss --extended --numeric '( dport = :9092 )' "
```


## Summary

---

## Delve further
