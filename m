Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C387DCAD
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:00:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C20E2344;
	Sun, 17 Mar 2024 09:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C20E2344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666004;
	bh=MAOpYtzIi5nSAxTwhZTwchxlNt0JYzz6RgEXHKtioD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bpT/xMq4iocawn2n5kkuEfNwJHVw4CuUu99MZJWtTyYyJ8nWNJXoMrNNKCBfE4tgV
	 0XGEaSpF+CcMRcc702ryqpuxjpAL1GQvFuVDfI/0k04utNLI1fOlccJ4WKg/Mj/LJF
	 gS16a+rDjTujJam94nqRxUJzrFsfG9sB7K26lm+Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D258F8060F; Sun, 17 Mar 2024 09:58:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C983F80611;
	Sun, 17 Mar 2024 09:58:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AADBAF8028D; Fri, 15 Mar 2024 12:28:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44C6CF804E7
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44C6CF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DNynfv49
Received: by mail.gandi.net (Postfix) with ESMTPA id A324DE0011;
	Fri, 15 Mar 2024 11:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yx0wGhoCKKR0NqDBheYxgoW20rIDo8sjPDarWAgrdTI=;
	b=DNynfv491FuAHe5AwDyA6vZ1A7uXAvagyCefuAYE4qwxog4M9xv3D1Zez4RQWNcbZqLL/Q
	E2QxtXQz/Up4hN8GWEEK8Z2uwdHnCJt6VggJSwHEOuNRthS1On23nsJvVTrEHTitDAQ3sI
	OlMhdHKE4V8E013Fuy4/gkAsO6Be53YWUfP/7G+TLTD508ldtevYmC0bCvsEKov9HIzrSd
	2LFCTDPf7Snnz3tGRiJ5Qm9fx5gPLjeWVSP0eRmr1iu+WLgHaX4HF3wOpAAS59EqWkzgLV
	RKcnZeUUjunSZZVmEiqMti2lON9sssaBXmRBHRObMC77wpKC8mzwyZKYnr2xbw==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH 07/13] ASoC: ti: davinci-i2s: Add TDM support
Date: Fri, 15 Mar 2024 12:27:39 +0100
Message-ID: <20240315112745.63230-8-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 77BY36CKFWSFXA2S3OAX5WEE5J23YMW3
X-Message-ID-Hash: 77BY36CKFWSFXA2S3OAX5WEE5J23YMW3
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
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

The snd_soc_dai_driver's capture.channels_max is updated from 2 to 128.
128 is the maximum frame length when using single-phase frame.
playback.channels_max has not been updated as I could not test TDM on
playbacks with my hardware.

This was tested on platform designed off of DAVINCI/OMAP_L138 with BP_FC
format so this is only supported format for TDM yet. A check is done in
davinci_i2s_set_dai_fmt() to prevent TDM to be used with other formats

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 sound/soc/ti/davinci-i2s.c | 81 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 77 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index f4514d4dff07..4adaed010700 100644
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
@@ -213,6 +216,57 @@ static void davinci_mcbsp_stop(struct davinci_mcbsp_dev *dev, int playback)
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
+	dev_dbg(dev->dev, "%s - slots %d, slot_width %d\n", __func__, slots, slot_width);
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
@@ -228,6 +282,13 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 		DAVINCI_MCBSP_SRGR_FWID(DEFAULT_BITPERSAMPLE - 1);
 
 	dev->fmt = fmt;
+
+	if ((dev->tdm_slots || dev->slot_width) &&
+	    ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) != SND_SOC_DAIFMT_BP_FC)) {
+		dev_err(dev->dev, "TDM is only supported for BP_FC format\n");
+		return -EINVAL;
+	}
+
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BP_FP:
@@ -383,7 +444,13 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 
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
@@ -483,8 +550,13 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -609,6 +681,7 @@ static const struct snd_soc_dai_ops davinci_i2s_dai_ops = {
 	.hw_params	= davinci_i2s_hw_params,
 	.set_fmt	= davinci_i2s_set_dai_fmt,
 	.set_clkdiv	= davinci_i2s_dai_set_clkdiv,
+	.set_tdm_slot   = davinci_i2s_set_tdm_slot,
 
 };
 
@@ -621,7 +694,7 @@ static struct snd_soc_dai_driver davinci_i2s_dai = {
 	},
 	.capture = {
 		.channels_min = 2,
-		.channels_max = 2,
+		.channels_max = 128,
 		.rates = DAVINCI_I2S_RATES,
 		.formats = DAVINCI_I2S_FORMATS,
 	},
-- 
2.43.2

