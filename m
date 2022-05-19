Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C87452D8D2
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D956D169D;
	Thu, 19 May 2022 17:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D956D169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975284;
	bh=WtDn33vZ+OdTWVvNULpVKDEGfNQ3XfHnIzJJdKQW240=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vnSyJUVGi7OMZ9DeZlSM4dET2yqZXTz5Ysi/ZGbEr7sao6jo9H3uuVpeQbISz/XGA
	 To8fUZKzdkln+TKQZb1XSB4NnSTW6dxbH3Lp5bY7VjtcFLyGV5hLALZrVPyZrPQoil
	 uPk3+9LprURVNz/V1m4aXpB2PcSbNLzCpP5av6Vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AE63F805C1;
	Thu, 19 May 2022 17:44:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 276FFF805B0; Thu, 19 May 2022 17:43:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF599F8051B
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF599F8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="KTcGyBlL"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J66mW2012194;
 Thu, 19 May 2022 10:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=/QY3h2RCbCwHcApY9YRI7DieyncVTw6JbGJgrn5x/bU=;
 b=KTcGyBlLxmRDmhcEZ3fE9GzroOM2KVEu0JrJUu5IFW5ltKEPOaqxshtY76UaaX8PQZ3l
 WbLVKrUHxVJNHJfNXFPOnrB0rRE1XZI4QbljpZS0T09/DwyOl9zR0bt6gA7H2a2Znso8
 xCNgEJoxdk1ZH9SxOPfT3l+6gsL9L1g7I4D6MoRKAQzJiuis93KyPyKjOie3PKpf4f2E
 KzJ8iMppphuXVuj8yWrAFHtgx6/c8gFyv3bKHFx60hrOruU4TjNXSwZevOILgCRYofC0
 xKKzKVhMQqoGU5U5jfda09/16sJBjonI+gZFDn/pXx9uUTugpd2zVfb8L7PvSGb71XzE xQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dn-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:30 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E2B42475;
 Thu, 19 May 2022 15:43:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 21/56] ASoC: stm: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:43 +0100
Message-ID: <20220519154318.2153729-22-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7fC3h8QDsLVtbT0YM97J4_FJvvmLjrmG
X-Proofpoint-ORIG-GUID: 7fC3h8QDsLVtbT0YM97J4_FJvvmLjrmG
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
 sound/soc/stm/stm32_i2s.c     | 10 +++++-----
 sound/soc/stm/stm32_sai_sub.c | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index ac5dff4d1677a..30c04f96ef1d6 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -593,16 +593,16 @@ static int stm32_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	}
 
 	/* DAI clock master masks */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		i2s->ms_flg = I2S_MS_SLAVE;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		i2s->ms_flg = I2S_MS_MASTER;
 		break;
 	default:
 		dev_err(cpu_dai->dev, "Unsupported mode %#x\n",
-			fmt & SND_SOC_DAIFMT_MASTER_MASK);
+			fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK);
 		return -EINVAL;
 	}
 
@@ -954,7 +954,7 @@ static const struct regmap_config stm32_h7_i2s_regmap_conf = {
 
 static const struct snd_soc_dai_ops stm32_i2s_pcm_dai_ops = {
 	.set_sysclk	= stm32_i2s_set_sysclk,
-	.set_fmt	= stm32_i2s_set_dai_fmt,
+	.set_fmt_new	= stm32_i2s_set_dai_fmt,
 	.startup	= stm32_i2s_startup,
 	.hw_params	= stm32_i2s_hw_params,
 	.trigger	= stm32_i2s_trigger,
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index dd636af81c9bd..9f169b93fa740 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -719,18 +719,18 @@ static int stm32_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	stm32_sai_sub_reg_up(sai, STM_SAI_FRCR_REGX, frcr_mask, frcr);
 
 	/* DAI clock master masks */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		/* codec is master */
 		cr1 |= SAI_XCR1_SLAVE;
 		sai->master = false;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		sai->master = true;
 		break;
 	default:
 		dev_err(cpu_dai->dev, "Unsupported mode %#x\n",
-			fmt & SND_SOC_DAIFMT_MASTER_MASK);
+			fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK);
 		return -EINVAL;
 	}
 
@@ -1225,7 +1225,7 @@ static int stm32_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 
 static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
 	.set_sysclk	= stm32_sai_set_sysclk,
-	.set_fmt	= stm32_sai_set_dai_fmt,
+	.set_fmt_new	= stm32_sai_set_dai_fmt,
 	.set_tdm_slot	= stm32_sai_set_dai_tdm_slot,
 	.startup	= stm32_sai_startup,
 	.hw_params	= stm32_sai_hw_params,
-- 
2.30.2

