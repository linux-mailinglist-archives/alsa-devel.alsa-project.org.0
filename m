Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D9F5BCBBC
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:24:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6779E1655;
	Mon, 19 Sep 2022 14:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6779E1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663590250;
	bh=fFSB7/8OXG1CqtJHjOwER9yzOYo+4DaLQc5TPDAAjvY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AgI8ox3Ce+stOs1lm01f/EUDdJe30bipV6euu0El19gmKAruIctUEZr0RAlfzcGho
	 rXbdRhLq+hp4IQGuL8Mfz4Z4xSxP548eaMSlKTiiWxXT5nLxw1rcO2jjyZKjOp7F5w
	 dVtELskli124P5ndcku+EAq45Ba5z0Lex4qjCc5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A1BAF8053D;
	Mon, 19 Sep 2022 14:22:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F942F80553; Mon, 19 Sep 2022 14:22:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71F14F8053D
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71F14F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AudLZfoR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663590121; x=1695126121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fFSB7/8OXG1CqtJHjOwER9yzOYo+4DaLQc5TPDAAjvY=;
 b=AudLZfoRX0T6e8/p0qBe//h4Wk2/5PbKHAHtwtdF7zsLKmqXLvW3uTCH
 MawxziF4udhNmaDASevH8vTd9kpu0THSy2xX7g7se93KuOa04W1jsREKg
 YOSR7QVBNb6vgzGpMHvAPxueHf2oxSL7IH5l7lUHKpIPiYmUlZNT9BTLF
 8LGZRA2fmH1Y5E4SHFfsrU6ihT+2yahO36Eyibn0j5z3C6iIzoDdSBoVg
 qY+iXEFozTzMTbCsjjXJm97NFEOr4iR1OhqKqmX1Qh8LWtEPsl7wmrXKu
 zWyp4QpRQRichI8kXwCLotNiJh6b+lGR7EAACrFdFcmVx06TmxvDCcFby Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="325675983"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="325675983"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:22:00 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="620837700"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:21:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ASoC: SOF: Intel: replace dev_vdbg with tracepoints
Date: Mon, 19 Sep 2022 14:21:06 +0200
Message-Id: <20220919122108.43764-6-pierre-louis.bossart@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

This patch replaces all dev_vdbg calls with tracepoints to reduce
overhead and enable use of trace collection and analysis tools.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Noah Klayman <noah.klayman@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/trace/events/sof_intel.h | 114 +++++++++++++++++++++++++++++++
 sound/soc/sof/intel/cnl.c        |   9 +--
 sound/soc/sof/intel/hda-dsp.c    |   4 +-
 sound/soc/sof/intel/hda-ipc.c    |  11 ++-
 sound/soc/sof/intel/hda-pcm.c    |   4 +-
 sound/soc/sof/intel/hda-stream.c |   6 +-
 sound/soc/sof/intel/mtl.c        |   3 +-
 7 files changed, 130 insertions(+), 21 deletions(-)

diff --git a/include/trace/events/sof_intel.h b/include/trace/events/sof_intel.h
index 37a9b92d494ef..2a77f9d26c0bf 100644
--- a/include/trace/events/sof_intel.h
+++ b/include/trace/events/sof_intel.h
@@ -11,6 +11,7 @@
 #if !defined(_TRACE_SOF_INTEL_H) || defined(TRACE_HEADER_MULTI_READ)
 #define _TRACE_SOF_INTEL_H
 #include <linux/tracepoint.h>
+#include <sound/hdaudio.h>
 #include "../../../sound/soc/sof/sof-audio.h"
 
 TRACE_EVENT(sof_intel_hda_irq,
@@ -28,6 +29,119 @@ TRACE_EVENT(sof_intel_hda_irq,
 		  __get_str(device_name), __get_str(source))
 );
 
