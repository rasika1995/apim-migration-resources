ALTER TABLE AM_WORKFLOWS
  ADD WF_METADATA BLOB DEFAULT NULL
  ADD WF_PROPERTIES BLOB DEFAULT NULL
/

CREATE TABLE IF NOT EXISTS AM_GW_PUBLISHED_API_DETAILS (
  API_ID varchar(255) NOT NULL,
  TENANT_DOMAIN varchar(255),
  API_PROVIDER varchar(255),
  API_NAME varchar(255),
  API_VERSION varchar(255),
  PRIMARY KEY (API_ID)
) /

CREATE TABLE IF NOT EXISTS AM_GW_API_ARTIFACTS (
  API_ID varchar(255) NOT NULL,
  ARTIFACT blob,
  GATEWAY_INSTRUCTION varchar(20),
  GATEWAY_LABEL varchar(255),
  TIME_STAMP TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (GATEWAY_LABEL, API_ID),
  FOREIGN KEY (API_ID) REFERENCES AM_GW_PUBLISHED_API_DETAILS(API_ID) ON UPDATE CASCADE ON DELETE NO ACTION
) /

ALTER TABLE AM_SUBSCRIPTION ADD TIER_ID_PENDING VARCHAR(50) /

ALTER TABLE AM_POLICY_SUBSCRIPTION
    ADD MAX_COMPLEXITY INT NOT NULL DEFAULT 0
    ADD MAX_DEPTH INT NOT NULL DEFAULT 0
/
