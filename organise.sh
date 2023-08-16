#!/bin/bash
mkdir organised
cd organised

file='../mock_grading/roll_list'

while read line
       do

        mkdir $line
        cd $line
        particular_submissions=$(find ../../mock_grading/submissions -name "$line*" )
        
        for entry in $particular_submissions
          do
                file_name="$(basename -- $entry)"
                ln -s "../../mock_grading/submissions/$file_name" $file_name
          done
       
        cd ..

      done < $file
cd ..