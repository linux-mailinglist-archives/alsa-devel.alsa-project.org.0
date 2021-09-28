Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9802341A9AF
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 09:29:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FF2816A9;
	Tue, 28 Sep 2021 09:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FF2816A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632814195;
	bh=swuwvKRrSgwEcPRwRQta1gOo+IBRX3zIOq4YhZl9VmM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DAY3EbxF2fOmKpEThV0PDGONIYh9wRKPpdyBeT8OBH8LV5Sn3RkxgZa486V6ohDo4
	 YTCHUiixHuI/XWOIWFQqTxDeTFdTZ/YwD9dF7OWsedml2pHCGQiVJrKrmdKZ2PUkvv
	 nAzwZpaSXb5YtPF8MKH2qgAUtQ6DrHMBlD3lmwqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B835AF80105;
	Tue, 28 Sep 2021 09:28:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43814F804AD; Tue, 28 Sep 2021 09:28:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C22C8F80161
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 09:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C22C8F80161
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="224674207"
X-IronPort-AV: E=Sophos;i="5.85,328,1624345200"; d="scan'208";a="224674207"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 00:28:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,328,1624345200"; d="scan'208";a="553829580"
Received: from elisabal-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.220.25])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 00:28:03 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH] ASoC: SOF: imx: add header file for ops
Date: Tue, 28 Sep 2021 10:28:07 +0300
Message-Id: <20210928072807.27838-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 paul.olaru@oss.nxp.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Sparse (make C=2) complains about undeclared variables. Fix by adding
a real prototype instead of 'extern' in sof-of-dev.c

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/imx/imx-ops.h | 10 ++++++++++
 sound/soc/sof/imx/imx8.c    |  1 +
 sound/soc/sof/imx/imx8m.c   |  1 +
 sound/soc/sof/sof-of-dev.c  |  5 +----
 4 files changed, 13 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/sof/imx/imx-ops.h

diff --git a/sound/soc/sof/imx/imx-ops.h b/sound/soc/sof/imx/imx-ops.h
new file mode 100644
index 000000000000..24235ef8c8fa
--- /dev/null
+++ b/sound/soc/sof/imx/imx-ops.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+
+#ifndef __IMX_OPS_H__
+#define __IMX_OPS_H__
+
+extern struct snd_sof_dsp_ops sof_imx8_ops;
+extern struct snd_sof_dsp_ops sof_imx8x_ops;
+extern struct snd_sof_dsp_ops sof_imx8m_ops;
+
+#endif
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 82ca920a69ab..cf27ee66b577 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -22,6 +22,7 @@
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include "../ops.h"
 #include "imx-common.h"
+#include "imx-ops.h"
 
 /* DSP memories */
 #define IRAM_OFFSET		0x10000
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 76f4ffd9d540..932c0e73a8b0 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -18,6 +18,7 @@
 
 #include "../ops.h"
 #include "imx-common.h"
+#include "imx-ops.h"
 
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index d1a21edfa05d..f0f819a46456 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -11,10 +11,7 @@
 #include <sound/sof.h>
 
 #include "ops.h"
-
-extern struct snd_sof_dsp_ops sof_imx8_ops;
-extern struct snd_sof_dsp_ops sof_imx8x_ops;
-extern struct snd_sof_dsp_ops sof_imx8m_ops;
+#include "imx/imx-ops.h"
 
 /* platform specific devices */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
-- 
2.33.0

