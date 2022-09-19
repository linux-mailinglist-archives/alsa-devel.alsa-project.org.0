Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5055BCBBE
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:24:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E5061663;
	Mon, 19 Sep 2022 14:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E5061663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663590258;
	bh=J18gOT/rUkAvhriDbvlXUb847z57xLEdx2dntwHeseU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IrDmeSpnFjDKTq8noZp8SsIdnOBhTnF8uO+fe5yiqluAKw1OJjsJ59knF4WL0j2l4
	 vEP2dqYBuK8jzEVQbUP2WEX8lfOYX90eVokOvj9d5dL5e4cpyG4SDeVGirHIErH4PX
	 R8NJn6U7b4+z4V+pcrhHp9ofxkww3yfZtXLtjWtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93794F8055A;
	Mon, 19 Sep 2022 14:22:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C23EF8016D; Mon, 19 Sep 2022 14:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FC0BF80548
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC0BF80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aSUCJAUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663590125; x=1695126125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J18gOT/rUkAvhriDbvlXUb847z57xLEdx2dntwHeseU=;
 b=aSUCJAUGsSLTD6PEMJGSIB0ZrUd8a5Zt1BkAAWH5GuQVY4GFWvZ/B9w5
 GWT44+zgY4XbTAUerOa5uL5tFjg78v+YGG9agVTGPNL1U/gerEB1RDq4x
 qst/da0G5lHeN0cCotYeF0ECLMi+/G1ZvDwi6zTuT0rZU03NhYHIP5qhZ
 Yhs5SeCJ3Yt20EUAp7n+NEBD9y2XIhB3WzgkNSmvVTre/nG77n4gheCtv
 eBatKPKYXzlmaY556Df6EyygLPsaHr7OLD3q8Exrz7KT+vYxljF8pSh6D
 r9kvhIbFTb/FX0J3hdwpCKbeomlKNh8mSi8KFiSPO4lfMwDrMHELFuDoB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="325676004"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="325676004"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:22:04 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="620837725"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:22:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ASoC: SOF: replace dev_vdbg with tracepoints
Date: Mon, 19 Sep 2022 14:21:07 +0200
Message-Id: <20220919122108.43764-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919122108.43764-1-pierre-louis.bossart@linux.intel.com>
References: <20220919122108.43764-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Noah Klayman <noah.klayman@intel.com>,
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

From: Noah Klayman <noah.klayman@intel.com>

This patch removes unneeded dev_vdbg calls and replaces remaining ones
with tracepoints to reduce overhead and enable use of trace collection
and analysis tools.

Signed-off-by: Noah Klayman <noah.klayman@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/trace/events/sof.h | 60 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc3.c       | 12 ++++----
 sound/soc/sof/pcm.c        |  5 ++--
 3 files changed, 68 insertions(+), 9 deletions(-)

diff --git a/include/trace/events/sof.h b/include/trace/events/sof.h
index f25eef6c95c09..03751323aaa84 100644
--- a/include/trace/events/sof.h
+++ b/include/trace/events/sof.h
@@ -11,6 +11,7 @@
 #if !defined(_TRACE_SOF_H) || defined(TRACE_HEADER_MULTI_READ)
 #define _TRACE_SOF_H
 #include <linux/tracepoint.h>
+#include <linux/types.h>
 #include <sound/sof/stream.h>
 #include "../../../sound/soc/sof/sof-audio.h"
 
@@ -38,6 +39,65 @@ DEFINE_EVENT(sof_widget_template, sof_widget_free,
 	TP_ARGS(swidget)
 );
 
