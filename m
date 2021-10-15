Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 842D342F877
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 18:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D225950;
	Fri, 15 Oct 2021 18:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D225950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634316096;
	bh=BG7T7D4c5TGIEGwuRRDnJwlEMr4wIpUJGZDR5MpsKbI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AbjHWBTLbEE1nMrxKWqdTGfAFgvsgKozbLIAqwIOJpNyqtSodJUw/+gib/1VTS797
	 AAW0vqgFi1bzmMcw9RUbiaJgP04eeycEj+QDWwEm88zojYDOEIooSjb7O/kH74iuEp
	 MOMu2mvEeXxABxb4cKN3QvYmnEt15Yu2E5Jn8B4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D426F80510;
	Fri, 15 Oct 2021 18:38:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A511F804FE; Fri, 15 Oct 2021 18:38:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 291CBF80167
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 18:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 291CBF80167
X-IronPort-AV: E=McAfee;i="6200,9189,10138"; a="251395149"
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="251395149"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 09:38:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,376,1624345200"; d="scan'208";a="593028370"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga004.jf.intel.com with ESMTP; 15 Oct 2021 09:38:28 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/5] ASoC: Intel: Skylake: Use NHLT API to search for blob
Date: Fri, 15 Oct 2021 18:40:47 +0200
Message-Id: <20211015164047.44492-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015164047.44492-1-cezary.rojewski@intel.com>
References: <20211015164047.44492-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
 hdegoede@redhat.com, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

With NHLT enriched with new search functions, remove local code in
favour of them. This also fixes broken behaviour: search should be based
on significant bits count rather than container size.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-nhlt.c     | 102 -------------------------
 sound/soc/intel/skylake/skl-pcm.c      |   3 +
 sound/soc/intel/skylake/skl-topology.c |  27 ++++---
 sound/soc/intel/skylake/skl-topology.h |   1 +
 sound/soc/intel/skylake/skl.h          |   4 -
 5 files changed, 19 insertions(+), 118 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-nhlt.c b/sound/soc/intel/skylake/skl-nhlt.c
index 3033c1bf279f..16f70554b2a0 100644
--- a/sound/soc/intel/skylake/skl-nhlt.c
+++ b/sound/soc/intel/skylake/skl-nhlt.c
@@ -13,108 +13,6 @@
 #include "skl.h"
 #include "skl-i2s.h"
 
