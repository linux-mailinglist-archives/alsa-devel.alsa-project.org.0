Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F245A1B6EE1
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 09:23:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B97F169F;
	Fri, 24 Apr 2020 09:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B97F169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587712984;
	bh=nUDtujpkA05q9hjDHsG634xQm9Nh49rewyyDiP/Vm7Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IeJdFfZEimK1BBJQbolGTpNSgWCPhQHXLrdraHAWe81QaikxzUt/797/jseD2Qa92
	 d8PJFCHm7LWrOP5q/yNkrpKIpU5XI4nVoa/mPI9umpl1u50qrnoGq4CtjhC3G30Qet
	 RyLUPd5jIQW1n/MLRFcUhVBF8AWK+pYfMpykprgc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73109F80117;
	Fri, 24 Apr 2020 09:21:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1296AF80142; Fri, 24 Apr 2020 09:20:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 12652F80116
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 09:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12652F80116
Received: from NTHCCAS01.nuvoton.com (nthccas01.nuvoton.com [10.1.8.28])
 by maillog.nuvoton.com (Postfix) with ESMTP id A87B71C80C5D;
 Fri, 24 Apr 2020 15:20:31 +0800 (CST)
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Fri, 24 Apr 2020
 15:20:31 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Fri, 24 Apr
 2020 15:20:31 +0800
Received: from localhost.localdomain (10.4.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.0.1130.7 via Frontend
 Transport; Fri, 24 Apr 2020 15:20:31 +0800
From: Seven Lee <wtli@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoc: nau8810: add AUX related dapm widgets and routes
Date: Fri, 24 Apr 2020 15:17:40 +0800
Message-ID: <20200424071739.20854-1-wtli@nuvoton.com>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 24 Apr 2020 09:21:21 +0200
Cc: alsa-devel@alsa-project.org, Seven Lee <wtli@nuvoton.com>,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 CTLIN0@nuvoton.com
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
 sound/soc/codecs/nau8810.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index de26758c30a8..2a04243ffeaa 100644
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
@@ -425,6 +433,8 @@ static const struct snd_soc_dapm_widget nau8810_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER("Input Boost Stage", NAU8810_REG_POWER2,
 		NAU8810_BST_EN_SFT, 0, nau8810_pgaboost_mixer_controls,
 		ARRAY_SIZE(nau8810_pgaboost_mixer_controls)),
+	SND_SOC_DAPM_PGA("AUX Input", NAU8810_REG_POWER1,
+		NAU8810_AUX_EN_SFT, 0, NULL, 0),
 
 	SND_SOC_DAPM_SUPPLY("Mic Bias", NAU8810_REG_POWER1,
 		NAU8810_MICBIAS_EN_SFT, 0, NULL, 0),
@@ -434,6 +444,7 @@ static const struct snd_soc_dapm_widget nau8810_dapm_widgets[] = {
 	SND_SOC_DAPM_SWITCH("Digital Loopback", SND_SOC_NOPM, 0, 0,
 		&nau8810_loopback),
 
+	SND_SOC_DAPM_INPUT("AUX"),
 	SND_SOC_DAPM_INPUT("MICN"),
 	SND_SOC_DAPM_INPUT("MICP"),
 	SND_SOC_DAPM_OUTPUT("MONOOUT"),
@@ -445,10 +456,12 @@ static const struct snd_soc_dapm_route nau8810_dapm_routes[] = {
 	{"DAC", NULL, "PLL", check_mclk_select_pll},
 
 	/* Mono output mixer */
+	{"Mono Mixer", "AUX Bypass Switch", "AUX Input"},
 	{"Mono Mixer", "PCM Playback Switch", "DAC"},
 	{"Mono Mixer", "Line Bypass Switch", "Input Boost Stage"},
 
 	/* Speaker output mixer */
+	{"Speaker Mixer", "AUX Bypass Switch", "AUX Input"},
 	{"Speaker Mixer", "PCM Playback Switch", "DAC"},
 	{"Speaker Mixer", "Line Bypass Switch", "Input Boost Stage"},
 
@@ -463,14 +476,18 @@ static const struct snd_soc_dapm_route nau8810_dapm_routes[] = {
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
+
 	/* Digital Looptack */
 	{"Digital Loopback", "Switch", "ADC"},
 	{"DAC", NULL, "Digital Loopback"},
-- 
2.25.2

