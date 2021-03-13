Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EBF339E63
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Mar 2021 15:00:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D97ED16A3;
	Sat, 13 Mar 2021 14:59:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D97ED16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615644003;
	bh=+hoyIBrpKBq0eyQPAWypZquGc4kdyH//rXx8oRkJIK8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Keki2uQcZosV658CbDBn7tIxyp8clWuYMPN1WbfruMJHaU4UVzVLqr6UIz4ZYy5EJ
	 cIQE51LaWLbYWFPTlyshBFKghpFsQli5gmJ0QA/MbvuMiOG68v2AaPZ1vX95s9HJbS
	 k070qx6u7MRcAH5DTlWcLbxEs5IP0MpN0x+xseXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 583B2F8019B;
	Sat, 13 Mar 2021 14:58:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4DB4F80227; Sat, 13 Mar 2021 14:58:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4802F80154
 for <alsa-devel@alsa-project.org>; Sat, 13 Mar 2021 14:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4802F80154
IronPort-SDR: C2bVpnjiMEFq9XrxCwa+NM9ORTfibHGyaNDmFz2qBaC+XczzkMZ52VngObl86GxeFb7xqd/Zry
 vgTM82DMzGIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9922"; a="188984931"
X-IronPort-AV: E=Sophos;i="5.81,245,1610438400"; d="scan'208";a="188984931"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2021 05:58:07 -0800
IronPort-SDR: T1Zq2z4YW15jCVrttORPG8yo8safoQ/h4rS8XY9uT6+k7fNz1d8qdubnSM/qOuMa4Ny6GvIvvm
 CXG7HkePVc2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,245,1610438400"; d="scan'208";a="432217592"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.9])
 by fmsmga004.fm.intel.com with ESMTP; 13 Mar 2021 05:58:03 -0800
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: Add rt1015p speaker amp support
Date: Sat, 13 Mar 2021 21:40:38 +0800
Message-Id: <20210313134038.5577-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Dharageswari R <dharageswari.r@intel.com>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Fred Oh <fred.oh@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
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

This patch adds jsl_rt5682_rt1015p which supports the
RT5682 headset codec and RT1015P speaker amplifier combination
on JasperLake platform.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/codecs/rt1015p.c                    | 10 ++
 sound/soc/intel/boards/Kconfig                |  1 +
 sound/soc/intel/boards/sof_realtek_common.c   | 94 +++++++++++++++++++
 sound/soc/intel/boards/sof_realtek_common.h   |  8 ++
 sound/soc/intel/boards/sof_rt5682.c           | 31 +++++-
 .../intel/common/soc-acpi-intel-jsl-match.c   | 13 +++
 6 files changed, 155 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1015p.c b/sound/soc/codecs/rt1015p.c
index 671f2a2130fe..3a564272156b 100644
--- a/sound/soc/codecs/rt1015p.c
+++ b/sound/soc/codecs/rt1015p.c
@@ -4,6 +4,7 @@
 //
 // Copyright 2020 The Linux Foundation. All rights reserved.
 
+#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -130,10 +131,19 @@ static const struct of_device_id rt1015p_device_id[] = {
 MODULE_DEVICE_TABLE(of, rt1015p_device_id);
 #endif
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id rt1015p_acpi_match[] = {
+	{ "RTL1015", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, rt1015p_acpi_match);
+#endif
+
 static struct platform_driver rt1015p_platform_driver = {
 	.driver = {
 		.name = "rt1015p",
 		.of_match_table = of_match_ptr(rt1015p_device_id),
+		.acpi_match_table = ACPI_PTR(rt1015p_acpi_match),
 	},
 	.probe = rt1015p_platform_probe,
 };
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index d1d28129a32b..58379393b8e4 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -457,6 +457,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_RT1011
 	select SND_SOC_RT1015
+	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index f3cf73c620ba..4b95aa2cbff8 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -136,3 +136,97 @@ void sof_rt1011_codec_conf(struct snd_soc_card *card)
 	card->codec_conf = rt1011_codec_confs;
 	card->num_configs = ARRAY_SIZE(rt1011_codec_confs);
 }
