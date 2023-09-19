Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C947A5DDA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:27:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79ADAAE8;
	Tue, 19 Sep 2023 11:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79ADAAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695115634;
	bh=LHAGRTyXyRn/oFHcXiDDku5/WS7ZE3y+c0bSzckfIWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VN7q13RWcbKZ+jO/PPr7hgU6enHfYZK/V07qvpi/p/DUy/bzeHd9yTzh7Yq9yOEQd
	 S7h2i9M7Vd84rsLZ26nLlgiNJajqkkjHgJK4iJ9xeRkR7Pen9ojXiTeDq0/PBb+wfB
	 BVp+7R/zBUeSgcNwq5XtWBbgbZqbkiYJuEazwtM4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B175F805C8; Tue, 19 Sep 2023 11:24:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 849D4F805C0;
	Tue, 19 Sep 2023 11:24:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11011F805AD; Tue, 19 Sep 2023 11:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C457F80579
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C457F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PmcWYxiS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695115468; x=1726651468;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LHAGRTyXyRn/oFHcXiDDku5/WS7ZE3y+c0bSzckfIWw=;
  b=PmcWYxiSOIy4vGIamCXcfScp2GZJ+KEq5+XCDsXPxMkV9mEsaTkc76fm
   VvXHEAvLtNHJAtm1HOrbqdyS0lrs7rzAj3E5S9eEc8kJVvW7RHp+kqeyE
   G4sFksTKQEe5fCdmBx4+It6yIfPzzanhLN6LXIrPfO0lOLS/ImkwGGYKX
   6Sep5xl4sDhMr2md01NaspM/etb4b4mStBWN/s8WOpKnDXk9doj2SiwPy
   dXnCjg62yVCvRqXjEfhcFh+Aaa6bSnEo/NNDJ0mRVe2ds8tyts03v1PWt
   HjGkGghEUFB4dUhf27Xq0bxTrdeilxGhedZsKx8X/ttsSRod07gAggQfV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377205253"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="377205253"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861460302"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861460302"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.169])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH 6/9] ASoC: SOF: Intel: add telemetry retrieval support on
 Intel platforms
Date: Tue, 19 Sep 2023 12:24:13 +0300
Message-ID: <20230919092416.4137-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
References: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5JAMUEXJC62XDIQCLS5EDQUIPZO23HOF
X-Message-ID-Hash: 5JAMUEXJC62XDIQCLS5EDQUIPZO23HOF
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JAMUEXJC62XDIQCLS5EDQUIPZO23HOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Telemetry data is decoded based on intel xtensa design and printed in
kernel log by sof debug framework.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/Makefile    |  3 +-
 sound/soc/sof/intel/telemetry.c | 95 +++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/telemetry.h | 35 ++++++++++++
 3 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/intel/telemetry.c
 create mode 100644 sound/soc/sof/intel/telemetry.h

diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index 030574dbc998..6489d0660d58 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -7,7 +7,8 @@ snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-dai-ops.o hda-bus.o \
 				 skl.o hda-loader-skl.o \
-				 apl.o cnl.o tgl.o icl.o mtl.o lnl.o hda-common-ops.o
+				 apl.o cnl.o tgl.o icl.o mtl.o lnl.o hda-common-ops.o \
+				 telemetry.o
 
 snd-sof-intel-hda-mlink-objs := hda-mlink.o
 
