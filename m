Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2323E44F7
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 13:33:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64B21170F;
	Mon,  9 Aug 2021 13:33:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64B21170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628508835;
	bh=iW858D4VL6e2ntURaG9FIwcab19Z8iS4nlTjE5txegQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kG7PIQsGT5u+JYWGN8k6Vz2qlv+PBSQmzCv6y+XaQYW7Y7zDdUylFWexkCFLBTkdJ
	 0wAOH9F0UC2H7SmSVjLOeS11b8xjmSADo/ZG4+FIavNxUaYUdJjy2f9ehDehKdpXJA
	 LbtiLDRVGbuKEZI8O3p/h2R8mV+chvxOSvaJH3pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA862F805C6;
	Mon,  9 Aug 2021 13:25:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15953F80551; Mon,  9 Aug 2021 13:25:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02DB4F804EC
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 13:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02DB4F804EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TchZgbao"
Received: by mail-wr1-x435.google.com with SMTP id k29so8132407wrd.7
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 04:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W1prmEncURGCtPlVv8tGDS5bl/m+IDYi1QOyOLofCsI=;
 b=TchZgbaoPlIego3E4w66gY0Jl2/yNoaGKvdsAXyRD3BeV+I/38wdth2uXUwOs6WR7/
 OBY8fPDGQw8/FYktvMcZdyxm47Wy7rWFCbkz6aPldOC2w1SiTENxwytdzFe3veMl0AKy
 ndja393uWj7I41Q/jK7PCIy/BuE535Qeu3qtprDjnpW3bDySQzgdPrI+hcNTziIpGM2s
 5Ad3o9Y9FDOzD58SeffUNq72MOXhINjROJR/eaAq0j+039a8Dwyv5OIizNWLH4eT1wtG
 flm/dn5S2oNFAD49F5g4FDsclRBFXxN343y7lwbYLNVg4cBa+fxaGhmJfd+/ETcXfkdF
 J32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W1prmEncURGCtPlVv8tGDS5bl/m+IDYi1QOyOLofCsI=;
 b=BOdwV4C2u/lbuylr6+4M5M6Uyfe7hy5yFFXmhAjTSwIpNZR0mjjaU3CtXTFTb136pL
 EDg7vTO2/53xsifsPHx/vTK2/CjXbRlEOFgXyh7OLRYCRyrwsho/Qmv4BaziEyUsPQk1
 nK9flXo77LOFGKymruT5TVUBfmuTr7Sr8CkioZ5RsCwV5PR4WW/zgIPqCEEsqhr3+VZ3
 LwEVqJhCaz4tW3eORsNxlyoODEpmOL2GE7LyjRZ1lvUbE254Dd3TNymxW04p7z96MhK8
 mnt9rzRDd6sp6OCplwo77EX7UIAz9f1KqIJJonAZUETlY6bflF+G+Q73w6PoKQgtg0xV
 V5Vg==
X-Gm-Message-State: AOAM530qNZYjiNail47HrtI5mb9A5WzKcFAkTmDSDKvnhN+NsQ2FB5h4
 LjuQhOeBwSVBx+9jfiN2fn3uNQ==
X-Google-Smtp-Source: ABdhPJwbTLydnzGvA39Ws9QYU7RJMWTvBYayKBknZX1gj1vgQHR3p6r/+M3AHeyACgo+Hl1utWsdvA==
X-Received: by 2002:adf:df12:: with SMTP id y18mr24917105wrl.189.1628508288579; 
 Mon, 09 Aug 2021 04:24:48 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id b80sm7774900wmb.2.2021.08.09.04.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 04:24:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v4 16/20] ASoC: qdsp6: audioreach: add topology support
