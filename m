Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5247B5BCBB4
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:23:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C39221638;
	Mon, 19 Sep 2022 14:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C39221638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663590183;
	bh=rYunQaIUAvkaIWxdgAyvrAy+wL4oUa5ElgR++5jyI/4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L+7aWWHLOpmF2GyFPUrELmZy7PybPPV9VjjpXu0gmNxZ6grIizZLx22HQKWVNi/Tz
	 Ozq3sCNyE4KzcFxmHanGm5hWQKIeugmJ/ShREofSQ9G8BjUL8q7rzra8mqMbaBLfcx
	 lZNZsozWgQJwVuUKoZodwyoPqUi4tw6hpHuM0sYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D120DF800C9;
	Mon, 19 Sep 2022 14:21:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68F18F804AE; Mon, 19 Sep 2022 14:21:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE734F800C9
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE734F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b7NG03uA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663590098; x=1695126098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rYunQaIUAvkaIWxdgAyvrAy+wL4oUa5ElgR++5jyI/4=;
 b=b7NG03uAFVp72HJstWn3XRbUzSMrtyNEAMO6ua0A2ENZCVnvZ8rnmYy/
 QMqjKWhhSnCTm0GzNGuzNUhKKwNn4jWvdr1vDCvCkyNpoH8Km2KHQzpA+
 q2VzqV7gs1nu0CgykMiSB+vLIEUn1RWPt4UPakMvdFDtsQhoLXw4KBaUV
 cIrTHU4obVnOdkJ+yyuwkQuOU6eRHUvUJQOyG4a1/ITEyX+MjWiyGViIy
 e/O51baH9FSB7VZNXjbGbb+GfsYHQUIOvLOJxduscdwWQjc9nf6PSG5Zr
 jLdHlcc988uaD0pnYAhc6Du+/ghZulQyw/e4dRKtTQe2036HCpnUx+4yP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="361123233"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="361123233"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:21:36 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="620837641"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:21:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ASoC: SOF: add widget setup/free tracing
Date: Mon, 19 Sep 2022 14:21:02 +0200
Message-Id: <20220919122108.43764-2-pierre-louis.bossart@linux.intel.com>
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

Enables tracking of use_count during widget setup and free routines.
Useful for debugging unbalanced use_counts during suspend/resume.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Noah Klayman <noah.klayman@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/trace/events/sof.h | 44 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/core.c       |  3 +++
 sound/soc/sof/sof-audio.c  |  5 +++++
 3 files changed, 52 insertions(+)
 create mode 100644 include/trace/events/sof.h

diff --git a/include/trace/events/sof.h b/include/trace/events/sof.h
new file mode 100644
index 0000000000000..f25eef6c95c09
--- /dev/null
+++ b/include/trace/events/sof.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ *
+ * Author: Noah Klayman <noah.klayman@intel.com>
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM sof
+
+#if !defined(_TRACE_SOF_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_SOF_H
+#include <linux/tracepoint.h>
+#include <sound/sof/stream.h>
+#include "../../../sound/soc/sof/sof-audio.h"
+
+DECLARE_EVENT_CLASS(sof_widget_template,
+	TP_PROTO(struct snd_sof_widget *swidget),
+	TP_ARGS(swidget),
+	TP_STRUCT__entry(
+		__string(name, swidget->widget->name)
+		__field(int, use_count)
+	),
+	TP_fast_assign(
+		__assign_str(name, swidget->widget->name);
+		__entry->use_count = swidget->use_count;
+	),
+	TP_printk("name=%s use_count=%d", __get_str(name), __entry->use_count)
+);
+
+DEFINE_EVENT(sof_widget_template, sof_widget_setup,
+	TP_PROTO(struct snd_sof_widget *swidget),
+	TP_ARGS(swidget)
+);
+
+DEFINE_EVENT(sof_widget_template, sof_widget_free,
+	TP_PROTO(struct snd_sof_widget *swidget),
+	TP_ARGS(swidget)
+);
+
+#endif /* _TRACE_SOF_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index c99b5e6c026c1..3e6141d03770f 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -15,6 +15,9 @@
 #include "sof-priv.h"
 #include "ops.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/sof.h>
+
 /* see SOF_DBG_ flags */
 static int sof_core_debug =  IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE);
 module_param_named(sof_debug, sof_core_debug, int, 0444);
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index ea9663d448eb8..a3d3dd7a00375 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/bitfield.h>
+#include <trace/events/sof.h>
 #include "sof-audio.h"
 #include "sof-of-dev.h"
 #include "ops.h"
@@ -36,6 +37,8 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (!swidget->private)
 		return 0;
 
+	trace_sof_widget_free(swidget);
+
 	/* only free when use_count is 0 */
 	if (--swidget->use_count)
 		return 0;
@@ -86,6 +89,8 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (!swidget->private)
 		return 0;
 
+	trace_sof_widget_setup(swidget);
+
 	/* widget already set up */
 	if (++swidget->use_count > 1)
 		return 0;
-- 
2.34.1

