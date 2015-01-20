#!/bin/bash
# Return a count of installed doc files for a given package name.
package_name=$1
rpm -qd $package_name | xargs ls 2> /dev/null | wc -l