Date: Mon,  9 Aug 2021 12:23:35 +0100
Message-Id: <20210809112339.8368-17-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
References: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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
 include/uapi/sound/snd_ar_tokens.h |  203 +++++
 sound/soc/qcom/Kconfig             |    1 +
 sound/soc/qcom/qdsp6/Makefile      |    2 +-
 sound/soc/qcom/qdsp6/q6apm.c       |    4 +-
 sound/soc/qcom/qdsp6/topology.c    | 1118 ++++++++++++++++++++++++++++
 5 files changed, 1326 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/sound/snd_ar_tokens.h
 create mode 100644 sound/soc/qcom/qdsp6/topology.c

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
new file mode 100644
index 000000000000..1a2582af0251
--- /dev/null
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -0,0 +1,203 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
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
+#define SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX	256
+#define SND_SOC_AR_TPLG_VOL_CTL			257
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
+ * %AR_TKN_U32_CONTAINER_INSTANCE_ID:		Container Instance ID
+ *
+ * %AR_TKN_U32_CONTAINER_CAPABILITY_ID:		Container capability ID
+ *						APM_CONTAINER_CAP_ID_PP = 1,
+ *						APM_CONTAINER_CAP_ID_CD = 2,
+ *						APM_CONTAINER_CAP_ID_EP = 3,
+ *						APM_CONTAINER_CAP_ID_OLC = 4
+ *
+ * %AR_TKN_U32_CONTAINER_STACK_SIZE:		Stack size in the container.
+ *
+ * %AR_TKN_U32_CONTAINER_GRAPH_POS:		Graph Position
+ *						APM_CONT_GRAPH_POS_STREAM = 1,
+ *						APM_CONT_GRAPH_POS_PER_STR_PER_DEV = 2,
+ *						APM_CONT_GRAPH_POS_STR_DEV = 3,
+ *						APM_CONT_GRAPH_POS_GLOBAL_DEV = 4
+ *
+ * %AR_TKN_U32_CONTAINER_PROC_DOMAIN:		Processor domain of container
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
+ *						LPAIF_VA = 3,
+ *						LPAIF_AXI = 4
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
+
+/* DAI Tokens */
+#define AR_TKN_DAI_INDEX			1
+/* SUB GRAPH Tokens */
+#define AR_TKN_U32_SUB_GRAPH_INSTANCE_ID	2
+#define AR_TKN_U32_SUB_GRAPH_PERF_MODE		3
+#define AR_TKN_U32_SUB_GRAPH_DIRECTION		4
+#define AR_TKN_U32_SUB_GRAPH_SCENARIO_ID	5
+
+/* Container Tokens */
+#define AR_TKN_U32_CONTAINER_INSTANCE_ID		100
+#define AR_TKN_U32_CONTAINER_CAPABILITY_ID	101
+#define AR_TKN_U32_CONTAINER_STACK_SIZE		102
+#define AR_TKN_U32_CONTAINER_GRAPH_POS		103
+#define AR_TKN_U32_CONTAINER_PROC_DOMAIN		104
+
+/* Module Tokens */
+#define AR_TKN_U32_MODULE_ID			200
+#define AR_TKN_U32_MODULE_INSTANCE_ID		201
+#define AR_TKN_U32_MODULE_MAX_IP_PORTS		202
+#define AR_TKN_U32_MODULE_MAX_OP_PORTS		203
+#define AR_TKN_U32_MODULE_IN_PORTS		204
+#define AR_TKN_U32_MODULE_OUT_PORTS		205
+#define AR_TKN_U32_MODULE_SRC_OP_PORT_ID	206
+#define AR_TKN_U32_MODULE_DST_IN_PORT_ID	207
+#define AR_TKN_U32_MODULE_SRC_INSTANCE_ID	208
+#define AR_TKN_U32_MODULE_DST_INSTANCE_ID	209
+
+
+#define AR_TKN_U32_MODULE_HW_IF_IDX		250
+#define AR_TKN_U32_MODULE_HW_IF_TYPE		251
+#define AR_TKN_U32_MODULE_FMT_INTERLEAVE	252
+#define AR_TKN_U32_MODULE_FMT_DATA		253
+#define AR_TKN_U32_MODULE_FMT_FREQ		254
+#define AR_TKN_U32_MODULE_FMT_BIT_DEPTH		255
+#define AR_TKN_U32_MODULE_SD_LINE_IDX		256
+#define AR_TKN_U32_MODULE_WS_SRC		257
+#define AR_TKN_U32_MODULE_FRAME_SZ_FACTOR	258
+#define AR_TKN_U32_MODULE_LOG_CODE		259
+#define AR_TKN_U32_MODULE_LOG_TAP_POINT_ID	260
+#define AR_TKN_U32_MODULE_LOG_MODE		261
+
+#endif /* __SND_AR_TOKENS_H__ */
diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 5a693f83fd6c..66d8436ab0a8 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -100,6 +100,7 @@ config SND_SOC_QDSP6
 	select SND_SOC_QDSP6_ROUTING
 	select SND_SOC_QDSP6_ASM
 	select SND_SOC_QDSP6_ASM_DAI
