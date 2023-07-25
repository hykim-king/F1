<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- CSS -->
<link  href="${CP}/resources/css/default.css" rel="stylesheet">
<link  href="${CP}/resources/css/bootstrap/bootstrap.min.css" rel="stylesheet"  crossorigin="anonymous">
<script src="${CP}/resources/js/bootstrap/bootstrap.bundle.min.js"  crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<title>test</title>
</head>
<body>
<div class ="container">
    <h1>회원가입</h1>
                 회원이 되어 다양한 혜택을 경험해 보세요
	       <form action="" method="post" name="membership">
	         <fieldset style="border:0 solid black;">
	           <ul>
	             <li>
	               <label>아이디</label><br/>
	               <input type="text" name="id_form" id="id_form" onkeyup="id_form_check(event)" placeholder="아이디 입력(영어, 숫자포함 6~20자)">
	               <input type="button" id="idDulpCheck" value="중복확인">
	             </li>
	             <li>
	               <label>비밀번호</label><br/>
	               <input type="password" name="pw_form" id="pw_form" placeholder="(문자, 숫자, 특수문자[!,@,#,$,%,*]) 포함 8~20자)" onchange="check_pw()">
	             </li>
	             <li>
	               <label>비밀번호 확인</label><br/>
	               <input type="password" name="pw2_form" id="pw2_form" placeholder="비밀번호 재입력" onchange="check_pw()"> <br/>
	               <label id="pw_check"></label>
	             </li>
	             <li>
	               <label>이름</label><br/>
	               <input type="text" name="name_form" id="name_form" placeholder="이름을 입력해주세요 (한글 3~20글자)" onchange="check_name()">
	             </li>
	             <li>
	               <label>성별</label>
	               <input type="radio" name="sex_form" id="sex_form" value="M" style="margin-left: 100px;"><label>남자</label>
	               <input type="radio" name="sex_form" id="sex_form" value="F" style="margin-left: 40px;"><label>여자</label>
	             </li>
	             <li>
	               <label>전화번호</label><br/>
	               <input type="tel" name="phone_num" id="phone_num" onchange="check_phone()" placeholder="휴대폰 번호 입력('-'포함 13자리 입력)">
	             </li>
	             <li>
	               <label>이메일 주소</label><br/>
	               <input type="email" name="email_front" id="email_front" onkeyup="check_email(event)" placeholder="이메일 주소">
	               <label>@</label>
	               <input type="email" name="email_back" list="email_back" autocomplete="off" placeholder="ex)naver.com">    
	               <datalist id="email_back">              
	                 <option value="dreamwiz.com"></option>
	                 <option value="empas.com"></option>
	                 <option value="freechal.com"></option>
	                 <option value="gmail.com"></option>
	                 <option value="hanmail.net"></option>
	                 <option value="hanmir.com"></option>
	                 <option value="hotmail.com"></option>
	                 <option value="kakao.com"></option>
	                 <option value="korea.com"></option>
	                 <option value="lycos.co.kr"></option>
	                 <option value="nate.com"></option>
	                 <option value="naver.com"></option>
	                 <option value="paran.com"></option>
	                 <option value="yahoo.com"></option>              
	               </datalist>
	               <input type="button" id="emailDulpCheck" value="중복확인">
	             </li>
	             <li>
	               <label>생년월일</label><br/>
	               <input id="birth_year" name="year" type="text" list="year" placeholder="년도">
	               <datalist id="year">
	                 <option value="2023"></option>
	                 <option value="2022"></option>
	                 <option value="2021"></option>
	                 <option value="2020"></option>
	                 <option value="2019"></option>
	                 <option value="2018"></option>
	                 <option value="2017"></option>
	                 <option value="2016"></option>
	                 <option value="2015"></option>
	                 <option value="2014"></option>
	                 <option value="2013"></option>
	                 <option value="2012"></option>
	                 <option value="2011"></option>
	                 <option value="2010"></option>
	                 <option value="2009"></option>
	                 <option value="2008"></option>
	                 <option value="2007"></option>
	                 <option value="2006"></option>
	                 <option value="2005"></option>
	                 <option value="2004"></option>
	                 <option value="2003"></option>
	                 <option value="2002"></option>
	                 <option value="2001"></option>
	                 <option value="2000"></option>
	                 <option value="1999"></option>
	                 <option value="1998"></option>
	                 <option value="1997"></option>
	                 <option value="1996"></option>
	                 <option value="1995"></option>
	                 <option value="1994"></option>
	                 <option value="1993"></option>
	                 <option value="1992"></option>
	                 <option value="1991"></option>
	                 <option value="1990"></option>
	                 <option value="1989"></option>
	                 <option value="1988"></option>
	                 <option value="1987"></option>
	                 <option value="1986"></option>
	                 <option value="1985"></option>
	                 <option value="1984"></option>
	                 <option value="1983"></option>
	                 <option value="1982"></option>
	                 <option value="1981"></option>
	                 <option value="1980"></option>
	                 <option value="1979"></option>
	                 <option value="1978"></option>
	                 <option value="1977"></option>
	                 <option value="1976"></option>
	                 <option value="1975"></option>
	                 <option value="1974"></option>
	                 <option value="1973"></option>
	                 <option value="1972"></option>
	                 <option value="1971"></option>
	                 <option value="1970"></option>
	                 <option value="1969"></option>
	                 <option value="1968"></option>
	                 <option value="1967"></option>
	                 <option value="1966"></option>
	                 <option value="1965"></option>
	                 <option value="1964"></option>
	                 <option value="1963"></option>
	                 <option value="1962"></option>
	                 <option value="1961"></option>
	                 <option value="1960"></option>
	                 <option value="1959"></option>
	                 <option value="1958"></option>
	                 <option value="1957"></option>
	                 <option value="1956"></option>
	                 <option value="1955"></option>
	                 <option value="1954"></option>
	                 <option value="1953"></option>
	                 <option value="1952"></option>
	                 <option value="1951"></option>
	                 <option value="1950"></option>
	                 <option value="1949"></option>
	                 <option value="1948"></option>
	                 <option value="1947"></option>
	                 <option value="1946"></option>
	                 <option value="1945"></option>
	                 <option value="1944"></option>
	                 <option value="1943"></option>
	                 <option value="1942"></option>
	                 <option value="1941"></option>
	                 <option value="1940"></option>
	                 <option value="1939"></option>
	                 <option value="1938"></option>
	                 <option value="1937"></option>
	                 <option value="1936"></option>
	                 <option value="1935"></option>
	                 <option value="1934"></option>
	                 <option value="1933"></option>
	                 <option value="1932"></option>
	                 <option value="1931"></option>
	                 <option value="1930"></option>
	                 <option value="1929"></option>
	                 <option value="1928"></option>
	                 <option value="1927"></option>
	                 <option value="1926"></option>
	                 <option value="1925"></option>
	                 <option value="1924"></option>
	                 <option value="1923"></option>
	                 <option value="1922"></option>
	                 <option value="1921"></option>
	                 <option value="1920"></option>
	                 <option value="1919"></option>
	                 <option value="1918"></option>
	                 <option value="1917"></option>
	                 <option value="1916"></option>
	                 <option value="1915"></option>
	                 <option value="1914"></option>
	                 <option value="1913"></option>
	                 <option value="1912"></option>
	                 <option value="1911"></option>
	                 <option value="1910"></option>                  
	               </datalist>
	               <input id="birth_month" name="month" type="text" list="month" placeholder="월">
	               <datalist id="month">
	                 <option value="12"></option>
	                 <option value="11"></option>
	                 <option value="10"></option>
	                 <option value="09"></option>
	                 <option value="08"></option>
	                 <option value="07"></option>
	                 <option value="06"></option>
	                 <option value="05"></option>
	                 <option value="04"></option>
	                 <option value="03"></option>
	                 <option value="02"></option>
	                 <option value="01"></option> 
	               </datalist>
	               <input id="birth_day" name="day" type="text" list="day" placeholder="일">
	               <datalist id="day">
	                 <option value="31"></option>
	                 <option value="30"></option>
	                 <option value="29"></option>
	                 <option value="28"></option>
	                 <option value="27"></option>
	                 <option value="26"></option>
	                 <option value="25"></option>
	                 <option value="24"></option>
	                 <option value="23"></option>
	                 <option value="22"></option>
	                 <option value="21"></option>
	                 <option value="20"></option>
	                 <option value="19"></option>
	                 <option value="18"></option>
	                 <option value="17"></option>
	                 <option value="16"></option>
	                 <option value="15"></option>
	                 <option value="14"></option>
	                 <option value="13"></option>
	                 <option value="12"></option>
	                 <option value="11"></option>
	                 <option value="10"></option>
	                 <option value="09"></option>
	                 <option value="08"></option>
	                 <option value="07"></option>
	                 <option value="06"></option>
	                 <option value="05"></option>
	                 <option value="04"></option>
	                 <option value="03"></option>
	                 <option value="02"></option>
	                 <option value="01"></option>
	               </datalist>
	             </li>
	             <li>
	               <label>주소</label><br/>
	               <input type="text" id="post_code" name="post_code" placeholder="우편번호를 검색하세요" readonly>
	               <input type="button" id="btn" value="우편번호">
	               <input type="text" id="address" name="address" placeholder="기본주소" readonly>
	               <input type="text" id="rest_address" name="rest_address" placeholder="나머지주소">
	             </li>
	           </ul>
	         </fieldset>
	       <div>
	        <input type="button" id="register" value="가입하기">
	        <input type="button" id="noneRegister" value="취소" onclick="firstForm()">
       </div>
	       <div>
	            <input type="button" onclick="window.location.href='${CP}/';" value="로그인페이지">
	            <input type="button" onclick="window.location.href='${CP}/login';" value="홈페이지">	           
	       </div>
     </form>
   <form method="POST" name="register_form">
         <input type="hidden" name="grade" id="grade" value="20">
         <input type="hidden" name="name" id="name">
         <input type="hidden" name="id" id="id">
         <input type="hidden" name="pw" id="pw">
         <input type="hidden" name="tel" id="tel">
         <input type="hidden" name="birth" id="birth">
         <input type="hidden" name="sex" id="sex">
         <input type="hidden" name="post_num" id="post_num">
         <input type="hidden" name="n_addr" id="n_addr">
         <input type="hidden" name="o_addr" id="o_addr">
         <input type="hidden" name="rest_addr" id="rest_addr">
         <input type="hidden" name="email" id="email">
         <input type="hidden" name="del" id="del" value="0">
         
         <input type="hidden" id="addressType"> <!-- 주소 구분 -->
     </form>
