#!/bin/bash

cd "$(dirname "$0")" || exit
source "lib_certs.sh"
cd ..

create_root_keystore \
  "config/crypto/arrowhead.p12" "arrowhead.eu"

create_cloud_keystore \
  "config/crypto/arrowhead.p12" "arrowhead.eu" \
  "config/crypto/uni/cloud.p12" "demo.uni.arrowhead.eu"

create_uni_system_keystore() {
  SYSTEM_NAME=$1
  SYSTEM_SAN=$2

  create_system_keystore \
    "config/crypto/arrowhead.p12" "arrowhead.eu" \
    "config/crypto/uni/cloud.p12" "demo.uni.arrowhead.eu" \
    "config/crypto/uni/system.${SYSTEM_NAME}.p12" "${SYSTEM_NAME}.demo.uni.arrowhead.eu" \
    "${SYSTEM_SAN}"
}

create_uni_system_keystore "authorization"         "dns:localhost,ip:127.0.0.1"
create_uni_system_keystore "event_handler"         "dns:localhost,ip:127.0.0.1"
create_uni_system_keystore "orchestrator"          "dns:localhost,ip:127.0.0.1"
create_uni_system_keystore "service_registry"      "dns:localhost,ip:127.0.0.1"

create_uni_system_keystore "buyer"                 "dns:localhost,ip:127.0.0.1"
create_uni_system_keystore "buyer_operator"        "dns:localhost,ip:127.0.0.1"
create_uni_system_keystore "contract_proxy_buyer"  "dns:localhost,ip:127.0.0.1"

create_uni_system_keystore "middleware"            "dns:localhost,ip:127.0.0.1"
create_uni_system_keystore "middleware_operator"   "dns:localhost,ip:127.0.0.1"
create_uni_system_keystore "seller"                "dns:localhost,ip:127.0.0.1"
create_uni_system_keystore "contract_proxy_seller" "dns:localhost,ip:127.0.0.1"

create_uni_system_keystore "workflow_manager" "dns:localhost,ip:127.0.0.1"
create_uni_system_keystore "workflow_executor" "dns:localhost,ip:127.0.0.1"
create_uni_system_keystore "smart_product" "dns:localhost,ip:127.0.0.1"
create_uni_system_keystore "opc_ua_provider" "dns:localhost,ip:127.0.0.1"


create_sysop_keystore \
  "config/crypto/arrowhead.p12" "arrowhead.eu" \
  "config/crypto/uni/cloud.p12" "demo.uni.arrowhead.eu" \
  "config/crypto/uni/sysop.p12" "sysop.demo.uni.arrowhead.eu"

create_truststore \
  "config/crypto/uni/truststore.p12" \
  "config/crypto/arrowhead.crt" "arrowhead.eu" \
  "config/crypto/uni/cloud.crt" "demo.uni.arrowhead.eu"
