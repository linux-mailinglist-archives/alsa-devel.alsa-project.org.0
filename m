Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C85EC1DE90A
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 16:33:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F5D31895;
	Fri, 22 May 2020 16:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F5D31895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590158023;
	bh=4xG2gxD1VNoTHAsgthAivOkA8vIh+UV6w6+zhMJTZdk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=il8aKCmUfVALyD9KbK20Dv6EQ75wXX91sZcsAcvIfq6ROox4HayJKYilooVowCp6B
	 FYemZrsObpYIujdofheqrNJ9IFnItsvRagrxDVynsg2uRqZDYjE+TYSFS2AJ/0c7hy
	 FcTJx6s9iCa5EuYI6ssw4rphhLZtwL01eKJ+1Hf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2560FF8028F;
	Fri, 22 May 2020 16:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 512D6F8028F; Fri, 22 May 2020 16:31:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08299F80140
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 16:30:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08299F80140
IronPort-SDR: M8gdB4I53cLmwJGwSgDe/g4CdnQq8/sKT2M0Q86IgE/tyZJORYsYBOTbW9ZG8LcnYpx55kb3QN
 fQm0ewLbBvqAPwawTON5aWuj/oiDjT1HnL6Jhz0lm4UuaW7m+ds4Dq9iWXZI4GP+oUMejBExqZ
 LuZ5gFCPHogzFaibafJFuiMPyav29wAjL7vzu9H8MDiuU9/zfQL1+Hnajh+fzY5DKI4WMlBMWs
 l+ez+t/rMtqq3TtpoCNyJ+DtscHtNgc6d8IaxRsKKL2X9Hc94m/X5VNkud1iMtdXYeu+2QfTbS
 X7w=
X-IronPort-AV: E=Sophos;i="5.73,422,1583190000"; 
   d="scan'208";a="8756862"
From: Pavel Dobias <dobias@2n.cz>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v2 2/2] ASoC: max9867: keep ADCs and DACs always on
Date: Fri, 22 May 2020 16:29:57 +0200
Message-ID: <20200522142957.18364-3-dobias@2n.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200522142957.18364-1-dobias@2n.cz>
References: <20200520130131.GG4823@sirena.org.uk>
 <20200522142957.18364-1-dobias@2n.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX04.axis.com (10.0.5.18)
Cc: broonie@kernel.org, ladis@linux-mips.org, Pavel Dobias <dobias@2n.cz>
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

Updating power management register requires toggling the shutdown
bit otherwise it causes unexpected behavior of the codec.
However, toggling the shutdown bit results in loud speaker crackling.
Setup the power management register only at startup to avoid that.

Signed-off-by: Pavel Dobias <dobias@2n.cz>
---
 sound/soc/codecs/max9867.c | 19 +++++++++----------
 sound/soc/codecs/max9867.h |  1 -
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 3efaa6d8dc3f..c72cb2888c21 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -125,8 +125,8 @@ static const struct snd_soc_dapm_widget max9867_dapm_widgets[] = {
 	SND_SOC_DAPM_INPUT("LINL"),
 	SND_SOC_DAPM_INPUT("LINR"),
 
-	SND_SOC_DAPM_PGA("Left Line Input", MAX9867_PWRMAN, 6, 0, NULL, 0),
-	SND_SOC_DAPM_PGA("Right Line Input", MAX9867_PWRMAN, 5, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Left Line Input", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("Right Line Input", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_MIXER_NAMED_CTL("Input Mixer", SND_SOC_NOPM, 0, 0,
 				     max9867_input_mixer_controls,
 				     ARRAY_SIZE(max9867_input_mixer_controls)),
@@ -134,8 +134,8 @@ static const struct snd_soc_dapm_widget max9867_dapm_widgets[] = {
 			 &max9867_left_dmic_mux),
 	SND_SOC_DAPM_MUX("DMICR Mux", SND_SOC_NOPM, 0, 0,
 			 &max9867_right_dmic_mux),
-	SND_SOC_DAPM_ADC("ADCL", "HiFi Capture", MAX9867_PWRMAN, 1, 0),
-	SND_SOC_DAPM_ADC("ADCR", "HiFi Capture", MAX9867_PWRMAN, 0, 0),
+	SND_SOC_DAPM_ADC("ADCL", "HiFi Capture", SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_ADC("ADCR", "HiFi Capture", SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_MIXER("Digital", SND_SOC_NOPM, 0, 0,
 			   max9867_sidetone_mixer_controls,
@@ -143,8 +143,8 @@ static const struct snd_soc_dapm_widget max9867_dapm_widgets[] = {
 	SND_SOC_DAPM_MIXER_NAMED_CTL("Output Mixer", SND_SOC_NOPM, 0, 0,
 				     max9867_output_mixer_controls,
 				     ARRAY_SIZE(max9867_output_mixer_controls)),
-	SND_SOC_DAPM_DAC("DACL", "HiFi Playback", MAX9867_PWRMAN, 3, 0),
-	SND_SOC_DAPM_DAC("DACR", "HiFi Playback", MAX9867_PWRMAN, 2, 0),
+	SND_SOC_DAPM_DAC("DACL", "HiFi Playback", SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC("DACR", "HiFi Playback", SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_SWITCH("Master Playback", SND_SOC_NOPM, 0, 0,
 			    &max9867_line_out_control),
 	SND_SOC_DAPM_OUTPUT("LOUT"),
@@ -452,15 +452,14 @@ static int max9867_set_bias_level(struct snd_soc_component *component,
 			if (err)
 				return err;
 
-			err = regmap_update_bits(max9867->regmap, MAX9867_PWRMAN,
-						 MAX9867_SHTDOWN, MAX9867_SHTDOWN);
+			err = regmap_write(max9867->regmap,
+					   MAX9867_PWRMAN, 0xff);
 			if (err)
 				return err;
 		}
 		break;
 	case SND_SOC_BIAS_OFF:
-		err = regmap_update_bits(max9867->regmap, MAX9867_PWRMAN,
-					 MAX9867_SHTDOWN, 0);
+		err = regmap_write(max9867->regmap, MAX9867_PWRMAN, 0);
 		if (err)
 			return err;
 
diff --git a/sound/soc/codecs/max9867.h b/sound/soc/codecs/max9867.h
index d459d49449cb..3092c3b99075 100644
--- a/sound/soc/codecs/max9867.h
+++ b/sound/soc/codecs/max9867.h
@@ -58,7 +58,6 @@
 #define MAX9867_MICCONFIG    0x15
 #define MAX9867_MODECONFIG   0x16
 #define MAX9867_PWRMAN       0x17
-#define MAX9867_SHTDOWN      0x80
 #define MAX9867_REVISION     0xff
 
 #define MAX9867_CACHEREGNUM 10
-- 
2.20.1

