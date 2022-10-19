Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF52604D54
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 18:26:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E49CAE65;
	Wed, 19 Oct 2022 18:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E49CAE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666196780;
	bh=Ccm4OyFt7qoBdcKBFuM7so38IOmacdrWYFO24pt/sLA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNvkar8hxRamxTjsxa2+JhJc7WL4+afaH2o3K2+4fGhkszU4hq+iBawfblc0njeq7
	 p3UUsBPs4C2oH5lPLvsaQ5L+frp2D49ElG9FGMpMQWoAV1PQbbmxDMR8bq7Lu9Lzb+
	 IsQQHwX/CWGbk40GOr6Z/h5YIduqo/2Brztq5Kp0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4787AF804FA;
	Wed, 19 Oct 2022 18:24:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99AAAF8055C; Wed, 19 Oct 2022 18:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D16A2F804F1
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 18:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D16A2F804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UR+CDzqb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666196632; x=1697732632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ccm4OyFt7qoBdcKBFuM7so38IOmacdrWYFO24pt/sLA=;
 b=UR+CDzqbuonHLlyTOjMz4/QYZhWjGDtE6n4cQSBSHHq9jJCeqAsc4Jc5
 +mnJIkC0tPrf7BdTDE1qxNDuHM/piLN1t/E7YLyxqSht8tfYCKoP3j+wJ
 tWkx5sy1X4Y3wLRLtGPRsroe0hk2NCWBCAURQoNfvGE8CrpeftKgkQf0o
 LMMJptg+i77/YAaTWsAJj21H626lFu5FKhsORLY8JHoqDh6f/pD0H/TGl
 44uFkUgUrLgRN71bAy0VL9XVpoEncTCaIk8Gentl++yPIoD5VQWD5LCaS
 ahxoCJfWvVxSRz0vUwW3MyD6f3UtGizN+XVCvNMd6uSDsCtzHUV6J6o0U A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286856237"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286856237"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698153839"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="698153839"
Received: from afsinurr-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.16.185])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/10] ALSA/ASoC: hda: ext: remove 'link' prefix for
 stream-related operations
Date: Wed, 19 Oct 2022 11:21:11 -0500
Message-Id: <20221019162115.185917-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

We should only use 'link' in the context of multi-link
configurations. Streams are configured from a different register space
and are not dependent on link except for LOSIDV settings.

Not functionality change, just pure rename.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hdaudio_ext.h       |  8 ++++----
 sound/hda/ext/hdac_ext_stream.c   | 28 ++++++++++++++--------------
 sound/soc/intel/avs/pcm.c         |  8 ++++----
 sound/soc/intel/skylake/skl-pcm.c |  8 ++++----
 sound/soc/sof/intel/hda-dai.c     | 16 ++++++++--------
 5 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index f0edbadc99023..472fed072e985 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -100,10 +100,10 @@ int snd_hdac_ext_stream_set_dpibr(struct hdac_bus *bus,
 				struct hdac_ext_stream *hext_stream, u32 value);
 int snd_hdac_ext_stream_set_lpib(struct hdac_ext_stream *hext_stream, u32 value);
 
