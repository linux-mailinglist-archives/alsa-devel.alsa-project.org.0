Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE5285C4D
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 10:00:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C9F815F2;
	Thu,  8 Aug 2019 09:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C9F815F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565251242;
	bh=5dyXnzcAZ775EA7ehTHIXJzUbe0E/OmakkZKmrHzeac=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ruv6S+XpRpIrg1TgYkdXW47xUlNlLzAzBeltaYjifmqHdHLXOghkFRZw93QqrDep8
	 imtT+oKRC5wQFKpC+7Jq+9kPwudIsTwH2NtfmB/c7cZiV2ExQWqy9TFQNnDT6HNGNx
	 kfiaA65QOESrQuERwgptowC+kOyKRnY+wtuxGO2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2043F8053A;
	Thu,  8 Aug 2019 09:58:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C87E3F80534; Thu,  8 Aug 2019 09:58:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17526F803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 09:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17526F803F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 00:58:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; d="scan'208";a="186272334"
Received: from macchian.itwn.intel.com ([10.5.230.135])
 by orsmga002.jf.intel.com with ESMTP; 08 Aug 2019 00:58:40 -0700
From: mac.chiang@intel.com
To: alsa-devel@alsa-project.org
Date: Thu,  8 Aug 2019 15:58:40 +0800
Message-Id: <1565251120-13082-1-git-send-email-mac.chiang@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: sathya.prakash.m.r@intel.com, mac.chiang@intel.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
Subject: [alsa-devel] [PATCH] ASoC: Intel: boards: Add Cometlake machine
	driver support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Mac Chiang <mac.chiang@intel.com>

reuse and add Cometlake support with:
SSP0 for DA7219 headphone codec
SSP1 for MAX98357a speaker amp codec

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
 sound/soc/intel/boards/Kconfig                    | 15 +++++++++
 sound/soc/intel/boards/bxt_da7219_max98357a.c     | 37 ++++++++++++++++++++++-
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c | 12 ++++++++
 sound/soc/intel/common/soc-intel-quirks.h         |  5 +++
 4 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 50bf149..617d63c 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -256,6 +256,21 @@ config SND_SOC_INTEL_SKL_NAU88L25_MAX98357A_MACH
 
 endif ## SND_SOC_INTEL_SKL
 
+config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
+	tristate
+	select SND_SOC_DA7219
+	select SND_SOC_MAX98357A
+	select SND_SOC_DMIC
+	select SND_SOC_HDAC_HDMI
+
+if SND_SOC_SOF_COMETLAKE_LP
+config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
+	tristate "CML_LP with DA7219 and MAX98357A in I2S Mode"
+	depends on I2C && ACPI
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
+endif
+
 if SND_SOC_INTEL_APL
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index c0d865a..e5941ff 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -24,6 +24,8 @@
 
 #define BXT_DIALOG_CODEC_DAI	"da7219-hifi"
 #define BXT_MAXIM_CODEC_DAI	"HiFi"
+#define MCLK_19M	19200000
+#define MCLK_24M	24576000
 #define DUAL_CHANNEL		2
 #define QUAD_CHANNEL		4
 
@@ -181,8 +183,13 @@ static int broxton_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = rtd->codec_dai->component;
 
 	/* Configure sysclk for codec */
-	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, 19200000,
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
+	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, MCLK_19M,
 				     SND_SOC_CLOCK_IN);
+#else
+	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK, MCLK_24M,
+				     SND_SOC_CLOCK_IN);
+#endif
 	if (ret) {
 		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
 		return ret;
@@ -224,7 +231,11 @@ static int broxton_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (!pcm)
 		return -ENOMEM;
 
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
 	pcm->device = BXT_DPCM_AUDIO_HDMI1_PB + dai->id;
+#else
+	pcm->device = dai->id;
+#endif
 	pcm->codec_dai = dai;
 
 	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
@@ -683,6 +694,27 @@ static int broxton_audio_probe(struct platform_device *pdev)
 				broxton_dais[i].cpus->dai_name = "SSP2 Pin";
 			}
 		}
