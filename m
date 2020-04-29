Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 065151BD7CF
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 11:02:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8384616AA;
	Wed, 29 Apr 2020 11:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8384616AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588150924;
	bh=6EnvchsghUN7TZ/hUD6KWi/qQjt3AaNyWDB/n/PrIS0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=haSSJG+l1fdqw9vN4+hpIgCzEIjP0ekl3EtGb4BYe93ZEcP1lQlAruPqsn3Ej2KFA
	 nYkG4c51cBcHWqnnQSd28/uX5xRLVZUUl23B8I9cmCgIED0HY8Thcr7zs/aigVw8SE
	 PdPZl+WuaTRmxN49FzAZvrZ7UZpIzXJx6p1c1ovg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C7E9F80232;
	Wed, 29 Apr 2020 11:00:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 444B0F800B6; Wed, 29 Apr 2020 11:00:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 8A076F800B6
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 11:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A076F800B6
Received: from NTHCCAS02.nuvoton.com (nthccas02.nuvoton.com [10.1.8.29])
 by maillog.nuvoton.com (Postfix) with ESMTP id 6AF531C80307;
 Wed, 29 Apr 2020 17:00:06 +0800 (CST)
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTHCCAS02.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Wed, 29 Apr 2020
 17:00:06 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1847.3; Wed, 29 Apr
 2020 17:00:05 +0800