+	select SND_SOC_TOPOLOGY
 	select SND_SOC_QDSP6_APM
 	help
 	 To add support for MSM QDSP6 Soc Audio.
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index 1a0803d97eec..766b824f6597 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 snd-q6dsp-common-objs := q6dsp-common.o q6dsp-lpass-ports.o q6dsp-lpass-clocks.o
-snd-q6apm-objs := q6apm.o audioreach.o
+snd-q6apm-objs := q6apm.o audioreach.o topology.o
 
 obj-$(CONFIG_SND_SOC_QDSP6_COMMON) += snd-q6dsp-common.o
 obj-$(CONFIG_SND_SOC_QDSP6_CORE) += q6core.o
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index acb9c7ad6fcd..1b7ba454f87d 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -785,11 +785,13 @@ EXPORT_SYMBOL_GPL(q6apm_graph_flush);
 
 static int q6apm_audio_probe(struct snd_soc_component *component)
 {
-	return 0;
+	return audioreach_tplg_init(component);
 }
 
 static void q6apm_audio_remove(struct snd_soc_component *component)
 {
+	/* remove topology */
+	snd_soc_tplg_component_remove(component);
 }
 
 #define APM_AUDIO_DRV_NAME "q6apm-audio"
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
new file mode 100644
index 000000000000..37d21d7898f1
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -0,0 +1,1118 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020, Linaro Limited
+
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
+	int ret;
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
+	ret = idr_alloc(&apm->graph_info_idr, info, graph_id,
+			graph_id + 1, GFP_ATOMIC);
+	spin_unlock(&apm->lock);
+
+	if (ret < 0) {
+		dev_err(apm->dev, "Failed to allocate Graph ID (%x)\n", graph_id);
+		kfree(info);
+		return ERR_PTR(ret);
+	}
+
+	info->id = ret;
+
+	return info;
+}
+
+static void audioreach_tplg_add_sub_graph(struct audioreach_sub_graph *sg,
+					  struct audioreach_graph_info *info)
+{
+	list_add_tail(&sg->node, &info->sg_list);
+	sg->info = info;
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
+	int ret;
+
+	if (!sub_graph_id)
+		return ERR_PTR(-EINVAL);
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
+	ret = idr_alloc(&apm->sub_graphs_idr, sg, sub_graph_id,
+			sub_graph_id + 1, GFP_ATOMIC);
+	spin_unlock(&apm->lock);
+
+	if (ret < 0) {
+		dev_err(apm->dev,
+			"Failed to allocate Sub-Graph Instance ID (%x)\n",
+			sub_graph_id);
+		kfree(sg);
+		return ERR_PTR(ret);
+	}
+
+	sg->sub_graph_id = ret;
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
+	int ret;
+
+	if (!container_id)
+		return ERR_PTR(-EINVAL);
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
+	ret = idr_alloc(&apm->containers_idr, cont, container_id,
+				container_id + 1, GFP_ATOMIC);
+	spin_unlock(&apm->lock);
+
+	if (ret < 0) {
+		dev_err(apm->dev,
+			"Failed to allocate Container Instance ID (%x)\n",
+			container_id);
+		kfree(cont);
+		return ERR_PTR(ret);
+	}
+
+	cont->container_id = ret;
+	cont->sub_graph = sg;
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
+	struct audioreach_module *mod;
+	int ret;
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
+	if (!module_id) { /* alloc module id dynamically */
+		ret = idr_alloc_cyclic(&apm->modules_idr, mod,
+				       AR_MODULE_DYNAMIC_INSTANCE_ID_START,
+				       AR_MODULE_DYNAMIC_INSTANCE_ID_END,
+				       GFP_ATOMIC);
+	} else {
+		ret = idr_alloc(&apm->modules_idr, mod, module_id,
+			  module_id + 1, GFP_ATOMIC);
+	}
+	spin_unlock(&apm->lock);
+
+	if (ret < 0) {
+		dev_err(apm->dev,
+			"Failed to allocate Module Instance ID (%x)\n", module_id);
+		kfree(mod);
+		return ERR_PTR(ret);
+	}
+
+	mod->instance_id = ret;
+	dev_err(apm->dev, "Module Instance ID (0x%08x) allocated\n", ret);
+	/* add to module list */
+	list_add_tail(&mod->node, &cont->modules_list);
+	mod->container = cont;
+	mod->widget = w;
+	cont->num_modules++;
+
+	return mod;
+}
+
+static struct snd_soc_tplg_vendor_array *audioreach_get_sg_array(
+					struct snd_soc_tplg_private *private)
+{
+	struct snd_soc_tplg_vendor_array *sg_array = NULL;
+	bool found = false;
+	int sz;
+
+	for (sz = 0; !found && (sz < le32_to_cpu(private->size)); ) {
+		struct snd_soc_tplg_vendor_value_elem *sg_elem;
+		int tkn_count = 0;
+
+		sg_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
+		sg_elem = sg_array->value;
+		sz = sz + le32_to_cpu(sg_array->size);
+		while (!found && tkn_count <= (le32_to_cpu(sg_array->num_elems) - 1)) {
+			switch (le32_to_cpu(sg_elem->token)) {
+			case AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:
+				found = true;
+				break;
+			default:
+				break;
+			}
+			tkn_count++;
+			sg_elem++;
+		}
+	}
+
+	if (found)
+		return sg_array;
+
+	return NULL;
+}
+
+static struct snd_soc_tplg_vendor_array *audioreach_get_cont_array(
+					struct snd_soc_tplg_private *private)
+{
+	struct snd_soc_tplg_vendor_array *cont_array = NULL;
+	bool found = false;
+	int sz;
+
+	for (sz = 0; !found && (sz < le32_to_cpu(private->size)); ) {
+		struct snd_soc_tplg_vendor_value_elem *cont_elem;
+		int tkn_count = 0;
+
+		cont_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
+		cont_elem = cont_array->value;
+		sz = sz + le32_to_cpu(cont_array->size);
+		while (!found && tkn_count <= (le32_to_cpu(cont_array->num_elems) - 1)) {
+			switch (le32_to_cpu(cont_elem->token)) {
+			case AR_TKN_U32_CONTAINER_INSTANCE_ID:
+				found = true;
+				break;
+			default:
+				break;
+			}
+			tkn_count++;
+			cont_elem++;
+		}
+	}
+
+	if (found)
+		return cont_array;
+
+	return NULL;
+}
+
+static struct snd_soc_tplg_vendor_array *audioreach_get_module_array(
+					struct snd_soc_tplg_private *private)
+{
+	struct snd_soc_tplg_vendor_array *mod_array = NULL;
+	bool found = false;
+	int sz = 0;
+
+	for (sz = 0; !found && (sz < le32_to_cpu(private->size)); ) {
+		struct snd_soc_tplg_vendor_value_elem *mod_elem;
+		int tkn_count = 0;
+
+		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
+		mod_elem = mod_array->value;
+		sz = sz + le32_to_cpu(mod_array->size);
+		while (!found && tkn_count <= (le32_to_cpu(mod_array->num_elems) - 1)) {
+			switch (le32_to_cpu(mod_elem->token)) {
+			case AR_TKN_U32_MODULE_INSTANCE_ID:
+				found = true;
+				break;
+			default:
+				break;
+			}
+			tkn_count++;
+			mod_elem++;
+		}
+	}
+
+	if (found)
+		return mod_array;
+
+	return NULL;
+}
+
+static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
+					struct snd_soc_tplg_private *private)
+{
+	struct audioreach_graph_info *info = NULL;
+	struct snd_soc_tplg_vendor_array *sg_array;
+	struct snd_soc_tplg_vendor_value_elem *sg_elem;
+	struct audioreach_sub_graph *sg;
+	int graph_id, sub_graph_id, tkn_count = 0;
+	bool found;
+
+	sg_array = audioreach_get_sg_array(private);
+	sg_elem = sg_array->value;
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
+static struct audioreach_container *audioreach_parse_cont_tokens(struct q6apm *apm,
+						struct audioreach_sub_graph *sg,
+						struct snd_soc_tplg_private *private)
+{
+	struct snd_soc_tplg_vendor_array *cont_array;
+	struct snd_soc_tplg_vendor_value_elem *cont_elem;
+	struct audioreach_container *cont;
+	int container_id, tkn_count = 0;
+	bool found = false;
+
+	cont_array = audioreach_get_cont_array(private);
+	cont_elem = cont_array->value;
+
+	while (tkn_count <= (le32_to_cpu(cont_array->num_elems) - 1)) {
+		switch (le32_to_cpu(cont_elem->token)) {
+		case AR_TKN_U32_CONTAINER_INSTANCE_ID:
+			container_id = le32_to_cpu(cont_elem->value);
+			cont = audioreach_tplg_alloc_container(apm, sg, container_id, &found);
+			if (IS_ERR(cont))
+				return ERR_PTR(-ENOMEM);
+			else if (found) /* Already parsed container data */
+				return cont;
+
+			break;
+		case AR_TKN_U32_CONTAINER_CAPABILITY_ID:
+			cont->capability_id = le32_to_cpu(cont_elem->value);
+			break;
+		case AR_TKN_U32_CONTAINER_STACK_SIZE:
+			cont->stack_size = le32_to_cpu(cont_elem->value);
+			break;
+		case AR_TKN_U32_CONTAINER_GRAPH_POS:
+			cont->graph_pos = le32_to_cpu(cont_elem->value);
+			break;
+		case AR_TKN_U32_CONTAINER_PROC_DOMAIN:
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
+							struct snd_soc_tplg_private *private,
+							struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_tplg_vendor_array *mod_array;
+	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	uint32_t max_ip_port = 0, max_op_port = 0, in_port = 0, out_port = 0;
+	uint32_t src_mod_inst_id = 0, src_mod_op_port_id = 0;
+	uint32_t dst_mod_inst_id = 0, dst_mod_ip_port_id = 0;
+	int module_id = 0, instance_id = 0, tkn_count = 0;
+	struct audioreach_module *mod = NULL;
+	bool found;
+
+	mod_array = audioreach_get_module_array(private);
+	mod_elem = mod_array->value;
+
+	while (tkn_count <= (le32_to_cpu(mod_array->num_elems) - 1)) {
+		switch (le32_to_cpu(mod_elem->token)) {
+		/* common module info */
+		case AR_TKN_U32_MODULE_ID:
+			module_id = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_INSTANCE_ID:
+			instance_id = le32_to_cpu(mod_elem->value);
+			mod = audioreach_tplg_alloc_module(apm, cont, w,
+							   instance_id, &found);
+			if (IS_ERR(mod)) {
+				return ERR_PTR(-ENOMEM);
+			} else if (found) {
+				dev_err(apm->dev, "Duplicate Module Instance ID 0x%08x found\n",
+					instance_id);
+				return ERR_PTR(-EINVAL);
+			}
+
+			break;
+		case AR_TKN_U32_MODULE_MAX_IP_PORTS:
+			max_ip_port = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_MAX_OP_PORTS:
+			max_op_port = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_IN_PORTS:
+			in_port = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_OUT_PORTS:
+			out_port = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_SRC_OP_PORT_ID:
+			src_mod_op_port_id = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_SRC_INSTANCE_ID:
+			src_mod_inst_id = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_INSTANCE_ID:
+			dst_mod_inst_id = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_IN_PORT_ID:
+			dst_mod_ip_port_id = le32_to_cpu(mod_elem->value);
+
+		default:
+			break;
+
+		}
+		tkn_count++;
+		mod_elem++;
+	}
+
+	if (mod) {
+		mod->module_id = module_id;
+		mod->max_ip_port = max_ip_port;
+		mod->max_op_port = max_op_port;
+		mod->in_port = in_port;
+		mod->out_port = out_port;
+		mod->src_mod_inst_id = src_mod_inst_id;
+		mod->src_mod_op_port_id = src_mod_op_port_id;
+		mod->dst_mod_inst_id = dst_mod_inst_id;
+		mod->dst_mod_ip_port_id = dst_mod_ip_port_id;
+	}
+
+	return mod;
+}
+
+static int audioreach_widget_load_module_common(struct snd_soc_component *component,
+				      int index, struct snd_soc_dapm_widget *w,
+				      struct snd_soc_tplg_dapm_widget *tplg_w)
+{
+	struct q6apm *apm = dev_get_drvdata(component->dev);
+	struct audioreach_sub_graph *sg;
+	struct audioreach_container *cont;
+	struct audioreach_module *mod;
+	struct snd_soc_dobj *dobj;
+
+	sg = audioreach_parse_sg_tokens(apm, &tplg_w->priv);
+	if (IS_ERR(sg))
+		return PTR_ERR(sg);
+
+	cont = audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
+	if (IS_ERR(cont))
+		return PTR_ERR(cont);
+
+	mod = audioreach_parse_common_tokens(apm, cont, &tplg_w->priv, w);
+	if (IS_ERR(mod))
+		return PTR_ERR(mod);
+
+	dobj = &w->dobj;
+	dobj->private = mod;
+
+	return 0;
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
+	int tkn_count = 0;
+	int ret;
+
+	ret = audioreach_widget_load_module_common(component, index, w, tplg_w);
+	if (ret)
+		return ret;
+
+	dobj = &w->dobj;
+	mod = dobj->private;
+	mod_array = audioreach_get_module_array(&tplg_w->priv);
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
+static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
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
+		case AR_TKN_U32_MODULE_SD_LINE_IDX:
+			mod->sd_line_idx = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_WS_SRC:
+			mod->ws_src = le32_to_cpu(mod_elem->value);
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
+	int ret;
+
+	ret = audioreach_widget_load_module_common(component, index, w, tplg_w);
+	if (ret)
+		return ret;
+
+	dobj = &w->dobj;
+	mod = dobj->private;
+
+	mod_array = audioreach_get_module_array(&tplg_w->priv);
+
+	switch (mod->module_id) {
+	case MODULE_ID_CODEC_DMA_SINK:
+	case MODULE_ID_CODEC_DMA_SOURCE:
+		audioreach_widget_dma_module_load(mod, mod_array);
+		break;
+	case MODULE_ID_DATA_LOGGING:
+		audioreach_widget_log_module_load(mod, mod_array);
+		break;
+	case MODULE_ID_I2S_SINK:
+	case MODULE_ID_I2S_SOURCE:
+		audioreach_widget_i2s_module_load(mod, mod_array);
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
+static int audioreach_widget_load_pga(struct snd_soc_component *component,
+					int index, struct snd_soc_dapm_widget *w,
+					struct snd_soc_tplg_dapm_widget *tplg_w)
+{
+	struct audioreach_module *mod;
+	struct snd_soc_dobj *dobj;
+	int ret;
+
+	ret = audioreach_widget_load_module_common(component, index, w, tplg_w);
+	if (ret)
+		return ret;
+
+	dobj = &w->dobj;
+	mod = dobj->private;
+	mod->gain = VOL_CTRL_DEFAULT_GAIN;
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
+		audioreach_widget_load_buffer(component, index, w, tplg_w);
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
+	case snd_soc_dapm_pga:
+		return audioreach_widget_load_pga(component, index, w, tplg_w);
+	case snd_soc_dapm_dai_link:
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
+	struct snd_soc_dapm_widget *w =
+		container_of(dobj, struct snd_soc_dapm_widget, dobj);
+
+	mod = dobj->private;
+	cont = mod->container;
+
+	if (w->id == snd_soc_dapm_mixer) {
+		/* virtual widget */
+		kfree(dobj->private);
+		return 0;
+	}
+
+	spin_lock(&apm->lock);
+	idr_remove(&apm->modules_idr, mod->instance_id);
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
+	struct audioreach_module *module;
+	int id = 0;
+
+	idr_for_each_entry(&apm->modules_idr, module, id) {
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
+static int audioreach_get_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct audioreach_module *mod = dw->dobj.private;
+
+	/* Check if the graph is active or not */
+	ucontrol->value.integer.value[0] = mod->gain;
+
+	return 0;
+}
+
+static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_widget(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct snd_soc_component *c = snd_soc_dapm_to_component(dapm);
+	struct audioreach_module *mod = dw->dobj.private;
+	struct q6apm *apm = dev_get_drvdata(c->dev);
+	int vol = ucontrol->value.integer.value[0];
+
+	/* Check if the graph is active or not */
+	if (dw->power) {
+		audioreach_gain_set_vol_ctrl(apm, mod, vol);
+		mod->gain = vol;
+		return 1;
+	}
+
+	dev_err(apm->dev, "Unable to set volume as graph is not	active\n");
+	return 0;
+
+}
+
+static int audioreach_control_load_mix(struct snd_soc_component *scomp,
+					  struct snd_ar_control *scontrol,
+					  struct snd_kcontrol_new *kc,
+					  struct snd_soc_tplg_ctl_hdr *hdr)
+{
+	struct snd_soc_tplg_mixer_control *mc;
+	struct snd_soc_tplg_vendor_array *c_array;
+	struct snd_soc_tplg_vendor_value_elem *c_elem;
+	int tkn_count = 0;
+
+	mc = container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
+	c_array = (struct snd_soc_tplg_vendor_array *)mc->priv.data;
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
+	switch (le32_to_cpu(hdr->ops.get)) {
+	case SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX:
+		sm = (struct soc_mixer_control *)kc->private_value;
+		dobj = &sm->dobj;
+		ret = audioreach_control_load_mix(scomp, scontrol, kc, hdr);
+		break;
+	case SND_SOC_AR_TPLG_VOL_CTL:
+		sm = (struct soc_mixer_control *)kc->private_value;
+		dobj = &sm->dobj;
+		break;
+	default:
+		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
+			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
+		kfree(scontrol);
+		return -EINVAL;
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
+	{SND_SOC_AR_TPLG_VOL_CTL, audioreach_get_vol_ctrl_audio_mixer,
+		audioreach_put_vol_ctrl_audio_mixer, snd_soc_info_volsw},
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
+	.link_load = audioreach_link_load,
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

