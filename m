Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A78525441E5
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:29:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19D622003;
	Thu,  9 Jun 2022 05:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19D622003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745351;
	bh=Fq6rcPvz1skCdsVPqDsNbGIAvnRPA8T0jg/5nrPi42g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fHVSZ9VoYQgUGnTQEW5TIGsUAio5jBie4klLIfWJZqqS2DJ78vMolI1kHBalstw13
	 drmMwiuLeFtHkOzOWYJCAzCPa5WUb/K9cuo6TVJ0AvDHMgMpIHoA23F/JIuGgZDX1G
	 Vu/iRjJmY4ZLakCFLhr+lcwUbp5OmVwaWtxhOvFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F229F80548;
	Thu,  9 Jun 2022 05:27:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 849C9F80539; Thu,  9 Jun 2022 05:27:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A2DEF804B4
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A2DEF804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DZbiuO5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745232; x=1686281232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fq6rcPvz1skCdsVPqDsNbGIAvnRPA8T0jg/5nrPi42g=;
 b=DZbiuO5mwa3p3ISMmv4feNcFnrJUsKLV2TXw8iwdoMlVYT5MryIj3SKW
 V9Jv1StG07FpeVI4D89QvQi1NcWweovK4WxDIsQBMKcKgQgEQ6MTIafY2
 MTYWH43x6hb4nq09ISryytmLukPSuz3iQUEr45zx36O/7DcPV72uRtjnH
 wuYUshbkh7NzerSCaBr1w3zMhkN8w+IbqoxNCPCplHLMstQbpzvXp/zOy
 HwquSunzgieRm2NSSuYJVdAdp3bD6mDxRa6BINSzq6rLF9r9xn7PnYULA
 Mk4o0exkrEE6a7tiBMJZXatiWNYqdb1ZcTzspMNEXCHbuiTrIsbdcS5CI Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219547"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219547"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260228"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:58 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/23] ASoC: SOF: IPC4: Introduce topology ops
Date: Wed,  8 Jun 2022 20:26:22 -0700
Message-Id: <20220609032643.916882-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Paul Olaru <paul.olaru@oss.nxp.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Introduce the topology ops for IPC4. Set the widget_ops and token_list
for parsing the scheduler type widget. Support for other widget types
will be added in the follow up patches.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
---
 sound/soc/sof/Makefile        |   2 +-
 sound/soc/sof/ipc4-priv.h     |   1 +
 sound/soc/sof/ipc4-topology.c | 102 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.h |  30 ++++++++++
 sound/soc/sof/ipc4.c          |   1 +
 5 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/ipc4-topology.c
 create mode 100644 sound/soc/sof/ipc4-topology.h

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 92b5e83601be..73524fadb3ce 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -4,7 +4,7 @@ snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o\
 		ipc3-topology.o ipc3-control.o ipc3.o ipc3-pcm.o ipc3-loader.o\
 		ipc3-dtrace.o\
-		ipc4.o ipc4-loader.o
+		ipc4.o ipc4-loader.o ipc4-topology.o
 ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
 snd-sof-objs += sof-client.o
 endif
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 2b71d5675933..5388b888fefa 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -40,5 +40,6 @@ struct sof_ipc4_fw_module {
 };
 
 extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
