Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382F44D8DE8
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:10:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B502417EB;
	Mon, 14 Mar 2022 21:09:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B502417EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288612;
	bh=17+3Br/SQ9CshebSb6xP8u3yof0W7n5/3ytw0k2NAas=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U1T/nlA0q9z6oxnF/J4Wd9Hj4OmTG71Gud0RhgETvfPjQZhFQLaHeLOyuooC5uuIZ
	 7aCktaPG7pCmBzcJY6Zb1PsjDg+mw0DTDWJ4yBxxlQo25DKRi3XeQVxU8v0L2zmZb6
	 rFSng0xvTmwvhSkFE7TnhT05v0G5hv5nNtBjqqoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87EE4F80564;
	Mon, 14 Mar 2022 21:06:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D371F80537; Mon, 14 Mar 2022 21:05:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21AD8F80518
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21AD8F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="M+5E+MQU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288347; x=1678824347;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=17+3Br/SQ9CshebSb6xP8u3yof0W7n5/3ytw0k2NAas=;
 b=M+5E+MQUBeq+Ob4rb4vBKonWlMHWuVaKp6NqVpvrMSNTcqYumiAkmjpI
 /GSpS34AAmB6uaEF/mKKwhFr/+Q5pLue+1jWlqFRS2VntDcEeQGWh8Vqj
 zWZKzwgmrE1Mv63Hv38OCjxbT4R/neY3LzyLOD9J6AQxJemaSpiCU3yUh
 qO6PAgdclhjYsAB5Jk74bnwmjZ8wv9vtU09sNujJ0ojODR0Cmw4nC1wx1
 iimOEprTziiuHCSLrYOqqSjcGcGGWBbPyuqIeTUHhlz1QUh2219OH1lZA
 YmxpZtKqJhnA0ArnTBmWlp/8YwGmrVyKtfpw4O7/+j43QuNJs6ku6sGqd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563476"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563476"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339896"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/18] ASoC: SOF: topology: Make mux/demux widget parsing IPC
 agnostic
Date: Mon, 14 Mar 2022 13:05:11 -0700
Message-Id: <20220314200520.1233427-11-ranjani.sridharan@linux.intel.com>
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

Define the list of tokens pertaining to the mux/demux widgets, parse and
save them as part of the swidget tuples array. Once topology parsing is
complete, these tokens will be applied to create the IPC structure for the
mux/demux component based on the topology widget_setup op in ipc3_tplg_ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 40 +++++++++++++++++++++++++++++++
 sound/soc/sof/topology.c      | 44 ++---------------------------------
 2 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index d8a91f461bf9..5501a18babaf 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -324,6 +324,41 @@ static int sof_ipc3_widget_setup_comp_buffer(struct snd_sof_widget *swidget)
 	return 0;
 }
 
+/*
+ * Mux topology
+ */
+static int sof_ipc3_widget_setup_comp_mux(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct sof_ipc_comp_mux *mux;
+	size_t ipc_size = sizeof(*mux);
+	int ret;
+
+	mux = sof_comp_alloc(swidget, &ipc_size, swidget->pipeline_id);
+	if (!mux)
+		return -ENOMEM;
+
+	swidget->private = mux;
+
+	/* configure mux IPC message */
+	mux->comp.type = SOF_COMP_MUX;
+	mux->config.hdr.size = sizeof(mux->config);
+
+	/* parse one set of comp tokens */
+	ret = sof_update_ipc_object(scomp, &mux->config, SOF_COMP_TOKENS,
+				    swidget->tuples, swidget->num_tuples, sizeof(mux->config), 1);
+	if (ret < 0) {
+		kfree(swidget->private);
+		swidget->private = NULL;
+		return ret;
+	}
+
+	dev_dbg(scomp->dev, "loaded mux %s\n", swidget->widget->name);
+	sof_dbg_comp_config(scomp, &mux->config);
+
+	return 0;
+}
+
 /*
  * PGA Topology
  */
@@ -430,6 +465,11 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TY
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL},
 	[snd_soc_dapm_pga] = {sof_ipc3_widget_setup_comp_pga, sof_ipc3_widget_free_comp,
 			      pga_token_list, ARRAY_SIZE(pga_token_list), NULL},
+	[snd_soc_dapm_mux] = {sof_ipc3_widget_setup_comp_mux, sof_ipc3_widget_free_comp,
+			      comp_generic_token_list, ARRAY_SIZE(comp_generic_token_list), NULL},
+	[snd_soc_dapm_demux] = {sof_ipc3_widget_setup_comp_mux, sof_ipc3_widget_free_comp,
+				 comp_generic_token_list, ARRAY_SIZE(comp_generic_token_list),
+				 NULL},
 };
 
 static const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 9e9a41018458..42da7b8e7180 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1792,44 +1792,6 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 	return ret;
 }
 
-/*
- * Mux topology
- */
-static int sof_widget_load_mux(struct snd_soc_component *scomp, int index,
-			       struct snd_sof_widget *swidget,
-			       struct snd_soc_tplg_dapm_widget *tw)
-{
-	struct snd_soc_tplg_private *private = &tw->priv;
-	struct sof_ipc_comp_mux *mux;
-	size_t ipc_size = sizeof(*mux);
-	int ret;
-
-	mux = (struct sof_ipc_comp_mux *)
-	      sof_comp_alloc(swidget, &ipc_size, index);
-	if (!mux)
-		return -ENOMEM;
-
-	/* configure mux IPC message */
-	mux->comp.type = SOF_COMP_MUX;
-	mux->config.hdr.size = sizeof(mux->config);
-
-	ret = sof_parse_tokens(scomp, &mux->config, comp_tokens,
-			       ARRAY_SIZE(comp_tokens), private->array,
-			       le32_to_cpu(private->size));
-	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse mux.cfg tokens failed %d\n",
-			private->size);
-		kfree(mux);
-		return ret;
-	}
-
-	sof_dbg_comp_config(scomp, &mux->config);
-
-	swidget->private = mux;
-
-	return 0;
-}
-
 /*
  * SRC Topology
  */
@@ -2316,6 +2278,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	case snd_soc_dapm_scheduler:
 	case snd_soc_dapm_aif_out:
 	case snd_soc_dapm_aif_in:
+	case snd_soc_dapm_mux:
+	case snd_soc_dapm_demux:
 		ret = sof_widget_parse_tokens(scomp, swidget, tw,  token_list, token_list_size);
 		break;
 	case snd_soc_dapm_src:
@@ -2330,10 +2294,6 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	case snd_soc_dapm_effect:
 		ret = sof_widget_load_process(scomp, index, swidget, tw);
 		break;
-	case snd_soc_dapm_mux:
-	case snd_soc_dapm_demux:
-		ret = sof_widget_load_mux(scomp, index, swidget, tw);
-		break;
 	case snd_soc_dapm_switch:
 	case snd_soc_dapm_dai_link:
 	case snd_soc_dapm_kcontrol:
-- 
2.25.1

