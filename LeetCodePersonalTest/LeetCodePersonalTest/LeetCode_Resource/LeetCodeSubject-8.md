**回文数**

判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

**示例 1**
> 输入：121  
输出：true  

**示例 2**
> 输入：-121  
输出：false  
解释：从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。

**示例 3**
> 输入：10  
输出：false  
解释：从右向左读, 为 01 。因此它不是一个回文数。  
​       
```objc
​  
​  ​  ​- (BOOL)LeetCode8Service_isPalindrome:(int)originNumber {
​  ​  ​
​  ​    if (originNumber < 0 || (originNumber != 0 && originNumber % 10 == 0)) return NO;
​  ​  ​
​  ​    ​int revertdNumber = 0;
​  ​  ​
​  ​    ​​​while (originNumber > revertdNumber) {
​  ​  ​
​  ​  ​     revertdNumber = revertdNumber * 10 + originNumber % 10;
​  ​  ​
​  ​       ​​originNumber /= 10;
​  ​  ​  }
​  ​  ​
​  ​  ​  return revertdNumber == originNumber || revertdNumber / 10 == originNumber;
​  ​  ​} 
​  
```   

​[Author-JR](https://github.com/MINIProer)
