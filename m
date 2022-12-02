Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D49B864090E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:13:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 746C81838;
	Fri,  2 Dec 2022 16:13:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 746C81838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994033;
	bh=s8KMcSpU6HrAu8jVF5As6s3An6fGGQguSqLMw/07Shc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dqdt/VylckRZQRlT7+YWy6U8Qjnxg601CQbpltf4c59OpwFOTd3Ag4pF+XuT7tD/y
	 VHKb1H4v/Eq1pi8GnklDh/AHurfaP1xury3kc3pBcP/3gIUvWw/kMWwEO1ZPO37SvL
	 04/NvEy+1YRliB6IFuZr4jiPOvhCkmQDqq7QQlRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9312F80567;
	Fri,  2 Dec 2022 16:11:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04A1AF80567; Fri,  2 Dec 2022 16:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49B82F80567
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49B82F80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XvZCvgt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993908; x=1701529908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8KMcSpU6HrAu8jVF5As6s3An6fGGQguSqLMw/07Shc=;
 b=XvZCvgt75YB2QrphMRoDI07BkAbqDYUIsgRQvPj1tvj9fX69aMyh9ZGE
 Gfv9c/YUA15cmGiGlVUvfGHAzIUjR65fSWAjZ2c7LJXS1zWhYJFRlvNuA
 fkthbDrysRBsWLJ27zGSwhJqOEf3iAew9DQ0bq22RIjzgnKf9FEZQEU1t
 /YIzAH/GqeEaUWCmeT6mkpPJIF+NOd9oghKLgDvfB0OYRJCvyqGzhgfj1
 R3Nnp/NLjxgd08GdZlaKvTkXcoqKd1FD3TAC3m/zAFUlv+mcimN4e+Q3i
 th6E6OyIrMJow2B1wFkBXGqaOxfdaRSkXwHd2ZrRazpibGN3aLVRHZRnt A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251760"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251760"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504703"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504703"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:11:43 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 06/16] ASoC: Intel: avs: Introduce debug-context aware
 helpers
Date: Fri,  2 Dec 2022 16:28:31 +0100
Message-Id: <20221202152841.672536-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Debug-related fields and log-dumping are useful when debugfs is enabled.
Define them under CONFIG_DEBUG_FS and provide stubs when the config is
disabled so that the code that makes use of these needs not to be
complicated unnecessarily.

Members that are duplicated by this patch will be removed by the follow
up changes.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile  |  4 ++++
 sound/soc/intel/avs/avs.h     | 29 +++++++++++++++++++++++++++++
 sound/soc/intel/avs/debugfs.c | 28 ++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)
 create mode 100644 sound/soc/intel/avs/debugfs.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 919212825f21..a211a0b7b4a8 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -9,6 +9,10 @@ snd-soc-avs-objs += trace.o
 # tell define_trace.h where to find the trace header
 CFLAGS_trace.o := -I$(src)
 
+ifneq ($(CONFIG_DEBUG_FS),)
+snd-soc-avs-objs += debugfs.o
+endif
+
 obj-$(CONFIG_SND_SOC_INTEL_AVS) += snd-soc-avs.o
 
 # Machine support
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 957151ecf39a..3687d03f87d4 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -9,6 +9,7 @@
 #ifndef __SOUND_SOC_INTEL_AVS_H
 #define __SOUND_SOC_INTEL_AVS_H
 
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/firmware.h>
 #include <linux/kfifo.h>
@@ -146,6 +147,14 @@ struct avs_dev {
 	struct mutex path_mutex;
 
 	struct avs_debug dbg;
+	spinlock_t trace_lock;	/* serialize debug window I/O between each LOG_BUFFER_STATUS */
+#ifdef CONFIG_DEBUG_FS
+	struct kfifo trace_fifo;
+	wait_queue_head_t trace_waitq;
+	u32 aging_timer_period;
+	u32 fifo_full_timer_period;
+	u32 logged_resources;	/* context dependent: core or library */
+#endif
 };
 
 /* from hda_bus to avs_dev */
@@ -366,4 +375,24 @@ struct apl_log_buffer_layout {
 #define apl_log_payload_addr(addr) \
 	(addr + sizeof(struct apl_log_buffer_layout))
 
+#ifdef CONFIG_DEBUG_FS
+bool avs_logging_fw(struct avs_dev *adev);
+void avs_dump_fw_log(struct avs_dev *adev, const void __iomem *src, unsigned int len);
+void avs_dump_fw_log_wakeup(struct avs_dev *adev, const void __iomem *src, unsigned int len);
+#else
+static inline bool avs_logging_fw(struct avs_dev *adev)
+{
+	return false;
+}
+
+static inline void avs_dump_fw_log(struct avs_dev *adev, const void __iomem *src, unsigned int len)
+{
+}
+
+static inline void
+avs_dump_fw_log_wakeup(struct avs_dev *adev, const void __iomem *src, unsigned int len)
+{
+}
+#endif
+
 #endif /* __SOUND_SOC_INTEL_AVS_H */
diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
new file mode 100644
index 000000000000..ac3889e21542
--- /dev/null
+++ b/sound/soc/intel/avs/debugfs.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include <linux/debugfs.h>
+#include <linux/kfifo.h>
+#include <linux/wait.h>
+#include "avs.h"
+
+bool avs_logging_fw(struct avs_dev *adev)
+{
+	return kfifo_initialized(&adev->trace_fifo);
+}
+
+void avs_dump_fw_log(struct avs_dev *adev, const void __iomem *src, unsigned int len)
+{
+	__kfifo_fromio(&adev->trace_fifo, src, len);
+}
+
+void avs_dump_fw_log_wakeup(struct avs_dev *adev, const void __iomem *src, unsigned int len)
+{
+	avs_dump_fw_log(adev, src, len);
+	wake_up(&adev->trace_waitq);
+}
-- 
2.25.1

