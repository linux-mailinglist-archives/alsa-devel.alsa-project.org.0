Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DBE4DCD02
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:56:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3EBB1926;
	Thu, 17 Mar 2022 18:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3EBB1926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539792;
	bh=D0KQyFW4lhP5BunUzzzPjt5Nl0844B5kedzIzPoGh3w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JKnIJbYiO9YB542MUskCLa8Kh+N9XU4EI6aFj4ud8q7LIUdQAO4jAJe58nWhOGQaU
	 HTBncVQAwY+VonBORGEeUMyruI0ntVl5wWNa8lmrmWLVIJ4BwcmsTAlfujuDIU3H3j
	 minSWkt5G20BHKDtjf1FAqYEkbFbQMMp3Q+1Ytdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4A64F80557;
	Thu, 17 Mar 2022 18:52:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E56DF80536; Thu, 17 Mar 2022 18:52:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 829B5F802DF
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 829B5F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jDjlu5iS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539516; x=1679075516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D0KQyFW4lhP5BunUzzzPjt5Nl0844B5kedzIzPoGh3w=;
 b=jDjlu5iSIM7wfk2soKupUAT4rnIGXSJi2ZZS+deRtsH0UjHcCVTVH9uZ
 nMZlDov6T6cuVmt0J8mg/+TC21C2qXQvB/6VrIXYINFY0rA9YMcBTpLzQ
 cNeP6Re27ymV68EoibT076v1hRTBhatZsZQIDVZAYZEXFQgI3k/wMtiot
 OWafPd+2gaRQdzWi+HrXJm/9RiFTo07/4Md1OlxEz5JBINLMYGXAIneol
 qDWY9HoeY04pVb4g/YPip4thrr5+S/JzX/EbGJ2JRabr6lRLdDNp79EgB
 TuTBkIbSYbUW4EjONLw8I3iZNJxr2Rd4gb5XEeeIz84x5aomZaWN83u4E A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492926"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492926"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431150"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/19] ASoC: SOF: Introduce IPC3 PCM hw_free op
Date: Thu, 17 Mar 2022 10:50:38 -0700
Message-Id: <20220317175044.1752400-14-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

Add the IPC3 PCM ops, define the hw_free op and modify all users to use
the op.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/Makefile    |  2 +-
 sound/soc/sof/ipc.c       |  5 +++--
 sound/soc/sof/ipc3-ops.h  |  1 +
 sound/soc/sof/ipc3-pcm.c  | 43 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc3.c      |  1 +
 sound/soc/sof/pcm.c       | 44 +++++++++++++--------------------------
 sound/soc/sof/sof-audio.c | 11 +++++++---
 7 files changed, 72 insertions(+), 35 deletions(-)
 create mode 100644 sound/soc/sof/ipc3-pcm.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index f6d68a3096d9..18acbc001b9a 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -2,7 +2,7 @@
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o\
-		ipc3-topology.o ipc3.o ipc3-control.o
+		ipc3-topology.o ipc3.o ipc3-control.o ipc3-pcm.o
 ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
 snd-sof-objs += sof-client.o
 endif
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index af0ae137842b..5f5753608c79 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -1033,8 +1033,9 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 	ipc->ops = &ipc3_ops;
 
 	/* check for mandatory ops */
