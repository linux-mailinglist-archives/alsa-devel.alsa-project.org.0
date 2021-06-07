Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DD639E0AA
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 17:36:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA93916BE;
	Mon,  7 Jun 2021 17:35:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA93916BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623080204;
	bh=Oonz1gNgjeNljEpYXdECq2+NHetoGY8D8YfI9ZWxyPA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GRkwoE+D7MqkE+3DeaQPUzICljazBEIRyYNu/RabxdtpoRiqJTz1nnEgq9cebTBeb
	 e4v0hi39UW9Lhm///XupC9LkaizxxKQeCOLijGAGCqbn8x0qERFC0QANcx5MK7OdJ+
	 AHNP4rW9zcBCipS2cR9F30Q+xhdX3dwhktINBDMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19170F80536;
	Mon,  7 Jun 2021 17:31:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85EA2F8026C; Mon,  7 Jun 2021 17:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8049F802DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 17:29:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8049F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="eIGnegSL"
Received: by mail-wm1-x330.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso13008745wmi.3
 for <alsa-devel@alsa-project.org>; Mon, 07 Jun 2021 08:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Opo/mvSkN0UWKwtEk6aBScmL5qMrV9b6i00DPDbwBKA=;
 b=eIGnegSLvCXIeRnjv0BqetbIOX5l/qumVfKv2iqZTEVcd6+psf+32CZK1ejM/VcQTA
 xIheUhopOH2iSh8Kki9ODU5WckREHz2hWfwdFwxCOGCXFLPW4jBG2AuOILecUtwSWWRX
 5mTVzyKRgYPknCrPtsZHKDxM+ILQt39gv5XA+WOa9AUPdLTpiP/XFCe5ZcZSQASfKbu+
 U7lqj519J2MFRPXgy/DDsfAOHYdHSFnKh6wfOKS5GKBic3RSDUzTNhoYCw6kW+/rAJ7c
 e9fl37Zv+837mfQFdUFgkD93lmH2NUInCuy3xeBPkSDHauVWdSLc3JiYacBzSf6P5lsi
 fB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Opo/mvSkN0UWKwtEk6aBScmL5qMrV9b6i00DPDbwBKA=;
 b=MkCKWPrwQSPlXXELpo8jbdyfobKrXk4DUKjTmNtGIf+daB87q0i++yk6UMfyVMKRh6
 SgqH/SQCT9njvAlJteQhexTjewhnTBvkdArX5dbGthq31yeTrtmmxbSElHzMOvawbWSF
 +XOeG3GUoMMApmggaB/wb2pgQA9QIr7xeXCPpgogNgp1fmblWC8PoLIykdixrjV+klHG
 qqtJWU7zHQbUi8e6ERlkIDkNyJthSDrFutmVJqRkcTYaCSYYSzcGQGmGqjQRA6NP9OmE
 RyS8XrsHezlM+JAuU8MjAS9VN2g7Eg04orBeU3l1PJve/XqbP+9g/XjkPcdg/W/XVcj2
 bZ8g==
X-Gm-Message-State: AOAM531lNAm11yNFtbOG1Bn++NA0qQ9a0IP8zylAgAxhg8mqu6/7mCXN
 ORYkenM4XbynC9TKzENS3pzFAg==
X-Google-Smtp-Source: ABdhPJy7x70dWICtWPxXizyvuT2B96dVdwqjg02ofD06d35nhRk9xFEzpymt8B5DJtphgTa5ZdFXkQ==
X-Received: by 2002:a7b:c2f0:: with SMTP id e16mr16510212wmk.136.1623079749603; 
 Mon, 07 Jun 2021 08:29:09 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q3sm16370170wrr.43.2021.06.07.08.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 08:29:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org
Subject: [RFC PATCH 07/13] ASoC: qcom: audioreach: add topology support
Date: Mon,  7 Jun 2021 16:28:30 +0100
Message-Id: <20210607152836.17154-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
References: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 devicetree@vger.kernel.org, tiwai@suse.de, lgirdwood@gmail.com,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

