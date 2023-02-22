// https://www.programiz.com/javascript/online-compiler/

function expand(ranges_string) {
  grouped_ranges = ranges_string.split(', ');
  expanded = []
  last = 0
  for (let i = 0; i < grouped_ranges.length; i += 1) {
      subgroup = grouped_ranges[i].split(/\b[-:..]\b/);
      console.log(subgroup);
      console.log('last = ', last)
      start = Number(subgroup[0])
      if (subgroup.length == 1) {
          expanded.push(String(start));
          last = start + 1
          console.log('single subgroup')
          continue
      }
      is_in_range = true
      subgroup_searching = 1
      if (last != 0) {
          start = last;
          is_in_range = false;
          subgroup_searching = 0;
      }
      // next_group = false
      while (start < 100000) {
          // console.log(expanded)
          if (String(start).endsWith(subgroup[subgroup_searching])) {
              console.log('match at : ', start);
              is_in_range = true;
              subgroup_searching += 1;
          }
          if (is_in_range) {
              // console.log(start);
              expanded.push(String(start));
          }
          if (subgroup_searching > subgroup.length - 1) {
              break;
          }
          start += 1;
      }
      last = start + 1;
  }
  return expanded.join(', ');
}
// console.log(expand("1-3, 1-2"));
console.log(expand("405, 4-04"));
