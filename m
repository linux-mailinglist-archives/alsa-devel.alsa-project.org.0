Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BB46C3CE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 20:42:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88D732536;
	Tue,  7 Dec 2021 20:41:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88D732536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638906135;
	bh=RT2GWVqJ3fte5IG8z3hJRHwDo4PIBQdfRoazF55brKA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GNoOLyaSppci6555ecqMG1CO2g1o2KgVPDP52S/oVPtDxKtqG/Qd3soNSQft0UvFK
	 d2aJ+C6MTvR4g81hN9S0H8dakeUFDvl7rCF8CA4FKNWnf6lDRMvilFpsHZfznhTrQe
	 XUywwOLPNngmt1vQK0FtNMxhxiw1nkizYfbLaWAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95424F8050F;
	Tue,  7 Dec 2021 20:40:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D245AF80506; Tue,  7 Dec 2021 20:40:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0110F80253
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 20:40:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0110F80253
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236407807"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="236407807"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:09 -0800
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="479641158"
Received: from nthiag2-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.74.17])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 11:40:08 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ASoC: SOF: Intel: hda-stream: limit PROCEN workaround
Date: Tue,  7 Dec 2021 13:39:42 -0600
Message-Id: <20211207193947.71080-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
References: <20211207193947.71080-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/intel/apl.c        |  1 +
 sound/soc/sof/intel/hda-stream.c | 18 ++++++++++++------
 sound/soc/sof/intel/shim.h       |  4 ++++
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 8778f46f1d37..810b8b6748a0 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -147,5 +147,6 @@ const struct sof_intel_dsp_desc apl_chip_info = {
 	.rom_init_timeout	= 150,
 	.ssp_count = APL_SSP_COUNT,
 	.ssp_base_offset = APL_SSP_BASE_OFFSET,
+	.quirks = SOF_INTEL_PROCEN_FMT_QUIRK,
 };
 EXPORT_SYMBOL_NS(apl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 440827ce390d..5f9eb5bdcdba 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -472,6 +472,7 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 			     struct snd_dma_buffer *dmab,
 			     struct snd_pcm_hw_params *params)
 {
+	const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct hdac_stream *hstream = &stream->hstream;
 	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
@@ -584,6 +585,7 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
 
 	/*
 	 * Recommended hardware programming sequence for HDAudio DMA format
+	 * on earlier platforms - this is not needed on newer platforms
 	 *
 	 * 1. Put DMA into coupled mode by clearing PPCTL.PROCEN bit
 	 *    for corresponding stream index before the time of writing
@@ -593,9 +595,11 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
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
@@ -603,9 +607,11 @@ int hda_dsp_stream_hw_params(struct snd_sof_dev *sdev,
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
index 08c53cb41ea7..f36cd9d5eb94 100644
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
2.25.1

