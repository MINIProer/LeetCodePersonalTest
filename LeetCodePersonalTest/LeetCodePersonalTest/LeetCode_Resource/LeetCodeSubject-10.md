**合并两个有序数组**

给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。

**说明**
- 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
- 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。

**示例：**
> 输入：  
nums1 = [1,2,3], m = 3  
nums2 = [2,5,6], n = 3    
输出：[1,2,2,3,5,6]  
​       
```objc
​  
​  ​  ​  ​- (NSArray *)LeetCode10Service_mergeOrderedArray:(NSArray *)array2 toAnotherOrderedArray:(NSArray *)array1 {
​  ​  ​  ​
​  ​  ​  ​  if ([NSArray isEmptyArray:array1] || [NSArray isEmptyArray:array2]) return @[];
​  ​  ​  ​
​  ​  ​  ​  int p1 = (int)array1.count - 1;
​  ​  ​  ​
​  ​  ​  ​  int p2 = (int)array2.count - 1;
​  ​  ​  ​
​  ​  ​  ​  NSMutableArray *mergeArray = array1.mutableCopy;
​  ​  ​  ​
​  ​  ​  ​  [mergeArray addObjectsFromArray:array2];
​  ​  ​  ​
​  ​  ​  ​  while (p1 >= 0 || p2 >= 0) {
​  ​  ​  ​
​  ​  ​  ​      if (p1 >= 0 && p2 >= 0 && [array1[p1] intValue] > [array2[p2] intValue]) {
​  ​  ​  ​
​  ​  ​  ​      mergeArray[p1 + p2 + 1] = array1[p1];
​  ​  ​  ​
​  ​  ​  ​      p1--;
​  ​  ​  ​
​  ​  ​  ​      } else {
​  ​  ​  ​
​  ​  ​  ​          if (p2 < 0) {
​  ​  ​  ​
​  ​  ​  ​              mergeArray[p1 + p2 + 1] = array1[p1];
​  ​  ​  ​
​  ​  ​  ​              p1--;
​  ​  ​  ​
​  ​  ​  ​          } else {
​  ​  ​  ​
​  ​  ​  ​              mergeArray[p1 + p2 + 1] = array2[p2];
​  ​  ​  ​
​  ​  ​  ​              p2--;
​  ​  ​  ​          }
​  ​  ​  ​      }
​  ​  ​  ​  }
​  ​  ​  ​
​  ​  ​  ​  return [mergeArray copy];
​  ​  ​  ​}
​  
```   

​[Author-JR](https://github.com/MINIProer)
