#!/bin/bash

 # 获取所有冲突文件列表
 conflicted_files=$(git diff --name-only --diff-filter=U)

 # 如果有冲突文件，则解决它们
 if [ -n "$conflicted_files" ]; then
     echo "正在解决冲突..."
     for file in $conflicted_files; do
         git checkout --theirs -- "$file"
         echo "已解决冲突: $file"
     done
     echo "所有冲突已解决。"
 else
     echo "没有发现冲突文件。"
 fi
