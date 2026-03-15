CREATE TABLE IF NOT EXISTS system_bootstrap_log (
    id BIGSERIAL PRIMARY KEY,
    service_name VARCHAR(128) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO system_bootstrap_log (service_name)
VALUES ('backend-springboot');