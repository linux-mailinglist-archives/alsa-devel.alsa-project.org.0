Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C03C84DCCF5
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:53:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E35718DF;
	Thu, 17 Mar 2022 18:53:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E35718DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539632;
	bh=iA84qKSwThV4/LPQbLW0cH6iio1/WonLJ719lT3zsf4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OomeZeLMySc3mc5LGzedV4+yYrhKxJ3GuhwGpduy1sLN4ssgAbbBfeVZo4mqU/ZU+
	 90XGpRDFoxSxWouBPVPb7za2zK2epK3TBne+QUEoOmfpKGGZeh+9sycyCXg3TqM+G3
	 dDY3zCK0ayZY0y98S0D3Nm2f9x8aDAknHTS0rnaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFA26F80528;
	Thu, 17 Mar 2022 18:51:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C89CAF80524; Thu, 17 Mar 2022 18:51:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2F24F8023A
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2F24F8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DaGsNf7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539507; x=1679075507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iA84qKSwThV4/LPQbLW0cH6iio1/WonLJ719lT3zsf4=;
 b=DaGsNf7R84wx05CSes6PjOVo4mTfU+tZL7sZNEKUfmx9hOFDPcPzOnN1
 VuxJG7WeMv7bXzw/RmOcmWJKgS+x6+uqrFO59dvF985gG5ktsQDoX5gki
 Umuy0Ghv65y9ngLnhHcQ+q+wQb8+cEBJd8+Y83FwUpo3SL5NZvReIznpU
 36vDfBEEg3EcS6Qc6MAxREzxCX3RD2MQbziUN5ftEGp+0BcjSLj88Dhuj
 ttm2cK8Aj6KnkC+33J3H0Co563SSCGf/SFl8GsnsW5RykVTUBiHUDMhiD
 Yn3dTMlMBD5qrvHvGAcPoPL+0uxMO97mkWlByxHxW7Op5Je1Glxel5bWT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492900"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492900"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431113"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:21 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/19] ASoC: SOF: Make sof_suspend/resume IPC agnostic
Date: Thu, 17 Mar 2022 10:50:28 -0700
Message-Id: <20220317175044.1752400-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Add a new set of IPC ops for PM with the ctx_save and ctx_restore ops
for suspend/resume and implement the ops for IPC3.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/Makefile        |  2 +-
 sound/soc/sof/ipc.c           |  1 +
 sound/soc/sof/ipc3-ops.h      | 19 +++++++++++
 sound/soc/sof/ipc3-topology.c |  7 ++--
 sound/soc/sof/ipc3.c          | 44 ++++++++++++++++++++++++
 sound/soc/sof/pm.c            | 63 ++++++++++++++---------------------
 sound/soc/sof/sof-priv.h      | 14 ++++++--
 7 files changed, 104 insertions(+), 46 deletions(-)
 create mode 100644 sound/soc/sof/ipc3-ops.h
 create mode 100644 sound/soc/sof/ipc3.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index e13dab59764c..59482903a243 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -2,7 +2,7 @@
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o\
-		ipc3-topology.o
+		ipc3-topology.o ipc3.o
 ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
 snd-sof-objs += sof-client.o
 endif
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 19a294cbbb8d..46a989be9a82 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -17,6 +17,7 @@
 #include "sof-priv.h"
 #include "sof-audio.h"
 #include "ops.h"
+#include "ipc3-ops.h"
 
 typedef void (*ipc_rx_callback)(struct snd_sof_dev *sdev, void *msg_buf);
 
diff --git a/sound/soc/sof/ipc3-ops.h b/sound/soc/sof/ipc3-ops.h
new file mode 100644
index 000000000000..5d8cab92c1a4
--- /dev/null
+++ b/sound/soc/sof/ipc3-ops.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ *
+ * Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_SOF_IPC3_OPS_H
+#define __SOUND_SOC_SOF_IPC3_OPS_H
+
+#include "sof-priv.h"
+
+extern const struct sof_ipc_tplg_ops ipc3_tplg_ops;
+extern const struct sof_ipc_ops ipc3_ops;
+
+#endif
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 8d08ffb37008..bf0cf38f4524 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -11,6 +11,7 @@
 #include <sound/pcm_params.h>
 #include "sof-priv.h"
 #include "sof-audio.h"
