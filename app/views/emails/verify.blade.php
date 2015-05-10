<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<h2>Email Verification</h2>

		<div>
			To verify email address click here: {{ URL::to('users/verify/'.$verification_code) }}.<br/>
		</div>
	</body>
</html>
