Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3AB40CC68
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 20:12:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A10171845;
	Wed, 15 Sep 2021 20:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A10171845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631729550;
	bh=WfFgzCld6IRG7OXwcQ6+o3ox4fFUVatqXkI3jZC3ID0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LBd3g6x9IzPZMxzAfMo1DnabV02jmOIBhnR6nu1U9lysNQc938EozIBss/EY9O2//
	 zU3skqcwiInWeAU/M8QOnb4Tyhmh3aPjr1TjVQoBxptGaPZfQRPty2nGMHO60Yd/Gb
	 FOITjFovye1bozROltj5kua4vLE5ikekBkdphzl0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B055AF8032C;
	Wed, 15 Sep 2021 20:11:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F39EF804E2; Wed, 15 Sep 2021 20:11:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98BE9F80117
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 20:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98BE9F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OKYL9/Ph"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C559611C4;
 Wed, 15 Sep 2021 18:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631729489;
 bh=WfFgzCld6IRG7OXwcQ6+o3ox4fFUVatqXkI3jZC3ID0=;
 h=From:To:Cc:Subject:Date:From;
 b=OKYL9/PhhGhoG7zdJ1SjdXUx/Z4gwj7602KuslNV2NCu/bjkgrwdhW/tBMf+fcAit
 uwl3tuf2iunpMpTToF6cUICcU3/qprx3T2dFsKyvCztLWBoTHtjDTtS+Dgw/4BGliY
 AVle6QnM94NNPbcjokez83e3gqeC2LUgmgdgYMq2NAg3nGlfCZI5Ku2+xqJEMky066
 0GzNarFemqSt8h0QKEDqr6BeV1TAW9BdC5IT+NN7N5qz3F5eBBUTY7bLIO9Dooilcc
 +0Bi4xrMmIAWUsbunhwcPcFzI0ldLnw3kotzzM0wIQ1p4kjgksupo9N6TzBTHrtpKW
 yU0ju/sVnzS5A==
From: Mark Brown <broonie@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Rosin <peda@axentia.se>
Subject: [PATCH v2] ASoC: atmel: Convert to new style DAI format definitions
Date: Wed, 15 Sep 2021 19:10:48 +0100
Message-Id: <20210915181048.40070-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
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