+TRACE_EVENT(sof_ipc3_period_elapsed_position,
+	TP_PROTO(struct snd_sof_dev *sdev, struct sof_ipc_stream_posn *posn),
+	TP_ARGS(sdev, posn),
+	TP_STRUCT__entry(
+		__string(device_name, dev_name(sdev->dev))
+		__field(u64, host_posn)
+		__field(u64, dai_posn)
+		__field(u64, wallclock)
+	),
+	TP_fast_assign(
+		__assign_str(device_name, dev_name(sdev->dev));
+		__entry->host_posn = posn->host_posn;
+		__entry->dai_posn = posn->dai_posn;
+		__entry->wallclock = posn->wallclock;
+	),
+	TP_printk("device_name=%s host_posn=%#llx dai_posn=%#llx wallclock=%#llx",
+		  __get_str(device_name), __entry->host_posn, __entry->dai_posn,
+		  __entry->wallclock)
+);
+
+TRACE_EVENT(sof_pcm_pointer_position,
+	TP_PROTO(struct snd_sof_dev *sdev,
+		struct snd_sof_pcm *spcm,
+		struct snd_pcm_substream *substream,
+		snd_pcm_uframes_t dma_posn,
+		snd_pcm_uframes_t dai_posn
+	),
+	TP_ARGS(sdev, spcm, substream, dma_posn, dai_posn),
+	TP_STRUCT__entry(
+		__string(device_name, dev_name(sdev->dev))
+		__field(u32, pcm_id)
+		__field(int, stream)
+		__field(unsigned long, dma_posn)
+		__field(unsigned long, dai_posn)
+	),
+	TP_fast_assign(
+		__assign_str(device_name, dev_name(sdev->dev));
+		__entry->pcm_id = le32_to_cpu(spcm->pcm.pcm_id);
+		__entry->stream = substream->stream;
+		__entry->dma_posn = dma_posn;
+		__entry->dai_posn = dai_posn;
+	),
+	TP_printk("device_name=%s pcm_id=%d stream=%d dma_posn=%lu dai_posn=%lu",
+		  __get_str(device_name), __entry->pcm_id, __entry->stream,
+		  __entry->dma_posn, __entry->dai_posn)
+);
+
+TRACE_EVENT(sof_stream_position_ipc_rx,
+	TP_PROTO(struct device *dev),
+	TP_ARGS(dev),
+	TP_STRUCT__entry(
+		__string(device_name, dev_name(dev))
+	),
+	TP_fast_assign(
+		__assign_str(device_name, dev_name(dev));
+	),
+	TP_printk("device_name=%s", __get_str(device_name))
+);
+
 #endif /* _TRACE_SOF_H */
 
 /* This part must be outside protection */
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 82fa320253bef..b28af3a48b707 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -9,6 +9,7 @@
 
 #include <sound/sof/stream.h>
 #include <sound/sof/control.h>
+#include <trace/events/sof.h>
 #include "sof-priv.h"
 #include "sof-audio.h"
 #include "ipc3-priv.h"
@@ -23,7 +24,7 @@ static void ipc3_log_header(struct device *dev, u8 *text, u32 cmd)
 	u8 *str2 = NULL;
 	u32 glb;
 	u32 type;
-	bool vdbg = false;
+	bool is_sof_ipc_stream_position = false;
 
 	glb = cmd & SOF_GLB_TYPE_MASK;
 	type = cmd & SOF_CMD_TYPE_MASK;
@@ -118,7 +119,7 @@ static void ipc3_log_header(struct device *dev, u8 *text, u32 cmd)
 		case SOF_IPC_STREAM_TRIG_XRUN:
 			str2 = "TRIG_XRUN"; break;
 		case SOF_IPC_STREAM_POSITION:
-			vdbg = true;
+			is_sof_ipc_stream_position = true;
 			str2 = "POSITION"; break;
 		case SOF_IPC_STREAM_VORBIS_PARAMS:
 			str2 = "VORBIS_PARAMS"; break;
@@ -206,8 +207,8 @@ static void ipc3_log_header(struct device *dev, u8 *text, u32 cmd)
 	}
 
 	if (str2) {
-		if (vdbg)
-			dev_vdbg(dev, "%s: 0x%x: %s: %s\n", text, cmd, str, str2);
+		if (is_sof_ipc_stream_position)
+			trace_sof_stream_position_ipc_rx(dev);
 		else
 			dev_dbg(dev, "%s: 0x%x: %s: %s\n", text, cmd, str, str2);
 	} else {
@@ -852,8 +853,7 @@ static void ipc3_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
 		return;
 	}
 
-	dev_vdbg(sdev->dev, "posn : host 0x%llx dai 0x%llx wall 0x%llx\n",
-		 posn.host_posn, posn.dai_posn, posn.wallclock);
+	trace_sof_ipc3_period_elapsed_position(sdev, &posn);
 
 	memcpy(&stream->posn, &posn, sizeof(posn));
 
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 49f7cb049f62d..14571b821ecac 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -13,6 +13,7 @@
 #include <linux/pm_runtime.h>
 #include <sound/pcm_params.h>
 #include <sound/sof.h>
+#include <trace/events/sof.h>
 #include "sof-of-dev.h"
 #include "sof-priv.h"
 #include "sof-audio.h"
@@ -384,9 +385,7 @@ static snd_pcm_uframes_t sof_pcm_pointer(struct snd_soc_component *component,
 	dai = bytes_to_frames(substream->runtime,
 			      spcm->stream[substream->stream].posn.dai_posn);
 
-	dev_vdbg(component->dev,
-		 "PCM: stream %d dir %d DMA position %lu DAI position %lu\n",
-		 spcm->pcm.pcm_id, substream->stream, host, dai);
+	trace_sof_pcm_pointer_position(sdev, spcm, substream, host, dai);
 
 	return host;
 }
-- 
2.34.1

