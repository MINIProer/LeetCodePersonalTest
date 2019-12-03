**最大子序和**

给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

**示例：**
> 输入：[-2,1,-3,4,-1,2,1,-5,4]  
> 输出：6  
> 解释：连续子数组 [4,-1,2,1] 的和最大，为 6。  

**进阶：**  

如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。

​       
```objc
​  
​  ​  ​- (int)LeetCode3Service_maxSubArray:(NSArray *)numbersArray {
​  ​  ​
​  ​  ​     if ([NSArray isEmptyArray:numbersArray]) return 0;
​  ​  ​
​  ​  ​     int maxValue = [numbersArray[0] intValue];
​  ​  ​
​  ​  ​     int sum = 0;
​  ​  ​
​  ​  ​     for (int i = 0; i < numbersArray.count; i++) {
​  ​  ​
​  ​  ​         int number = [numbersArray[i] intValue];
​  ​  ​
​  ​  ​         if (sum > 0) {
​  ​  ​
​  ​  ​             sum += number;
​  ​  ​
​  ​  ​         } else {
​  ​  ​
​  ​  ​             sum = number;
​  ​  ​         }
​  ​  ​
​  ​  ​         maxValue = MAX(maxValue, sum);
​  ​  ​     }
​  ​  ​
​  ​  ​     return maxValue;
​  ​  ​} 
​  
```   

​[Author-JR](https://github.com/MINIProer)
