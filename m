Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF64010397F
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 13:05:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A5D1171B;
	Wed, 20 Nov 2019 13:04:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A5D1171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574251546;
	bh=UpwEboLxEwQ7+kxVwiMfoEqj3vEJJ81t196S/O/OWLE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YINnI0xykyGEYjI0OVAWvCmhGcJZQxaHwpoSFpivh9AU3O6QGwOwSiWoRSe2cj2Ai
	 UBPPdAxKLq13YPF/MteuMwntULuklQ2fQTzaU5WgE7/XVi+IVZmdVc0k7hSOh1kxh1
	 3tjkVCuDfnpR26pOJ5UfFtLJ4VYt2bNEjFVLjvlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1621CF8021D;
	Wed, 20 Nov 2019 13:00:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BECBF80212; Wed, 20 Nov 2019 13:00:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E747F801F4
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 13:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E747F801F4
IronPort-SDR: 9kCgK+uTckNFiX1G4h50skMBQgE94zL/1Gmlnnblz1sDcjMWim7eg4grSdHibAU9+3F7N7PwJn
 VB5ZaGyNNqLgWad+DUf6FystE1Azr57udoAo5TqVdFbF5jbNIV6hbOukz0Oxt2NSosFG0pZLIK
 YLVexZlMYDClFJYKWi6eAOeudzVqE9kT/6xT0cxPqEz3+HaJhBhb+PVMWMNa+nmoQEUuzDxuhk
 zNji0TaB+yTKzIwtRZVyZcd4eoezJUMcVfWMysDJUAmJE3TF4mPKYzTZ35GZAvXf56y6BD+VHp
 b3E=
X-IronPort-AV: E=Sophos;i="5.69,221,1571731200"; d="scan'208";a="43282952"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa2.mentor.iphmx.com with ESMTP; 20 Nov 2019 04:00:08 -0800
IronPort-SDR: 9BO8PS76rbrX3Nz2edhwu25bV/lNGy5OVzZ82kkpPmuBSUmne1ciXaMMTik1y/dT7hhYCDLAcE
 O3McfE/mi3Zo3TzPIJRNJGS6K4OD5xfw1JmYoMHkEhORHgKo2PUArPGtbNioHRJ0r93y0W+/Jj
 5AjQ49duS247wxUG1VI5D4G6mjHHvzRaMM70sVk2wYGf/l9KoPARleWoX5g5ykMVmb0+bANGd5
 Cmz1tkEw0uSR+sMbA+KPecpkmyt12hlPJ4xrsvqfizfBoq71OJ9ErnFBfdok0koyaiA0TC/6Rf
 Ync=
From: Andrew Gabbasov <andrew_gabbasov@mentor.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Timo Wischer
 <twischer@de.adit-jv.com>, Andrew Gabbasov <andrew_gabbasov@mentor.com>
Date: Wed, 20 Nov 2019 05:58:56 -0600
Message-ID: <20191120115856.4125-8-andrew_gabbasov@mentor.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120115856.4125-7-andrew_gabbasov@mentor.com>
References: <20191120115856.4125-1-andrew_gabbasov@mentor.com>
 <20191120115856.4125-2-andrew_gabbasov@mentor.com>
 <20191120115856.4125-3-andrew_gabbasov@mentor.com>
 <20191120115856.4125-4-andrew_gabbasov@mentor.com>
 <20191120115856.4125-5-andrew_gabbasov@mentor.com>
 <20191120115856.4125-6-andrew_gabbasov@mentor.com>
 <20191120115856.4125-7-andrew_gabbasov@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Subject: [alsa-devel] [PATCH v4 7/7] ALSA: aloop: Support runtime change of
	snd_timer via info interface
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Show and change sound card timer source with read-write info
file in proc filesystem. Initial string can still be set as
module parameter.

The timer source string value can be changed at any time,
but it is latched by PCM substream open callback (the first one
for a particular cable). At this point it is actually used, that
is the string is parsed, and the timer is looked up and opened.

The timer source is set for a loopback card (the same as initial
setting by module parameter), but every cable uses the value,
current at the moment of open.

Setting the value to empty string switches the timer to jiffies.

Signed-off-by: Andrew Gabbasov <andrew_gabbasov@mentor.com>
---
 sound/drivers/aloop.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 67ebbd510e1b..626a8b642b63 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -1666,7 +1666,7 @@ static void print_cable_info(struct snd_info_entry *entry,
 	mutex_unlock(&loopback->cable_lock);
 }
 
-static int loopback_proc_new(struct loopback *loopback, int cidx)
+static int loopback_cable_proc_new(struct loopback *loopback, int cidx)
 {
 	char name[32];
 
@@ -1687,6 +1687,36 @@ static void loopback_set_timer_source(struct loopback *loopback,
 						      value, GFP_KERNEL);
 }
 
+static void print_timer_source_info(struct snd_info_entry *entry,
+				    struct snd_info_buffer *buffer)
+{
+	struct loopback *loopback = entry->private_data;
+
+	mutex_lock(&loopback->cable_lock);
+	snd_iprintf(buffer, "%s\n",
+		    loopback->timer_source ? loopback->timer_source : "");
+	mutex_unlock(&loopback->cable_lock);
+}
+
+static void change_timer_source_info(struct snd_info_entry *entry,
+				     struct snd_info_buffer *buffer)
+{
+	struct loopback *loopback = entry->private_data;
+	char line[64];
+
+	mutex_lock(&loopback->cable_lock);
+	if (!snd_info_get_line(buffer, line, sizeof(line)))
+		loopback_set_timer_source(loopback, strim(line));
+	mutex_unlock(&loopback->cable_lock);
+}
+
+static int loopback_timer_source_proc_new(struct loopback *loopback)
+{
+	return snd_card_rw_proc_new(loopback->card, "timer_source", loopback,
+				    print_timer_source_info,
+				    change_timer_source_info);
+}
+
 static int loopback_probe(struct platform_device *devptr)
 {
 	struct snd_card *card;
@@ -1719,8 +1749,9 @@ static int loopback_probe(struct platform_device *devptr)
 	err = loopback_mixer_new(loopback, pcm_notify[dev] ? 1 : 0);
 	if (err < 0)
 		goto __nodev;
-	loopback_proc_new(loopback, 0);
-	loopback_proc_new(loopback, 1);
+	loopback_cable_proc_new(loopback, 0);
+	loopback_cable_proc_new(loopback, 1);
+	loopback_timer_source_proc_new(loopback);
 	strcpy(card->driver, "Loopback");
 	strcpy(card->shortname, "Loopback");
 	sprintf(card->longname, "Loopback %i", dev + 1);
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
