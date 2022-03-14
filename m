Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE484D8DF2
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:11:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6D618BE;
	Mon, 14 Mar 2022 21:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6D618BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288703;
	bh=D4oK3/Yt88ByafrlpUL4x3bzy7SU57aD3JwElD4+SuQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cISVQZX4GK/IhkoMI/LGLf2DcSDARMNcBX4ntFOKePKkXLSMR8CEQIx63p/2a7mfH
	 f0uI4AmzMn4JyBcseNZskBxAqqwOiMsXtUNxwpe2AMCZfyEdSYiVJgCo1qNp8wBWGe
	 8XJuzRvsVBvjjSp+cCm+Tki28uAZenXm5z6hirE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2EF7F805B3;
	Mon, 14 Mar 2022 21:06:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24AD7F8055C; Mon, 14 Mar 2022 21:06:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49068F8052F
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49068F8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DyW5xWt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288353; x=1678824353;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D4oK3/Yt88ByafrlpUL4x3bzy7SU57aD3JwElD4+SuQ=;
 b=DyW5xWt+xV6SuyLBJKfzd2Ti8/us+9ul+mpr0t8vCgJB3UZpKWjDxOZ0
 hNWrMAksHX6157rKMnoU/o2NJdoAMUWndWjGkerOjuuHmhSoeSYeIlVfZ
 yz6sfevzX6K4Mkg8vucf9fE9/KCNHRNHwbYajwZLO5O8H6tQEuNdMbAog
 gVmJhmljf7oVMK9n9jtCMyekjr6iw83SjjgD5tptc2n74UhleAmLazWho
 LCh6I7xMsLKdVRKDJKifGk/vqW0yz94e5K4M3AVBkVD2VtQpAsf3j0Jaj
 /cExwthx2juLZll5bih4YF+Fu2rUNmtBypO6cecYY6tHEiqyAqnzzs6fm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563489"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563489"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339917"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:34 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/18] ASoC: SOF: topology: remove snd_sof_complete_pipeline()
Date: Mon, 14 Mar 2022 13:05:20 -0700
Message-Id: <20220314200520.1233427-20-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
References: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =tiwai@suse.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Add a new topology IPC op, pipeline_complete in struct ipc_tplg_ops
and set the op for IPC3. Replace the calls to
snd_sof_complete_pipeline() with the calls to the topology IPC
pipeline_complete op.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 23 +++++++++++++++++++++++
 sound/soc/sof/sof-audio.c     | 18 ++++++++++++------
 sound/soc/sof/sof-audio.h     |  4 ++--
 sound/soc/sof/topology.c      | 23 -----------------------
 4 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index ea1311192877..fe1d5a56080a 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -1887,6 +1887,28 @@ static int sof_ipc3_widget_bind_event(struct snd_soc_component *scomp,
 	return -EINVAL;
 }
 
+static int sof_ipc3_complete_pipeline(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	struct sof_ipc_pipe_ready ready;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	dev_dbg(sdev->dev, "tplg: complete pipeline %s id %d\n",
+		swidget->widget->name, swidget->comp_id);
+
+	memset(&ready, 0, sizeof(ready));
+	ready.hdr.size = sizeof(ready);
+	ready.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_PIPE_COMPLETE;
+	ready.comp_id = swidget->comp_id;
+
+	ret = sof_ipc_tx_message(sdev->ipc, ready.hdr.cmd, &ready, sizeof(ready), &reply,
+				 sizeof(reply));
+	if (ret < 0)
+		return ret;
+
+	return 1;
+}
+
 /* token list for each topology object */
 static enum sof_tokens host_token_list[] = {
 	SOF_CORE_TOKENS,
@@ -1988,6 +2010,7 @@ static const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
 	.route_setup = sof_ipc3_route_setup,
 	.control_setup = sof_ipc3_control_setup,
 	.control_free = sof_ipc3_control_free,
+	.pipeline_complete = sof_ipc3_complete_pipeline,
 	.token_list = ipc3_token_list,
 };
 
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index c02dcad03b23..683c290bb69a 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -362,6 +362,7 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 
 int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir)
 {
+	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
 	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
 	struct snd_soc_dapm_widget *widget;
 	int i, ret, num_widgets;
@@ -432,10 +433,12 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, in
 		if (pipe_widget->complete)
 			continue;
 
-		pipe_widget->complete = snd_sof_complete_pipeline(sdev, pipe_widget);
-		if (pipe_widget->complete < 0) {
-			ret = pipe_widget->complete;
-			goto widget_free;
+		if (ipc_tplg_ops->pipeline_complete) {
+			pipe_widget->complete = ipc_tplg_ops->pipeline_complete(sdev, pipe_widget);
+			if (pipe_widget->complete < 0) {
+				ret = pipe_widget->complete;
+				goto widget_free;
+			}
 		}
 	}
 
@@ -657,8 +660,11 @@ int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 					return ret;
 			}
 
-			swidget->complete =
-				snd_sof_complete_pipeline(sdev, swidget);
+			if (ipc_tplg_ops->pipeline_complete) {
+				swidget->complete = ipc_tplg_ops->pipeline_complete(sdev, swidget);
+				if (swidget->complete < 0)
+					return swidget->complete;
+			}
 			break;
 		default:
 			break;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index a14b872ea261..622d43707b27 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -68,6 +68,7 @@ struct sof_ipc_tplg_widget_ops {
  *		initialized to 0.
  * @control_setup: Function pointer for setting up kcontrol IPC-specific data
  * @control_free: Function pointer for freeing kcontrol IPC-specific data
+ * @pipeline_complete: Function pointer for pipeline complete IPC
  */
 struct sof_ipc_tplg_ops {
 	const struct sof_ipc_tplg_widget_ops *widget;
@@ -75,6 +76,7 @@ struct sof_ipc_tplg_ops {
 	const struct sof_token_info *token_list;
 	int (*control_setup)(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol);
 	int (*control_free)(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol);
+	int (*pipeline_complete)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 };
 
 /** struct snd_sof_tuple - Tuple info
@@ -318,8 +320,6 @@ void snd_sof_control_notify(struct snd_sof_dev *sdev,
  * be freed by snd_soc_unregister_component,
  */
 int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file);
-int snd_sof_complete_pipeline(struct snd_sof_dev *sdev,
-			      struct snd_sof_widget *swidget);
 
 /*
  * Stream IPC
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 70677a36c304..367fbe2d5b31 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1825,29 +1825,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
-int snd_sof_complete_pipeline(struct snd_sof_dev *sdev,
-			      struct snd_sof_widget *swidget)
-{
-	struct sof_ipc_pipe_ready ready;
-	struct sof_ipc_reply reply;
-	int ret;
-
-	dev_dbg(sdev->dev, "tplg: complete pipeline %s id %d\n",
-		swidget->widget->name, swidget->comp_id);
-
-	memset(&ready, 0, sizeof(ready));
-	ready.hdr.size = sizeof(ready);
-	ready.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_PIPE_COMPLETE;
-	ready.comp_id = swidget->comp_id;
-
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 ready.hdr.cmd, &ready, sizeof(ready), &reply,
-				 sizeof(reply));
-	if (ret < 0)
-		return ret;
-	return 1;
-}
-
 /**
  * sof_set_pipe_widget - Set pipe_widget for a component
  * @sdev: pointer to struct snd_sof_dev
-- 
2.25.1

