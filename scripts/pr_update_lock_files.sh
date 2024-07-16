#!/bin/bash

select_tag=""
select_build=""
skip_build=""

while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --select-tag)
            select_tag="$2"
            shift 2
            ;;
        --select-build)
            select_build="$2"
            shift 2
            ;;
        --skip-build)
            skip_build="$2"
            shift 2
            ;;
        --)
            shift
            break
            ;;
        -*|--*)
            echo "Unknown option $1"
            exit 1
            ;;
        *)
            break
            ;;
    esac
done

echo "select_tag=$select_tag" >> ./files/update-lock-files.txt
echo "select_build=$select_build" >> ./files/update-lock-files.txt
echo "skip_build=$skip_build" >> ./files/update-lock-files.txt
echo "---" >> ./files/update-lock-files.txt
