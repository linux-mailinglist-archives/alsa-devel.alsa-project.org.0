Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E95674D1DC2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:50:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62061188F;
	Tue,  8 Mar 2022 17:49:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62061188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646758209;
	bh=sevLvA+JDI8wNatLa+aq2cOCsP36Y/uVOwtNk3A0OS8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=usTOByFbw3rShBjtYslh/YdHXeGgStYckSb620QGZ+cVEnqNczMYrsrdIY5ZRvhcX
	 nK9hhM7WRQVb0kXZ+sPNEvOaM7hZKIvylPJ5v9rLLNnTCc7DyrIlGR4nLCYXXGkkV0
	 PCDBEkOjy0hesHMBWwlVweMJrL0mOWIW+Uxg1Kik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE7ACF805AF;
	Tue,  8 Mar 2022 17:44:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E1C0F80543; Tue,  8 Mar 2022 17:44:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D37EF80271
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D37EF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UhLTm2ia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757857; x=1678293857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sevLvA+JDI8wNatLa+aq2cOCsP36Y/uVOwtNk3A0OS8=;
 b=UhLTm2iaIa/YD/2g8XxFvRjyE6H+j9ueNg2DM+JbyyNfyBZuFgsuJT9z
 Pz7tuRRwb2sPSw2VrWeQhHspPVPb/hXrHN6C/+HSmFOFV4g/EGtOZ/xFG
 yR+GvU/rZ7m1RB9DtZYMGeVxYaunMQPJEFpIoVSyt3BsrgKPSBtr/KYD9
 Kwv6CW1GRrBvF/6IqCPuTE3Uchw4vmxDfyLgJGkDfqJinsAiP/N8YaSXM
 Z6gRHK2HldYekTtD9YcfwboPmjCCqsZEg2Qx2jiDjC0+fGZymFrJBFNrF
 bGHFfCWjM/dZ8n52KbXAEyBGrs5bwxB9D2pfxr89lkl+9MQTXuRG1fKiP A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252307241"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252307241"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:57 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633266"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:57 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 12/18] ASoC: SOF: topology: make sof_route_load() IPC
 agnostic
Date: Tue,  8 Mar 2022 08:43:38 -0800
Message-Id: <20220308164344.577647-13-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The IPC structure can be set up using the fields in struct snd_sof_route
when the pipeline connections are established.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 15 ++++++---------
 sound/soc/sof/topology.c  | 17 -----------------
 2 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b49d8e348077..8fccfbb339a3 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -259,28 +259,25 @@ EXPORT_SYMBOL(sof_widget_setup);
 
 static int sof_route_setup_ipc(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
 {
-	struct sof_ipc_pipe_comp_connect *connect;
+	struct sof_ipc_pipe_comp_connect connect;
 	struct sof_ipc_reply reply;
 	int ret;
 
-	/* skip if there's no private data */
-	if (!sroute->private)
-		return 0;
-
 	/* nothing to do if route is already set up */
 	if (sroute->setup)
 		return 0;
 
-	connect = sroute->private;
+	connect.hdr.size = sizeof(connect);
+	connect.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_CONNECT;
+	connect.source_id = sroute->src_widget->comp_id;
+	connect.sink_id = sroute->sink_widget->comp_id;
 
 	dev_dbg(sdev->dev, "setting up route %s -> %s\n",
 		sroute->src_widget->widget->name,
 		sroute->sink_widget->widget->name);
 
 	/* send ipc */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 connect->hdr.cmd,
-				 connect, sizeof(*connect),
+	ret = sof_ipc_tx_message(sdev->ipc, connect.hdr.cmd, &connect, sizeof(connect),
 				 &reply, sizeof(reply));
 	if (ret < 0) {
 		dev_err(sdev->dev, "%s: route setup failed %d\n", __func__, ret);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 111ff0f77be4..42260d0b9740 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3322,7 +3322,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 			  struct snd_soc_dapm_route *route)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct sof_ipc_pipe_comp_connect *connect;
 	struct snd_sof_widget *source_swidget, *sink_swidget;
 	struct snd_soc_dobj *dobj = &route->dobj;
 	struct snd_sof_route *sroute;
@@ -3334,16 +3333,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 		return -ENOMEM;
 
 	sroute->scomp = scomp;
-
-	connect = kzalloc(sizeof(*connect), GFP_KERNEL);
-	if (!connect) {
-		kfree(sroute);
-		return -ENOMEM;
-	}
-
-	connect->hdr.size = sizeof(*connect);
-	connect->hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_CONNECT;
-
 	dev_dbg(scomp->dev, "sink %s control %s source %s\n",
 		route->sink, route->control ? route->control : "none",
 		route->source);
@@ -3367,8 +3356,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	    source_swidget->id == snd_soc_dapm_output)
 		goto err;
 
-	connect->source_id = source_swidget->comp_id;
-
 	/* sink component */
 	sink_swidget = snd_sof_find_swidget(scomp, (char *)route->sink);
 	if (!sink_swidget) {
@@ -3386,8 +3373,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	    sink_swidget->id == snd_soc_dapm_output)
 		goto err;
 
-	connect->sink_id = sink_swidget->comp_id;
-
 	/*
 	 * For virtual routes, both sink and source are not
 	 * buffer. Since only buffer linked to component is supported by
@@ -3402,7 +3387,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	} else {
 		sroute->route = route;
 		dobj->private = sroute;
-		sroute->private = connect;
 		sroute->src_widget = source_swidget;
 		sroute->sink_widget = sink_swidget;
 
@@ -3413,7 +3397,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	}
 
 err:
-	kfree(connect);
 	kfree(sroute);
 	return ret;
 }
-- 
2.25.1

