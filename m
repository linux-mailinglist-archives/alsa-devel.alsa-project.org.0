Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7995F6E6761
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 16:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E99E6E93;
	Tue, 18 Apr 2023 16:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E99E6E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681829110;
	bh=wZyQBK9np5htNnwbbZq7ERplP2EvtHCJZWc0K3Citrg=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=Fqd7MTBiU1Ls1eYRrGrJ+OIWCfIGhs6954JkdWTfkuAy48XiIVY+Z0Zf1VOTbPidU
	 G/dnzPgaiRET6q1gBUTSWiwsbleD3lnkeiXzuInguqXcL2Lvgrm0QvH8ILJESCPN0o
	 r8Fune7V/mWcgRqK1WZRoDyBXBHZeRwz0OcFfQYg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8BBFF80155;
	Tue, 18 Apr 2023 16:43:30 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 2/4] ASoC: cs35l56: Remove SDW1 TX5 and TX6
Date: Tue, 18 Apr 2023 15:43:07 +0100
In-Reply-To: <20230418144309.1100721-1-rf@opensource.cirrus.com>
References: <20230418144309.1100721-1-rf@opensource.cirrus.com>
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPEAMY2ABD4URQ2HJKGJ4ESPTUDLHQZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168182901024.26.1681661514793218418@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 598D5F80534; Tue, 18 Apr 2023 16:43:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73889F800F8
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 16:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73889F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hT5hT7w0
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33IDaWqg031292;
	Tue, 18 Apr 2023 09:43:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Rs5cw0Wz6a/jxKCfL7DTBiJn6l/ZwNYSRmDxXte0s8k=;
 b=hT5hT7w003TyQnpqrRxEfSb3f5Ww/p0m4ji3M8jSGQQRBrjihaSiJpQRBAbhlRcGhYvA
 GuF60YrIVlTg6p2bcgvqX6CECF9zg+zX5fgsLH2cWLqL8AGk0nudrqEEkeqockkJ7cua
 Hpgpl0MRXYyiVUHx06kMWbaDZYSRs7yX1nwvJZMG/VxW01SPNB4AQJt9BzXy3E2Qg0Js
 KkQxqw1qgzWXw6mKl9KuYcJpecbE3S1Xk45osLcLog9fI0oiL5z+81z+Br7xgEOAI71B
 ML+awxvSVjFc9YMGGEHbFbW+7xgOXQTwvTiV1ovPGV4jfxC6BvBHi+SSYhet4hiMz03f yg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3pysb4wm9n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:43:13 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 18 Apr
 2023 09:43:10 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 18 Apr 2023 09:43:10 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 09BC011AA;
	Tue, 18 Apr 2023 14:43:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/4] ASoC: cs35l56: Remove SDW1 TX5 and TX6
Date: Tue, 18 Apr 2023 15:43:07 +0100
Message-ID: <20230418144309.1100721-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230418144309.1100721-1-rf@opensource.cirrus.com>
References: <20230418144309.1100721-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: u-z1amGyYdava1YxHzetLZkKQJM273Em
X-Proofpoint-GUID: u-z1amGyYdava1YxHzetLZkKQJM273Em
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CPEAMY2ABD4URQ2HJKGJ4ESPTUDLHQZO
X-Message-ID-Hash: CPEAMY2ABD4URQ2HJKGJ4ESPTUDLHQZO
X-MailFrom: prvs=9472792d81=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CPEAMY2ABD4URQ2HJKGJ4ESPTUDLHQZO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reduce SDW1 to 4 channels and remove the controls for SDW1
TX5 and TX6.

The TX5 and TX6 channels have been removed from B0 silicon.
There is no need to support them on A1 silicon.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  3 ---
 sound/soc/codecs/cs35l56-shared.c | 27 ---------------------------
 sound/soc/codecs/cs35l56.c        | 28 +---------------------------
 3 files changed, 1 insertion(+), 57 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index b3300bce74f4..dd7503464651 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -43,8 +43,6 @@
 #define CS35L56_SWIRE_DP3_CH2_INPUT			0x0004C74
 #define CS35L56_SWIRE_DP3_CH3_INPUT			0x0004C78
 #define CS35L56_SWIRE_DP3_CH4_INPUT			0x0004C7C
