Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8A552D8CB
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:47:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1269516A2;
	Thu, 19 May 2022 17:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1269516A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975268;
	bh=OU87iJYEcBRqWAExHBMngJdBXd52gZPZvVAfbX2HOmI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J7xHfCRYrb8HLW93j19QDH6ya9dXyDlpYORY7jw0A4kj5Jc+J7vVYZ1m86CUVu6e4
	 CvPL5f1Z9Vjjk6V2uqWfYCuIp9flQdp1aXRlQuR/DhyecYFo+YJWuvN3af9x+cGkg5
	 KzZLdk1IgrqoIT0WvOczAwSYYJ66bBFjI6w5jqAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3762F80525;
	Thu, 19 May 2022 17:43:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0509FF8059F; Thu, 19 May 2022 17:43:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C587DF80519
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C587DF80519
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="NuKu4vk+"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtad024228;
 Thu, 19 May 2022 10:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=JZwMeAXTmKyqZh6PnwjGmQ7Sg6P9A85VRbLP68aHx+U=;
 b=NuKu4vk+OZb2YcWlAAFVraEWupCLmAqo6g/teCFwiVObhAP2zaNgrGJkg7fqXXlvkf+W
 j8VllfGLHAb7SHTVf4t/KetLhJk2FG+dCpkE66CeRU3PKM5CR9jXYIxoEkHEuAuZOqKj
 Dcny0Oe3fGhBQOshT+Gf4mpVoV92gK2bXBpDdvfBF5pcDl2g2GXHbO/8w6ix4KkRKVoQ
 pUCAfZFnWfV+/4Lg0ReHkO1GpMbjzGru8BcJ/QGXithzrck4mcqarMpQheE9lGQLKk+R
 VRcxLEIwpFUQn2dB6BuEE5ghSeyVTwq6c4hubJzdTwnhDjhfvXcVowjNQBlv+uvz95gP yQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:27 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F195D11D3;
 Thu, 19 May 2022 15:43:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 09/56] ASoC: hisilicon: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:31 +0100
Message-ID: <20220519154318.2153729-10-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: xseAf3viMvfsJbVMvc_EICfoCoFhnqVY
X-Proofpoint-ORIG-GUID: xseAf3viMvfsJbVMvc_EICfoCoFhnqVY
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
provider or consumer update this CPU side driver to use the new direct
callback.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index a297d4af5099f..51f98ae651a6b 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -227,9 +227,9 @@ static int hi6210_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	 * We don't actually set the hardware until the hw_params
 	 * call, but we need to validate the user input here.
 	 */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
-	case SND_SOC_DAIFMT_CBS_CFS:
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
+	case SND_SOC_DAIFMT_BP_FP:
 		break;
 	default:
 		return -EINVAL;
@@ -245,8 +245,8 @@ static int hi6210_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	}
 
 	i2s->format = fmt;
-	i2s->master = (i2s->format & SND_SOC_DAIFMT_MASTER_MASK) ==
-		      SND_SOC_DAIFMT_CBS_CFS;
+	i2s->master = (i2s->format & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
+		      SND_SOC_DAIFMT_BP_FP;
 
 	return 0;
 }
@@ -375,21 +375,21 @@ static int hi6210_i2s_hw_params(struct snd_pcm_substream *substream,
 	hi6210_write_reg(i2s, HII2S_MUX_TOP_MODULE_CFG, val);
 
 
-	switch (i2s->format & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	switch (i2s->format & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BC_FC:
 		i2s->master = false;
 		val = hi6210_read_reg(i2s, HII2S_I2S_CFG);
 		val |= HII2S_I2S_CFG__S2_MST_SLV;
 		hi6210_write_reg(i2s, HII2S_I2S_CFG, val);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_BP_FP:
 		i2s->master = true;
 		val = hi6210_read_reg(i2s, HII2S_I2S_CFG);
 		val &= ~HII2S_I2S_CFG__S2_MST_SLV;
 		hi6210_write_reg(i2s, HII2S_I2S_CFG, val);
 		break;
 	default:
-		WARN_ONCE(1, "Invalid i2s->fmt MASTER_MASK. This shouldn't happen\n");
+		WARN_ONCE(1, "Invalid i2s->fmt CLOCK_PROVIDER_MASK. This shouldn't happen\n");
 		return -EINVAL;
 	}
 
@@ -513,7 +513,7 @@ static int hi6210_i2s_dai_probe(struct snd_soc_dai *dai)
 static const struct snd_soc_dai_ops hi6210_i2s_dai_ops = {
 	.trigger	= hi6210_i2s_trigger,
 	.hw_params	= hi6210_i2s_hw_params,
-	.set_fmt	= hi6210_i2s_set_fmt,
+	.set_fmt_new	= hi6210_i2s_set_fmt,
 	.startup	= hi6210_i2s_startup,
 	.shutdown	= hi6210_i2s_shutdown,
 };
-- 
2.30.2

