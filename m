Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E0277310E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:15:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D19EEA4D;
	Mon,  7 Aug 2023 23:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D19EEA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442956;
	bh=7qz/wMkBZaTxQnPV20579hvjZnSrtb5lnRuYc8grnO4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DkLmYRywi5mIwogQqf+XWMzALxq6LRnBX0mHQKue8h+2814+cpBIPwY+di0X/xPQm
	 izab2SV3Wa9Uv2GIhwlsR0r6uiLxT5S+xtpNMAz7Mk1bwjOfGvC+2ODmrxJgXPOj4L
	 O9fwopEmkt3RGQdq5D9rldyeUUQ3twc9ZFAD50+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6178BF8061D; Mon,  7 Aug 2023 23:11:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14464F80620;
	Mon,  7 Aug 2023 23:11:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BA0BF805C0; Mon,  7 Aug 2023 23:10:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1D70F8055B
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1D70F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=esoq5eEe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442628; x=1722978628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7qz/wMkBZaTxQnPV20579hvjZnSrtb5lnRuYc8grnO4=;
  b=esoq5eEe3AxjfEbnw666yi5b09TGVt5D922pmCkGzCi4f1/ZyzNctvqF
   b+PvFWDU5ns/W/7fBvBqTqbRjV3pKYCqlXF2b7/fgHzZUE8mUkIgUdrFW
   6mrQkc3L8jiFU7LNuHpFW8fNvOJA0cIpr97o8EkhW3FJMXxDDCAqifmx4
   Zlk2OQPiAyeIbcO5GGD0jVHLRifhEzm+OctAZtjqW8NhpXmjY5OfJlF6m
   XWRZteNjBzCPN/mmbRKd55vTU0DBQkUghViwnoRXf3lWj+fiDVeicvgFJ
   v6IXp2LccoTLO94TEnvtf2xanUvbRRwdgcbq9cB1IvDmizItb2aK37p0u
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244393"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244393"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465259"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465259"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 18/20] ASoC: SOF: Intel: hda-dai-ops: reset device count for
 SoundWire DAIs
Date: Mon,  7 Aug 2023 16:09:57 -0500
Message-Id: <20230807210959.506849-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 22J7VFTCQOLYEFHSLL3JUW43XWNDW73P
X-Message-ID-Hash: 22J7VFTCQOLYEFHSLL3JUW43XWNDW73P
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The solution used before LunarLake relies on a 'Multi-gateway'
firmware configuration. This is no longer needed with the DMA hardware
handling multiple links directly. To avoid adding a platform-specific
quirk in the generic IPC4 code, this patch resets the device count
when fetching the stream context.

Suggested-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 4ae211141c40..ae4a5aa73bfc 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -434,6 +434,28 @@ static int hda_ipc4_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *c
 	return ret;
 }
 
+static struct hdac_ext_stream *sdw_hda_ipc4_get_hext_stream(struct snd_sof_dev *sdev,
+							    struct snd_soc_dai *cpu_dai,
+							    struct snd_pcm_substream *substream)
+{
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_sof_dai *dai = swidget->private;
+	struct sof_ipc4_copier *ipc4_copier = dai->private;
+	struct sof_ipc4_alh_configuration_blob *blob;
+
+	blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
+
+	/*
+	 * Starting with ACE_2_0, re-setting the device_count is mandatory to avoid using
+	 * the multi-gateway firmware configuration. The DMA hardware can take care of
+	 * multiple links without needing any firmware assistance
+	 */
+	blob->alh_cfg.device_count = 1;
+
+	return hda_ipc4_get_hext_stream(sdev, cpu_dai, substream);
+}
+
 static const struct hda_dai_widget_dma_ops hda_ipc4_dma_ops = {
 	.get_hext_stream = hda_ipc4_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
@@ -475,7 +497,7 @@ static const struct hda_dai_widget_dma_ops dmic_ipc4_dma_ops = {
 };
 
 static const struct hda_dai_widget_dma_ops sdw_ipc4_dma_ops = {
-	.get_hext_stream = hda_ipc4_get_hext_stream,
+	.get_hext_stream = sdw_hda_ipc4_get_hext_stream,
 	.assign_hext_stream = hda_assign_hext_stream,
 	.release_hext_stream = hda_release_hext_stream,
 	.setup_hext_stream = hda_setup_hext_stream,
-- 
2.39.2

