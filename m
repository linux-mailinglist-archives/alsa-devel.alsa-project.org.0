Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C28B74FA
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 13:55:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97B7DE80;
	Tue, 30 Apr 2024 13:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97B7DE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714478137;
	bh=MM2TeqomfLXF5s7OrDSUWwcq6LVqngUnCrjYhWJ7hBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TdsJ9Iajp/whktDLf5MlWJ6NbAxME/MPsnZlAP2/Qp+MQNn8zqsBiSSykNTXa4rVl
	 pXyZy9753vElgqhTIg8+lGIFOi0XHKhJCoJvFA3z5vgk5jODoCrAq2T418lWVLClr8
	 dH/9d0iQao3RXyiZ5CNmBzNb+PssyD1lIxn1pdi8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E102F805C9; Tue, 30 Apr 2024 13:54:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F3CF805C1;
	Tue, 30 Apr 2024 13:54:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C2BBF8049C; Tue, 30 Apr 2024 13:54:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F241FF8025D
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 13:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F241FF8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=Wd/kYC5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=vYs2g0fBsI7wQB63+nPXWqKZGlsYANFKOFZ/hv64BS0=; b=Wd/kYC
	5CQ6oeRH1lqxcink1OFkJq7SK9ydmWIuUkfwhtsubJG1896kvaWoX2vXY22Vy8mq
	9gNjDiNQWVpSdWZdd+S8n5Nt5lNFD8AGaiP3U+ymnyw2DjvJw2zCq5FGFn6ugXbB
	9IDqbeEss2MsSMJkXz1wNe6fi9pPlTgvic2iXNTfLiSCqPkulPLQ2C1XZdPZqLsL
	0WcZXPESAZB+ucHhEG654zIVG7RRmBrcmc6ef+Csu6MKCW2wMxvByGw7FseR+sX2
	5Dxob1ituo1N5ADvDIRK7gag83hNCNJUbTKrHMkPbzKUmezhz3vFIL7NT6E8kcD4
	sEew3XPoKODvfVbA==
Received: (qmail 2621543 invoked from network); 30 Apr 2024 13:54:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Apr 2024 13:54:40 +0200
X-UD-Smtp-Session: l3s3148p1@DWnvCE8XQqtehhrb
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
Subject: [PATCH 2/4] ASoC: codecs: wm8993: use 'time_left' variable with
 wait_for_completion_timeout()
Date: Tue, 30 Apr 2024 13:54:35 +0200
Message-ID: <20240430115438.29134-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
References: <20240430115438.29134-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DV3YCETYHYCL2RL7EEZE6VVVAS4WIN3Y
X-Message-ID-Hash: DV3YCETYHYCL2RL7EEZE6VVVAS4WIN3Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DV3YCETYHYCL2RL7EEZE6VVVAS4WIN3Y/>
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

Fix to the proper variable type 'unsigned long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 sound/soc/codecs/wm8993.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index 5b788f35e5e4..dcc6301223bc 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -470,7 +470,7 @@ static int _wm8993_set_fll(struct snd_soc_component *component, int fll_id, int
 	struct i2c_client *i2c = to_i2c_client(component->dev);
 	u16 reg1, reg4, reg5;
 	struct _fll_div fll_div;
-	unsigned int timeout;
+	unsigned long time_left;
 	int ret;
 
 	/* Any change? */
@@ -543,19 +543,19 @@ static int _wm8993_set_fll(struct snd_soc_component *component, int fll_id, int
 
 	/* If we've got an interrupt wired up make sure we get it */
 	if (i2c->irq)
-		timeout = msecs_to_jiffies(20);
+		time_left = msecs_to_jiffies(20);
 	else if (Fref < 1000000)
-		timeout = msecs_to_jiffies(3);
+		time_left = msecs_to_jiffies(3);
 	else
-		timeout = msecs_to_jiffies(1);
+		time_left = msecs_to_jiffies(1);
 
 	try_wait_for_completion(&wm8993->fll_lock);
 
 	/* Enable the FLL */
 	snd_soc_component_write(component, WM8993_FLL_CONTROL_1, reg1 | WM8993_FLL_ENA);
 
-	timeout = wait_for_completion_timeout(&wm8993->fll_lock, timeout);
-	if (i2c->irq && !timeout)
+	time_left = wait_for_completion_timeout(&wm8993->fll_lock, time_left);
+	if (i2c->irq && !time_left)
 		dev_warn(component->dev, "Timed out waiting for FLL\n");
 
 	dev_dbg(component->dev, "FLL enabled at %dHz->%dHz\n", Fref, Fout);
-- 
2.43.0

