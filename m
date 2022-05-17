Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7D52A94D
	for <lists+alsa-devel@lfdr.de>; Tue, 17 May 2022 19:33:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95144846;
	Tue, 17 May 2022 19:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95144846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652808800;
	bh=/Vv8XGF1NSCCJ5jrBXOf8J+MNxYVT84VrbiZ8fsqUgI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M7OKz2Uhcsve1s57VXA25hmlQ9cwEiq7eaMkgRcNqlM1WPr13e52jJ4aRniPVwxA3
	 n2OETOiJYi1MOzGs6EFQJgJuXEUJCeTRXqU4gRijzukvNYRFtFF6atwBw3M9DDbtLW
	 OHxDi/uvXqipxeLeXV8FD2JHYVo/1x/zpx7AcHyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AC29F802DB;
	Tue, 17 May 2022 19:31:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B4F1F804BC; Tue, 17 May 2022 19:31:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FD6CF800F0
 for <alsa-devel@alsa-project.org>; Tue, 17 May 2022 19:31:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FD6CF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hj2D9Ts9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652808708; x=1684344708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Vv8XGF1NSCCJ5jrBXOf8J+MNxYVT84VrbiZ8fsqUgI=;
 b=Hj2D9Ts9ug0FAonzS3YoFllwKK+O9w3mJPESy348c+zBddHuCGzLq7it
 6FH/SStjj0dGXf0ZDKe4a3oNpgn2v/WVSupZ8cji5ScOCR3O67Yk+ly7p
 8g4ea+aBXiIZL36NLpPsyNO4mdGri6uWcL2/begG16wISYxfBzI03dnTD
 uJouWwZwm9woENFKCU2ZJ//8IqUUVkW2Z37rvyE2nyI12iG0AgRsjNjcB
 LTeqMQEL6XVLZtoUNeX3qTZaGZcsWQvPMkL9P4J+3CWxd5ssROK6DDNGP
 pl5JgkXGTUDY6XRKuN1PFDvBonuAR7qy0I+NzDTGIu6uWMCDl9pE032cW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="258824305"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="258824305"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:31:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; d="scan'208";a="672959368"
Received: from sfilary-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.67.235])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2022 10:31:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: mediatek: Add mediatek common debug dump
Date: Tue, 17 May 2022 12:31:08 -0500
Message-Id: <20220517173109.468568-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220517173109.468568-1-pierre-louis.bossart@linux.intel.com>
References: <20220517173109.468568-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 YC Hung <yc.hung@mediatek.com>
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

From: YC Hung <yc.hung@mediatek.com>

1.Add mtk-adsp-common.c file for mediatek platforms common usage.
2.Add mtk_adsp_dump implementation in mtk-adsp-common.c for general
  debug dump.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/Makefile          |  1 +
 sound/soc/sof/mediatek/mtk-adsp-common.c | 84 ++++++++++++++++++++++++
 sound/soc/sof/mediatek/mtk-adsp-common.h | 10 +++
 3 files changed, 95 insertions(+)
 create mode 100644 sound/soc/sof/mediatek/mtk-adsp-common.c
 create mode 100644 sound/soc/sof/mediatek/mtk-adsp-common.h

diff --git a/sound/soc/sof/mediatek/Makefile b/sound/soc/sof/mediatek/Makefile
index 6ca8b8201ed1a..29c5afb2f3d6f 100644
--- a/sound/soc/sof/mediatek/Makefile
+++ b/sound/soc/sof/mediatek/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+obj-$(CONFIG_SND_SOC_SOF_MTK_COMMON) += mtk-adsp-common.o
 obj-$(CONFIG_SND_SOC_SOF_MT8195) += mt8195/
 obj-$(CONFIG_SND_SOC_SOF_MT8186) += mt8186/
