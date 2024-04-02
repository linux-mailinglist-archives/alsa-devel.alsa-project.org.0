Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75910895808
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:21:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA0F2C32;
	Tue,  2 Apr 2024 17:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA0F2C32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071265;
	bh=AYZIq1B3O4S1WmPeBiEUE6o6mCxBUswzwucEVLI4JAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LEElDaC1FLtr2vRZiI37JE8/78TjhNUMY6X+gIdUaH+zR68N2CRGQgipPFz0OmKFb
	 xinT5AN2fI82p3a4DNVH0ZMXP0bk4+8bgNkShXgu6mpwB7FHsgfZ5u9Mo79uyNCyXx
	 NveCsmovarqUOhfcB/G9Zg39DD5Vu2xn5QBoUsSI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0491CF805AF; Tue,  2 Apr 2024 17:19:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A37BAF8069C;
	Tue,  2 Apr 2024 17:19:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20EC1F805E7; Tue,  2 Apr 2024 17:18:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB495F80236
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB495F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cfodcVK1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071126; x=1743607126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AYZIq1B3O4S1WmPeBiEUE6o6mCxBUswzwucEVLI4JAg=;
  b=cfodcVK1AdhznpHnNb6Mj8VnPkSo+CT1S8wuhJYPSraFcTNLWexuoyCu
   FagSOdE2N/WF6gSaPFlOfr2hwjMagxaEhZPdjxEPM5TJ5/eqHlx9UsKGj
   +j2QKQW3pCuh+W4ic6RQd3cdSfDyFIuq8PtrATEPx4o9HQe2qyGjFhWea
   kyBD9G3M0txXnyMtyWHNOEAv4iKfIER3012GvmP2fjTJRw/neeFtIENNJ
   8jtGiagc4ror+6qC3kclYvz4zr9KanTeldrP3GcWglweexsfhuKgWqBbV
   NcPr1LwuqIRz9BZqis7thDK9k/VKTfxlfOZe4oeXexnbb/vxl2qSUcyBy
   Q==;
X-CSE-ConnectionGUID: 8VvwJuvTTj67uYxOnGR+NQ==
X-CSE-MsgGUID: hrjuPIdUQ2WBvtbZuNlTpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729887"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29729887"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:37 -0700
X-CSE-ConnectionGUID: MbUaWclbSq2E+iHyZNRcXw==
X-CSE-MsgGUID: Agehy73eRCOeeSfUVMJqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796487"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 01/17] ASoC: SOF: Intel: hda-dai: fix channel map
 configuration for aggregated dailink
Date: Tue,  2 Apr 2024 10:18:12 -0500
Message-Id: <20240402151828.175002-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U4OZBOH6VFPQBDI7NUZ75HCI7TC4KT63
X-Message-ID-Hash: U4OZBOH6VFPQBDI7NUZ75HCI7TC4KT63
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4OZBOH6VFPQBDI7NUZ75HCI7TC4KT63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The existing code derives the channel map used to program the HDaudio
link DMA from the hw_params, but that is not quite right in the case
of aggregation. The code in soc-pcm.c splits the hw_params depending
on the codec_ch_map, and we need to reconstruct the channel-map to
insert the data in the right places.

This issue is seen only on amplifier feedback capture where the data
from the second amplifier was replaced by that of the first amplifier.

Note that the loop iterator of the macro for_each_rtd_cpu_dais() is
reused in a following loop. This is different to all existing usages
of that macro, hence the use of a boolean flag to avoid an access to
an uninitialized variable.

Fixes: 2960ee5c4814 ("ASoC: SOF: Intel: hda-dai: add helpers for SoundWire callbacks")
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index c1682bcdb5a6..6a39ca632f55 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -439,10 +439,17 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 			  int link_id)
 {
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	const struct hda_dai_widget_dma_ops *ops;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	struct hdac_ext_stream *hext_stream;
+	struct snd_soc_dai *dai;
 	struct snd_sof_dev *sdev;
+	bool cpu_dai_found = false;
+	int cpu_dai_id;
+	int ch_mask;
 	int ret;
+	int j;
 
 	ret = non_hda_dai_hw_params(substream, params, cpu_dai);
 	if (ret < 0) {
@@ -457,9 +464,29 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	if (!hext_stream)
 		return -ENODEV;
 
-	/* in the case of SoundWire we need to program the PCMSyCM registers */
+	/*
+	 * in the case of SoundWire we need to program the PCMSyCM registers. In case
+	 * of aggregated devices, we need to define the channel mask for each sublink
+	 * by reconstructing the split done in soc-pcm.c
+	 */
+	for_each_rtd_cpu_dais(rtd, cpu_dai_id, dai) {
+		if (dai == cpu_dai) {
+			cpu_dai_found = true;
+			break;
+		}
+	}
+
+	if (!cpu_dai_found)
+		return -ENODEV;
+
+	ch_mask = 0;
+	for_each_link_ch_maps(rtd->dai_link, j, ch_maps) {
+		if (ch_maps->cpu == cpu_dai_id)
+			ch_mask |= ch_maps->ch_mask;
+	}
+
 	ret = hdac_bus_eml_sdw_map_stream_ch(sof_to_bus(sdev), link_id, cpu_dai->id,
-					     GENMASK(params_channels(params) - 1, 0),
+					     ch_mask,
 					     hdac_stream(hext_stream)->stream_tag,
 					     substream->stream);
 	if (ret < 0) {
-- 
2.40.1