-#define CS35L56_SWIRE_DP3_CH5_INPUT			0x0004C80
-#define CS35L56_SWIRE_DP3_CH6_INPUT			0x0004C84
 #define CS35L56_IRQ1_CFG				0x000E000
 #define CS35L56_IRQ1_STATUS				0x000E004
 #define CS35L56_IRQ1_EINT_1				0x000E010
@@ -262,7 +260,6 @@ extern const struct cs_dsp_region cs35l56_dsp1_regions[CS35L56_NUM_DSP_REGIONS];
 extern const char * const cs35l56_tx_input_texts[CS35L56_NUM_INPUT_SRC];
 extern const unsigned int cs35l56_tx_input_values[CS35L56_NUM_INPUT_SRC];
 
-void cs35l56_patch(struct device *dev, struct regmap *regmap, u8 revid);
 void cs35l56_reread_firmware_registers(struct device *dev, struct regmap *regmap);
 int cs35l56_get_bclk_freq_id(unsigned int freq);
 void cs35l56_fill_supply_names(struct regulator_bulk_data *data);
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index d8bc06ad4888..f5fa6bb04d38 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -28,8 +28,6 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 	{ CS35L56_SWIRE_DP3_CH2_INPUT,		0x00000019 },
 	{ CS35L56_SWIRE_DP3_CH3_INPUT,		0x00000029 },
 	{ CS35L56_SWIRE_DP3_CH4_INPUT,		0x00000028 },
-	{ CS35L56_SWIRE_DP3_CH5_INPUT,		0x00000018 },
-	{ CS35L56_SWIRE_DP3_CH6_INPUT,		0x00000018 },
 	{ CS35L56_IRQ1_CFG,			0x00000000 },
 	{ CS35L56_IRQ1_MASK_1,			0x83ffffff },
 	{ CS35L56_IRQ1_MASK_2,			0xffff7fff },
@@ -42,29 +40,6 @@ static const struct reg_default cs35l56_reg_defaults[] = {
 	/* CS35L56_MAIN_POSTURE_NUMBER - soft register, no default	*/
 };
 
