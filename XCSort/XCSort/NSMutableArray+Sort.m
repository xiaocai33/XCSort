//
//  NSMutableArray+Sort.m
//  XCSort
//
//  Created by 小蔡 on 16/7/26.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import "NSMutableArray+Sort.h"

@implementation NSMutableArray (Sort)
#pragma mark - 插入类排序
/** 直接插入排序 */
- (void)sortedWithInsert:(BOOL)isAsc{
    for (int i = 1; i<self.count; ++i) {
        id temp = self[i];
        int j = i - 1;
        for (; j >= 0 && ((temp < self[j] && isAsc) || ((temp > self[j] && !isAsc))); --j) {
            self[j+1] = self[j];
        }
        self[j+1] = temp;
    }
}

/** 希尔排序 */
- (void)sortedWithShellStep:(int)step asc:(BOOL)isAsc{
    for (int i = 0; i < self.count; ++i) {
        id temp = self[i];
        int j = i - step;
        for (; j >= 0 && ((temp < self[j] && isAsc) || ((temp > self[j] && !isAsc))); j -= step) {
            self[j+step] = self[j];
        }
        self[j+step] = temp;
    }
}

#pragma mark - 交换类排序
/** 快速排序 */
- (void)sortedArrayWithQuickLow:(NSInteger)low high:(NSInteger)high ASC:(BOOL)isAsc{
    NSInteger i = low, j = high;
    if (i < j) {
        id temp = self[i];
        while (i < j){
            while (i < j && ((self[j] > temp && isAsc) || (self[j] < temp && !isAsc))) --j;
            if(i<j) {self[i] = self[j]; ++i;}
            while (i < j && ((self[i] < temp && isAsc) || (self[i] > temp && !isAsc))) ++i;
            if(i<j) {self[j] = self[i]; --j;}
        }
        self[i] = temp;
        [self sortedArrayWithQuickLow:0 high:i-1 ASC:isAsc];
        [self sortedArrayWithQuickLow:i+1 high:high ASC:isAsc];
    }
}

/** 冒泡排序 */
- (void)sortedArrayWithBubleASC:(BOOL)isAsc{
    NSInteger len = self.count;
    for (NSInteger i=len-1; i>0; --i) {
        BOOL flag = NO;
        for (NSInteger j = 0; j < i; ++j) {
            if ((isAsc && self[j] > self[j+1]) || (!isAsc && self[j] < self[j+1])) {
                [self swapIndex1:j index2:j+1];
                flag = YES;
            }
        }
        if (!flag) {
            break;
        }
    }
}

#pragma mark - 选择类排序
/** 简单选择排序 */
- (void)sortedWithSelect:(BOOL)isAsc{
    for (int i = 0; i < self.count; ++i) {
        int k = i;
        //这个循环是从无序序列中挑出一个最小的元素
        for (int j = i+1; j<self.count; ++j) {
            if ((self[k] > self[j] && isAsc) || (self[k] < self[j] && !isAsc)) {
                k = j;
            }
        }
        [self swapIndex1:i index2:k];
    }
}

/** 堆排序 */
- (void)sortedWithHeap:(BOOL)isAsc{
    for (NSInteger i = self.count/2 - 1; i>=0; --i) {
        [self siftWithLow:i high:self.count asc:isAsc];
    }
    for (NSInteger i = self.count - 1; i>=1; --i) {
        id temp = self[0];
        self[0] = self[i];
        self[i] = temp;
        [self siftWithLow:0 high:i asc:isAsc];
    }
}

- (void)siftWithLow:(NSInteger)low high:(NSInteger)high asc:(BOOL)isAsc{
    NSInteger left = 2 * low + 1;
    NSInteger right = left + 1;
    NSInteger lastIndex = low;
    //左子节点大的情况
    if (left < high && ((self[left] > self[lastIndex] && isAsc) || (self[left] < self[lastIndex] && !isAsc))) lastIndex = left;
    //右子节点大的情况
    if (right < high && ((self[right] > self[lastIndex] && isAsc) || (self[right] < self[lastIndex] && !isAsc))) lastIndex = right;
    //节点改变
    if (lastIndex != low) {
        //较大的节点值将交换到其所在节点的父节点
        id temp = self[low];
        self[low] = self[lastIndex];
        self[lastIndex] = temp;
        //递归遍历
        [self siftWithLow:lastIndex high:high asc:isAsc];
    }
}

/** 交换2个值 */
- (void)swapIndex1:(NSInteger)index1 index2:(NSInteger)index2{
    id temp = self[index1];
    self[index1] = self[index2];
    self[index2] = temp;
}

@end
