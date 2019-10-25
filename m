Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B03E56B1
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:52:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E734192D;
	Sat, 26 Oct 2019 00:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E734192D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572043973;
	bh=QL7nunT1p+QYYKOuhlQ6WfhgdYi1fzgle4ef2encs7s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pTxfdUUqEZKi7xHfF6wUH3w+oWbJbJJUXIJO4SlBfIUKV68j+DSUZt8tkOf2sZ7Fu
	 SbhdtRrrSmZNJUvEVZIrSrO0SQnL+iWFYSH4m1SLwXuoT7of4MD1LceICbTWWr3V+N
	 XrS1aOF8UiO7MBK9xL7o1/rQZDgNA0+qauTS+CtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4883F80726;
	Sat, 26 Oct 2019 00:42:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F64BF8063E; Sat, 26 Oct 2019 00:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B485F80610
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B485F80610
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458218"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:41:11 -0500
Message-Id: <20191025224122.7718-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 15/26] ASoC: SOF: Intel: HDA: add cAVS specific
	compact IPC header file
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Keyon Jie <yang.jie@linux.intel.com>

On cAVS platforms, some IPCs are required to be sent via IPC registers
only(e.g. when in D0i3, mailbox is unaccessible), add hda-ipc.h to hold
definition of those compact IPCs.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-ipc.h | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 sound/soc/sof/intel/hda-ipc.h

diff --git a/sound/soc/sof/intel/hda-ipc.h b/sound/soc/sof/intel/hda-ipc.h
new file mode 100644
index 000000000000..aef0ceac9803
--- /dev/null
+++ b/sound/soc/sof/intel/hda-ipc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2019 Intel Corporation. All rights reserved.
+ *
+ * Author: Keyon Jie <yang.jie@linux.intel.com>
+ */
+
+#ifndef __SOF_INTEL_HDA_IPC_H
+#define __SOF_INTEL_HDA_IPC_H
+
+/*
+ * Primary register, mapped to
+ * - DIPCTDR (HIPCIDR) in sideband IPC (cAVS 1.8+)
+ * - DIPCT in cAVS 1.5 IPC
+ *
+ * Secondary register, mapped to:
+ * - DIPCTDD (HIPCIDD) in sideband IPC (cAVS 1.8+)
+ * - DIPCTE in cAVS 1.5 IPC
+ */
+
+/* Common bits in primary register */
+
+/* Reserved for doorbell */
+#define HDA_IPC_RSVD_31		BIT(31)
+/* Target, 0 - normal message, 1 - compact message(cAVS compatible) */
+#define HDA_IPC_MSG_COMPACT	BIT(30)
+/* Direction, 0 - request, 1 - response */
+#define HDA_IPC_RSP		BIT(29)
+
+#define HDA_IPC_TYPE_SHIFT	24
+#define HDA_IPC_TYPE_MASK	GENMASK(28, 24)
+#define HDA_IPC_TYPE(x)		((x) << HDA_IPC_TYPE_SHIFT)
+
+#define HDA_IPC_PM_GATE		HDA_IPC_TYPE(0x8U)
+
+/* Command specific payload bits in secondary register */
+
+/* Disable DMA tracing (0 - keep tracing, 1 - to disable DMA trace) */
+#define HDA_PM_NO_DMA_TRACE	BIT(4)
+/* Prevent clock gating (0 - cg allowed, 1 - DSP clock always on) */
+#define HDA_PM_PCG		BIT(3)
+/* Prevent power gating (0 - deep power state transitions allowed) */
+#define HDA_PM_PPG		BIT(2)
+/* Indicates whether streaming is active */
+#define HDA_PM_PG_STREAMING	BIT(1)
+#define HDA_PM_PG_RSVD		BIT(0)
+
+#endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