Convert the Atmel drivers to use the new style defines for clocking in DAI
formats.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/atmel-i2s.c      |  4 ++--
 sound/soc/atmel/atmel_ssc_dai.c  | 18 +++++++++---------
 sound/soc/atmel/atmel_wm8904.c   |  2 +-
 sound/soc/atmel/mchp-i2s-mcc.c   |  8 ++++----
 sound/soc/atmel/mikroe-proto.c   |  4 ++--
 sound/soc/atmel/sam9g20_wm8731.c |  2 +-
 sound/soc/atmel/sam9x5_wm8731.c  |  2 +-
 sound/soc/atmel/tse850-pcm5142.c |  2 +-
 8 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 6b3d9c05eaf2..e119abbca099 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -343,7 +343,7 @@ static int atmel_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	switch (dev->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		/* codec is slave, so cpu is master */
 		mr |= ATMEL_I2SC_MR_MODE_MASTER;
 		ret = atmel_i2s_get_gck_param(dev, params_rate(params));
@@ -351,7 +351,7 @@ static int atmel_i2s_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		break;
 
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		/* codec is master, so cpu is slave */
 		mr |= ATMEL_I2SC_MR_MODE_SLAVE;
 		dev->gck_param = NULL;
diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index 6a63e8797a0b..b34e995c59e4 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -210,7 +210,7 @@ static int atmel_ssc_hw_rule_rate(struct snd_pcm_hw_params *params,
 		return frame_size;
 
 	switch (ssc_p->daifmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		if ((ssc_p->dir_mask & SSC_DIR_MASK_CAPTURE)
 		    && ssc->clk_from_rk_pin)
 			/* Receiver Frame Synchro (i.e. capture)
@@ -220,7 +220,7 @@ static int atmel_ssc_hw_rule_rate(struct snd_pcm_hw_params *params,
 			mck_div = 3;
 		break;
 
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		if ((ssc_p->dir_mask & SSC_DIR_MASK_PLAYBACK)
 		    && !ssc->clk_from_rk_pin)
 			/* Transmit Frame Synchro (i.e. playback)
@@ -233,7 +233,7 @@ static int atmel_ssc_hw_rule_rate(struct snd_pcm_hw_params *params,
 	}
 
 	switch (ssc_p->daifmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		r.num = ssc_p->mck_rate / mck_div / frame_size;
 
 		ret = snd_interval_ratnum(i, 1, &r, &num, &den);
@@ -243,8 +243,8 @@ static int atmel_ssc_hw_rule_rate(struct snd_pcm_hw_params *params,
 		}
 		break;
 
-	case SND_SOC_DAIFMT_CBM_CFS:
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		t.min = 8000;
 		t.max = ssc_p->mck_rate / mck_div / frame_size;
 		t.openmin = t.openmax = 0;
@@ -430,8 +430,8 @@ static int atmel_ssc_set_dai_clkdiv(struct snd_soc_dai *cpu_dai,
 static int atmel_ssc_cfs(struct atmel_ssc_info *ssc_p)
 {
 	switch (ssc_p->daifmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFS:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		return 1;
 	}
 	return 0;
@@ -441,8 +441,8 @@ static int atmel_ssc_cfs(struct atmel_ssc_info *ssc_p)
 static int atmel_ssc_cbs(struct atmel_ssc_info *ssc_p)
 {
 	switch (ssc_p->daifmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFM:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		return 1;
 	}
 	return 0;
diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index 9e237580afa9..9c974c4e187d 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -66,7 +66,7 @@ static struct snd_soc_dai_link atmel_asoc_wm8904_dailink = {
 	.stream_name = "WM8904 PCM",
 	.dai_fmt = SND_SOC_DAIFMT_I2S
 		| SND_SOC_DAIFMT_NB_NF
-		| SND_SOC_DAIFMT_CBM_CFM,
+		| SND_SOC_DAIFMT_CBP_CFP,
 	.ops = &atmel_asoc_wm8904_ops,
 	SND_SOC_DAILINK_REG(pcm),
 };
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 8988f024a732..67550e3d9ee3 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -350,7 +350,7 @@ static int mchp_i2s_mcc_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 
 	/* We can't generate only FSYNC */
-	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) == SND_SOC_DAIFMT_CBM_CFS)
+	if ((fmt & SND_SOC_DAIFMT_MASTER_MASK) == SND_SOC_DAIFMT_CBP_CFC)
 		return -EINVAL;
 
 	/* We can only reconfigure the IP when it's stopped */
@@ -547,19 +547,19 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	switch (dev->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		/* cpu is BCLK and LRC master */
 		mra |= MCHP_I2SMCC_MRA_MODE_MASTER;
 		if (dev->sysclk)
 			mra |= MCHP_I2SMCC_MRA_IMCKMODE_GEN;
 		set_divs = 1;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_CBC_CFP:
 		/* cpu is BCLK master */
 		mrb |= MCHP_I2SMCC_MRB_CLKSEL_INT;
 		set_divs = 1;
 		fallthrough;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		/* cpu is slave */
 		mra |= MCHP_I2SMCC_MRA_MODE_SLAVE;
 		if (dev->sysclk)
diff --git a/sound/soc/atmel/mikroe-proto.c b/sound/soc/atmel/mikroe-proto.c
index 0be7b4221c14..f9331f7e80fe 100644
--- a/sound/soc/atmel/mikroe-proto.c
+++ b/sound/soc/atmel/mikroe-proto.c
@@ -129,9 +129,9 @@ static int snd_proto_probe(struct platform_device *pdev)
 	}
 	if (bitclkmaster) {
 		if (codec_np == bitclkmaster)
-			dai_fmt |= SND_SOC_DAIFMT_CBM_CFM;
+			dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
 		else
-			dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
+			dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
 	} else {
 		dai_fmt |= snd_soc_daifmt_parse_clock_provider_as_flag(np, NULL);
 	}
diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index ed1f69b57024..915da92e1ec8 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -126,7 +126,7 @@ static struct snd_soc_dai_link at91sam9g20ek_dai = {
 	.stream_name = "WM8731 PCM",
 	.init = at91sam9g20ek_wm8731_init,
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBM_CFM,
+		   SND_SOC_DAIFMT_CBP_CFP,
 	SND_SOC_DAILINK_REG(pcm),
 };
 
diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index 7745250fd743..7c45dc4f8c1b 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -115,7 +115,7 @@ static int sam9x5_wm8731_driver_probe(struct platform_device *pdev)
 	dai->codecs->dai_name = "wm8731-hifi";
 	dai->init = sam9x5_wm8731_init;
 	dai->dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF
-		| SND_SOC_DAIFMT_CBM_CFM;
+		| SND_SOC_DAIFMT_CBP_CFP;
 
 	ret = snd_soc_of_parse_card_name(card, "atmel,model");
 	if (ret) {
diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
index 50c3dc6936f9..1b3a31296c9b 100644
--- a/sound/soc/atmel/tse850-pcm5142.c
+++ b/sound/soc/atmel/tse850-pcm5142.c
@@ -304,7 +304,7 @@ static struct snd_soc_dai_link tse850_dailink = {
 	.stream_name = "TSE-850-PCM",
 	.dai_fmt = SND_SOC_DAIFMT_I2S
 		 | SND_SOC_DAIFMT_NB_NF
-		 | SND_SOC_DAIFMT_CBM_CFS,
+		 | SND_SOC_DAIFMT_CBP_CFC,
 	SND_SOC_DAILINK_REG(pcm),
 };
 
-- 
2.20.1

