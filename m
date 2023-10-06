Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0807BB378
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 10:48:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E446F112;
	Fri,  6 Oct 2023 10:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E446F112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696582089;
	bh=4xIjvBjkK5qWxqyqLiIopChgG5haS7KztPzk/v8LkBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RE4O27hd6/iZELQVCzQk88JBIcaUt85NK33tu//yRiYvJHuHxPgzGyVCvOhyHcpVk
	 cebajVJaM3pHZdKDXd3Eg5OhZblmIQroO4FWAxtomNnsIahfBel/jLV6NxoMMeX7I4
	 4eeKRjokhse84oqsl8Ou5LdMH/e+SDbQPEnmQomY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46BECF8058C; Fri,  6 Oct 2023 10:46:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 002A8F80587;
	Fri,  6 Oct 2023 10:46:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CDA9F8047D; Fri,  6 Oct 2023 10:45:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BA3CF801EB
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 10:45:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BA3CF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G9AjMHCV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696581940; x=1728117940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4xIjvBjkK5qWxqyqLiIopChgG5haS7KztPzk/v8LkBw=;
  b=G9AjMHCVzQi5oUeHF9hP0fLC+2pcy5eT+l5ORWw3GNPeYpu7ZIedmSQ4
   s4BOWYCuvaWmie7GRN15/MJ9eRCjI5CxlGafbKaLEeaX5ydeFhMttHSKQ
   XTOcRc9v5uBfWO1uqW1llBhkNUVYJmm/3Gff/50B4KVM2C+Idtb8X3zjn
   CasBUeS9ee84vMJSE8al5R7as5hBfyole8MC6PkexrlD7uhWNI+L8oVGo
   r2Pvf9y/gyssQoi+G3mLpLYP1xZxuZN9cnv8nk6FNJh6T54umQOt9oMUr
   Xm3bDSgLeWQmCbQfrMjVG2xXh/pMWMAFLXq4OcDkYqH7Oe5kVpC5aejsy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="5263847"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="5263847"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="868266289"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200";
   d="scan'208";a="868266289"
Received: from mesalamy-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.42.190])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 01:44:47 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com
Subject: [PATCH 2/2] ASoC: SOF: IPC4: sort pipeline based on priority
Date: Fri,  6 Oct 2023 11:44:54 +0300
Message-ID: <20231006084454.19170-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006084454.19170-1-peter.ujfalusi@linux.intel.com>
References: <20231006084454.19170-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G7X72ZXRJLUZQ6W45YYTHS4A4A7JDQRU
X-Message-ID-Hash: G7X72ZXRJLUZQ6W45YYTHS4A4A7JDQRU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G7X72ZXRJLUZQ6W45YYTHS4A4A7JDQRU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

The pipeline priority is set in topology and driver should sort pipeline
based on priority for trigger order.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c | 55 +++++++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index a3550c72360f..39039a647cca 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -62,10 +62,37 @@ int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 instance_id, u32 s
 }
 EXPORT_SYMBOL(sof_ipc4_set_pipeline_state);
 
+static void sof_ipc4_add_pipeline_by_priority(struct ipc4_pipeline_set_state_data *trigger_list,
+					      struct snd_sof_widget *pipe_widget,
+					      s8 *pipe_priority, bool ascend)
+{
+	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+	int i, j;
+
+	for (i = 0; i < trigger_list->count; i++) {
+		/* add pipeline from low priority to high */
+		if (ascend && pipeline->priority < pipe_priority[i])
+			break;
+		/* add pipeline from high priority to low */
+		else if (!ascend && pipeline->priority > pipe_priority[i])
+			break;
+	}
+
+	for (j = trigger_list->count - 1; j >= i; j--) {
+		trigger_list->pipeline_instance_ids[j + 1] = trigger_list->pipeline_instance_ids[j];
+		pipe_priority[j + 1] = pipe_priority[j];
+	}
+
+	trigger_list->pipeline_instance_ids[i] = pipe_widget->instance_id;
+	trigger_list->count++;
+	pipe_priority[i] = pipeline->priority;
+}
+
 static void
 sof_ipc4_add_pipeline_to_trigger_list(struct snd_sof_dev *sdev, int state,
 				      struct snd_sof_pipeline *spipe,
-				      struct ipc4_pipeline_set_state_data *trigger_list)
+				      struct ipc4_pipeline_set_state_data *trigger_list,
+				      s8 *pipe_priority)
 {
 	struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
 	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
@@ -80,20 +107,20 @@ sof_ipc4_add_pipeline_to_trigger_list(struct snd_sof_dev *sdev, int state,
 		 * for the first time
 		 */
 		if (spipe->started_count == spipe->paused_count)
-			trigger_list->pipeline_instance_ids[trigger_list->count++] =
-				pipe_widget->instance_id;
+			sof_ipc4_add_pipeline_by_priority(trigger_list, pipe_widget, pipe_priority,
+							  false);
 		break;
 	case SOF_IPC4_PIPE_RESET:
 		/* RESET if the pipeline is neither running nor paused */
 		if (!spipe->started_count && !spipe->paused_count)
-			trigger_list->pipeline_instance_ids[trigger_list->count++] =
-				pipe_widget->instance_id;
+			sof_ipc4_add_pipeline_by_priority(trigger_list, pipe_widget, pipe_priority,
+							  true);
 		break;
 	case SOF_IPC4_PIPE_PAUSED:
 		/* Pause the pipeline only when its started_count is 1 more than paused_count */
 		if (spipe->paused_count == (spipe->started_count - 1))
-			trigger_list->pipeline_instance_ids[trigger_list->count++] =
-				pipe_widget->instance_id;
+			sof_ipc4_add_pipeline_by_priority(trigger_list, pipe_widget, pipe_priority,
+							  true);
 		break;
 	default:
 		break;
@@ -288,6 +315,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	struct sof_ipc4_pipeline *pipeline;
 	struct snd_sof_pipeline *spipe;
 	struct snd_sof_pcm *spcm;
+	u8 *pipe_priority;
 	int ret;
 	int i;
 
@@ -320,6 +348,12 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	if (!trigger_list)
 		return -ENOMEM;
 
+	pipe_priority = kzalloc(pipeline_list->count, GFP_KERNEL);
+	if (!pipe_priority) {
+		kfree(trigger_list);
+		return -ENOMEM;
+	}
+
 	mutex_lock(&ipc4_data->pipeline_state_mutex);
 
 	/*
@@ -334,12 +368,14 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	if (state == SOF_IPC4_PIPE_RUNNING || state == SOF_IPC4_PIPE_RESET)
 		for (i = pipeline_list->count - 1; i >= 0; i--) {
 			spipe = pipeline_list->pipelines[i];
-			sof_ipc4_add_pipeline_to_trigger_list(sdev, state, spipe, trigger_list);
+			sof_ipc4_add_pipeline_to_trigger_list(sdev, state, spipe, trigger_list,
+							      pipe_priority);
 		}
 	else
 		for (i = 0; i < pipeline_list->count; i++) {
 			spipe = pipeline_list->pipelines[i];
-			sof_ipc4_add_pipeline_to_trigger_list(sdev, state, spipe, trigger_list);
+			sof_ipc4_add_pipeline_to_trigger_list(sdev, state, spipe, trigger_list,
+							      pipe_priority);
 		}
 
 	/* return if all pipelines are in the requested state already */
@@ -389,6 +425,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 free:
 	mutex_unlock(&ipc4_data->pipeline_state_mutex);
 	kfree(trigger_list);
+	kfree(pipe_priority);
 	return ret;
 }
 
-- 
2.42.0