-static struct nhlt_specific_cfg *skl_get_specific_cfg(
-		struct device *dev, struct nhlt_fmt *fmt,
-		u8 no_ch, u32 rate, u16 bps, u8 linktype)
-{
-	struct nhlt_specific_cfg *sp_config;
-	struct wav_fmt *wfmt;
-	struct nhlt_fmt_cfg *fmt_config = fmt->fmt_config;
-	int i;
-
-	dev_dbg(dev, "Format count =%d\n", fmt->fmt_count);
-
-	for (i = 0; i < fmt->fmt_count; i++) {
-		wfmt = &fmt_config->fmt_ext.fmt;
-		dev_dbg(dev, "ch=%d fmt=%d s_rate=%d\n", wfmt->channels,
-			 wfmt->bits_per_sample, wfmt->samples_per_sec);
-		if (wfmt->channels == no_ch && wfmt->bits_per_sample == bps) {
-			/*
-			 * if link type is dmic ignore rate check as the blob is
-			 * generic for all rates
-			 */
-			sp_config = &fmt_config->config;
-			if (linktype == NHLT_LINK_DMIC)
-				return sp_config;
-
-			if (wfmt->samples_per_sec == rate)
-				return sp_config;
-		}
-
-		fmt_config = (struct nhlt_fmt_cfg *)(fmt_config->config.caps +
-						fmt_config->config.size);
-	}
-
-	return NULL;
-}
-
-static void dump_config(struct device *dev, u32 instance_id, u8 linktype,
-		u8 s_fmt, u8 num_channels, u32 s_rate, u8 dirn, u16 bps)
-{
-	dev_dbg(dev, "Input configuration\n");
-	dev_dbg(dev, "ch=%d fmt=%d s_rate=%d\n", num_channels, s_fmt, s_rate);
-	dev_dbg(dev, "vbus_id=%d link_type=%d\n", instance_id, linktype);
-	dev_dbg(dev, "bits_per_sample=%d\n", bps);
-}
-
-static bool skl_check_ep_match(struct device *dev, struct nhlt_endpoint *epnt,
-		u32 instance_id, u8 link_type, u8 dirn, u8 dev_type)
-{
-	dev_dbg(dev, "vbus_id=%d link_type=%d dir=%d dev_type = %d\n",
-			epnt->virtual_bus_id, epnt->linktype,
-			epnt->direction, epnt->device_type);
-
-	if ((epnt->virtual_bus_id == instance_id) &&
-			(epnt->linktype == link_type) &&
-			(epnt->direction == dirn)) {
-		/* do not check dev_type for DMIC link type */
-		if (epnt->linktype == NHLT_LINK_DMIC)
-			return true;
-
-		if (epnt->device_type == dev_type)
-			return true;
-	}
-
-	return false;
-}
-
-struct nhlt_specific_cfg
-*skl_get_ep_blob(struct skl_dev *skl, u32 instance, u8 link_type,
-			u8 s_fmt, u8 num_ch, u32 s_rate,
-			u8 dirn, u8 dev_type)
-{
-	struct nhlt_fmt *fmt;
-	struct nhlt_endpoint *epnt;
-	struct hdac_bus *bus = skl_to_bus(skl);
-	struct device *dev = bus->dev;
-	struct nhlt_specific_cfg *sp_config;
-	struct acpi_table_nhlt *nhlt = skl->nhlt;
-	u16 bps = (s_fmt == 16) ? 16 : 32;
-	u8 j;
-
-	dump_config(dev, instance, link_type, s_fmt, num_ch, s_rate, dirn, bps);
-
-	epnt = (struct nhlt_endpoint *)nhlt->desc;
-
-	dev_dbg(dev, "endpoint count =%d\n", nhlt->endpoint_count);
-
-	for (j = 0; j < nhlt->endpoint_count; j++) {
-		if (skl_check_ep_match(dev, epnt, instance, link_type,
-						dirn, dev_type)) {
-			fmt = (struct nhlt_fmt *)(epnt->config.caps +
-						 epnt->config.size);
-			sp_config = skl_get_specific_cfg(dev, fmt, num_ch,
-							s_rate, bps, link_type);
-			if (sp_config)
-				return sp_config;
-		}
-
-		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
-	}
-
-	return NULL;
-}
-
 static void skl_nhlt_trim_space(char *trim)
 {
 	char *s = trim;
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 9ecaf6a1e847..34908af50046 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -317,6 +317,7 @@ static int skl_pcm_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(dai->dev, "dma_id=%d\n", dma_id);
 
 	p_params.s_fmt = snd_pcm_format_width(params_format(params));
+	p_params.s_cont = snd_pcm_format_physical_width(params_format(params));
 	p_params.ch = params_channels(params);
 	p_params.s_freq = params_rate(params);
 	p_params.host_dma_id = dma_id;
@@ -405,6 +406,7 @@ static int skl_be_hw_params(struct snd_pcm_substream *substream,
 	struct skl_pipe_params p_params = {0};
 
 	p_params.s_fmt = snd_pcm_format_width(params_format(params));
+	p_params.s_cont = snd_pcm_format_physical_width(params_format(params));
 	p_params.ch = params_channels(params);
 	p_params.s_freq = params_rate(params);
 	p_params.stream = substream->stream;
@@ -569,6 +571,7 @@ static int skl_link_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_dai_set_tdm_slot(codec_dai, 0, stream_tag, 0, 0);
 
 	p_params.s_fmt = snd_pcm_format_width(params_format(params));
+	p_params.s_cont = snd_pcm_format_physical_width(params_format(params));
 	p_params.ch = params_channels(params);
 	p_params.s_freq = params_rate(params);
 	p_params.stream = substream->stream;
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 89e4231304dd..4a92f046925d 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -285,7 +285,7 @@ static int skl_tplg_update_be_blob(struct snd_soc_dapm_widget *w,
 {
 	struct skl_module_cfg *m_cfg = w->priv;
 	int link_type, dir;
-	u32 ch, s_freq, s_fmt;
+	u32 ch, s_freq, s_fmt, s_cont;
 	struct nhlt_specific_cfg *cfg;
 	u8 dev_type = skl_tplg_be_dev_type(m_cfg->dev_type);
 	int fmt_idx = m_cfg->fmt_idx;
@@ -301,7 +301,8 @@ static int skl_tplg_update_be_blob(struct snd_soc_dapm_widget *w,
 		link_type = NHLT_LINK_DMIC;
 		dir = SNDRV_PCM_STREAM_CAPTURE;
 		s_freq = m_iface->inputs[0].fmt.s_freq;
-		s_fmt = m_iface->inputs[0].fmt.bit_depth;
+		s_fmt = m_iface->inputs[0].fmt.valid_bit_depth;
+		s_cont = m_iface->inputs[0].fmt.bit_depth;
 		ch = m_iface->inputs[0].fmt.channels;
 		break;
 
@@ -310,12 +311,14 @@ static int skl_tplg_update_be_blob(struct snd_soc_dapm_widget *w,
 		if (m_cfg->hw_conn_type == SKL_CONN_SOURCE) {
 			dir = SNDRV_PCM_STREAM_PLAYBACK;
 			s_freq = m_iface->outputs[0].fmt.s_freq;
-			s_fmt = m_iface->outputs[0].fmt.bit_depth;
+			s_fmt = m_iface->outputs[0].fmt.valid_bit_depth;
+			s_cont = m_iface->outputs[0].fmt.bit_depth;
 			ch = m_iface->outputs[0].fmt.channels;
 		} else {
 			dir = SNDRV_PCM_STREAM_CAPTURE;
 			s_freq = m_iface->inputs[0].fmt.s_freq;
-			s_fmt = m_iface->inputs[0].fmt.bit_depth;
+			s_fmt = m_iface->inputs[0].fmt.valid_bit_depth;
+			s_cont = m_iface->inputs[0].fmt.bit_depth;
 			ch = m_iface->inputs[0].fmt.channels;
 		}
 		break;
@@ -325,16 +328,16 @@ static int skl_tplg_update_be_blob(struct snd_soc_dapm_widget *w,
 	}
 
 	/* update the blob based on virtual bus_id and default params */
-	cfg = skl_get_ep_blob(skl, m_cfg->vbus_id, link_type,
-					s_fmt, ch, s_freq, dir, dev_type);
+	cfg = intel_nhlt_get_endpoint_blob(skl->nhlt, m_cfg->vbus_id, link_type,
+					s_fmt, s_cont, ch, s_freq, dir, dev_type);
 	if (cfg) {
 		m_cfg->formats_config[SKL_PARAM_INIT].caps_size = cfg->size;
 		m_cfg->formats_config[SKL_PARAM_INIT].caps = (u32 *)&cfg->caps;
 	} else {
 		dev_err(skl->dev, "Blob NULL for id %x type %d dirn %d\n",
 					m_cfg->vbus_id, link_type, dir);
-		dev_err(skl->dev, "PCM: ch %d, freq %d, fmt %d\n",
-					ch, s_freq, s_fmt);
+		dev_err(skl->dev, "PCM: ch %d, freq %d, fmt %d/%d\n",
+					ch, s_freq, s_fmt, s_cont);
 		return -EIO;
 	}
 
@@ -1849,10 +1852,10 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 		pipe_fmt = &pipe->configs[pipe->pipe_config_idx].in_fmt;
 
 	/* update the blob based on virtual bus_id*/
-	cfg = skl_get_ep_blob(skl, mconfig->vbus_id, link_type,
-					pipe_fmt->bps, pipe_fmt->channels,
-					pipe_fmt->freq, pipe->direction,
-					dev_type);
+	cfg = intel_nhlt_get_endpoint_blob(skl->nhlt, mconfig->vbus_id, link_type,
+					pipe_fmt->bps, params->s_cont,
+					pipe_fmt->channels, pipe_fmt->freq,
+					pipe->direction, dev_type);
 	if (cfg) {
 		mconfig->formats_config[SKL_PARAM_INIT].caps_size = cfg->size;
 		mconfig->formats_config[SKL_PARAM_INIT].caps = (u32 *)&cfg->caps;
diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index f0695b2ac5dd..22963634fbea 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -284,6 +284,7 @@ struct skl_pipe_params {
 	u32 ch;
 	u32 s_freq;
 	u32 s_fmt;
+	u32 s_cont;
 	u8 linktype;
 	snd_pcm_format_t format;
 	int link_index;
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 37195aafbf27..3b92dfc23731 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -165,10 +165,6 @@ struct skl_dsp_ops {
 int skl_platform_unregister(struct device *dev);
 int skl_platform_register(struct device *dev);
 
-struct nhlt_specific_cfg *skl_get_ep_blob(struct skl_dev *skl, u32 instance,
-					u8 link_type, u8 s_fmt, u8 num_ch,
-					u32 s_rate, u8 dirn, u8 dev_type);
-
 int skl_nhlt_update_topology_bin(struct skl_dev *skl);
 int skl_init_dsp(struct skl_dev *skl);
 int skl_free_dsp(struct skl_dev *skl);
-- 
2.25.1

