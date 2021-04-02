Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 446A4352A51
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Apr 2021 13:44:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7C4416B4;
	Fri,  2 Apr 2021 13:43:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7C4416B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617363841;
	bh=3bsgKcvW987Hx/vJ+hlwBPyLqwXdRxkj3ysSMkVXCEE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iyAj+4eKelQGv2zmRH9mkNTlx/Ykd0uRbpXly6wfLeBj0tnNKNXhf5VgfFcRWkaQ4
	 OjcGbwYyNGLkUCPhF82NzAL1wKtJLOzjJmeVVjv0PGKP6bcXoBnunVORk6Iz+owpt0
	 ari6R61I0m0D0BmWIIQJqOKuVyRdqYUjqKp7mU1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF12F80229;
	Fri,  2 Apr 2021 13:42:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 566D1F801DB; Fri,  2 Apr 2021 13:42:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled
 version=3.4.0
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 437AEF80166
 for <alsa-devel@alsa-project.org>; Fri,  2 Apr 2021 13:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 437AEF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com
 header.b="KPbKe9VO"
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 132BcX2M073984;
 Fri, 2 Apr 2021 11:42:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ao9U5dvQsdaWV9YstHzsV5gFgSLEsPBaL2W+rjkc2DE=;
 b=KPbKe9VO7b28z93J8Po73/yN04BzK/e7U82onSYwDo9pJQB5IPuY3B0jCeXfT+FrF7Nl
 HSJCKLJRoFqk7Wn/tPKi3q0sZY3dKCS2Vm77sMMTVxpDo1IQKcjHwZt4BrtzNRBtPgvm
 1tx2Yno5d7puuoLMWM3GIHK/WUOQB0BwSoX78pIsjMVhtiLkYhGkVGxV0gsDhhe9ZuFg
 tsrT+CmvVg6g75dJsoByUdYp55sojbP3X6Nxxd9R0DKbUvWuK4b3mJAMYj5WnsD7xMNL
 7msM8fke+s2LA8nOyCcT9JRwLjTjJh4OLoW6UlwYttXX6tYp/7+cdFzexeaiYOBERQIZ Wg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 37n2a04fq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Apr 2021 11:42:25 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 132BdejO037091;
 Fri, 2 Apr 2021 11:42:24 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 37n2atyqwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 02 Apr 2021 11:42:24 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 132BgGWQ000859;
 Fri, 2 Apr 2021 11:42:20 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 02 Apr 2021 04:42:16 -0700
Date: Fri, 2 Apr 2021 14:42:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/2] ALSA: control - fix a leak in snd_ctl_led_init()
Message-ID: <YGcDETcdqVUIl1+y@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9941
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104020086
X-Proofpoint-GUID: cs-X96M9uQD64jsfNcc7ZHGwnWV4nsPk
X-Proofpoint-ORIG-GUID: cs-X96M9uQD64jsfNcc7ZHGwnWV4nsPk
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9941
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103310000
 definitions=main-2104020086
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

This unwind loop needs to free snd_ctl_leds[0] as well.

Fixes: cb17fe0045aa ("ALSA: control - add sysfs support to the LED trigger module")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/core/control_led.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index d4fb8b873f34..202b475d0bf3 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -712,7 +712,7 @@ static struct snd_ctl_layer_ops snd_ctl_led_lops = {
 static int __init snd_ctl_led_init(void)
 {
 	struct snd_ctl_led *led;
-	unsigned int group;
+	int group;
 
 	device_initialize(&snd_ctl_led_dev);
 	snd_ctl_led_dev.class = sound_class;
@@ -730,7 +730,7 @@ static int __init snd_ctl_led_init(void)
 		dev_set_name(&led->dev, led->name);
 		if (device_add(&led->dev)) {
 			put_device(&led->dev);
-			for (; group > 0; group--) {
+			for (; group >= 0; group--) {
 				led = &snd_ctl_leds[group];
 				device_del(&led->dev);
 			}
-- 
2.30.2

