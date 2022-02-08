Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2E44AD3DF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 09:44:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45A0C17B4;
	Tue,  8 Feb 2022 09:44:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45A0C17B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644309891;
	bh=EMgl9YEL6+hCclbsIjolBHIXljey9EYSovYsiw41TGg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YhAyX3wLLaBZxuShZYUUZtx/BU/pYYwj364H0ApZANiksolImQHq+/AshjDRoaPJ6
	 z61DXmr8JymgzPseRYRnb1lW23N55ygejkRsQCRkYwU2zBvrMxJ7HFPuq6rZPCwFYC
	 yJ7njzjtE7pYHwNm5ffX+TFEXPTyMuMaAfgCGdlY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EBDEF8051B;
	Tue,  8 Feb 2022 09:42:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C775F8051B; Tue,  8 Feb 2022 09:42:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60B4FF8012B
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 09:42:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60B4FF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cogentembedded-com.20210112.gappssmtp.com
 header.i=@cogentembedded-com.20210112.gappssmtp.com header.b="s/dW6xKS"
Received: by mail-lf1-x12f.google.com with SMTP id k13so31882910lfg.9
 for <alsa-devel@alsa-project.org>; Tue, 08 Feb 2022 00:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WW/JZAMcHGwsu/aVKbZpcWKcH0tV5XFvXiTi6TpD/iM=;
 b=s/dW6xKSwn0E1ynwQfrMtagbanfi8I/MD/YsKH4d1q/ZgoSq04BvtcEI8wkWcxb05v
 kkW1hhq7jtkkqJKM8XoBQUam6wxWwUXsC9GuqWwGorHmsRJaUVSQHqFR6yYc+dzOVM5o
 Gs1RNdnxm7CgqnNqX5dL3MWcktyVp1YVuYtbgIGOvPyVbjItwN/73aIFk9CymvENye7F
 zffWwXb/3TFSQrHmsTo97z/Q1R65+vRDVKMqxx/Ws5CLax/8MGSH7W7xEDElYnDuJ1xF
 ycHqVTCU/Pm3SWL7+OzymBJVQsYkWh7vb6LRoFusWYDfWYLrvpNCYEIDgzcZ+ZxF+LeR
 5SYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WW/JZAMcHGwsu/aVKbZpcWKcH0tV5XFvXiTi6TpD/iM=;
 b=f2jpwOG7RFotHUCFoRZmuWrMDa0okXi8Rw/gf0i/equNWjCj/Xm7jw/T1ZBgjCDtwQ
 xmigGAfhOgXZAV2g+TtmqQkxt/jFXHejSAdk+o+ABuqbVbvWPTenCej1w4dsmrY3VVT8
 uA7gzpRS7IaZpKe+T0MO3GdWTmxnEgx3KpNFLGsyBKI5paQKk2Fswlqjf5oMUKwmM0xo
 DOPqWwS8mtH8Ov9NyW+mHoSd5WZAblqGsG0rbTOL9O9/LEZmpBOgKr5a1FFLM4ag4TPF
 z9a/vajYVbRrt+yAoNU2uzzoqP4ZkP3GdOXWF7Qfd3ODhNfqXLRW9aW9UF0CUDOc2Zv6
 D6Xw==
X-Gm-Message-State: AOAM5334lTWSh5mSjMeQJPOquWquXzlBF9CbyEZb/iZxHsczaYlf/hix
 gpvYRcFwhJE228pp3OZqb3J6SA==
X-Google-Smtp-Source: ABdhPJxRogpGR1JTxiEnIH+idlt+2Csfb5uit/sYazWB9tshUteT6LOqweKxQThophAaMSV7PRVHJg==
X-Received: by 2002:a05:6512:3404:: with SMTP id
 i4mr2266933lfr.389.1644309763770; 
 Tue, 08 Feb 2022 00:42:43 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id o12sm1830361lfu.96.2022.02.08.00.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 00:42:43 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/4] ASoC: pcm3168a: refactor format handling
