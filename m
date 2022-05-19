Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C5552D87A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4C611692;
	Thu, 19 May 2022 17:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4C611692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975166;
	bh=w1AAvOAelPt27DeBFb2Pda0LVgQs0OOakYi/V/op9u8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gaMEJuHd2nohsdASeP2T/nCCnQWbj+qyqoPuljlQcuzEnRnVeSe3USqv7reStuMoL
	 l27vpL/uJ1F1ZrU67qqs9dfb/2hGBw83YWN4Km4BGJ4w0Ppu5J+H21WdZn+juUszTy
	 h9g4ZNkwo3IIzIRfkyuBQQFo6H6b4opylTXKD5uM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0E0CF80588;
	Thu, 19 May 2022 17:43:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C629F80535; Thu, 19 May 2022 17:43:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E305EF800F0
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E305EF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="CAH6IoNo"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtaa024228;
 Thu, 19 May 2022 10:43:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Xj2Gv9Gm2g2J5/zI185gQHXeWNTWv607gvBLqdpZrCk=;
 b=CAH6IoNobGBdLE+I0IU/1MAHBVngbyg1kh8MJeE22k6DfBXLj/B7jp8HmUF3f1Hy7W5H
 ERwrPkeGiq9cULVER49KKgQ/PRCcTSh+ZHBhAPW54VhX5wuipPGCvWeShjImcDrfOxfj
 FUr+l00HkSKEiiucNY2kNG2zOxHzof8qfvQ8cyWG3vN5Heli6dXoL2Fa6fzlhl7FTo4P
 K0lSPt4IrowH6mn7rDBVejZznwtg/2rFdnN6YCr6IcYVw8UtkrLPQfilrz+IzuIatsrU
 tKqcrKiAZs2wbKoC3rocEJBiFPeJCiypZoR+OAFX9kegBdybgVP63zprW1LTnf8DfQ7L 2Q== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:24 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8C10C476;
 Thu, 19 May 2022 15:43:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 03/56] ASoC: atmel: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:25 +0100
Message-ID: <20220519154318.2153729-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -sTSiAKmhVkSFrLgysFDRu5ESSqdV9_s
X-Proofpoint-ORIG-GUID: -sTSiAKmhVkSFrLgysFDRu5ESSqdV9_s
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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