+	} else if (soc_intel_is_cml()) {
+		unsigned int i;
+
+		broxton_audio_card.name = "cmlda7219max";
+
+		for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
+			/* MAXIM_CODEC is connected to SSP1. */
+			if (!strcmp(broxton_dais[i].codecs->dai_name,
+					BXT_MAXIM_CODEC_DAI)) {
+				broxton_dais[i].id = 1;
+				broxton_dais[i].name = "SSP1-Codec";
+				broxton_dais[i].cpus->dai_name = "SSP1 Pin";
+			}
+			/* DIALOG_CODEC is connected to SSP0 */
+			else if (!strcmp(broxton_dais[i].codecs->dai_name,
+					BXT_DIALOG_CODEC_DAI)) {
+				broxton_dais[i].id = 0;
+				broxton_dais[i].name = "SSP0-Codec";
+				broxton_dais[i].cpus->dai_name = "SSP0 Pin";
+			}
+		}
 	}
 
 	/* override plaform name, if required */
@@ -700,6 +732,7 @@ static int broxton_audio_probe(struct platform_device *pdev)
 static const struct platform_device_id bxt_board_ids[] = {
 	{ .name = "bxt_da7219_max98357a" },
 	{ .name = "glk_da7219_max98357a" },
+	{ .name = "cml_da7219_max98357a" },
 	{ }
 };
 
@@ -720,6 +753,8 @@ MODULE_AUTHOR("Rohit Ainapure <rohit.m.ainapure@intel.com>");
 MODULE_AUTHOR("Harsha Priya <harshapriya.n@intel.com>");
 MODULE_AUTHOR("Conrad Cooke <conrad.cooke@intel.com>");
 MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
+MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:bxt_da7219_max98357a");
 MODULE_ALIAS("platform:glk_da7219_max98357a");
+MODULE_ALIAS("platform:cml_da7219_max98357a");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index c36c0aa..4ea32b2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -19,6 +19,11 @@ static struct snd_soc_acpi_codecs cml_codecs = {
 	.codecs = {"10EC5682"}
 };
 
+static struct snd_soc_acpi_codecs cml_spk_codecs = {
+	.num_codecs = 1,
+	.codecs = {"MX98357A"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 	{
 		.id = "INT34C2",
@@ -29,6 +34,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
 	},
 	{
+		.id = "DLGS7219",
+		.drv_name = "cml_da7219_max98357a",
+		.quirk_data = &cml_spk_codecs,
+		.sof_fw_filename = "sof-cnl.ri",
+		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
+	},
+	{
 		.id = "MX98357A",
 		.drv_name = "sof_rt5682",
 		.quirk_data = &cml_codecs,
diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
index 4718fd3..e6357d3 100644
--- a/sound/soc/intel/common/soc-intel-quirks.h
+++ b/sound/soc/intel/common/soc-intel-quirks.h
@@ -36,6 +36,7 @@ SOC_INTEL_IS_CPU(byt, INTEL_FAM6_ATOM_SILVERMONT);
 SOC_INTEL_IS_CPU(cht, INTEL_FAM6_ATOM_AIRMONT);
 SOC_INTEL_IS_CPU(apl, INTEL_FAM6_ATOM_GOLDMONT);
 SOC_INTEL_IS_CPU(glk, INTEL_FAM6_ATOM_GOLDMONT_PLUS);
+SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 
 static inline bool soc_intel_is_byt_cr(struct platform_device *pdev)
 {
@@ -110,6 +111,10 @@ static inline bool soc_intel_is_glk(void)
 	return false;
 }
 
+static inline bool soc_intel_is_cml(void)
+{
+	return false;
+}
 #endif
 
  #endif /* _SND_SOC_INTEL_QUIRKS_H */
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
