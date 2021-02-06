# https://github.com/gomods/athens/issues/1695
FROM gomods/athens:latest
RUN chmod 0644 /config/config.toml
