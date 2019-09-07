Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B2BAC648
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Sep 2019 13:19:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46C2A165D;
	Sat,  7 Sep 2019 13:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46C2A165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567855156;
	bh=3v/5zrNQkn/UjjKfcE1qxpBtFh0cv90P1wFCPdqIpHg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C8eErgEKHJt3diy5+80j32zosuWGEdQFFE1obmsxYkHEJ3O+AE22ONDauzyhN03ed
	 UPCsqojIyDSPwYM3KbU/H9Aj2v1LcuiZw2u6/KVOpWleFcvX3JBc0gj1QCneKSILEE
	 ikuEh0aBPJYZvJXaQ6ECHsyLWGRYjqVERJXorbtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2035CF80448;
	Sat,  7 Sep 2019 13:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45ED9F80448; Sat,  7 Sep 2019 13:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B73FBF80171
 for <alsa-devel@alsa-project.org>; Sat,  7 Sep 2019 13:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B73FBF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="s7luqUqo"
Received: by mail-lj1-x242.google.com with SMTP id a4so8336762ljk.8
 for <alsa-devel@alsa-project.org>; Sat, 07 Sep 2019 04:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rb/yzZzQwRQ8fy1RC3CpSGeeNV/NzBEBHsdpVswPgSk=;
 b=s7luqUqoYTSiz38spY75YXIBcpWyiH5eaY1MtZubo/nnuTlbgm5e9h+LQARrhrYZTf
 Y66OAVdoDtYS6OMejay0lA3AngVTqHvSVkn5aJk+YSUSL8dfPhWGpLz7nYBnJhiXbWZ1
 4Y440WKDSG/ITtCPAy5PMzWeBNmsu94G1Pqhl871ljKH6IjgfGPvZfla4EPpgaV4MQMm
 88X8EfM2SBWPsbypEuymFtmKvJMR6wg+XDm3qYBewr+MOZXqxvU83/8jAQ/6F25G2AiW
 RoE+eD1Hbtb98eTPbSDf88D3qjK9JwQF6hT5jqOjkmbeJU28masTsVj2bJyzw3YsCT2a
 /wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rb/yzZzQwRQ8fy1RC3CpSGeeNV/NzBEBHsdpVswPgSk=;
 b=sq9QQrVfvUvJVfZXP9q4v9i+JlKuS0wX6eUZ1M7JZFwye1VpBKg4FGawi0sW+scO1U
 rd1BUw2+Sq+ermnjVI+z1Wff/aGuZi0RUTMZhEeQUgRaAtpcGJAbm6SUfbuIXWWHm+fq
 +fVatK/qlPFRqPfj/GZ57elASB2xd+DpMEffFagLh2GmWp0igQmmAUL2Joby8Fa/IJ0E
 CPOKp1TNDrWDZWtdN+dZhiM+bs4yD+VB5UPFkU0es9b64BulhC+fIfr3bYvWDC4RLe0f
 yykqE941SbWI/LW53phHXhYsn7Y/yvduhpC5pakClfBV8h/IdB6j0CFJ7LNbqMllvOcP
 64fg==
X-Gm-Message-State: APjAAAWydK3TmNTfU/8izmxbzJoqHAlxPbgVh+eHEY8K5i03LRkfNAwa
 MXCGtQ3f4odjcvpUBlW64R4=
X-Google-Smtp-Source: APXvYqyb8Nsc49DfrXMB01RwgWnIJnbgFnkeu/HYpgo5Vq+pXzAMdj4S9tqeeRIq1+TupqRaHBrqlw==
X-Received: by 2002:a2e:8814:: with SMTP id x20mr9035873ljh.221.1567855043437; 
 Sat, 07 Sep 2019 04:17:23 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl
 (109241207190.gdansk.vectranet.pl. [109.241.207.190])
 by smtp.gmail.com with ESMTPSA id c10sm1673419lfp.65.2019.09.07.04.17.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Sep 2019 04:17:22 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Sat,  7 Sep 2019 13:16:50 +0200
Message-Id: <20190907111650.15440-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org
Subject: [alsa-devel] [RFC PATCH] ASoC: ams-delta: Take control over audio
	mute GPIO pins
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

