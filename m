Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E428B89AF0F
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:19:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55B701A2D;
	Sun,  7 Apr 2024 09:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55B701A2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474365;
	bh=+FFguuWjmpl99xzEjdNjMqKEsp079adJwqAqXV6U1yA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dHtCsyzBtzO/rakhQG8/6x3kDzJ/uVEpHnSTEbXGJqeu3mtLKRtWV3JFo4jLol9fr
	 PvZ6Yf4h2PiKWJDqFSqgKrG6ex2VAhmJvtJykfuXPOqZQuBZtSyxnBGaUIO2vKen6m
	 DEXAfmZsXPJokscP/0hpNLFqaG3jgLNa6a+qGK1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7FB7F80689; Sun,  7 Apr 2024 09:17:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD206F80685;
	Sun,  7 Apr 2024 09:17:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BA8EF8057A; Tue,  2 Apr 2024 09:12:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F324F8057E
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F324F8057E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ozIq5YGe
Received: by mail.gandi.net (Postfix) with ESMTPA id 24E0BFF809;
	Tue,  2 Apr 2024 07:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOE+gMok9O7xOxfyDenN7oiNfzS579Yi+szYYcmC2sQ=;
	b=ozIq5YGeWp2nIAyMNlSLn5hjNh/fD8pPFu2OxUqr8I827c8oDovhNzoxmqZ2e/g1q5dqwa
	flsAjv9P+ThwbgFVQEtwdbKj3bwsT40toiweRCc5gn9dHR0F3vL59SDiMXBRzFmeTYWA7S
	kL0ud3k09Xc+neLQd4Yta0+Im6MyuQRX+vMnfpEtepT+Tkptc8Oi3f3cbj6tC/zCGjulQ1
	6kswrgHBbFeqFqyJ1k9AoOGGARKHP6x7U8dYtSnrcHZSz2BjcLIeihLVH5wwu5lexDVZgP
	2m9k8Tj03vdLOdQaO2OU1FvufwQoSgdc7gUaxmWn5jbRWWOhRQI8o5n67EWeXA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH v2 07/13] ASoC: ti: davinci-i2s: Add TDM support
Date: Tue,  2 Apr 2024 09:12:07 +0200
Message-ID: <20240402071213.11671-8-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AJNZECBLKDNA43YGPQYH76HKGABY3CEE
X-Message-ID-Hash: AJNZECBLKDNA43YGPQYH76HKGABY3CEE
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:14:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AJNZECBLKDNA43YGPQYH76HKGABY3CEE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

TDM is not supported by the McBSP driver. The McBSP datasheet does not
name explicitly TDM as a supported format but it is possible to configure
the McBSP to do TDM if all slots are used by McBSP.

Add TDM support. It uses single-phase frame. Slot width is used to
compute the McBSP's word length.

Implement the set_tdm_slot() hook of snd_soc_dai_ops struct. It only
supports TDM if all slots are used by McBSP.

The snd_soc_dai_driver's channels_max is updated from 2 to 128.

This was tested with BP_FC format on a platform designed off of
DAVINCI/OMAP_L138. A check is done in davinci_i2s_set_dai_fmt() to
prevent TDM to be used with BC_FC and BC_FP formats.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 92 +++++++++++++++++++++++++++++++++++---
 1 file changed, 87 insertions(+), 5 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index a2c7c812ea50..f9a67c2bc2f5 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -160,6 +160,9 @@ struct davinci_mcbsp_dev {
 	unsigned int fmt;
 	int clk_div;
 	bool i2s_accurate_sck;
+
+	int tdm_slots;
+	int slot_width;
 };
 
 static inline void davinci_mcbsp_write_reg(struct davinci_mcbsp_dev *dev,
@@ -213,6 +216,63 @@ static void davinci_mcbsp_stop(struct davinci_mcbsp_dev *dev, int playback)
 	toggle_clock(dev, playback);
 }
 