Add ASoC topology support in audioreach

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h     | 200 ++++++
 sound/soc/qcom/Kconfig                 |   1 +
 sound/soc/qcom/audioreach/Makefile     |   2 +-
 sound/soc/qcom/audioreach/audioreach.h |   3 +
 sound/soc/qcom/audioreach/q6apm.c      |   4 +-
 sound/soc/qcom/audioreach/topology.c   | 848 +++++++++++++++++++++++++
 6 files changed, 1056 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/sound/snd_ar_tokens.h
 create mode 100644 sound/soc/qcom/audioreach/topology.c

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
new file mode 100644
index 000000000000..8ca4823b7448
--- /dev/null
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -0,0 +1,200 @@
+#ifndef __SND_AR_TOKENS_H__
+#define __SND_AR_TOKENS_H__
+
+#define APM_SUB_GRAPH_PERF_MODE_LOW_POWER	0x1
+#define APM_SUB_GRAPH_PERF_MODE_LOW_LATENCY	0x2
+
+#define APM_SUB_GRAPH_DIRECTION_TX		0x1
+#define APM_SUB_GRAPH_DIRECTION_RX		0x2
+
+/** Scenario ID Audio Playback */
+#define APM_SUB_GRAPH_SID_AUDIO_PLAYBACK          0x1
+/* Scenario ID Audio Record */
+#define APM_SUB_GRAPH_SID_AUDIO_RECORD            0x2
+/* Scenario ID Voice call. */
+#define APM_SUB_GRAPH_SID_VOICE_CALL              0x3
+
+/* container capability ID Pre/Post Processing (PP) */
+#define APM_CONTAINER_CAP_ID_PP                   0x1
+/* container capability ID Compression/Decompression (CD) */
+#define APM_CONTAINER_CAP_ID_CD                   0x2
+/* container capability ID End Point(EP) */
+#define APM_CONTAINER_CAP_ID_EP                   0x3
+/* container capability ID Offload (OLC) */
+#define APM_CONTAINER_CAP_ID_OLC                  0x4
+
+/* container graph position Stream */
+#define APM_CONT_GRAPH_POS_STREAM                 0x1
+/* container graph position Per Stream Per Device*/
+#define APM_CONT_GRAPH_POS_PER_STR_PER_DEV        0x2
+/* container graph position Stream-Device */
+#define APM_CONT_GRAPH_POS_STR_DEV                0x3
+/* container graph position Global Device */
+#define APM_CONT_GRAPH_POS_GLOBAL_DEV             0x4
+
+#define APM_PROC_DOMAIN_ID_MDSP			0x1
+#define APM_PROC_DOMAIN_ID_ADSP			0x2
+#define APM_PROC_DOMAIN_ID_SDSP			0x4
+#define APM_PROC_DOMAIN_ID_CDSP			0x5
+
+#define PCM_INTERLEAVED			1
+#define PCM_DEINTERLEAVED_PACKED	2
+#define PCM_DEINTERLEAVED_UNPACKED	3
+#define AR_I2S_WS_SRC_EXTERNAL	0
+#define AR_I2S_WS_SRC_INTERNAL	1
+
+/*
+ * Kcontrol IDs
+ */
+#define SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX   256
+
+/**
+ * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:		Sub Graph Instance Id
+ *
+ * %AR_TKN_U32_SUB_GRAPH_PERF_MODE:		Performance mode of subgraph
+ *						APM_SUB_GRAPH_PERF_MODE_LOW_POWER = 1,
+ *						APM_SUB_GRAPH_PERF_MODE_LOW_LATENCY = 2
+ *
+ * %AR_TKN_U32_SUB_GRAPH_DIRECTION:		Direction of subgraph
+ *						APM_SUB_GRAPH_DIRECTION_TX = 1,
+ *						APM_SUB_GRAPH_DIRECTION_RX = 2
+ *
+ * %AR_TKN_U32_SUB_GRAPH_SCENARIO_ID:		Scenario ID for subgraph
+ *						APM_SUB_GRAPH_SID_AUDIO_PLAYBACK = 1,
+ *						APM_SUB_GRAPH_SID_AUDIO_RECORD = 2,
+ *						APM_SUB_GRAPH_SID_VOICE_CALL = 3
+ *
+ * %AR_TKN_U32_CONAINER_INSTANCE_ID:		Container Instance ID
+ *
+ * %AR_TKN_U32_CONAINER_CAPABILITY_ID:		Container capability ID
+ *						APM_CONTAINER_CAP_ID_PP = 1,
+ *						APM_CONTAINER_CAP_ID_CD = 2,
+ *						APM_CONTAINER_CAP_ID_EP = 3,
+ *						APM_CONTAINER_CAP_ID_OLC = 4
+ *
+ * %AR_TKN_U32_CONAINER_STACK_SIZE:		Stack size in the container.
+ *
+ * %AR_TKN_U32_CONAINER_GRAPH_POS:		Graph Position
+ *						APM_CONT_GRAPH_POS_STREAM = 1,
+ *						APM_CONT_GRAPH_POS_PER_STR_PER_DEV = 2,
+ *						APM_CONT_GRAPH_POS_STR_DEV = 3,
+ *						APM_CONT_GRAPH_POS_GLOBAL_DEV = 4
+ *
+ * %AR_TKN_U32_CONAINER_PROC_DOMAIN:		Processor domain of container
+ *						APM_PROC_DOMAIN_ID_MDSP = 1,
+ *						APM_PROC_DOMAIN_ID_ADSP = 2,
+ *						APM_PROC_DOMAIN_ID_SDSP = 4,
+ *						APM_PROC_DOMAIN_ID_CDSP = 5
+ *
+ * %AR_TKN_U32_MODULE_ID:			Module ID
+ *
+ * %AR_TKN_U32_MODULE_INSTANCE_ID:		Module Instance ID.
+ *
+ * %AR_TKN_U32_MODULE_MAX_IP_PORTS:		Module maximum input ports
+ *
+ * %AR_TKN_U32_MODULE_MAX_OP_PORTS:		Module maximum output ports.
+ *
+ * %AR_TKN_U32_MODULE_IN_PORTS:			Number of in ports
+ *
+ * %AR_TKN_U32_MODULE_OUT_PORTS:		Number of out ports.
+ *
+ * %AR_TKN_U32_MODULE_SRC_OP_PORT_ID:		Source module output port ID
+ *
+ * %AR_TKN_U32_MODULE_DST_IN_PORT_ID:		Destination module input port ID
+ *
+ * %AR_TKN_U32_MODULE_HW_IF_IDX:		Interface index types for I2S/LPAIF
+ *
+ * %AR_TKN_U32_MODULE_HW_IF_TYPE:		Interface type
+ *						LPAIF = 0,
+ *						LPAIF_RXTX = 1,
+ *						LPAIF_WSA = 2,
+ *		    				LPAIF_VA = 3,
+ *		   				LPAIF_AXI = 4
+ *
+ * %AR_TKN_U32_MODULE_FMT_INTERLEAVE:		PCM Interleaving
+ *						PCM_INTERLEAVED = 1,
+ *						PCM_DEINTERLEAVED_PACKED = 2,
+ *						PCM_DEINTERLEAVED_UNPACKED = 3
+ *
+ * %AR_TKN_U32_MODULE_FMT_DATA:			data format
+ *						FIXED POINT = 1,
+ *						IEC60958 PACKETIZED = 3,
+ *						IEC60958 PACKETIZED NON LINEAR = 8,
+ *						COMPR OVER PCM PACKETIZED = 7,
+ *						IEC61937 PACKETIZED = 2,
+ *						GENERIC COMPRESSED = 5
+ *
+ * %AR_TKN_U32_MODULE_FMT_FREQ:			bit rate
+ *
+ * %AR_TKN_U32_MODULE_FMT_BIT_DEPTH:		bit depth
+ *
+ * %AR_TKN_U32_MODULE_SD_LINE_IDX:		I2S serial data line idx
+ *						I2S_SD0 = 1,
+ *						I2S_SD1 = 2,
+ *						I2S_SD2 = 3,
+ *						I2S_SD3 = 4,
+ *						I2S_QUAD01 = 5,
+ *						I2S_QUAD23 = 6,
+ *						I2S_6CHS = 7,
+ *						I2S_8CHS = 8
+ *
+ * %AR_TKN_U32_MODULE_WS_SRC:			Word Select Source
+ *						AR_I2S_WS_SRC_EXTERNAL = 0,
+ *						AR_I2S_WS_SRC_INTERNAL = 1,
+ *
+ * %AR_TKN_U32_MODULE_FRAME_SZ_FACTOR:		Frame size factor
+ *
+ * %AR_TKN_U32_MODULE_LOG_CODE:			Log Module Code
+ *
+ * %AR_TKN_U32_MODULE_LOG_TAP_POINT_ID:		logging tap point of this module
+ *
+ * %AR_TKN_U32_MODULE_LOG_MODE:			logging mode
+ *						LOG_WAIT = 0,
+ *						LOG_IMMEDIATELY = 1
+ *
+ * %AR_TKN_DAI_INDEX:				dai index
+ *
+ */
+enum AR_TKNS {
+	/* SUB GRAPH Tokens */
+	AR_TKN_U32_SUB_GRAPH_INSTANCE_ID = 1,
+	AR_TKN_U32_SUB_GRAPH_PERF_MODE,
+	AR_TKN_U32_SUB_GRAPH_DIRECTION,
+	AR_TKN_U32_SUB_GRAPH_SCENARIO_ID,
+
+	/* Container Tokens */
+	AR_TKN_U32_CONAINER_INSTANCE_ID,
+	AR_TKN_U32_CONAINER_CAPABILITY_ID,
+	AR_TKN_U32_CONAINER_STACK_SIZE,
+	AR_TKN_U32_CONAINER_GRAPH_POS,
+	AR_TKN_U32_CONAINER_PROC_DOMAIN,
+
+	/* Module Tokens */
+	AR_TKN_U32_MODULE_ID,
+	AR_TKN_U32_MODULE_INSTANCE_ID,
+	AR_TKN_U32_MODULE_MAX_IP_PORTS,
+	AR_TKN_U32_MODULE_MAX_OP_PORTS,
+	AR_TKN_U32_MODULE_IN_PORTS,
+	AR_TKN_U32_MODULE_OUT_PORTS,
+	AR_TKN_U32_MODULE_SRC_OP_PORT_ID,
+	AR_TKN_U32_MODULE_DST_IN_PORT_ID,
+
+	AR_TKN_U32_MODULE_HW_IF_IDX,
+	AR_TKN_U32_MODULE_HW_IF_TYPE,
+	AR_TKN_U32_MODULE_FMT_INTERLEAVE,
+	AR_TKN_U32_MODULE_FMT_DATA,
+	AR_TKN_U32_MODULE_FMT_FREQ,
+	AR_TKN_U32_MODULE_FMT_BIT_DEPTH,
+	AR_TKN_U32_MODULE_SD_LINE_IDX,
+	AR_TKN_U32_MODULE_WS_SRC,
+	AR_TKN_U32_MODULE_FRAME_SZ_FACTOR,
+	AR_TKN_U32_MODULE_LOG_CODE,
+	AR_TKN_U32_MODULE_LOG_TAP_POINT_ID,
+	AR_TKN_U32_MODULE_LOG_MODE,
+
+	/* DAI Tokens */
+	AR_TKN_DAI_INDEX,
+	AR_TKN_MAX = AR_TKN_DAI_INDEX,
+};
+
+#endif /* __SND_AR_TOKENS_H__ */
diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 3070eccb6064..c0e7f4cb328f 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -106,6 +106,7 @@ config SND_SOC_QDSP6
 config SND_SOC_QCOM_AUDIOREACH
 	tristate "SoC ALSA audio drives for Qualcomm AUDIOREACH"
 	depends on QCOM_GPR
