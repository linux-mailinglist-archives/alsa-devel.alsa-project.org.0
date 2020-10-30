Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4016129FE04
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 07:50:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF675852;
	Fri, 30 Oct 2020 07:49:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF675852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604040604;
	bh=+3TFYw1v5smrVWURjd+c0MqPetr+sel7GzQkhtMeNCQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aixdxe1jkmzW2l+xHt/7LxWmsak2XUoW95+GAjbsn7EPq/pHN/F4Krs05FSNKQSaI
	 To/wlqqQazpoeY829FI4qI32a4nOatHd6hgnHIQPuqfdjWtvtJ2vEaQPl4NlBcOERv
	 NssrgpltwmCnJ7UIV8tXuVPSI28kUhuFQaPu2brk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31FD5F80272;
	Fri, 30 Oct 2020 07:48:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEB20F8027C; Fri, 30 Oct 2020 07:48:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E3F9F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 07:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E3F9F800FF
IronPort-SDR: kQmJ8Dqo9IOTdhJ2gwi3hrRXFpzwBekEhc/aymJWyx/DZDNm0MFAyIOkNYMuPCXKCIuqlDk8sN
 jmBTBZ/5qdbA==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="168697915"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="168697915"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 23:48:10 -0700
IronPort-SDR: odUDv82yv3m710U8A1F0Q1QKJQOSF2p4aN26FbfsMiU4Gg2PSLiXvSVNyLw2XCc/joiYNEbV2y
 lrez1fiADCmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="361760838"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2020 23:48:02 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: intel: sof_rt5682: Add support for cml_rt1015_rt5682
Date: Fri, 30 Oct 2020 14:36:53 +0800
Message-Id: <20201030063654.25877-2-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201030063654.25877-1-brent.lu@intel.com>
References: <20201030063654.25877-1-brent.lu@intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
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

This patch adds the driver data and updates quirk info for cml with
rt1015 speaker amp and rt5682 headset codec. Due to different mclk
frequency on JSL and CML, we need to use 4 slot TDM 100fs to avoid
the SSP m/n counter.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c           | 47 +++++++++++++++++--
 .../intel/common/soc-acpi-intel-cml-match.c   | 13 +++++
 2 files changed, 55 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index ddbb9fe7cc06..7701957e0eb7 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -42,8 +42,9 @@
 #define SOF_RT5682_NUM_HDMIDEV(quirk)	\
 	((quirk << SOF_RT5682_NUM_HDMIDEV_SHIFT) & SOF_RT5682_NUM_HDMIDEV_MASK)
 #define SOF_RT1015_SPEAKER_AMP_PRESENT		BIT(13)
-#define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(14)
-#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(15)
+#define SOF_RT1015_SPEAKER_AMP_100FS		BIT(14)
+#define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(15)
+#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(16)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -291,21 +292,26 @@ static int sof_rt1015_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *codec_dai;
-	int i, ret;
+	int i, fs, ret;
 
 	if (!snd_soc_card_get_codec_dai(card, "rt1015-aif"))
 		return 0;
 
+	if (sof_rt5682_quirk & SOF_RT1015_SPEAKER_AMP_100FS)
+		fs = 100;
+	else
+		fs = 64;
+
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
 		/* Set tdm/i2s1 master bclk ratio */
-		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+		ret = snd_soc_dai_set_bclk_ratio(codec_dai, fs);
 		if (ret < 0) {
 			dev_err(card->dev, "failed to set bclk ratio\n");
 			return ret;
 		}
 
 		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
-					  params_rate(params) * 64,
+					  params_rate(params) * fs,
 					  params_rate(params) * 256);
 		if (ret < 0) {
 			dev_err(card->dev, "failed to set pll\n");
@@ -319,6 +325,26 @@ static int sof_rt1015_hw_params(struct snd_pcm_substream *substream,
 			dev_err(card->dev, "failed to set sysclk\n");
 			return ret;
 		}
+
+		if (sof_rt5682_quirk & SOF_RT1015_SPEAKER_AMP_100FS) {
+			if (!strcmp(codec_dai->component->name, "i2c-10EC1015:00")) {
+				ret = snd_soc_dai_set_tdm_slot(codec_dai,
+							       0x0, 0x1, 4, 24);
+				if (ret < 0) {
+					dev_err(card->dev, "failed to set tdm slot\n");
+					return ret;
+				}
+			}
+
+			if (!strcmp(codec_dai->component->name, "i2c-10EC1015:01")) {
+				ret = snd_soc_dai_set_tdm_slot(codec_dai,
+							       0x0, 0x2, 4, 24);
+				if (ret < 0) {
+					dev_err(card->dev, "failed to set tdm slot\n");
+					return ret;
+				}
+			}
+		}
 	}
 
 	return 0;
@@ -875,6 +901,16 @@ static const struct platform_device_id board_ids[] = {
 					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1)),
 	},
+	{
+		.name = "cml_rt1015_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_MCLK_24MHZ |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1015_SPEAKER_AMP_PRESENT |
+					SOF_RT1015_SPEAKER_AMP_100FS |
+					SOF_RT5682_SSP_AMP(1)),
+	},
 	{ }
 };
 
@@ -898,3 +934,4 @@ MODULE_ALIAS("platform:tgl_max98357a_rt5682");
 MODULE_ALIAS("platform:jsl_rt5682_rt1015");
 MODULE_ALIAS("platform:tgl_max98373_rt5682");
 MODULE_ALIAS("platform:jsl_rt5682_max98360a");
+MODULE_ALIAS("platform:cml_rt1015_rt5682");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 26dde88bb227..adddc91918df 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -14,6 +14,11 @@ static struct snd_soc_acpi_codecs rt1011_spk_codecs = {
 	.codecs = {"10EC1011"}
 };
 
+static struct snd_soc_acpi_codecs rt1015_spk_codecs = {
+	.num_codecs = 1,
+	.codecs = {"10EC1015"}
+};
+
 static struct snd_soc_acpi_codecs max98357a_spk_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
@@ -38,6 +43,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-rt1011-rt5682.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "cml_rt1015_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rt1015_spk_codecs,
+		.sof_fw_filename = "sof-cml.ri",
+		.sof_tplg_filename = "sof-cml-rt1011-rt5682.tplg",
+	},
 	{
 		.id = "10EC5682",
 		.drv_name = "sof_rt5682",
-- 
2.17.1

