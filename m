Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2140687EBB
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 14:33:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD441E9F;
	Thu,  2 Feb 2023 14:32:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD441E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675344781;
	bh=de1n4e+ISRsqR39BY8jXKFzYldOmkplyqpRfT1c2q/I=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WKR+4qRw7TTbS1KxaMijOQdB9qaLGoWDObVHUFJsApgNIWWJ5ZkGfCTKKo5N4/jsn
	 Bud3EiFvkmrF/A9M2kiE+3wPggUeQIvrYm7aFhWCqKtFvRGG4MLJMDDIReKUuJ1wb1
	 kTOYw64zIZ74KwDy8foQoY4Reg2FV2Rtcw9YkEBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 808ECF80580;
	Thu,  2 Feb 2023 14:30:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 333A9F8059F; Thu,  2 Feb 2023 14:30:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59EBDF80580
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 14:30:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59EBDF80580
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SVfDBFgD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675344618; x=1706880618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=de1n4e+ISRsqR39BY8jXKFzYldOmkplyqpRfT1c2q/I=;
 b=SVfDBFgD2BKKOzq49q/+g2LnbBW06PY6HfF+MoLpwDt5ShlAcWALh0+y
 0q1A+uOTzQycyk9fiHBjSTXFVcuy9mWQZaZY5GbNXODbvuJgsu4BmArLn
 +VRDGBvcewP99yxYInvlzh5S2Ho3I+CBqp8wdYKY5RET1M5XHFfvrNLJd
 Kpz0w7IpEnuXzr2l1iuFRnGgvYKf19GVHUuR3jqEEmLOa+0BS6NJRg6hN
 GIz1LrCGnafYQ9Ap/OuxNg08HdAZtlQMuVkWrl4wjMK69YqHJ9GOujAkR
 X2NJDFebFVcggfRBPe3meofyjKKJnBaQ12Yi5LdqtivrTPW/eByDHvhWB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308783360"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="308783360"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 05:30:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658727547"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="658727547"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.1.104])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 05:30:12 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Subject: [PATCH v3 9/9] ASoC: SOF: ipc4-pcm: add delay function support
Date: Thu,  2 Feb 2023 15:29:54 +0200
Message-Id: <20230202132954.26773-10-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202132954.26773-1-peter.ujfalusi@linux.intel.com>
References: <20230202132954.26773-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

The delay function is used to calculate the difference
between hw_ptr and dai dma position. I2S, DMIC and SDW will
use dai dma position in shared SRAM window to calculate the
delay. HDaudio will retrieve dai dma position from host mmio memory
space since it doesn't support LLP counter reported by firmware.

In two cases dai dma position is inaccurate for delay calculation
(1) dai pipeline is started before host pipeline
(2) multiple streams mixed into one. Each stream has the same dai
    dma position
Firmware calculates correct stream_start_offset for all cases including
above two. Driver subtracts stream_start_offset from dai dma position to
get accurate one.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 109 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index a457d4d479d8..68258767aace 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -10,6 +10,7 @@
 #include <sound/sof/ipc4/header.h>
 #include "sof-audio.h"
 #include "sof-priv.h"
+#include "ops.h"
 #include "ipc4-priv.h"
 #include "ipc4-topology.h"
 #include "ipc4-fw-reg.h"
