<?php
//递归 --   组合数组
Class Xunhuan {
	//分类排序
 static Public function unlimitedForLevel ($cate,$html ='&nbsp;&nbsp;--',$pid=0,$level=0) {

			$arr =array();
		
			foreach ($cate as $v) {
				
				if($v['pid']==$pid){
					$v['level'] = $level + 1;
					$v['html'] =str_repeat($html,$level);
					$arr[] = $v;
					$arr = array_merge($arr,self::unlimitedForLevel($cate,$html,$v['id'],$level+1));
				}
				
			}
			return $arr;
	}
	
//传递儿子获取所有父级分类 分级
 static public function getParents ($cate,$id) {
 	$arr = array();
 	
 	foreach ($cate as $v) {
 		
 			if($v['id'] == $id) {
 				$arr[] = $v;
 				
 				$arr =array_merge(self::getParents($cate,$v['pid']),$arr);
 				
 			}
 		return $arr;
 	}
 			
 	
 }
 
 //组合多维数组 
 static public function unlimitedForLayer ($cate ,$name='child',$pid=0) {
 	
 	$arr =array();
 	foreach($cate as $v) {
 		
 		if($v['pid']== $pid) {
 			
 			$v[$name] = self::unlimitedForLayer($cate,$name,$v['id']);
 			
 			$arr[] =$v;
 		}
 	}
 	
 	return $arr;
 }
 
 //传递一个父级分类id 返回所有子分类id
 static public function getChildsId ($cate , $id) {
 	
 		$arr =array();
 	foreach($cate as $v) {
 		
 		if($v['pid']== $id) {
 			
 			$arr[] = $v['id'];
 			
 			$arr = array_merge($arr,self::getChildsId($cate,$v['id']));
 		}
 	}
 	
 	return $arr;
 }
}
?>