+DECLARE_EVENT_CLASS(sof_intel_ipc_firmware_template,
+	TP_ARGS(struct snd_sof_dev *sdev, u32 msg, u32 msg_ext),
+	TP_PROTO(sdev, msg, msg_ext),
+	TP_STRUCT__entry(
+		__string(device_name, dev_name(sdev->dev))
+		__field(u32, msg)
+		__field(u32, msg_ext)
+	),
+	TP_fast_assign(
+		__assign_str(device_name, dev_name(sdev->dev));
+		__entry->msg = msg;
+		__entry->msg_ext = msg_ext;
+	),
+	TP_printk("device_name=%s msg=%#x msg_ext=%#x",
+		  __get_str(device_name), __entry->msg, __entry->msg_ext)
+);
+
+DEFINE_EVENT(sof_intel_ipc_firmware_template, sof_intel_ipc_firmware_response,
+	TP_PROTO(struct snd_sof_dev *sdev, u32 msg, u32 msg_ext),
+	TP_ARGS(sdev, msg, msg_ext)
+);
+
+DEFINE_EVENT(sof_intel_ipc_firmware_template, sof_intel_ipc_firmware_initiated,
+	TP_PROTO(struct snd_sof_dev *sdev, u32 msg, u32 msg_ext),
+	TP_ARGS(sdev, msg, msg_ext)
+);
+
+TRACE_EVENT(sof_intel_D0I3C_updated,
+	TP_PROTO(struct snd_sof_dev *sdev, u8 reg),
+	TP_ARGS(sdev, reg),
+	TP_STRUCT__entry(
+		__string(device_name, dev_name(sdev->dev))
+		__field(u8, reg)
+	),
+	TP_fast_assign(
+		__assign_str(device_name, dev_name(sdev->dev));
+		__entry->reg = reg;
+	),
+	TP_printk("device_name=%s register=%#x",
+		  __get_str(device_name), __entry->reg)
+);
+
+TRACE_EVENT(sof_intel_hda_irq_ipc_check,
+	TP_PROTO(struct snd_sof_dev *sdev, u32 irq_status),
+	TP_ARGS(sdev, irq_status),
+	TP_STRUCT__entry(
+		__string(device_name, dev_name(sdev->dev))
+		__field(u32, irq_status)
+	),
+	TP_fast_assign(
+		__assign_str(device_name, dev_name(sdev->dev));
+		__entry->irq_status = irq_status;
+	),
+	TP_printk("device_name=%s irq_status=%#x",
+		  __get_str(device_name), __entry->irq_status)
+);
+
+TRACE_EVENT(sof_intel_hda_dsp_pcm,
+	TP_PROTO(struct snd_sof_dev *sdev,
+		struct hdac_stream *hstream,
+		struct snd_pcm_substream *substream,
+		snd_pcm_uframes_t pos
+	),
+	TP_ARGS(sdev, hstream, substream, pos),
+	TP_STRUCT__entry(
+		__string(device_name, dev_name(sdev->dev))
+		__field(u32, hstream_index)
+		__field(u32, substream)
+		__field(unsigned long, pos)
+	),
+	TP_fast_assign(
+		__assign_str(device_name, dev_name(sdev->dev));
+		__entry->hstream_index = hstream->index;
+		__entry->substream = substream->stream;
+		__entry->pos = pos;
+	),
+	TP_printk("device_name=%s hstream_index=%d substream=%d pos=%lu",
+		  __get_str(device_name), __entry->hstream_index,
+		  __entry->substream, __entry->pos)
+);
+
+TRACE_EVENT(sof_intel_hda_dsp_stream_status,
+	TP_PROTO(struct device *dev, struct hdac_stream *s, u32 status),
+	TP_ARGS(dev, s, status),
+	TP_STRUCT__entry(
+		__string(device_name, dev_name(dev))
+		__field(u32, stream)
+		__field(u32, status)
+	),
+	TP_fast_assign(
+		__assign_str(device_name, dev_name(dev));
+		__entry->stream = s->index;
+		__entry->status = status;
+	),
+	TP_printk("device_name=%s stream=%d status=%#x",
+		  __get_str(device_name), __entry->stream, __entry->status)
+);
+
+TRACE_EVENT(sof_intel_hda_dsp_check_stream_irq,
+	TP_PROTO(struct snd_sof_dev *sdev, u32 status),
+	TP_ARGS(sdev, status),
+	TP_STRUCT__entry(
+		__string(device_name, dev_name(sdev->dev))
+		__field(u32, status)
+	),
+	TP_fast_assign(
+		__assign_str(device_name, dev_name(sdev->dev));
+		__entry->status = status;
+	),
+	TP_printk("device_name=%s status=%#x",
+		  __get_str(device_name), __entry->status)
+);
+
 #endif /* _TRACE_SOF_INTEL_H */
 
 /* This part must be outside protection */
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 0bb91df272805..180001d0a38ae 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -17,6 +17,7 @@
 
 #include <sound/sof/ext_manifest4.h>
 #include <sound/sof/ipc4/header.h>
+#include <trace/events/sof_intel.h>
 #include "../ipc4-priv.h"
 #include "../ops.h"
 #include "hda.h"
@@ -121,9 +122,7 @@ irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 		msg_ext = hipci & CNL_DSP_REG_HIPCIDR_MSG_MASK;
 		msg = hipcida & CNL_DSP_REG_HIPCIDA_MSG_MASK;
 
-		dev_vdbg(sdev->dev,
-			 "ipc: firmware response, msg:0x%x, msg_ext:0x%x\n",
-			 msg, msg_ext);
+		trace_sof_intel_ipc_firmware_response(sdev, msg, msg_ext);
 
 		/* mask Done interrupt */
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
@@ -153,9 +152,7 @@ irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 		msg = hipctdr & CNL_DSP_REG_HIPCTDR_MSG_MASK;
 		msg_ext = hipctdd & CNL_DSP_REG_HIPCTDD_MSG_MASK;
 
