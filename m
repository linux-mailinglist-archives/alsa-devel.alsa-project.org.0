Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D48727233F
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 14:01:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C996416C1;
	Mon, 21 Sep 2020 14:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C996416C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600689672;
	bh=nKKQqPcTbeOfPORROnrI3a/df2nvyid95hSPClibT+k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iy8MMtmL01fT+6+iQkyo1UV4Kv1LSgM9PfuWtVqh80+p6r2URFq7TvxlSU7JVLGcE
	 7X+zSpJhE1mn3R8fw8sTE/eQ9b1Y8YkFQaGRS/9I7oQa0Jp9WfDgIkitLskd069r4l
	 haTNezlI1/qK4TFML9HcRb0tr5jUMkAHQJsCXo9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F69F80316;
	Mon, 21 Sep 2020 13:56:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A6A1F802EA; Mon, 21 Sep 2020 13:56:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9420EF8021C
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 13:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9420EF8021C
IronPort-SDR: dHg829Y4ITi0GsLbYw4IjEX0DoHiBdHfJtZfaurNcK4WuA9VXRlFsAl0KsJPl39VmCAvo3Mebp
 TmMcD15H/27Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="159657297"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="159657297"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 04:56:06 -0700
IronPort-SDR: aiFVzTxOFZQ31E1gxOFSftEfV0XdqbB/r+yyNDMlmOUKJdxC/u07iZ5RLzs5RHPeHn7CPf1mHt
 RqIqxkEu3iYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="304486431"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 21 Sep 2020 04:56:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v7 06/14] ASoC: Intel: catpt: PCM operations
Date: Mon, 21 Sep 2020 13:54:16 +0200
Message-Id: <20200921115424.4105-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921115424.4105-1-cezary.rojewski@intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, marcin.barlik@intel.com, zwisler@google.com,
 lgirdwood@gmail.com, tiwai@suse.com, filip.proborszcz@intel.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, cujomalainey@chromium.org,
 krzysztof.hejmowski@intel.com, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

DSP designed for Lynxpoint and Wildcat Point offers no dynamic topology
i.e. all pipelines are already defined within firmware and host is
relegated to allocing stream for predefined pins. This is represented by
'catpt_topology' member.

Implementation covers all available pin types:
- system playback and capture
- two offload streams
- loopback (reference)
- bluetooth playback and capture

PCM DAI operations differentiate between those pins as some (mainly
offload) are to be handled differently - DSP expects wp updates on each
notify_position notification.

System playback has no volume control capability as it is routed to
mixer stream directly. Other primary streams - capture and two offloads
- offer individual volume controls.

Compared to sound/soc/intel/haswell this configures SSP device format
automatically on pcm creation.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/core.h   |    8 +
 sound/soc/intel/catpt/ipc.c    |   37 +
 sound/soc/intel/catpt/loader.c |    6 +
 sound/soc/intel/catpt/pcm.c    | 1210 ++++++++++++++++++++++++++++++++
 4 files changed, 1261 insertions(+)
 create mode 100644 sound/soc/intel/catpt/pcm.c

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index 260e5ae94a2c..a29b4c0232cb 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -175,4 +175,12 @@ struct catpt_stream_runtime {
 	struct list_head node;
 };
 
+int catpt_register_plat_component(struct catpt_dev *cdev);
+void catpt_stream_update_position(struct catpt_dev *cdev,
+				  struct catpt_stream_runtime *stream,
+				  struct catpt_notify_position *pos);
+struct catpt_stream_runtime *
+catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id);
+int catpt_arm_stream_templates(struct catpt_dev *cdev);
+
 #endif
diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
index c49c9cf66075..9e4e33d99c03 100644
--- a/sound/soc/intel/catpt/ipc.c
+++ b/sound/soc/intel/catpt/ipc.c
@@ -138,6 +138,42 @@ int catpt_dsp_send_msg(struct catpt_dev *cdev, struct catpt_ipc_msg request,
 					  cdev->ipc.default_timeout);
 }
 
