Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F10C641AA8B
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 10:24:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9129216A4;
	Tue, 28 Sep 2021 10:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9129216A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632817456;
	bh=TAOQ3n02LnLMD/d0Jv29nNh170QG4kBmyCdfSmqXsqo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=j5Rlmx8M7B2lghTmaNsSyxCBfxTflnXe4Mtsbn5HdI8ymYee4G8s1/lB9knPDb+O3
	 XW1jzBaDPpM/c6NAAUvjIuqB9eMhEPVjB4WYfsiGFDF3eZh7wInhUh9ZdeULkhOkDq
	 kkwilZCFeK7MoZ6A9Kb3N8BoAnKG6XYzhQAgxWuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07EE7F804BC;
	Tue, 28 Sep 2021 10:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CFDDF8032C; Tue, 28 Sep 2021 10:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86FDFF800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 10:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86FDFF800DE
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="224714606"
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="224714606"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 01:22:46 -0700
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="561973697"
Received: from elisabal-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.220.25])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 01:22:44 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: hda-stream: limit PROCEN workaround
Date: Tue, 28 Sep 2021 11:22:48 +0300
Message-Id: <20210928082248.6081-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The work-around enabled in hda-stream.c is only required on earlier
versions of SOCs/PCH (Skylake, KabyLake, ApolloLake,
GeminiLake). Before setting the format on the host DMA, it is required
to couple the host and link DMA - which as a consequence shall use the
same format.

This patch introduces a quirk field in the platform descriptor and
makes the work-around conditional. Newer platforms have
no limitations on the use of host and link DMA, which can use
different formats.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/apl.c        |  1 +
 sound/soc/sof/intel/hda-stream.c | 18 ++++++++++++------
 sound/soc/sof/intel/shim.h       |  4 ++++
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index e6a1f6532547..16b7d8b1adff 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -143,5 +143,6 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	.rom_init_timeout	= 150,
 	.ssp_count = APL_SSP_COUNT,
 	.ssp_base_offset = APL_SSP_BASE_OFFSET,
+	.quirks = SOF_INTEL_PROCEN_FMT_QUIRK,
 };
 EXPORT_SYMBOL_NS(apl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 63c367478f1c..47a465b06da5 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -405,6 +405,7 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 			     struct snd_dma_buffer *dmab,
 			     struct snd_pcm_hw_params *params)
 {
+	const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hdac_stream *hstream = &stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
@@ -538,6 +539,7 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 
 	/*
 	 * Recommended hardware programming sequence for HDAudio DMA format
+	 * on earlier platforms - this is not needed on newer platforms
 	 *
 	 * 1. Put DMA into coupled mode by clearing PPCTL.PROCEN bit
 	 *    for corresponding stream index before the time of writing
@@ -547,9 +549,11 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 	 *    enable decoupled mode
 	 */
 
-	/* couple host and link DMA, disable DSP features */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
-				mask, 0);
+	if (chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK) {
+		/* couple host and link DMA, disable DSP features */
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
+					mask, 0);
+	}
 
 	/* program stream format */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
@@ -557,9 +561,11 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 				SOF_HDA_ADSP_REG_CL_SD_FORMAT,
 				0xffff, hstream->format_val);
 
-	/* decouple host and link DMA, enable DSP features */
-	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
-				mask, mask);
+	if (chip->quirks & SOF_INTEL_PROCEN_FMT_QUIRK) {
+		/* decouple host and link DMA, enable DSP features */
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
+					mask, mask);
+	}
 
 	/* program last valid index */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index e9f7d4d7fcce..8e2a0f4c0f66 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -151,6 +151,9 @@
 #define PCI_PMCS		0x84
 #define PCI_PMCS_PS_MASK	0x3
 
+/* Intel quirks */
+#define SOF_INTEL_PROCEN_FMT_QUIRK BIT(0)
+
 /* DSP hardware descriptor */
 struct sof_intel_dsp_desc {
 	int cores_num;
@@ -166,6 +169,7 @@ struct sof_intel_dsp_desc {
 	int ssp_base_offset;		/* base address of the SSPs */
 	u32 sdw_shim_base;
 	u32 sdw_alh_base;
+	u32 quirks;
 	bool (*check_sdw_irq)(struct snd_sof_dev *sdev);
 };
 
-- 
2.33.0

