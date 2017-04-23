// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jquery.noty.packaged.min
//= require_tree .
//= require bootstrap
//= require data-confirm-modal
var countDown = new Date("Apr 23, 2017 15:37:25").getTime();
setInterval(function(){
	var now = new Date().getTime();
	var distance =  countDown - now ;
	var days = Math.floor(distance / (1000 * 60 * 60 * 24));
    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
    document.getElementById("timer").innerText=days+"days "+hours+"hours "+minutes+"mins "+seconds+"sec";

},1000);
 function onBodyLoad(){	
	document.getElementById("next_question").addEventListener("click",function(event){
	event.preventDefault();
	$.ajax({
		url:'/next_question',
		method:'POST',
		beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
		data:{question_id: document.getElementById("question_id").value},
		success:function(data){
			element=document.getElementById("question-content")
			element.innerText=data.question.question_content
			optionElements=document.getElementsByClassName("answer-option")
			optionElements[0].innerHtml="<input type='radio' name='answer_option' id='answer_option_option_a' value='option_a'>&nbsp;aasd"
			optionElements[1].innerText=data.question.option_b
			optionElements[3].innerText=data.question.option_d
			optionElements[2].innerText=data.question.option_c
			idElements=document.getElementsByName("question_id")
			idElements[0].value=data.question.id;
			idElements[1].value=data.question.id;
			idElements[2].value=data.question.id;
			onBodyLoad();
		},
		error:function(){
			console.log("can't connect to the server")
		}
	})
})
}
window.addEventListener("load",function(){
	onBodyLoad();
})