-void snd_hdac_ext_link_stream_start(struct hdac_ext_stream *hext_stream);
-void snd_hdac_ext_link_stream_clear(struct hdac_ext_stream *hext_stream);
-void snd_hdac_ext_link_stream_reset(struct hdac_ext_stream *hext_stream);
-int snd_hdac_ext_link_stream_setup(struct hdac_ext_stream *hext_stream, int fmt);
+void snd_hdac_ext_stream_start(struct hdac_ext_stream *hext_stream);
+void snd_hdac_ext_stream_clear(struct hdac_ext_stream *hext_stream);
+void snd_hdac_ext_stream_reset(struct hdac_ext_stream *hext_stream);
+int snd_hdac_ext_stream_setup(struct hdac_ext_stream *hext_stream, int fmt);
 
 struct hdac_ext_link {
 	struct hdac_bus *bus;
diff --git a/sound/hda/ext/hdac_ext_stream.c b/sound/hda/ext/hdac_ext_stream.c
index 70f3ad71aaf0d..c06beaaffe0a1 100644
--- a/sound/hda/ext/hdac_ext_stream.c
+++ b/sound/hda/ext/hdac_ext_stream.c
@@ -140,36 +140,36 @@ void snd_hdac_ext_stream_decouple(struct hdac_bus *bus,
 EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_decouple);
 
 /**
- * snd_hdac_ext_link_stream_start - start a stream
+ * snd_hdac_ext_stream_start - start a stream
  * @hext_stream: HD-audio ext core stream to start
  */
-void snd_hdac_ext_link_stream_start(struct hdac_ext_stream *hext_stream)
+void snd_hdac_ext_stream_start(struct hdac_ext_stream *hext_stream)
 {
 	snd_hdac_updatel(hext_stream->pplc_addr, AZX_REG_PPLCCTL,
 			 AZX_PPLCCTL_RUN, AZX_PPLCCTL_RUN);
 }
-EXPORT_SYMBOL_GPL(snd_hdac_ext_link_stream_start);
+EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_start);
 
 /**
- * snd_hdac_ext_link_stream_clear - stop a stream DMA
+ * snd_hdac_ext_stream_clear - stop a stream DMA
  * @hext_stream: HD-audio ext core stream to stop
  */
-void snd_hdac_ext_link_stream_clear(struct hdac_ext_stream *hext_stream)
+void snd_hdac_ext_stream_clear(struct hdac_ext_stream *hext_stream)
 {
 	snd_hdac_updatel(hext_stream->pplc_addr, AZX_REG_PPLCCTL, AZX_PPLCCTL_RUN, 0);
 }
-EXPORT_SYMBOL_GPL(snd_hdac_ext_link_stream_clear);
+EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_clear);
 
 /**
- * snd_hdac_ext_link_stream_reset - reset a stream
+ * snd_hdac_ext_stream_reset - reset a stream
  * @hext_stream: HD-audio ext core stream to reset
  */
-void snd_hdac_ext_link_stream_reset(struct hdac_ext_stream *hext_stream)
+void snd_hdac_ext_stream_reset(struct hdac_ext_stream *hext_stream)
 {
 	unsigned char val;
 	int timeout;
 
-	snd_hdac_ext_link_stream_clear(hext_stream);
+	snd_hdac_ext_stream_clear(hext_stream);
 
 	snd_hdac_updatel(hext_stream->pplc_addr, AZX_REG_PPLCCTL,
 			 AZX_PPLCCTL_STRST, AZX_PPLCCTL_STRST);
@@ -196,20 +196,20 @@ void snd_hdac_ext_link_stream_reset(struct hdac_ext_stream *hext_stream)
 	} while (--timeout);
 
 }
-EXPORT_SYMBOL_GPL(snd_hdac_ext_link_stream_reset);
+EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_reset);
 
 /**
- * snd_hdac_ext_link_stream_setup -  set up the SD for streaming
+ * snd_hdac_ext_stream_setup -  set up the SD for streaming
  * @hext_stream: HD-audio ext core stream to set up
  * @fmt: stream format
  */
