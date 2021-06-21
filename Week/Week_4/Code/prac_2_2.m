% practice 2.2

clear; clc; close all;

year=[1960 1966 1970 1975 1980];            % 년도
num=[24989 29193 31466 34707 37436];        % 인구 수

x=1972;     % 구하고 싶은 년도

l0=(x-year(2))*(x-year(3))*(x-year(4))*(x-year(5))...
/((year(1)-year(2))*(year(1)-year(3))*(year(1)-year(4))*(year(1)-year(5)));     % l0 구하기

l1=(x-year(1))*(x-year(3))*(x-year(4))*(x-year(5))...
    /((year(2)-year(1))*(year(2)-year(3))*(year(2)-year(4))*(year(2)-year(5)));     % l1 구하기

l2=(x-year(1))*(x-year(2))*(x-year(4))*(x-year(5))...
    /((year(3)-year(1))*(year(3)-year(2))*(year(3)-year(4))*(year(3)-year(5)));     % l2 구하기

l3=(x-year(1))*(x-year(2))*(x-year(3))*(x-year(5))...
    /((year(4)-year(1))*(year(4)-year(2))*(year(4)-year(3))*(year(4)-year(5)));     % l3 구하기

l4=(x-year(1))*(x-year(2))*(x-year(3))*(x-year(4))...
    /((year(5)-year(1))*(year(5)-year(2))*(year(5)-year(3))*(year(5)-year(4)));     % l4 구하기

p=l0*num(1)+l1*num(2)+l2*num(3)+l3*num(4)+l4*num(5);            % 1972년도 인구 수


plot(year,num,'o')
hold on
plot(1972,p,'*')






