Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E0452D96A
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:53:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5756116F7;
	Thu, 19 May 2022 17:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5756116F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975589;
	bh=onCWVyUYvE1fkQ36nrZ5LFhGuA10d28a9O0+9Q5vRaA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b4PS2JQ+/RS74eVsXAqD3YpR0NQWvO6nqmoEeOhjGarVNhi1mbe2dCxC1N7FsQiFx
	 OsO/SllWeEVVJLhnTMP1Sf163HYYEA25X02lARBzPK90QGcJVfpY46ErrV1iAx2vGC
	 GM0Rmj0sQmEqUlzbob4h10VW9IY1T1oV0j9ZOUg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E8FF80617;
	Thu, 19 May 2022 17:44:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E469F805E5; Thu, 19 May 2022 17:44:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6535F80535
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6535F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZFct4dO4"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtai024228;
 Thu, 19 May 2022 10:43:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=G4zupERH5Zc88BD4UCqDoelauUTmm8cZJDN3JGzAYN0=;
 b=ZFct4dO4+QlcDMWLpgdbammZyn87Ncvb/Vge6R7Ja7CzEHUvRza63Grxbrc2qgmQwk7f
 aeXxP7WnEa8/vDOC+9gMLROQHxUi2ZZv+VOt7j8KcaehCpHpX+jclqlUmOY3bNRrBzEO
 a1p2Aa4FcYWoIbVJgDc+8GSaVcEl5AP/+PLoyuKdUwQjQadBp0PG8fu+zjiAKJw6pbTv
 MOcsJQNrPH8wP8r0RT7fw6CwZs1An8U4eLtJ43r9AuGssnzYAd4UquMGmN3PTMIvbGka
 No4X4qgkRxp0DPTuqazVwi5hWKAAwIf4cEVFNmPTlf/y1GHrKxysgO86yqpI/fdgNQma sg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:34 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:20 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0C7B0475;
 Thu, 19 May 2022 15:43:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 23/56] ASoC: tegra: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:45 +0100
Message-ID: <20220519154318.2153729-24-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EY-pvjFJiKFAevaceF1oiZRIpak7ye6H
X-Proofpoint-ORIG-GUID: EY-pvjFJiKFAevaceF1oiZRIpak7ye6H
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
 sound/soc/tegra/tegra20_i2s.c  | 8 ++++----
 sound/soc/tegra/tegra210_i2s.c | 8 ++++----
 sound/soc/tegra/tegra30_i2s.c  | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index 27365a877e471..9abb0e3536d82 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -95,11 +95,11 @@ static int tegra20_i2s_set_fmt(struct snd_soc_dai *dai,
 	}
 
 	mask |= TEGRA20_I2S_CTRL_MASTER_ENABLE;
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		val |= TEGRA20_I2S_CTRL_MASTER_ENABLE;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		break;
 	default:
 		return -EINVAL;
@@ -311,7 +311,7 @@ static int tegra20_i2s_startup(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
-	.set_fmt	= tegra20_i2s_set_fmt,
+	.set_fmt_new	= tegra20_i2s_set_fmt,
 	.hw_params	= tegra20_i2s_hw_params,
 	.trigger	= tegra20_i2s_trigger,
 	.startup	= tegra20_i2s_startup,
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 9552bbb939dd1..a304948ee3935 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -214,11 +214,11 @@ static int tegra210_i2s_set_fmt(struct snd_soc_dai *dai,
 	unsigned int mask, val;
 
 	mask = I2S_CTRL_MASTER_EN_MASK;
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		val = 0;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		val = I2S_CTRL_MASTER_EN;
 		break;
 	default:
@@ -678,7 +678,7 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops tegra210_i2s_dai_ops = {
-	.set_fmt	= tegra210_i2s_set_fmt,
+	.set_fmt_new	= tegra210_i2s_set_fmt,
 	.hw_params	= tegra210_i2s_hw_params,
 	.set_bclk_ratio	= tegra210_i2s_set_dai_bclk_ratio,
 	.set_tdm_slot	= tegra210_i2s_set_tdm_slot,
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 084a533bf4f2c..a4ea5221de6b4 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -87,11 +87,11 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai *dai,
 	}
 
 	mask |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
 		val |= TEGRA30_I2S_CTRL_MASTER_ENABLE;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_BC_FC:
 		break;
 	default:
 		return -EINVAL;
@@ -304,7 +304,7 @@ static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
-	.set_fmt	= tegra30_i2s_set_fmt,
+	.set_fmt_new	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
 	.set_tdm_slot	= tegra30_i2s_set_tdm,
-- 
2.30.2