@@ -556,6 +557,113 @@ static int sof_ipc4_pcm_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
+static int sof_ipc4_get_stream_start_offset(struct snd_sof_dev *sdev,
+					    struct snd_pcm_substream *substream,
+					    struct snd_sof_pcm_stream *stream,
+					    struct sof_ipc4_timestamp_info *time_info)
+{
+	struct sof_ipc4_copier *host_copier = time_info->host_copier;
+	struct sof_ipc4_copier *dai_copier = time_info->dai_copier;
+	struct sof_ipc4_pipeline_registers ppl_reg;
+	u64 stream_start_position;
+	u32 dai_sample_size;
+	u32 ch, node_index;
+	u32 offset;
+
+	if (!host_copier || !dai_copier)
+		return -EINVAL;
+
+	if (host_copier->data.gtw_cfg.node_id == SOF_IPC4_INVALID_NODE_ID)
+		return -EINVAL;
+
+	node_index = SOF_IPC4_NODE_INDEX(host_copier->data.gtw_cfg.node_id);
+	offset = offsetof(struct sof_ipc4_fw_registers, pipeline_regs) + node_index * sizeof(ppl_reg);
+	sof_mailbox_read(sdev, sdev->fw_info_box.offset + offset, &ppl_reg, sizeof(ppl_reg));
+	if (ppl_reg.stream_start_offset == SOF_IPC4_INVALID_STREAM_POSITION)
+		return -EINVAL;
+
+	stream_start_position = ppl_reg.stream_start_offset;
+	ch = dai_copier->data.out_format.fmt_cfg;
+	ch = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(ch);
+	dai_sample_size = (dai_copier->data.out_format.bit_depth >> 3) * ch;
+	/* convert offset to sample count */
+	do_div(stream_start_position, dai_sample_size);
+	time_info->stream_start_offset = stream_start_position;
+
+	return 0;
+}
+
+static snd_pcm_sframes_t sof_ipc4_pcm_delay(struct snd_soc_component *component,
+					    struct snd_pcm_substream *substream)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct sof_ipc4_timestamp_info *time_info;
+	struct sof_ipc4_llp_reading_slot llp;
+	snd_pcm_uframes_t head_ptr, tail_ptr;
+	struct snd_sof_pcm_stream *stream;
+	struct snd_sof_pcm *spcm;
+	u64 tmp_ptr;
+	int ret;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return 0;
+
+	stream = &spcm->stream[substream->stream];
+	time_info = stream->private;
+	if (!time_info)
+		return 0;
+
+	/*
+	 * stream_start_offset is updated to memory window by FW based on
+	 * pipeline statistics and it may be invalid if host query happens before
+	 * the statistics is complete. And it will not change after the first initiailization.
+	 */
+	if (time_info->stream_start_offset == SOF_IPC4_INVALID_STREAM_POSITION) {
+		ret = sof_ipc4_get_stream_start_offset(sdev, substream, stream, time_info);
+		if (ret < 0)
+			return 0;
+	}
+
+	/*
+	 * HDaudio links don't support the LLP counter reported by firmware
+	 * the link position is read directly from hardware registers.
+	 */
+	if (!time_info->llp_offset) {
+		tmp_ptr = snd_sof_pcm_get_stream_position(sdev, component, substream);
+		if (!tmp_ptr)
+			return 0;
+	} else {
+		sof_mailbox_read(sdev, time_info->llp_offset, &llp, sizeof(llp));
+		tmp_ptr = ((u64)llp.reading.llp_u << 32) | llp.reading.llp_l;
+	}
+
+	/* In two cases dai dma position is not accurate
+	 * (1) dai pipeline is started before host pipeline
+	 * (2) multiple streams mixed into one. Each stream has the same dai dma position
+	 *
+	 * Firmware calculates correct stream_start_offset for all cases including above two.
+	 * Driver subtracts stream_start_offset from dai dma position to get accurate one
+	 */
+	tmp_ptr -= time_info->stream_start_offset;
+
+	/* Calculate the delay taking into account that both pointer can wrap */
+	div64_u64_rem(tmp_ptr, substream->runtime->boundary, &tmp_ptr);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		head_ptr = substream->runtime->status->hw_ptr;
+		tail_ptr = tmp_ptr;
+	} else {
+		head_ptr = tmp_ptr;
+		tail_ptr = substream->runtime->status->hw_ptr;
+	}
+
+	if (head_ptr < tail_ptr)
+		return substream->runtime->boundary - tail_ptr + head_ptr;
+
+	return head_ptr - tail_ptr;
+}
+
 const struct sof_ipc_pcm_ops ipc4_pcm_ops = {
 	.hw_params = sof_ipc4_pcm_hw_params,
 	.trigger = sof_ipc4_pcm_trigger,
@@ -563,4 +671,5 @@ const struct sof_ipc_pcm_ops ipc4_pcm_ops = {
 	.dai_link_fixup = sof_ipc4_pcm_dai_link_fixup,
 	.pcm_setup = sof_ipc4_pcm_setup,
 	.pcm_free = sof_ipc4_pcm_free,
+	.delay = sof_ipc4_pcm_delay
 };
-- 
2.39.1

