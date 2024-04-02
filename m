Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4E5895801
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:19:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 423702C32;
	Tue,  2 Apr 2024 17:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 423702C32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071177;
	bh=HoaNNXuPU7N8X9DQGEvbTrS2CyF30mmJSOl1g25k9ZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a8AYYN9Mamr77dx7848M/KTxK4kvGbqehXc8F2o3tPKaxo5xLAMHJgqfAwLTxDcZO
	 FGT6+Wmsa9Uj934lutEelcIbF4/eRLGJtjxhys6SrtObVAP3RZS9vaRe8zmTcvr4yw
	 F0Y3OzmHfZmlZZ46O+sO59kGQCSKNUON3EsPHyLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84FB1F80007; Tue,  2 Apr 2024 17:18:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84E6FF805D8;
	Tue,  2 Apr 2024 17:18:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44EDEF80568; Tue,  2 Apr 2024 17:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC1C8F8020D
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC1C8F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nZZw+SBY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071126; x=1743607126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HoaNNXuPU7N8X9DQGEvbTrS2CyF30mmJSOl1g25k9ZE=;
  b=nZZw+SBY+L9Hqf0CICGS9mLWXpKl9TSMFkqBVV6UthKUdsbAOEVtVI1T
   9Hdhdl+bujrUOcim//t0W2AB2Bxmqkj7AVekNyWUEDYe5to+dGZKtMyXJ
   /ZYP34bNlNaDvwUY9wxXu3LAGbBFWnJpywx3C1Gdicaz7bM8pEx8oWqjH
   GC9epESLB/z4/hLRlK/fjR2iuW39a6ghuLMIf3xrfC//5sBemugLP5Hpf
   P/LHgAmTAL9aK89xVTMl6pSOJ1MH249QzFP+iVo6va0bPCIz9wIP2z6Gd
   2boTc50GDYwwX7ZZ4e/4rTkdu1qxEubKcSxOqRVM6ErbqNysJXsRsB/vl
   Q==;
X-CSE-ConnectionGUID: 5niAjsWxR8KDV7hRQF5F9w==
X-CSE-MsgGUID: mueACP8ES9qwRbuBUFGmZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729917"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29729917"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:37 -0700
X-CSE-ConnectionGUID: LEG2b/CGR1WJ65vD/Rm2CQ==
X-CSE-MsgGUID: EIodZmpMQ2KWwH3IRWMnyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796488"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/17] Revert "ASoC: SOF: Intel: hda-dai-ops: reset device
 count for SoundWire DAIs"
Date: Tue,  2 Apr 2024 10:18:13 -0500
Message-Id: <20240402151828.175002-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GB3MEUPJOK6XQUH5MKOOP3N5TWNMOAHD
X-Message-ID-Hash: GB3MEUPJOK6XQUH5MKOOP3N5TWNMOAHD
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GB3MEUPJOK6XQUH5MKOOP3N5TWNMOAHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

This reverts commit 699e146d9ebf42ee2a5d4e4e28f7a49c4aef0105.
Don't reset device_count as we will use the multi-gateway firmware
configuration.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index b073720b4cf4..e17b83575e84 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -446,28 +446,6 @@ static int hda_ipc4_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *c
 	return ret;
 }
 
-static struct hdac_ext_stream *sdw_hda_ipc4_get_hext_stream(struct snd_sof_dev *sdev,
-							    struct snd_soc_dai *cpu_dai,
-							    struct snd_pcm_substream *substream)
-{
-	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
-	struct snd_sof_widget *swidget = w->dobj.private;
-	struct snd_sof_dai *dai = swidget->private;
-	struct sof_ipc4_copier *ipc4_copier = dai->private;
-	struct sof_ipc4_alh_configuration_blob *blob;
-
-	blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
-
-	/*
-	 * Starting with ACE_2_0, re-setting the device_count is mandatory to avoid using
-	 * the multi-gateway firmware configuration. The DMA hardware can take care of
-	 * multiple links without needing any firmware assistance
-	 */
-	blob->alh_cfg.device_count = 1;
-
-	return hda_ipc4_get_hext_stream(sdev, cpu_dai, substream);
-}
-
 static const struct hda_dai_widget_dma_ops hda_ipc4_dma_ops = {
 	.get_hext_stream = hda_ipc4_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
@@ -509,7 +487,7 @@ static const struct hda_dai_widget_dma_ops dmic_ipc4_dma_ops = {
 };
 
 static const struct hda_dai_widget_dma_ops sdw_ipc4_dma_ops = {
-	.get_hext_stream = sdw_hda_ipc4_get_hext_stream,
+	.get_hext_stream = hda_ipc4_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
 	.release_hext_stream = hda_release_hext_stream,
 	.setup_hext_stream = hda_setup_hext_stream,
-- 
2.40.1

