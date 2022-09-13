Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A605B68FC
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 09:51:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F7E1173D;
	Tue, 13 Sep 2022 09:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F7E1173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663055499;
	bh=2z526O3hiioYh4mEY8M/wCC+qpQd8rhTRjBApkgGTdc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b0dLORyLXIIXm73GY12Yj/sRCWut369pQtdrClXXLoMhkRw1750qSuhMn5+s+ksgI
	 CLRhSN+mbQMxc0pLuGyxYuqpvRLUTom1EEF+1iDVYAxiL1UTdkZEzGQsfsq7UbUbdQ
	 2erHX3UQ5q9RnNuUKdaq+UtPmdObCw5UyCHHnx98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9A8FF8025D;
	Tue, 13 Sep 2022 09:50:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B4A2F80224; Tue, 13 Sep 2022 09:50:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE577F800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 09:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE577F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hh/QNm32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663055432; x=1694591432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2z526O3hiioYh4mEY8M/wCC+qpQd8rhTRjBApkgGTdc=;
 b=Hh/QNm32QtO+MzAJAk985tF4PMuFoIx+xtyoOt2ttFK8s746mU19yGqL
 VPxCimemWPwiSAGFL5LnF/9SygDU5ZW7Nc9cCAcpQiVkfRtzMHz8sT3P0
 oCkSkgXq3S8VjRdHBpzrUZdlDpBdWZEpDmiVDkFr/ET/YCQg0SlCz+ofK
 yg3Ve2aAlkkxUOFiA+kDFtWAmnqPzGGw2gkoHFwCNaZe/yJYBsaowns0B
 Dl53L6baAsQWJ8fUlUwD8QzFPtorFixg/px8btxaTpefUMfnz3CgJncKe
 HKrTktiEtF+T87NvTy8QQd/wnyM+VXzuaYIO+8yDgCC7TP7hlI1gCrH4P w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="278464378"
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="278464378"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 00:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,312,1654585200"; d="scan'208";a="678455676"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.25])
 by fmsmga008.fm.intel.com with ESMTP; 13 Sep 2022 00:50:25 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: remove SOF_RT1015_SPEAKER_AMP_100FS
 flag
Date: Tue, 13 Sep 2022 15:49:06 +0800
Message-Id: <20220913074906.926774-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Ajye Huang <ajye.huang@gmail.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

This flag could be removed since we now have API to query bclk
fequency setting in the topology. The dai link structure itself also
provides DAI format information instead of figuring it out with fs
number.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_realtek_common.c | 86 +++++++++++----------
 sound/soc/intel/boards/sof_realtek_common.h |  2 +-
 sound/soc/intel/boards/sof_rt5682.c         |  6 +-
 3 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index b9643ca2e2f2..ff2851fc8930 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -253,63 +253,70 @@ EXPORT_SYMBOL_NS(sof_rt1015p_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
  * RT1015 audio amplifier
  */
 
+static const struct {
+	unsigned int tx;
+	unsigned int rx;
+} rt1015_tdm_mask[] = {
+	{.tx = 0x0, .rx = 0x1},
+	{.tx = 0x0, .rx = 0x2},
+};
+
 static int rt1015_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *codec_dai;
-	int i, fs = 64, ret;
+	int i, clk_freq, ret;
 
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
-					  params_rate(params) * fs,
-					  params_rate(params) * 256);
-		if (ret)
-			return ret;
+	clk_freq = sof_dai_get_bclk(rtd);
 
-		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
-					     params_rate(params) * 256,
-					     SND_SOC_CLOCK_IN);
-		if (ret)
-			return ret;
+	if (clk_freq <= 0) {
+		dev_err(rtd->dev, "fail to get bclk freq, ret %d\n", clk_freq);
+		return -EINVAL;
 	}
 
-	return 0;
-}
-
-static int rt1015_hw_params_pll_and_tdm(struct snd_pcm_substream *substream,
-					 struct snd_pcm_hw_params *params)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai;
-	int i, fs = 100, ret;
-
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
-					  params_rate(params) * fs,
+					  clk_freq,
 					  params_rate(params) * 256);
-		if (ret)
+		if (ret) {
+			dev_err(codec_dai->dev, "fail to set pll, ret %d\n",
+				ret);
 			return ret;
+		}
 
 		ret = snd_soc_dai_set_sysclk(codec_dai, RT1015_SCLK_S_PLL,
 					     params_rate(params) * 256,
 					     SND_SOC_CLOCK_IN);