-	if (!ipc->ops->tplg || !ipc->ops->tplg->widget || !ipc->ops->tplg->control) {
-		dev_err(sdev->dev, "Invalid topology IPC ops\n");
+	if (!ipc->ops->pcm || !ipc->ops->tplg || !ipc->ops->tplg->widget ||
+	    !ipc->ops->tplg->control) {
+		dev_err(sdev->dev, "Invalid IPC ops\n");
 		return NULL;
 	}
 
diff --git a/sound/soc/sof/ipc3-ops.h b/sound/soc/sof/ipc3-ops.h
index f3d6010d0b77..a4784626a3d7 100644
--- a/sound/soc/sof/ipc3-ops.h
+++ b/sound/soc/sof/ipc3-ops.h
@@ -16,5 +16,6 @@
 extern const struct sof_ipc_tplg_ops ipc3_tplg_ops;
 extern const struct sof_ipc_ops ipc3_ops;
 extern const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops;
+extern const struct sof_ipc_pcm_ops ipc3_pcm_ops;
 
 #endif
diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
new file mode 100644
index 000000000000..96f498b4b2d6
--- /dev/null
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Intel Corporation. All rights reserved.
+//
+//
+
+#include <sound/pcm_params.h>
+#include "ipc3-ops.h"
+#include "ops.h"
+#include "sof-priv.h"
+#include "sof-audio.h"
+
+static int sof_ipc3_pcm_hw_free(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct sof_ipc_stream stream;
+	struct sof_ipc_reply reply;
+	struct snd_sof_pcm *spcm;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	if (!spcm->prepared[substream->stream])
+		return 0;
+
+	stream.hdr.size = sizeof(stream);
+	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
+	stream.comp_id = spcm->stream[substream->stream].comp_id;
+
+	/* send IPC to the DSP */
+	return sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
+				  sizeof(stream), &reply, sizeof(reply));
+}
+
+const struct sof_ipc_pcm_ops ipc3_pcm_ops = {
+	.hw_free = sof_ipc3_pcm_hw_free,
+};
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index e71cf30908c6..03e914b62728 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -41,4 +41,5 @@ static const struct sof_ipc_pm_ops ipc3_pm_ops = {
 const struct sof_ipc_ops ipc3_ops = {
 	.tplg = &ipc3_tplg_ops,
 	.pm = &ipc3_pm_ops,
+	.pcm = &ipc3_pcm_ops,
 };
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 47599b57ff19..8ef477aff938 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -82,29 +82,6 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
 
-int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream, struct snd_sof_dev *sdev,
-			 struct snd_sof_pcm *spcm)
-{
-	struct sof_ipc_stream stream;
-	struct sof_ipc_reply reply;
-	int ret;
-
-	if (!spcm->prepared[substream->stream])
-		return 0;
-
-	stream.hdr.size = sizeof(stream);
-	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
-	stream.comp_id = spcm->stream[substream->stream].comp_id;
-
-	/* send IPC to the DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
-				 sizeof(stream), &reply, sizeof(reply));
-	if (!ret)
-		spcm->prepared[substream->stream] = false;
-
-	return ret;
-}
-
 int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
 				    struct snd_sof_pcm *spcm, int dir)
 {
@@ -145,6 +122,7 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
 	struct snd_sof_platform_stream_params platform_params = { 0 };
 	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	struct snd_sof_pcm *spcm;
@@ -164,9 +142,13 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	 * Handle repeated calls to hw_params() without free_pcm() in
 	 * between. At least ALSA OSS emulation depends on this.
 	 */
-	ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
-	if (ret < 0)
-		return ret;
+	if (pcm_ops->hw_free && spcm->prepared[substream->stream]) {
+		ret = pcm_ops->hw_free(component, substream);
+		if (ret < 0)
+			return ret;
+
+		spcm->prepared[substream->stream] = false;
+	}
 
 	dev_dbg(component->dev, "pcm: hw params stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
@@ -289,6 +271,7 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
 	struct snd_sof_pcm *spcm;
 	int ret, err = 0;
 
@@ -304,10 +287,13 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 		spcm->pcm.pcm_id, substream->stream);
 
 	/* free PCM in the DSP */
-	ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
-	if (ret < 0)
-		err = ret;
+	if (pcm_ops->hw_free && spcm->prepared[substream->stream]) {
+		ret = pcm_ops->hw_free(component, substream);
+		if (ret < 0)
+			err = ret;
 
+		spcm->prepared[substream->stream] = false;
+	}
 
 	/* stop DMA */
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 7aa4ac313de3..5088ec7019ed 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -591,12 +591,17 @@ int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 int sof_pcm_stream_free(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
 			struct snd_sof_pcm *spcm, int dir, bool free_widget_list)
 {
+	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
 	int ret;
 
 	/* Send PCM_FREE IPC to reset pipeline */
-	ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
-	if (ret < 0)
-		return ret;
+	if (pcm_ops->hw_free && spcm->prepared[substream->stream]) {
+		ret = pcm_ops->hw_free(sdev->component, substream);
+		if (ret < 0)
+			return ret;
+	}
+
+	spcm->prepared[substream->stream] = false;
 
 	/* stop the DMA */
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
-- 
2.25.1