+
+#define RT1015P_SHARE_EN_SPK	BIT(0)
+
+static unsigned long rt1015p_quirk;
+
+static const struct snd_soc_dapm_route rt1015p_dapm_routes[] = {
+	/* speaker */
+	{ "Left Spk", NULL, "Left Speaker" },
+	{ "Right Spk", NULL, "Right Speaker" },
+};
+
+static const struct snd_soc_dapm_route rt1015p_share_en_spk_dapm_routes[] = {
+	/* speaker */
+	{ "Left Spk", NULL, "Speaker" },
+	{ "Right Spk", NULL, "Speaker" },
+};
+
+static struct snd_soc_codec_conf rt1015p_codec_confs[] = {
+	{
+		.dlc = COMP_CODEC_CONF(RT1015P_DEV0_NAME),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1015P_DEV1_NAME),
+		.name_prefix = "Right",
+	},
+};
+
+static struct snd_soc_dai_link_component rt1015p_dai_link_components[] = {
+	{
+		.name = RT1015P_DEV0_NAME,
+		.dai_name = RT1015P_CODEC_DAI,
+	},
+	{
+		.name = RT1015P_DEV1_NAME,
+		.dai_name = RT1015P_CODEC_DAI,
+	},
+};
+
+void sof_rt1015p_set_share_en_spk(void)
+{
+	/* Two amps share one en pin so there is only one device in acpi
+	 * table
+	 */
+	rt1015p_quirk |= RT1015P_SHARE_EN_SPK;
+}
+
+static int rt1015p_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params)
+{
+	/* reserved for debugging purpose */
+
+	return 0;
+}
+
+static const struct snd_soc_ops rt1015p_ops = {
+	.hw_params = rt1015p_hw_params,
+};
+
+static int rt1015p_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	if (rt1015p_quirk & RT1015P_SHARE_EN_SPK)
+		ret = snd_soc_dapm_add_routes(&card->dapm, rt1015p_share_en_spk_dapm_routes,
+					      ARRAY_SIZE(rt1015p_share_en_spk_dapm_routes));
+	else
+		ret = snd_soc_dapm_add_routes(&card->dapm, rt1015p_dapm_routes,
+					      ARRAY_SIZE(rt1015p_dapm_routes));
+	if (ret)
+		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
+	return ret;
+}
+
+void sof_rt1015p_dai_link(struct snd_soc_dai_link *link)
+{
+	link->codecs = rt1015p_dai_link_components;
+	if (rt1015p_quirk & RT1015P_SHARE_EN_SPK)
+		link->num_codecs = 1;
+	else
+		link->num_codecs = ARRAY_SIZE(rt1015p_dai_link_components);
+	link->init = rt1015p_init;
+	link->ops = &rt1015p_ops;
+}
+
+void sof_rt1015p_codec_conf(struct snd_soc_card *card)
+{
+	if (rt1015p_quirk & RT1015P_SHARE_EN_SPK)
+		return;
+
+	card->codec_conf = rt1015p_codec_confs;
+	card->num_configs = ARRAY_SIZE(rt1015p_codec_confs);
+}
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index 87cb3812b926..d7865681f2bd 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -21,4 +21,12 @@
 void sof_rt1011_dai_link(struct snd_soc_dai_link *link);
 void sof_rt1011_codec_conf(struct snd_soc_card *card);
 
+#define RT1015P_CODEC_DAI	"HiFi"
+#define RT1015P_DEV0_NAME	"RTL1015:00"
+#define RT1015P_DEV1_NAME	"RTL1015:01"
+
+void sof_rt1015p_set_share_en_spk(void);
+void sof_rt1015p_dai_link(struct snd_soc_dai_link *link);
+void sof_rt1015p_codec_conf(struct snd_soc_card *card);
+
 #endif /* __SOF_REALTEK_COMMON_H */
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 55505e207bc0..154f2ee9f406 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -45,8 +45,9 @@
 #define SOF_RT1011_SPEAKER_AMP_PRESENT		BIT(13)
 #define SOF_RT1015_SPEAKER_AMP_PRESENT		BIT(14)
 #define SOF_RT1015_SPEAKER_AMP_100FS		BIT(15)
-#define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(16)
-#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(17)
+#define SOF_RT1015P_SPEAKER_AMP_PRESENT		BIT(16)
+#define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(17)
+#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(18)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -723,6 +724,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = ARRAY_SIZE(rt1015_components);
 			links[id].init = speaker_codec_init_lr;
 			links[id].ops = &sof_rt1015_ops;
+		} else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT) {
+			sof_rt1015p_dai_link(&links[id]);
 		} else if (sof_rt5682_quirk &
 				SOF_MAX98373_SPEAKER_AMP_PRESENT) {
 			links[id].codecs = max_98373_components;
@@ -847,10 +850,24 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT)
 		sof_audio_card_rt5682.num_links++;
 
+	/* setup amp quirk if any */
+	if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT) {
+		/* There may be only one device instance if two amps
+		 * sharing one en pin
+		 */
+		if (!acpi_dev_present("RTL1015", "1", -1)) {
+			dev_dbg(&pdev->dev, "Device %s not exist\n",
+				RT1015P_DEV1_NAME);
+			sof_rt1015p_set_share_en_spk();
+		}
+	}
+
 	if (sof_rt5682_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT)
 		sof_max98373_codec_conf(&sof_audio_card_rt5682);
 	else if (sof_rt5682_quirk & SOF_RT1011_SPEAKER_AMP_PRESENT)
 		sof_rt1011_codec_conf(&sof_audio_card_rt5682);
+	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
+		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
 					      dmic_be_num, hdmi_num);
@@ -940,6 +957,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(1) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.name = "jsl_rt5682_rt1015p",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1015P_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1)),
+	},
 	{ }
 };
 
@@ -966,3 +992,4 @@ MODULE_ALIAS("platform:tgl_max98373_rt5682");
 MODULE_ALIAS("platform:jsl_rt5682_max98360a");
 MODULE_ALIAS("platform:cml_rt1015_rt5682");
 MODULE_ALIAS("platform:tgl_rt1011_rt5682");
+MODULE_ALIAS("platform:jsl_rt5682_rt1015p");
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 52238db0bcb5..73fe4f89a82d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -19,6 +19,11 @@ static struct snd_soc_acpi_codecs rt1015_spk = {
 	.codecs = {"10EC1015"}
 };
 
+static struct snd_soc_acpi_codecs rt1015p_spk = {
+	.num_codecs = 1,
+	.codecs = {"RTL1015"}
+};
+
 static struct snd_soc_acpi_codecs mx98360a_spk = {
 	.num_codecs = 1,
 	.codecs = {"MX98360A"}
@@ -52,6 +57,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 		.quirk_data = &rt1015_spk,
 		.sof_tplg_filename = "sof-jsl-rt5682-rt1015.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "jsl_rt5682_rt1015p",
+		.sof_fw_filename = "sof-jsl.ri",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rt1015p_spk,
+		.sof_tplg_filename = "sof-jsl-rt5682-rt1015.tplg",
+	},
 	{
 		.id = "10EC5682",
 		.drv_name = "jsl_rt5682_max98360a",
-- 
2.17.1