As part of updating the core to directly tell drivers if they are clock
provider or consumer update these CPU side drivers to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/atmel/atmel-i2s.c     |  6 +++---
 sound/soc/atmel/atmel_ssc_dai.c | 20 ++++++++++----------
 sound/soc/atmel/mchp-i2s-mcc.c  | 10 +++++-----
 sound/soc/atmel/mchp-pdmc.c     |  6 +++---
 4 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 1934767690b51..c5ce695da5866 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -343,7 +343,7 @@ static int atmel_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	switch (dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		/* codec is slave, so cpu is master */
 		mr |= ATMEL_I2SC_MR_MODE_MASTER;
 		ret = atmel_i2s_get_gck_param(dev, params_rate(params));
@@ -351,7 +351,7 @@ static int atmel_i2s_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		break;
 
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* codec is master, so cpu is slave */
 		mr |= ATMEL_I2SC_MR_MODE_SLAVE;
 		dev->gck_param = NULL;
@@ -533,7 +533,7 @@ static const struct snd_soc_dai_ops atmel_i2s_dai_ops = {
 	.prepare	= atmel_i2s_prepare,
 	.trigger	= atmel_i2s_trigger,
 	.hw_params	= atmel_i2s_hw_params,
-	.set_fmt	= atmel_i2s_set_dai_fmt,
+	.set_fmt_new	= atmel_i2s_set_dai_fmt,
 };
 
 static int atmel_i2s_dai_probe(struct snd_soc_dai *dai)
diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index c1dea8d624164..da094762dc994 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -210,7 +210,7 @@ static int atmel_ssc_hw_rule_rate(struct snd_pcm_hw_params *params,
 		return frame_size;
 
 	switch (ssc_p->daifmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_BC_FP:
 		if ((ssc_p->dir_mask & SSC_DIR_MASK_CAPTURE)
 		    && ssc->clk_from_rk_pin)
 			/* Receiver Frame Synchro (i.e. capture)
@@ -220,7 +220,7 @@ static int atmel_ssc_hw_rule_rate(struct snd_pcm_hw_params *params,
 			mck_div = 3;
 		break;
 
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		if ((ssc_p->dir_mask & SSC_DIR_MASK_PLAYBACK)
 		    && !ssc->clk_from_rk_pin)
 			/* Transmit Frame Synchro (i.e. playback)
@@ -233,7 +233,7 @@ static int atmel_ssc_hw_rule_rate(struct snd_pcm_hw_params *params,
 	}
 
 	switch (ssc_p->daifmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		r.num = ssc_p->mck_rate / mck_div / frame_size;
 
 		ret = snd_interval_ratnum(i, 1, &r, &num, &den);
@@ -243,8 +243,8 @@ static int atmel_ssc_hw_rule_rate(struct snd_pcm_hw_params *params,
 		}
 		break;
 
-	case SND_SOC_DAIFMT_CBP_CFC:
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FP:
+	case SND_SOC_DAIFMT_BC_FC:
 		t.min = 8000;
 		t.max = ssc_p->mck_rate / mck_div / frame_size;
 		t.openmin = t.openmax = 0;
@@ -433,8 +433,8 @@ static int atmel_ssc_set_dai_clkdiv(struct snd_soc_dai *cpu_dai,
 static int atmel_ssc_cfs(struct atmel_ssc_info *ssc_p)
 {
 	switch (ssc_p->daifmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFC:
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BC_FP:
+	case SND_SOC_DAIFMT_BP_FP:
 		return 1;
 	}
 	return 0;
@@ -444,8 +444,8 @@ static int atmel_ssc_cfs(struct atmel_ssc_info *ssc_p)
 static int atmel_ssc_cbs(struct atmel_ssc_info *ssc_p)
 {
 	switch (ssc_p->daifmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFP:
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FC:
+	case SND_SOC_DAIFMT_BP_FP:
 		return 1;
 	}
 	return 0;
@@ -835,7 +835,7 @@ static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
 	.prepare	= atmel_ssc_prepare,
 	.trigger	= atmel_ssc_trigger,
 	.hw_params	= atmel_ssc_hw_params,
-	.set_fmt	= atmel_ssc_set_dai_fmt,
+	.set_fmt_new	= atmel_ssc_set_dai_fmt,
 	.set_clkdiv	= atmel_ssc_set_dai_clkdiv,
 };
 
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 6d1227a1d67b5..48d434e0c3318 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -350,7 +350,7 @@ static int mchp_i2s_mcc_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 
 	/* We can't generate only FSYNC */
-	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) == SND_SOC_DAIFMT_CBP_CFC)
+	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) == SND_SOC_DAIFMT_BC_FP)
 		return -EINVAL;
 
 	/* We can only reconfigure the IP when it's stopped */
@@ -547,19 +547,19 @@ static int mchp_i2s_mcc_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	switch (dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		/* cpu is BCLK and LRC master */
 		mra |= MCHP_I2SMCC_MRA_MODE_MASTER;
 		if (dev->sysclk)
 			mra |= MCHP_I2SMCC_MRA_IMCKMODE_GEN;
 		set_divs = 1;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BP_FC:
 		/* cpu is BCLK master */
 		mrb |= MCHP_I2SMCC_MRB_CLKSEL_INT;
 		set_divs = 1;
 		fallthrough;
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		/* cpu is slave */
 		mra |= MCHP_I2SMCC_MRA_MODE_SLAVE;
 		if (dev->sysclk)
@@ -877,7 +877,7 @@ static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
 	.trigger	= mchp_i2s_mcc_trigger,
 	.hw_params	= mchp_i2s_mcc_hw_params,
 	.hw_free	= mchp_i2s_mcc_hw_free,
-	.set_fmt	= mchp_i2s_mcc_set_dai_fmt,
+	.set_fmt_new	= mchp_i2s_mcc_set_dai_fmt,
 	.set_tdm_slot	= mchp_i2s_mcc_set_dai_tdm_slot,
 };
 
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index a3856c73e2214..b3f04fa2f6089 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -492,8 +492,8 @@ static int mchp_pdmc_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int fmt_format = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
 
 	/* IP needs to be bitclock master */
-	if (fmt_master != SND_SOC_DAIFMT_CBS_CFS &&
-	    fmt_master != SND_SOC_DAIFMT_CBS_CFM)
+	if (fmt_master != SND_SOC_DAIFMT_BP_FP &&
+	    fmt_master != SND_SOC_DAIFMT_BP_FC)
 		return -EINVAL;
 
 	/* IP supports only PDM interface */
@@ -708,7 +708,7 @@ static int mchp_pdmc_trigger(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
-	.set_fmt	= mchp_pdmc_set_fmt,
+	.set_fmt_new	= mchp_pdmc_set_fmt,
 	.startup	= mchp_pdmc_startup,
 	.shutdown	= mchp_pdmc_shutdown,
 	.hw_params	= mchp_pdmc_hw_params,
-- 
2.30.2