-/*
- * The Ax devices have different default register values to that of B0,
- * establish a common set of register defaults.
- */
-static const struct reg_sequence cs35l56_reva_patch[] = {
-	{ CS35L56_SWIRE_DP3_CH5_INPUT,	0x00000018 },
-	{ CS35L56_SWIRE_DP3_CH6_INPUT,	0x00000018 },
-};
-
-void cs35l56_patch(struct device *dev, struct regmap *regmap, u8 revid)
-{
-	int ret;
-
-	if (revid >= CS35L56_REVID_B0)
-		return;
-
-	ret = regmap_register_patch(regmap, cs35l56_reva_patch,
-				    ARRAY_SIZE(cs35l56_reva_patch));
-	if (ret)
-		dev_err(dev, "Failed to apply patch: %d\n", ret);
-}
-EXPORT_SYMBOL_NS_GPL(cs35l56_patch, SND_SOC_CS35L56_SHARED);
-
 static bool cs35l56_is_dsp_memory(unsigned int reg)
 {
 	switch (reg) {
@@ -114,8 +89,6 @@ static bool cs35l56_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L56_SWIRE_DP3_CH2_INPUT:
 	case CS35L56_SWIRE_DP3_CH3_INPUT:
 	case CS35L56_SWIRE_DP3_CH4_INPUT:
-	case CS35L56_SWIRE_DP3_CH5_INPUT:
-	case CS35L56_SWIRE_DP3_CH6_INPUT:
 	case CS35L56_IRQ1_CFG:
 	case CS35L56_IRQ1_STATUS:
 	case CS35L56_IRQ1_EINT_1 ... CS35L56_IRQ1_EINT_8:
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 1b80cae5026e..c0a857cfb8cb 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -166,24 +166,6 @@ static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx4_enum,
 static const struct snd_kcontrol_new sdw1_tx4_mux =
 	SOC_DAPM_ENUM("SDW1TX4 SRC", cs35l56_sdw1tx4_enum);
 
-static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx5_enum,
-				CS35L56_SWIRE_DP3_CH5_INPUT,
-				0, CS35L56_SWIRETXn_SRC_MASK,
-				cs35l56_tx_input_texts,
-				cs35l56_tx_input_values);
-
-static const struct snd_kcontrol_new sdw1_tx5_mux =
-	SOC_DAPM_ENUM("SDW1TX5 SRC", cs35l56_sdw1tx5_enum);
-
-static SOC_VALUE_ENUM_SINGLE_DECL(cs35l56_sdw1tx6_enum,
-				CS35L56_SWIRE_DP3_CH6_INPUT,
-				0, CS35L56_SWIRETXn_SRC_MASK,
-				cs35l56_tx_input_texts,
-				cs35l56_tx_input_values);
-
-static const struct snd_kcontrol_new sdw1_tx6_mux =
-	SOC_DAPM_ENUM("SDW1TX6 SRC", cs35l56_sdw1tx6_enum);
-
 static int cs35l56_play_event(struct snd_soc_dapm_widget *w,
 			      struct snd_kcontrol *kcontrol, int event)
 {
@@ -251,8 +233,6 @@ static const struct snd_soc_dapm_widget cs35l56_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("SDW1 TX2 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx2_mux),
 	SND_SOC_DAPM_MUX("SDW1 TX3 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx3_mux),
 	SND_SOC_DAPM_MUX("SDW1 TX4 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx4_mux),
-	SND_SOC_DAPM_MUX("SDW1 TX5 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx5_mux),
-	SND_SOC_DAPM_MUX("SDW1 TX6 Source", SND_SOC_NOPM, 0, 0, &sdw1_tx6_mux),
 
 	SND_SOC_DAPM_SIGGEN("VMON ADC"),
 	SND_SOC_DAPM_SIGGEN("IMON ADC"),
@@ -318,14 +298,10 @@ static const struct snd_soc_dapm_route cs35l56_audio_map[] = {
 	CS35L56_SRC_ROUTE("SDW1 TX2")
 	CS35L56_SRC_ROUTE("SDW1 TX3")
 	CS35L56_SRC_ROUTE("SDW1 TX4")
-	CS35L56_SRC_ROUTE("SDW1 TX5")
-	CS35L56_SRC_ROUTE("SDW1 TX6")
 	{ "SDW1 Capture", NULL, "SDW1 TX1 Source" },
 	{ "SDW1 Capture", NULL, "SDW1 TX2 Source" },
 	{ "SDW1 Capture", NULL, "SDW1 TX3 Source" },
 	{ "SDW1 Capture", NULL, "SDW1 TX4 Source" },
-	{ "SDW1 Capture", NULL, "SDW1 TX5 Source" },
-	{ "SDW1 Capture", NULL, "SDW1 TX6 Source" },
 };
 
 static int cs35l56_dsp_event(struct snd_soc_dapm_widget *w,
@@ -779,7 +755,7 @@ static struct snd_soc_dai_driver cs35l56_dai[] = {
 		.capture = {
 			.stream_name = "SDW1 Capture",
 			.channels_min = 1,
-			.channels_max = 6,
+			.channels_max = 4,
 			.rates = CS35L56_RATES,
 			.formats = CS35L56_TX_FORMATS,
 		},
@@ -1535,8 +1511,6 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 	dev_info(cs35l56->dev, "Cirrus Logic CS35L56%s Rev %02X OTP%d\n",
 		 cs35l56->secured ? "s" : "", cs35l56->rev, otpid);
 
-	cs35l56_patch(cs35l56->dev, cs35l56->regmap, cs35l56->rev);
-
 	/* Wake source and *_BLOCKED interrupts default to unmasked, so mask them */
 	regmap_write(cs35l56->regmap, CS35L56_IRQ1_MASK_20, 0xffffffff);
 	regmap_update_bits(cs35l56->regmap, CS35L56_IRQ1_MASK_1,
-- 
2.30.2

