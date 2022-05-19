Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F2C52D8B0
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:47:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10E361632;
	Thu, 19 May 2022 17:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10E361632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975238;
	bh=QVrbZ6wxW/CGr4ozwBILlf6VklJrpheAYkMHAiXjA5Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/WZXj5VJyQX1PW+rs3/zSIt5VyeRSJxRvHxp3lWmhYk1nDhRuGyctwyxNdeN13kM
	 V5F196QHcplQrwnn5WOpRAzAUIBgIMEsRK3+E4EyQXB9C+EOiwuGR8WJ7QlhXaJdNQ
	 hoMtxS2t/lVk+KMAJpFKRxwdoDvaz9f3yBwfcX0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D8EFF8051C;
	Thu, 19 May 2022 17:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A872F8057D; Thu, 19 May 2022 17:43:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB83DF8051F
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB83DF8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="k8jqS5Kq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW3012194;
 Thu, 19 May 2022 10:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=QWGxPrxVtFm+ch47fPmaDYCLhGIbEJL7uvqlM4S3iww=;
 b=k8jqS5KqIwT/A0SfwAxfT8H8o0hIu5XXPQjdwQL6ALQqAILOhShblXHzE1eiHUFCQzAj
 jWpzLC2mfmV70TA4vDvMoVtUi3vcKBMx9+yykt/DZuqul5peS7MkV8RMjEbm8tc/F6CE
 NJEZspovLEavMfXY+maFY4nf90E54ISuXkhLk3QQ14cy0SN6GFtaEXqhPtSNKswlp0+O
 Kn19XBPVrfhjiCYYatMZz/V6/6j5QXwPFRSu/08KyuXUe0uXxpFJeFjprRLUnttXZh8y
 jFeRn9mgQaPDVW9KaArgPW1k6n4p8syaaceTbyDtJtYHWRKaKq27MQJGsMps+zVNA/vZ Hg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:31 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CE76011D3;
 Thu, 19 May 2022 15:43:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 20/56] ASoC: sh: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:42 +0100
Message-ID: <20220519154318.2153729-21-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: dSYIdavaSRil3PHyQkx5BJ_gEjfqh0Kd
X-Proofpoint-ORIG-GUID: dSYIdavaSRil3PHyQkx5BJ_gEjfqh0Kd
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
 sound/soc/sh/fsi.c       |  8 ++++----
 sound/soc/sh/rcar/core.c |  6 +++---
 sound/soc/sh/rz-ssi.c    |  4 ++--
 sound/soc/sh/ssi.c       | 12 ++++++------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index e9a1eb6bdf66a..4058d60b7e931 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -1646,10 +1646,10 @@ static int fsi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	int ret;
 
 	/* set clock master audio interface */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		fsi->clk_master = 1; /* cpu is master */
 		break;
 	default:
@@ -1724,7 +1724,7 @@ static const struct snd_soc_dai_ops fsi_dai_ops = {
 	.startup	= fsi_dai_startup,
 	.shutdown	= fsi_dai_shutdown,
 	.trigger	= fsi_dai_trigger,
-	.set_fmt	= fsi_dai_set_fmt,
+	.set_fmt_new	= fsi_dai_set_fmt,
 	.hw_params	= fsi_dai_hw_params,
 	.auto_selectable_formats	= &fsi_dai_formats,
 	.num_auto_selectable_formats	= 1,
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index eb762ab94d3ed..0ac15b74c58a8 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -756,10 +756,10 @@ static int rsnd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 
 	/* set clock master for audio interface */
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		rdai->clk_master = 0;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		rdai->clk_master = 1; /* cpu is master */
 		break;
 	default:
@@ -1068,7 +1068,7 @@ static const struct snd_soc_dai_ops rsnd_soc_dai_ops = {
 	.startup	= rsnd_soc_dai_startup,
 	.shutdown	= rsnd_soc_dai_shutdown,
 	.trigger	= rsnd_soc_dai_trigger,
-	.set_fmt	= rsnd_soc_dai_set_fmt,
+	.set_fmt_new	= rsnd_soc_dai_set_fmt,
 	.set_tdm_slot	= rsnd_soc_set_dai_tdm_slot,
 	.prepare	= rsnd_soc_dai_prepare,
 	.auto_selectable_formats	= rsnd_soc_dai_formats,
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index e392de7a262ef..0557d22a089f3 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -767,7 +767,7 @@ static int rz_ssi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct rz_ssi_priv *ssi = snd_soc_dai_get_drvdata(dai);
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		break;
 	default:
 		dev_err(ssi->dev, "Codec should be clk and frame consumer\n");
@@ -840,7 +840,7 @@ static int rz_ssi_dai_hw_params(struct snd_pcm_substream *substream,
 
 static const struct snd_soc_dai_ops rz_ssi_dai_ops = {
 	.trigger	= rz_ssi_dai_trigger,
-	.set_fmt	= rz_ssi_dai_set_fmt,
+	.set_fmt_new	= rz_ssi_dai_set_fmt,
 	.hw_params	= rz_ssi_dai_hw_params,
 };
 
diff --git a/sound/soc/sh/ssi.c b/sound/soc/sh/ssi.c
index 15b01bcefca5c..95571cbeae296 100644
--- a/sound/soc/sh/ssi.c
+++ b/sound/soc/sh/ssi.c
@@ -291,16 +291,16 @@ static int ssi_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		break;
-	case SND_SOC_DAIFMT_CBS_CFM:
+	case SND_SOC_DAIFMT_BP_FC:
 		ssicr |= CR_SCK_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_BC_FP:
 		ssicr |= CR_SWS_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		ssicr |= CR_SWS_MASTER | CR_SCK_MASTER;
 		break;
 	default:
@@ -336,7 +336,7 @@ static const struct snd_soc_dai_ops ssi_dai_ops = {
 	.hw_params	= ssi_hw_params,
 	.set_sysclk	= ssi_set_sysclk,
 	.set_clkdiv	= ssi_set_clkdiv,
-	.set_fmt	= ssi_set_fmt,
+	.set_fmt_new	= ssi_set_fmt,
 };
 
 static struct snd_soc_dai_driver sh4_ssi_dai[] = {
-- 
2.30.2

