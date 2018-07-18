<?php
	
	//打印函数
 function p ($array){
 	
	dump($array,1,'<pre>',0);
 	
 }
 
 //邮件发送函数
 
 /**
  * @param $to  发送到 邮箱
  * @param $name  发件人
  * @param $subject 标题
  * @param $body  内容
  * @param $attachment 附件
  **/
function think_send_mail($to, $name, $subject = '', $body = '', $attachment = null){
$config = C('THINK_EMAIL');
vendor('PHPMailer.class#phpmailer'); //从PHPMailer目录导class.phpmailer.php类文件
vendor('SMTP');
$mail = new PHPMailer(); //PHPMailer对象
$mail->CharSet = 'UTF-8'; //设定邮件编码，默认ISO-8859-1，如果发中文此项必须设置，否则乱码
$mail->IsSMTP(); // 设定使用SMTP服务
$mail->SMTPDebug = 0; // 关闭SMTP调试功能
// 1 = errors and messages
// 2 = messages only
$mail->SMTPAuth = true; // 启用 SMTP 验证功能
$mail->SMTPSecure = 'ssl'; // 使用安全协议
$mail->Host = $config['SMTP_HOST']; // SMTP 服务器
$mail->Port = $config['SMTP_PORT']; // SMTP服务器的端口号
$mail->Username = $config['SMTP_USER']; // SMTP服务器用户名
$mail->Password = $config['SMTP_PASS']; // SMTP服务器密码
$mail->SetFrom($config['FROM_EMAIL'], $config['FROM_NAME']);
$replyEmail = $config['REPLY_EMAIL']?$config['REPLY_EMAIL']:$config['FROM_EMAIL'];
$replyName = $config['REPLY_NAME']?$config['REPLY_NAME']:$config['FROM_NAME'];
$mail->AddReplyTo($replyEmail, $replyName);
$mail->Subject = $subject;
$mail->AltBody = "为了查看该邮件，请切换到支持 HTML 的邮件客户端"; 
$mail->MsgHTML($body);
$mail->AddAddress($to, $name);
if(is_array($attachment)){ // 添加附件
foreach ($attachment as $file){
is_file($file) && $mail->AddAttachment($file);
}
}

return $mail->Send() ? true : $mail->ErrorInfo;

}
 //返回论文状态信息
 
 function getStatus($status){
 	
 	
 	if($status == 0){
 		return "论文未上传";
 	}
 	
 	if($status == 1){
 		return "论文待处理";
 	}
 	if($status == 2){
 		return "论文被录用";
 	}
 	if($status == 3){
 		return "论文被拒用";
 	}
 	if($status == 4){
 		return "论文被撤稿";
 	}
 	
 }
 
 // 获取 评审论文状态信息 
 function getFinsh($epxert_id=null,$paper_id=null){
 	
 	$finsh = M('expert_paper')->where(array('expert_id'=>$epxert_id,'paper_id'=>$paper_id))->field('finsh')->find();
 	
 	if($finsh['finsh'] == 1)
 	{
 		return "待评审";
 	}else
 	{
 		return '已评审';
 	}
 }
 
 	//给author 名字
	function getAuthorName($paper_id=''){
		$author = M('author')->where(array('paper_id'=>$paper_id))->find();
		if(!empty($author)){
			return $author['name'];
		}else{
			return '添加联系作者';
		}
	
	}
  function getJoin($status){
 	if($status == 1)
 	{
 		return "待确认";
 	}
 	if($status == 2)
 	{
 		return '通过';
 	}
 	if($status == 3)
 	{
 		return '失败';
 	}
 }
 //多维数组转一维数组
 function multiarray($array) { 
static $result_array = array(); 
foreach ($array as $key => $value) { 
if (is_array($value)) { 
	multiarray($value); 
} 
else
$result_array[$key] = $value; 
} 
return $result_array; 
}

 // 多维数组 转 字符串
 function arrayToString($arr) { 
if (is_array($arr)){ 
return implode(',', array_map('arrayToString', $arr)); 
} 
return $arr; 
} 

  	// 图片测试函数
 function replace_phiz ($content='') {
 	preg_match_all('/\[.*?\]/is',$content,$arr);
 	
 	$emoji = array ( 
	'weixiao' => 'smile', 
	'beishang' => 'sad', 
	'youyu' => 'hesitate', 
	'huaji' => 'funny', 
	);
 	
	F('phiz',$emoji,'./Data/');	
	 if($arr[0]){
 	 	
 	 $phiz= F('phiz','','./Data/');	
 	 	
 	 	foreach($arr[0] as $v) {
 	 		
 	 		foreach($phiz as $key => $value) {
 	 			if( $v == '['.$value.']') {
 	 				$content = str_replace($v,"<img src='".__ROOT__."/Public/Home/img/".$key.".gif' />",$content);
 	 			}
 	 		}
 	 	}
 	 } 
	return $content;

 }
 
  // 节点递归函数 无限极分类
 function node_merge ($node,$access= null,$pid=0) {
 	
 	$arr = array();
 	
 	foreach($node as $v){
 		
 		if(is_array($access)){
 			
 			$v['access'] = in_array($v['id'],$access) ? 1: 0;
 			
 		}
 		
 		
 		if($v['pid']== $pid){
 			
 			$v['child'] = node_merge($node,$access,$v['id']);
 			
 			$arr[] = $v;	
 		}
 		
 	}
 	
 	return $arr;
 	
 }
 


?>