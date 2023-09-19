Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7785D7A5DCB
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:26:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFA66E0F;
	Tue, 19 Sep 2023 11:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFA66E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695115583;
	bh=cUik0QLNgNyDQyejINQEUBIQ/QhR03J9Fnfg4xoRZlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l8DR0n35nquaOFfvWAOYTSaLnWZJmrnlRaRVaM4NHR0W1I4jbJsiKlEk1gzpZXJV9
	 SSsclMVvn0pGA6CXQaWaEAakcE6SuMKFhshqBiGJdu+x5SfRZgL8ZRJdBFOD/DRl4g
	 GA1RWWIcs9hHl4z73y4+K4SNgnV1Ah7NDSJElvZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA4E9F805A9; Tue, 19 Sep 2023 11:24:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E81E5F801F5;
	Tue, 19 Sep 2023 11:24:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D01CCF8059F; Tue, 19 Sep 2023 11:24:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5297BF80125
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5297BF80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Pk345++z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695115463; x=1726651463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cUik0QLNgNyDQyejINQEUBIQ/QhR03J9Fnfg4xoRZlk=;
  b=Pk345++zbCJO43bSLsP0Rd2RLLSi52eld7RY1WfgOKcaf05x/GemjiqD
   wVRtyXTqIiY8RQLOvY3XlzgzVIlDPuqrXx6DdtivZWwqylQgupzhS3VBL
   MAtdxhaPtDiGfUQSPb+nyW7IAebrdUxsNiv+uOEcGvuoAjtSQIWz0mraK
   Ya1wozcjjcJK/zWNjWloAvgl3SUksA0jSz7y9FsElLAHMQtCEwSVFgGW/
   MtB9ClUPhFXrfralKFTKnccsLJJ3mjsm4oAYGcbPHcwxDbpQ3l/Vpto02
   5PNBfuVDWHOvPJifJHM/uJMGiWeHs8G8lD9EPrbiUabvuAP6Y2L/FyfTA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377205211"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="377205211"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861460251"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861460251"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.169])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:18 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH 4/9] ASoC: SOF: ipc4: add definition of telemetry slot for
 exception handling
Date: Tue, 19 Sep 2023 12:24:11 +0300
Message-ID: <20230919092416.4137-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
References: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KMHWKIFIHWWTGPQM52TC3MFM6IYH2LWO
X-Message-ID-Hash: KMHWKIFIHWWTGPQM52TC3MFM6IYH2LWO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KMHWKIFIHWWTGPQM52TC3MFM6IYH2LWO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Core dump includes hardware platform information, cpu registers and
exception call stack. FW saves core dump to telemetry slot in shared
memory window for host in the event of FW exception. This patch creates
exception node in debugfs for user to dump telemetry data.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/Makefile         |  2 +-
 sound/soc/sof/ipc4-telemetry.c | 95 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-telemetry.h | 73 ++++++++++++++++++++++++++
 3 files changed, 169 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/ipc4-telemetry.c
 create mode 100644 sound/soc/sof/ipc4-telemetry.h

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 744d40bd8c8b..42dc48e53964 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -10,7 +10,7 @@ snd-sof-objs +=	ipc3.o ipc3-loader.o ipc3-topology.o ipc3-control.o ipc3-pcm.o\
 endif
 ifneq ($(CONFIG_SND_SOC_SOF_INTEL_IPC4),)
 snd-sof-objs += ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o ipc4-pcm.o\
-		ipc4-mtrace.o
+		ipc4-mtrace.o ipc4-telemetry.o
 endif
 
 # SOF client support
