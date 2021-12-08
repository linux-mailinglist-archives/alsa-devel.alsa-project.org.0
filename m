Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF8146D215
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:23:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 163A526A0;
	Wed,  8 Dec 2021 12:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 163A526A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962618;
	bh=4m4CpJu3CpM1+PcdjpN8kezukaNE+OeAoqHQTYWPwKw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFdWe5THttGKxxjBd2bNvjeYwBKARNMjlIeBZLCoK27gWI9Pbfx88lA7o16hrSrZ8
	 QWKfcd4Ubi9+Muetk36OkW/DQDJ/e21ztTsKkK3FPM2uPGtP3DP2A1vRysNJXBfkz8
	 WmKZj6+J6aTkfzjh8FBuCQlYMRFkOjFNTFpbOo/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C10FFF8061C;
	Wed,  8 Dec 2021 12:12:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F89AF80614; Wed,  8 Dec 2021 12:12:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E26CF804FB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E26CF804FB
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236548508"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="236548508"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:12:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600547"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:12:40 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 32/37] ASoC: Intel: avs: Event tracing
Date: Wed,  8 Dec 2021 12:12:56 +0100
Message-Id: <20211208111301.1817725-33-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

Define tracing macros for easy avs debug. These cover all IPC message
types: requests, replies and notifications as well as DSP-core
operations and d0ix toggling.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile |   4 +
 sound/soc/intel/avs/dsp.c    |  10 +++
 sound/soc/intel/avs/ipc.c    |  29 ++++++-
 sound/soc/intel/avs/trace.c  |  34 ++++++++
 sound/soc/intel/avs/trace.h  | 158 +++++++++++++++++++++++++++++++++++
 5 files changed, 232 insertions(+), 3 deletions(-)
 create mode 100644 sound/soc/intel/avs/trace.c
 create mode 100644 sound/soc/intel/avs/trace.h

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 427b92fad4ef..479b76b48433 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -4,4 +4,8 @@ snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o topology.o path.o \
 		    core.o loader.o pcm.o
 snd-soc-avs-objs += cldma.o
 
+snd-soc-avs-objs += trace.o
+# tell define_trace.h where to find the trace header
+CFLAGS_trace.o := -I$(src)
+
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
index 823f9c969ea6..5174175e9238 100644
--- a/sound/soc/intel/avs/dsp.c
+++ b/sound/soc/intel/avs/dsp.c
@@ -10,6 +10,7 @@
 #include <sound/hdaudio_ext.h>
 #include "avs.h"
 #include "registers.h"
+#include "trace.h"
 
 #define AVS_ADSPCS_INTERVAL_US		500
 #define AVS_ADSPCS_TIMEOUT_US		10000
@@ -19,6 +20,9 @@ int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool active)
 	u32 value, mask, reg;
 	int ret;
 
+	value = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPCS);
+	trace_avs_dsp_core_op(value, core_mask, "power", active);
+
 	mask = AVS_ADSPCS_SPA_MASK(core_mask);
 	value = active ? mask : 0;
 
@@ -43,6 +47,9 @@ int avs_dsp_core_reset(struct avs_dev *adev, u32 core_mask, bool reset)
 	u32 value, mask, reg;
 	int ret;
 
+	value = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPCS);
+	trace_avs_dsp_core_op(value, core_mask, "reset", reset);
+
 	mask = AVS_ADSPCS_CRST_MASK(core_mask);
 	value = reset ? mask : 0;
 
@@ -64,6 +71,9 @@ int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall)
 	u32 value, mask, reg;
 	int ret;
 
+	value = snd_hdac_adsp_readl(adev, AVS_ADSP_REG_ADSPCS);
+	trace_avs_dsp_core_op(value, core_mask, "stall", stall);
+
 	mask = AVS_ADSPCS_CSTALL_MASK(core_mask);
 	value = stall ? mask : 0;
 
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 19bdf3a53491..9db149c12659 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -11,6 +11,7 @@
 #include "avs.h"
 #include "messages.h"
 #include "registers.h"
+#include "trace.h"
 
 #define AVS_IPC_TIMEOUT_MS	300
 #define AVS_D0IX_DELAY_MS	300
@@ -169,6 +170,10 @@ static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
 {
 	struct avs_ipc *ipc = adev->ipc;
 	union avs_reply_msg msg = AVS_MSG(header);
+	u64 reg;
+
+	reg = readq(avs_sram_addr(adev, AVS_FW_REGS_WINDOW));
+	trace_avs_ipc_reply_msg(header, reg);
 
 	ipc->rx.header = header;
 	if (!msg.status) {
@@ -179,6 +184,7 @@ static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
 
 		memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev),
 			      ipc->rx.size);
+		trace_avs_msg_payload(ipc->rx.data, ipc->rx.size);
 	}
 }
 
