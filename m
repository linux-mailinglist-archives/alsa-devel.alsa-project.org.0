Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A1725237
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 04:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86DF56C0;
	Wed,  7 Jun 2023 04:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86DF56C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686106300;
	bh=7SpHsMWxcq4T59XtL19esyAAvPGmitt9uo0B46i4Ekg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JFhODEj4t1I3M9x2nE4yiSUTuPWsmRIc92mDjFmzEXvhtqoKRKp+JTDGoGvx/2w42
	 CrduGbEE5wsa4k98z6BsOD2IcmmjSzSOToFWpE7HASMiQEX+xZSN8LAcF4dFPBJRfa
	 OjBZQrYrHkHgZi2UZfqyWjj0/1b/Cwus4ozbDqXo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 288E0F80199; Wed,  7 Jun 2023 04:50:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30EF1F80130;
	Wed,  7 Jun 2023 04:50:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A9EAF80290; Wed,  7 Jun 2023 04:50:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACA30F80155
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 04:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA30F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RP4jRKUy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686106206; x=1717642206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7SpHsMWxcq4T59XtL19esyAAvPGmitt9uo0B46i4Ekg=;
  b=RP4jRKUyIzw8mYtMdz/fz6LC9A6Ny9FOja2K/AwLzSm45ImXD8OjrLL8
   oGnRWsYswrvSaTQRKK0743c9k0DAoJdUo2FdYjkavaYZGuQ0ptZ7vbmI/
   F+U/G2BK5/ru8ZTJfa8XaBT0k1KZS1VZFK2IzUNgmoYS+Y5bEf5TcPaEE
   ItZpccdTUdQLiPmBZmvlM/ri5pwi2c3xr5WtRWTSqcP64ASxmB3PDcvhc
   GtnYhgWXLwPbGuJPs1l8vf9QAXvAVEGdDA4XTPpWJfSCcdWEi1pN5oCAh
   nQGryNVLMKJQ7vahtrCOha9bnaEf6pxRLOc/byYfnVzDZr1DdcJ6dHQEy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="360183323"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="360183323"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 19:49:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="833478872"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="833478872"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 19:49:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 1/2] ASoC: add N cpus to M codecs dai link support
Date: Wed,  7 Jun 2023 11:12:41 +0800
Message-Id: <20230607031242.1032060-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OGOBK4JV6ZAYCILKBI3YOFZKU52NAW5R
X-Message-ID-Hash: OGOBK4JV6ZAYCILKBI3YOFZKU52NAW5R
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGOBK4JV6ZAYCILKBI3YOFZKU52NAW5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently, ASoC supports dailinks with the following mappings:
1 cpu DAI to N codec DAIs
N cpu DAIs to N codec DAIs
But the mapping between N cpu DAIs and M codec DAIs is not supported.
The reason is that we didn't have a mechanism to map cpu and codec DAIs

This patch suggests a new snd_soc_dai_link_codec_ch_map struct in
struct snd_soc_dai_link{} which provides codec DAI to cpu DAI mapping
information used to implement N cpu DAIs to M codec DAIs
support.

When a dailink contains two or more cpu DAIs, we should set channel
number of cpus based on its channel mask. The new struct also provides
channel mask information for each codec and we can construct the cpu
channel mask by combining all codec channel masks which map to the cpu.

The N:M mapping is however restricted to the N <= M case due to physical
restrictions on a time-multiplexed bus such as I2S/TDM, AC97, SoundWire
and HDaudio.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/sound/soc.h  |  6 ++++++
 sound/soc/soc-dapm.c | 24 +++++++++++++++++++++++-
 sound/soc/soc-pcm.c  | 44 ++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 533e553a343f..a5171b0de2fd 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -646,6 +646,11 @@ struct snd_soc_dai_link_component {
 	const char *dai_name;
 };
 
