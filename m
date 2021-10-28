Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB6643DAF3
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 08:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C535169E;
	Thu, 28 Oct 2021 08:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C535169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635401122;
	bh=l5vymQF2njDKottmc6zJ0K0JDyQCpSQzdae7QlKU4rw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NCPmlhlLJScD0dq2pYgVOo0P6wnZnAdMgnoT/FPhpJfInUuOQyT/X22MtFX6fe1y0
	 +b7HD4kniZ416DDmWju0XXtt1z06ZjioD9GLJohfPhUA5kP25+Kx8ZTn/6qaYvpJaf
	 el3O82ED2U9LPpf5+hDoqTxxx8iWD1j3RHQBvi9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E0EEF802E7;
	Thu, 28 Oct 2021 08:04:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E484F802C8; Thu, 28 Oct 2021 08:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F1E9F800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 08:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F1E9F800D1
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230187410"
X-IronPort-AV: E=Sophos;i="5.87,188,1631602800"; d="scan'208";a="230187410"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 23:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,188,1631602800"; d="scan'208";a="537873255"
Received: from brentlu-brix.itwn.intel.com ([10.5.253.1])
 by fmsmga008.fm.intel.com with ESMTP; 27 Oct 2021 23:03:43 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoc: Intel: glk_rt5682_max98357a: support ALC5682I-VS codec
Date: Thu, 28 Oct 2021 14:02:03 +0800
Message-Id: <20211028060203.446093-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Olaru <paul.olaru@oss.nxp.com>, Nathan Chancellor <nathan@kernel.org>,
 Julian Braha <julianbraha@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Brent Lu <brent.lu@intel.com>
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

Detect the codec variant in probe function and update DAI link
accordingly. Also add an new entry in enumeration table for machine
driver enumeration.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/Kconfig                |  1 +
 sound/soc/intel/boards/glk_rt5682_max98357a.c | 53 +++++++++++++++----
 .../intel/common/soc-acpi-intel-glk-match.c   |  9 ++++
 3 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index f693383eb6e3..2dd5ff7e35ce 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -427,6 +427,7 @@ config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 9d75beec09d1..058aa7cb899a 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -18,14 +18,18 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include "../../codecs/rt5682.h"
+#include "../../codecs/rt5682s.h"
 #include "../../codecs/hdac_hdmi.h"
 #include "hda_dsp_common.h"
 
 /* The platform clock outputs 19.2Mhz clock to codec as I2S MCLK */
 #define GLK_PLAT_CLK_FREQ 19200000
 #define RT5682_PLL_FREQ (48000 * 512)
-#define GLK_REALTEK_CODEC_DAI "rt5682-aif1"
+#define RT5682_DAI_NAME "rt5682-aif1"
+#define RT5682S_DAI_NAME "rt5682s-aif1"
 #define GLK_MAXIM_CODEC_DAI "HiFi"
+#define RT5682_DEV0_NAME "i2c-10EC5682:00"
+#define RT5682S_DEV0_NAME "i2c-RTL5682:00"
 #define MAXIM_DEV0_NAME "MX98357A:00"
 #define DUAL_CHANNEL 2
 #define QUAD_CHANNEL 4
@@ -43,6 +47,7 @@ struct glk_card_private {
 	struct snd_soc_jack geminilake_headset;
 	struct list_head hdmi_pcm_list;
 	bool common_hdmi_codec_drv;
+	int is_rt5682s;
 };
 
 enum {
@@ -139,9 +144,19 @@ static int geminilake_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct snd_soc_jack *jack;
-	int ret;
+	int pll_id, pll_source, clk_id, ret;
+
+	if (ctx->is_rt5682s) {
+		pll_id = RT5682S_PLL2;
+		pll_source = RT5682S_PLL_S_MCLK;
+		clk_id = RT5682S_SCLK_S_PLL2;
+	} else {
+		pll_id = RT5682_PLL1;
+		pll_source = RT5682_PLL1_S_MCLK;
+		clk_id = RT5682_SCLK_S_PLL1;
+	}
 
-	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
+	ret = snd_soc_dai_set_pll(codec_dai, pll_id, pll_source,
 					GLK_PLAT_CLK_FREQ, RT5682_PLL_FREQ);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
@@ -149,7 +164,7 @@ static int geminilake_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 	}
 
 	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
+	ret = snd_soc_dai_set_sysclk(codec_dai, clk_id,
 					RT5682_PLL_FREQ, SND_SOC_CLOCK_IN);
 	if (ret < 0)
 		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
@@ -344,9 +359,12 @@ SND_SOC_DAILINK_DEF(ssp1_codec,
 
 SND_SOC_DAILINK_DEF(ssp2_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("SSP2 Pin")));
-SND_SOC_DAILINK_DEF(ssp2_codec,
-	DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10EC5682:00",
-				      GLK_REALTEK_CODEC_DAI)));
+SND_SOC_DAILINK_DEF(ssp2_codec_5682,
+	DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
+				      RT5682_DAI_NAME)));
+SND_SOC_DAILINK_DEF(ssp2_codec_5682s,
+	DAILINK_COMP_ARRAY(COMP_CODEC(RT5682S_DEV0_NAME,
+				      RT5682S_DAI_NAME)));
 
 SND_SOC_DAILINK_DEF(dmic_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
@@ -492,7 +510,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.ops = &geminilake_rt5682_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
-		SND_SOC_DAILINK_REG(ssp2_pin, ssp2_codec, platform),
+		SND_SOC_DAILINK_REG(ssp2_pin, ssp2_codec_5682, platform),
 	},
 	{
 		.name = "dmic01",
@@ -592,12 +610,29 @@ static int geminilake_audio_probe(struct platform_device *pdev)
 	struct snd_soc_acpi_mach *mach;
 	const char *platform_name;
 	struct snd_soc_card *card;
-	int ret;
+	int ret, i;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	/* Detect the headset codec variant */
+	if (acpi_dev_present("RTL5682", NULL, -1)) {
+		/* ALC5682I-VS is detected */
+		ctx->is_rt5682s = 1;
+
+		for (i = 0; i < glk_audio_card_rt5682_m98357a.num_links; i++) {
+			if (strcmp(geminilake_dais[i].name, "SSP2-Codec"))
+				continue;
+
+			/* update the dai link to use rt5682s codec */
+			geminilake_dais[i].codecs = ssp2_codec_5682s;
+			geminilake_dais[i].num_codecs = ARRAY_SIZE(ssp2_codec_5682s);
+			break;
+		}
+	} else
+		ctx->is_rt5682s = 0;
+
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
 	card = &glk_audio_card_rt5682_m98357a;
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index 32fff9389eb3..4de4add74443 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -40,6 +40,15 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 		.sof_fw_filename = "sof-glk.ri",
 		.sof_tplg_filename = "sof-glk-rt5682.tplg",
 	},
+	{
+		.id = "RTL5682",
+		.drv_name = "glk_rt5682_max98357a",
+		.fw_filename = "intel/dsp_fw_glk.bin",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &glk_codecs,
+		.sof_fw_filename = "sof-glk.ri",
+		.sof_tplg_filename = "sof-glk-rt5682.tplg",
+	},
 	{
 		.id = "10134242",
 		.drv_name = "glk_cs4242_mx98357a",
-- 
2.25.1