+	select SND_SOC_TOPOLOGY
 	help
 	 Support for AudioReach in QDSP
 
diff --git a/sound/soc/qcom/audioreach/Makefile b/sound/soc/qcom/audioreach/Makefile
index d76afc51556b..65ea488e4cc8 100644
--- a/sound/soc/qcom/audioreach/Makefile
+++ b/sound/soc/qcom/audioreach/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-snd-ar-objs := audioreach.o q6apm.o
+snd-ar-objs := audioreach.o q6apm.o topology.o
 
 obj-$(CONFIG_SND_SOC_QCOM_AUDIOREACH) += snd-ar.o
 
diff --git a/sound/soc/qcom/audioreach/audioreach.h b/sound/soc/qcom/audioreach/audioreach.h
index 07423369cc84..069e2475f484 100644
--- a/sound/soc/qcom/audioreach/audioreach.h
+++ b/sound/soc/qcom/audioreach/audioreach.h
@@ -627,6 +627,9 @@ void *audioreach_alloc_pkt(int pkt_size, uint32_t opcode, uint32_t token,
 void *audioreach_alloc_graph_pkt(struct q6apm *apm,
 				 struct list_head *sg_list,
 				  int graph_id);
+/* Topology specific */
+int audioreach_tplg_init(struct snd_soc_component *component);
+
 /* Module specific */
 void audioreach_graph_free_buf(struct q6apm_graph *graph);
 int audioreach_map_memory_regions(struct q6apm_graph *graph,
diff --git a/sound/soc/qcom/audioreach/q6apm.c b/sound/soc/qcom/audioreach/q6apm.c
index 6a98c114ea7a..3e1c39161ae0 100644
--- a/sound/soc/qcom/audioreach/q6apm.c
+++ b/sound/soc/qcom/audioreach/q6apm.c
@@ -817,11 +817,13 @@ int q6apm_graph_flush(struct q6apm_graph *graph)
 
 static int q6apm_audio_probe(struct snd_soc_component *component)
 {
-	return 0;
+	return audioreach_tplg_init(component);
 }
 
 static void q6apm_audio_remove(struct snd_soc_component *component)
 {
+        /* remove topology */
+        snd_soc_tplg_component_remove(component);
 }
 
 #define APM_AUDIO_DRV_NAME "q6apm-audio"
diff --git a/sound/soc/qcom/audioreach/topology.c b/sound/soc/qcom/audioreach/topology.c
new file mode 100644
index 000000000000..8c233e012d05
--- /dev/null
+++ b/sound/soc/qcom/audioreach/topology.c
@@ -0,0 +1,848 @@
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/pcm.h>
+#include <sound/control.h>
+#include <sound/asound.h>
+#include <linux/firmware.h>
+#include <sound/soc-topology.h>
+#include <sound/soc-dpcm.h>
+#include <uapi/sound/snd_ar_tokens.h>
+#include <linux/kernel.h>
+#include <linux/wait.h>
+#include "q6apm.h"
+#include "audioreach.h"
+
+struct snd_ar_control {
+	u32 sgid; /* Sub Graph ID */
+	struct snd_soc_component *scomp;
+};
+
+static struct audioreach_graph_info *audioreach_tplg_alloc_graph_info(
+					struct q6apm *apm, uint32_t graph_id,
+					bool *found)
+{
+	struct audioreach_graph_info *info;
+
+	spin_lock(&apm->lock);
+	info = idr_find(&apm->graph_info_idr, graph_id);
+	spin_unlock(&apm->lock);
+
+	if (info) {
+		*found = true;
+		return info;
+	}
+
+	*found = false;
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+
+	INIT_LIST_HEAD(&info->sg_list);
+	spin_lock_init(&info->sg_list_lock);
+
+	spin_lock(&apm->lock);
+	idr_alloc(&apm->graph_info_idr, info, graph_id,
+		  graph_id + 1, GFP_ATOMIC);
+	spin_unlock(&apm->lock);
+
+	info->id = graph_id;
+
+	return info;
+}
+
+static void audioreach_tplg_add_sub_graph(struct audioreach_sub_graph *sg,
+					  struct audioreach_graph_info *info)
+{
+	list_add_tail(&sg->node, &info->sg_list);
+	info->num_sub_graphs++;
+}
+
+
+static struct audioreach_sub_graph *audioreach_tplg_alloc_sub_graph(
+						struct q6apm *apm,
+						uint32_t sub_graph_id,
+						bool *found)
+{
+	struct audioreach_sub_graph *sg = NULL;
+
+	/* Find if there is already a matching sub-graph */
+	spin_lock(&apm->lock);
+	sg = idr_find(&apm->sub_graphs_idr, sub_graph_id);
+	spin_unlock(&apm->lock);
+
+
+	if (sg) {
+		*found = true;
+		return sg;
+	}
+
+	*found = false;
+	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
+	if (!sg)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&sg->container_list);
+
+	spin_lock(&apm->lock);
+	idr_alloc(&apm->sub_graphs_idr, sg, sub_graph_id,
+		  sub_graph_id + 1, GFP_ATOMIC);
+	spin_unlock(&apm->lock);
+
+	return sg;
+}
+
+static struct audioreach_container *audioreach_tplg_alloc_container(struct q6apm *apm,
+						struct audioreach_sub_graph *sg,
+						uint32_t container_id,
+						bool *found)
+{
+	struct audioreach_container *cont = NULL;
+
+	spin_lock(&apm->lock);
+	cont = idr_find(&apm->containers_idr, container_id);
+	spin_unlock(&apm->lock);
+
+	if (cont) {
+		*found = true;
+		return cont;
+	}
+	*found = false;
+
+	cont = kzalloc(sizeof(*cont), GFP_KERNEL);
+	if (!cont)
+		return ERR_PTR(-ENOMEM);
+
+	INIT_LIST_HEAD(&cont->modules_list);
+
+	spin_lock(&apm->lock);
+	idr_alloc(&apm->containers_idr, cont, container_id,
+		  container_id + 1, GFP_ATOMIC);
+	spin_unlock(&apm->lock);
+
+	/* add to container list */
+	list_add_tail(&cont->node, &sg->container_list);
+	sg->num_containers++;
+
+	return cont;
+}
+
+static struct audioreach_module *audioreach_tplg_alloc_module(struct q6apm *apm,
+					struct audioreach_container *cont,
+					struct snd_soc_dapm_widget *w,
+					uint32_t module_id,
+					bool *found)
+{
+	struct audioreach_module *mod = NULL;
+
+	spin_lock(&apm->lock);
+	mod = idr_find(&apm->modules_idr, module_id);
+	spin_unlock(&apm->lock);
+
+	if (mod) {
+		*found = true;
+		return mod;
+	}
+	*found = false;
+	mod = kzalloc(sizeof(*mod), GFP_KERNEL);
+	if (!mod)
+		return ERR_PTR(-ENOMEM);
+
+	spin_lock(&apm->lock);
+	idr_alloc(&apm->modules_idr, mod, module_id,
+		  module_id + 1, GFP_ATOMIC);
+	spin_unlock(&apm->lock);
+
+	/* add to module list */
+	list_add_tail(&mod->node, &cont->modules_list);
+	mod->container = cont;
+	mod->widget = w;
+	cont->num_modules++;
+
+	return mod;
+}
+
+static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
+						struct snd_soc_tplg_vendor_array *sg_array)
+{
+	struct audioreach_graph_info *info = NULL;
+	struct snd_soc_tplg_vendor_value_elem *sg_elem = sg_array->value;
+	struct audioreach_sub_graph *sg;
+	int graph_id, sub_graph_id, tkn_count = 0;
+	bool found;
+
+	while (tkn_count <= (le32_to_cpu(sg_array->num_elems) - 1)) {
+		switch (le32_to_cpu(sg_elem->token)) {
+		case AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:
+			sub_graph_id = le32_to_cpu(sg_elem->value);
+			sg = audioreach_tplg_alloc_sub_graph(apm, sub_graph_id, &found);
+			if (IS_ERR(sg)) {
+				return sg;
+			} else if (found) {
+				/* Already parsed data for this sub-graph */
+				return sg;
+			}
+			dev_err(apm->dev, "%s: New subgraph id : 0x%08x\n", __func__,
+				sub_graph_id);
+			sg->sub_graph_id = sub_graph_id;
+			break;
+		case AR_TKN_DAI_INDEX:
+			/* Sub graph is associated with predefined graph */
+			graph_id = le32_to_cpu(sg_elem->value);
+			info = audioreach_tplg_alloc_graph_info(apm, graph_id, &found);
+			if (IS_ERR(info))
+				return ERR_CAST(info);
+			break;
+		case AR_TKN_U32_SUB_GRAPH_PERF_MODE:
+			sg->perf_mode = le32_to_cpu(sg_elem->value);
+			break;
+		case AR_TKN_U32_SUB_GRAPH_DIRECTION:
+			sg->direction = le32_to_cpu(sg_elem->value);
+			break;
+		case AR_TKN_U32_SUB_GRAPH_SCENARIO_ID:
+			sg->scenario_id = le32_to_cpu(sg_elem->value);
+			break;
+		default:
+			dev_err(apm->dev, "Not a valid token %d for graph\n",
+				sg_elem->token);
+		break;
+
+		}
+		tkn_count++;
+		sg_elem++;
+	}
+
+	/* Sub graph is associated with predefined graph */
+	if (info) {
+		dev_err(apm->dev, "%s: adding subgraph id : 0x%08x -> %d\n", __func__,
+		sub_graph_id, graph_id);
+
+		audioreach_tplg_add_sub_graph(sg, info);
+	}
+
+	return sg;
+}
+
+
+static struct audioreach_container *audioreach_parse_cont_tokens(struct q6apm *apm,
+						struct audioreach_sub_graph *sg,
+						struct snd_soc_tplg_vendor_array *cont_array)
+{
+	struct snd_soc_tplg_vendor_value_elem *cont_elem;
+	struct audioreach_container *cont;
+	int container_id, tkn_count = 0;
+	bool found = false;
+
+	cont_elem = cont_array->value;
+	while (tkn_count <= (le32_to_cpu(cont_array->num_elems) - 1)) {
+		switch (le32_to_cpu(cont_elem->token)) {
+		case AR_TKN_U32_CONAINER_INSTANCE_ID:
+			container_id = le32_to_cpu(cont_elem->value);
+			cont = audioreach_tplg_alloc_container(apm, sg, container_id, &found);
+			if (IS_ERR(cont))
+				return ERR_PTR(-ENOMEM);
+			else if (found) /* Already parsed container data */
+				return cont;
+
+			cont->container_id = container_id;
+			break;
+		case AR_TKN_U32_CONAINER_CAPABILITY_ID:
+			cont->capability_id = le32_to_cpu(cont_elem->value);
+			break;
+		case AR_TKN_U32_CONAINER_STACK_SIZE:
+			cont->stack_size = le32_to_cpu(cont_elem->value);
+			break;
+		case AR_TKN_U32_CONAINER_GRAPH_POS:
+			cont->graph_pos = le32_to_cpu(cont_elem->value);
+			break;
+		case AR_TKN_U32_CONAINER_PROC_DOMAIN:
+			cont->proc_domain = le32_to_cpu(cont_elem->value);
+			break;
+		default:
+			dev_err(apm->dev, "Not a valid token %d for graph\n",
+				cont_elem->token);
+		break;
+
+		}
+		tkn_count++;
+		cont_elem++;
+	}
+
+	return cont;
+}
+
+static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *apm,
+							struct audioreach_container *cont,
+							struct snd_soc_tplg_vendor_array *mod_array,
+							struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	struct audioreach_module *mod;
+	int module_iid, tkn_count = 0;
+	bool found;
+
+	mod_elem = mod_array->value;
+	module_iid = le32_to_cpu(mod_elem->value);
+
+	mod = audioreach_tplg_alloc_module(apm, cont, w, module_iid, &found);
+	if (IS_ERR(mod)) {
+		return ERR_PTR(-ENOMEM);
+	} else if (found) {
+		dev_err(apm->dev, "Duplicate Module Instance ID 0x%08x found\n", module_iid);
+		return ERR_PTR(-EINVAL);
+	}
+
+	while (tkn_count <= (le32_to_cpu(mod_array->num_elems) - 1)) {
+		switch (le32_to_cpu(mod_elem->token)) {
+		/* common module info */
+		case AR_TKN_U32_MODULE_ID:
+			mod->module_id = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_INSTANCE_ID:
+			mod->instance_id = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_MAX_IP_PORTS:
+			mod->max_ip_port = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_MAX_OP_PORTS:
+			mod->max_op_port = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_IN_PORTS:
+			mod->in_port = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_OUT_PORTS:
+			mod->out_port = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_SRC_OP_PORT_ID:
+			mod->src_mod_op_port_id = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_IN_PORT_ID:
+			mod->dst_mod_ip_port_id = le32_to_cpu(mod_elem->value);
+
+		default:
+			break;
+
+		}
+		tkn_count++;
+		mod_elem++;
+	}
+
+	return mod;
+}
+
+static int audioreach_widget_load_module_common(struct snd_soc_component *component,
+				      int index, struct snd_soc_dapm_widget *w,
+				      struct snd_soc_tplg_dapm_widget *tplg_w,
+				      size_t *sz)
+{
+	struct q6apm *apm = dev_get_drvdata(component->dev);
+	struct audioreach_sub_graph *sg;
+	struct audioreach_container *cont;
+	struct audioreach_module *mod;
+	struct snd_soc_dobj *dobj;
+	void *data = tplg_w->priv.data;
+	struct snd_soc_tplg_vendor_array *array = &tplg_w->priv.array[0];
+
+	sg = audioreach_parse_sg_tokens(apm, &tplg_w->priv.array[0]);
+	if (IS_ERR(sg))
+		return PTR_ERR(sg);
+
+	*sz = le32_to_cpu(array->size);
+	array = data + *sz;
+	cont = audioreach_parse_cont_tokens(apm, sg, array);
+	if (IS_ERR(cont))
+		return PTR_ERR(cont);
+
+	*sz = *sz + le32_to_cpu(array->size);
+	array = data + *sz;
+	mod = audioreach_parse_common_tokens(apm, cont, array, w);
+	if (IS_ERR(mod))
+		return PTR_ERR(mod);
+
+	dobj = &w->dobj;
+	dobj->private = mod;
+
+	return 0;
+}
+
+static int audioreach_widget_load_pcm(struct snd_soc_component *component,
+				      int index, struct snd_soc_dapm_widget *w,
+				      struct snd_soc_tplg_dapm_widget *tplg_w)
+{
+	size_t sz;
+
+	return audioreach_widget_load_module_common(component, index, w,
+						    tplg_w, &sz);
+}
+
+static int audioreach_widget_load_enc_dec_cnv(struct snd_soc_component *component,
+					  int index, struct snd_soc_dapm_widget *w,
+					  struct snd_soc_tplg_dapm_widget *tplg_w)
+{
+	struct	snd_soc_tplg_vendor_array *mod_array;
+	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	struct audioreach_module *mod;
+	struct snd_soc_dobj *dobj;
+	size_t sz;
+	int tkn_count = 0;
+	int ret;
+
+	ret = audioreach_widget_load_module_common(component, index, w, tplg_w,
+						   &sz);
+	if (ret)
+		return ret;
+
+	dobj = &w->dobj;
+	mod = dobj->private;
+	mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)tplg_w->priv.data + sz);
+	mod_elem = mod_array->value;
+
+	while (tkn_count <= (le32_to_cpu(mod_array->num_elems) - 1)) {
+		switch (le32_to_cpu(mod_elem->token)) {
+		case AR_TKN_U32_MODULE_FMT_INTERLEAVE:
+			mod->interleave_type = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_FMT_FREQ:
+			mod->rate = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_FMT_BIT_DEPTH:
+			mod->bit_depth = le32_to_cpu(mod_elem->value);
+			break;
+		default:
+			break;
+		}
+		tkn_count++;
+		mod_elem++;
+	}
+
+	return 0;
+}
+
+static int audioreach_widget_log_module_load(struct audioreach_module *mod,
+					     struct snd_soc_tplg_vendor_array *mod_array)
+{
+	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	int tkn_count = 0;
+
+	mod_elem = mod_array->value;
+
+	while (tkn_count <= (le32_to_cpu(mod_array->num_elems) - 1)) {
+		switch (le32_to_cpu(mod_elem->token)) {
+
+		case AR_TKN_U32_MODULE_LOG_CODE:
+			mod->log_code = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_LOG_TAP_POINT_ID:
+			mod->log_tap_point_id = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_LOG_MODE:
+			mod->mode = le32_to_cpu(mod_elem->value);
+			break;
+		default:
+			break;
+		}
+		tkn_count++;
+		mod_elem++;
+	}
+
+	return 0;
+}
+
+static int audioreach_widget_dma_module_load(struct audioreach_module *mod,
+					     struct snd_soc_tplg_vendor_array *mod_array)
+{
+	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	int tkn_count = 0;
+
+	mod_elem = mod_array->value;
+
+	while (tkn_count <= (le32_to_cpu(mod_array->num_elems) - 1)) {
+		switch (le32_to_cpu(mod_elem->token)) {
+		case AR_TKN_U32_MODULE_HW_IF_IDX:
+			mod->hw_interface_idx = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_FMT_DATA:
+			mod->data_format = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_HW_IF_TYPE:
+			mod->hw_interface_type = le32_to_cpu(mod_elem->value);
+			break;
+		default:
+			break;
+		}
+		tkn_count++;
+		mod_elem++;
+	}
+
+	return 0;
+}
+
+static int audioreach_widget_load_buffer(struct snd_soc_component *component,
+					 int index, struct snd_soc_dapm_widget *w,
+					 struct snd_soc_tplg_dapm_widget *tplg_w)
+{
+	struct snd_soc_tplg_vendor_array *mod_array;
+	struct audioreach_module *mod;
+	struct snd_soc_dobj *dobj;
+	size_t sz;
+	int ret;
+
+	ret = audioreach_widget_load_module_common(component, index, w, tplg_w,
+						   &sz);
+	if (ret)
+		return ret;
+
+	dobj = &w->dobj;
+	mod = dobj->private;
+
+	mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)tplg_w->priv.data + sz);
+
+	switch (mod->module_id) {
+	case MODULE_ID_CODEC_DMA_SINK:
+	case MODULE_ID_CODEC_DMA_SOURCE:
+		audioreach_widget_dma_module_load(mod, mod_array);
+		break;
+	case MODULE_ID_DATA_LOGGING:
+		audioreach_widget_log_module_load(mod, mod_array);
+		break;
+	}
+
+	return 0;
+}
+
+static int audioreach_widget_load_mixer(struct snd_soc_component *component,
+					int index, struct snd_soc_dapm_widget *w,
+					struct snd_soc_tplg_dapm_widget *tplg_w)
+{
+	struct snd_soc_tplg_vendor_value_elem *w_elem;
+	struct snd_soc_tplg_vendor_array *w_array;
+	struct snd_ar_control *scontrol;
+	struct snd_soc_dobj *dobj;
+	int tkn_count = 0;
+
+	dev_err(component->dev, "DEBUG:: %s \n", __func__);
+	w_array = &tplg_w->priv.array[0];
+
+	scontrol = kzalloc(sizeof(*scontrol), GFP_KERNEL);
+	if (!scontrol)
+		return -ENOMEM;
+
+	scontrol->scomp = component;
+	dobj = &w->dobj;
+	dobj->private = scontrol;
+
+	w_elem = w_array->value;
+	while (tkn_count <= (le32_to_cpu(w_array->num_elems) - 1)) {
+		switch (le32_to_cpu(w_elem->token)) {
+		case AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:
+			scontrol->sgid = le32_to_cpu(w_elem->value);
+			break;
+		default: /* ignore other tokens */
+			break;
+		}
+		tkn_count++;
+		w_elem++;
+	}
+
+	return 0;
+}
+
+static int audioreach_widget_ready(struct snd_soc_component *component,
+				   int index, struct snd_soc_dapm_widget *w,
+				   struct snd_soc_tplg_dapm_widget *tplg_w)
+{
+	switch (w->id) {
+	case snd_soc_dapm_aif_in:
+	case snd_soc_dapm_aif_out:
+		audioreach_widget_load_pcm(component, index, w, tplg_w);
+		break;
+	case snd_soc_dapm_decoder:
+	case snd_soc_dapm_encoder:
+	case snd_soc_dapm_src:
+		audioreach_widget_load_enc_dec_cnv(component, index, w, tplg_w);
+		break;
+	case snd_soc_dapm_buffer:
+		audioreach_widget_load_buffer(component, index, w, tplg_w);
+		break;
+	case snd_soc_dapm_mixer:
+		return audioreach_widget_load_mixer(component, index, w, tplg_w);
+	case snd_soc_dapm_dai_link:
+	case snd_soc_dapm_pga:
+	case snd_soc_dapm_scheduler:
+	case snd_soc_dapm_out_drv:
+	default:
+		dev_err(component->dev, "Widget type (0x%x) not yet supported\n",
+			w->id);
+		break;
+	}
+
+	return 0;
+}
+
+
+static int audioreach_widget_unload(struct snd_soc_component *scomp,
+				    struct snd_soc_dobj *dobj)
+{
+	struct q6apm *apm = dev_get_drvdata(scomp->dev);
+	struct audioreach_container *cont;
+	struct audioreach_module *mod;
+
+	mod = dobj->private;
+	cont = mod->container;
+	/* find a way to remove the container and sub-graph */
+
+	spin_lock(&apm->lock);
+	idr_remove(&apm->modules_idr, mod->module_id);
+	cont->num_modules--;
+
+	/* delete list */
+	list_del(&mod->node);
+	/* free memory */
+	kfree(mod);
+
+	if (list_empty(&cont->modules_list)) { /* remove container */
+		struct audioreach_sub_graph *sg = cont->sub_graph;
+
+		idr_remove(&apm->containers_idr, cont->container_id);
+		list_del(&cont->node);
+		sg->num_containers--;
+		kfree(cont);
+		if (list_empty(&sg->container_list)) { /* remove sg */
+			struct audioreach_graph_info *info = sg->info;
+
+			idr_remove(&apm->sub_graphs_idr, sg->sub_graph_id);
+			list_del(&sg->node);
+			info->num_sub_graphs--;
+			kfree(sg);
+			if (list_empty(&info->sg_list)) { /* remove graph info */
+				idr_remove(&apm->graph_info_idr, info->id);
+				kfree(info);
+			}
+		}
+	}
+
+	spin_unlock(&apm->lock);
+
+	return 0;
+}
+
+static struct audioreach_module *audioreach_find_widget(struct snd_soc_component *comp,
+							const char *name)
+{
+	struct q6apm *apm = dev_get_drvdata(comp->dev);
+        struct audioreach_module *module;
+        int id;
+
+        idr_for_each_entry(&apm->modules_idr, module, id) {
+		if (!strcmp(name, module->widget->name))
+			return module;
+	}
+
+	return NULL;
+}
+
+static int audioreach_route_load(struct snd_soc_component *scomp, int index,
+			  struct snd_soc_dapm_route *route)
+{
+	struct audioreach_module *src, *sink;
+
+	src = audioreach_find_widget(scomp, route->source);
+	sink = audioreach_find_widget(scomp, route->sink);
+
+	if (src && sink) {
+		src->dst_mod_inst_id = sink->instance_id;
+		sink->src_mod_inst_id = src->instance_id;
+	}
+
+	return 0;
+}
+
+static int audioreach_route_unload(struct snd_soc_component *scomp,
+			    struct snd_soc_dobj *dobj)
+{
+
+	return 0;
+}
+
+static void audioreach_tplg_complete(struct snd_soc_component *component)
+{
+	/* TBD */
+}
+
+/* DAI link - used for any driver specific init */
+static int audioreach_link_load(struct snd_soc_component *component, int index,
+				struct snd_soc_dai_link *link,
+				struct snd_soc_tplg_link_config *cfg)
+{
+	link->nonatomic = true;
+	link->dynamic = true;
+	link->platforms->name = NULL;
+	link->platforms->of_node = of_get_compatible_child(component->dev->of_node,
+				"qcom,q6apm-dais");
+	link->trigger[0] = SND_SOC_DPCM_TRIGGER_POST;
+	link->trigger[1] = SND_SOC_DPCM_TRIGGER_POST;
+
+	return 0;
+}
+
+static int audioreach_get_audio_mixer(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_ar_control *scontrol = mc->dobj.private;
+	struct snd_ar_control *dapm_scontrol = dw->dobj.private;
+	struct q6apm *data = dev_get_drvdata(c->dev);
+	bool connected;
+
+	connected = q6apm_is_sub_graphs_connected(data, scontrol->sgid,
+						  dapm_scontrol->sgid);
+	if (connected)
+		ucontrol->value.integer.value[0] = 1;
+	else
+		ucontrol->value.integer.value[0] = 0;
+
+	return 0;
+}
+
+static int audioreach_put_audio_mixer(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_ar_control *scontrol = mc->dobj.private;
+	struct snd_ar_control *dapm_scontrol = dw->dobj.private;
+	struct q6apm *data = dev_get_drvdata(c->dev);
+	struct snd_soc_dapm_update *update = NULL;
+
+	if (ucontrol->value.integer.value[0]) {
+		q6apm_connect_sub_graphs(data, scontrol->sgid,
+					 dapm_scontrol->sgid, true);
+		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 1, update);
+	} else {
+		q6apm_connect_sub_graphs(data, scontrol->sgid,
+					 dapm_scontrol->sgid, false);
+		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 0, update);
+	}
+	return 0;
+}
+
+static int audioreach_control_load_volume(struct snd_soc_component *scomp,
+					  struct snd_ar_control *scontrol,
+					  struct snd_kcontrol_new *kc,
+					  struct snd_soc_tplg_ctl_hdr *hdr)
+{
+	struct snd_soc_tplg_mixer_control *mc =	container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
+	struct snd_soc_tplg_vendor_array *c_array =(struct snd_soc_tplg_vendor_array *)mc->priv.data;
+	int tkn_count = 0;
+	struct snd_soc_tplg_vendor_value_elem *c_elem;
+
+	c_elem = c_array->value;
+
+	while (tkn_count <= (le32_to_cpu(c_array->num_elems) - 1)) {
+		switch (le32_to_cpu(c_elem->token)) {
+		case AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:
+			scontrol->sgid = le32_to_cpu(c_elem->value);
+			break;
+		default:
+			/* Ignore other tokens */
+		break;
+
+		}
+		c_elem++;
+		tkn_count++;
+	}
+
+	return 0;
+}
+
+static int audioreach_control_load(struct snd_soc_component *scomp, int index,
+				   struct snd_kcontrol_new *kc,
+				   struct snd_soc_tplg_ctl_hdr *hdr)
+{
+	struct snd_ar_control *scontrol;
+	struct snd_soc_dobj *dobj;
+	struct soc_mixer_control *sm;
+	int ret;
+
+	scontrol = kzalloc(sizeof(*scontrol), GFP_KERNEL);
+	if (!scontrol)
+		return -ENOMEM;
+
+	scontrol->scomp = scomp;
+
+	switch (le32_to_cpu(hdr->ops.info)) {
+	case SND_SOC_TPLG_CTL_VOLSW:
+		sm = (struct soc_mixer_control *)kc->private_value;
+		dobj = &sm->dobj;
+		ret = audioreach_control_load_volume(scomp, scontrol, kc, hdr);
+		break;
+	default:
+		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
+			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
+		kfree(scontrol);
+		break;
+	}
+
+	dobj->private = scontrol;
+	return ret;
+}
+
+static int audioreach_control_unload(struct snd_soc_component *scomp,
+				     struct snd_soc_dobj *dobj)
+{
+	struct snd_ar_control *scontrol = dobj->private;
+
+	kfree(scontrol);
+
+	return 0;
+}
+
+static const struct snd_soc_tplg_kcontrol_ops audioreach_io_ops[] = {
+	{SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX, audioreach_get_audio_mixer,
+		audioreach_put_audio_mixer, snd_soc_info_volsw},
+};
+
+static struct snd_soc_tplg_ops audioreach_tplg_ops  = {
+	.io_ops = audioreach_io_ops,
+	.io_ops_count = ARRAY_SIZE(audioreach_io_ops),
+
+	.control_load	= audioreach_control_load,
+	.control_unload	= audioreach_control_unload,
+
+	.widget_ready = audioreach_widget_ready,
+	.widget_unload = audioreach_widget_unload,
+
+	.complete = audioreach_tplg_complete,
+        .link_load = audioreach_link_load,
+
+	.dapm_route_load	= audioreach_route_load,
+	.dapm_route_unload	= audioreach_route_unload,
+};
+
+int audioreach_tplg_init(struct snd_soc_component *component)
+{
+	struct device *dev = component->dev;
+	const struct firmware *fw;
+	int ret;
+
+	ret = request_firmware(&fw, "audioreach.bin", dev);
+	if (ret < 0) {
+		dev_err(dev, "tplg fw audioreach.bin load failed with %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_tplg_component_load(component, &audioreach_tplg_ops, fw);
+	if (ret < 0) {
+		dev_err(dev, "tplg component load failed%d\n", ret);
+		release_firmware(fw);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(audioreach_tplg_init);
-- 
2.21.0