+static void
+catpt_dsp_notify_stream(struct catpt_dev *cdev, union catpt_notify_msg msg)
+{
+	struct catpt_stream_runtime *stream;
+	struct catpt_notify_position pos;
+	struct catpt_notify_glitch glitch;
+
+	stream = catpt_stream_find(cdev, msg.stream_hw_id);
+	if (!stream) {
+		dev_warn(cdev->dev, "notify %d for non-existent stream %d\n",
+			 msg.notify_reason, msg.stream_hw_id);
+		return;
+	}
+
+	switch (msg.notify_reason) {
+	case CATPT_NOTIFY_POSITION_CHANGED:
+		memcpy_fromio(&pos, catpt_inbox_addr(cdev), sizeof(pos));
+
+		catpt_stream_update_position(cdev, stream, &pos);
+		break;
+
+	case CATPT_NOTIFY_GLITCH_OCCURRED:
+		memcpy_fromio(&glitch, catpt_inbox_addr(cdev), sizeof(glitch));
+
+		dev_warn(cdev->dev, "glitch %d at pos: 0x%08llx, wp: 0x%08x\n",
+			 glitch.type, glitch.presentation_pos,
+			 glitch.write_pos);
+		break;
+
+	default:
+		dev_warn(cdev->dev, "unknown notification: %d received\n",
+			 msg.notify_reason);
+		break;
+	}
+}
+
 static void catpt_dsp_copy_rx(struct catpt_dev *cdev, u32 header)
 {
 	struct catpt_ipc *ipc = &cdev->ipc;
@@ -177,6 +213,7 @@ static void catpt_dsp_process_response(struct catpt_dev *cdev, u32 header)
 	case CATPT_GLB_STREAM_MESSAGE:
 		switch (msg.subtype) {
 		case CATPT_STRM_NOTIFICATION:
+			catpt_dsp_notify_stream(cdev, msg);
 			break;
 		default:
 			catpt_dsp_copy_rx(cdev, header);
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index c331695965b8..8c51ab45709c 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -658,6 +658,12 @@ int catpt_first_boot_firmware(struct catpt_dev *cdev)
 	if (ret)
 		return CATPT_IPC_ERROR(ret);
 
+	ret = catpt_arm_stream_templates(cdev);
+	if (ret) {
+		dev_err(cdev->dev, "arm templates failed: %d\n", ret);
+		return ret;
+	}
+
 	/* update dram pg for scratch and restricted regions */
 	catpt_dsp_update_srampge(cdev, &cdev->dram, cdev->spec->dram_mask);
 
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
new file mode 100644
index 000000000000..c8f8bdc7c76e
--- /dev/null
+++ b/sound/soc/intel/catpt/pcm.c
@@ -0,0 +1,1210 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <linux/pm_runtime.h>
+#include <sound/soc.h>
+#include <sound/pcm_params.h>
+#include <uapi/sound/tlv.h>
+#include "core.h"
+#include "messages.h"
+
+struct catpt_stream_template {
+	enum catpt_path_id path_id;
+	enum catpt_stream_type type;
+	u32 persistent_size;
+	u8 num_entries;
+	struct catpt_module_entry entries[];
+};
+
+static struct catpt_stream_template system_pb = {
+	.path_id = CATPT_PATH_SSP0_OUT,
+	.type = CATPT_STRM_TYPE_SYSTEM,
+	.num_entries = 1,
+	.entries = {{ CATPT_MODID_PCM_SYSTEM, 0 }},
+};
+
+static struct catpt_stream_template system_cp = {
+	.path_id = CATPT_PATH_SSP0_IN,
+	.type = CATPT_STRM_TYPE_CAPTURE,
+	.num_entries = 1,
+	.entries = {{ CATPT_MODID_PCM_CAPTURE, 0 }},
+};
+
+static struct catpt_stream_template offload_pb = {
+	.path_id = CATPT_PATH_SSP0_OUT,
+	.type = CATPT_STRM_TYPE_RENDER,
+	.num_entries = 1,
+	.entries = {{ CATPT_MODID_PCM, 0 }},
+};
+
+static struct catpt_stream_template loopback_cp = {
+	.path_id = CATPT_PATH_SSP0_OUT,
+	.type = CATPT_STRM_TYPE_LOOPBACK,
+	.num_entries = 1,
+	.entries = {{ CATPT_MODID_PCM_REFERENCE, 0 }},
+};
+
+static struct catpt_stream_template bluetooth_pb = {
+	.path_id = CATPT_PATH_SSP1_OUT,
+	.type = CATPT_STRM_TYPE_BLUETOOTH_RENDER,
+	.num_entries = 1,
+	.entries = {{ CATPT_MODID_BLUETOOTH_RENDER, 0 }},
+};
+
+static struct catpt_stream_template bluetooth_cp = {
+	.path_id = CATPT_PATH_SSP1_IN,
+	.type = CATPT_STRM_TYPE_BLUETOOTH_CAPTURE,
+	.num_entries = 1,
+	.entries = {{ CATPT_MODID_BLUETOOTH_CAPTURE, 0 }},
+};
+
+static struct catpt_stream_template *catpt_topology[] = {
+	[CATPT_STRM_TYPE_RENDER]		= &offload_pb,
+	[CATPT_STRM_TYPE_SYSTEM]		= &system_pb,
+	[CATPT_STRM_TYPE_CAPTURE]		= &system_cp,
+	[CATPT_STRM_TYPE_LOOPBACK]		= &loopback_cp,
+	[CATPT_STRM_TYPE_BLUETOOTH_RENDER]	= &bluetooth_pb,
+	[CATPT_STRM_TYPE_BLUETOOTH_CAPTURE]	= &bluetooth_cp,
+};
+
+static struct catpt_stream_template *
+catpt_get_stream_template(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtm = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtm, 0);
+	enum catpt_stream_type type;
+
+	type = cpu_dai->driver->id;
+
+	/* account for capture in bidirectional dais */
+	switch (type) {
+	case CATPT_STRM_TYPE_SYSTEM:
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			type = CATPT_STRM_TYPE_CAPTURE;
+		break;
+	case CATPT_STRM_TYPE_BLUETOOTH_RENDER:
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			type = CATPT_STRM_TYPE_BLUETOOTH_CAPTURE;
+		break;
+	default:
+		break;
+	};
+
+	return catpt_topology[type];
+}
+
+struct catpt_stream_runtime *
+catpt_stream_find(struct catpt_dev *cdev, u8 stream_hw_id)
+{
+	struct catpt_stream_runtime *pos, *result = NULL;
+
+	spin_lock(&cdev->list_lock);
+	list_for_each_entry(pos, &cdev->stream_list, node) {
+		if (pos->info.stream_hw_id == stream_hw_id) {
+			result = pos;
+			break;
+		}
+	}
+
+	spin_unlock(&cdev->list_lock);
+	return result;
+}
+
+static u32 catpt_stream_read_position(struct catpt_dev *cdev,
+				      struct catpt_stream_runtime *stream)
+{
+	u32 pos;
+
+	memcpy_fromio(&pos, cdev->lpe_ba + stream->info.read_pos_regaddr,
+		      sizeof(pos));
+	return pos;
+}
+
+static u32 catpt_stream_volume(struct catpt_dev *cdev,
+			       struct catpt_stream_runtime *stream, u32 channel)
+{
+	u32 volume, offset;
+
+	if (channel >= CATPT_CHANNELS_MAX)
+		channel = 0;
+
+	offset = stream->info.volume_regaddr[channel];
+	memcpy_fromio(&volume, cdev->lpe_ba + offset, sizeof(volume));
+	return volume;
+}
+
+static u32 catpt_mixer_volume(struct catpt_dev *cdev,
+			      struct catpt_mixer_stream_info *info, u32 channel)
+{
+	u32 volume, offset;
+
+	if (channel >= CATPT_CHANNELS_MAX)
+		channel = 0;
+
+	offset = info->volume_regaddr[channel];
+	memcpy_fromio(&volume, cdev->lpe_ba + offset, sizeof(volume));
+	return volume;
+}
+
+static void catpt_arrange_page_table(struct snd_pcm_substream *substream,
+				     struct snd_dma_buffer *pgtbl)
+{
+	struct snd_pcm_runtime *rtm = substream->runtime;
+	struct snd_dma_buffer *databuf = snd_pcm_get_dma_buf(substream);
+	int i, pages;
+
+	pages = snd_sgbuf_aligned_pages(rtm->dma_bytes);
+
+	for (i = 0; i < pages; i++) {
+		u32 pfn, offset;
+		u32 *page_table;
+
+		pfn = snd_sgbuf_get_addr(databuf, i * PAGE_SIZE) >> PAGE_SHIFT;
+		/* incrementing by 2 on even and 3 on odd */
+		offset = ((i << 2) + i) >> 1;
+		page_table = (u32 *)(pgtbl->area + offset);
+
+		if (i & 1)
+			*page_table |= (pfn << 4);
+		else
+			*page_table |= pfn;
+	}
+}
+
+static u32 catpt_get_channel_map(enum catpt_channel_config config)
+{
+	switch (config) {
+	case CATPT_CHANNEL_CONFIG_MONO:
+		return (0xFFFFFFF0 | CATPT_CHANNEL_CENTER);
+
+	case CATPT_CHANNEL_CONFIG_STEREO:
+		return (0xFFFFFF00 | CATPT_CHANNEL_LEFT
+				   | (CATPT_CHANNEL_RIGHT << 4));
+
+	case CATPT_CHANNEL_CONFIG_2_POINT_1:
+		return (0xFFFFF000 | CATPT_CHANNEL_LEFT
+				   | (CATPT_CHANNEL_RIGHT << 4)
+				   | (CATPT_CHANNEL_LFE << 8));
+
+	case CATPT_CHANNEL_CONFIG_3_POINT_0:
+		return (0xFFFFF000 | CATPT_CHANNEL_LEFT
+				   | (CATPT_CHANNEL_CENTER << 4)
+				   | (CATPT_CHANNEL_RIGHT << 8));
+
+	case CATPT_CHANNEL_CONFIG_3_POINT_1:
+		return (0xFFFF0000 | CATPT_CHANNEL_LEFT
+				   | (CATPT_CHANNEL_CENTER << 4)
+				   | (CATPT_CHANNEL_RIGHT << 8)
+				   | (CATPT_CHANNEL_LFE << 12));
+
+	case CATPT_CHANNEL_CONFIG_QUATRO:
+		return (0xFFFF0000 | CATPT_CHANNEL_LEFT
+				   | (CATPT_CHANNEL_RIGHT << 4)
+				   | (CATPT_CHANNEL_LEFT_SURROUND << 8)
+				   | (CATPT_CHANNEL_RIGHT_SURROUND << 12));
+
+	case CATPT_CHANNEL_CONFIG_4_POINT_0:
+		return (0xFFFF0000 | CATPT_CHANNEL_LEFT
+				   | (CATPT_CHANNEL_CENTER << 4)
+				   | (CATPT_CHANNEL_RIGHT << 8)
+				   | (CATPT_CHANNEL_CENTER_SURROUND << 12));
+
+	case CATPT_CHANNEL_CONFIG_5_POINT_0:
+		return (0xFFF00000 | CATPT_CHANNEL_LEFT
+				   | (CATPT_CHANNEL_CENTER << 4)
+				   | (CATPT_CHANNEL_RIGHT << 8)
+				   | (CATPT_CHANNEL_LEFT_SURROUND << 12)
+				   | (CATPT_CHANNEL_RIGHT_SURROUND << 16));
+
+	case CATPT_CHANNEL_CONFIG_5_POINT_1:
+		return (0xFF000000 | CATPT_CHANNEL_CENTER
+				   | (CATPT_CHANNEL_LEFT << 4)
+				   | (CATPT_CHANNEL_RIGHT << 8)
+				   | (CATPT_CHANNEL_LEFT_SURROUND << 12)
+				   | (CATPT_CHANNEL_RIGHT_SURROUND << 16)
+				   | (CATPT_CHANNEL_LFE << 20));
+
+	case CATPT_CHANNEL_CONFIG_DUAL_MONO:
+		return (0xFFFFFF00 | CATPT_CHANNEL_LEFT
+				   | (CATPT_CHANNEL_LEFT << 4));
+
+	default:
+		return 0xFFFFFFFF;
+	}
+}
+
+static enum catpt_channel_config catpt_get_channel_config(u32 num_channels)
+{
+	switch (num_channels) {
+	case 6:
+		return CATPT_CHANNEL_CONFIG_5_POINT_1;
+	case 5:
+		return CATPT_CHANNEL_CONFIG_5_POINT_0;
+	case 4:
+		return CATPT_CHANNEL_CONFIG_QUATRO;
+	case 3:
+		return CATPT_CHANNEL_CONFIG_2_POINT_1;
+	case 1:
+		return CATPT_CHANNEL_CONFIG_MONO;
+	case 2:
+	default:
+		return CATPT_CHANNEL_CONFIG_STEREO;
+	}
+}
+
+static int catpt_dai_startup(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
+	struct catpt_stream_template *template;
+	struct catpt_stream_runtime *stream;
+	struct resource *res;
+	int ret;
+
+	template = catpt_get_stream_template(substream);
+
+	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
+	if (!stream)
+		return -ENOMEM;
+
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, cdev->dev, PAGE_SIZE,
+				  &stream->pgtbl);
+	if (ret)
+		goto err_pgtbl;
+
+	res = catpt_request_region(&cdev->dram, template->persistent_size);
+	if (!res) {
+		ret = -EBUSY;
+		goto err_request;
+	}
+
+	catpt_dsp_update_srampge(cdev, &cdev->dram, cdev->spec->dram_mask);
+
+	stream->template = template;
+	stream->persistent = res;
+	stream->substream = substream;
+	INIT_LIST_HEAD(&stream->node);
+	snd_soc_dai_set_dma_data(dai, substream, stream);
+
+	spin_lock(&cdev->list_lock);
+	list_add_tail(&stream->node, &cdev->stream_list);
+	spin_unlock(&cdev->list_lock);
+
+	return 0;
+
+err_request:
+	snd_dma_free_pages(&stream->pgtbl);
+err_pgtbl:
+	kfree(stream);
+	return ret;
+}
+
+static void catpt_dai_shutdown(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
+	struct catpt_stream_runtime *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	spin_lock(&cdev->list_lock);
+	list_del(&stream->node);
+	spin_unlock(&cdev->list_lock);
+
+	release_resource(stream->persistent);
+	kfree(stream->persistent);
+	catpt_dsp_update_srampge(cdev, &cdev->dram, cdev->spec->dram_mask);
+
+	snd_dma_free_pages(&stream->pgtbl);
+	kfree(stream);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
+}
+
+static int catpt_dai_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params,
+			       struct snd_soc_dai *dai)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
+	struct catpt_stream_runtime *stream;
+	struct catpt_audio_format afmt;
+	struct catpt_ring_info rinfo;
+	struct snd_pcm_runtime *rtm = substream->runtime;
+	struct snd_dma_buffer *dmab;
+	int ret;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	if (stream->allocated)
+		return 0;
+
+	memset(&afmt, 0, sizeof(afmt));
+	afmt.sample_rate = params_rate(params);
+	afmt.bit_depth = params_physical_width(params);
+	afmt.valid_bit_depth = params_width(params);
+	afmt.num_channels = params_channels(params);
+	afmt.channel_config = catpt_get_channel_config(afmt.num_channels);
+	afmt.channel_map = catpt_get_channel_map(afmt.channel_config);
+	afmt.interleaving = CATPT_INTERLEAVING_PER_CHANNEL;
+
+	dmab = snd_pcm_get_dma_buf(substream);
+	catpt_arrange_page_table(substream, &stream->pgtbl);
+
+	memset(&rinfo, 0, sizeof(rinfo));
+	rinfo.page_table_addr = stream->pgtbl.addr;
+	rinfo.num_pages = DIV_ROUND_UP(rtm->dma_bytes, PAGE_SIZE);
+	rinfo.size = rtm->dma_bytes;
+	rinfo.offset = 0;
+	rinfo.ring_first_page_pfn = snd_sgbuf_get_addr(dmab, 0) >> PAGE_SHIFT;
+
+	ret = catpt_ipc_alloc_stream(cdev, stream->template->path_id,
+				     stream->template->type,
+				     &afmt, &rinfo,
+				     stream->template->num_entries,
+				     stream->template->entries,
+				     stream->persistent,
+				     cdev->scratch,
+				     &stream->info);
+	if (ret)
+		return CATPT_IPC_ERROR(ret);
+
+	stream->allocated = true;
+	return 0;
+}
+
+static int catpt_dai_hw_free(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
+	struct catpt_stream_runtime *stream;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	if (!stream->allocated)
+		return 0;
+
+	catpt_ipc_reset_stream(cdev, stream->info.stream_hw_id);
+	catpt_ipc_free_stream(cdev, stream->info.stream_hw_id);
+
+	stream->allocated = false;
+	return 0;
+}
+
+static int catpt_set_dspvol(struct catpt_dev *cdev, u8 stream_id, long *ctlvol);
+
+static int catpt_dai_apply_usettings(struct snd_soc_dai *dai,
+				     struct catpt_stream_runtime *stream)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
+	struct snd_soc_component *component = dai->component;
+	struct snd_kcontrol *pos, *kctl = NULL;
+	const char *name;
+	int ret;
+	u32 id = stream->info.stream_hw_id;
+
+	/* only selected streams have individual controls */
+	switch (id) {
+	case CATPT_PIN_ID_OFFLOAD1:
+		name = "Media0 Playback Volume";
+		break;
+	case CATPT_PIN_ID_OFFLOAD2:
+		name = "Media1 Playback Volume";
+		break;
+	case CATPT_PIN_ID_CAPTURE1:
+		name = "Mic Capture Volume";
+		break;
+	case CATPT_PIN_ID_REFERENCE:
+		name = "Loopback Mute";
+		break;
+	default:
+		return 0;
+	};
+
+	list_for_each_entry(pos, &component->card->snd_card->controls, list) {
+		if (pos->private_data == component &&
+		    !strncmp(name, pos->id.name, sizeof(pos->id.name))) {
+			kctl = pos;
+			break;
+		}
+	}
+	if (!kctl)
+		return -ENOENT;
+
+	if (stream->template->type != CATPT_STRM_TYPE_LOOPBACK)
+		return catpt_set_dspvol(cdev, id, (long *)kctl->private_value);
+	ret = catpt_ipc_mute_loopback(cdev, id, *(bool *)kctl->private_value);
+	if (ret)
+		return CATPT_IPC_ERROR(ret);
+	return 0;
+}
+
+static int catpt_dai_prepare(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
+	struct catpt_stream_runtime *stream;
+	int ret;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+	if (stream->prepared)
+		return 0;
+
+	ret = catpt_ipc_reset_stream(cdev, stream->info.stream_hw_id);
+	if (ret)
+		return CATPT_IPC_ERROR(ret);
+
+	ret = catpt_ipc_pause_stream(cdev, stream->info.stream_hw_id);
+	if (ret)
+		return CATPT_IPC_ERROR(ret);
+
+	ret = catpt_dsp_update_lpclock(cdev);
+	if (ret)
+		return ret;
+
+	ret = catpt_dai_apply_usettings(dai, stream);
+	if (ret)
+		return ret;
+
+	stream->prepared = true;
+	return 0;
+}
+
+static int catpt_dai_trigger(struct snd_pcm_substream *substream, int cmd,
+			     struct snd_soc_dai *dai)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
+	struct catpt_stream_runtime *stream;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	snd_pcm_uframes_t pos;
+	int ret;
+
+	stream = snd_soc_dai_get_dma_data(dai, substream);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		/* only offload is set_write_pos driven */
+		if (stream->template->type != CATPT_STRM_TYPE_RENDER)
+			goto resume_stream;
+
+		pos = frames_to_bytes(runtime, runtime->start_threshold);
+		/*
+		 * Dsp operates on buffer halves, thus max 2x set_write_pos
+		 * (entire buffer filled) prior to stream start.
+		 */
+		ret = catpt_ipc_set_write_pos(cdev, stream->info.stream_hw_id,
+					      pos, false, false);
+		if (ret)
+			return CATPT_IPC_ERROR(ret);
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	resume_stream:
+		ret = catpt_ipc_resume_stream(cdev, stream->info.stream_hw_id);
+		if (ret)
+			return CATPT_IPC_ERROR(ret);
+		break;
+
+	case SNDRV_PCM_TRIGGER_STOP:
+		stream->prepared = false;
+		catpt_dsp_update_lpclock(cdev);
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = catpt_ipc_pause_stream(cdev, stream->info.stream_hw_id);
+		if (ret)
+			return CATPT_IPC_ERROR(ret);
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+void catpt_stream_update_position(struct catpt_dev *cdev,
+				  struct catpt_stream_runtime *stream,
+				  struct catpt_notify_position *pos)
+{
+	struct snd_pcm_substream *substream = stream->substream;
+	struct snd_pcm_runtime *r = substream->runtime;
+	snd_pcm_uframes_t dsppos, newpos;
+	int ret;
+
+	dsppos = bytes_to_frames(r, pos->stream_position);
+
+	/* only offload is set_write_pos driven */
+	if (stream->template->type != CATPT_STRM_TYPE_RENDER)
+		goto exit;
+
+	if (dsppos >= r->buffer_size / 2)
+		newpos = r->buffer_size / 2;
+	else
+		newpos = 0;
+	/*
+	 * Dsp operates on buffer halves, thus on every notify position
+	 * (buffer half consumed) update wp to allow stream progression.
+	 */
+	ret = catpt_ipc_set_write_pos(cdev, stream->info.stream_hw_id,
+				      frames_to_bytes(r, newpos),
+				      false, false);
+	if (ret) {
+		dev_err(cdev->dev, "update position for stream %d failed: %d\n",
+			stream->info.stream_hw_id, ret);
+		return;
+	}
+exit:
+	snd_pcm_period_elapsed(substream);
+}
+
+#define CATPT_BUFFER_MAX_SIZE	76800 /* 200ms native format */
+#define CATPT_PCM_PERIODS_MAX	4
+#define CATPT_PCM_PERIODS_MIN	2
+
+static const struct snd_pcm_hardware catpt_pcm_hardware = {
+	.info			= SNDRV_PCM_INFO_MMAP |
+				  SNDRV_PCM_INFO_MMAP_VALID |
+				  SNDRV_PCM_INFO_INTERLEAVED |
+				  SNDRV_PCM_INFO_PAUSE |
+				  SNDRV_PCM_INFO_RESUME |
+				  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+	.formats		= SNDRV_PCM_FMTBIT_S16_LE |
+				  SNDRV_PCM_FMTBIT_S24_LE |
+				  SNDRV_PCM_FMTBIT_S32_LE,
+	.period_bytes_min	= PAGE_SIZE,
+	.period_bytes_max	= CATPT_BUFFER_MAX_SIZE / CATPT_PCM_PERIODS_MIN,
+	.periods_min		= CATPT_PCM_PERIODS_MIN,
+	.periods_max		= CATPT_PCM_PERIODS_MAX,
+	.buffer_bytes_max	= CATPT_BUFFER_MAX_SIZE,
+};
+
+static int catpt_component_pcm_construct(struct snd_soc_component *component,
+					 struct snd_soc_pcm_runtime *rtd)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
+
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV_SG,
+				       cdev->dev,
+				       catpt_pcm_hardware.buffer_bytes_max,
+				       catpt_pcm_hardware.buffer_bytes_max);
+
+	return 0;
+}
+
+static int catpt_component_open(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtm = substream->private_data;
+
+	if (rtm->dai_link->no_pcm)
+		return 0;
+	snd_soc_set_runtime_hwparams(substream, &catpt_pcm_hardware);
+	return 0;
+}
+
+static snd_pcm_uframes_t
+catpt_component_pointer(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
+{
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
+	struct catpt_stream_runtime *stream;
+	struct snd_soc_pcm_runtime *rtm = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtm, 0);
+	u32 pos;
+
+	if (rtm->dai_link->no_pcm)
+		return 0;
+
+	stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
+	pos = catpt_stream_read_position(cdev, stream);
+
+	return bytes_to_frames(substream->runtime, pos);
+}
+
+static const struct snd_soc_dai_ops catpt_fe_dai_ops = {
+	.startup = catpt_dai_startup,
+	.shutdown = catpt_dai_shutdown,
+	.hw_params = catpt_dai_hw_params,
+	.hw_free = catpt_dai_hw_free,
+	.prepare = catpt_dai_prepare,
+	.trigger = catpt_dai_trigger,
+};
+
+static int catpt_dai_pcm_new(struct snd_soc_pcm_runtime *rtd,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
+	struct catpt_ssp_device_format devfmt;
+	int ret;
+
+	devfmt.iface = dai->driver->id;
+	devfmt.channels = codec_dai->driver->capture.channels_max;
+
+	switch (devfmt.iface) {
+	case CATPT_SSP_IFACE_0:
+		devfmt.mclk = CATPT_MCLK_FREQ_24_MHZ;
+
+		switch (devfmt.channels) {
+		case 4:
+			devfmt.mode = CATPT_SSP_MODE_TDM_PROVIDER;
+			devfmt.clock_divider = 4;
+			break;
+		case 2:
+		default:
+			devfmt.mode = CATPT_SSP_MODE_I2S_PROVIDER;
+			devfmt.clock_divider = 9;
+			break;
+		}
+		break;
+
+	case CATPT_SSP_IFACE_1:
+		devfmt.mclk = CATPT_MCLK_OFF;
+		devfmt.mode = CATPT_SSP_MODE_I2S_CONSUMER;
+		devfmt.clock_divider = 0;
+		break;
+	}
+
+	ret = catpt_ipc_set_device_format(cdev, &devfmt);
+	if (ret)
+		return CATPT_IPC_ERROR(ret);
+
+	/* store device format set for given SSP */
+	memcpy(&cdev->devfmt[devfmt.iface], &devfmt, sizeof(devfmt));
+	return 0;
+}
+
+static struct snd_soc_dai_driver dai_drivers[] = {
+/* FE DAIs */
+{
+	.name  = "System Pin",
+	.id = CATPT_STRM_TYPE_SYSTEM,
+	.ops = &catpt_fe_dai_ops,
+	.playback = {
+		.stream_name = "System Playback",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+	},
+	.capture = {
+		.stream_name = "Analog Capture",
+		.channels_min = 2,
+		.channels_max = 4,
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+	},
+},
+{
+	.name  = "Offload0 Pin",
+	.id = CATPT_STRM_TYPE_RENDER,
+	.ops = &catpt_fe_dai_ops,
+	.playback = {
+		.stream_name = "Offload0 Playback",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_192000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+	},
+},
+{
+	.name  = "Offload1 Pin",
+	.id = CATPT_STRM_TYPE_RENDER,
+	.ops = &catpt_fe_dai_ops,
+	.playback = {
+		.stream_name = "Offload1 Playback",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_192000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+	},
+},
+{
+	.name  = "Loopback Pin",
+	.id = CATPT_STRM_TYPE_LOOPBACK,
+	.ops = &catpt_fe_dai_ops,
+	.capture = {
+		.stream_name = "Loopback Capture",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
+	},
+},
+{
+	.name  = "Bluetooth Pin",
+	.id = CATPT_STRM_TYPE_BLUETOOTH_RENDER,
+	.ops = &catpt_fe_dai_ops,
+	.playback = {
+		.stream_name = "Bluetooth Playback",
+		.channels_min = 1,
+		.channels_max = 1,
+		.rates = SNDRV_PCM_RATE_8000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.capture = {
+		.stream_name = "Bluetooth Capture",
+		.channels_min = 1,
+		.channels_max = 1,
+		.rates = SNDRV_PCM_RATE_8000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+},
+/* BE DAIs */
+{
+	.name = "ssp0-port",
+	.id = CATPT_SSP_IFACE_0,
+	.pcm_new = catpt_dai_pcm_new,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+},
+{
+	.name = "ssp1-port",
+	.id = CATPT_SSP_IFACE_1,
+	.pcm_new = catpt_dai_pcm_new,
+	.playback = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+	.capture = {
+		.channels_min = 1,
+		.channels_max = 8,
+	},
+},
+};
+
+#define DSP_VOLUME_MAX	0x7FFFFFFF /* 0db */
+
+static const u32 volume_map[] = {
+	DSP_VOLUME_MAX >> 30,
+	DSP_VOLUME_MAX >> 29,
+	DSP_VOLUME_MAX >> 28,
+	DSP_VOLUME_MAX >> 27,
+	DSP_VOLUME_MAX >> 26,
+	DSP_VOLUME_MAX >> 25,
+	DSP_VOLUME_MAX >> 24,
+	DSP_VOLUME_MAX >> 23,
+	DSP_VOLUME_MAX >> 22,
+	DSP_VOLUME_MAX >> 21,
+	DSP_VOLUME_MAX >> 20,
+	DSP_VOLUME_MAX >> 19,
+	DSP_VOLUME_MAX >> 18,
+	DSP_VOLUME_MAX >> 17,
+	DSP_VOLUME_MAX >> 16,
+	DSP_VOLUME_MAX >> 15,
+	DSP_VOLUME_MAX >> 14,
+	DSP_VOLUME_MAX >> 13,
+	DSP_VOLUME_MAX >> 12,
+	DSP_VOLUME_MAX >> 11,
+	DSP_VOLUME_MAX >> 10,
+	DSP_VOLUME_MAX >> 9,
+	DSP_VOLUME_MAX >> 8,
+	DSP_VOLUME_MAX >> 7,
+	DSP_VOLUME_MAX >> 6,
+	DSP_VOLUME_MAX >> 5,
+	DSP_VOLUME_MAX >> 4,
+	DSP_VOLUME_MAX >> 3,
+	DSP_VOLUME_MAX >> 2,
+	DSP_VOLUME_MAX >> 1,
+	DSP_VOLUME_MAX >> 0,
+};
+
+static u32 ctlvol_to_dspvol(u32 value)
+{
+	if (value >= ARRAY_SIZE(volume_map))
+		value = 0;
+	return volume_map[value];
+}
+
+static u32 dspvol_to_ctlvol(u32 volume)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(volume_map); i++)
+		if (volume_map[i] >= volume)
+			return i;
+	return i - 1;
+}
+
+static int catpt_set_dspvol(struct catpt_dev *cdev, u8 stream_id, long *ctlvol)
+{
+	bool all_equal = true;
+	u32 dspvol;
+	int ret, i;
+
+	for (i = 1; all_equal && i < CATPT_CHANNELS_MAX; i++)
+		all_equal = (ctlvol[i] == ctlvol[0]);
+
+	if (all_equal) {
+		dspvol = ctlvol_to_dspvol(ctlvol[0]);
+
+		ret = catpt_ipc_set_volume(cdev, stream_id,
+					   CATPT_ALL_CHANNELS_MASK, dspvol,
+					   0, CATPT_AUDIO_CURVE_NONE);
+	} else {
+		for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
+			dspvol = ctlvol_to_dspvol(ctlvol[i]);
+
+			ret = catpt_ipc_set_volume(cdev, stream_id,
+						   i, dspvol,
+						   0, CATPT_AUDIO_CURVE_NONE);
+			if (ret)
+				goto exit;
+		}
+	}
+exit:
+	if (ret)
+		return CATPT_IPC_ERROR(ret);
+	return 0;
+}
+
+static int catpt_volume_info(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = CATPT_CHANNELS_MAX;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = ARRAY_SIZE(volume_map) - 1;
+	return 0;
+}
+
+static int catpt_mixer_volume_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
+	u32 dspvol;
+	int i;
+
+	pm_runtime_get_sync(cdev->dev);
+
+	for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
+		dspvol = catpt_mixer_volume(cdev, &cdev->mixer, i);
+		ucontrol->value.integer.value[i] = dspvol_to_ctlvol(dspvol);
+	}
+
+	pm_runtime_mark_last_busy(cdev->dev);
+	pm_runtime_put_autosuspend(cdev->dev);
+
+	return 0;
+}
+
+static int catpt_mixer_volume_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
+	int ret;
+
+	pm_runtime_get_sync(cdev->dev);
+
+	ret = catpt_set_dspvol(cdev, cdev->mixer.mixer_hw_id,
+			       ucontrol->value.integer.value);
+
+	pm_runtime_mark_last_busy(cdev->dev);
+	pm_runtime_put_autosuspend(cdev->dev);
+
+	return ret;
+}
+
+static int catpt_stream_volume_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol,
+				   enum catpt_pin_id pin_id)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
+	struct catpt_stream_runtime *stream;
+	long *ctlvol = (long *)kcontrol->private_value;
+	u32 dspvol;
+	int i;
+
+	stream = catpt_stream_find(cdev, pin_id);
+	if (!stream) {
+		for (i = 0; i < CATPT_CHANNELS_MAX; i++)
+			ucontrol->value.integer.value[i] = ctlvol[i];
+		return 0;
+	}
+
+	pm_runtime_get_sync(cdev->dev);
+
+	for (i = 0; i < CATPT_CHANNELS_MAX; i++) {
+		dspvol = catpt_stream_volume(cdev, stream, i);
+		ucontrol->value.integer.value[i] = dspvol_to_ctlvol(dspvol);
+	}
+
+	pm_runtime_mark_last_busy(cdev->dev);
+	pm_runtime_put_autosuspend(cdev->dev);
+
+	return 0;
+}
+
+static int catpt_stream_volume_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol,
+				   enum catpt_pin_id pin_id)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
+	struct catpt_stream_runtime *stream;
+	long *ctlvol = (long *)kcontrol->private_value;
+	int ret, i;
+
+	stream = catpt_stream_find(cdev, pin_id);
+	if (!stream) {
+		for (i = 0; i < CATPT_CHANNELS_MAX; i++)
+			ctlvol[i] = ucontrol->value.integer.value[i];
+		return 0;
+	}
+
+	pm_runtime_get_sync(cdev->dev);
+
+	ret = catpt_set_dspvol(cdev, stream->info.stream_hw_id,
+			       ucontrol->value.integer.value);
+
+	pm_runtime_mark_last_busy(cdev->dev);
+	pm_runtime_put_autosuspend(cdev->dev);
+
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CATPT_CHANNELS_MAX; i++)
+		ctlvol[i] = ucontrol->value.integer.value[i];
+	return 0;
+}
+
+static int catpt_offload1_volume_get(struct snd_kcontrol *kctl,
+				     struct snd_ctl_elem_value *uctl)
+{
+	return catpt_stream_volume_get(kctl, uctl, CATPT_PIN_ID_OFFLOAD1);
+}
+
+static int catpt_offload1_volume_put(struct snd_kcontrol *kctl,
+				     struct snd_ctl_elem_value *uctl)
+{
+	return catpt_stream_volume_put(kctl, uctl, CATPT_PIN_ID_OFFLOAD1);
+}
+
+static int catpt_offload2_volume_get(struct snd_kcontrol *kctl,
+				     struct snd_ctl_elem_value *uctl)
+{
+	return catpt_stream_volume_get(kctl, uctl, CATPT_PIN_ID_OFFLOAD2);
+}
+
+static int catpt_offload2_volume_put(struct snd_kcontrol *kctl,
+				     struct snd_ctl_elem_value *uctl)
+{
+	return catpt_stream_volume_put(kctl, uctl, CATPT_PIN_ID_OFFLOAD2);
+}
+
+static int catpt_capture_volume_get(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *uctl)
+{
+	return catpt_stream_volume_get(kctl, uctl, CATPT_PIN_ID_CAPTURE1);
+}
+
+static int catpt_capture_volume_put(struct snd_kcontrol *kctl,
+				    struct snd_ctl_elem_value *uctl)
+{
+	return catpt_stream_volume_put(kctl, uctl, CATPT_PIN_ID_CAPTURE1);
+}
+
+static int catpt_loopback_switch_get(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] = *(bool *)kcontrol->private_value;
+	return 0;
+}
+
+static int catpt_loopback_switch_put(struct snd_kcontrol *kcontrol,
+				     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct catpt_dev *cdev = dev_get_drvdata(component->dev);
+	struct catpt_stream_runtime *stream;
+	bool mute;
+	int ret;
+
+	mute = (bool)ucontrol->value.integer.value[0];
+	stream = catpt_stream_find(cdev, CATPT_PIN_ID_REFERENCE);
+	if (!stream) {
+		*(bool *)kcontrol->private_value = mute;
+		return 0;
+	}
+
+	pm_runtime_get_sync(cdev->dev);
+
+	ret = catpt_ipc_mute_loopback(cdev, stream->info.stream_hw_id, mute);
+
+	pm_runtime_mark_last_busy(cdev->dev);
+	pm_runtime_put_autosuspend(cdev->dev);
+
+	if (ret)
+		return CATPT_IPC_ERROR(ret);
+
+	*(bool *)kcontrol->private_value = mute;
+	return 0;
+}
+
+static int catpt_waves_switch_get(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	return 0;
+}
+
+static int catpt_waves_switch_put(struct snd_kcontrol *kcontrol,
+				  struct snd_ctl_elem_value *ucontrol)
+{
+	return 0;
+}
+
+static int catpt_waves_param_get(struct snd_kcontrol *kcontrol,
+				 unsigned int __user *bytes,
+				 unsigned int size)
+{
+	return 0;
+}
+
+static int catpt_waves_param_put(struct snd_kcontrol *kcontrol,
+				 const unsigned int __user *bytes,
+				 unsigned int size)
+{
+	return 0;
+}
+
+static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(catpt_volume_tlv, -9000, 300, 1);
+
+#define CATPT_VOLUME_CTL(kname, sname) \
+{	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
+	.name = (kname), \
+	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
+		  SNDRV_CTL_ELEM_ACCESS_READWRITE, \
+	.info = catpt_volume_info, \
+	.get = catpt_##sname##_volume_get, \
+	.put = catpt_##sname##_volume_put, \
+	.tlv.p = catpt_volume_tlv, \
+	.private_value = (unsigned long) \
+		&(long[CATPT_CHANNELS_MAX]) {0} }
+
+static const struct snd_kcontrol_new component_kcontrols[] = {
+/* Master volume (mixer stream) */
+CATPT_VOLUME_CTL("Master Playback Volume", mixer),
+/* Individual volume controls for offload and capture */
+CATPT_VOLUME_CTL("Media0 Playback Volume", offload1),
+CATPT_VOLUME_CTL("Media1 Playback Volume", offload2),
+CATPT_VOLUME_CTL("Mic Capture Volume", capture),
+SOC_SINGLE_BOOL_EXT("Loopback Mute", (unsigned long)&(bool[1]) {0},
+		    catpt_loopback_switch_get, catpt_loopback_switch_put),
+/* Enable or disable WAVES module */
+SOC_SINGLE_BOOL_EXT("Waves Switch", 0,
+		    catpt_waves_switch_get, catpt_waves_switch_put),
+/* WAVES module parameter control */
+SND_SOC_BYTES_TLV("Waves Set Param", 128,
+		  catpt_waves_param_get, catpt_waves_param_put),
+};
+
+static const struct snd_soc_dapm_widget component_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("SSP0 CODEC IN", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SSP0 CODEC OUT", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SSP1 BT IN", NULL, 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SSP1 BT OUT", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_MIXER("Playback VMixer", SND_SOC_NOPM, 0, 0, NULL, 0),
+};
+
+static const struct snd_soc_dapm_route component_routes[] = {
+	{"Playback VMixer", NULL, "System Playback"},
+	{"Playback VMixer", NULL, "Offload0 Playback"},
+	{"Playback VMixer", NULL, "Offload1 Playback"},
+
+	{"SSP0 CODEC OUT", NULL, "Playback VMixer"},
+
+	{"Analog Capture", NULL, "SSP0 CODEC IN"},
+	{"Loopback Capture", NULL, "SSP0 CODEC IN"},
+
+	{"SSP1 BT OUT", NULL, "Bluetooth Playback"},
+	{"Bluetooth Capture", NULL, "SSP1 BT IN"},
+};
+
+static const struct snd_soc_component_driver catpt_comp_driver = {
+	.name = "catpt-platform",
+
+	.pcm_construct = catpt_component_pcm_construct,
+	.open = catpt_component_open,
+	.pointer = catpt_component_pointer,
+
+	.controls = component_kcontrols,
+	.num_controls = ARRAY_SIZE(component_kcontrols),
+	.dapm_widgets = component_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(component_widgets),
+	.dapm_routes = component_routes,
+	.num_dapm_routes = ARRAY_SIZE(component_routes),
+};
+
+int catpt_arm_stream_templates(struct catpt_dev *cdev)
+{
+	struct resource *res;
+	u32 scratch_size = 0;
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(catpt_topology); i++) {
+		struct catpt_stream_template *template;
+		struct catpt_module_entry *entry;
+		struct catpt_module_type *type;
+
+		template = catpt_topology[i];
+		template->persistent_size = 0;
+
+		for (j = 0; j < template->num_entries; j++) {
+			entry = &template->entries[j];
+			type = &cdev->modules[entry->module_id];
+
+			if (!type->loaded)
+				return -ENOENT;
+
+			entry->entry_point = type->entry_point;
+			template->persistent_size += type->persistent_size;
+			if (type->scratch_size > scratch_size)
+				scratch_size = type->scratch_size;
+		}
+	}
+
+	if (scratch_size) {
+		/* allocate single scratch area for all modules */
+		res = catpt_request_region(&cdev->dram, scratch_size);
+		if (!res)
+			return -EBUSY;
+		cdev->scratch = res;
+	}
+
+	return 0;
+}
+
+int catpt_register_plat_component(struct catpt_dev *cdev)
+{
+	struct snd_soc_component *component;
+	int ret;
+
+	component = devm_kzalloc(cdev->dev, sizeof(*component), GFP_KERNEL);
+	if (!component)
+		return -ENOMEM;
+
+	ret = snd_soc_component_initialize(component, &catpt_comp_driver,
+					   cdev->dev);
+	if (ret)
+		return ret;
+
+	component->name = catpt_comp_driver.name;
+	return snd_soc_add_component(component, dai_drivers,
+				     ARRAY_SIZE(dai_drivers));
+}
-- 
2.17.1

