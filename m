Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C676D640915
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:14:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B4C3184E;
	Fri,  2 Dec 2022 16:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B4C3184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994083;
	bh=g/xYhaaSrqDNg685TxmOzMH9uogfuXFyRbpfHxE1fGs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F8sWsNOJGP3XgIRAILGJRiw5yxFHaSoprDlldvE75X4OWqMhtnN1+Srij9x698LXG
	 u+O+a+o9oCjvcyJUhMe5B6UhyWF+4ZLuVg56MIG/OZwDOyZ6sZriBRHujw7Fkq7lXK
	 QII+YRPt2kCy42yHB4KcoqPC3KwFmV8ZHAkSbovc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F15F805B1;
	Fri,  2 Dec 2022 16:12:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92EC1F805B1; Fri,  2 Dec 2022 16:12:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB21AF80589
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:11:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB21AF80589
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J6xYNTni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993919; x=1701529919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g/xYhaaSrqDNg685TxmOzMH9uogfuXFyRbpfHxE1fGs=;
 b=J6xYNTniM30XwKpfyUqxUtwaZIQ64t4nVuCOLr4XRwnDWpt1AxLBqQoW
 UPyUc7vR0bJtwybX8AtcH3BRnc6BssJgZytiIqIpQ1XRxff0QhjuviDG9
 v/qnUtV31zGPJ/kP3Z8/0fY/hRtIJxvWZLP6vRG1HMupMYrs1HIiSc+b7
 xZdzcGgMbDyuWA02YoaFztqhafznxAMSVLSIZgQDL9zGbEcQkQ17Obwnq
 LjjogsvEH4Glrg8NB+HMkBrW2wUHm6JMNjWkeYWL0EPFg88h9Rmc2cQ6X
 4vALrs3VqcvbjyK7yhcTZGUjUn84nvBX+LJ/u9CgxyZZfxpOhPO/+TIqp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251798"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251798"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:11:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504738"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504738"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:11:52 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 10/16] ASoC: Intel: avs: Probe compress operations
Date: Fri,  2 Dec 2022 16:28:35 +0100
Message-Id: <20221202152841.672536-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Add compress operations handlers for data extraction through probes. A
single HDAudio stream is enlisted for said purpose. Operations follow
same protocol as for standard PCM streaming on HOST side.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig      |   1 +
 sound/soc/intel/avs/avs.h    |   3 +
 sound/soc/intel/avs/probes.c | 224 ++++++++++++++++++++++++++++++++++-
 3 files changed, 225 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index ac799de4f7fd..4b9e498e3303 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -217,6 +217,7 @@ config SND_SOC_INTEL_AVS
 	select SND_SOC_ACPI if ACPI
 	select SND_SOC_TOPOLOGY
 	select SND_SOC_HDA
+	select SND_SOC_COMPRESS if DEBUG_FS
 	select SND_HDA_EXT_CORE
 	select SND_HDA_DSP_LOADER
 	select SND_INTEL_DSP_CONFIG
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 7a9fb27d3845..e5e7c72eb511 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -144,6 +144,9 @@ struct avs_dev {
 	u32 aging_timer_period;
 	u32 fifo_full_timer_period;
 	u32 logged_resources;	/* context dependent: core or library */
+	/* probes */
+	struct hdac_ext_stream *extractor;
+	unsigned int num_probe_streams;
 #endif
 };
 
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 339bad6fec22..e90284ec8500 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -6,13 +6,15 @@
 //          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
 //
 
+#include <sound/compress_driver.h>
+#include <sound/hdaudio_ext.h>
+#include <sound/hdaudio.h>
+#include <sound/soc.h>
 #include "avs.h"
 #include "messages.h"
 
-__maybe_unused
 static int avs_dsp_init_probe(struct avs_dev *adev, union avs_connector_node_id node_id,
 			      size_t buffer_size)
-
 {
 	struct avs_probe_cfg cfg = {{0}};
 	struct avs_module_entry mentry;
@@ -34,7 +36,6 @@ static int avs_dsp_init_probe(struct avs_dev *adev, union avs_connector_node_id
 				   sizeof(cfg), &dummy);
 }
 
