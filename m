Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ADD4D8DF0
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:11:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3690186B;
	Mon, 14 Mar 2022 21:10:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3690186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288683;
	bh=YqBw2e1h0zdtpzGSw1IPJ/rOT/2dwUW7NYgdmzDgSfE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fs7c3kdB7o4RSLb4Zo5C75S6dbH76fN1VILHSMlBUNYSMQfgXMISM05I2lpOUCZxy
	 wBzuKdXcLlKxvKFLAEclnacw/iju4ABWx1jdehsPy6vz+Dtnl5U9O6SXmqY57XYjJD
	 kxFr7XuXQEjNBFvG3g/T5Wh4g0ZlmquE5qszaU+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F2F0F805AF;
	Mon, 14 Mar 2022 21:06:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFC97F80553; Mon, 14 Mar 2022 21:06:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA23AF80475
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA23AF80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Lu0RCkDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288350; x=1678824350;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YqBw2e1h0zdtpzGSw1IPJ/rOT/2dwUW7NYgdmzDgSfE=;
 b=Lu0RCkDNUJtO7xfT/U+GKnFq51Kx9zcevTzPoMPZDd/ICRY+PDUDUgKT
 Wcuov4hOTTPFkYrqbNbC5+suM6buWoDlMiJdE/0Cd3Q96lrjkeT/SUIA1
 xF75llm3EkVf6aVxSaJi0sKRZXXqt+4SqvvJtgcQrPKqKVpqvnQHWI1DH
 BbKoPKUmMoA4vO9heHWIaBIIoyOP1wSxMC13CVzM6xIDECPHVFBPi+sCn
 /Vmy2DILgoLTXLjONOzW3niV8FA4SiQV8yyqb7OQOuJLVZPAbXDFCyH3A
 Ofdxd1EwNdnL+axb+t+DTFQoLSXORpf1624Ns6NI264mRT++P6THj6sE8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563482"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563482"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339902"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/18] ASoC: SOF: topology: Make route setup IPC agnostic
Date: Mon, 14 Mar 2022 13:05:16 -0700
Message-Id: <20220314200520.1233427-16-ranjani.sridharan@linux.intel.com>
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

Define and set the route_setup op for IPC3 topology ops and use it for
setting up routes.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 26 +++++++++++++++++++
 sound/soc/sof/sof-audio.c     | 48 ++++++++++-------------------------
 2 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index b710129374c8..a9d55c1d1f84 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -797,6 +797,31 @@ static int sof_widget_update_ipc_comp_process(struct snd_sof_widget *swidget)
 	return sof_process_load(scomp, swidget, find_process_comp_type(config.type));
 }
 
+static int sof_ipc3_route_setup(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
+{
+	struct sof_ipc_pipe_comp_connect connect;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	connect.hdr.size = sizeof(connect);
+	connect.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_CONNECT;
+	connect.source_id = sroute->src_widget->comp_id;
+	connect.sink_id = sroute->sink_widget->comp_id;
+
+	dev_dbg(sdev->dev, "setting up route %s -> %s\n",
+		sroute->src_widget->widget->name,
+		sroute->sink_widget->widget->name);
+
+	/* send ipc */
+	ret = sof_ipc_tx_message(sdev->ipc, connect.hdr.cmd, &connect, sizeof(connect),
+				 &reply, sizeof(reply));
+	if (ret < 0)
+		dev_err(sdev->dev, "%s: route %s -> %s failed\n", __func__,
+			sroute->src_widget->widget->name, sroute->sink_widget->widget->name);
+
+	return ret;
+}
+
 /* token list for each topology object */
 static enum sof_tokens host_token_list[] = {
 	SOF_CORE_TOKENS,
@@ -882,6 +907,7 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TY
 
 static const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
 	.widget = tplg_ipc3_widget_ops,
+	.route_setup = sof_ipc3_route_setup,
 	.token_list = ipc3_token_list,
 };
 
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 15c36a51f89f..c02dcad03b23 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -263,45 +263,15 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 }
 EXPORT_SYMBOL(sof_widget_setup);
 
-static int sof_route_setup_ipc(struct snd_sof_dev *sdev, struct snd_sof_route *sroute)
-{
-	struct sof_ipc_pipe_comp_connect connect;
-	struct sof_ipc_reply reply;
-	int ret;
-
-	/* nothing to do if route is already set up */
-	if (sroute->setup)
-		return 0;
-
-	connect.hdr.size = sizeof(connect);
-	connect.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_CONNECT;
-	connect.source_id = sroute->src_widget->comp_id;
-	connect.sink_id = sroute->sink_widget->comp_id;
-
-	dev_dbg(sdev->dev, "setting up route %s -> %s\n",
-		sroute->src_widget->widget->name,
-		sroute->sink_widget->widget->name);
-
-	/* send ipc */
-	ret = sof_ipc_tx_message(sdev->ipc, connect.hdr.cmd, &connect, sizeof(connect),
-				 &reply, sizeof(reply));
-	if (ret < 0) {
-		dev_err(sdev->dev, "%s: route setup failed %d\n", __func__, ret);
-		return ret;
-	}
-
-	sroute->setup = true;
-
-	return 0;
-}
-
 static int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsource,
 			   struct snd_soc_dapm_widget *wsink)
 {
+	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
 	struct snd_sof_widget *src_widget = wsource->dobj.private;
 	struct snd_sof_widget *sink_widget = wsink->dobj.private;
 	struct snd_sof_route *sroute;
 	bool route_found = false;
+	int ret;
 
 	/* ignore routes involving virtual widgets in topology */
 	switch (src_widget->id) {
@@ -335,7 +305,16 @@ static int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 		return -EINVAL;
 	}
 
-	return sof_route_setup_ipc(sdev, sroute);
+	/* nothing to do if route is already set up */
+	if (sroute->setup)
+		return 0;
+
+	ret = ipc_tplg_ops->route_setup(sdev, sroute);
+	if (ret < 0)
+		return ret;
+
+	sroute->setup = true;
+	return 0;
 }
 
 static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
@@ -604,6 +583,7 @@ int sof_set_hw_params_upon_resume(struct device *dev)
 
 int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 {
+	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
 	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
@@ -656,7 +636,7 @@ int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 				sroute->sink_widget->dynamic_pipeline_widget))
 			continue;
 
-		ret = sof_route_setup_ipc(sdev, sroute);
+		ret = ipc_tplg_ops->route_setup(sdev, sroute);
 		if (ret < 0) {
 			dev_err(sdev->dev, "%s: restore pipeline connections failed\n", __func__);
 			return ret;
-- 
2.25.1

