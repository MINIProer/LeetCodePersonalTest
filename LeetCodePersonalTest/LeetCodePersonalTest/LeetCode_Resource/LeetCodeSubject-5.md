**有效的括号**

给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。



有效字符串需满足：  
    1.  左括号必须用相同类型的右括号闭合。  
    2.  左括号必须以正确的顺序闭合。  
    
注意空字符串可被认为是有效字符串。

**示例 1**
> 输入："([)]"  
输出：false    

​**示例 2**
> 输入："()[]{}"  
​输出：true  
​​​​​​​​​​​​​  
```objc
​  
​  ​  ​- (BOOL)LeetCode5Service_isValidBrackets:(NSString *)brackets {
​  ​  ​
​  ​  ​     if ([NSString isEmptyString:brackets]) return NO;
​  ​  ​
​  ​  ​         NSDictionary *map = @{
​  ​                                ​@")" : @"(",
​  ​                                ​@"]" : @"[",
​  ​                                ​@"}" : @"{",
​  ​  ​                             };
​  ​  ​
​  ​  ​         NSArray *bracketsArray = [self LeetCode5Service_convertToBracketsArray:brackets];
​  ​  ​
​  ​  ​         NSMutableArray *stack = [NSMutableArray array];
​  ​  ​
​  ​  ​         for (int i = 0; i < bracketsArray.count; i++) {
​  ​  ​
​  ​  ​             if ([map.allKeys containsObject:bracketsArray[i]]) {
​  ​  ​
​  ​  ​                 NSString *stackTopElement;
​  ​  ​
​  ​  ​                 if ([NSArray isEmptyArray:stack]) {
​  ​  ​
​  ​  ​                     stackTopElement = @"*";
​  ​  ​
​  ​  ​                 } else {
​  ​  ​
​  ​  ​                     stackTopElement = stack.lastObject;
​  ​  ​
​  ​  ​                     [stack removeLastObject];
​  ​  ​                 }
​  ​  ​
​  ​  ​                 if (![stackTopElement isEqualToString:map[bracketsArray[i]]]) return NO;
​  ​  ​
​  ​  ​             } else {
​  ​  ​
​  ​  ​                 [stack addObject:bracketsArray[i]];
​  ​  ​             }
​  ​  ​         }
​  ​  ​
​  ​  ​         return [NSArray isEmptyArray:stack];
​  ​  ​     }
​  
```   

​[Author-JR](https://github.com/MINIProer)
