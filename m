Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 766906ADEDF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 13:37:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B10D4145B;
	Tue,  7 Mar 2023 13:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B10D4145B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678192658;
	bh=Zy7sGzqdj28lfvxM1wphD7gZKdoRnC/uZ/+U6SM0Mck=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Oj3FwxkGzh5P4sKdJpwAO6PiTfecizTk8W9cr5lnPJI4SXYe5GNigk3HpKc535pgX
	 fidu48qbo5i2GVe8T4J7Ug6bJ0+2kVbIWVufP/JUnGBP391t4s6bR1NIcUpbLTrpgw
	 N4qUTUBLPLYm/f0nfDJ3g0kEaFYwXJZg1saekejg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DCF8F80527;
	Tue,  7 Mar 2023 13:36:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1441F8051B; Tue,  7 Mar 2023 13:36:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60858F80093
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 13:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60858F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ClMQF6IQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678192559; x=1709728559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zy7sGzqdj28lfvxM1wphD7gZKdoRnC/uZ/+U6SM0Mck=;
  b=ClMQF6IQSLAFo2KoPB9l9ZzWQ2fiutHoYVKiJCRo5qOjHShcH27br3B/
   lACT028PZyOqwna4iGuTm8k+n+RbT2cKkii5Z/XczHKvnhh6ofFBXNTSd
   cai+ueIs71BDEmDdpgqizIu+MTWzOlQiNCRnrdkEz12vwRaTlj3mU7IiD
   ojDhWkKmC8cieqr/3s5QQ51vVOBgVBjVK4AU9MNee166hmfwemu5LDo13
   n2MELstvjmpTkLHKe/BCPz1g7yt0iHaE21a8V24JQapa4j+85UJZi8BUP
   lISXQ0A2eNbmYF/lZf18AqfhoJLxRMwSJwUwo/8bHteVHuktj8iE54jWo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="315492808"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="315492808"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 04:35:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="745444366"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="745444366"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 04:35:39 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/3] ASoC: SOF: ipc4-topology: Add support for core_id for
 pipelines
Date: Tue,  7 Mar 2023 14:35:55 +0200
Message-Id: <20230307123556.31328-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307123556.31328-1-peter.ujfalusi@linux.intel.com>
References: <20230307123556.31328-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2SIIDNVMTXSSQOU7JMAGNEUL7JBQFZP3
X-Message-ID-Hash: 2SIIDNVMTXSSQOU7JMAGNEUL7JBQFZP3
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, chao.song@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SIIDNVMTXSSQOU7JMAGNEUL7JBQFZP3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Token SOF_TKN_SCHED_CORE in topology file can specify the target core for
the pipeline, if it is missing it is going to be 0 (as it is right now).

Firmware will double-check all information retrieved by topology and
report errors if required. This will allow policy and changes in
topologies without a need for a synchronized kernel change.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 11 ++++++++---
 sound/soc/sof/ipc4-topology.h |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 3e27c7a48ebd..12d8228d0828 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -24,7 +24,9 @@ static DEFINE_IDA(pipeline_ida);
 
 static const struct sof_topology_token ipc4_sched_tokens[] = {
 	{SOF_TKN_SCHED_LP_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_pipeline, lp_mode)}
+		offsetof(struct sof_ipc4_pipeline, lp_mode)},
+	{SOF_TKN_SCHED_CORE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc4_pipeline, core_id)},
 };
 
 static const struct sof_topology_token pipeline_tokens[] = {
@@ -629,6 +631,8 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 		goto err;
 	}
 
+	swidget->core = pipeline->core_id;
+
 	/* parse one set of pipeline tokens */
 	ret = sof_update_ipc_object(scomp, swidget, SOF_PIPELINE_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(*swidget), 1);
@@ -640,9 +644,9 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 	/* TODO: Get priority from topology */
 	pipeline->priority = 0;
 
-	dev_dbg(scomp->dev, "pipeline '%s': id %d pri %d lp mode %d\n",
+	dev_dbg(scomp->dev, "pipeline '%s': id %d, pri %d, core_id %u, lp mode %d\n",
 		swidget->widget->name, swidget->pipeline_id,
-		pipeline->priority, pipeline->lp_mode);
+		pipeline->priority, pipeline->core_id, pipeline->lp_mode);
 
 	swidget->private = pipeline;
 
@@ -652,6 +656,7 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 	pipeline->msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
 
 	pipeline->msg.extension = pipeline->lp_mode;
+	pipeline->msg.extension |= SOF_IPC4_GLB_PIPE_EXT_CORE_ID(pipeline->core_id);
 	pipeline->state = SOF_IPC4_PIPE_UNINITIALIZED;
 
 	return 0;
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 8507171a6e4d..7877f0638011 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -117,6 +117,7 @@ struct sof_ipc4_copier_config_set_sink_format {
  * @priority: Priority of this pipeline
  * @lp_mode: Low power mode
  * @mem_usage: Memory usage
+ * @core_id: Target core for the pipeline
  * @state: Pipeline state
  * @msg: message structure for pipeline
  * @skip_during_fe_trigger: skip triggering this pipeline during the FE DAI trigger
@@ -125,6 +126,7 @@ struct sof_ipc4_pipeline {
 	uint32_t priority;
 	uint32_t lp_mode;
 	uint32_t mem_usage;
+	uint32_t core_id;
 	int state;
 	struct sof_ipc4_msg msg;
 	bool skip_during_fe_trigger;
-- 
2.39.2

