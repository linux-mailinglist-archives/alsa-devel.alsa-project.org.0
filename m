Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C03858B7504
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 13:58:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30254DEE;
	Tue, 30 Apr 2024 13:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30254DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714478285;
	bh=xbu/88pNQJMGyYFWxPSQooiXbYc5BT6Brrv9un7SvOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N4PaeNnWaEXPeMRo2Ul5bObVsZnYl2In1ukuZddQ2+sVvjp9PYy+0SYH/D9tAU5Sz
	 FOvi5VjzXenVp/KyvIsndOM9uqJNAHLXcXd6twt1KmfdvtH0sT0QabIvuUQOJH7s85
	 VdS5o0GKUtSMb+8s3NW3ZVPp7CJLEZD3ob+nH0Xg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CC06F805C9; Tue, 30 Apr 2024 13:57:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D4F2F805C8;
	Tue, 30 Apr 2024 13:57:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42E66F8025D; Tue, 30 Apr 2024 13:56:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0506AF80269
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 13:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0506AF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=DyJgcIQP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=G48sT4e7XwBEsyu30MJVKv/f1vEN7+9RZstqd76uKpg=; b=DyJgcI
	QPLZNzmqWc4gK8ouVyVvZZnkmFDc9ZHTKQ11ZFWWgWM2SsDhsmGFj80ct+K1e9Ic
	qQx91APc1gBWezGCLTle2VROw11Qt+1Mt6ZAPgrzKLtMhn3YeZuo4g0zIWqqVB0z
	eGngZwayDBIVtTWV+tmVHlPE891cnFkcQCoArdAmh19y2R4+nHvBP4MA4a9owZDL
	3MbDT+7K//EkHL5AHZE7aNF6wD7xtbt3wiog4JC/KeokmYCOfbOmOBzV0zRk0cwH
	UORzs+xgc+2bWYVbzwQZuxShvZ14BwCnwvbuvJg4tWTZUlKtLrvD7sAw1lVDj0YF
	RPh5c+RrsQKLY/RQ==
Received: (qmail 2621617 invoked from network); 30 Apr 2024 13:54:41 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Apr 2024 13:54:41 +0200
X-UD-Smtp-Session: l3s3148p1@11IFCU8X9o9ehhrb
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: alsa-devel@alsa-project.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ASoC: codecs: wm8996: use 'time_left' variable with
 wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 13:54:37 +0200
Message-ID: <20240430115438.29134-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
References: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RVFKBNS5EVZ3VN5JVYLO3JA4R2CSIF6W
X-Message-ID-Hash: RVFKBNS5EVZ3VN5JVYLO3JA4R2CSIF6W
X-MailFrom: wsa+renesas@sang-engineering.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVFKBNS5EVZ3VN5JVYLO3JA4R2CSIF6W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 sound/soc/codecs/wm8996.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index e738326e33ed..66096e09c953 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -655,28 +655,28 @@ static void wait_for_dc_servo(struct snd_soc_component *component, u16 mask)
 	struct i2c_client *i2c = to_i2c_client(component->dev);
 	struct wm8996_priv *wm8996 = snd_soc_component_get_drvdata(component);
 	int ret;
-	unsigned long timeout = 200;
+	unsigned long time_left = 200;
 
 	snd_soc_component_write(component, WM8996_DC_SERVO_2, mask);
 
 	/* Use the interrupt if possible */
 	do {
 		if (i2c->irq) {
-			timeout = wait_for_completion_timeout(&wm8996->dcs_done,
-							      msecs_to_jiffies(200));
-			if (timeout == 0)
+			time_left = wait_for_completion_timeout(&wm8996->dcs_done,
+								msecs_to_jiffies(200));
+			if (time_left == 0)
 				dev_err(component->dev, "DC servo timed out\n");
 
 		} else {
 			msleep(1);
-			timeout--;
+			time_left--;
 		}
 
 		ret = snd_soc_component_read(component, WM8996_DC_SERVO_2);
 		dev_dbg(component->dev, "DC servo state: %x\n", ret);
-	} while (timeout && ret & mask);
+	} while (time_left && ret & mask);
 
-	if (timeout == 0)
+	if (time_left == 0)
 		dev_err(component->dev, "DC servo timed out for %x\n", mask);
 	else
 		dev_dbg(component->dev, "DC servo complete for %x\n", mask);
-- 
2.43.0

