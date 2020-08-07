Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D33423EC05
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 13:12:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4786A15E2;
	Fri,  7 Aug 2020 13:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4786A15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596798767;
	bh=EwWlBD3tgenwDpFNp+1pCy5dLOUP+mfYRooJOfW8qPE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g8SPTPNzQsFJ6s0SJCBABaAJiNayjgiQf5JjHND6szTZEhDXgrSj9lM9VgBv3Do4d
	 RQITxImYrLE/2ApJah7iGOcbgvJPqnoLZg3NX5EScbnU0IaRfSnlKWcgDDaHXeLZhY
	 c3g6CY1RqHlnZsYo8wiExo+uLKT15MACB0KSb7is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FCB7F8031A;
	Fri,  7 Aug 2020 13:07:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1468F80316; Fri,  7 Aug 2020 13:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5F0DF80303
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5F0DF80303
IronPort-SDR: u9UOlRm4biHPjWtqXM2cbXZIdhboGCWxQDxIXxxZ6BEeBpaiW42IeHcf4r9S7ACYNAM9Pfic06
 1oVPY7iNOY+g==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="214585509"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="214585509"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 04:07:31 -0700
IronPort-SDR: 1377CIZP0f1Uul9+xuNwLWyaSrK8fl68+sZr4H8CyE6l1PolqUMHOf/DmtiQ2P0PzU6UfP+Y9w
 YuzJC1slsQUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="333514019"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga007.jf.intel.com with ESMTP; 07 Aug 2020 04:07:27 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/13] ASoC: Intel: catpt: Event tracing
Date: Fri,  7 Aug 2020 13:06:43 +0200
Message-Id: <20200807110649.17114-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807110649.17114-1-cezary.rojewski@intel.com>
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 cujomalainey@chromium.org, ppapierkowski@habana.ai,
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

Define tracing macros for easy catpt debug. These are divided into
memory, registry and ipc event categories.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/trace.h | 169 ++++++++++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 sound/soc/intel/catpt/trace.h

diff --git a/sound/soc/intel/catpt/trace.h b/sound/soc/intel/catpt/trace.h
new file mode 100644
index 000000000000..92f79667b73b
--- /dev/null
+++ b/sound/soc/intel/catpt/trace.h
@@ -0,0 +1,169 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ *
+ * Author: Cezary Rojewski <cezary.rojewski@intel.com>
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM intel_catpt
+
+#if !defined(__SND_SOC_INTEL_CATPT_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define __SND_SOC_INTEL_CATPT_TRACE_H
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+
+struct catpt_mbank;
+struct catpt_mregion;
+
+TRACE_EVENT(catpt_mbank,
+	TP_PROTO(struct catpt_mbank *sram, const char *action,
+		 u32 start, u32 end),
+
+	TP_ARGS(sram, action, start, end),
+
+	TP_STRUCT__entry(
+		__field(u32, bank_start)
+		__field(u32, bank_end)
+		__string(action, action)
+		__field(u32, start)
+		__field(u32, end)
+	),
+
+	TP_fast_assign(
+		__entry->bank_start = sram->start;
+		__entry->bank_end = sram->end;
+		__assign_str(action, action);
+		__entry->start = start;
+		__entry->end = end;
+	),
+
+	TP_printk("[0x%08x-%08x] %s 0x%08x-%08x",
+		  __entry->bank_start, __entry->bank_end,
+		  __get_str(action),
+		  __entry->start, __entry->end)
+);
+
+TRACE_EVENT(catpt_mregion,
+	TP_PROTO(struct catpt_mregion *r1, struct catpt_mregion *r2,
+		 const char *action),
+
+	TP_ARGS(r1, r2, action),
+
+	TP_STRUCT__entry(
+		__field(u32, r1_start)
+		__field(u32, r1_end)
+		__field(u32, r2_start)
+		__field(u32, r2_end)
+		__string(action, action)
+	),
+
+	TP_fast_assign(
+		__entry->r1_start = r1->start;
+		__entry->r1_end = r1->end;
+		__entry->r2_start = r2->start;
+		__entry->r2_end = r2->end;
+		__assign_str(action, action);
+	),
+
+	TP_printk("0x%08x-%08x %s 0x%08x-%08x",
+		  __entry->r1_start, __entry->r1_end,
+		  __get_str(action),
+		  __entry->r2_start, __entry->r2_end)
+);
+
+TRACE_EVENT(catpt_updatel,
+
+	TP_PROTO(const char *title, u32 mask, u32 old, u32 new),
+
+	TP_ARGS(title, mask, old, new),
+
+	TP_STRUCT__entry(
+		__string(title, title)
+		__field(u32, mask)
+		__field(u32, old)
+		__field(u32, new)
+	),
+
+	TP_fast_assign(
+		__assign_str(title, title);
+		__entry->mask = mask;
+		__entry->old = old;
+		__entry->new = new;
+	),
+
+	TP_printk("%s [0x%08x] 0x%08x -> 0x%08x",
+		  __get_str(title),
+		  __entry->mask,
+		  __entry->old,
+		  __entry->new)
+);
+
+DECLARE_EVENT_CLASS(catpt_ipc_msg,
+
+	TP_PROTO(u32 header),
+
+	TP_ARGS(header),
+
+	TP_STRUCT__entry(
+		__field(u32, header)
+	),
+
+	TP_fast_assign(
+		__entry->header = header;
+	),
+
+	TP_printk("0x%08x", __entry->header)
+);
+
+DEFINE_EVENT(catpt_ipc_msg, catpt_irq,
+	TP_PROTO(u32 header),
+	TP_ARGS(header)
+);
+
+DEFINE_EVENT(catpt_ipc_msg, catpt_ipc_request,
+	TP_PROTO(u32 header),
+	TP_ARGS(header)
+);
+
+DEFINE_EVENT(catpt_ipc_msg, catpt_ipc_reply,
+	TP_PROTO(u32 header),
+	TP_ARGS(header)
+);
+
+DEFINE_EVENT(catpt_ipc_msg, catpt_ipc_notify,
+	TP_PROTO(u32 header),
+	TP_ARGS(header)
+);
+
+TRACE_EVENT_CONDITION(catpt_ipc_payload,
+
+	TP_PROTO(const u8 *data, size_t size),
+
+	TP_ARGS(data, size),
+
+	TP_CONDITION(data && size),
+
+	TP_STRUCT__entry(
+		__dynamic_array(u8, buf, size)
+	),
+
+	TP_fast_assign(
+		memcpy(__get_dynamic_array(buf), data, size);
+	),
+
+	TP_printk("%u byte(s)%s",
+		  __get_dynamic_array_len(buf),
+		  __print_hex_dump("", DUMP_PREFIX_NONE, 16, 4,
+				   __get_dynamic_array(buf),
+				   __get_dynamic_array_len(buf), false))
+);
+
+#endif /* __SND_SOC_INTEL_CATPT_TRACE_H */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE trace
+#include <trace/define_trace.h>
-- 
2.17.1

