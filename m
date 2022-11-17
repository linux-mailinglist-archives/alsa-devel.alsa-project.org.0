Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC60562E97C
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 00:21:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 692AB16D6;
	Fri, 18 Nov 2022 00:20:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 692AB16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668727271;
	bh=7y6E3Dw88xA2fKNQRbVAaY+BSYFGrlIYsyasmJ8/7q0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y+/dPSQedJMY3Mm7WBfckO5298HutL0cqgHHFUAlZorFQp+FakuCixxImSJjFIvEZ
	 +SJchU1wj7Q+eV9io9yiVRhLXUmL1SY+0WBmgICR5ivy1568jlL8p67WTamOsawgkN
	 QghY347634EEIhQXAXZxA7w2+XCpaggqbsyLX19g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF8BEF804BD;
	Fri, 18 Nov 2022 00:20:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 833C7F8025A; Fri, 18 Nov 2022 00:20:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4872F80087
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 00:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4872F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hbnVXgFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668727211; x=1700263211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7y6E3Dw88xA2fKNQRbVAaY+BSYFGrlIYsyasmJ8/7q0=;
 b=hbnVXgFkFvgwnknDRHN6rbukpCvdPeMoxq61uAtOkK/C3PTckHpwex0f
 UHi2MsasU781/5XvdFxFnLOI4DdFL0+x1ipI+qZlv9ifolz1sOVdLlR4M
 uHeiAvQmJWDv8jNf14rX8LKWQ005pq2mLVQHfz6tGAEezHs7iquDp/l6X
 88K39a4J6UZUe9Mpvfkz4DX3+KOyN1m8xhFrJncGpbkvDV1QiPElb6tox
 iemY6p++gnZjeMrdklOTdIin0MWGmd0bvoPL0LNpfemSL3yaYk3eOU0gz
 RKK6Zk0jDRnTmlq0kTD1j1YRb/BeR2kROInwcOesf7a0DWMrOBfSFpqAB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="339835095"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="339835095"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 15:20:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="969063538"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="969063538"
Received: from ticela-or-133.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.0.242])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 15:19:54 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_nau8825: support rt1015p speaker amplifier
Date: Thu, 17 Nov 2022 17:19:19 -0600
Message-Id: <20221117231919.112483-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

Add rt1015p speaker amplifier support with a new board info
'adl_rt1015p_nau8825' which supports NAU8825 on SSP0 and ALC1015Q on
SSP1.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_nau8825.c             | 16 ++++++++++++++++
 .../soc/intel/common/soc-acpi-intel-adl-match.c  | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 5585c217f78d3..27880224359d5 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -47,6 +47,7 @@
 #define SOF_RT1019P_SPEAKER_AMP_PRESENT	BIT(14)
 #define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(15)
 #define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(16)
+#define SOF_RT1015P_SPEAKER_AMP_PRESENT	BIT(17)
 
 static unsigned long sof_nau8825_quirk = SOF_NAU8825_SSP_CODEC(0);
 
@@ -483,6 +484,8 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		} else if (sof_nau8825_quirk &
 				SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
 			max_98360a_dai_link(&links[id]);
+		} else if (sof_nau8825_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT) {
+			sof_rt1015p_dai_link(&links[id]);
 		} else {
 			goto devm_err;
 		}
@@ -576,6 +579,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	if (sof_nau8825_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT)
 		max_98373_set_codec_conf(&sof_audio_card_nau8825);
+	else if (sof_nau8825_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
+		sof_rt1015p_codec_conf(&sof_audio_card_nau8825);
 
 	if (sof_nau8825_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		sof_audio_card_nau8825.num_links++;
@@ -642,6 +647,16 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 
 	},
+	{
+		.name = "adl_rt1015p_nau8825",
+		.driver_data = (kernel_ulong_t)(SOF_NAU8825_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1015P_SPEAKER_AMP_PRESENT |
+					SOF_NAU8825_SSP_AMP(1) |
+					SOF_NAU8825_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
@@ -663,3 +678,4 @@ MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
+MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 3ca0a96d94de8..60aee56f94bd4 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -430,6 +430,11 @@ static const struct snd_soc_acpi_codecs adl_rt5682_rt5682s_hp = {
 	.codecs = {"10EC5682", "RTL5682"},
 };
 
+static const struct snd_soc_acpi_codecs adl_rt1015p_amp = {
+	.num_codecs = 1,
+	.codecs = {"RTL1015"}
+};
+
 static const struct snd_soc_acpi_codecs adl_rt1019p_amp = {
 	.num_codecs = 1,
 	.codecs = {"RTL1019"}
@@ -495,6 +500,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_rt1019p_amp,
 		.sof_tplg_filename = "sof-adl-rt1019-rt5682.tplg",
 	},
+	{
+		.id = "10508825",
+		.drv_name = "adl_rt1015p_nau8825",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_rt1015p_amp,
+		.sof_tplg_filename = "sof-adl-rt1015-nau8825.tplg",
+	},
 	{
 		.id = "10508825",
 		.drv_name = "sof_nau8825",
-- 
2.34.1

