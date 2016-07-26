//
//  NSMutableArray+Sort.h
//  XCSort
//
//  Created by 小蔡 on 16/7/26.
//  Copyright © 2016年 xiaocai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Sort)
/**
 *  冒泡排序
 *  @param isAsc 是否为升序 YES 升序
 */
- (void)sortedArrayWithBubleASC:(BOOL)isAsc;

/** 快速排序 */
- (void)sortedArrayWithQuickLow:(NSInteger)low high:(NSInteger)high ASC:(BOOL)isAsc;

/** 直接插入排序 */
- (void)sortedWithInsert:(BOOL)isAsc;

/** 希尔排序 */
- (void)sortedWithShellStep:(int)step asc:(BOOL)isAsc;

/** 简单选择排序 */
- (void)sortedWithSelect:(BOOL)isAsc;

/** 堆排序 */
- (void)sortedWithHeap:(BOOL)isAsc;
@end
