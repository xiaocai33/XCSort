//
//  main.m
//  XCSort
//
//  Created by 小蔡 on 16/7/26.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Sort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *array = [NSMutableArray arrayWithObjects:@5, @8, @1, @3, @10, @2, nil];
        NSLog(@"排序前: %@", array);
        //冒泡
        //[array sortedArrayWithBubleASC:NO];
        
        //快排
        //[array sortedArrayWithQuickLow:0 high:array.count-1 ASC:NO];
        
        //直接插入排序
        //[array sortedWithInsert:NO];
        
        //希尔排序
        //        NSArray *nums = @[@3, @1];
        //        for (int i =0 ; i<nums.count; ++i) {
        //            [array sortedWithShellStep:[nums[i] intValue] asc:NO];
        //        }
        
        //堆排序
        //[array sortedWithHeap:NO];
        
        //简单选择排序
        [array sortedWithSelect:NO];
        NSLog(@"排序后: %@", array);
    }
    return 0;
}
