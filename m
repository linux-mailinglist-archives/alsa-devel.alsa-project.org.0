Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D38D67730F9
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:12:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4621F845;
	Mon,  7 Aug 2023 23:11:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4621F845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691442759;
	bh=F7Xf71XGltG9msm9mvPvcAgXO6d+o/snjd471X8mCgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NdJTFxnWmgIGVNyiGTv9Zg7m1u76VkOYQpc+QVcpK2ynDKo7RKEoi6kX//qsNIhvG
	 EPhpm3KpnniZiwPq1tvlXZP9FwCR8N1bKMzGKMnqzWTTPqzRnFsBXFoFnPfTlKuQEJ
	 OP8cbQu7eP+Dk6G+kEbz8nDKdqIBXTXCHn4jyyEM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A8D3F80535; Mon,  7 Aug 2023 23:10:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0B2AF80580;
	Mon,  7 Aug 2023 23:10:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7004F80564; Mon,  7 Aug 2023 23:10:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D439EF8016B
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D439EF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Qzx1BIkj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691442619; x=1722978619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F7Xf71XGltG9msm9mvPvcAgXO6d+o/snjd471X8mCgY=;
  b=Qzx1BIkjGexV5XGBubrpS627EEi2I4wbHLFBOZhLD+diX5gyFA03sqOQ
   so+o6qeBt7VhVUUmhSd2owTQFfPp7ZBRfnpEPtiLcZT8Y+FAdZMya0FCe
   NZrB7ih0S2f2eHoiHiHiyxXIIIu03+hlpbpMnnu9PxvDO/xjvidIptq6+
   jFBrWBXHQsSyqCHzuU9cc2lgDV8abfbsDtF3OTvLBCkjXoY14TeFIpIDo
   X8Ibx2qktTA5w7Nece2roVUK11NfuV5qI17xKOHwhmCqcqRyuBvj6QFrB
   XCxPakhnI4q3PlTPe0Zl3e3jduDiCMuUxeNY/AP/ZmaQH8GTDNsfj3IOz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="350244314"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="350244314"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="796465165"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="796465165"
Received: from hweelee-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.181.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:10:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 03/20] ASoC: SOF: ipc4: avoid uninitialized default instance 0
Date: Mon,  7 Aug 2023 16:09:42 -0500
Message-Id: <20230807210959.506849-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
References: <20230807210959.506849-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CFLKQFUUHKWAPYFWIAZH5TINSZE7BD4Z
X-Message-ID-Hash: CFLKQFUUHKWAPYFWIAZH5TINSZE7BD4Z
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

When a pipeline contains multiple DAI widgets, the pipe_widget is not
set up except for the first DAI. This result in the pipe_widget having
a default instance 0, which can conflict with another real the
pipeline instance 0 and leads to spurious transitions.

This patch makes sure the instance_id is properly initialized to a
-EINVAL value.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 6 ++++++
 sound/soc/sof/ipc4-topology.c     | 1 +
 sound/soc/sof/topology.c          | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index f3513796c189..e9ae38916434 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -234,6 +234,9 @@ static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cp
 	pipe_widget = swidget->spipe->pipe_widget;
 	pipeline = pipe_widget->private;
 
+	if (pipe_widget->instance_id < 0)
+		return 0;
+
 	mutex_lock(&ipc4_data->pipeline_state_mutex);
 
 	switch (cmd) {
@@ -297,6 +300,9 @@ static int hda_ipc4_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *c
 	pipe_widget = swidget->spipe->pipe_widget;
 	pipeline = pipe_widget->private;
 
+	if (pipe_widget->instance_id < 0)
+		return 0;
+
 	mutex_lock(&ipc4_data->pipeline_state_mutex);
 
 	switch (cmd) {
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index a4e1a70b607d..9bc94be072aa 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2319,6 +2319,7 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 		pipeline->mem_usage = 0;
 		pipeline->state = SOF_IPC4_PIPE_UNINITIALIZED;
 		ida_free(&pipeline_ida, swidget->instance_id);
+		swidget->instance_id = -EINVAL;
 	} else {
 		struct snd_sof_widget *pipe_widget = swidget->spipe->pipe_widget;
 		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 698129dccc7d..1afcbb134d2c 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2157,6 +2157,8 @@ static int sof_complete(struct snd_soc_component *scomp)
 		struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
 		struct snd_sof_widget *swidget;
 
+		pipe_widget->instance_id = -EINVAL;
+
 		/* Update the scheduler widget's IPC structure */
 		if (widget_ops && widget_ops[pipe_widget->id].ipc_setup) {
 			ret = widget_ops[pipe_widget->id].ipc_setup(pipe_widget);
-- 
2.39.2

