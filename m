Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB06700E9C
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 20:21:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0577E8B;
	Fri, 12 May 2023 20:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0577E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683915681;
	bh=EtXzLwzMdxRwbRgZD3mCOwT233lqZFKd7wEqPtTJ/l4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vVYjmEeZcMeFcXVqeOqg4xgKmOOGru8ieMtP6uGgN1hLvxZA8Z98zt9wvbgvg7tnA
	 ni0vyfW8YSSrZn/OrcTle+7n7VkGRbF4rDVTsGjRenU4V+BxT9yWUnjneXADppWr6S
	 WhVmz+X8zdGqqNiztitVocK6BYIh6aVhYsRnUPyY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD97DF805EA; Fri, 12 May 2023 20:18:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF32AF805E3;
	Fri, 12 May 2023 20:18:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DBF0F805AB; Fri, 12 May 2023 20:17:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEF83F8032D
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 20:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEF83F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N5rG0b1x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683915465; x=1715451465;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EtXzLwzMdxRwbRgZD3mCOwT233lqZFKd7wEqPtTJ/l4=;
  b=N5rG0b1xvCjJL4eEBUw246jBYJ7bSzJPfXdU3bUmfPbkZm5VSdDZfFJj
   ouQeOIMitlDA/gohDYKvQTCvETwI6EWiewB3exLO1Vb7aMztbIAFkDm78
   RaizXWhkVpOl/VSdmdBq6Ptlt1Bbo9kfUKa4jnd4tBLLwkUDLpfW6K2e9
   vtev1knAIQcNmJpjhlTqgJpSJ+wncRY65211skwGxygbreFZ07tPvtm99
   2NCirmwEEWybBWLNskHQf/Y9MczoyOxfiuoLPwf5Jt99CiIkXxzsiUPzM
   cXx01JqxINs0zmCe83/Lfq08UHXzb30iIuNG9zXZ+lkSIaAbVw7muS+cG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331223235"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="331223235"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769895101"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="769895101"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 8/9] ASoC: SOF: Intel: hda-dai: use HDA_LINK instead of
 HDA_AUDIO_CODEC
Date: Fri, 12 May 2023 13:17:01 -0500
Message-Id: <20230512181702.117483-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
References: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L2P2YNOTK7QJCDAPEIKCWL5SCZYUKD2Y
X-Message-ID-Hash: L2P2YNOTK7QJCDAPEIKCWL5SCZYUKD2Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2P2YNOTK7QJCDAPEIKCWL5SCZYUKD2Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For LunarLake support, we will have to use HDAudio DMA-based DAIs even
for SSP/DMIC/SoundWire. That's completely different to the
HDA_AUDIO_CODEC, the DAI ops deal with DMA configuration and that can
happen in the absence of any HDAudio codec.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 4 ++--
 sound/soc/sof/intel/hda-dai.c     | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 4b39cecacd68..d711351137f2 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -16,7 +16,7 @@
 #include "hda.h"
 
 /* These ops are only applicable for the HDA DAI's in their current form */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_LINK)
 /*
  * This function checks if the host dma channel corresponding
  * to the link DMA stream_tag argument is assigned to one
@@ -350,7 +350,7 @@ static const struct hda_dai_widget_dma_ops hda_dspless_dma_ops = {
 const struct hda_dai_widget_dma_ops *
 hda_select_dai_widget_ops(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_LINK)
 	struct snd_sof_dai *sdai;
 
 	if (sdev->dspless_mode_selected)
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 729f750fe746..09d8ee98581d 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -61,7 +61,7 @@ int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_LINK)
 
 static struct snd_sof_dev *dai_to_sdev(struct snd_pcm_substream *substream,
 				       struct snd_soc_dai *cpu_dai)
@@ -319,6 +319,8 @@ static int __maybe_unused hda_dai_trigger(struct snd_pcm_substream *substream, i
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+
 static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
@@ -334,6 +336,8 @@ static const struct snd_soc_dai_ops hda_dai_ops = {
 	.prepare = hda_dai_prepare,
 };
 
+#endif
+
 static int hda_dai_suspend(struct hdac_bus *bus)
 {
 	struct snd_soc_pcm_runtime *rtd;
@@ -582,7 +586,7 @@ int hda_dsp_dais_suspend(struct snd_sof_dev *sdev)
 	 * Since the component suspend is called last, we can trap this corner case
 	 * and force the DAIs to release their resources.
 	 */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_LINK)
 	int ret;
 
 	ret = hda_dai_suspend(sof_to_bus(sdev));
-- 
2.37.2