-__maybe_unused
 static void avs_dsp_delete_probe(struct avs_dev *adev)
 {
 	struct avs_module_entry mentry;
@@ -44,3 +45,220 @@ static void avs_dsp_delete_probe(struct avs_dev *adev)
 	/* There is only ever one probe module instance. */
 	avs_dsp_delete_module(adev, mentry.module_id, 0, INVALID_PIPELINE_ID, 0);
 }
+
+static inline struct hdac_ext_stream *avs_compr_get_host_stream(struct snd_compr_stream *cstream)
+{
+	return cstream->runtime->private_data;
+}
+
+static int avs_probe_compr_open(struct snd_compr_stream *cstream, struct snd_soc_dai *dai)
+{
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct hdac_bus *bus = &adev->base.core;
+	struct hdac_ext_stream *host_stream;
+
+	if (adev->extractor) {
+		dev_err(dai->dev, "Cannot open more than one extractor stream\n");
+		return -EEXIST;
+	}
+
+	host_stream = snd_hdac_ext_cstream_assign(bus, cstream);
+	if (!host_stream) {
+		dev_err(dai->dev, "Failed to assign HDAudio stream for extraction\n");
+		return -EBUSY;
+	}
+
+	adev->extractor = host_stream;
+	hdac_stream(host_stream)->curr_pos = 0;
+	cstream->runtime->private_data = host_stream;
+
+	return 0;
+}
+
+static int avs_probe_compr_free(struct snd_compr_stream *cstream, struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *host_stream = avs_compr_get_host_stream(cstream);
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct avs_probe_point_desc *desc;
+	/* Extractor node identifier. */
+	unsigned int vindex = INVALID_NODE_ID.vindex;
+	size_t num_desc;
+	int i, ret;
+
+	/* Disconnect all probe points. */
+	ret = avs_ipc_probe_get_points(adev, &desc, &num_desc);
+	if (ret) {
+		dev_err(dai->dev, "get probe points failed: %d\n", ret);
+		ret = AVS_IPC_RET(ret);
+		goto exit;
+	}
+
+	for (i = 0; i < num_desc; i++)
+		if (desc[i].node_id.vindex == vindex)
+			avs_ipc_probe_disconnect_points(adev, &desc[i].id, 1);
+	kfree(desc);
+
+exit:
+	if (adev->num_probe_streams) {
+		adev->num_probe_streams--;
+		if (!adev->num_probe_streams) {
+			avs_dsp_delete_probe(adev);
+			avs_dsp_enable_d0ix(adev);
+		}
+	}
+
+	snd_hdac_stream_cleanup(hdac_stream(host_stream));
+	hdac_stream(host_stream)->prepared = 0;
+	snd_hdac_ext_stream_release(host_stream, HDAC_EXT_STREAM_TYPE_HOST);
+
+	snd_compr_free_pages(cstream);
+	adev->extractor = NULL;
+
+	return ret;
+}
+
+static int avs_probe_compr_set_params(struct snd_compr_stream *cstream,
+				      struct snd_compr_params *params, struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *host_stream = avs_compr_get_host_stream(cstream);
+	struct snd_compr_runtime *rtd = cstream->runtime;
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	/* compr params do not store bit depth, default to S32_LE. */
+	snd_pcm_format_t format = SNDRV_PCM_FORMAT_S32_LE;
+	unsigned int format_val;
+	int bps, ret;
+
+	hdac_stream(host_stream)->bufsize = 0;
+	hdac_stream(host_stream)->period_bytes = 0;
+	hdac_stream(host_stream)->format_val = 0;
+	cstream->dma_buffer.dev.type = SNDRV_DMA_TYPE_DEV_SG;
+	cstream->dma_buffer.dev.dev = adev->dev;
+
+	ret = snd_compr_malloc_pages(cstream, rtd->buffer_size);
+	if (ret < 0)
+		return ret;
+	bps = snd_pcm_format_physical_width(format);
+	if (bps < 0)
+		return bps;
+	format_val = snd_hdac_calc_stream_format(params->codec.sample_rate, params->codec.ch_out,
+						 format, bps, 0);
+	ret = snd_hdac_stream_set_params(hdac_stream(host_stream), format_val);
+	if (ret < 0)
+		return ret;
+	ret = snd_hdac_stream_setup(hdac_stream(host_stream));
+	if (ret < 0)
+		return ret;
+
+	hdac_stream(host_stream)->prepared = 1;
+
+	if (!adev->num_probe_streams) {
+		union avs_connector_node_id node_id;
+
+		/* D0ix not allowed during probing. */
+		ret = avs_dsp_disable_d0ix(adev);
+		if (ret)
+			return ret;
+
+		node_id.vindex = hdac_stream(host_stream)->stream_tag - 1;
+		node_id.dma_type = AVS_DMA_HDA_HOST_INPUT;
+
+		ret = avs_dsp_init_probe(adev, node_id, rtd->dma_bytes);
+		if (ret < 0) {
+			dev_err(dai->dev, "probe init failed: %d\n", ret);
+			avs_dsp_enable_d0ix(adev);
+			return ret;
+		}
+	}
+
+	adev->num_probe_streams++;
+	return 0;
+}
+
+static int avs_probe_compr_trigger(struct snd_compr_stream *cstream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *host_stream = avs_compr_get_host_stream(cstream);
+	struct avs_dev *adev = to_avs_dev(dai->dev);
+	struct hdac_bus *bus = &adev->base.core;
+	unsigned long cookie;
+
+	if (!hdac_stream(host_stream)->prepared)
+		return -EPIPE;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		spin_lock_irqsave(&bus->reg_lock, cookie);
+		snd_hdac_stream_start(hdac_stream(host_stream), true);
+		spin_unlock_irqrestore(&bus->reg_lock, cookie);
+		break;
+
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		spin_lock_irqsave(&bus->reg_lock, cookie);
+		snd_hdac_stream_stop(hdac_stream(host_stream));
+		spin_unlock_irqrestore(&bus->reg_lock, cookie);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int avs_probe_compr_pointer(struct snd_compr_stream *cstream,
+				   struct snd_compr_tstamp *tstamp, struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *host_stream = avs_compr_get_host_stream(cstream);
+	struct snd_soc_pcm_stream *pstream;
+
+	pstream = &dai->driver->capture;
+	tstamp->copied_total = hdac_stream(host_stream)->curr_pos;
+	tstamp->sampling_rate = snd_pcm_rate_bit_to_rate(pstream->rates);
+
+	return 0;
+}
+
+static int avs_probe_compr_copy(struct snd_soc_component *comp, struct snd_compr_stream *cstream,
+				char __user *buf, size_t count)
+{
+	struct snd_compr_runtime *rtd = cstream->runtime;
+	unsigned int offset, n;
+	void *ptr;
+	int ret;
+
+	if (count > rtd->buffer_size)
+		count = rtd->buffer_size;
+
+	div_u64_rem(rtd->total_bytes_transferred, rtd->buffer_size, &offset);
+	ptr = rtd->dma_area + offset;
+	n = rtd->buffer_size - offset;
+
+	if (count < n) {
+		ret = copy_to_user(buf, ptr, count);
+	} else {
+		ret = copy_to_user(buf, ptr, n);
+		ret += copy_to_user(buf + n, rtd->dma_area, count - n);
+	}
+
+	if (ret)
+		return count - ret;
+	return count;
+}
+
+__maybe_unused
+static const struct snd_soc_cdai_ops avs_probe_dai_ops = {
+	.startup = avs_probe_compr_open,
+	.shutdown = avs_probe_compr_free,
+	.set_params = avs_probe_compr_set_params,
+	.trigger = avs_probe_compr_trigger,
+	.pointer = avs_probe_compr_pointer,
+};
+
+__maybe_unused
+static const struct snd_compress_ops avs_probe_compress_ops = {
+	.copy = avs_probe_compr_copy,
+};
-- 
2.25.1