-int snd_hdac_ext_link_stream_setup(struct hdac_ext_stream *hext_stream, int fmt)
+int snd_hdac_ext_stream_setup(struct hdac_ext_stream *hext_stream, int fmt)
 {
 	struct hdac_stream *hstream = &hext_stream->hstream;
 	unsigned int val;
 
 	/* make sure the run bit is zero for SD */
-	snd_hdac_ext_link_stream_clear(hext_stream);
+	snd_hdac_ext_stream_clear(hext_stream);
 	/* program the stream_tag */
 	val = readl(hext_stream->pplc_addr + AZX_REG_PPLCCTL);
 	val = (val & ~AZX_PPLCCTL_STRM_MASK) |
@@ -221,7 +221,7 @@ int snd_hdac_ext_link_stream_setup(struct hdac_ext_stream *hext_stream, int fmt)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_hdac_ext_link_stream_setup);
+EXPORT_SYMBOL_GPL(snd_hdac_ext_stream_setup);
 
 /**
  * snd_hdac_ext_link_set_stream_id - maps stream id to link output
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 4e5849535a8c6..d77afe5c65b96 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -322,8 +322,8 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 						 runtime->sample_bits, 0);
 
 	snd_hdac_ext_stream_decouple(bus, link_stream, true);
-	snd_hdac_ext_link_stream_reset(link_stream);
-	snd_hdac_ext_link_stream_setup(link_stream, format_val);
+	snd_hdac_ext_stream_reset(link_stream);
+	snd_hdac_ext_stream_setup(link_stream, format_val);
 
 	link = snd_hdac_ext_bus_get_hlink_by_addr(bus, codec->core.addr);
 	if (!link)
@@ -355,7 +355,7 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_hdac_ext_link_stream_start(link_stream);
+		snd_hdac_ext_stream_start(link_stream);
 
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
 		if (ret < 0)
@@ -368,7 +368,7 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ret < 0)
 			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
 
-		snd_hdac_ext_link_stream_clear(link_stream);
+		snd_hdac_ext_stream_clear(link_stream);
 
 		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
 			ret = avs_path_reset(data->path);
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index b07c5b58e0a62..f7e97b5a449fc 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -190,9 +190,9 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	dev_dbg(dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params->s_freq, params->ch, params->format);
 
-	snd_hdac_ext_link_stream_reset(stream);
+	snd_hdac_ext_stream_reset(stream);
 
-	snd_hdac_ext_link_stream_setup(stream, format_val);
+	snd_hdac_ext_stream_setup(stream, format_val);
 
 	stream_tag = hstream->stream_tag;
 	if (stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -612,13 +612,13 @@ static int skl_link_pcm_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_hdac_ext_link_stream_start(link_dev);
+		snd_hdac_ext_stream_start(link_dev);
 		break;
 
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
-		snd_hdac_ext_link_stream_clear(link_dev);
+		snd_hdac_ext_stream_clear(link_dev);
 		if (cmd == SNDRV_PCM_TRIGGER_SUSPEND)
 			snd_hdac_ext_stream_decouple(bus, stream, false);
 		break;
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index b71bb29e764b3..575adf3133c27 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -154,7 +154,7 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 		return -EINVAL;
 
 	if (trigger_suspend_stop)
-		snd_hdac_ext_link_stream_clear(hext_stream);
+		snd_hdac_ext_stream_clear(hext_stream);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		stream_tag = hdac_stream(hext_stream)->stream_tag;
@@ -180,7 +180,7 @@ static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 	struct hdac_ext_link *hlink;
 	unsigned int format_val;
 
-	snd_hdac_ext_link_stream_reset(hext_stream);
+	snd_hdac_ext_stream_reset(hext_stream);
 
 	format_val = snd_hdac_calc_stream_format(params->s_freq, params->ch,
 						 params->format,
@@ -189,7 +189,7 @@ static int hda_link_dma_params(struct hdac_ext_stream *hext_stream,
 	dev_dbg(bus->dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params->s_freq, params->ch, params->format);
 
-	snd_hdac_ext_link_stream_setup(hext_stream, format_val);
+	snd_hdac_ext_stream_setup(hext_stream, format_val);
 
 	if (hext_stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
 		list_for_each_entry(hlink, &bus->hlink_list, list) {
@@ -270,7 +270,7 @@ static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_hdac_ext_link_stream_start(hext_stream);
+		snd_hdac_ext_stream_start(hext_stream);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
@@ -280,7 +280,7 @@ static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		snd_hdac_ext_link_stream_clear(hext_stream);
+		snd_hdac_ext_stream_clear(hext_stream);
 
 		break;
 	default:
@@ -476,7 +476,7 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_hdac_ext_link_stream_start(hext_stream);
+		snd_hdac_ext_stream_start(hext_stream);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
@@ -491,7 +491,7 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 
 		pipeline->state = SOF_IPC4_PIPE_PAUSED;
 
-		snd_hdac_ext_link_stream_clear(hext_stream);
+		snd_hdac_ext_stream_clear(hext_stream);
 
 		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
 						  SOF_IPC4_PIPE_RESET);
@@ -519,7 +519,7 @@ static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
 
 		pipeline->state = SOF_IPC4_PIPE_PAUSED;
 
-		snd_hdac_ext_link_stream_clear(hext_stream);
+		snd_hdac_ext_stream_clear(hext_stream);
 		break;
 	}
 	default:
-- 
2.34.1

