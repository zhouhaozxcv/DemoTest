//
//  Sorts.cpp
//  Demo
//
//  Created by lc on 16/8/31.
//  Copyright © 2016年 lc. All rights reserved.
//

#include "Sorts.hpp"


void Sorts::StringToInt(const char *inputStr) {
    
    
    bool plus = true;
    int strLong = 0;
    
    inputStr++;
    
    if ((*inputStr -'\0') == '+' || (*inputStr - '\0') == '-') {
        printf("error 1 = inputStr = \"%c\" 不是数字",*inputStr);
        return;
    }
    
    if (inputStr[0] == '-') {
        
        
        plus = false;
        printf("字符串是负数");
    }
    
}


//打印数组结果
void print(int a[],int i, int n){
    printf("第%d步：",i);
    for(int j= 0; j<n; j++){
        printf("%c ",a[j]);
    }
    
    printf("\n");
}


void Sorts::sortWithStraightInsertionSort(int array[], int arrayLength) {
    //{2,3,5,1,4,6,53,56,123,76};
    for (int i = 1; i < arrayLength; i++) {
        if (array[i] < array[i-1]) {//如果第i个元素大于i-1元素，那么直接插入。否则跳过，开始判断后一个元素
            
            int temp = array[i];//复制为哨兵，即存储待排序的元素
            int j = i-1;//哨兵前一个元素的下标
            
            array[i] = array[i-1];//先后移一个位置
            
            while (temp < array[j]) {   //查找在有序表中的插入位置
                array[j+1] = array[j];//把不符合要求的数据后移
                j--;
            }
            array[j] = temp;
        }
        
        print(array, i, arrayLength);
    }
    
}