+static int davinci_i2s_tdm_word_length(int tdm_slot_width)
+{
+	switch (tdm_slot_width) {
+	case 8:
+		return DAVINCI_MCBSP_WORD_8;
+	case 12:
+		return DAVINCI_MCBSP_WORD_12;
+	case 16:
+		return DAVINCI_MCBSP_WORD_16;
+	case 20:
+		return DAVINCI_MCBSP_WORD_20;
+	case 24:
+		return DAVINCI_MCBSP_WORD_24;
+	case 32:
+		return DAVINCI_MCBSP_WORD_32;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int davinci_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
+				    unsigned int tx_mask,
+				    unsigned int rx_mask,
+				    int slots, int slot_width)
+{
+	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
+
+	dev_dbg(dev->dev, "slots %d, slot_width %d\n", slots, slot_width);
+
+	if (slots > 128 || !slots) {
+		dev_err(dev->dev, "Invalid number of slots\n");
+		return -EINVAL;
+	}
+
+	if (rx_mask != (1 << slots) - 1) {
+		dev_err(dev->dev, "Invalid RX mask (0x%08x) : all slots must be used by McBSP\n",
+			rx_mask);
+		return -EINVAL;
+	}
+
+	if (tx_mask != (1 << slots) - 1) {
+		dev_err(dev->dev, "Invalid TX mask (0x%08x) : all slots must be used by McBSP\n",
+			tx_mask);
+		return -EINVAL;
+	}
+
+	if (davinci_i2s_tdm_word_length(slot_width) < 0) {
+		dev_err(dev->dev, "%s: Unsupported slot_width %d\n", __func__, slot_width);
+		return -EINVAL;
+	}
+
+	dev->tdm_slots = slots;
+	dev->slot_width = slot_width;
+
+	return 0;
+}
+
 #define DEFAULT_BITPERSAMPLE	16
 
 static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
@@ -238,6 +298,11 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 			DAVINCI_MCBSP_PCR_CLKRM;
 		break;
 	case SND_SOC_DAIFMT_BC_FP:
+		if (dev->tdm_slots || dev->slot_width) {
+			dev_err(dev->dev, "TDM is not supported for BC_FP format\n");
+			return -EINVAL;
+		}
+
 		/*
 		 * McBSP CLKR pin is the input for the Sample Rate Generator.
 		 * McBSP FSR and FSX are driven by the Sample Rate Generator.
@@ -246,6 +311,11 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 		pcr |= DAVINCI_MCBSP_PCR_SCLKME;
 		break;
 	case SND_SOC_DAIFMT_BC_FC:
+		if (dev->tdm_slots || dev->slot_width) {
+			dev_err(dev->dev, "TDM is not supported for BC_FC format\n");
+			return -EINVAL;
+		}
+
 		/* codec is master */
 		pcr = 0;
 		break;
@@ -383,7 +453,13 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	master = dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
 	fmt = params_format(params);
-	mcbsp_word_length = asp_word_length[fmt];
+	if (dev->slot_width)
+		mcbsp_word_length = davinci_i2s_tdm_word_length(dev->slot_width);
+	else
+		mcbsp_word_length = asp_word_length[fmt];
+
+	if (mcbsp_word_length < 0)
+		return mcbsp_word_length;
 
 	switch (master) {
 	case SND_SOC_DAIFMT_BP_FP:
@@ -483,8 +559,13 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 	switch (master) {
 	case SND_SOC_DAIFMT_BP_FP:
 	case SND_SOC_DAIFMT_BP_FC:
-		rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(0);
-		xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(0);
+		if (dev->tdm_slots > 0) {
+			rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(dev->tdm_slots - 1);
+			xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(dev->tdm_slots - 1);
+		} else {
+			rcr |= DAVINCI_MCBSP_RCR_RFRLEN1(0);
+			xcr |= DAVINCI_MCBSP_XCR_XFRLEN1(0);
+		}
 		break;
 	case SND_SOC_DAIFMT_BC_FC:
 	case SND_SOC_DAIFMT_BC_FP:
@@ -609,19 +690,20 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 	.hw_params	= davinci_i2s_hw_params,
 	.set_fmt	= davinci_i2s_set_dai_fmt,
 	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
+	.set_tdm_slot   = davinci_i2s_set_tdm_slot,
 
 };
 
 static struct snd_soc_dai_driver davinci_i2s_dai = {
 	.playback = {
 		.channels_min = 2,
-		.channels_max = 2,
+		.channels_max = 128,
 		.rates = DAVINCI_I2S_RATES,
 		.formats = DAVINCI_I2S_FORMATS,
 	},
 	.capture = {
 		.channels_min = 2,
-		.channels_max = 2,
+		.channels_max = 128,
 		.rates = DAVINCI_I2S_RATES,
 		.formats = DAVINCI_I2S_FORMATS,
 	},
-- 
2.44.0