</div>    
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${CP}/resources/js/jquery-3.7.0.js"></script>
    <script>
        const btn = document.querySelector("#btn");
        btn.addEventListener("click",()=>{
          new daum.Postcode({
                oncomplete: function(data) {
                  let selectAddr = '';
                  let unSelectAddr = '';
                  let extraAddr = '';
                  
                  let reg_NewAddr = '';
                  
                  if(data.userSelectedType === 'R') {
                      selectAddr = data.roadAddress;
                      
                      reg_NewAddr = data.roadAddress;
                      unSelectAddr = data.jibunAddress;
                  } else {
                      selectAddr = data.jibunAddress;
                      
                      reg_NewAddr = data.roadAddress;
                      unSelectAddr = data.jibunAddress;
                  }
                  
                  if(data.userSelectedType === 'R') {
                    if(data.bname !== '') {
                      extraAddr += data.bname;
                    }
                    if(data. buildingName !== '') {
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    selectAddr += (extraAddr !== '' ? ' (' + extraAddr + ') ' : '');
                    reg_NewAddr += (extraAddr !== '' ? ' (' + extraAddr + ') ' : '');
                  }
                  
                  if(data.userSelectedType === 'J') {
                    if(data.bname !== '') {
                      extraAddr += data.bname;
                    }
                    if(data. buildingName !== '') {
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    reg_NewAddr += (extraAddr !== '' ? ' (' + extraAddr + ') ' : '');
                  }  
                  
                  
                  if(data.userSelectedType === 'R') {
                      
                      document.membership.address.value = selectAddr;
                      document.register_form.o_addr.value = data.jibunAddress;           
                      document.register_form.n_addr.value = data.roadAddress;
                      
                  } else {
                      
                      document.membership.address.value = selectAddr;
                      document.register_form.o_addr.value = data.jibunAddress;           
                      document.register_form.n_addr.value = data.roadAddress;
                  }

                  document.register_form.addressType.value = data.userSelectedType; //추가  
                      
                  document.membership.post_code.value = data.zonecode;
                  document.membership.rest_address.focus();
                  
                }
          
            }).open();
          
        });
    
        function check_pw() {
            var pw = document.getElementById('pw_form').value;
            var num = pw.search(/[0-9]/g);
            var eng = pw.search(/[a-z]/ig);
            var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
 
            if(pw.length<8 || pw.length>20) {
               window.alert('비밀번호는 8글자 이상, 20글자 이하만 이용 가능합니다.');
               document.getElementById('pw_form').value='';
            } else if(pw.search(/\s/) != -1) {
               window.alert('비밀번호는 공백 없이 이용 가능합니다');
               document.getElementById('pw_form').value='';
            } else if(num < 0 || eng < 0 || spe < 0) {
               window.alert('영문, 숫자, 특수문자를 최소 1글자 이상씩 사용하여 입력해주세요');
               document.getElementById('pw_form').value='';
            }           
            
            if(document.getElementById('pw_form').value !='' && document.getElementById('pw2_form').value!='') {
              
                if(document.getElementById('pw_form').value == document.getElementById('pw2_form').value) {
                    document.getElementById('pw_check').innerHTML='비밀번호가 일치합니다.'
                    document.getElementById('pw_check').style.color='blue';
                } else {
                    document.getElementById('pw_check').innerHTML='비밀번호가 일치하지 않습니다.';
                    document.getElementById('pw_check').style.color='red';
                    document.getElementById('pw_form').value='';
                    document.getElementById('pw2_form').value='';
                }
                
            }
        }
        
        function id_form_check(event) {
            const reg_id = /[^0-9a-z]/g;
            const ele = event.target; 
            
            if(reg_id.test(ele.value)) {
              ele.value = ele.value.replace(reg_id,'');
            }
            
          }

    
        function check_name() {
          
          var name_str = document.getElementById('name_form').value;
          var hangul = /^[가-힣]+$/;
  
          if(name_str.length < 3 || name_str.length > 20) {
             window.alert('이름은 한글 3글자 이상, 20글자 이하만 가능합니다');
             document.getElementById('name_form').value='';
          } else if(name_str.search(/\s/) != -1) {
             window.alert('이름은 공백 없이 입력 가능합니다');
             document.getElementById('name_form').value='';
          } else if(hangul.test(name_str) == false) {
             window.alert('이름은 한글만 입력 가능합니다');
             document.getElementById('name_form').value='';
          
        }
      
      } 
    
      function check_email(event) {
         const hangul = /[^0-9a-zA-Z]/g;
         const ele = event.target;
         
         if(hangul.test(ele.value)) {
           ele.value = ele.value.replace(hangul,'');
         }
       }
    
      function check_phone() {
        var phone_num_str = document.getElementById('phone_num').value;
        var regPhone = /^01([0])-([0-9]{4})-([0-9]{4})$/;
        
        if(regPhone.test(phone_num_str) == false) {
              window.alert('전화번호 양식에 맞춰서 입력해주세요 ex)010-0000-0000');
              document.getElementById('phone_num').value=''; 
           }
        
      }        
      
      /* 취소 버튼 클릭 시 첫 화면으로 이동 / href="메인페이지 주소 입력하기" */
      /* function goFirstForm() {
          location.href="MainForm.do";
      } */
      
      $(document).ready(function(){  //모든 화면이 다 로딩이 되면 실행하는 영역
            console.log("document ready");
      
        $("#noneRegister").on("click", function(){
            alert("회원가입을 취소했습니다");
            window.location.href="${CP}/main.do";
            
        });
      
        $("#register").on("click", function(){
            console.log("register ready");
            
            let registerName = document.getElementById('name_form').value;
            let registerId = document.getElementById('id_form').value;
            let registerPw = document.getElementById('pw2_form').value;
            let registerTel = document.getElementById('phone_num').value;
            let registerBirth = document.getElementById('birth_year').value+document.getElementById('birth_month').value+document.getElementById('birth_day').value;
            let registerSex = $('input:radio[name=sex_form]:checked').val();
            let registerPostNum = document.getElementById('post_code').value;       
            let registerRestAddr = document.getElementById('rest_address').value;
            let registerEmail = document.getElementById('email_front').value+"@"+$('[name="email_back"]').val();
            
            let addressType_let = document.getElementById("addressType").value;    //추가  
            
            
            document.register_form.name.value = registerName;
            document.register_form.id.value = registerId;
            document.register_form.pw.value = registerPw;
            document.register_form.tel.value = registerTel;
            document.register_form.birth.value = registerBirth;
            document.register_form.sex.value = registerSex;
            document.register_form.post_num.value = registerPostNum;        
            document.register_form.rest_addr.value = registerRestAddr;
            document.register_form.email.value = registerEmail;
            
        document.register_form.addressType.value = addressType_let; //추가  
            
            if("" == document.getElementById('name_form').value) {
                alert("이름을 입력하세요");
                return false;
            }
            
            if("" == document.getElementById('id_form').value) {
                alert("아이디를 입력하세요");
                return false;
            }
            
            if(registerId.length < 6 || registerId.length > 20) {
                 alert("아이디는 6~20글자로 구성되어야 합니다");
                 return false;
            }
            
            if("" == document.getElementById('pw_form').value || "" == document.getElementById('pw2_form').value) {
                alert("비밀번호를 입력하세요");
                return false;
            }
            
            if("" == document.getElementById('birth_year').value || "" == document.getElementById('birth_month').value || "" == document.getElementById('birth_day').value) {
                alert("생년월일을 입력하세요");
                return false;
            }
            
            if(null == registerSex) {
                alert("성별을 입력하세요");
                return false;
            }
            
            if("" == document.getElementById('address').value || "" == document.getElementById('rest_address').value) {
                alert("주소를 입력하세요");
                return false;
            }
            
            
            if("" == document.getElementById('email_front').value || "" == $('[name="email_back"]').val()) {
                alert("이메일을 입력하세요");
                return false;
            }
            
            if("" == document.getElementById('phone_num').value) {
                alert("휴대폰 번호를 입력하세요");
                return false;
            }
                    
            $.ajax({
                type: "POST",
              url:"${CP}/register",
                /* asyn:"true", */
                dataType:"html",
                data:{
                    grade: $("#grade").val(),
                    name: $("#name").val(),
                    id: $("#id").val(),
                    pw: $("#pw").val(),
                    tel: $("#tel").val(),
                    birth: $("#birth").val(),
                    sex: $("#sex").val(),
                    postNum: $("#post_num").val(),
                    nAddr: $("#n_addr").val(),
                    oAddr: $("#o_addr").val(),
                    restAddr: $("#addressType").val()+"_"+$("#rest_addr").val(),
                    email: $("#email").val(),
                    del: $("#del").val()
                },
                success:function(data){//통신 성공
                    //console.log("success data:"+data);
                    // JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 그 결과에서 JavaScript 값이나 객체를 생성합니다.
                    let parsedJSON = JSON.parse(data);
                    console.log("parsedJSON.msgId:"+parsedJSON.msgId);
                                     
                    
                    if("10" == parsedJSON.msgId){
                      alert(parsedJSON.msgContents);
                      window.location.href="${CP}/";
                    } 
                    
                    if("20" == parsedJSON.msgId){
                      alert(parsedJSON.msgContents);
                      return;
                    }
                    
                   
                  },
                  error:function(data){//실패시 처리
                    console.log("error:"+data);
                  }
            }); //  $.ajax End --------------------------
            
            
        });    // #register END
            
        //jquery 이벤트 감지 (#은 id를 감지하는 것이다.)
        $("#idDulpCheck").on("click",function(){
            console.log("idDulpCheck ready");
            
            var id_str = document.getElementById('id_form').value;
            console.log(id_str);
            
            if(""==$('#id_form').val() || 0==$('#id_form').val().length){
              alert("아이디를 입력하세요");  // javascript 메시지 다이얼 로그
              $('#id_form').focus();          // jquery로 포커스를 이동시킨다.
              return;
          } else if(id_str.search(/\s/) != -1) {
              alert('아이디는 공백 없이 입력 가능합니다');
              document.getElementById('id_form').value='';
              return;
          }
            
            $.ajax({
                type: "POST",
              url:"${CP}/idDulpCheck",
                /* asyn:"true", */
                dataType:"html",
                data:{
                    id: $("#id_form").val()
                },
                success:function(data){//통신 성공
                    //console.log("success data:"+data);
                    // JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 그 결과에서 JavaScript 값이나 객체를 생성합니다.
                    let parsedJSON = JSON.parse(data);
                    console.log("parsedJSON.msgId:"+parsedJSON.msgId);
                                     
                    
                    if("10" == parsedJSON.msgId){
                      alert(parsedJSON.msgContents);  // javascript 메시지 다이얼 로그
                      $("#id_form").focus();
                    } 
                    
                    if("20" == parsedJSON.msgId){//로그인 성공
                      alert(parsedJSON.msgContents);
                      return;
                    }
                    
                   
                  },
                  error:function(data){//실패시 처리
                    console.log("error:"+data);
                  }
            }); //  $.ajax End --------------------------
            
            
        });  // #idDulpCheck end
        
        $("#emailDulpCheck").on("click",function(){
            console.log("emailDulpCheck ready");
            
            var emial_str = $('#email_front').val()+"@"+$('input[name=email_back]').val()
            console.log(emial_str);
            
            if(""==$('#email_front').val() || 0==$('#email_front').val().length){
              alert("이메일 앞자리를 입력하세요");  // javascript 메시지 다이얼 로그
              $('#email_front').focus();          // jquery로 포커스를 이동시킨다.
              return;
              
          } if(""==$('input[name=email_back]').val() || 0==$('input[name=email_back]').val().length){
              alert("이메일 뒷자리를 입력하세요");  // javascript 메시지 다이얼 로그
              $('input[name=email_back]').focus();          // jquery로 포커스를 이동시킨다.
              return;
              
          } else if(emial_str.search(/\s/) != -1) {
              alert('이메일은 공백 없이 입력하도록');
              document.getElementById('email_front').value='';
              document.getElementByName('email_back')[0].value='';
              return;
          }
          
          $.ajax({
              type: "POST",
            url:"${CP}/emailDulpCheck",
              /* asyn:"true", */
              dataType:"html",
              data:{
                  email: emial_str
              },
              success:function(data){//통신 성공
                  //console.log("success data:"+data);
                  // JSON.parse() 메서드는 JSON 문자열의 구문을 분석하고, 그 결과에서 JavaScript 값이나 객체를 생성합니다.
                  let parsedJSON = JSON.parse(data);
                  console.log("parsedJSON.msgId:"+parsedJSON.msgId);
                                   
                  
                  if("10" == parsedJSON.msgId){
                    alert(parsedJSON.msgContents);  // javascript 메시지 다이얼 로그
                    $("#email_front").focus();
                  } 
                  
                  if("20" == parsedJSON.msgId){//로그인 성공
                    alert(parsedJSON.msgContents);
                    return;
                  }
                  
                 
                },
                error:function(data){//실패시 처리
                  console.log("error:"+data);
                }
          }); //  $.ajax End --------------------------
            
            
            
        });  // #idDulpCheck end
       
     }); 
     </script>
</html>