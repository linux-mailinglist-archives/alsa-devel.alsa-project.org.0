Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D2540AB95
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 12:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83D417A1;
	Tue, 14 Sep 2021 12:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83D417A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631614880;
	bh=bNA8kSsJKmHFEqexsYYd3d1SQS4VzUHQipbn3/bcfPc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fGKCWHYWWmych1DBmwfNTSdexN0T2DQReffFJBy3w0haJEfE8nZX4v7U3K4+NBuAl
	 I7K44VRkB4LKR4yp5ZqCXHD5eGOZ0y5SVrD1QHS8Y6Wi6PNSV02aciutgQ5ljAvfXZ
	 fL3ne/Gugh1pk+iKpkt7ypylf1nN7XAloyG6Y/8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34622F8025A;
	Tue, 14 Sep 2021 12:19:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 436DBF804B0; Tue, 14 Sep 2021 12:19:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2BA7F80132
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 12:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2BA7F80132
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="221989234"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="221989234"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 03:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="543895838"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.10])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2021 03:19:28 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: Intel: sof_rt5682: support ALC5682I-VS codec
Date: Tue, 14 Sep 2021 18:18:44 +0800
Message-Id: <20210914101847.778688-2-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914101847.778688-1-brent.lu@intel.com>
References: <20210914101847.778688-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nathan Chancellor <nathan@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Rander Wang <rander.wang@intel.com>, Brent Lu <brent.lu@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
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

Add a new quirk SOF_RT5682S_HEADPHONE_CODEC_PRESENT to support
ALC5682I-VS headphone codec which driver is a new one, rt5682s, with
new macros and functions.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/Kconfig      |  1 +
 sound/soc/intel/boards/sof_rt5682.c | 75 ++++++++++++++++++++++-------
 2 files changed, 58 insertions(+), 18 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 61b71d6c44cf..3e20c697b569 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -470,6 +470,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_RT1015
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f096bd6d69be..69d1d9742ba5 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -18,9 +18,11 @@
 #include <sound/soc.h>
 #include <sound/sof.h>
 #include <sound/rt5682.h>
+#include <sound/rt5682s.h>
 #include <sound/soc-acpi.h>
 #include "../../codecs/rt1015.h"
 #include "../../codecs/rt5682.h"
+#include "../../codecs/rt5682s.h"
 #include "../../codecs/hdac_hdmi.h"
 #include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
@@ -56,6 +58,7 @@
 #define SOF_BT_OFFLOAD_SSP(quirk)	\
 	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
 #define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(22)
+#define SOF_RT5682S_HEADPHONE_CODEC_PRESENT	BIT(23)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -208,9 +211,16 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 	/* need to enable ASRC function for 24MHz mclk rate */
 	if ((sof_rt5682_quirk & SOF_RT5682_MCLK_EN) &&
 	    (sof_rt5682_quirk & SOF_RT5682_MCLK_24MHZ)) {
-		rt5682_sel_asrc_clk_src(component, RT5682_DA_STEREO1_FILTER |
-					RT5682_AD_STEREO1_FILTER,
-					RT5682_CLK_SEL_I2S1_ASRC);
+		if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT)
+			rt5682s_sel_asrc_clk_src(component,
+						 RT5682S_DA_STEREO1_FILTER |
+						 RT5682S_AD_STEREO1_FILTER,
+						 RT5682S_CLK_SEL_I2S1_ASRC);
+		else
+			rt5682_sel_asrc_clk_src(component,
+						RT5682_DA_STEREO1_FILTER |
+						RT5682_AD_STEREO1_FILTER,
+						RT5682_CLK_SEL_I2S1_ASRC);
 	}
 
 	if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
@@ -277,7 +287,7 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	int clk_id, clk_freq, pll_out, ret;
+	int pll_id, pll_source, pll_in, pll_out, clk_id, ret;
 
 	if (sof_rt5682_quirk & SOF_RT5682_MCLK_EN) {
 		if (sof_rt5682_quirk & SOF_RT5682_MCLK_BYTCHT_EN) {
@@ -289,35 +299,52 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 			}
 		}
 
-		clk_id = RT5682_PLL1_S_MCLK;
+		if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT)
+			pll_source = RT5682S_PLL_S_MCLK;
+		else
+			pll_source = RT5682_PLL1_S_MCLK;
 
 		/* get the tplg configured mclk. */
-		clk_freq = sof_dai_get_mclk(rtd);
+		pll_in = sof_dai_get_mclk(rtd);
 
 		/* mclk from the quirk is the first choice */
 		if (sof_rt5682_quirk & SOF_RT5682_MCLK_24MHZ) {
-			if (clk_freq != 24000000)
+			if (pll_in != 24000000)
 				dev_warn(rtd->dev, "configure wrong mclk in tplg, please use 24MHz.\n");
-			clk_freq = 24000000;
-		} else if (clk_freq == 0) {
+			pll_in = 24000000;
+		} else if (pll_in == 0) {
 			/* use default mclk if not specified correct in topology */
-			clk_freq = 19200000;
-		} else if (clk_freq < 0) {
-			return clk_freq;
+			pll_in = 19200000;
+		} else if (pll_in < 0) {
+			return pll_in;
 		}
 	} else {
-		clk_id = RT5682_PLL1_S_BCLK1;
-		clk_freq = params_rate(params) * 50;
+		if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT)
+			pll_source = RT5682S_PLL_S_BCLK1;
+		else
+			pll_source = RT5682_PLL1_S_BCLK1;
+
+		pll_in = params_rate(params) * 50;
+	}
+
+	if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT) {
+		pll_id = RT5682S_PLL2;
+		clk_id = RT5682S_SCLK_S_PLL2;
+	} else {
+		pll_id = RT5682_PLL1;
+		clk_id = RT5682_SCLK_S_PLL1;
 	}
 
 	pll_out = params_rate(params) * 512;
 
-	ret = snd_soc_dai_set_pll(codec_dai, 0, clk_id, clk_freq, pll_out);
+	/* Configure pll for codec */
+	ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source, pll_in,
+				  pll_out);
 	if (ret < 0)
 		dev_err(rtd->dev, "snd_soc_dai_set_pll err = %d\n", ret);
 
 	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, clk_id,
 				     pll_out, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
@@ -560,6 +587,13 @@ static struct snd_soc_dai_link_component rt5682_component[] = {
 	}
 };
 
+static struct snd_soc_dai_link_component rt5682s_component[] = {
+	{
+		.name = "i2c-RTL5682:00",
+		.dai_name = "rt5682s-aif1",
+	}
+};
+
 static struct snd_soc_dai_link_component dmic_component[] = {
 	{
 		.name = "dmic-codec",
@@ -610,8 +644,13 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		goto devm_err;
 
 	links[id].id = id;
-	links[id].codecs = rt5682_component;
-	links[id].num_codecs = ARRAY_SIZE(rt5682_component);
+	if (sof_rt5682_quirk & SOF_RT5682S_HEADPHONE_CODEC_PRESENT) {
+		links[id].codecs = rt5682s_component;
+		links[id].num_codecs = ARRAY_SIZE(rt5682s_component);
+	} else {
+		links[id].codecs = rt5682_component;
+		links[id].num_codecs = ARRAY_SIZE(rt5682_component);
+	}
 	links[id].platforms = platform_component;
 	links[id].num_platforms = ARRAY_SIZE(platform_component);
 	links[id].init = sof_rt5682_codec_init;
-- 
2.25.1

