#!/usr/bin/env bash

# 遇到执行出错，直接终止脚本的执行
set -o errexit

function usage
{
    echo "usage: `basename $0` [-H SSH_HOST -u SSH_USR -pw SSH_PWD -sd SOURCE_DIR -dd DESTINATION_DIR]"
    echo "   "
    echo "  -H  | --host             : The remote server host"
    echo "  -u  | --usr              : The logon username"
    echo "  -pw | --pwd              : The logon password"
    echo "  -sd | --src_dir          : The source dir"
    echo "  -dd | --dst_dir          : The destination dir"
    echo "  -h  | --help             : This message"
}

function log
{
    local prefix="[$(date +%Y/%m/%d\ %H:%M:%S)]: "
    echo "${prefix} $@" >&2
}

function parse_args
{
    while [ "$1" != "" ]; do
    	case "$1" in
            -H  | --host     )      host="$2";;
            -u  | --usr      )      usr="$2";;
            -pw | --pwd      )      pwd="$2";;
            -sd | --src_dir  )      src_dir="$2";;
            -dd | --dst_dir  )      dst_dir="$2";;
            -h  | --help     )      usage; exit;;
        esac
        shift
    done

    if [[ -z "${host}" ]]; then
        log "ERROR" "host must be set"
        exit
    fi
    if [[ -z "${usr}" ]]; then
        log "ERROR" "usr must be set"
        exit
    fi
    if [[ -z "${pwd}" ]]; then
        log "ERROR" "pwd must be set"
        exit
    fi
    if [[ -z "${src_dir}" ]]; then
        log "ERROR" "src_dir must be set"
        exit
    fi
    if [[ -z "${dst_dir}" ]]; then
        log "ERROR" "dst_dir must be set"
        exit
    fi
}

function batch_scp
{
    for FILE in $(ls ${src_dir}); do
        expect -c "
            set timeout 300
            spawn scp -r ${FILE} ${usr}@${host}:${dst_dir}
            expect {
                \"(yes/no)?\" {
                    send \"yes\r\"
                    expect \"*?assword:*\"
                    exp_continue
                }
                \"*?assword:*\" {
                    send \"${pwd}\r\"
                }
            }
            expect eof
        "
    done
}

function run
{
    parse_args $@
    batch_scp
}

run $@