diff --git a/sound/soc/sof/intel/telemetry.c b/sound/soc/sof/intel/telemetry.c
new file mode 100644
index 000000000000..1a3b5c28a6f0
--- /dev/null
+++ b/sound/soc/sof/intel/telemetry.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2023 Intel Corporation. All rights reserved.
+
+/* telemetry data queried from debug window */
+
+#include <sound/sof/ipc4/header.h>
+#include <sound/sof/xtensa.h>
+#include "../ipc4-priv.h"
+#include "../sof-priv.h"
+#include "hda.h"
+#include "telemetry.h"
+
+void sof_ipc4_intel_dump_telemetry_state(struct snd_sof_dev *sdev, u32 flags)
+{
+	static const char invalid_slot_msg[] = "Core dump is not available due to";
+	struct sof_ipc4_telemetry_slot_data *telemetry_data;
+	struct sof_ipc_dsp_oops_xtensa *xoops;
+	struct xtensa_arch_block *block;
+	u32 slot_offset;
+	char *level;
+
+	level = (flags & SOF_DBG_DUMP_OPTIONAL) ? KERN_DEBUG : KERN_ERR;
+
+	slot_offset = sof_ipc4_find_debug_slot_offset_by_type(sdev, SOF_IPC4_DEBUG_SLOT_TELEMETRY);
+	if (!slot_offset)
+		return;
+
+	telemetry_data = kmalloc(sizeof(*telemetry_data), GFP_KERNEL);
+	if (!telemetry_data)
+		return;
+	sof_mailbox_read(sdev, slot_offset, telemetry_data, sizeof(*telemetry_data));
+	if (telemetry_data->separator != XTENSA_CORE_DUMP_SEPARATOR) {
+		dev_err(sdev->dev, "%s invalid separator %#x\n", invalid_slot_msg,
+			telemetry_data->separator);
+		goto free_telemetry_data;
+	}
+
+	block = kmalloc(sizeof(*block), GFP_KERNEL);
+	if (!block)
+		goto free_telemetry_data;
+
+	sof_mailbox_read(sdev, slot_offset + sizeof(*telemetry_data), block, sizeof(*block));
+	if (block->soc != XTENSA_SOC_INTEL_ADSP) {
+		dev_err(sdev->dev, "%s invalid SOC %d\n", invalid_slot_msg, block->soc);
+		goto free_block;
+	}
+
+	if (telemetry_data->hdr.id[0] != COREDUMP_HDR_ID0 ||
+	    telemetry_data->hdr.id[1] != COREDUMP_HDR_ID1 ||
+	    telemetry_data->arch_hdr.id != COREDUMP_ARCH_HDR_ID) {
+		dev_err(sdev->dev, "%s invalid coredump header %c%c, arch hdr %c\n",
+			invalid_slot_msg, telemetry_data->hdr.id[0],
+			telemetry_data->hdr.id[1],
+			telemetry_data->arch_hdr.id);
+		goto free_block;
+	}
+
+	switch (block->toolchain) {
+	case XTENSA_TOOL_CHAIN_ZEPHYR:
+		dev_printk(level, sdev->dev, "FW is built with Zephyr toolchain\n");
+		break;
+	case XTENSA_TOOL_CHAIN_XCC:
+		dev_printk(level, sdev->dev, "FW is built with XCC toolchain\n");
+		break;
+	default:
+		dev_printk(level, sdev->dev, "Unknown toolchain is used\n");
+		break;
+	}
+
+	xoops = kzalloc(struct_size(xoops, ar, XTENSA_CORE_AR_REGS_COUNT), GFP_KERNEL);
+	if (!xoops)
+		goto free_block;
+
+	xoops->exccause = block->exccause;
+	xoops->excvaddr = block->excvaddr;
+	xoops->epc1 = block->pc;
+	xoops->ps = block->ps;
+	xoops->sar = block->sar;
+
+	xoops->plat_hdr.numaregs = XTENSA_CORE_AR_REGS_COUNT;
+	memcpy((void *)xoops->ar, block->ar, XTENSA_CORE_AR_REGS_COUNT * sizeof(u32));
+
+	sof_oops(sdev, level, xoops);
+	sof_stack(sdev, level, xoops, NULL, 0);
+
+	kfree(xoops);
+free_block:
+	kfree(block);
+free_telemetry_data:
+	kfree(telemetry_data);
+}
diff --git a/sound/soc/sof/intel/telemetry.h b/sound/soc/sof/intel/telemetry.h
new file mode 100644
index 000000000000..3c2b23c75f5d
--- /dev/null
+++ b/sound/soc/sof/intel/telemetry.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ *
+ * telemetry data in debug windows
+ */
+
+#ifndef _SOF_INTEL_TELEMETRY_H
+#define _SOF_INTEL_TELEMETRY_H
+
+#include "../ipc4-telemetry.h"
+
+struct xtensa_arch_block {
+	u8	soc; /* should be equal to XTENSA_SOC_INTEL_ADSP */
+	u16	version;
+	u8	toolchain; /* ZEPHYR or XCC */
+
+	u32	pc;
+	u32	exccause;
+	u32	excvaddr;
+	u32	sar;
+	u32	ps;
+	u32	scompare1;
+	u32	ar[XTENSA_CORE_AR_REGS_COUNT];
+	u32	lbeg;
+	u32	lend;
+	u32	lcount;
+} __packed;
+
+void sof_ipc4_intel_dump_telemetry_state(struct snd_sof_dev *sdev, u32 flags);
+
+#endif /* _SOF_INTEL_TELEMETRY_H */
-- 
2.42.0

