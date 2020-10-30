Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B99AB2A0C4F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 18:18:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CC8C1669;
	Fri, 30 Oct 2020 18:18:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CC8C1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604078334;
	bh=+3TFYw1v5smrVWURjd+c0MqPetr+sel7GzQkhtMeNCQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hFNsRmZYFrv0PzPfXzCgr0DS2oEtmA5whJgU1yHKggywmwDC2ai4GSi//BRy93A1H
	 J7QIv55bBC6t6rj9sA9wxPunkHXe4qb4iXQsvEkXdpBUZOxu410pOw/aEH2vz+qJhL
	 OVh7/so5shquFVp7nZ1TVUM/SWuoBK9cgO3skwr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AE1DF80272;
	Fri, 30 Oct 2020 18:17:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BFC4F8026D; Fri, 30 Oct 2020 18:17:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F277F801D5
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 18:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F277F801D5
IronPort-SDR: 60OPVHsdSIeMuS352JTWvlV/Wr3NTdWbJhNaWTOiA/Fy3puARXgu6GFsWhVf0DmCrsMlxsLtBb
 Ky4g4rQInBYw==
X-IronPort-AV: E=McAfee;i="6000,8403,9790"; a="165140697"
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="165140697"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 10:17:06 -0700
IronPort-SDR: REZdqGsfO0lhEiNQEg7uJ62osnnXhS83DVJ6sHWUUBc84u+B+hYO2tE6jwcaQL4UqYpNbAAJaU
 L/qRkJjggHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,434,1596524400"; d="scan'208";a="469584699"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by orsmga004.jf.intel.com with ESMTP; 30 Oct 2020 10:17:02 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ASoC: intel: sof_rt5682: Add support for
 cml_rt1015_rt5682
Date: Sat, 31 Oct 2020 01:05:58 +0800
Message-Id: <20201030170559.20370-2-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201030170559.20370-1-brent.lu@intel.com>
References: <20201030170559.20370-1-brent.lu@intel.com>
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

