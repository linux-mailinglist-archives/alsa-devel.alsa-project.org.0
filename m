Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED87EF24D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:08:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD947E0E;
	Fri, 17 Nov 2023 13:07:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD947E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222887;
	bh=c3yVrW2yGcgh/DiL8v6XGhzt0QppWTB/iJq5v8b7/QA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pkE9mjdCG0iEK3icx+KnOKhL8s78K5hHU9wK8KH1Qog2J43XmXFLKhHq7NBh4gUpu
	 SwtSKJoQfIyrpkn+NIep5hV72912am+NE+G89SdNV1BTlk2chqlyC48doisLHskwhz
	 qZ/yFdJNJxkcj4a4ZR43ez6SnN8GWBXNu9aG+KQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FDC9F8057B; Fri, 17 Nov 2023 13:05:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00AB5F805D9;
	Fri, 17 Nov 2023 13:05:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEAA2F805D3; Fri, 17 Nov 2023 13:05:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91F61F80571
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 13:04:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91F61F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aSaTnpbX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222675; x=1731758675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c3yVrW2yGcgh/DiL8v6XGhzt0QppWTB/iJq5v8b7/QA=;
  b=aSaTnpbXq0AigJYl+1ngol3qzUcrEJujQAM6ibMmGjd7WgCxDnysOviI
   JvVRMVQmXGvPlzLBm5rjqJVLZbMcg8TapkY1raExsjItg86T4+3IVcxKo
   4eSLCKloYWoAjy/eoyzO7iq4iSzk4Ba6HgupL8RXIV5CMuIIXwQ1SMXGY
   GTbz3ACBhd3HJm0Uupv4XEXQX62yAE6Bv8QVgGmthqdvD0GL9GNhJmXPB
   Hvu9t567ldFvyFyaIU46mBCD99nl3qELEa1t8+gt+UqH4QncGCSq4mzl5
   7nNceP94FCP77Mk652JpKXgMYdi2yryxdgdPBj/4eyMSaz0sANyJ9r4Tw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675298"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="381675298"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110217"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="883110217"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:29 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 13/16] ASoC: Intel: avs: Switch to new stream-format
 interface
Date: Fri, 17 Nov 2023 13:06:07 +0100
Message-Id: <20231117120610.1755254-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LMDWIHL3NPE6HFL265NVYQEZUBERU62V
X-Message-ID-Hash: LMDWIHL3NPE6HFL265NVYQEZUBERU62V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LMDWIHL3NPE6HFL265NVYQEZUBERU62V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c |  4 ++--
 sound/soc/intel/avs/path.c   |  2 +-
 sound/soc/intel/avs/pcm.c    | 19 ++++++++++++++-----
 sound/soc/intel/avs/probes.c |  3 +--
 4 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index 65dd8f140fc1..e83ce6a35755 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -371,7 +371,7 @@ int avs_hda_load_basefw(struct avs_dev *adev, struct firmware *fw)
 	hstream = hdac_stream(estream);
 
 	/* code loading performed with default format */
-	sdfmt = snd_hdac_calc_stream_format(48000, 1, SNDRV_PCM_FORMAT_S32_LE, 32, 0);
+	sdfmt = snd_hdac_stream_format(1, 32, 48000);
 	ret = snd_hdac_dsp_prepare(hstream, sdfmt, fw->size, &dmab);
 	if (ret < 0)
 		goto release_stream;
@@ -438,7 +438,7 @@ int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib, u32 id)
 	stream = hdac_stream(estream);
 
 	/* code loading performed with default format */
-	sdfmt = snd_hdac_calc_stream_format(48000, 1, SNDRV_PCM_FORMAT_S32_LE, 32, 0);
+	sdfmt = snd_hdac_stream_format(1, 32, 48000);
 	ret = snd_hdac_dsp_prepare(stream, sdfmt, lib->size, &dmab);
 	if (ret < 0)
 		goto release_stream;
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index aa8b50b931c3..3aa16ee8d34c 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -87,7 +87,7 @@ static bool avs_test_hw_params(struct snd_pcm_hw_params *params,
 	return (params_rate(params) == fmt->sampling_freq &&
 		params_channels(params) == fmt->num_channels &&
 		params_physical_width(params) == fmt->bit_depth &&
-		params_width(params) == fmt->valid_bit_depth);
+		snd_pcm_hw_params_bits(params) == fmt->valid_bit_depth);
 }
 
 static struct avs_tplg_path *
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 463dbba18426..f586a804099a 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -335,20 +335,25 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct hdac_ext_stream *link_stream = runtime->private_data;
+	struct snd_soc_pcm_stream *stream_info;
+	struct hdac_ext_stream *link_stream;
 	struct hdac_ext_link *link;
 	struct hda_codec *codec;
 	struct hdac_bus *bus;
 	unsigned int format_val;
+	unsigned int bits;
 	int ret;
 
+	link_stream = runtime->private_data;
 	if (link_stream->link_prepared)
 		return 0;
 
 	codec = dev_to_hda_codec(snd_soc_rtd_to_codec(rtd, 0)->dev);
 	bus = &codec->bus->core;
-	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
-						 runtime->sample_bits, 0);
+	stream_info = snd_soc_dai_get_pcm_stream(dai, substream->stream);
+	bits = snd_hdac_stream_format_bits(runtime->format, runtime->subformat,
+					   stream_info->sig_bits);
+	format_val = snd_hdac_stream_format(runtime->channels, bits, runtime->rate);
 
 	snd_hdac_ext_stream_reset(link_stream);
 	snd_hdac_ext_stream_setup(link_stream, format_val);
@@ -600,10 +605,12 @@ static int avs_dai_fe_hw_free(struct snd_pcm_substream *substream, struct snd_so
 static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_stream *stream_info;
 	struct avs_dma_data *data;
 	struct avs_dev *adev = to_avs_dev(dai->dev);
 	struct hdac_ext_stream *host_stream;
 	unsigned int format_val;
+	unsigned int bits;
 	int ret;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
@@ -614,8 +621,10 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 
 	snd_hdac_stream_reset(hdac_stream(host_stream));
 
-	format_val = snd_hdac_calc_stream_format(runtime->rate, runtime->channels, runtime->format,
-						 runtime->sample_bits, 0);
+	stream_info = snd_soc_dai_get_pcm_stream(dai, substream->stream);
+	bits = snd_hdac_stream_format_bits(runtime->format, runtime->subformat,
+					   stream_info->sig_bits);
+	format_val = snd_hdac_stream_format(runtime->channels, bits, runtime->rate);
 
 	ret = snd_hdac_stream_set_params(hdac_stream(host_stream), format_val);
 	if (ret < 0)
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index bdc6b30dc009..817e543036f2 100644
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

