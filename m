Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F281E52D875
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:45:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FD571681;
	Thu, 19 May 2022 17:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FD571681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975132;
	bh=Cf8Bs8IAN+eUDJR79TFGC/S61aUQGdkb4FHWxMSkrFI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h1c2yGJJFKfjqG3ZuIetj+xtw4ThpcWa/+1VPeRaVcyVnetD+c5pjoxZODvqkuRSO
	 uwLThRbpxivJHXzc5G+YdvLqXqIqOYqyIQhXaWa7jiRAM43M+W4+fK2lhKwxO/n1VB
	 MyetqQ1Y9O3l0Ea2KEE+H18kRB2GcUXPqJi6eu1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FA54F8055A;
	Thu, 19 May 2022 17:43:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63BE3F80528; Thu, 19 May 2022 17:43:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17D7CF8025D
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17D7CF8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="IVAUWGpX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtaZ024228;
 Thu, 19 May 2022 10:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=9hTCMyfEH93APH26QOcIiezb1QO1saOb5PENw49CR74=;
 b=IVAUWGpXnToI2Qlse/ywXO4ytzB0dHKmVz9XzjkPYqoulPBXo2+fOaQueAcpIvqc88AE
 kCARWlA4yQHXD7mIIEz+VWk8UtKX84BadtX82YCajvrxmG+YeCWvDVklauFb+/0wzsWF
 SvGLHJ1SbThZuICa10jHu1OKm/tERlSi3lDDW2rm2Fn52IsaHdLoYwg8PCfIJ3cvrMzp
 MFFewo2rGYJ38Y1OpGu1d+aXWxp2COohvS9xRHaAGbxVFd4NEHg9Li0vYOLOeoJ3s8KP
 Z2bFtgH7wnqf77sqqND0UfofhYWGFGN2xkP2/aNB+rq3KpHqazFykb4dMtmW2E1VQYgn pw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:23 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:18 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:18 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5D89D11D1;
 Thu, 19 May 2022 15:43:18 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 01/56] ASoC: core: Add set_fmt_new callback that directly
 specifies provider
Date: Thu, 19 May 2022 16:42:23 +0100
Message-ID: <20220519154318.2153729-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: b5isdzNm3eaa-uDVVX3v3im0W1VfdPaS
X-Proofpoint-ORIG-GUID: b5isdzNm3eaa-uDVVX3v3im0W1VfdPaS
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

The original set_fmt callback always passes clock provider/consumer
with respect to the CODEC. This made sense when the framework was
directly broken down into platforms and CODECs. Now everything is
componentised it simplifies things if each side of the link is
just told if it is provider or consumer of the clocks. To start
this migration add a new callback that can be used to receive a
direct specification of clocking. As there are more CODEC drivers
than platform drivers, we make the new flags identical to the old
CODEC flags meaning CODEC drivers will not require an update.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 7 +++++++
 sound/soc/soc-core.c    | 3 ++-
 sound/soc/soc-dai.c     | 5 ++++-
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index bbd821d2df9ca..9c1d92d5a3738 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -124,6 +124,12 @@ struct snd_compr_stream;
 #define SND_SOC_DAIFMT_CBM_CFS		SND_SOC_DAIFMT_CBP_CFC
 #define SND_SOC_DAIFMT_CBS_CFS		SND_SOC_DAIFMT_CBC_CFC
 
+/* when passed to set_fmt directly indicate if the device is provider or consumer */
+#define SND_SOC_DAIFMT_BP_FP		SND_SOC_DAIFMT_CBP_CFP
+#define SND_SOC_DAIFMT_BC_FP		SND_SOC_DAIFMT_CBC_CFP
+#define SND_SOC_DAIFMT_BP_FC		SND_SOC_DAIFMT_CBP_CFC
+#define SND_SOC_DAIFMT_BC_FC		SND_SOC_DAIFMT_CBC_CFC
+
 /* Describes the possible PCM format */
 #define SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT	48
 #define SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_MASK	(0xFFFFULL << SND_SOC_POSSIBLE_DAIFMT_CLOCK_PROVIDER_SHIFT)
@@ -282,6 +288,7 @@ struct snd_soc_dai_ops {
 	 * Called by soc_card drivers, normally in their hw_params.
 	 */
 	int (*set_fmt)(struct snd_soc_dai *dai, unsigned int fmt);
+	int (*set_fmt_new)(struct snd_soc_dai *dai, unsigned int fmt);
 	int (*xlate_tdm_slot_mask)(unsigned int slots,
 		unsigned int *tx_mask, unsigned int *rx_mask);
 	int (*set_tdm_slot)(struct snd_soc_dai *dai,
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9574f86dd4de2..90f4265bea501 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1235,7 +1235,8 @@ int snd_soc_runtime_set_dai_fmt(struct snd_soc_pcm_runtime *rtd,
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 		unsigned int fmt = dai_fmt;
 
-		if (snd_soc_component_is_codec(cpu_dai->component))
+		if (cpu_dai->driver->ops->set_fmt_new ||
+		    snd_soc_component_is_codec(cpu_dai->component))
 			fmt = inv_dai_fmt;
 
 		ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 6078afe335f88..996712f4d9bfd 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -209,7 +209,10 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	int ret = -ENOTSUPP;
 
 	if (dai->driver->ops &&
-	    dai->driver->ops->set_fmt)
+	    dai->driver->ops->set_fmt_new)
+		ret = dai->driver->ops->set_fmt_new(dai, fmt);
+	else if (dai->driver->ops &&
+		 dai->driver->ops->set_fmt)
 		ret = dai->driver->ops->set_fmt(dai, fmt);
 
 	return soc_dai_ret(dai, ret);
-- 
2.30.2

