Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABA852D87B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:46:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D945B1660;
	Thu, 19 May 2022 17:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D945B1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975183;
	bh=n+vWffKMVNwuAjiWpyFZYGm/WPF/+N84q5Cgg0FssWU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OlHAsvBZaDfTfDlZ4SE3QlTNPk/uLITDN5GPqy47HhE9kPmetSuM8VSsmWmUkBL2J
	 7X/RP+gif3+aCx8YMQ6rPfmIAhHiC3q6PWKR/hed0ONSWKvc8JbGemLBVw4Xm1XsNm
	 Zac4nOtST3hWUR/0cW8JwFjje5HDWuuAe1LZoGuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F09D6F805AF;
	Thu, 19 May 2022 17:43:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8D1FF8054A; Thu, 19 May 2022 17:43:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 359C0F804A9
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 359C0F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="gE7ASeZM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtab024228;
 Thu, 19 May 2022 10:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=emFWkhbKLVsY07EOxiGd6bRhil5YXk3bYL2bmY5jBhs=;
 b=gE7ASeZMhHcJqs5B7NPSes7hj5CyprtFA2EKL8SbShKqYtFabOCjJF7lHKhcfgMUPId6
 H5i5uuPx0JpJd6dw/vMuYJ+ycfQdTOSeTcUCpx+ZuPweP8ubw1xH/HQQC37a0o+4gLx0
 fmHIihOvrpnz60EkaRyDiWbmh8WzfP82quKCUXDQX+9ituAlqgSramhvSb+2sjA24+z/
 /+KxTsJxKeUDCdhzA1XWFYzN6sOx6Hde58g5TSNOnX/zY2nRBMIDoxDU5xbO3i8DyeWo
 bRwfWm722KdAMsBkUjmhOkZSurVQfRgJhxECR6BjHDc9bNdtsxML3x7OofG/TG9f2T/4 QQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B4557475;
 Thu, 19 May 2022 15:43:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 05/56] ASoC: bcm: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:27 +0100
Message-ID: <20220519154318.2153729-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ajhifK472w28_I4WDVyEuSohJoIsbKCp
X-Proofpoint-ORIG-GUID: ajhifK472w28_I4WDVyEuSohJoIsbKCp
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
 sound/soc/bcm/bcm2835-i2s.c | 22 +++++++++++-----------
 sound/soc/bcm/cygnus-ssp.c  |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
index e3fc4bee8cfdc..aa7d8e081f89a 100644
--- a/sound/soc/bcm/bcm2835-i2s.c
+++ b/sound/soc/bcm/bcm2835-i2s.c
@@ -133,8 +133,8 @@ static void bcm2835_i2s_start_clock(struct bcm2835_i2s_dev *dev)
 		return;
 
 	switch (provider) {
-	case SND_SOC_DAIFMT_CBC_CFC:
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_BP_FC:
 		clk_prepare_enable(dev->clk);
 		dev->clk_prepared = true;
 		break;
@@ -385,12 +385,12 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	/* Check if CPU is bit clock provider */
 	switch (dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
-	case SND_SOC_DAIFMT_CBC_CFP:
+	case SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_BP_FC:
 		bit_clock_provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBP_CFC:
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FP:
+	case SND_SOC_DAIFMT_BC_FC:
 		bit_clock_provider = false;
 		break;
 	default:
@@ -399,12 +399,12 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	/* Check if CPU is frame sync provider */
 	switch (dev->fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
-	case SND_SOC_DAIFMT_CBP_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
+	case SND_SOC_DAIFMT_BC_FP:
 		frame_sync_provider = true;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFP:
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BP_FC:
+	case SND_SOC_DAIFMT_BC_FC:
 		frame_sync_provider = false;
 		break;
 	default:
@@ -743,7 +743,7 @@ static const struct snd_soc_dai_ops bcm2835_i2s_dai_ops = {
 	.prepare	= bcm2835_i2s_prepare,
 	.trigger	= bcm2835_i2s_trigger,
 	.hw_params	= bcm2835_i2s_hw_params,
-	.set_fmt	= bcm2835_i2s_set_dai_fmt,
+	.set_fmt_new	= bcm2835_i2s_set_dai_fmt,
 	.set_bclk_ratio	= bcm2835_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= bcm2835_i2s_set_dai_tdm_slot,
 };
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 9698f4531c90f..257f3657bcd6e 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -849,11 +849,11 @@ static int cygnus_ssp_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	ssp_newcfg = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		ssp_newcfg |= BIT(I2S_OUT_CFGX_SLAVE_MODE);
 		aio->is_slave = 1;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		ssp_newcfg &= ~BIT(I2S_OUT_CFGX_SLAVE_MODE);
 		aio->is_slave = 0;
 		break;
@@ -1148,7 +1148,7 @@ static const struct snd_soc_dai_ops cygnus_ssp_dai_ops = {
 	.shutdown	= cygnus_ssp_shutdown,
 	.trigger	= cygnus_ssp_trigger,
 	.hw_params	= cygnus_ssp_hw_params,
-	.set_fmt	= cygnus_ssp_set_fmt,
+	.set_fmt_new	= cygnus_ssp_set_fmt,
 	.set_sysclk	= cygnus_ssp_set_sysclk,
 	.set_tdm_slot	= cygnus_set_dai_tdm_slot,
 };
-- 
2.30.2

