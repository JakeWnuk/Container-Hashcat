#!/usr/bin/bash

# Variables
working_directory='/data/'
workload_profile='3'
optimized_kernel=1


# Iterate through the arguments
for arg in "$@"; do
    # Check for -m in either format
    if [[ $arg == "-m="* ]]; then
        m_value=${arg#*=}  # Extract value after =
    elif [[ $arg == "-m" ]]; then
        m_value=${@:$((OPTIND+1)):1}  # Extract next argument as value
    fi
done

# Check if -m was found
if [[ -n $m_value ]]; then
    hash_mode='-m '$m_value
    potfile_path='--potfile-path='$working_directory$m_value'.potfile'
    restore_path='--restore-file-path='$working_directory$m_value'.restore --session='$m_value
    workload_arg='--workload-profile='$workload_profile

    if [[ $optimized_kernel -gt 0 ]]; then
        extra_arguments='--optimized-kernel-enable'
    fi

    # Pass remaining arguments to hashcat
    /usr/local/bin/hashcat "${@:1:$((OPTIND-1))}" "${@:$((OPTIND+2))}" $hash_mode $potfile_path $restore_path $workload_arg  $extra_arguments
else
    echo "-m argument not found."
fi

