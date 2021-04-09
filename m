Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB39359EEC
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 14:36:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 477CD1661;
	Fri,  9 Apr 2021 14:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 477CD1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617971802;
	bh=+7wHsyKJX/DviVgM9uDFpcy+225KqNc5E9BoVwU+5d8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vfB5QgAzMdS4kzDuFfCoIX8FZHip5tE8WBsuAl8E3FXbz9wLi/Qpe5DIO8G9A49qm
	 9FbQoLHzodQH2gx/9bNauHtNysk6jcox7mKwUURnIQA+QjnP71lMBj44H1Ll4gKyEq
	 tZrU8DB2qxmwYhlCgDNnBxJM/qPYzWobaK+AhdFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4247F80113;
	Fri,  9 Apr 2021 14:35:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81771F8016A; Fri,  9 Apr 2021 14:35:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E21DF800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 14:35:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E21DF800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="oy6wZE97"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139CTwSN062804;
 Fri, 9 Apr 2021 12:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=N3hnaL+idNyjU9u947ccGos8YKp6lL4SCoXzC4GqEyw=;
 b=oy6wZE97SDJFCyIBKwig2YDmqMHhELq37puHiSgo99xuFWWqJE18MeM7A3Zj8c3rvcKq
 +gmQA0q6JpzSqQ1yclwHla7XjzfRzesh+g9tarzmux+sZUVrvgPmAbGbc7ECPvB0OQNl
 /NlQtNE+52D1sUhEQiuecrB5OLSOddbaotSDfjFjv8J9cW4ybWllxc4XBR/M+WW93j1N
 c3n0u/8AWnp4dYzid4ZCC3xg0mZMrbjAxh2mOzpMvgsP73p8c/T9inAR6e6NkESlD9HD
 scBh4HatCuOoLuL49bHJgL0cd+wi9MqphDAORzTcV7KpnJy+t15HSTbPutiJ2I56ISMA TA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 37rvas98y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 12:34:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 139CUEeD185656;
 Fri, 9 Apr 2021 12:34:55 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 37rvbhjj0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Apr 2021 12:34:55 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 139CYm3I006653;
 Fri, 9 Apr 2021 12:34:51 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 09 Apr 2021 12:34:48 +0000
Date: Fri, 9 Apr 2021 15:34:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/2 v2] ALSA: control - double free in snd_ctl_led_init()
Message-ID: <YHBJ4frGxErWB182@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec7285f6-a257-d7a4-5cae-b36c95ef9efd@perex.cz>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090093
X-Proofpoint-GUID: UCNysrsh9FCldW0ZDyrH-jdjxuxg0A3U
X-Proofpoint-ORIG-GUID: UCNysrsh9FCldW0ZDyrH-jdjxuxg0A3U
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9949
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 clxscore=1015
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104090093
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

"group - 1" was intended here instead of "group".  The current error
handling will double free the first item in the array and leak the last
item.

Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: The first patch wasn't right.  It fixed the leak but left the double
free.

 sound/core/control_led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index d756a52e58db..93b201063c7d 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -734,7 +734,7 @@ static int __init snd_ctl_led_init(void)
 		if (device_add(&led->dev)) {
 			put_device(&led->dev);
 			for (; group > 0; group--) {
-				led = &snd_ctl_leds[group];
+				led = &snd_ctl_leds[group - 1];
 				device_del(&led->dev);
 			}
 			device_del(&snd_ctl_led_dev);
-- 
2.30.2

