Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DCD773115
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5DBEDF0;
	Mon,  7 Aug 2023 23:16:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5DBEDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691443010;
	bh=H8kXSRQ3c/0Z1LQ72uUiImQ7UuSzClWe8g+4PFUERao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T1uggu9b1oEgxypFItMBmUONREegDCI15F6KqBzpFIBOMlCmdxjOXX1sO9NNQv+qw
	 Rx2M8/Y4A6fivloIlT1KGGVwcRo9x3zmIq+thlFzTAIujjFfwJiedg7R8AYerAo/PD
	 yE9pl6gaw0+2ArMK3q5i7mmneFDeT7gee89QdYU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EBF0F8067B; Mon,  7 Aug 2023 23:11:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AAFD3F80674;
	Mon,  7 Aug 2023 23:11:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7D47F805D2; Mon,  7 Aug 2023 23:10:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6F44F80579
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6F44F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F+lsAg0a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442630; x=1722978630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H8kXSRQ3c/0Z1LQ72uUiImQ7UuSzClWe8g+4PFUERao=;
  b=F+lsAg0acmiUIYZfEonulxKmL3sv1BIDfZuagnkRdGCfYWI80sBxg1Mi
   DiDuzKVwRCLTmwNppQf52awJhUSzXrwwrZPJPDAzkfwqXe34lTFEprjlC
   uVPRLufjeSXqcuX9vdbMskSUecGLbfqh9wspGfpXbdHnUjFQBjn29k6CB
   rc5ge9yMIdfT51Y96whFp5hZaYsrruX/uHN1Ap5E34owPFVrUJCpuL9vW
   BMJuqxSS2aEVYi4ZRXLSb2O8FzstsnCxmFuwKrgOQylvsbro7V9Qp2DMa
   B2mFBl7eutIWz5BU31/YkEVDXrubHXzFxz0xHxVIdXcJf0hNbbyJ3KGN5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244396"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244396"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465263"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465263"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 19/20] ASoC: SOF: IPC4: clarify 'pipeline_ids' usage and logs
Date: Mon,  7 Aug 2023 16:09:58 -0500
Message-Id: <20230807210959.506849-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ORNM5YUC3VV2PU5F6M2XHPRLV6VRVK76
X-Message-ID-Hash: ORNM5YUC3VV2PU5F6M2XHPRLV6VRVK76
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A pipeline is identified by two indices: 'instance_id' and 'pipeline_id'

This is clearly seen in kernel logs when creating a pipeline

"Create widget pipeline.20 instance 0 - pipe 20 - core 0"

but other logs are less clear

"ipc4 set pipeline 1 state 4"

Change definitions and logs to make sure the logs clearly identify
which of the two indices are used in state transitions.

No functional change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c      | 21 +++++++++++----------
 sound/soc/sof/ipc4-topology.h |  4 ++--
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 0c905bd0fab4..802cbf73594e 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -23,7 +23,8 @@ static int sof_ipc4_set_multi_pipeline_state(struct snd_sof_dev *sdev, u32 state
 
 	/* trigger a single pipeline */
 	if (trigger_list->count == 1)
-		return sof_ipc4_set_pipeline_state(sdev, trigger_list->pipeline_ids[0], state);
+		return sof_ipc4_set_pipeline_state(sdev, trigger_list->pipeline_instance_ids[0],
+						   state);
 
 	primary = state;
 	primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_SET_PIPELINE_STATE);
@@ -42,15 +43,15 @@ static int sof_ipc4_set_multi_pipeline_state(struct snd_sof_dev *sdev, u32 state
 	return sof_ipc_tx_message_no_reply(sdev->ipc, &msg, ipc_size);
 }
 
-int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state)
+int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 instance_id, u32 state)
 {
 	struct sof_ipc4_msg msg = {{ 0 }};
 	u32 primary;
 
-	dev_dbg(sdev->dev, "ipc4 set pipeline %d state %d", id, state);
+	dev_dbg(sdev->dev, "ipc4 set pipeline instance %d state %d", instance_id, state);
 
 	primary = state;
-	primary |= SOF_IPC4_GLB_PIPE_STATE_ID(id);
+	primary |= SOF_IPC4_GLB_PIPE_STATE_ID(instance_id);
 	primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_SET_PIPELINE_STATE);
 	primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
 	primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
@@ -79,19 +80,19 @@ sof_ipc4_add_pipeline_to_trigger_list(struct snd_sof_dev *sdev, int state,
 		 * for the first time
 		 */
 		if (spipe->started_count == spipe->paused_count)
-			trigger_list->pipeline_ids[trigger_list->count++] =
+			trigger_list->pipeline_instance_ids[trigger_list->count++] =
 				pipe_widget->instance_id;
 		break;
 	case SOF_IPC4_PIPE_RESET:
 		/* RESET if the pipeline is neither running nor paused */
 		if (!spipe->started_count && !spipe->paused_count)
-			trigger_list->pipeline_ids[trigger_list->count++] =
+			trigger_list->pipeline_instance_ids[trigger_list->count++] =
 				pipe_widget->instance_id;
 		break;
 	case SOF_IPC4_PIPE_PAUSED:
 		/* Pause the pipeline only when its started_count is 1 more than paused_count */
 		if (spipe->paused_count == (spipe->started_count - 1))
-			trigger_list->pipeline_ids[trigger_list->count++] =
+			trigger_list->pipeline_instance_ids[trigger_list->count++] =
 				pipe_widget->instance_id;
 		break;
 	default:
@@ -113,7 +114,7 @@ sof_ipc4_update_pipeline_state(struct snd_sof_dev *sdev, int state, int cmd,
 
 	/* set state for pipeline if it was just triggered */
 	for (i = 0; i < trigger_list->count; i++) {
-		if (trigger_list->pipeline_ids[i] == pipe_widget->instance_id) {
+		if (trigger_list->pipeline_instance_ids[i] == pipe_widget->instance_id) {
 			pipeline->state = state;
 			break;
 		}
@@ -314,8 +315,8 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 		return sof_ipc4_chain_dma_trigger(sdev, pipeline_list, state, cmd);
 
 	/* allocate memory for the pipeline data */
-	trigger_list = kzalloc(struct_size(trigger_list, pipeline_ids, pipeline_list->count),
-			       GFP_KERNEL);
+	trigger_list = kzalloc(struct_size(trigger_list, pipeline_instance_ids,
+					   pipeline_list->count), GFP_KERNEL);
 	if (!trigger_list)
 		return -ENOMEM;
 
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 6dcf14886e85..d75f17f4749c 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -144,11 +144,11 @@ struct sof_ipc4_pipeline {
 /**
  * struct sof_ipc4_multi_pipeline_data - multi pipeline trigger IPC data
  * @count: Number of pipelines to be triggered
- * @pipeline_ids: Flexible array of IDs of the pipelines to be triggered
+ * @pipeline_instance_ids: Flexible array of IDs of the pipelines to be triggered
  */
 struct ipc4_pipeline_set_state_data {
 	u32 count;
-	DECLARE_FLEX_ARRAY(u32, pipeline_ids);
+	DECLARE_FLEX_ARRAY(u32, pipeline_instance_ids);
 } __packed;
 
 /**
-- 
2.39.2