Since commit 1137ceee76ba ("ARM: OMAP1: ams-delta: Don't request unused
GPIOs"), on-board audio has appeared muted.  It has been discovered that
believed to be unused GPIO pins "hookflash1" and "hookflash2" need to be
set low for audible sound in handsfree and handset mode respectively.

According to Amstrad E3 wiki, the purpose of both pins hasn't been
clearly identified.  Original Amstrad software used to produce a high
pulse on them when the phone was taken off hook or recall was pressed.
With the current findings, we can assume the pins provide a kind of
audio mute function, separately for handset and handsfree operation
modes.

Commit 2afdb4c41d78 ("ARM: OMAP1: ams-delta: Fix audio permanently
muted") attempted to fix the issue temporarily by hogging the GPIO pin
"hookflash1" renamed to "audio_mute", however the fix occurred
incomplete as it restored audible sound only for handsfree mode.

Stop hogging that pin, rename the pins to "handsfree_mute" and
"handset_mute" respectively and implement appropriate DAPM event
callbacks for "Speaker" and "Earpiece" DAPM widgets.

Fixes: 1137ceee76ba ("ARM: OMAP1: ams-delta: Don't request unused GPIOs")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 arch/arm/mach-omap1/board-ams-delta.c | 10 +++++----
 sound/soc/ti/ams-delta.c              | 31 +++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index e47a6fbcfd6e..a2aa7a12b374 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -246,8 +246,8 @@ static struct platform_device latch2_gpio_device = {
 #define LATCH2_PIN_SCARD_CMDVCC		11
 #define LATCH2_PIN_MODEM_NRESET		12
 #define LATCH2_PIN_MODEM_CODEC		13
-#define LATCH2_PIN_AUDIO_MUTE		14
-#define LATCH2_PIN_HOOKFLASH		15
+#define LATCH2_PIN_HANDSFREE_MUTE	14
+#define LATCH2_PIN_HANDSET_MUTE		15
 
 static struct regulator_consumer_supply modem_nreset_consumers[] = {
 	REGULATOR_SUPPLY("RESET#", "serial8250.1"),
@@ -476,6 +476,10 @@ static struct gpiod_lookup_table ams_delta_audio_gpio_table = {
 			    "hook_switch", 0),
 		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_MODEM_CODEC,
 			    "modem_codec", 0),
+		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_HANDSFREE_MUTE,
+			    "handsfree_mute", 0),
+		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_HANDSET_MUTE,
+			    "handset_mute", 0),
 		{ },
 	},
 };
@@ -590,8 +594,6 @@ static int gpiochip_match_by_label(struct gpio_chip *chip, void *data)
 static struct gpiod_hog ams_delta_gpio_hogs[] = {
 	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
 		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
-	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_AUDIO_MUTE, "audio_mute",
-		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
 	{},
 };
 
diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index dee8fc70a64f..8e2fb81ad05c 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -23,14 +23,31 @@
 #include "omap-mcbsp.h"
 #include "../codecs/cx20442.h"
 
+static struct gpio_desc *handset_mute;
+static struct gpio_desc *handsfree_mute;
+
+static int ams_delta_event_handset(struct snd_soc_dapm_widget *w,
+				   struct snd_kcontrol *k, int event)
+{
+	gpiod_set_value_cansleep(handset_mute, !SND_SOC_DAPM_EVENT_ON(event));
+	return 0;
+}
+
+static int ams_delta_event_handsfree(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *k, int event)
+{
+	gpiod_set_value_cansleep(handsfree_mute, !SND_SOC_DAPM_EVENT_ON(event));
+	return 0;
+}
+
 /* Board specific DAPM widgets */
 static const struct snd_soc_dapm_widget ams_delta_dapm_widgets[] = {
 	/* Handset */
 	SND_SOC_DAPM_MIC("Mouthpiece", NULL),
-	SND_SOC_DAPM_HP("Earpiece", NULL),
+	SND_SOC_DAPM_HP("Earpiece", ams_delta_event_handset),
 	/* Handsfree/Speakerphone */
 	SND_SOC_DAPM_MIC("Microphone", NULL),
-	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_SPK("Speaker", ams_delta_event_handsfree),
 };
 
 /* How they are connected to codec pins */
@@ -542,6 +559,16 @@ static int ams_delta_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
+	handset_mute = devm_gpiod_get(card->dev, "handset_mute",
+				      GPIOD_OUT_HIGH);
+	if (IS_ERR(handset_mute))
+		return PTR_ERR(handset_mute);
+
+	handsfree_mute = devm_gpiod_get(card->dev, "handsfree_mute",
+					GPIOD_OUT_HIGH);
+	if (IS_ERR(handsfree_mute))
+		return PTR_ERR(handsfree_mute);
+
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
