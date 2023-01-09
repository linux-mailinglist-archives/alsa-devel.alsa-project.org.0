Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C5E662488
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 12:47:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CAB28B38;
	Mon,  9 Jan 2023 12:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CAB28B38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673264824;
	bh=TWXrDp6wc6c+1LGrMS6uW9fPmX8fcsp1olfwDkyNu+M=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LE4hw4L9B8+E0w+uzFxCYWCeyzbZ9SxvVcKs4SnD34/MCyME26rM5sXYRb75bJT0L
	 njwM9cn64dA0+5a4WlHRwrom9pSv+uTtqyTsgvNO0+sOJVj/tb9zy27rQZG6nOPWtU
	 zKYW1rJudDZnbYRjjglBAbvOJtS9ZNsqz5Epmn2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7554F8026A;
	Mon,  9 Jan 2023 12:46:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E77DF803DC; Mon,  9 Jan 2023 12:46:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00CE4F8030F
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 12:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00CE4F8030F
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NrBwM51jlz6FK2T;
 Mon,  9 Jan 2023 19:45:55 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
 by mse-fl1.zte.com.cn with SMTP id 309Bjmri092787;
 Mon, 9 Jan 2023 19:45:48 +0800 (+08)
 (envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp01[null]) by mapi (Zmail) with MAPI id mid14;
 Mon, 9 Jan 2023 19:45:51 +0800 (CST)
Date: Mon, 9 Jan 2023 19:45:51 +0800 (CST)
X-Zmail-TransId: 2b0363bbfe6fffffffff89cdc856
X-Mailer: Zmail v1.0
Message-ID: <202301091945513559977@zte.com.cn>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <perex@perex.cz>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIEFMU0E6IGNvbnRyb2wtbGVkOiB1c2Ugc3Ryc2NweSgpIHRvIGluc3RlYWQgb2Ygc3RybmNweSgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 309Bjmri092787
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.250.138.novalocal with ID
 63BBFE73.000 by FangMail milter!
X-FangMail-Envelope: 1673264755/4NrBwM51jlz6FK2T/63BBFE73.000/10.5.228.132/[10.5.228.132]/mse-fl1.zte.com.cn/<yang.yang29@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 63BBFE73.000/4NrBwM51jlz6FK2T
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: yang.yang29@zte.com.cn, xu.panda@zte.com.cn, alsa-devel@alsa-project.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Xu Panda <xu.panda@zte.com.cn>

The implementation of strscpy() is more robust and safer.
That's now the recommended way to copy NUL-terminated strings.

Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Yang Yang <yang.yang29@zte.com.cn>
---
 sound/core/control_led.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index f975cc85772b..c88653c205eb 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -534,8 +534,7 @@ static ssize_t set_led_id(struct snd_ctl_led_card *led_card, const char *buf, si
 	struct snd_ctl_elem_id id;
 	int err;

-	strncpy(buf2, buf, len);
-	buf2[len] = '\0';
+	strncpy(buf2, buf, len + 1);
 	memset(&id, 0, sizeof(id));
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	s = buf2;
-- 
2.15.2