diff --git a/sound/soc/sof/mediatek/mtk-adsp-common.c b/sound/soc/sof/mediatek/mtk-adsp-common.c
new file mode 100644
index 0000000000000..1e0769c668a7b
--- /dev/null
+++ b/sound/soc/sof/mediatek/mtk-adsp-common.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2022 MediaTek Inc. All rights reserved.
+//
+// Author: YC Hung <yc.hung@mediatek.com>
+
+/*
+ * Common helpers for the audio DSP on MediaTek platforms
+ */
+
+#include <linux/module.h>
+#include <sound/sof/xtensa.h>
+#include "../ops.h"
+#include "mtk-adsp-common.h"
+
+/**
+ * mtk_adsp_get_registers() - This function is called in case of DSP oops
+ * in order to gather information about the registers, filename and
+ * linenumber and stack.
+ * @sdev: SOF device
+ * @xoops: Stores information about registers.
+ * @panic_info: Stores information about filename and line number.
+ * @stack: Stores the stack dump.
+ * @stack_words: Size of the stack dump.
+ */
+static void mtk_adsp_get_registers(struct snd_sof_dev *sdev,
+				   struct sof_ipc_dsp_oops_xtensa *xoops,
+				   struct sof_ipc_panic_info *panic_info,
+				   u32 *stack, size_t stack_words)
+{
+	u32 offset = sdev->dsp_oops_offset;
+
+	/* first read registers */
+	sof_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
+
+	/* then get panic info */
+	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
+		dev_err(sdev->dev, "invalid header size 0x%x\n",
+			xoops->arch_hdr.totalsize);
+		return;
+	}
+	offset += xoops->arch_hdr.totalsize;
+	sof_mailbox_read(sdev, offset, panic_info, sizeof(*panic_info));
+
+	/* then get the stack */
+	offset += sizeof(*panic_info);
+	sof_mailbox_read(sdev, offset, stack, stack_words * sizeof(u32));
+}
+
+/**
+ * mtk_adsp_dump() - This function is called when a panic message is
+ * received from the firmware.
+ * @sdev: SOF device
+ * @flags: parameter not used but required by ops prototype
+ */
+void mtk_adsp_dump(struct snd_sof_dev *sdev, u32 flags)
+{
+	char *level = (flags & SOF_DBG_DUMP_OPTIONAL) ? KERN_DEBUG : KERN_ERR;
+	struct sof_ipc_dsp_oops_xtensa xoops;
+	struct sof_ipc_panic_info panic_info;
+	u32 stack[MTK_ADSP_STACK_DUMP_SIZE];
+	u32 status;
+
+	/* Get information about the panic status from the debug box area.
+	 * Compute the trace point based on the status.
+	 */
+	sof_mailbox_read(sdev, sdev->debug_box.offset + 0x4, &status, 4);
+
+	/* Get information about the registers, the filename and line
+	 * number and the stack.
+	 */
+	mtk_adsp_get_registers(sdev, &xoops, &panic_info, stack,
+			       MTK_ADSP_STACK_DUMP_SIZE);
+
+	/* Print the information to the console */
+	sof_print_oops_and_stack(sdev, level, status, status, &xoops, &panic_info,
+				 stack, MTK_ADSP_STACK_DUMP_SIZE);
+}
+EXPORT_SYMBOL(mtk_adsp_dump);
+
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/mediatek/mtk-adsp-common.h b/sound/soc/sof/mediatek/mtk-adsp-common.h
new file mode 100644
index 0000000000000..612cff1f38f70
--- /dev/null
+++ b/sound/soc/sof/mediatek/mtk-adsp-common.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+
+#ifndef __MEDIATEK_ADSP_COMMON_H__
+#define __MEDIATEK_ADSP_COMMON_H__
+
+#define EXCEPT_MAX_HDR_SIZE	0x400
+#define MTK_ADSP_STACK_DUMP_SIZE 32
+
+void mtk_adsp_dump(struct snd_sof_dev *sdev, u32 flags);
+#endif
-- 
2.30.2

