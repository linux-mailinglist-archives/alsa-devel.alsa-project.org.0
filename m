Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A239CC03
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 03:03:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F0371732;
	Sun,  6 Jun 2021 03:02:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F0371732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622941429;
	bh=n7QgV2Fj5/bh/SIJTjXqtc2h5w3TuuUQxuVctwwzdVE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u7RtiFOqH2mJxQEQSIWk7VSUF1QkuakOmNMxtBHFQgS6yEEiixgasAWg273ov1Bej
	 qT1Tss//kzZis+98R0FWW4cG8tRD3unWFpEgcrUk6R3kjtipHSuMIr/OppN249htEQ
	 q8jhwrDAeqvA6+hlMpmXDbfTNnEzclDFBwh9OY40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A824F804BD;
	Sun,  6 Jun 2021 03:01:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78209F802DB; Sun,  6 Jun 2021 03:01:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB3F8F80254
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 03:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB3F8F80254
IronPort-SDR: CKr2CgX6Cg8qiuq2vjTm5/AfP7ZztKjSkG/OOhk4qSHjh5e7DxHzV6VqrtNKTvLjVRuq+6C2G5
 rBE07OfVkHWQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10006"; a="268330998"
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="268330998"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2021 18:01:32 -0700
IronPort-SDR: AZ3eSPObdmUe+44+03jvcZpaAfnWd9pGG2PZAyDB1Ol34l0UVaiF4IXwcAN+1cUkVHmw/wC4lw
 IulXnUiUANQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,252,1616482800"; d="scan'208";a="412724660"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.32])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2021 18:01:28 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: intel: sof_cs42l42: add support for
 jsl_cs4242_mx98360a
Date: Sun,  6 Jun 2021 08:41:01 +0800
Message-Id: <20210606004102.26190-4-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210606004102.26190-1-brent.lu@intel.com>
References: <20210606004102.26190-1-brent.lu@intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rander Wang <rander.wang@intel.com>, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yong Zhi <yong.zhi@intel.com>, Dharageswari R <dharageswari.r@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Naveen Manohar <naveen.m@intel.com>, Brent Lu <brent.lu@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org
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

This patch adds driver data for jsl_cs4242_mx98360a which supports two
max98360a speaker amplifiers on SSP1 and cs42l42 headphone codec on
SSP0 running on JSL platform. DAI format is leveraged from sof_rt5682
machine driver to reuse the topology.

Also use module device table to replace module alias.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c          | 22 +++++++++++++++----
 .../intel/common/soc-acpi-intel-jsl-match.c   |  8 +++++++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index e3171242f612..d712cfb91fd1 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -36,7 +36,9 @@
 #define SOF_CS42L42_NUM_HDMIDEV_MASK		(GENMASK(9, 7))
 #define SOF_CS42L42_NUM_HDMIDEV(quirk)	\
 	(((quirk) << SOF_CS42L42_NUM_HDMIDEV_SHIFT) & SOF_CS42L42_NUM_HDMIDEV_MASK)
-#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(10)
+#define SOF_CS42L42_BCLK_2400000		BIT(10)
+#define SOF_MAX98357A_SPEAKER_AMP_PRESENT	BIT(11)
+#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(12)
 
 /* Default: SSP2 */
 static unsigned long sof_cs42l42_quirk = SOF_CS42L42_SSP_CODEC(2);
@@ -122,7 +124,10 @@ static int sof_cs42l42_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	int clk_freq, ret;
 
-	clk_freq = 3072000; /* BCLK freq */
+	if (sof_cs42l42_quirk & SOF_CS42L42_BCLK_2400000)
+		clk_freq = 2400000; /* BCLK freq */
+	else
+		clk_freq = 3072000; /* BCLK freq */
 
 	/* Configure sysclk for codec */
 	ret = snd_soc_dai_set_sysclk(codec_dai, 0,
@@ -281,6 +286,8 @@ static int create_spk_amp_dai_links(struct device *dev,
 
 	if (sof_cs42l42_quirk & SOF_MAX98357A_SPEAKER_AMP_PRESENT) {
 		max_98357a_dai_link(&links[*id]);
+	} else if (sof_cs42l42_quirk & SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
+		max_98360a_dai_link(&links[*id]);
 	} else {
 		dev_err(dev, "no amp defined\n");
 		ret = -EINVAL;
@@ -584,8 +591,17 @@ static const struct platform_device_id board_ids[] = {
 					SOF_MAX98357A_SPEAKER_AMP_PRESENT |
 					SOF_CS42L42_SSP_AMP(1)),
 	},
+	{
+		.name = "jsl_cs4242_mx98360a",
+		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_CS42L42_SSP_AMP(1)) |
+					SOF_CS42L42_BCLK_2400000,
+	},
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, board_ids);
 
 static struct platform_driver sof_audio = {
 	.probe = sof_audio_probe,
@@ -601,7 +617,5 @@ module_platform_driver(sof_audio)
 MODULE_DESCRIPTION("SOF Audio Machine driver for CS42L42");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:sof_cs42l42");
-MODULE_ALIAS("platform:glk_cs4242_max98357a");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 73fe4f89a82d..8e86476d48de 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -73,6 +73,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 		.quirk_data = &mx98360a_spk,
 		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
 	},
+	{
+		.id = "10134242",
+		.drv_name = "jsl_cs4242_mx98360a",
+		.sof_fw_filename = "sof-jsl.ri",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &mx98360a_spk,
+		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_jsl_machines);
-- 
2.17.1

