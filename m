Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A01B263F64F
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Dec 2022 18:42:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FF2017A5;
	Thu,  1 Dec 2022 18:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FF2017A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669916543;
	bh=s8KMcSpU6HrAu8jVF5As6s3An6fGGQguSqLMw/07Shc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dPwYx2e1e579E/NhePEsJjX5J95ii15k3j5DcevC0jlTVZP1BREUP3CBkLwmrE7a5
	 Awxl02H+EQik8WzYjK6lby8r6pVFZmzj1+chu3JDYMyriIqBnHPyXfcyAVzNqLWwgW
	 39nVwK4bHXtnhmfsZHU8b5Ar12oRn06vS2/q7iSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93C1AF80558;
	Thu,  1 Dec 2022 18:39:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 510EBF80580; Thu,  1 Dec 2022 18:39:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADD02F80558
 for <alsa-devel@alsa-project.org>; Thu,  1 Dec 2022 18:39:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADD02F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="THUbjBlE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669916372; x=1701452372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8KMcSpU6HrAu8jVF5As6s3An6fGGQguSqLMw/07Shc=;
 b=THUbjBlEKnjqGq1G7wi2pbuuraoIc0ocwb0p2YKYhSWwlM0KggQeCpBR
 SuAr9+kkZVrlWqDsNpduGE9yy/YickETGio+B6w2euFchQU2u9vNu+Ghl
 SYkRwlRXs5l1PYMp0hvAVK7DbU/dkt/6Il1pLbkIukhENHXWRIoe3etFa
 zSkzuTY6A9CyYZMkepDs2kzvJxs/r7v654ca4PSyuYOZgelRDFIOQyC5l
 H0gf82g8a3a33/97+Ybvij763u7QGiweeFq9xI+UFQ2jYLYkYQX66xALS
 aPdCUw77KRFPhiQ11ABe7osx6QPoX2SBlUdf4rgH8xg/t3t7oud3NJxxa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="377908355"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="377908355"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2022 09:39:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="889823938"
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; d="scan'208";a="889823938"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 01 Dec 2022 09:39:27 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 06/16] ASoC: Intel: avs: Introduce debug-context aware helpers
Date: Thu,  1 Dec 2022 18:56:09 +0100
Message-Id: <20221201175619.504758-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221201175619.504758-1-cezary.rojewski@intel.com>
References: <20221201175619.504758-1-cezary.rojewski@intel.com>
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

