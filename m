Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A835C5BCBB5
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:23:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28E1E1661;
	Mon, 19 Sep 2022 14:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28E1E1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663590201;
	bh=xZ3P7jtQWF5nVsvGElyZKrwG1HWgkeSt6+/o4TG9gfQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eKaRudE14kqlF+9Nektge0lcVTOGszBDrft8K7EA+EKxgAnAfYSY/uTyLXN127aua
	 gfkoc3e+rarH63zmhIGSo1aVWhtE1kqVKy4KojGukxT1O2QCy6nJQm7ScswWYdSIOs
	 5Jy+WximBFsrJWq5YM7fD40PmYa3ZQYFJrtF31ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F358F804B4;
	Mon, 19 Sep 2022 14:22:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90AACF8053B; Mon, 19 Sep 2022 14:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2EA5F804B4
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2EA5F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JN7q0ATf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663590114; x=1695126114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xZ3P7jtQWF5nVsvGElyZKrwG1HWgkeSt6+/o4TG9gfQ=;
 b=JN7q0ATfbobNB5hC0Sswo25isJGRbTWs35T2yx8FPSYJ7GKYfhEp0pmk
 ynjOH3qqHEQjwZdm9wXBAlH7AuWAamJ2fs5DTAEUyxC4zeZalSkUgrH5Z
 QT+7w6HFOUj38AkocUgVV+dZrK2mpZT70qFR8jamxruefGNzKY7U5NdTv
 i5FsyPBAHw4PqH/HXDDITYPZhyeiNPKHXz5VCP+9LmZ+93xMVIN9O1kzX
 ebADWT1Ssv5ubFZXiBTg6eIp7BfQur4Fz1/uLeipB3G2RRNv4xcwdmou7
 bab1O12PXE7SZm4SWpuTdT2G3ZU9SWI2N7wn26y09yrhXsTl3KTh55zxF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="325675942"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="325675942"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:21:41 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="620837651"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:21:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ASoC: SOF: Intel: add HDA interrupt source tracing
Date: Mon, 19 Sep 2022 14:21:03 +0200
Message-Id: <20220919122108.43764-3-pierre-louis.bossart@linux.intel.com>
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

The Intel HDaudio controller relies on a single interrupt line which
wire-ORs multiple interrupt sources, such as stream, IPC, SoundWire and
wakes. This patch adds the ability to trace each event occurrence.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Noah Klayman <noah.klayman@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/trace/events/sof_intel.h | 34 ++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c        | 19 ++++++++++++++----
 2 files changed, 49 insertions(+), 4 deletions(-)
 create mode 100644 include/trace/events/sof_intel.h

diff --git a/include/trace/events/sof_intel.h b/include/trace/events/sof_intel.h
new file mode 100644
index 0000000000000..37a9b92d494ef
--- /dev/null
+++ b/include/trace/events/sof_intel.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ *
+ * Author: Noah Klayman <noah.klayman@intel.com>
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM sof_intel
+
+#if !defined(_TRACE_SOF_INTEL_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_SOF_INTEL_H
+#include <linux/tracepoint.h>
+#include "../../../sound/soc/sof/sof-audio.h"
+
+TRACE_EVENT(sof_intel_hda_irq,
+	TP_PROTO(struct snd_sof_dev *sdev, char *source),
+	TP_ARGS(sdev, source),
+	TP_STRUCT__entry(
+		__string(device_name, dev_name(sdev->dev))
+		__string(source, source)
+	),
+	TP_fast_assign(
+		__assign_str(device_name, dev_name(sdev->dev));
+		__assign_str(source, source);
+	),
+	TP_printk("device_name=%s source=%s",
+		  __get_str(device_name), __get_str(source))
+);
+
+#endif /* _TRACE_SOF_INTEL_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index dfb3b424fb5e3..eec54c8bb0e9a 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -31,6 +31,9 @@
 #include "../ops.h"
 #include "hda.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/sof_intel.h>
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 #include <sound/soc-acpi-intel-match.h>
 #endif
@@ -954,17 +957,25 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 	struct sof_intel_hda_dev *hdev = sdev->pdata->hw_pdata;
 
 	/* deal with streams and controller first */
-	if (hda_dsp_check_stream_irq(sdev))
+	if (hda_dsp_check_stream_irq(sdev)) {
+		trace_sof_intel_hda_irq(sdev, "stream");
 		hda_dsp_stream_threaded_handler(irq, sdev);
+	}
 
-	if (hda_check_ipc_irq(sdev))
+	if (hda_check_ipc_irq(sdev)) {
+		trace_sof_intel_hda_irq(sdev, "ipc");
 		sof_ops(sdev)->irq_thread(irq, sdev);
+	}
 
-	if (hda_dsp_check_sdw_irq(sdev))
+	if (hda_dsp_check_sdw_irq(sdev)) {
+		trace_sof_intel_hda_irq(sdev, "sdw");
 		hda_dsp_sdw_thread(irq, hdev->sdw);
+	}
 
-	if (hda_sdw_check_wakeen_irq(sdev))
+	if (hda_sdw_check_wakeen_irq(sdev)) {
+		trace_sof_intel_hda_irq(sdev, "wakeen");
 		hda_sdw_process_wakeen(sdev);
+	}
 
 	hda_check_for_state_change(sdev);
 
-- 
2.34.1