-		if (ret)
+		if (ret) {
+			dev_err(codec_dai->dev, "fail to set sysclk, ret %d\n",
+				ret);
 			return ret;
-	}
-	/* rx slot 1 for RT1015_DEV0_NAME */
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0),
-				       0x0, 0x1, 4, 24);
-	if (ret)
-		return ret;
+		}
 
-	/* rx slot 2 for RT1015_DEV1_NAME */
-	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 1),
-				       0x0, 0x2, 4, 24);
-	if (ret)
-		return ret;
+		switch (dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+		case SND_SOC_DAIFMT_DSP_A:
+		case SND_SOC_DAIFMT_DSP_B:
+			/* 4-slot TDM */
+			ret = snd_soc_dai_set_tdm_slot(codec_dai,
+						       rt1015_tdm_mask[i].tx,
+						       rt1015_tdm_mask[i].rx,
+						       4,
+						       params_width(params));
+			if (ret < 0) {
+				dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
+					ret);
+				return ret;
+			}
+			break;
+		default:
+			dev_dbg(codec_dai->dev, "codec is in I2S mode\n");
+			break;
+		}
+	}
 
-	return 0;
+	return ret;
 }
 
 static struct snd_soc_ops rt1015_ops = {
@@ -351,15 +358,12 @@ void sof_rt1015_codec_conf(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_NS(sof_rt1015_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
-void sof_rt1015_dai_link(struct snd_soc_dai_link *link, unsigned int fs)
+void sof_rt1015_dai_link(struct snd_soc_dai_link *link)
 {
 	link->codecs = rt1015_components;
 	link->num_codecs = ARRAY_SIZE(rt1015_components);
 	link->init = speaker_codec_init_lr;
 	link->ops = &rt1015_ops;
-
-	if (fs == 100)
-		rt1015_ops.hw_params = rt1015_hw_params_pll_and_tdm;
 }
 EXPORT_SYMBOL_NS(sof_rt1015_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index 778443421090..3ae99d8239e0 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -32,7 +32,7 @@ void sof_rt1015p_codec_conf(struct snd_soc_card *card);
 #define RT1015_DEV0_NAME	"i2c-10EC1015:00"
 #define RT1015_DEV1_NAME	"i2c-10EC1015:01"
 
-void sof_rt1015_dai_link(struct snd_soc_dai_link *link, unsigned int fs);
+void sof_rt1015_dai_link(struct snd_soc_dai_link *link);
 void sof_rt1015_codec_conf(struct snd_soc_card *card);
 
 #define RT1308_CODEC_DAI	"rt1308-aif"
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 045965312245..7d54b8ed3e83 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -46,7 +46,6 @@
 	((quirk << SOF_RT5682_NUM_HDMIDEV_SHIFT) & SOF_RT5682_NUM_HDMIDEV_MASK)
 #define SOF_RT1011_SPEAKER_AMP_PRESENT		BIT(13)
 #define SOF_RT1015_SPEAKER_AMP_PRESENT		BIT(14)
-#define SOF_RT1015_SPEAKER_AMP_100FS		BIT(15)
 #define SOF_RT1015P_SPEAKER_AMP_PRESENT		BIT(16)
 #define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(17)
 #define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(18)
@@ -132,7 +131,6 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT1015_SPEAKER_AMP_PRESENT |
-					SOF_RT1015_SPEAKER_AMP_100FS |
 					SOF_RT5682_SSP_AMP(1)),
 	},
 	{
@@ -739,8 +737,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 
 		links[id].id = id;
 		if (sof_rt5682_quirk & SOF_RT1015_SPEAKER_AMP_PRESENT) {
-			sof_rt1015_dai_link(&links[id], (sof_rt5682_quirk &
-					SOF_RT1015_SPEAKER_AMP_100FS) ? 100 : 64);
+			sof_rt1015_dai_link(&links[id]);
 		} else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT) {
 			sof_rt1015p_dai_link(&links[id]);
 		} else if (sof_rt5682_quirk & SOF_RT1019_SPEAKER_AMP_PRESENT) {
@@ -1010,7 +1007,6 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_SPEAKER_AMP_PRESENT |
 					SOF_RT1015_SPEAKER_AMP_PRESENT |
-					SOF_RT1015_SPEAKER_AMP_100FS |
 					SOF_RT5682_SSP_AMP(1)),
 	},
 	{
-- 
2.25.1

