Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B92E7C7673
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:12:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868C3E0D;
	Thu, 12 Oct 2023 21:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868C3E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697137921;
	bh=Jk/IR5hAIkLzvMlWGFoxvChO01eJ/fWYtdD8FpRdgFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RnHlVgo0BptQ1nIwWnV8ukjBvcRpKYZfdHdNT0eUF7nVdKEpeAy/+mriSIohK/8Vp
	 rdRh7/yX+yihPGlicZy2JR8dJMFZpdCiPJZxRl+UdhY3sW4C9DBJ7XKEjzhn2wByu5
	 DUGPKzYa3DkEt6OWEUST17qIUDCBqb/bBP0H4Dvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8DCCF805D3; Thu, 12 Oct 2023 21:09:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BCD5F805D8;
	Thu, 12 Oct 2023 21:09:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1F5BF805B5; Thu, 12 Oct 2023 21:09:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EA80F80558
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EA80F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JZhtNCQ2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137742; x=1728673742;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jk/IR5hAIkLzvMlWGFoxvChO01eJ/fWYtdD8FpRdgFI=;
  b=JZhtNCQ2dBd/vg65CADciAY91GJZhH5ur+m540l8rdJjuwF9Q8GQwUi9
   WpgMC+Jyilz05PfL1uqIxhhYYVS1dUzkibc7RC7BGH7P+BrELPQRnumRB
   VH0o2hNNWfsxj/To8m9H39eQ0hqJn1BVFf9c6/XKahOagx3/APzuDn2cw
   gMphe3XYsBj7HNX9YsAlF52zcEskBI3in16ywNhUibKEObiuyYdVPu9Dc
   aQ0L+ZVlrGLs6fkButW+ZsSLmKQRFISAGs7OkPLORd1xa0jRonr0fUMya
   226wCukU7bDXr/kcaCb8ekbKIp7X7Yr6k4b4fct1awBR1DFzYNEgfZD1V
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060200"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060200"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108075"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108075"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 09/23] ASoC: Intel: sof_nau8825: remove hdac-hdmi support
Date: Thu, 12 Oct 2023 15:08:12 -0400
Message-Id: <20231012190826.142619-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XRPGKTGMZVAVCHOW6LFNHBJOVOPDZAO3
X-Message-ID-Hash: XRPGKTGMZVAVCHOW6LFNHBJOVOPDZAO3
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XRPGKTGMZVAVCHOW6LFNHBJOVOPDZAO3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Remove hdac-hdmi support code since we are now using
snd-hda-codec-hdmi codec driver for hdmi.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig       |  1 -
 sound/soc/intel/boards/sof_nau8825.c | 11 ++---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index d130244c8705..b5f3887e0323 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -564,7 +564,6 @@ config SND_SOC_INTEL_SOF_NAU8825_MACH
 	select SND_SOC_MAX98357A
 	select SND_SOC_NAU8315
 	select SND_SOC_DMIC
-	select SND_SOC_HDAC_HDMI
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
 	select SND_SOC_INTEL_SOF_NUVOTON_COMMON
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index f9a52dab034f..496a6401404d 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -26,8 +26,6 @@
 #include "sof_nuvoton_common.h"
 #include "sof_ssp_common.h"
 
-#define NAME_SIZE 32
-
 #define SOF_NAU8825_SSP_CODEC(quirk)		((quirk) & GENMASK(2, 0))
 #define SOF_NAU8825_SSP_CODEC_MASK		(GENMASK(2, 0))
 #define SOF_NAU8825_SSP_AMP_SHIFT		4
@@ -51,7 +49,6 @@ static unsigned long sof_nau8825_quirk = SOF_NAU8825_SSP_CODEC(0);
 struct sof_hdmi_pcm {
 	struct list_head head;
 	struct snd_soc_dai *codec_dai;
-	int device;
 };
 
 struct sof_card_private {
@@ -72,8 +69,6 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	if (!pcm)
 		return -ENOMEM;
 
-	/* dai_link id is 1:1 mapped to the PCM device */
-	pcm->device = rtd->dai_link->id;
 	pcm->codec_dai = dai;
 
 	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
@@ -398,7 +393,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 		links[id].num_codecs = 1;
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
-		links[id].init = sof_hdmi_init;
+		links[id].init = (i == 1) ? sof_hdmi_init : NULL;
 		links[id].dpcm_playback = 1;
 		links[id].no_pcm = 1;
 		id++;
@@ -485,8 +480,8 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 
 static int sof_audio_probe(struct platform_device *pdev)
 {
+	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct snd_soc_dai_link *dai_links;
-	struct snd_soc_acpi_mach *mach;
 	struct sof_card_private *ctx;
 	int dmic_be_num, hdmi_num;
 	int ret, ssp_amp, ssp_codec;
@@ -498,8 +493,6 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (pdev->id_entry && pdev->id_entry->driver_data)
 		sof_nau8825_quirk = (unsigned long)pdev->id_entry->driver_data;
 
-	mach = pdev->dev.platform_data;
-
 	ctx->codec_type = sof_ssp_detect_codec_type(&pdev->dev);
 	ctx->amp_type = sof_ssp_detect_amp_type(&pdev->dev);
 
-- 
2.39.2