Received: from localhost.localdomain (10.4.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.0.1130.7 via Frontend
 Transport; Wed, 29 Apr 2020 17:00:06 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoc: nau8810: add AUX related dapm widgets and routes
Date: Wed, 29 Apr 2020 17:00:02 +0800
Message-ID: <20200429090002.28556-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Seven Lee <wtli@nuvoton.com>,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 KCHSU0@nuvoton.comgit
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

This patch implements the following features:
- AUX input for recording.
- An input AUX output to SPK/MOUT.

Signed-off-by: Seven Lee <wtli@nuvoton.com>
---
 sound/soc/codecs/nau8810.c | 35 ++++++++++++++++++++++++++++++++++-
 sound/soc/codecs/nau8810.h |  8 ++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index de26758c30a8..efe9fb3fb225 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -355,6 +355,8 @@ static const struct snd_kcontrol_new nau8810_snd_controls[] = {
 
 /* Speaker Output Mixer */
 static const struct snd_kcontrol_new nau8810_speaker_mixer_controls[] = {
+	SOC_DAPM_SINGLE("AUX Bypass Switch", NAU8810_REG_SPKMIX,
+		NAU8810_AUXSPK_SFT, 1, 0),
 	SOC_DAPM_SINGLE("Line Bypass Switch", NAU8810_REG_SPKMIX,
 		NAU8810_BYPSPK_SFT, 1, 0),
 	SOC_DAPM_SINGLE("PCM Playback Switch", NAU8810_REG_SPKMIX,
@@ -363,6 +365,8 @@ static const struct snd_kcontrol_new nau8810_speaker_mixer_controls[] = {
 
 /* Mono Output Mixer */
 static const struct snd_kcontrol_new nau8810_mono_mixer_controls[] = {
+	SOC_DAPM_SINGLE("AUX Bypass Switch", NAU8810_REG_MONOMIX,
+		NAU8810_AUXMOUT_SFT, 1, 0),
 	SOC_DAPM_SINGLE("Line Bypass Switch", NAU8810_REG_MONOMIX,
 		NAU8810_BYPMOUT_SFT, 1, 0),
 	SOC_DAPM_SINGLE("PCM Playback Switch", NAU8810_REG_MONOMIX,
@@ -371,6 +375,8 @@ static const struct snd_kcontrol_new nau8810_mono_mixer_controls[] = {
 
 /* PGA Mute */
 static const struct snd_kcontrol_new nau8810_pgaboost_mixer_controls[] = {
+	SOC_DAPM_SINGLE("AUX PGA Switch", NAU8810_REG_ADCBOOST,
+		NAU8810_AUXBSTGAIN_SFT, 0x7, 0),
 	SOC_DAPM_SINGLE("PGA Mute Switch", NAU8810_REG_PGAGAIN,
 		NAU8810_PGAMT_SFT, 1, 1),
 	SOC_DAPM_SINGLE("PMIC PGA Switch", NAU8810_REG_ADCBOOST,
@@ -379,6 +385,8 @@ static const struct snd_kcontrol_new nau8810_pgaboost_mixer_controls[] = {
 
 /* Input PGA */
 static const struct snd_kcontrol_new nau8810_inpga[] = {
+	SOC_DAPM_SINGLE("AUX Switch", NAU8810_REG_INPUT_SIGNAL,
+		NAU8810_AUXPGA_SFT, 1, 0),
 	SOC_DAPM_SINGLE("MicN Switch", NAU8810_REG_INPUT_SIGNAL,
 		NAU8810_NMICPGA_SFT, 1, 0),
 	SOC_DAPM_SINGLE("MicP Switch", NAU8810_REG_INPUT_SIGNAL,
@@ -401,6 +409,23 @@ static int check_mclk_select_pll(struct snd_soc_dapm_widget *source,
 	return (value & NAU8810_CLKM_MASK);
 }
 
+static int check_mic_enabled(struct snd_soc_dapm_widget *source,
+	struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(source->dapm);
+	struct nau8810 *nau8810 = snd_soc_component_get_drvdata(component);
+	unsigned int value;
+
+	regmap_read(nau8810->regmap, NAU8810_REG_INPUT_SIGNAL, &value);
+	if (value & NAU8810_PMICPGA_EN || value & NAU8810_NMICPGA_EN)
+		return 1;
+	regmap_read(nau8810->regmap, NAU8810_REG_ADCBOOST, &value);
+	if (value & NAU8810_PMICBSTGAIN_MASK)
+		return 1;
+	return 0;
+}
+
 static const struct snd_soc_dapm_widget nau8810_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("Speaker Mixer", NAU8810_REG_POWER3,
 		NAU8810_SPKMX_EN_SFT, 0, &nau8810_speaker_mixer_controls[0],
@@ -425,6 +450,8 @@ static const struct snd_soc_dapm_widget nau8810_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("Input Boost Stage", NAU8810_REG_POWER2,
 		NAU8810_BST_EN_SFT, 0, nau8810_pgaboost_mixer_controls,
 		ARRAY_SIZE(nau8810_pgaboost_mixer_controls)),
+	SND_SOC_DAPM_PGA("AUX Input", NAU8810_REG_POWER1,
+		NAU8810_AUX_EN_SFT, 0, NULL, 0),
 
 	SND_SOC_DAPM_SUPPLY("Mic Bias", NAU8810_REG_POWER1,
 		NAU8810_MICBIAS_EN_SFT, 0, NULL, 0),
@@ -434,6 +461,7 @@ static const struct snd_soc_dapm_widget nau8810_dapm_widgets[] = {
 	SND_SOC_DAPM_SWITCH("Digital Loopback", SND_SOC_NOPM, 0, 0,
 		&nau8810_loopback),
 
+	SND_SOC_DAPM_INPUT("AUX"),
 	SND_SOC_DAPM_INPUT("MICN"),
 	SND_SOC_DAPM_INPUT("MICP"),
 	SND_SOC_DAPM_OUTPUT("MONOOUT"),
@@ -445,10 +473,12 @@ static const struct snd_soc_dapm_route nau8810_dapm_routes[] = {
 	{"DAC", NULL, "PLL", check_mclk_select_pll},
 
 	/* Mono output mixer */
+	{"Mono Mixer", "AUX Bypass Switch", "AUX Input"},
 	{"Mono Mixer", "PCM Playback Switch", "DAC"},
 	{"Mono Mixer", "Line Bypass Switch", "Input Boost Stage"},
 
 	/* Speaker output mixer */
+	{"Speaker Mixer", "AUX Bypass Switch", "AUX Input"},
 	{"Speaker Mixer", "PCM Playback Switch", "DAC"},
 	{"Speaker Mixer", "Line Bypass Switch", "Input Boost Stage"},
 
@@ -463,13 +493,16 @@ static const struct snd_soc_dapm_route nau8810_dapm_routes[] = {
 	/* Input Boost Stage */
 	{"ADC", NULL, "Input Boost Stage"},
 	{"ADC", NULL, "PLL", check_mclk_select_pll},
+	{"Input Boost Stage", "AUX PGA Switch", "AUX Input"},
 	{"Input Boost Stage", "PGA Mute Switch", "Input PGA"},
 	{"Input Boost Stage", "PMIC PGA Switch", "MICP"},
 
 	/* Input PGA */
-	{"Input PGA", NULL, "Mic Bias"},
+	{"Input PGA", NULL, "Mic Bias", check_mic_enabled},
+	{"Input PGA", "AUX Switch", "AUX Input"},
 	{"Input PGA", "MicN Switch", "MICN"},
 	{"Input PGA", "MicP Switch", "MICP"},
+	{"AUX Input", NULL, "AUX"},
 
 	/* Digital Looptack */
 	{"Digital Loopback", "Switch", "ADC"},
diff --git a/sound/soc/codecs/nau8810.h b/sound/soc/codecs/nau8810.h
index 1ada31883dc6..6a7cacbe044a 100644
--- a/sound/soc/codecs/nau8810.h
+++ b/sound/soc/codecs/nau8810.h
@@ -69,6 +69,7 @@
 
 /* NAU8810_REG_POWER1 (0x1) */
 #define NAU8810_DCBUF_EN		(0x1 << 8)
+#define NAU8810_AUX_EN_SFT		6
 #define NAU8810_PLL_EN_SFT		5
 #define NAU8810_MICBIAS_EN_SFT	4
 #define NAU8810_ABIAS_EN		(0x1 << 3)
@@ -228,7 +229,10 @@
 
 /* NAU8810_REG_INPUT_SIGNAL (0x2C) */
 #define NAU8810_PMICPGA_SFT		0
+#define NAU8810_PMICPGA_EN		(0x1 << NAU8810_PMICPGA_SFT)
 #define NAU8810_NMICPGA_SFT		1
+#define NAU8810_NMICPGA_EN		(0x1 << NAU8810_NMICPGA_SFT)
+#define NAU8810_AUXPGA_SFT		2
 
 /* NAU8810_REG_PGAGAIN (0x2D) */
 #define NAU8810_PGAGAIN_SFT		0
@@ -236,12 +240,15 @@
 #define NAU8810_PGAZC_SFT		7
 
 /* NAU8810_REG_ADCBOOST (0x2F) */
+#define NAU8810_AUXBSTGAIN_SFT	0
 #define NAU8810_PMICBSTGAIN_SFT	4
+#define NAU8810_PMICBSTGAIN_MASK	(0x7 << NAU8810_PMICBSTGAIN_SFT)
 #define NAU8810_PGABST_SFT		8
 
 /* NAU8810_REG_SPKMIX (0x32) */
 #define NAU8810_DACSPK_SFT		0
 #define NAU8810_BYPSPK_SFT		1
+#define NAU8810_AUXSPK_SFT		5
 
 /* NAU8810_REG_SPKGAIN (0x36) */
 #define NAU8810_SPKGAIN_SFT		0
@@ -251,6 +258,7 @@
 /* NAU8810_REG_MONOMIX (0x38) */
 #define NAU8810_DACMOUT_SFT		0
 #define NAU8810_BYPMOUT_SFT		1
+#define NAU8810_AUXMOUT_SFT		2
 #define NAU8810_MOUTMXMT_SFT		6
 
 
-- 
2.25.2