diff --git a/sound/soc/sof/ipc4-telemetry.c b/sound/soc/sof/ipc4-telemetry.c
new file mode 100644
index 000000000000..ec4ae9674364
--- /dev/null
+++ b/sound/soc/sof/ipc4-telemetry.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018-2023 Intel Corporation. All rights reserved.
+//
+
+#include <linux/debugfs.h>
+#include <linux/io.h>
+#include <linux/pm_runtime.h>
+#include <sound/sof/debug.h>
+#include <sound/sof/ipc4/header.h>
+#include "sof-priv.h"
+#include "ops.h"
+#include "ipc4-telemetry.h"
+#include "ipc4-priv.h"
+
+static void __iomem *sof_ipc4_query_exception_address(struct snd_sof_dev *sdev)
+{
+	u32 type = SOF_IPC4_DEBUG_SLOT_TELEMETRY;
+	size_t telemetry_slot_offset;
+	u32 offset;
+
+	telemetry_slot_offset = sof_ipc4_find_debug_slot_offset_by_type(sdev, type);
+	if (!telemetry_slot_offset)
+		return NULL;
+
+	/* skip the first separator magic number */
+	offset = telemetry_slot_offset + sizeof(u32);
+
+	return sdev->bar[sdev->mailbox_bar] + offset;
+}
+
+static ssize_t sof_telemetry_entry_read(struct file *file, char __user *buffer,
+					size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	void __iomem *io_addr;
+	loff_t pos = *ppos;
+	size_t size_ret;
+	u8 *buf;
+
+	if (pos < 0)
+		return -EINVAL;
+	/* skip the first separator magic number */
+	if (pos >= SOF_IPC4_DEBUG_SLOT_SIZE - 4 || !count)
+		return 0;
+	if (count > SOF_IPC4_DEBUG_SLOT_SIZE - 4 - pos)
+		count = SOF_IPC4_DEBUG_SLOT_SIZE - 4 - pos;
+
+	io_addr = sof_ipc4_query_exception_address(sdev);
+	if (!io_addr)
+		return -EFAULT;
+
+	buf = kzalloc(SOF_IPC4_DEBUG_SLOT_SIZE - 4, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy_fromio(buf, io_addr, SOF_IPC4_DEBUG_SLOT_SIZE - 4);
+	size_ret = copy_to_user(buffer, buf + pos, count);
+	if (size_ret) {
+		kfree(buf);
+		return -EFAULT;
+	}
+
+	*ppos = pos + count;
+	kfree(buf);
+
+	return count;
+}
+
+static const struct file_operations sof_telemetry_fops = {
+	.open = simple_open,
+	.read = sof_telemetry_entry_read,
+};
+
+void sof_ipc4_create_exception_debugfs_node(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_dfsentry *dfse;
+
+	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
+	if (!dfse)
+		return;
+
+	dfse->type = SOF_DFSENTRY_TYPE_IOMEM;
+	dfse->size = SOF_IPC4_DEBUG_SLOT_SIZE - 4;
+	dfse->access_type = SOF_DEBUGFS_ACCESS_ALWAYS;
+	dfse->sdev = sdev;
+
+	list_add(&dfse->list, &sdev->dfsentry_list);
+
+	debugfs_create_file("exception", 0444, sdev->debugfs_root, dfse, &sof_telemetry_fops);
+}
diff --git a/sound/soc/sof/ipc4-telemetry.h b/sound/soc/sof/ipc4-telemetry.h
new file mode 100644
index 000000000000..ab3599e3d87d
--- /dev/null
+++ b/sound/soc/sof/ipc4-telemetry.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __SOUND_SOC_SOF_IPC4_TELEMETRY_H
+#define __SOUND_SOC_SOF_IPC4_TELEMETRY_H
+
+/* Target code */
+enum sof_ipc4_coredump_tgt_code {
+	COREDUMP_TGT_UNKNOWN = 0,
+	COREDUMP_TGT_X86,
+	COREDUMP_TGT_X86_64,
+	COREDUMP_TGT_ARM_CORTEX_M,
+	COREDUMP_TGT_RISC_V,
+	COREDUMP_TGT_XTENSA,
+};
+
+#define COREDUMP_ARCH_HDR_ID 'A'
+#define COREDUMP_HDR_ID0 'Z'
+#define COREDUMP_HDR_ID1 'E'
+
+#define XTENSA_BLOCK_HDR_VER		2
+#define XTENSA_CORE_DUMP_SEPARATOR	0x0DEC0DEB
+#define XTENSA_CORE_AR_REGS_COUNT	16
+#define XTENSA_SOC_INTEL_ADSP		3
+#define XTENSA_TOOL_CHAIN_ZEPHYR	1
+#define XTENSA_TOOL_CHAIN_XCC		2
+
+/* Coredump header */
+struct sof_ipc4_coredump_hdr {
+	/* 'Z', 'E' as identifier of file */
+	char id[2];
+
+	/* Identify the version of the header */
+	u16 hdr_version;
+
+	/* Indicate which target (e.g. architecture or SoC) */
+	u16 tgt_code;
+
+	/* Size of uintptr_t in power of 2. (e.g. 5 for 32-bit, 6 for 64-bit) */
+	u8 ptr_size_bits;
+
+	u8 flag;
+
+	/* Reason for the fatal error */
+	u32 reason;
+} __packed;
+
+/* Architecture-specific block header */
+struct sof_ipc4_coredump_arch_hdr {
+	/* COREDUMP_ARCH_HDR_ID to indicate this is a architecture-specific block */
+	char id;
+
+	/* Identify the version of this block */
+	u16 hdr_version;
+
+	/* Number of bytes following the header */
+	u16 num_bytes;
+} __packed;
+
+struct sof_ipc4_telemetry_slot_data {
+	u32 separator;
+	struct sof_ipc4_coredump_hdr hdr;
+	struct sof_ipc4_coredump_arch_hdr arch_hdr;
+	u32 arch_data[];
+} __packed;
+
+void sof_ipc4_create_exception_debugfs_node(struct snd_sof_dev *sdev);
+#endif
-- 
2.42.0

