Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF14A43AF40
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 11:41:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299A116B6;
	Tue, 26 Oct 2021 11:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299A116B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635241288;
	bh=6Cd2xQYJz5grk3fy2BrHSJcliiAA4o+gM8jwPwyfhUw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P8PvTtV6T6UW/C7XJnmNB9s2fbQLL5Lj3+mOaw95TFZs/dzdKu2KV4ZZaP+/fw5TR
	 6Mw+GUUGiPGxhT1FWkG4NpTXoNiohBtukUBK44fgw5napXl/lVNEHIIxrFtCz+bpBJ
	 Nc0Ih9E1WV/8jgHtR8l9HUVRQBckaH6a4p4XCAyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADBB1F804FB;
	Tue, 26 Oct 2021 11:39:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 145D7F804FA; Tue, 26 Oct 2021 11:39:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 26DE9F80269
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 11:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26DE9F80269
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
 by maillog.nuvoton.com (Postfix) with ESMTP id 10DEC1C810D7;
 Tue, 26 Oct 2021 17:38:43 +0800 (CST)
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 26 Oct
 2021 17:38:42 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 26 Oct 2021 17:38:42 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH 3/3] ASoC: nau8825: add clock management for power saving
Date: Tue, 26 Oct 2021 17:38:28 +0800
Message-ID: <20211026093828.4188145-4-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026093828.4188145-1-CTLIN0@nuvoton.com>
References: <20211026093828.4188145-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotRedirectTo-PP: TRUE
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, lgirdwood@gmail.com, YHCHuang@nuvoton.com,
 mac.chiang@intel.com, CTLIN0@nuvoton.com
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

Adjust dapm widget to manage clock from power event for power saving.

Co-Developed-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8825.c | 35 +++++++++++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index a356f26735bd..eed017d5df4b 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -47,6 +47,7 @@
 
 static int nau8825_configure_sysclk(struct nau8825 *nau8825,
 		int clk_id, unsigned int freq);
+static bool nau8825_is_jack_inserted(struct regmap *regmap);
 
 struct nau8825_fll {
 	int mclk_src;
@@ -981,6 +982,31 @@ static int nau8825_output_dac_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int system_clock_control(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *k, int  event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
+	struct regmap *regmap = nau8825->regmap;
+
+	if (SND_SOC_DAPM_EVENT_OFF(event)) {
+		dev_dbg(nau8825->dev, "system clock control : POWER OFF\n");
+		/* Set clock source to disable or internal clock before the
+		 * playback or capture end. Codec needs clock for Jack
+		 * detection and button press if jack inserted; otherwise,
+		 * the clock should be closed.
+		 */
+		if (nau8825_is_jack_inserted(regmap)) {
+			nau8825_configure_sysclk(nau8825,
+						 NAU8825_CLK_INTERNAL, 0);
+		} else {
+			nau8825_configure_sysclk(nau8825, NAU8825_CLK_DIS, 0);
+		}
+	}
+
+	return 0;
+}
+
 static int nau8825_biq_coeff_get(struct snd_kcontrol *kcontrol,
 				     struct snd_ctl_elem_value *ucontrol)
 {
@@ -1094,6 +1120,9 @@ static const struct snd_kcontrol_new nau8825_dacr_mux =
 static const struct snd_soc_dapm_widget nau8825_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("AIFTX", "Capture", 0, NAU8825_REG_I2S_PCM_CTRL2,
 		15, 1),
+	SND_SOC_DAPM_AIF_IN("AIFRX", "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_SUPPLY("System Clock", SND_SOC_NOPM, 0, 0,
+			    system_clock_control, SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_INPUT("MIC"),
 	SND_SOC_DAPM_MICBIAS("MICBIAS", NAU8825_REG_MIC_BIAS, 8, 0),
@@ -1182,9 +1211,11 @@ static const struct snd_soc_dapm_route nau8825_dapm_routes[] = {
 	{"ADC", NULL, "ADC Clock"},
 	{"ADC", NULL, "ADC Power"},
 	{"AIFTX", NULL, "ADC"},
+	{"AIFTX", NULL, "System Clock"},
 
-	{"DDACL", NULL, "Playback"},
-	{"DDACR", NULL, "Playback"},
+	{"AIFRX", NULL, "System Clock"},
+	{"DDACL", NULL, "AIFRX"},
+	{"DDACR", NULL, "AIFRX"},
 	{"DDACL", NULL, "DDAC Clock"},
 	{"DDACR", NULL, "DDAC Clock"},
 	{"DACL Mux", "DACL", "DDACL"},
-- 
2.25.1