+#include "ipc3-ops.h"
 #include "ops.h"
 
 /* Full volume for default values */
@@ -2152,7 +2153,7 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TY
 				 sof_ipc3_widget_bind_event},
 };
 
-static const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
+const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
 	.widget = tplg_ipc3_widget_ops,
 	.route_setup = sof_ipc3_route_setup,
 	.control_setup = sof_ipc3_control_setup,
@@ -2163,7 +2164,3 @@ static const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
 	.widget_setup = sof_ipc3_widget_setup,
 	.dai_config = sof_ipc3_dai_config,
 };
-
-const struct sof_ipc_ops ipc3_ops = {
-	.tplg = &ipc3_tplg_ops,
-};
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
new file mode 100644
index 000000000000..e71cf30908c6
--- /dev/null
+++ b/sound/soc/sof/ipc3.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+//
+
+#include "sof-priv.h"
+#include "ipc3-ops.h"
+
+static int sof_ipc3_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
+{
+	struct sof_ipc_pm_ctx pm_ctx = {
+		.hdr.size = sizeof(pm_ctx),
+		.hdr.cmd = SOF_IPC_GLB_PM_MSG | cmd,
+	};
+	struct sof_ipc_reply reply;
+
+	/* send ctx save ipc to dsp */
+	return sof_ipc_tx_message(sdev->ipc, pm_ctx.hdr.cmd, &pm_ctx,
+				  sizeof(pm_ctx), &reply, sizeof(reply));
+}
+
+static int sof_ipc3_ctx_save(struct snd_sof_dev *sdev)
+{
+	return sof_ipc3_ctx_ipc(sdev, SOF_IPC_PM_CTX_SAVE);
+}
+
+static int sof_ipc3_ctx_restore(struct snd_sof_dev *sdev)
+{
+	return sof_ipc3_ctx_ipc(sdev, SOF_IPC_PM_CTX_RESTORE);
+}
+
+static const struct sof_ipc_pm_ops ipc3_pm_ops = {
+	.ctx_save = sof_ipc3_ctx_save,
+	.ctx_restore = sof_ipc3_ctx_restore,
+};
+
+const struct sof_ipc_ops ipc3_ops = {
+	.tplg = &ipc3_tplg_ops,
+	.pm = &ipc3_pm_ops,
+};
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 7300ecadabd9..10adbbd0a9cd 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -48,22 +48,6 @@ static u32 snd_sof_dsp_power_target(struct snd_sof_dev *sdev)
 	return target_dsp_state;
 }
 
-static int sof_send_pm_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
-{
-	struct sof_ipc_pm_ctx pm_ctx;
-	struct sof_ipc_reply reply;
-
-	memset(&pm_ctx, 0, sizeof(pm_ctx));
-
-	/* configure ctx save ipc message */
-	pm_ctx.hdr.size = sizeof(pm_ctx);
-	pm_ctx.hdr.cmd = SOF_IPC_GLB_PM_MSG | cmd;
-
-	/* send ctx save ipc to dsp */
-	return sof_ipc_tx_message(sdev->ipc, pm_ctx.hdr.cmd, &pm_ctx,
-				 sizeof(pm_ctx), &reply, sizeof(reply));
-}
-
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
 static void sof_cache_debugfs(struct snd_sof_dev *sdev)
 {
@@ -86,6 +70,7 @@ static void sof_cache_debugfs(struct snd_sof_dev *sdev)
 static int sof_resume(struct device *dev, bool runtime_resume)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
 	u32 old_state = sdev->dsp_power_state.state;
 	int ret;
 
@@ -171,11 +156,11 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	sof_resume_clients(sdev);
 
 	/* notify DSP of system resume */
-	ret = sof_send_pm_ctx_ipc(sdev, SOF_IPC_PM_CTX_RESTORE);
-	if (ret < 0)
-		dev_err(sdev->dev,
-			"error: ctx_restore ipc error during resume %d\n",
-			ret);
+	if (pm_ops && pm_ops->ctx_restore) {
+		ret = pm_ops->ctx_restore(sdev);
+		if (ret < 0)
+			dev_err(sdev->dev, "ctx_restore IPC error during resume: %d\n", ret);
+	}
 
 	return ret;
 }
