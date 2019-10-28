Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB437E748F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:11:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC0C1FD5;
	Mon, 28 Oct 2019 16:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC0C1FD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275503;
	bh=i8xh2uF4Kt6QYu2NEzHboTA3p7h0nMLDNDgslFJrvgU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eWidlgEPXUnpjN15DQzATaU4aP1UDuh6d/UDOjdw3IEmRwTSTz+MBX3v4QwWEH2sB
	 LHLrsqIO6O7lgGMx4E+Lm+cs9oG/K6mgTMTDK9eFyojUzhFdTzxlh9OaOBfMdTmDzZ
	 pL9ZtDsOBTqY3snbMCoibPBQGeDJStvQkYnCbU28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33FC7F8078F;
	Mon, 28 Oct 2019 15:57:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 692A6F80610; Mon, 28 Oct 2019 15:56:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 263DEF8060D
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 263DEF8060D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="X0bjjlSg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=RWV+gEKwoqTH5enpBK0Lw5IxQ+6+W8k93JJ4//Y+HJM=; b=X0bjjlSggj25
 5guYnVzkMy+tu+gsWvgp5Muad0Pa6KkM2ICOhlAAzLj5VdBG/ace+tyORC054IzoDLmEsSZm/IL+m
 KLFpDIi9Q3y4mWEMCqrLdVIZzDSgQJlwik3Yv0XQyzc/XZvtVV6dvmEcTlsLq3asNYE0k2+gkvznJ
 RcHOM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rc-0008P9-3X; Mon, 28 Oct 2019 14:56:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7F0A427403F6; Mon, 28 Oct 2019 14:56:30 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-16-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145630.7F0A427403F6@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:30 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: HDA: add cAVS specific
	compact IPC header file" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Intel: HDA: add cAVS specific compact IPC header file

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 5056193d4d1a8b73087145add21141c46027d6a2 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:11 -0500
Subject: [PATCH] ASoC: SOF: Intel: HDA: add cAVS specific compact IPC header
 file

On cAVS platforms, some IPCs are required to be sent via IPC registers
only(e.g. when in D0i3, mailbox is unaccessible), add hda-ipc.h to hold
definition of those compact IPCs.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-16-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
