Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B843E52D90E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 17:49:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6917116AF;
	Thu, 19 May 2022 17:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6917116AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652975367;
	bh=yh7Zs+bQy1mKd6QXVRb3zRECmsYzRGw35/Mmo5RrjxY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7CwIbVyk5AM9MhyiUZ4MdDsIzx6b3Dlvw+ggeOxsnF5wqBg9Hckt/Y+ELweNP+Sp
	 hWPblj8k8FXciFzFkP5AcSWgrmaH+RqKg4t4NBGQhFFaIUx7uPJbWy0B0d0o2uBORi
	 255XK41IOPZEt8fWNpBBze/POWkfYqSF9nbtnlfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51791F805E3;
	Thu, 19 May 2022 17:44:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9EADF80520; Thu, 19 May 2022 17:43:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83E4AF8025D
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 17:43:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83E4AF8025D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Qp4SPrvs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JBHtae024228;
 Thu, 19 May 2022 10:43:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=cCymwW53t+NW6259pwZrG7SwU3NLqJXmM42AxN2W2lE=;
 b=Qp4SPrvsh5dq7ZyNRoVHl9R0NDIJLAUeS6desl2BaQQtXlZJSnh2wblad3oCJID0CRAy
 eDDCYELlPswc6BxwzSBPxzI5Av0EmOnBOSPcI+d125FYq183IlP0fLwKIObC1Q1M9KvK
 r9wW6dICkmQ0Gv50mQ4z+BWPeAW0Pa82ItKX3Spz+MP9KEG5dB4ZlEGVu9QtSo/z+E47
 BryufTrKCW2EKLZ0fVRwAAwpW+ZIMc8Q/KVJ3bRVXHVopRuoWVnQJHUJup4jHHJtAMTZ
 DQ8achtsZbSMWiYsqwnASm3+pJJk6ayIkjtKKj9Aee5jZSEZSN9Pw014gAcTeGrXQ81q tA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upf5dm-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 10:43:30 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 16:43:19 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 16:43:19 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 248AF475;
 Thu, 19 May 2022 15:43:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 11/56] ASoC: Intel: Update to use set_fmt_new callback
Date: Thu, 19 May 2022 16:42:33 +0100
Message-ID: <20220519154318.2153729-12-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6GNWuMCQR7SgJCvX7XhpNyDiWZ5-qqVz
X-Proofpoint-ORIG-GUID: 6GNWuMCQR7SgJCvX7XhpNyDiWZ5-qqVz
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
 sound/soc/intel/atom/sst-atom-controls.c     | 4 ++--
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c      | 2 +-
 sound/soc/intel/boards/bytcht_da7213.c       | 2 +-
 sound/soc/intel/boards/bytcht_es8316.c       | 2 +-
 sound/soc/intel/boards/bytcht_nocodec.c      | 2 +-
 sound/soc/intel/boards/bytcr_rt5640.c        | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c        | 2 +-
 sound/soc/intel/boards/bytcr_wm5102.c        | 2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c | 3 +--
 sound/soc/intel/boards/cht_bsw_rt5645.c      | 6 +++---
 sound/soc/intel/boards/cht_bsw_rt5672.c      | 2 +-
 sound/soc/intel/keembay/kmb_platform.c       | 6 +++---
 13 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 335c327329945..406455ddcb96e 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -831,9 +831,9 @@ static int sst_get_ssp_mode(struct snd_soc_dai *dai, unsigned int fmt)
 	dev_dbg(dai->dev, "Enter:%s, format=%x\n", __func__, format);
 
 	switch (format) {
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		return SSP_MODE_PROVIDER;
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		return SSP_MODE_CONSUMER;
 	default:
 		dev_err(dai->dev, "Invalid ssp protocol: %d\n", format);
diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index a56dd48c045f3..339d9440c1501 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -473,7 +473,7 @@ static const struct snd_soc_dai_ops sst_compr_dai_ops = {
 static const struct snd_soc_dai_ops sst_be_dai_ops = {
 	.startup = sst_enable_ssp,
 	.hw_params = sst_be_hw_params,
-	.set_fmt = sst_set_format,
+	.set_fmt_new = sst_set_format,
 	.set_tdm_slot = sst_platform_set_ssp_slot,
 	.shutdown = sst_disable_ssp,
 };
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 0eed68a11f7e1..ae899866863e5 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -126,7 +126,7 @@ static int byt_cht_cx2072x_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				SND_SOC_DAIFMT_I2S     |
 				SND_SOC_DAIFMT_NB_NF   |
-				SND_SOC_DAIFMT_CBC_CFC);
+				SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index eb19bf16afad4..a0c8f1d3f8cec 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -81,7 +81,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC);
+				  SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index a08507783e44a..6432b83f616f3 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -265,7 +265,7 @@ static int byt_cht_es8316_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				SND_SOC_DAIFMT_I2S     |
 				SND_SOC_DAIFMT_NB_NF   |
