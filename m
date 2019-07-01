Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 403E35B938
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 12:45:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B69FE168C;
	Mon,  1 Jul 2019 12:45:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B69FE168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561977953;
	bh=nSkyjVBvgSWUmtucyH26gHkniYnRXprGt0q7wVNaK10=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ekQQb0c4UVgbM75QMo859tyVJ0X6BigWYMI3c5mDfiFVa+qAAbS3duBPH0ZnFbg4F
	 LWI4/PmS/W5mxku0kK/puab9VR7uqQyrbqFhO3kU/OuJUevur8zzbJHj/0vy7qHCJo
	 ym4Y8oqej1Hx9c53MZkhh0x6gRHizw1uWTJN8gUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04853F89709;
	Mon,  1 Jul 2019 12:44:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 343DDF896EC; Mon,  1 Jul 2019 12:44:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from de-out1.bosch-org.com (de-out1.bosch-org.com [139.15.230.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89363F8076A;
 Mon,  1 Jul 2019 12:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89363F8076A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=in.bosch.com header.i=@in.bosch.com
 header.b="Ff9OiBqi"
Received: from si0vm1948.rbesz01.com (unknown [139.15.230.188])
 by si0vms0217.rbdmz01.com (Postfix) with ESMTPS id 45ckWN0qQzz4f3lwd;
 Mon,  1 Jul 2019 12:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key1-intmail; t=1561977840;
 bh=fqsXsPcRQEBMK6PpipQFP7ySd9VCHSCHkCqxb8DleAo=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=Ff9OiBqiCkgInw4f0i0e6kl5IVlyIyztteqx8IK6VhP7/q/WTZGkbK9cRgxM72agI
 Q7kqVFsifyS63UI7NNXM2Ebd88RBXYAh1LrTpJ15j1vHHY5BquWPjoGV7GUx1pLrAf
 8Ru312rzw0HD3ijXNt4TwN0NwQlGz7Tf+aEQIvgc=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 45ckWN0Rwsz3gqj;
 Mon,  1 Jul 2019 12:44:00 +0200 (CEST)
X-AuditID: 0a3aad10-03fff70000007f88-9b-5d19e3ef2732
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id 5F.0E.32648.FE3E91D5;
 Mon,  1 Jul 2019 12:43:59 +0200 (CEST)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
 by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 45ckWM4yXpznqv;
 Mon,  1 Jul 2019 12:43:59 +0200 (CEST)
Received: from localhost.localdomain (10.47.103.61) by SI-HUB2000.de.bosch.com
 (10.4.103.108) with Microsoft SMTP Server id 15.1.1713.5;
 Mon, 1 Jul 2019 12:43:58 +0200
From: <vanitha.channaiah@in.bosch.com>
To: <patch@alsa-project.org>
Date: Mon, 1 Jul 2019 15:58:11 +0530
Message-ID: <1561976891-17886-1-git-send-email-vanitha.channaiah@in.bosch.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.47.103.61]
X-Brightmail-Tracker: H4sIAAAAAAAAA22SbUxTZxTHee4t8ND14uWWwmlpXbk6TUymgDI6R4wvMcEJauKnGZvtIpe2
 QlvSW1DwC2NbqO8YDbZVEd+riFPjyzAmYmUTDZm1mbQsRqKiE3zDOAXjKrt3BdsP+/a/5/x/
 5zz3/zyYZE4na7DF5uQdNq6STZLL5HPbdZ+/fKg25rS35Rn+uO0nDO3H6hMNB5s9xHyy6PTr
 hqQib2Nb8gpilbywjK+01PCOWfO+k5ubuiOoqnPa+voLo7J69Fi3CaVgoOfAmbFQoqQZ2k3A
 n25Ry0V9GcHl5u+J6EcbgtC+3iTJlURPg67e4eRNCON0Wgvbg5QkSboQ9m2vkBxKuhwGxzyk
 pGX0VNi244BM0hS9DHr2+4jo3snQ9/tGMlpPgxuegf88JP0ZbO56RET1p/DD+T1k1K+HXb3u
 xCY0yRuHeOMQbxzSisgTSFXO59RYC77MNcx0lPJCXU7uzDV261kUzZD+BXXcLPcjGiNWQQkB
 tZFJ5GqEWqsf5WOCVVGK9xlGJrXUXlZr5gTzt47qSl5gNZQ28PVqRvmxLFSXWi2CYLHb/Agw
 yaZTV3ziKKqMq63jHfYo5kdZWMZmUia8fDVDmzgnX8HzVbxjovsVxixQaeKdMmkO3sSvL7dU
 OifarI5CCQkJTEZ8J34tgVP8aDZWiLunSyMooYqzChbTOK6O4sxENYbeRItwx68tB0lGZrPb
 eE0mVSLxtOQ0V9s+nkCjpRIWZhoZVVwjNmUIhZGYoZJaJMEK8anGdgOVJcWVNl6MQXmHRYZ+
 kQpvGqzQ8+oFgruBuxhamq+lQM+ds5+A68d3Cgi3/kVBS+BAKvT3vaUh7OtjwD34jAHf8TYl
 hD9cT4cb/mfp4I60qMB9p10lskEVvH7yjwrC+y9mwvvrLwHu/bZZDWNDOzVwKrg1Czzhq1r4
 cKtLC8MN3TrwdR/SQ/+7oB5+fvVUD3+fd2XDyXMXsuHJaH/2kJgrIeZqrsuQcnVyzv/Jdbwa
 +zlNPZpUnMfaGguMhUfJLbn2/MalWq/blKcYvjY88s3zdXN1GaGLTYNzOlPWjSzQv+0sCY4V
 b9iz0l+7eFVodEpx6Fbk6dClHYopBXhA3fFo79qj3a05svn5kUu7WznylKvqiE2Hzyg7PC5Y
 E5r3U8kSw+RZA8+/cAUskeqi+8JIxQMNKxPMXO4M0iFw/wLRKwb8QwQAAA==
Cc: twischer@de.adit-jv.com, alsa-devel@alsa-project.org
Subject: [alsa-devel] GIT: Regarding the issue we are facing in the commit
	37728639ae05de702825d96bd1d42e24ae772248
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5298395794099221481=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============5298395794099221481==
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit


This mail is regarding the fix at below:
commit 37728639ae05de702825d96bd1d42e24ae772248
Author: Jaroslav Kysela <perex@perex.cz>
Date:   Sat Feb 7 15:01:31 2004 +00
The commit has following changes :
 
******************************* code *****************************************
static int snd_pcm_rate_hw_refine_cchange(snd_pcm_t *pcm, snd_pcm_hw_params_t *params,
					  snd_pcm_hw_params_t *sparams)
{

+       buffer_size = snd_pcm_hw_param_get_interval(params, SND_PCM_HW_PARAM_BUFFER_SIZE);
+       /*
+        * this condition probably needs more work:
+        *   in case when the buffer_size is known and we are looking
+        *   for best period_size, we should prefer situation when
+        *   (buffer_size / period_size) * period_size == buffer_size
+        */
+       if (snd_interval_single(buffer_size) && buffer_size->integer) {
+               snd_interval_t *period_size;
+               period_size = (snd_interval_t *)snd_pcm_hw_param_get_interval(params, SND_PCM_HW_PARAM_PERIOD_SIZE);
+               if (!snd_interval_checkempty(period_size) &&
+                   period_size->openmin && period_size->openmax &&
+                   period_size->min + 1 == period_size->max) {
+                       if ((buffer_size->min / period_size->min) * period_size->min == buffer_size->min) {
+                               snd_interval_set_value(period_size, period_size->min);
+                       } else if ((buffer_size->max / period_size->max) * period_size->max == buffer_size->max) {
+                               snd_interval_set_value(period_size, period_size->max);
+                       }
+               }
+       }
}
******************************* code ****************************************
 
Update rate depending on period_size and period_time.
Issue found in Hardware : 
a. RCAR salvator-xs which supports 2 channel.
b. IMX which supports 8 channel.
 
1. Usecase which is PASSED without the mentioned commit and FAILED with the commit.

For the usecase with below command : rate = 11025 channel = 6
 
$aplay -Dentertainment_main -r11025 -c6 -fS16_LE /dev/urandom


a. With the commit:
 
In the calculation of RATE at Rule 7:
RATE=11025
dependent parameters are: 
PERIOD_SIZE=88 PERIOD_TIME=8000
 
parameters		min		max		open_min		open_max		interval

PERIOD_SIZE		88		88		0			0			0
PERIO_TIME		8000		8000		0			0			0
RATE			11025		11000		0			0			1


RATE values are calculated in snd_interval_refine()
Return value:  INVALID as rate_min > rate_max
 
This is because, dependent parameter “period_size” is rounded to 88 in “rate plugin” in snd_pcm_rate_hw_refine_cchange()

Since, the below condition gets satisfied(buffer_size = 352 aligned to period_size = 88), period_size gets rounded to 88.
if ((buffer_size->min / period_size->min) * period_size->min == buffer_size->min) {
 
This commit changes causing the issue to get rate_min > rate_max.

The flow of code execution is as follows:
-   snd_pcm_hw_refine_slave()  
-	Enters snd_pcm_rate_hw_refine_cchange(), rounding of period_size to 88.
-   snd_pcm_rate_hw_refine_cchange() exit.
-   snd_pcm_hw_refine_soft() is called, here exists params->rmask to evaluate for SAMPLE_BITS, FRAME_BITS, PERIOD_BYTES, BUFFER_BYTES
-   execution of RULES calculation.
At RULE 7 rate calculation INVALID error is observed.

b. Without the commit:
In the case if period_size doesn’t get rounded off to 88, the usecase would get PASSED.
Rate calculation goes fine with period_size open interval (88, 89)
 
parameters			min			max			open_min		open_max			interval

PERIOD_SIZE			88			89			0			0				0
PERIOD_TIME			8000			8000			0			0				0
RATE				11025			11025			0			0				1

Here, there is no issue of rate_min > rate_max.
****************************************************************************************************************************************************************
Now, I just have one scenario where with/without commit, rate calculation goes fine.
2. Usecase which is PASSED with and without above commit.
 
For the usecase with below command : rate =11025 channel=2 
$aplay -Dentertainment_main -r11025 -c2 -fS16_LE /dev/urandom 
 
a. Including the above commit code:
Below is the calculation that goes:

The flow of code execution is as follows:
-   snd_pcm_hw_refine_slave()  
-	Enters snd_pcm_rate_hw_refine_cchange() , rounding of period_size to 88.
-   snd_pcm_rate_hw_refine_cchange() exit.
-   snd_pcm_hw_refine_soft() is called, here params->rmask is 0.
-   RULES calculation doesnt occur.

b. Without the commit:
In the case if period_size doesn’t get rounded off to 88.
Rate calculation goes fine with period_size open interval (88, 89)

Is there any dependency for the commit ? If yes, can you please suggest the corner case 
which fails without the commit ?
Can we revert the changes ?

--===============5298395794099221481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5298395794099221481==--