-		dev_vdbg(sdev->dev,
-			 "ipc: firmware initiated, msg:0x%x, msg_ext:0x%x\n",
-			 msg, msg_ext);
+		trace_sof_intel_ipc_firmware_initiated(sdev, msg, msg_ext);
 
 		/* handle messages from DSP */
 		if ((hipctdr & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 671c3e02d7df8..1319c8e34021b 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
+#include <trace/events/sof_intel.h>
 #include "../sof-audio.h"
 #include "../ops.h"
 #include "hda.h"
@@ -397,8 +398,7 @@ static int hda_dsp_update_d0i3c_register(struct snd_sof_dev *sdev, u8 value)
 		return ret;
 	}
 
-	dev_vdbg(bus->dev, "D0I3C updated, register = 0x%x\n",
-		 snd_hdac_chip_readb(bus, VS_D0I3C));
+	trace_sof_intel_D0I3C_updated(sdev, snd_hdac_chip_readb(bus, VS_D0I3C));
 
 	return 0;
 }
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 65e688f749eaf..c597ef491d383 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -16,6 +16,7 @@
  */
 
 #include <sound/sof/ipc4/header.h>
+#include <trace/events/sof_intel.h>
 #include "../ops.h"
 #include "hda.h"
 
@@ -212,9 +213,7 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 		msg = hipci & HDA_DSP_REG_HIPCI_MSG_MASK;
 		msg_ext = hipcie & HDA_DSP_REG_HIPCIE_MSG_MASK;
 
-		dev_vdbg(sdev->dev,
-			 "ipc: firmware response, msg:0x%x, msg_ext:0x%x\n",
-			 msg, msg_ext);
+		trace_sof_intel_ipc_firmware_response(sdev, msg, msg_ext);
 
 		/* mask Done interrupt */
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
@@ -255,9 +254,7 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 		msg = hipct & HDA_DSP_REG_HIPCT_MSG_MASK;
 		msg_ext = hipcte & HDA_DSP_REG_HIPCTE_MSG_MASK;
 
-		dev_vdbg(sdev->dev,
-			 "ipc: firmware initiated, msg:0x%x, msg_ext:0x%x\n",
-			 msg, msg_ext);
+		trace_sof_intel_ipc_firmware_initiated(sdev, msg, msg_ext);
 
 		/* mask BUSY interrupt */
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
@@ -312,7 +309,7 @@ bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
 
 	/* store status */
 	irq_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIS);
-	dev_vdbg(sdev->dev, "irq handler: irq_status:0x%x\n", irq_status);
+	trace_sof_intel_hda_irq_ipc_check(sdev, irq_status);
 
 	/* invalid message ? */
 	if (irq_status == 0xffffffff)
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 6888e0a4665d2..0a9c80216a8c2 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -18,6 +18,7 @@
 #include <linux/moduleparam.h>
 #include <sound/hda_register.h>
 #include <sound/pcm_params.h>
+#include <trace/events/sof_intel.h>
 #include "../sof-audio.h"
 #include "../ops.h"
 #include "hda.h"
@@ -196,8 +197,7 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 found:
 	pos = bytes_to_frames(substream->runtime, pos);
 
-	dev_vdbg(sdev->dev, "PCM: stream %d dir %d position %lu\n",
-		 hstream->index, substream->stream, pos);
+	trace_sof_intel_hda_dsp_pcm(sdev, hstream, substream, pos);
 	return pos;
 }
 
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 8344363beec09..be60e7785da94 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -19,6 +19,7 @@
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
 #include <sound/sof.h>
+#include <trace/events/sof_intel.h>
 #include "../ops.h"
 #include "../sof-audio.h"
 #include "hda.h"
@@ -697,7 +698,7 @@ bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 	spin_lock_irq(&bus->reg_lock);
 
 	status = snd_hdac_chip_readl(bus, INTSTS);
-	dev_vdbg(bus->dev, "stream irq, INTSTS status: 0x%x\n", status);
+	trace_sof_intel_hda_dsp_check_stream_irq(sdev, status);
 
 	/* if Register inaccessible, ignore it.*/
 	if (status != 0xffffffff)
@@ -736,8 +737,7 @@ static bool hda_dsp_stream_check(struct hdac_bus *bus, u32 status)
 		if (status & BIT(s->index) && s->opened) {
 			sd_status = snd_hdac_stream_readb(s, SD_STS);
 
-			dev_vdbg(bus->dev, "stream %d status 0x%x\n",
-				 s->index, sd_status);
+			trace_sof_intel_hda_dsp_stream_status(bus->dev, s, sd_status);
 
 			snd_hdac_stream_writeb(s, SD_STS, sd_status);
 
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index efc91feb83e9e..5408c34b04ef7 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -11,6 +11,7 @@
 
 #include <linux/firmware.h>
 #include <sound/sof/ipc4/header.h>
+#include <trace/events/sof_intel.h>
 #include "../ipc4-priv.h"
 #include "../ops.h"
 #include "hda.h"
@@ -63,7 +64,7 @@ static bool mtl_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
 	hfintipptr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, MTL_HFINTIPPTR) & MTL_HFINTIPPTR_PTR_MASK;
 	irq_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR, hfintipptr + MTL_DSP_IRQSTS);
 
-	dev_vdbg(sdev->dev, "irq handler: irq_status:0x%x\n", irq_status);
+	trace_sof_intel_hda_irq_ipc_check(sdev, irq_status);
 
 	if (irq_status != U32_MAX && (irq_status & MTL_DSP_IRQSTS_IPC))
 		return true;
-- 
2.34.1