-				SND_SOC_DAIFMT_CBC_CFC
+				SND_SOC_DAIFMT_BP_FP
 		);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 115c2bcaabd4f..7fc03f2efd356 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -61,7 +61,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC);
+				  SND_SOC_DAIFMT_BP_FP);
 
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 7b948a219177d..0a78315e1f4aa 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1411,7 +1411,7 @@ static int byt_rt5640_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC);
+				  SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index d467fcaa48eaa..f72a597114bf5 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -706,7 +706,7 @@ static int byt_rt5651_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC
+				  SND_SOC_DAIFMT_BP_FP
 				  );
 
 	if (ret < 0) {
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 00384c6fbcaa5..fe79f6e5f2bb8 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -265,7 +265,7 @@ static int byt_wm5102_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC);
+				  SND_SOC_DAIFMT_BP_FP);
 	if (ret) {
 		dev_err(rtd->dev, "Error setting format to I2S: %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index a5160f27adea9..64eb73525ee37 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -264,8 +264,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBC_CFC;
+	fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_BP_FP;
 
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
 	if (ret < 0) {
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 45c301ea5e003..56ee53e7ed3f5 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -362,7 +362,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 					SND_SOC_DAIFMT_I2S     |
 					SND_SOC_DAIFMT_NB_NF   |
-					SND_SOC_DAIFMT_CBC_CFC
+					SND_SOC_DAIFMT_BP_FP
 			);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
@@ -372,7 +372,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
 					SND_SOC_DAIFMT_I2S     |
 					SND_SOC_DAIFMT_NB_NF   |
-					SND_SOC_DAIFMT_CBC_CFC
+					SND_SOC_DAIFMT_BC_FC
 			);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
@@ -396,7 +396,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
 					SND_SOC_DAIFMT_DSP_B |
 					SND_SOC_DAIFMT_IB_NF |
-					SND_SOC_DAIFMT_CBC_CFC);
+					SND_SOC_DAIFMT_BC_FC);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set format to TDM %d\n", ret);
 			return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index c80324f34b1b2..ca47f6476b077 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -300,7 +300,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBC_CFC);
+				  SND_SOC_DAIFMT_BP_FP);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index a6fb74ba1c424..a65f03884d9a5 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -497,11 +497,11 @@ static int kmb_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
-	case SND_SOC_DAIFMT_CBP_CFP:
+	case SND_SOC_DAIFMT_BC_FC:
 		kmb_i2s->clock_provider = false;
 		ret = 0;
 		break;
-	case SND_SOC_DAIFMT_CBC_CFC:
+	case SND_SOC_DAIFMT_BP_FP:
 		writel(CLOCK_PROVIDER_MODE, kmb_i2s->pss_base + I2S_GEN_CFG_0);
 
 		ret = clk_prepare_enable(kmb_i2s->clk_i2s);
@@ -736,7 +736,7 @@ static const struct snd_soc_dai_ops kmb_dai_ops = {
 	.hw_params	= kmb_dai_hw_params,
 	.hw_free	= kmb_dai_hw_free,
 	.prepare	= kmb_dai_prepare,
-	.set_fmt	= kmb_set_dai_fmt,
+	.set_fmt_new	= kmb_set_dai_fmt,
 };
 
 static struct snd_soc_dai_driver intel_kmb_hdmi_dai[] = {
-- 
2.30.2

