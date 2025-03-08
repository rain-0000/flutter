var qu1=List.generate(11, (index) => 1 + index);
var qu2=List.generate(11, (index)=>12+index);
var qu3=List.generate(11, (index)=>23+index);
var qu_all=List.generate(33, (index)=>1+index);

int maxLength=6;
List<List<int>> get_he(int value){
  if(value==null || value<6){
    return [];
  }
  return findSixNumbersWithSum([], value);
}

void main() {
  print(get_he(6));

}


List<List<int>> fqsx(){
  return [];
}
List<List<int>> dtsx(){
  return [];
}
List<List<int>> kdsx(){
  return [];
}
List<List<int>> findSixNumbersWithSum(List<int> numbers, int targetSum) {
  if (numbers.isEmpty) {
    numbers = qu_all;
  }
  List<List<int>> result = [];
  List<int> currentCombination = [];

  // 先对数组排序，方便去重
  numbers.sort();

  void backtrack(int start, int remainingSum) {
    // 如果当前组合的长度为 6 且剩余和为 0，则找到符合条件的组合
    if (currentCombination.length == 6 && remainingSum == 0) {
      result.add(List.from(currentCombination)); // 添加到结果中
      return;
    }

    // 如果当前组合的长度超过 6 或者剩余和为负数，则剪枝
    if (currentCombination.length >= 6 || remainingSum < 0) {
      return;
    }

    // 遍历数组，尝试每个可能的数字（不允许重复）
    for (int i = start; i < numbers.length; i++) {
      // 如果当前数字大于剩余和，则剪枝（因为数组已排序）
      if (numbers[i] > remainingSum) {
        break;
      }

      // 跳过重复的数字
      if (i > start && numbers[i] == numbers[i - 1]) {
        continue;
      }

      currentCombination.add(numbers[i]); // 添加当前数字到组合中
      backtrack(i + 1, remainingSum - numbers[i]); // 不允许重复使用当前数字
      currentCombination.removeLast(); // 回溯，移除当前数字
    }
  }

  backtrack(0, targetSum); // 从索引 0 开始回溯
  return result;
}