+struct snd_soc_dai_link_codec_ch_map {
+	unsigned int connected_cpu_id;
+	unsigned int ch_mask;
+};
+
 struct snd_soc_dai_link {
 	/* config - must be set by machine driver */
 	const char *name;			/* Codec name */
@@ -674,6 +679,7 @@ struct snd_soc_dai_link {
 	struct snd_soc_dai_link_component *codecs;
 	unsigned int num_codecs;
 
+	struct snd_soc_dai_link_codec_ch_map *codec_ch_maps;
 	/*
 	 * You MAY specify the link's platform/PCM/DMA driver, either by
 	 * device name, or by DT/OF node, but not both. Some forms of link
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index c65cc374bb3f..092a5cf20ddb 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4477,9 +4477,31 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 			for_each_rtd_codec_dais(rtd, i, codec_dai)
 				dapm_connect_dai_pair(card, rtd, codec_dai,
 						      asoc_rtd_to_cpu(rtd, i));
+		} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
+			int cpu_id;
+
+			if (!rtd->dai_link->codec_ch_maps) {
+				dev_err(card->dev, "%s: no codec channel mapping table provided\n",
+					__func__);
+				continue;
+			}
+
+			for_each_rtd_codec_dais(rtd, i, codec_dai) {
+				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
+				if (cpu_id >= rtd->dai_link->num_cpus) {
+					dev_err(card->dev,
+						"%s: dai_link %s cpu_id %d too large, num_cpus is %d\n",
+						__func__, rtd->dai_link->name, cpu_id,
+						rtd->dai_link->num_cpus);
+					continue;
+				}
+				dapm_connect_dai_pair(card, rtd, codec_dai,
+						      asoc_rtd_to_cpu(rtd, cpu_id));
+			}
 		} else {
 			dev_err(card->dev,
-				"N cpus to M codecs link is not supported yet\n");
+				"%s: codec number %d < cpu number %d is not supported\n",
+				__func__, rtd->dai_link->num_codecs, rtd->dai_link->num_cpus);
 		}
 	}
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index c13552fefbe6..88c4f3d77ade 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1034,6 +1034,10 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+		struct snd_pcm_hw_params cpu_params;
+		unsigned int ch_mask = 0;
+		int j;
+
 		/*
 		 * Skip CPUs which don't support the current stream
 		 * type. See soc_pcm_init_runtime_hw() for more details
@@ -1041,13 +1045,32 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
 			continue;
 
-		ret = snd_soc_dai_hw_params(cpu_dai, substream, params);
+		/* copy params for each cpu */
+		cpu_params = *params;
+
+		if (!rtd->dai_link->codec_ch_maps)
+			goto hw_params;
+		/*
+		 * construct cpu channel mask by combining ch_mask of each
+		 * codec which maps to the cpu.
+		 */
+		for_each_rtd_codec_dais(rtd, j, codec_dai) {
+			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id == i)
+				ch_mask |= rtd->dai_link->codec_ch_maps[j].ch_mask;
+		}
+
+		/* fixup cpu channel number */
+		if (ch_mask)
+			soc_pcm_codec_params_fixup(&cpu_params, ch_mask);
+
+hw_params:
+		ret = snd_soc_dai_hw_params(cpu_dai, substream, &cpu_params);
 		if (ret < 0)
 			goto out;
 
 		/* store the parameters for each DAI */
-		soc_pcm_set_dai_params(cpu_dai, params);
-		snd_soc_dapm_update_dai(substream, params, cpu_dai);
+		soc_pcm_set_dai_params(cpu_dai, &cpu_params);
+		snd_soc_dapm_update_dai(substream, &cpu_params, cpu_dai);
 	}
 
 	ret = snd_soc_pcm_component_hw_params(substream, params);
@@ -2794,9 +2817,22 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 			} else if (dai_link->num_cpus == dai_link->num_codecs) {
 				cpu_dai = asoc_rtd_to_cpu(rtd, i);
+			} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
+				int cpu_id;
+
+				if (!rtd->dai_link->codec_ch_maps) {
+					dev_err(rtd->card->dev, "%s: no codec channel mapping table provided\n",
+						__func__);
+					return -EINVAL;
+				}
+
+				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
+				cpu_dai = asoc_rtd_to_cpu(rtd, cpu_id);
 			} else {
 				dev_err(rtd->card->dev,
-					"N cpus to M codecs link is not supported yet\n");
+					"%s codec number %d < cpu number %d is not supported\n",
+					__func__, rtd->dai_link->num_codecs,
+					rtd->dai_link->num_cpus);
 				return -EINVAL;
 			}
 
-- 
2.25.1

