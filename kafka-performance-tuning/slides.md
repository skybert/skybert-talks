
## Agenda

---

```java
    properties.put(
        ConsumerConfig.FETCH_MIN_BYTES_CONFIG,
        pConf.getQueue().getReadMinBytes());
    properties.put(
        ConsumerConfig.FETCH_MAX_WAIT_MS_CONFIG,
        pConf.getQueue().getReadMaxWait());
    properties.put(
        ConsumerConfig.MAX_POLL_RECORDS_CONFIG,
        pConf.getQueue().getReadMaxRecords());
```

---

```java
consumer.poll(timeout);
```

---

## Summary

---

## Delve further
