Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45935779549
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 18:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82EDE85D;
	Fri, 11 Aug 2023 18:52:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82EDE85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691772820;
	bh=+MGQtvE7CorJAVkLC/tU/nsgJ0nRpJGChYw030cTmxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KO/35lTrqS+LEKKgAGf30D69SErhr7Xp/XqPle5bigJrPA280AfKBI727KRKMHDc+
	 rnwrFXVaXcj7p9LfZbJX/r4gzknSRmhSeuEKrXdKjflgv2oQb+Skd6mrCN0EqUIolc
	 NyCoirqpZFpt17jJ/QTWdd9SVisa6T3wXm+ce8C0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A113F805FE; Fri, 11 Aug 2023 18:50:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95603F80601;
	Fri, 11 Aug 2023 18:50:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E75EF805CA; Fri, 11 Aug 2023 18:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4235F805B1
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 18:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4235F805B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j9hxgcCU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691772590; x=1723308590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+MGQtvE7CorJAVkLC/tU/nsgJ0nRpJGChYw030cTmxg=;
  b=j9hxgcCUFd9F5hfZIZ0+s2kcBR7ksgl+OVsl0azKvT33fHTsjpH+vXHa
   g2KWyOlgY5G4XGi1VYcyCTVgCNTMKttb8+0ouVvaJxQ6I70fz7N12LUXo
   bVtMNZuQ/G8ODw3EfysgbZ0BWzgjYbB3OW5tauM0jtGZBcoVRxK0v1/eX
   mCTEAn35ATTqrQLpbDWtCxU6O455qgv13bFMVn6QwY/nFRAu2CbXD+mVv
   BlXkcTjJQOsCQzi0ZcqkL9DLx+hPALj0Xzl87kOkSdLB3KrVqL/Rg/6J5
   C6Gj6Zg4vTUsWCWmuYe+RmSM7lWQjssU20D91d1e1AhOMQTi295n9aQuO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371725154"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="371725154"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846842852"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="846842852"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 09:49:39 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC PATCH 14/17] ASoC: Intel: avs: Switch to new stream-format
 interface
Date: Fri, 11 Aug 2023 18:48:50 +0200
Message-Id: <20230811164853.1797547-15-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811164853.1797547-1-cezary.rojewski@intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RLLQRKAA3DLODNVPO5OPQIHGJPGXPTS3
X-Message-ID-Hash: RLLQRKAA3DLODNVPO5OPQIHGJPGXPTS3
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RLLQRKAA3DLODNVPO5OPQIHGJPGXPTS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c |  4 ++--
 sound/soc/intel/avs/path.c   |  2 +-
 sound/soc/intel/avs/pcm.c    | 19 ++++++++++++++-----
 sound/soc/intel/avs/probes.c |  3 +--
 4 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index b81b555846e6..2c682e844d22 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -373,7 +373,7 @@ int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw)
 	hstream = hdac_stream(estream);
 
 	/* code loading performed with default format */
-	sdfmt = snd_hdac_calc_stream_format(48000, 1, SNDRV_PCM_FORMAT_S32_LE, 32, 0);
+	sdfmt = snd_hdac_stream_format(1, 32, 48000);
 	ret = snd_hdac_dsp_prepare(hstream, sdfmt, fw->size, &dmab);
 	if (ret < 0)
 		goto release_stream;
@@ -440,7 +440,7 @@ int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib, u32 id)
 	stream = hdac_stream(estream);
 
 	/* code loading performed with default format */
-	sdfmt = snd_hdac_calc_stream_format(48000, 1, SNDRV_PCM_FORMAT_S32_LE, 32, 0);
+	sdfmt = snd_hdac_stream_format(1, 32, 48000);
 	ret = snd_hdac_dsp_prepare(stream, sdfmt, lib->size, &dmab);
 	if (ret < 0)
 		goto release_stream;
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 494e357e3b12..0475aa9c85ce 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -88,7 +88,7 @@ static bool avs_test_hw_params(struct snd_pcm_hw_params *params,
 	return (params_rate(params) == fmt->sampling_freq &&
 		params_channels(params) == fmt->num_channels &&
 		params_physical_width(params) == fmt->bit_depth &&
-		params_width(params) == fmt->valid_bit_depth);
+		params_bps(params) == fmt->valid_bit_depth);
 }
 
 static struct avs_tplg_path *
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 7f38cfc86492..fa9d3292fe82 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -336,20 +336,25 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct hdac_ext_stream *link_stream = runtime->private_data;
+	struct snd_soc_pcm_stream *stream_info;
+	struct hdac_ext_stream *link_stream;
 	struct hdac_ext_link *link;
 	struct hda_codec *codec;
 	struct hdac_bus *bus;
 	unsigned int format_val;
+	unsigned int bps;
 	int ret;
 
+	link_stream = runtime->private_data;
 	if (link_stream->link_prepared)
 		return 0;
 
 	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
 	bus = &codec->bus->core;
-	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
-						 runtime->sample_bits, 0);
+	stream_info = snd_soc_dai_get_pcm_stream(dai, substream->stream);
+	bps = snd_hdac_stream_format_bps(runtime->format, runtime->subformat,
+					 stream_info->sig_bits);
+	format_val = snd_hdac_stream_format(runtime->channels, bps, runtime->rate);
 
 	snd_hdac_ext_stream_reset(link_stream);
 	snd_hdac_ext_stream_setup(link_stream, format_val);
@@ -602,11 +607,13 @@ static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_so
 static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_stream *stream_info;
 	struct avs_dma_data *data;
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct hdac_ext_stream *host_stream;
 	struct hdac_bus *bus;
 	unsigned int format_val;
+	unsigned int bps;
 	int ret;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
@@ -618,8 +625,10 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	bus = hdac_stream(host_stream)->bus;
 	snd_hdac_stream_reset(hdac_stream(host_stream));
 
-	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
-						 runtime->sample_bits, 0);
+	stream_info = snd_soc_dai_get_pcm_stream(dai, substream->stream);
+	bps = snd_hdac_stream_format_bps(runtime->format, runtime->subformat,
+					 stream_info->sig_bits);
+	format_val = snd_hdac_stream_format(runtime->channels, bps, runtime->rate);
 
 	ret = snd_hdac_stream_set_params(hdac_stream(host_stream), format_val);
 	if (ret < 0)
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 275928281c6c..1e67b6549be7 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -140,8 +140,7 @@ static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
 	bps = snd_pcm_format_physical_width(format);
 	if (bps < 0)
 		return bps;
-	format_val = snd_hdac_calc_stream_format(params->codec.sample_rate, params->codec.ch_out,
-						 format, bps, 0);
+	format_val = snd_hdac_stream_format(params->codec.ch_out, bps, params->codec.sample_rate);
 	ret = snd_hdac_stream_set_params(hdac_stream(host_stream), format_val);
 	if (ret < 0)
 		return ret;
-- 
2.25.1

