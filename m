Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5411895804
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:19:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 502C02C35;
	Tue,  2 Apr 2024 17:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 502C02C35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071198;
	bh=8BNO4J7F02OW61F3M9kbM+GcaQ/g6Fcbv0k9xzs+WiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r4gdVxfpkxA/a98kpwEN3VKnX4G/xObPSKUJP0VRHtXga8WIzZjuNtJWc0MQ7n/zm
	 ayp2x3MV9YJUgFJIucj8bHKyiMHbSKkdaIm1WQOHQO5r18bEjoHBGAmQVUyRhPyRA5
	 t2Gp/jbOBWlXgLW4nfFUWHhD1aQedJMHhi2OLDxE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39447F805ED; Tue,  2 Apr 2024 17:18:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36E6EF8055C;
	Tue,  2 Apr 2024 17:18:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65B8DF80570; Tue,  2 Apr 2024 17:18:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC969F8056F
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC969F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VarHcijf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071128; x=1743607128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8BNO4J7F02OW61F3M9kbM+GcaQ/g6Fcbv0k9xzs+WiY=;
  b=VarHcijfP6n7FgmOMU2niQoN8diZbO86MMQwa3NifH60Hm8CdRTKiKU8
   7n/9m1X/BVzP8TabKe+nEjHW1/d7zxKqhc38RgmIbd2IlTHRU5ETiQWCC
   H8PcE3RciL44Dklt6hBDjyZxxPKO80i2hIlLDLvpyw33wku4huPT2NUMj
   ieckrS8x3M8N9F3FVLT2LB3GPsvJm337LWSzPzVrsfA3E/DkIU1ueBnTG
   k2wrTSpkOdGHjUonX89kw9GThWEyRLhvwusxRn89l3qyDLBxhdYQ2MkVz
   xigELuonjy92O6pVzzm6laYf+FBUYFmoBIUIKqe64D7FQ4ZWkFC8yJNt3
   w==;
X-CSE-ConnectionGUID: 7L7kPZQEQjGh87RLICfpgQ==
X-CSE-MsgGUID: vSR9aLssT06jq57c6DKPLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729959"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29729959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:40 -0700
X-CSE-ConnectionGUID: u0gNtmf8TD2rz5WPWo6wPg==
X-CSE-MsgGUID: GcNid/E1SRCwug/Zt5CUdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796499"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/17] ASoC: SOF: Intel: hda-dai: set lowest N bits in ch_mask
Date: Tue,  2 Apr 2024 10:18:16 -0500
Message-Id: <20240402151828.175002-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 57QJMBJIOSNSL7A3I46UNX5EAHC75K6J
X-Message-ID-Hash: 57QJMBJIOSNSL7A3I46UNX5EAHC75K6J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57QJMBJIOSNSL7A3I46UNX5EAHC75K6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We always use the lowest N channels of stream. So, set ch_mask to
GENMASK(params_channels(params) - 1, 0).

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 01c544b7e046..810d2997794f 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -441,7 +441,6 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	const struct hda_dai_widget_dma_ops *ops;
-	struct snd_soc_dai_link_ch_map *ch_maps;
 	struct hdac_ext_stream *hext_stream;
 	struct snd_soc_dai *dai;
 	struct snd_sof_dev *sdev;
@@ -449,7 +448,6 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	int cpu_dai_id;
 	int ch_mask;
 	int ret;
-	int j;
 
 	ret = non_hda_dai_hw_params(substream, params, cpu_dai);
 	if (ret < 0) {
@@ -479,11 +477,7 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	if (!cpu_dai_found)
 		return -ENODEV;
 
-	ch_mask = 0;
-	for_each_link_ch_maps(rtd->dai_link, j, ch_maps) {
-		if (ch_maps->cpu == cpu_dai_id)
-			ch_mask |= ch_maps->ch_mask;
-	}
+	ch_mask = GENMASK(params_channels(params) - 1, 0);
 
 	ret = hdac_bus_eml_sdw_map_stream_ch(sof_to_bus(sdev), link_id, cpu_dai->id,
 					     ch_mask,
-- 
2.40.1