@@ -188,6 +194,10 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 	union avs_notify_msg msg = AVS_MSG(header);
 	size_t data_size = 0;
 	void *data = NULL;
+	u64 reg;
+
+	reg = readq(avs_sram_addr(adev, AVS_FW_REGS_WINDOW));
+	trace_avs_ipc_notify_msg(header, reg);
 
 	/* Calculate notification payload size. */
 	switch (msg.notify_msg_type) {
@@ -223,6 +233,7 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 			return;
 
 		memcpy_fromio(data, avs_uplink_addr(adev), data_size);
+		trace_avs_msg_payload(data, data_size);
 	}
 
 	/* Perform notification-specific operations. */
@@ -397,9 +408,15 @@ static void avs_ipc_msg_init(struct avs_ipc *ipc, struct avs_ipc_msg *reply)
 	reinit_completion(&ipc->busy_completion);
 }
 
-static void avs_dsp_send_tx(struct avs_dev *adev, const struct avs_ipc_msg *tx)
+static void avs_dsp_send_tx(struct avs_dev *adev, const struct avs_ipc_msg *tx,
+			    bool read_fwregs)
 {
 	const struct avs_spec *const spec = adev->spec;
+	u64 reg = ULONG_MAX;
+
+	if (read_fwregs)
+		reg = readq(avs_sram_addr(adev, AVS_FW_REGS_WINDOW));
+	trace_avs_request(tx, reg);
 
 	if (tx->size)
 		memcpy_toio(avs_downlink_addr(adev), tx->data, tx->size);
@@ -421,7 +438,7 @@ static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request
 
 	spin_lock(&ipc->rx_lock);
 	avs_ipc_msg_init(ipc, reply);
-	avs_dsp_send_tx(adev, request);
+	avs_dsp_send_tx(adev, request, true);
 	spin_unlock(&ipc->rx_lock);
 
 	ret = avs_ipc_wait_busy_completion(ipc, timeout);
@@ -454,6 +471,7 @@ static int avs_dsp_send_msg_sequence(struct avs_dev *adev,
 {
 	int ret;
 
+	trace_avs_d0ix("wake", wake_d0i0, request->header);
 	if (wake_d0i0) {
 		ret = avs_dsp_wake_d0i0(adev, request);
 		if (ret)
@@ -464,6 +482,7 @@ static int avs_dsp_send_msg_sequence(struct avs_dev *adev,
 	if (ret)
 		return ret;
 
+	trace_avs_d0ix("schedule", schedule_d0ix, request->header);
 	if (schedule_d0ix)
 		avs_dsp_schedule_d0ix(adev, request);
 
@@ -515,7 +534,11 @@ static int avs_dsp_do_send_rom_msg(struct avs_dev *adev, struct avs_ipc_msg *req
 
 	spin_lock(&ipc->rx_lock);
 	avs_ipc_msg_init(ipc, NULL);
-	avs_dsp_send_tx(adev, request);
+	/*
+	 * with hw still stalled, memory windows may not be
+	 * configured properly so avoid accessing SRAM
+	 */
+	avs_dsp_send_tx(adev, request, false);
 	spin_unlock(&ipc->rx_lock);
 
 	/* ROM messages must be sent before main core is unstalled */
diff --git a/sound/soc/intel/avs/trace.c b/sound/soc/intel/avs/trace.c
new file mode 100644
index 000000000000..a3cc43cd8b81
--- /dev/null
+++ b/sound/soc/intel/avs/trace.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+// Author: Cezary Rojewski <cezary.rojewski@intel.com>
+//         Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/types.h>
+
+#define CREATE_TRACE_POINTS
+#include "trace.h"
+
+#define BYTES_PER_LINE 16
+
+#define MAX_CHUNK_SIZE ((PAGE_SIZE - 150) /* Place for trace header */	\
+			/ (2 * BYTES_PER_LINE + 4) /* chars per line */	\
+			* BYTES_PER_LINE)
+
+void trace_avs_msg_payload(const void *data, size_t size)
+{
+	size_t remaining = size;
+	size_t offset = 0;
+
+	while (remaining > 0) {
+		u32 chunk;
+
+		chunk = min(remaining, MAX_CHUNK_SIZE);
+		trace_avs_ipc_msg_payload(data, chunk, offset, size);
+
+		remaining -= chunk;
+		offset += chunk;
+	}
+}
diff --git a/sound/soc/intel/avs/trace.h b/sound/soc/intel/avs/trace.h
new file mode 100644
index 000000000000..216ea25d2eec
--- /dev/null
+++ b/sound/soc/intel/avs/trace.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM intel_avs
+
+#if !defined(_TRACE_INTEL_AVS_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_INTEL_AVS_H
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(avs_dsp_core_op,
+
+	TP_PROTO(unsigned int reg, unsigned int mask,
+		const char *op, bool flag),
+
+	TP_ARGS(reg, mask, op, flag),
+
+	TP_STRUCT__entry(
+		__field(unsigned int,	reg	)
+		__field(unsigned int,	mask	)
+		__string(op,		op	)
+		__field(bool,		flag	)
+	),
+
+	TP_fast_assign(
+		__entry->reg = reg;
+		__entry->mask = mask;
+		__assign_str(op, op);
+		__entry->flag = flag;
+	),
+
+	TP_printk("%s: %d, core mask: 0x%X, prev state: 0x%08X",
+		  __get_str(op), __entry->flag, __entry->mask, __entry->reg)
+);
+
+#ifndef __TRACE_INTEL_AVS_TRACE_HELPER
+#define __TRACE_INTEL_AVS_TRACE_HELPER
+
+void trace_avs_msg_payload(const void *data, size_t size);
+
+#define trace_avs_request(msg, fwregs) \
+({ \
+	trace_avs_ipc_request_msg((msg)->header, fwregs); \
+	trace_avs_msg_payload((msg)->data, (msg)->size); \
+})
+
+#define trace_avs_reply(msg, fwregs) \
+({ \
+	trace_avs_ipc_reply_msg((msg)->header, fwregs); \
+	trace_avs_msg_payload((msg)->data, (msg)->size); \
+})
+
+#define trace_avs_notify(msg, fwregs) \
+({ \
+	trace_avs_ipc_notify_msg((msg)->header, fwregs); \
+	trace_avs_msg_payload((msg)->data, (msg)->size); \
+})
+#endif
+
+DECLARE_EVENT_CLASS(avs_ipc_msg_hdr,
+
+	TP_PROTO(u64 header, u64 fwregs),
+
+	TP_ARGS(header, fwregs),
+
+	TP_STRUCT__entry(
+		__field(u64,	header)
+		__field(u64,	fwregs)
+	),
+
+	TP_fast_assign(
+		__entry->header = header;
+		__entry->fwregs = fwregs;
+	),
+
+	TP_printk("primary: 0x%08X, extension: 0x%08X,\n"
+		  "fwstatus: 0x%08X, fwerror: 0x%08X",
+		  lower_32_bits(__entry->header),
+		  upper_32_bits(__entry->header),
+		  lower_32_bits(__entry->fwregs),
+		  upper_32_bits(__entry->fwregs))
+);
+
+DEFINE_EVENT(avs_ipc_msg_hdr, avs_ipc_request_msg,
+	TP_PROTO(u64 header, u64 fwregs),
+	TP_ARGS(header, fwregs)
+);
+
+DEFINE_EVENT(avs_ipc_msg_hdr, avs_ipc_reply_msg,
+	TP_PROTO(u64 header, u64 fwregs),
+	TP_ARGS(header, fwregs)
+);
+
+DEFINE_EVENT(avs_ipc_msg_hdr, avs_ipc_notify_msg,
+	TP_PROTO(u64 header, u64 fwregs),
+	TP_ARGS(header, fwregs)
+);
+
+TRACE_EVENT_CONDITION(avs_ipc_msg_payload,
+
+	TP_PROTO(const u8 *data, size_t size, size_t offset, size_t total),
+
+	TP_ARGS(data, size, offset, total),
+
+	TP_CONDITION(data && size),
+
+	TP_STRUCT__entry(
+		__dynamic_array(u8,	buf,	size	)
+		__field(size_t,		offset		)
+		__field(size_t,		pos		)
+		__field(size_t,		total		)
+	),
+
+	TP_fast_assign(
+		memcpy(__get_dynamic_array(buf), data + offset, size);
+		__entry->offset = offset;
+		__entry->pos = offset + size;
+		__entry->total = total;
+	),
+
+	TP_printk("range %lu-%lu out of %lu bytes%s",
+		  __entry->offset, __entry->pos, __entry->total,
+		  __print_hex_dump("", DUMP_PREFIX_NONE, 16, 4,
+				   __get_dynamic_array(buf),
+				   __get_dynamic_array_len(buf), false))
+);
+
+TRACE_EVENT(avs_d0ix,
+
+	TP_PROTO(const char *op, bool proceed, u64 header),
+
+	TP_ARGS(op, proceed, header),
+
+	TP_STRUCT__entry(
+		__string(op,	op	)
+		__field(bool,	proceed	)
+		__field(u64,	header	)
+	),
+
+	TP_fast_assign(
+		__assign_str(op, op);
+		__entry->proceed = proceed;
+		__entry->header = header;
+	),
+
+	TP_printk("%s%s for request: 0x%08X 0x%08X",
+		  __entry->proceed ? "" : "ignore ", __get_str(op),
+		  lower_32_bits(__entry->header),
+		  upper_32_bits(__entry->header))
+);
+
+#endif /* _TRACE_INTEL_AVS_H */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE trace
+#include <trace/define_trace.h>
-- 
2.25.1

