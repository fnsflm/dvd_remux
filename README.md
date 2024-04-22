# DVD Remux and Split
自用, dvdiso remux成mkv, 再根据固定章节切分成视频

## 使用方式
将iso文件拖动到bat文件上

## 执行步骤
1. makemkv将iso转换为mkv格式
2. mkvextract提取视频的章节
3. 判断章节如果为20, 则mkvmerge将视频按章节6,11,16切分成四个视频, 否则结束

## 依赖
1. makemkv
2. mkvtoolnix
