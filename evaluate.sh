#!/bin/bash

touch marksheet.csv
touch distribution.txt
cd organised

file="../mock_grading/roll_list"

while read line
do
        cd $line
        mkdir student_outputs
        cpp=$(find . -name "*.cpp")
        cpp_base="$(basename -- $cpp)"
        g++ $cpp_base -o executable 2>/dev/null
        let score=0
        touch temp_file2.txt
        for entry in "../../mock_grading/inputs"/*
                do
                        touch temp_file1.txt
                        temp_out="$(basename $entry .in)"
                        timeout 5s ./executable < "$entry" > "student_outputs/$temp_out.out" 2>/dev/null  | 2>/dev/null
                         output="../../mock_grading/outputs/$temp_out.out"
                          if cmp -s "$output" "student_outputs/$temp_out.out"
                           then
            
                                       score=$((score+1))
                                   
                          fi
                     
                 done

        echo "$line,$score" >> "../../marksheet.csv"
        echo "$score" >> "../../distribution.txt"

        cd ..
        done < $file
        cd ..
        touch temporary1
        sort marksheet.csv > temporary1
        mv temporary1 marksheet.csv
        touch temporary2
        sort -r distribution.txt > temporary2
        mv temporary2 distribution.txt
