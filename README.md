基本排序算法的应用
YES 表示升序 
NSMutableArray *array = [NSMutableArray arrayWithObjects:@5, @8, @1, @3, @10, @2, nil];
//冒泡
[array sortedArrayWithBubleASC:YES];
        
//快排
[array sortedArrayWithQuickLow:0 high:array.count-1 ASC:YES];
        
//堆排序
[array sortedWithHeap:YES];
        
//简单选择排序
[array sortedWithSelect:YES];

//直接插入排序
[array sortedWithInsert:NO];
        
        //希尔排序
NSArray *nums = @[@3, @1];
for (int i =0 ; i<nums.count; ++i) {
   [array sortedWithShellStep:[nums[i] intValue] asc:NO];
}