@@ -183,6 +168,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 static int sof_suspend(struct device *dev, bool runtime_suspend)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
 	pm_message_t pm_state;
 	u32 target_state = 0;
 	int ret;
@@ -232,21 +218,20 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		sof_cache_debugfs(sdev);
 #endif
 	/* notify DSP of upcoming power down */
-	ret = sof_send_pm_ctx_ipc(sdev, SOF_IPC_PM_CTX_SAVE);
-	if (ret == -EBUSY || ret == -EAGAIN) {
-		/*
-		 * runtime PM has logic to handle -EBUSY/-EAGAIN so
-		 * pass these errors up
-		 */
-		dev_err(sdev->dev,
-			"error: ctx_save ipc error during suspend %d\n",
-			ret);
-		return ret;
-	} else if (ret < 0) {
-		/* FW in unexpected state, continue to power down */
-		dev_warn(sdev->dev,
-			 "ctx_save ipc error %d, proceeding with suspend\n",
-			 ret);
+	if (pm_ops && pm_ops->ctx_save) {
+		ret = pm_ops->ctx_save(sdev);
+		if (ret == -EBUSY || ret == -EAGAIN) {
+			/*
+			 * runtime PM has logic to handle -EBUSY/-EAGAIN so
+			 * pass these errors up
+			 */
+			dev_err(sdev->dev, "ctx_save IPC error during suspend: %d\n", ret);
+			return ret;
+		} else if (ret < 0) {
+			/* FW in unexpected state, continue to power down */
+			dev_warn(sdev->dev, "ctx_save IPC error: %d, proceeding with suspend\n",
+				 ret);
+		}
 	}
 
 suspend:
@@ -278,9 +263,11 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 
 int snd_sof_dsp_power_down_notify(struct snd_sof_dev *sdev)
 {
+	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
+
 	/* Notify DSP of upcoming power down */
-	if (sof_ops(sdev)->remove)
-		return sof_send_pm_ctx_ipc(sdev, SOF_IPC_PM_CTX_SAVE);
+	if (sof_ops(sdev)->remove && pm_ops && pm_ops->ctx_save)
+		return pm_ops->ctx_save(sdev);
 
 	return 0;
 }
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 0b89c3e6ef21..3e883044dd0f 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -360,18 +360,28 @@ struct snd_sof_ipc_msg {
 	bool ipc_complete;
 };
 
+/**
+ * struct sof_ipc_pm_ops - IPC-specific PM ops
+ * @ctx_save:		Function pointer for context save
+ * @ctx_restore:	Function pointer for context restore
+ */
+struct sof_ipc_pm_ops {
+	int (*ctx_save)(struct snd_sof_dev *sdev);
+	int (*ctx_restore)(struct snd_sof_dev *sdev);
+};
+
 struct sof_ipc_tplg_ops;
 
 /**
  * struct sof_ipc_ops - IPC-specific ops
  * @tplg:	Pointer to IPC-specific topology ops
+ * @pm:		Pointer to PM ops
  */
 struct sof_ipc_ops {
 	const struct sof_ipc_tplg_ops *tplg;
+	const struct sof_ipc_pm_ops *pm;
 };
 
-extern const struct sof_ipc_ops ipc3_ops;
-
 /* SOF generic IPC data */
 struct snd_sof_ipc {
 	struct snd_sof_dev *sdev;
-- 
2.25.1

