	<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" >
	<head id="Head1" runat="server">
	    <title>Index</title>
	    <script src="/Scripts/dhtmlxscheduler.js" type="text/javascript"></script>
	    <link href="/Scripts/dhtmlxscheduler.css" rel="stylesheet" type="text/css" />
	    <style type="text/css">
	        html, body
	        {
	            height:100%;
	            padding:0px;
	            margin:0px;
	        }
	    </style>
	    <script type="text/javascript">
	        function init() {
	            scheduler.config.xml_date = "%m/%d/%Y %H:%i";
	            scheduler.init("scheduler_here", new Date(2010, 6, 1), "month");
	            scheduler.load("/Calendar/Data");

	            var dp = new dataProcessor("/Calendar/Save");
	            dp.init(scheduler);
	            dp.setTransactionMode("POST", false);
	        }
	    </script>
	</head>
	<body onload="init()">
		<div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
			<div class="dhx_cal_navline">
				<div class="dhx_cal_prev_button">&nbsp;</div>
				<div class="dhx_cal_next_button">&nbsp;</div>
				<div class="dhx_cal_today_button"></div>
				<div class="dhx_cal_date"></div>
				<div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
				<div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
				<div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
			</div>
			<div class="dhx_cal_header">
			</div>
			<div class="dhx_cal_data">
			</div>		
		</div>
	</body>
	</html>