+extern const struct sof_ipc_tplg_ops ipc4_tplg_ops;
 
 #endif
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
new file mode 100644
index 000000000000..bccf576c8edd
--- /dev/null
+++ b/sound/soc/sof/ipc4-topology.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+//
+//
+#include <uapi/sound/sof/tokens.h>
+#include <sound/pcm_params.h>
+#include <sound/sof/ext_manifest4.h>
+#include "sof-priv.h"
+#include "sof-audio.h"
+#include "ipc4-priv.h"
+#include "ipc4-topology.h"
+#include "ops.h"
+
+static const struct sof_topology_token ipc4_sched_tokens[] = {
+	{SOF_TKN_SCHED_LP_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_pipeline, lp_mode)}
+};
+
+static const struct sof_topology_token pipeline_tokens[] = {
+	{SOF_TKN_SCHED_DYNAMIC_PIPELINE, SND_SOC_TPLG_TUPLE_TYPE_BOOL, get_token_u16,
+		offsetof(struct snd_sof_widget, dynamic_pipeline_widget)},
+};
+
+static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
+	[SOF_PIPELINE_TOKENS] = {"Pipeline tokens", pipeline_tokens, ARRAY_SIZE(pipeline_tokens)},
+	[SOF_SCHED_TOKENS] = {"Scheduler tokens", ipc4_sched_tokens,
+		ARRAY_SIZE(ipc4_sched_tokens)},
+};
+
+static void sof_ipc4_widget_free_comp(struct snd_sof_widget *swidget)
+{
+	kfree(swidget->private);
+}
+
+static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct sof_ipc4_pipeline *pipeline;
+	int ret;
+
+	pipeline = kzalloc(sizeof(*pipeline), GFP_KERNEL);
+	if (!pipeline)
+		return -ENOMEM;
+
+	ret = sof_update_ipc_object(scomp, pipeline, SOF_SCHED_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(*pipeline), 1);
+	if (ret) {
+		dev_err(scomp->dev, "parsing scheduler tokens failed\n");
+		goto err;
+	}
+
+	/* parse one set of pipeline tokens */
+	ret = sof_update_ipc_object(scomp, swidget, SOF_PIPELINE_TOKENS, swidget->tuples,
+				    swidget->num_tuples, sizeof(*swidget), 1);
+	if (ret) {
+		dev_err(scomp->dev, "parsing pipeline tokens failed\n");
+		goto err;
+	}
+
+	/* TODO: Get priority from topology */
+	pipeline->priority = 0;
+
+	dev_dbg(scomp->dev, "pipeline '%s': id %d pri %d lp mode %d\n",
+		swidget->widget->name, swidget->pipeline_id,
+		pipeline->priority, pipeline->lp_mode);
+
+	swidget->private = pipeline;
+
+	pipeline->msg.primary = SOF_IPC4_GLB_PIPE_PRIORITY(pipeline->priority);
+	pipeline->msg.primary |= SOF_IPC4_GLB_PIPE_INSTANCE_ID(swidget->pipeline_id);
+	pipeline->msg.primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_CREATE_PIPELINE);
+	pipeline->msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	pipeline->msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
+
+	pipeline->msg.extension = pipeline->lp_mode;
+	pipeline->state = SOF_IPC4_PIPE_UNINITIALIZED;
+
+	return 0;
+err:
+	kfree(pipeline);
+	return ret;
+}
+
+static enum sof_tokens pipeline_token_list[] = {
+	SOF_SCHED_TOKENS,
+	SOF_PIPELINE_TOKENS,
+};
+
+static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
+	[snd_soc_dapm_scheduler] = {sof_ipc4_widget_setup_comp_pipeline, sof_ipc4_widget_free_comp,
+				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL,
+				    NULL, NULL},
+};
+
+const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
+	.widget = tplg_ipc4_widget_ops,
+	.token_list = ipc4_token_list,
+};
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
new file mode 100644
index 000000000000..0e9be2b2d8a1
--- /dev/null
+++ b/sound/soc/sof/ipc4-topology.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_IPC4_TOPOLOGY_H__
+#define __INCLUDE_SOUND_SOF_IPC4_TOPOLOGY_H__
+
+#include <sound/sof/ipc4/header.h>
+
+/**
+ * struct sof_ipc4_pipeline - pipeline config data
+ * @priority: Priority of this pipeline
+ * @lp_mode: Low power mode
+ * @mem_usage: Memory usage
+ * @state: Pipeline state
+ * @msg: message structure for pipeline
+ */
+struct sof_ipc4_pipeline {
+	uint32_t priority;
+	uint32_t lp_mode;
+	uint32_t mem_usage;
+	int state;
+	struct sof_ipc4_msg msg;
+};
+
+#endif
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 658802c86685..be677a33882d 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -603,4 +603,5 @@ const struct sof_ipc_ops ipc4_ops = {
 	.set_get_data = sof_ipc4_set_get_data,
 	.get_reply = sof_ipc4_get_reply,
 	.fw_loader = &ipc4_loader_ops,
+	.tplg = &ipc4_tplg_ops,
 };
-- 
2.25.1