Date: Tue,  8 Feb 2022 11:42:19 +0300
Message-Id: <20220208084220.1289836-4-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220208084220.1289836-1-nikita.yoush@cogentembedded.com>
References: <20220208084220.1289836-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

- drop incomplete (not tdm-aware) calculation/setting of hardware
  fmt value from pcm3168a_set_dai_fmt(); instead, store original
  SND_SOC_DAIFMT* setting in io_params

- in pcm3168a_hw_params(), do all checks in terms of SND_SOC_DAIFMT*,
  and convert that to register bitfield values only to write to
  hardware

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 sound/soc/codecs/pcm3168a.c | 84 ++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 526e4562ccb5..1d3821f2c5f1 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -50,7 +50,7 @@ static const char *const pcm3168a_supply_names[PCM3168A_NUM_SUPPLIES] = {
 /* ADC/DAC side parameters */
 struct pcm3168a_io_params {
 	bool master_mode;
-	unsigned int fmt;
+	unsigned int format;
 	int tdm_slots;
 	u32 tdm_mask;
 	int slot_width;
@@ -328,10 +328,11 @@ static void pcm3168a_update_fixup_pcm_stream(struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
 	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
+	struct pcm3168a_io_params *io_params = &pcm3168a->io_params[dai->id];
 	u64 formats = SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S24_LE;
 	unsigned int channel_max = dai->id == PCM3168A_DAI_DAC ? 8 : 6;
 
-	if (pcm3168a->io_params[dai->id].fmt == PCM3168A_FMT_RIGHT_J) {
+	if (io_params->format == SND_SOC_DAIFMT_RIGHT_J) {
 		/* S16_LE is only supported in RIGHT_J mode */
 		formats |= SNDRV_PCM_FMTBIT_S16_LE;
 
@@ -339,7 +340,7 @@ static void pcm3168a_update_fixup_pcm_stream(struct snd_soc_dai *dai)
 		 * If multi DIN/DOUT is not selected, RIGHT_J can only support
 		 * two channels (no TDM support)
 		 */
-		if (pcm3168a->io_params[dai->id].tdm_slots != 2)
+		if (io_params->tdm_slots != 2)
 			channel_max = 2;
 	}
 
@@ -356,24 +357,15 @@ static int pcm3168a_set_dai_fmt(struct snd_soc_dai *dai, unsigned int format)
 {
 	struct snd_soc_component *component = dai->component;
 	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
-	u32 fmt, reg, mask, shift;
+	struct pcm3168a_io_params *io_params = &pcm3168a->io_params[dai->id];
 	bool master_mode;
 
 	switch (format & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_LEFT_J:
-		fmt = PCM3168A_FMT_LEFT_J;
-		break;
 	case SND_SOC_DAIFMT_I2S:
-		fmt = PCM3168A_FMT_I2S;
-		break;
 	case SND_SOC_DAIFMT_RIGHT_J:
-		fmt = PCM3168A_FMT_RIGHT_J;
-		break;
 	case SND_SOC_DAIFMT_DSP_A:
-		fmt = PCM3168A_FMT_DSP_A;
-		break;
 	case SND_SOC_DAIFMT_DSP_B:
-		fmt = PCM3168A_FMT_DSP_B;
 		break;
 	default:
 		dev_err(component->dev, "unsupported dai format\n");
@@ -399,20 +391,8 @@ static int pcm3168a_set_dai_fmt(struct snd_soc_dai *dai, unsigned int format)
 		return -EINVAL;
 	}
 
-	if (dai->id == PCM3168A_DAI_DAC) {
-		reg = PCM3168A_DAC_PWR_MST_FMT;
-		mask = PCM3168A_DAC_FMT_MASK;
-		shift = PCM3168A_DAC_FMT_SHIFT;
-	} else {
-		reg = PCM3168A_ADC_MST_FMT;
-		mask = PCM3168A_ADC_FMTAD_MASK;
-		shift = PCM3168A_ADC_FMTAD_SHIFT;
-	}
-
-	pcm3168a->io_params[dai->id].master_mode = master_mode;
-	pcm3168a->io_params[dai->id].fmt = fmt;
-
-	regmap_update_bits(pcm3168a->regmap, reg, mask, fmt << shift);
+	io_params->master_mode = master_mode;
+	io_params->format = format & SND_SOC_DAIFMT_FORMAT_MASK;
 
 	pcm3168a_update_fixup_pcm_stream(dai);
 
@@ -461,7 +441,8 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct pcm3168a_priv *pcm3168a = snd_soc_component_get_drvdata(component);
 	struct pcm3168a_io_params *io_params = &pcm3168a->io_params[dai->id];
-	bool master_mode;
+	bool master_mode, tdm_mode;
+	unsigned int format;
 	unsigned int reg, mask, ms, ms_shift, fmt, fmt_shift, ratio, tdm_slots;
 	int i, num_scki_ratios, slot_width;
 
@@ -499,7 +480,7 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 		ms = 0;
 	}
 
-	fmt = io_params->fmt;
+	format = io_params->format;
 
 	if (io_params->slot_width)
 		slot_width = io_params->slot_width;
@@ -508,15 +489,14 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 
 	switch (slot_width) {
 	case 16:
-		if (master_mode || (fmt != PCM3168A_FMT_RIGHT_J)) {
+		if (master_mode || (format != SND_SOC_DAIFMT_RIGHT_J)) {
 			dev_err(component->dev, "16-bit slots are supported only for slave mode using right justified\n");
 			return -EINVAL;
 		}
-		fmt = PCM3168A_FMT_RIGHT_J_16;
 		break;
 	case 24:
-		if (master_mode || (fmt == PCM3168A_FMT_DSP_A) ||
-				   (fmt == PCM3168A_FMT_DSP_B)) {
+		if (master_mode || (format == SND_SOC_DAIFMT_DSP_A) ||
+				   (format == SND_SOC_DAIFMT_DSP_B)) {
 			dev_err(component->dev, "24-bit slots not supported in master mode, or slave mode using DSP\n");
 			return -EINVAL;
 		}
@@ -541,15 +521,14 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 	 * If pcm3168a->tdm_slots is set to 2 then DIN1/2/3/4 and DOUT1/2/3 is
 	 * used in normal mode, no need to switch to TDM modes.
 	 */
-	if (tdm_slots > 2) {
-		switch (fmt) {
-		case PCM3168A_FMT_I2S:
-		case PCM3168A_FMT_DSP_A:
-			fmt = PCM3168A_FMT_I2S_TDM;
-			break;
-		case PCM3168A_FMT_LEFT_J:
-		case PCM3168A_FMT_DSP_B:
-			fmt = PCM3168A_FMT_LEFT_J_TDM;
+	tdm_mode = (tdm_slots > 2);
+
+	if (tdm_mode) {
+		switch (format) {
+		case SND_SOC_DAIFMT_I2S:
+		case SND_SOC_DAIFMT_DSP_A:
+		case SND_SOC_DAIFMT_LEFT_J:
+		case SND_SOC_DAIFMT_DSP_B:
 			break;
 		default:
 			dev_err(component->dev,
@@ -558,6 +537,27 @@ static int pcm3168a_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
+	switch (format) {
+	case SND_SOC_DAIFMT_I2S:
+		fmt = tdm_mode ? PCM3168A_FMT_I2S_TDM : PCM3168A_FMT_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		fmt = tdm_mode ? PCM3168A_FMT_LEFT_J_TDM : PCM3168A_FMT_LEFT_J;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		fmt = (slot_width == 16) ? PCM3168A_FMT_RIGHT_J_16 :
+					   PCM3168A_FMT_RIGHT_J;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		fmt = tdm_mode ? PCM3168A_FMT_I2S_TDM : PCM3168A_FMT_DSP_A;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		fmt = tdm_mode ? PCM3168A_FMT_LEFT_J_TDM : PCM3168A_FMT_DSP_B;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	regmap_update_bits(pcm3168a->regmap, reg, mask,
 			(ms << ms_shift) | (fmt << fmt_shift));
 
-- 
2.30.2

