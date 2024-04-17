Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E18208A9F45
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:57:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69DA1265E;
	Thu, 18 Apr 2024 17:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69DA1265E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455835;
	bh=Xe8v26rB5ku05uEQ0DiDCp0NwUUgiugDQkf50c7/kAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PmiLMCviiCLluuvR0tTtvQGP91KvsPfbik5ewxFga1DocY/LhoUtWo6yx1DaTPEUg
	 YWjzO+ffr+1oVUf0R1KIXVw2/WxLZsXZdv1Wm3Uz46JhH4/CKgBSjrldNkIxtm5PoW
	 gnfazjsKeV64MEVI7pejnIU9+FvORPN7wzSkZfCE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02526F80692; Thu, 18 Apr 2024 17:52:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05698F80680;
	Thu, 18 Apr 2024 17:52:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8908CF8025A; Wed, 17 Apr 2024 10:31:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53EA9F8013D
	for <alsa-devel@alsa-project.org>; Wed, 17 Apr 2024 10:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53EA9F8013D
Received: by air.basealt.ru (Postfix, from userid 490)
	id C3BFE2F2024E; Wed, 17 Apr 2024 08:31:30 +0000 (UTC)
Received: from altlinux.malta.altlinux.ru (obninsk.basealt.ru [217.15.195.17])
	by air.basealt.ru (Postfix) with ESMTPSA id 51F812F20244;
	Wed, 17 Apr 2024 08:31:18 +0000 (UTC)
From: kovalev@altlinux.org
To: stable@vger.kernel.org
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	zhuning0077@gmail.com,
	u.kleine-koenig@pengutronix.de,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 6.1.y 2/6] ASoC: codecs: ES8326: Change Hp_detect register
 names
Date: Wed, 17 Apr 2024 11:31:12 +0300
Message-Id: <20240417083116.608610-3-kovalev@altlinux.org>
X-Mailer: git-send-email 2.33.8
In-Reply-To: <20240417083116.608610-1-kovalev@altlinux.org>
References: <20240417083116.608610-1-kovalev@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kovalev@altlinux.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LVA6ATOZCBBTS7LBWZL6BSYTLTXJFLPE
X-Message-ID-Hash: LVA6ATOZCBBTS7LBWZL6BSYTLTXJFLPE
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:52:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Zhu Ning <zhuning0077@gmail.com>

Commit 4ddad00c609bdcd6635537d3acb9bd57a5fc79e6 upstream.

The old register naming method is confusing. The reg 0x57 decides
the default headset hardware connection type, and the reg 0xfb is
the headset detection status register, which changes during headset
insertion. Change the name to ES8326_HPDET_TYPE and ES8326_HPDET_STA.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
Link: https://lore.kernel.org/r/20230717033223.42506-1-zhuning0077@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Vasiliy Kovalev <kovalev@altlinux.org>
---
 sound/soc/codecs/es8326.c | 10 +++++-----
 sound/soc/codecs/es8326.h | 12 ++++++++----
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index caee0d66ce47a8..c60cb081b5a26f 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -159,7 +159,7 @@ static const struct snd_soc_dapm_route es8326_dapm_routes[] = {
 };
 
 static const struct regmap_range es8326_volatile_ranges[] = {
-	regmap_reg_range(ES8326_HP_DETECT, ES8326_HP_DETECT),
+	regmap_reg_range(ES8326_HPDET_STA, ES8326_HPDET_STA),
 };
 
 static const struct regmap_access_table es8326_volatile_table = {
@@ -519,7 +519,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		return;
 
 	mutex_lock(&es8326->lock);
-	iface = snd_soc_component_read(comp, ES8326_HP_DETECT);
+	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
 		/* pause button detected */
@@ -578,7 +578,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	unsigned int iface;
 
 	mutex_lock(&es8326->lock);
-	iface = snd_soc_component_read(comp, ES8326_HP_DETECT);
+	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
 		/* Jack unplugged or spurious IRQ */
@@ -651,7 +651,7 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_ADC1_SRC, es8326->mic1_src);
 	regmap_write(es8326->regmap, ES8326_ADC2_SRC, es8326->mic2_src);
 	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER, 0x88);
-	regmap_write(es8326->regmap, ES8326_HP_DET,
+	regmap_write(es8326->regmap, ES8326_HPDET_TYPE,
 		     ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol);
 	regmap_write(es8326->regmap, ES8326_INT_SOURCE, es8326->interrupt_src);
 	regmap_write(es8326->regmap, ES8326_INTOUT_IO, es8326->interrupt_clk);
@@ -743,7 +743,7 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 
 	mutex_lock(&es8326->lock);
 	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HP_DET,
+		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
 					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
 	es8326->jack = jack;
 
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index 65ed4d1dc7da09..cd04d11a88d96a 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -73,15 +73,19 @@
 #define ES8326_DRC_RECOVERY	0x53
 #define ES8326_DRC_WINSIZE	0x54
 #define ES8326_HPJACK_TIMER	0x56
-#define ES8326_HP_DET		0x57
+#define ES8326_HPDET_TYPE	0x57
 #define ES8326_INT_SOURCE	0x58
 #define ES8326_INTOUT_IO	0x59
 #define ES8326_SDINOUT1_IO	0x5A
 #define ES8326_SDINOUT23_IO	0x5B
 #define ES8326_JACK_PULSE	0x5C
 
+#define ES8326_HP_MISC		0xF7
+#define ES8326_CTIA_OMTP_STA	0xF8
 #define ES8326_PULLUP_CTL	0xF9
-#define ES8326_HP_DETECT	0xFB
+#define ES8326_CSM_I2C_STA	0xFA
+#define ES8326_HPDET_STA	0xFB
+#define ES8326_CSM_MUTE_STA	0xFC
 #define ES8326_CHIP_ID1		0xFD
 #define ES8326_CHIP_ID2		0xFE
 #define ES8326_CHIP_VERSION	0xFF
@@ -146,7 +150,7 @@
 #define ES8326_ADC3_SHIFT 0
 #define ES8326_ADC4_SHIFT 3
 
-/* ES8326_HP_DET */
+/* ES8326_HPDET_TYPE */
 #define ES8326_HP_DET_SRC_PIN27 (1 << 5)
 #define ES8326_HP_DET_SRC_PIN9 (1 << 4)
 #define ES8326_HP_DET_JACK_POL (1 << 3)
@@ -174,7 +178,7 @@
 #define ES8326_SDINOUT2_SHIFT 4
 #define ES8326_SDINOUT3_SHIFT 0
 
-/* ES8326_HP_DETECT */
+/* ES8326_HPDET_STA */
 #define ES8326_HPINSERT_FLAG (1 << 1)
 #define ES8326_HPBUTTON_FLAG (1 << 0)
 
-- 
2.33.8

