<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<style>
			* {
				font-family: Calibri, Arial;
			}
			body {
				margin-left: 10px;
			}
			#wrapper {
				 width: 670px;
			}
			hr{
				margin: 0;
				padding: 0;
				color: #a1a1a1;
			}
			p {
				margin: 0;
				padding: 0;
			}
			table
			{
				margin: 0;
				padding: 0;
				border-collapse:collapse;
			}
			td
			{
				padding: 5px;
				vertical-align: top;
			}
			
			/* Title */
			.title_left {
				float: left;
				width: 380px;
				text-align: right;
			}
			.title_right {
				float: right;
			}
						
			/* Borders */
			.btop {
				border-top: 1px solid black;
			}
			.bright {
				border-right: 1px solid black;
			}
			.bbottom {
				border-bottom: 1px solid black;
			}
			.bleft {
				border-left: 1px solid black;
			}
			.bright_dtd{
				border-right: 1px dotted black;
			}
			
			/* others */
			.compress {
				line-height: 0.9em;
			}
			.compress_more {
				line-height: 0.5em;
			}
			.small {
				font-size: 0.8em;
			}
			.right {
				text-align: right;
			}
			.clr {
				clear: both;
			}
			
		</style>
	</head>
	<body>
		<div id="wrapper">
			
			<p class="title_left">Invoice</p>
			<p class="title_right">Original</p>
			<div class="clr"></div>
			
			<table width="100%" class="btop bright bleft">
				<!-- <tr class="bbottom">
					<td width="285">
						<div style="float: left; max-height:113; max-width:283; overflow: hidden;"><img src="http://www.placehold.it/283x113&text=Logo-283x113"></div>
					</td>
					<td>
						<table width="100%" class="bleft">
							<tr>
								<td width="55%" class="bbottom">
									Invoice No. <br>
									<b>1415-91</b>
								</td>
								<td class="bbottom bleft">
									Date <br>
									<b>18-04-2014</b>
								</td>
							</tr>							
							<tr>
								<td class="bbottom">
									Dispatched Through <br>
									<b>Transport</b>
								</td>
								<td class="bbottom bleft">
									Destination <br>
									<b> - - </b>
								</td>
							</tr>
							<tr>
								<td>
									Terms of payment
								</td>
								<td>
									<b>7 Days</b>
								</td>
							</tr>
						</table>
					</td>
				</tr> -->
				<tr class="bbottom">
					<td><span class="compress">
						<b>Customer Details</b><br>
						{{$order->user->name}}<br>pam<br>rjkr<br>Phone: 879898<br>Tin No: abc<br>					</span></td>
					<td>
						<!-- <table width="100%" class="bleft">
							<tr class="bbottom">
								<td>
									Payment Type <br>
									<b>Debit</b>
								</td>
								<td>
									Cheque Number <br>
									<b></b>
								</td>
							</tr>
							<tr>
								<td collapse="2">
									Terms of dileviry <br>
									 - -								</td>
							</tr>
						</table> -->
					</td>
				</tr>
				<tr>
					<td colspan="2"><div style="" class="compress_more">
						<table width="100%">
							<tr class="bbottom">
								<td width="5%" class="bright_dtd"><b>No</b></td>
								<td width="55%" class="bright_dtd"><b>Item Name</b></td>
								<td width="12%" class="bright_dtd"><b>Qty.</b></td>
								<td width="13%" class="bright_dtd"><b>Rate</b></td>
								<td width="15%" class="right"><b>Value</b></td>
							</tr>
							
									<tr>
										<td class="bright_dtd">1</td>
										<td class="bright_dtd">{{$order->product->name}}</td>
										<td class="bright_dtd">1</td>
										<td class="bright_dtd">{{$order->product_amount}}</td>
										<td  class="right">{{$order->total_amount}}</td>
									</tr>
									<tr>
										<td class="bright_dtd">&nbsp;</td>
										<td class="bright_dtd">&nbsp;</td>
										<td class="bright_dtd">&nbsp;</td>	
										<td class="bright_dtd">&nbsp;</td>
										<td  class="right">&nbsp;</td>
									</tr><tr>
										<td class="bright_dtd">&nbsp;</td>
										<td class="bright_dtd">&nbsp;</td>
										<td class="bright_dtd">&nbsp;</td>	
										<td class="bright_dtd">&nbsp;</td>
										<td  class="right">&nbsp;</td>
									</tr><tr>
										<td class="bright_dtd">&nbsp;</td>
										<td class="bright_dtd">&nbsp;</td>
										<td class="bright_dtd">&nbsp;</td>	
										<td class="bright_dtd">&nbsp;</td>
										<td  class="right">&nbsp;</td>
									</tr><tr>
										<td class="bright_dtd">&nbsp;</td>
										<td class="bright_dtd">&nbsp;</td>
										<td class="bright_dtd">&nbsp;</td>	
										<td class="bright_dtd">&nbsp;</td>
										<td  class="right">&nbsp;</td>
									</tr><tr>
										<td class="bright_dtd">&nbsp;</td>
										<td class="bright_dtd">&nbsp;</td>
										<td class="bright_dtd">&nbsp;</td>	
										<td class="bright_dtd">&nbsp;</td>
										<td  class="right">&nbsp;</td>
									</tr>		
						</table>
						</div>
						<table width="100%">
							<tr class="btop bbottom">
								<td class="bright_dtd right" width="85%">Total &nbsp;&nbsp;</td>
								<td class="right"><b>{{$order->total_amount}}</b></td>
							</tr>
						</table>
					</td>
				</tr>
				<!-- <tr class="bbottom">
					<td colspan="2"><div class="small">
						<table width="100%">
							<tr>
								<td width="50%"><br><br><br><br>
									<div class="bbottom">
									Company's CST No.. 24592004257 24/4/2005 <br>
									Company's Tin No... 24092004257 30/3/2005 <br>
									Bank A/c No: 03072000008400 - HDFC Bank Morbi<br><br>
									</div>
									<br><b>Declaration</b><br>
									Prevention of Food Adulteration ACT, 1954<br>
									Warranty from VI-ACT. We hereby certify that goods mentioned in this invoice are warranted
									to be of the nature and quality which these purport to be.
								</td>
								<td class="bleft">
									<table width="100%">
										<tr>
											<td class="right">
												Discount:<br>
												Net Value: <br>
												VAT/CST: <br>
												Additional Tax: <br>
												Again C Form: <br>
												Total: <br>
												Freight Charge: <br>
											</td>
											<td class="right">
												10.00% <br>
												&nbsp; <br>
												4.00% <br>
												1.00% <br>
												0.00% <br>
												&nbsp; <br>
												&nbsp; <br>
											</td>
											<td class="right">
												7500.00 <br>
												67500.00 <br>
												2700.00 <br>
												675.00 <br>
												0.00 <br>
												70875.00 <br>
												0.00 <br>
											</td>
										</tr>
										<tr class="btop bbottom">
											<td colspan="2" class="right"><b><big><big>Final Invoice Value</big></big></b></td>
											<td class="right"><b><big><big>70875</big></big></b></td>
										</tr>
									</table>
									Date & Time of invoice: 
									<br>
									<br>
									<br>
									<br>
									<span style="float: right">Authorized Signatory</span>
								</td>
							</tr>
						</table>
					</div></td>
				</tr> -->
			</table>
		</div>
	</body>
</html>