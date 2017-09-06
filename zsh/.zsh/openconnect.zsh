# UK Erlangen
function oc_uke () {
    keychain_get_password ac.ukerlangen | openconnect --script-tun --script 'ocproxy -L 11022:141.67.84.135:22 -L 11122:141.67.84.142:22 -L 11222:141.67.84.245:22 -L 11322:141.67.84.143:22 -L 11422:141.67.252.114:22 -D 11080' --user $(keychain_get_username ac.ukerlangen) --passwd-on-stdin anyasa.uk-erlangen.de/uker
}

function uke () {
    case $1 in
        extranet)   ssh smsupport@127.0.0.1 -p 11422 ;;
        jira_prod)  ssh smsupport@127.0.0.1 -p 11322 ;;
        jira_test)  ssh smsupport@127.0.0.1 -p 11222 ;;
        confl_prod) ssh smsupport@127.0.0.1 -p 11122 ;;
        confl_test) ssh smsupport@127.0.0.1 -p 11022 ;;
    esac
}

# NSK
function oc_nsk () {
    keychain_get_password ac.nsk | openconnect --script-tun --script 'ocproxy -L 12022:132.130.40.126:3389 -L 12122:132.130.40.222:3389 -D 12080' --user $(keychain_get_username ac.nsk) --authgroup Mobile-Client-VPN --servercert=sha256:82a6edd390e668c933a05484e186deb2a7e752da252ddacb3c7f8eb01bb799b4 --passwd-on-stdin euvpn.eu.nsk.com
}

# SICK
function oc_sick () {
    openconnect --juniper --script-tun --script "ocproxy -L 13022:10.2.32.218:22 -L 13122:10.2.32.219:22 -L 13222:10.1.48.50:22 -D 13080" --user $(keychain_get_username ac.sick) partner.sick.com
}

function sick () {
    case $1 in
        extranet)   ssh dstengele@127.0.0.1 -p 13222 ;;
        confl_prod) ssh dstengele@127.0.0.1 -p 13122 ;;
        confl_test) ssh dstengele@127.0.0.1 -p 13022 ;;
    esac
}

# WAGO
function oc_wago () {
    openconnect --protocol=nc --script-tun --script "ocproxy -L 14022:10.1.102.38:3389 -D 13080" --user $(keychain_get_username ac.wago) vpn.wago.com/partner
}

# Phoenix Testlab
function oc_phoenix () {
    openconnect --juniper --script-tun --script 'ocproxy -L 15022:149.208.226.11:22 -L 15122:149.208.230.34:22 -L 15222:149.208.230.34:22 -D 15080' --user PG18IB extranet.phoenixcontact.com/external-eu
}

function phoenix () {
    case $1 in
        extranet)   ssh adminsm@127.0.0.1 -p 15022 ;;
        confl_prod) ssh adminsm@127.0.0.1 -p 15122 ;;
        confl_test) ssh adminsm@127.0.0.1 -p 15222 ;;
    esac
}
