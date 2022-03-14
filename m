Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 982984D8DE2
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:09:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0613D17E8;
	Mon, 14 Mar 2022 21:08:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0613D17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288562;
	bh=DLVbX390zjtwOfniwOrd6dypSejIyzp13WbbBNKN9Oc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VAuaVuFvwEn/dgZtEywJDKiqXUJZNWuvFc7hkI2pq7KtF387h/ZYPVT96So/p+zX6
	 9GFrM/+owdn1uChVb4Ofcgij9QMorR9ABFR8DIi5DFUKx25su/NbCYTDC760zTMVVQ
	 HIgJpO9AbKQnX5eAlzh2G93d6efTD3zgMEzYUkwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20DB0F80552;
	Mon, 14 Mar 2022 21:06:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB815F80535; Mon, 14 Mar 2022 21:05:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3848F801EC
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3848F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AaWMVAxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288346; x=1678824346;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DLVbX390zjtwOfniwOrd6dypSejIyzp13WbbBNKN9Oc=;
 b=AaWMVAxuzwCAaJfRstxHxozaT0dZrNhXUPIjjSmAc21WLVFBQ9gi03RO
 XATXu4zr/JAk/mxh1VFgVjTSOKzKpFjZTd/J9TaZwPhhxGwQ0gdF4s3mx
 TqBAfKtziooFTsRDP/Qe2vu4/cmoHpsLUboU4W7Y9DApavcEEVOR0v/WV
 kfOXpZkA/kC5MVfV3OeaGTmbzEm2akZqO0uelfR1wrz+3HwKQeNcOh7mU
 DxSijeGmxfJON4IhhyQGtqxRHkFPP2tutNlWpERWDO6HLHHwBE53Pjayj
 l66lL9JY7T4yaxGW/OgFIBlisDYLeAlF3H5UErg6SXvhtKzSJ8UGvTYYz g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563475"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563475"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339895"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:33 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/18] ASoC: SOF: topology: Make mixer widget parsing IPC
 agnostic
Date: Mon, 14 Mar 2022 13:05:10 -0700
Message-Id: <20220314200520.1233427-10-ranjani.sridharan@linux.intel.com>
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

Define the list of tokens pertaining to the mixer widgets, parse and
save them as part of the swidget tuples array. Once topology parsing is
complete, these tokens will be applied to create the IPC structure for the
mixer component based on the topology widget_setup op in ipc3_tplg_ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 43 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/topology.c      | 43 +----------------------------------
 2 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 517ba84eb4c4..d8a91f461bf9 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -190,6 +190,40 @@ static void sof_ipc3_widget_free_comp(struct snd_sof_widget *swidget)
 	kfree(swidget->private);
 }
 
+static int sof_ipc3_widget_setup_comp_mixer(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct sof_ipc_comp_mixer *mixer;
+	size_t ipc_size = sizeof(*mixer);
+	int ret;
+
+	mixer = sof_comp_alloc(swidget, &ipc_size, swidget->pipeline_id);
+	if (!mixer)
+		return -ENOMEM;
+
+	swidget->private = mixer;
+
+	/* configure mixer IPC message */
+	mixer->comp.type = SOF_COMP_MIXER;
+	mixer->config.hdr.size = sizeof(mixer->config);
+
+	/* parse one set of comp tokens */
+	ret = sof_update_ipc_object(scomp, &mixer->config, SOF_COMP_TOKENS,
+				    swidget->tuples, swidget->num_tuples,
+				    sizeof(mixer->config), 1);
+	if (ret < 0) {
+		kfree(swidget->private);
+		swidget->private = NULL;
+
+		return ret;
+	}
+
+	dev_dbg(scomp->dev, "loaded mixer %s\n", swidget->widget->name);
+	sof_dbg_comp_config(scomp, &mixer->config);
+
+	return 0;
+}
+
 static int sof_ipc3_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
@@ -358,6 +392,12 @@ static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 };
 
+static enum sof_tokens comp_generic_token_list[] = {
+	SOF_CORE_TOKENS,
+	SOF_COMP_EXT_TOKENS,
+	SOF_COMP_TOKENS,
+};
+
 static enum sof_tokens buffer_token_list[] = {
 	SOF_BUFFER_TOKENS,
 };
@@ -383,6 +423,9 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TY
 				  host_token_list, ARRAY_SIZE(host_token_list), NULL},
 	[snd_soc_dapm_buffer] = {sof_ipc3_widget_setup_comp_buffer, sof_ipc3_widget_free_comp,
 				 buffer_token_list, ARRAY_SIZE(buffer_token_list), NULL},
+	[snd_soc_dapm_mixer] = {sof_ipc3_widget_setup_comp_mixer, sof_ipc3_widget_free_comp,
+				comp_generic_token_list, ARRAY_SIZE(comp_generic_token_list),
+				NULL},
 	[snd_soc_dapm_scheduler] = {sof_ipc3_widget_setup_comp_pipeline, sof_ipc3_widget_free_comp,
 				    pipeline_token_list, ARRAY_SIZE(pipeline_token_list), NULL},
 	[snd_soc_dapm_pga] = {sof_ipc3_widget_setup_comp_pga, sof_ipc3_widget_free_comp,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index bd62658629f5..9e9a41018458 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1792,45 +1792,6 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 	return ret;
 }
 
-/*
- * Mixer topology
- */
-
-static int sof_widget_load_mixer(struct snd_soc_component *scomp, int index,
-				 struct snd_sof_widget *swidget,
-				 struct snd_soc_tplg_dapm_widget *tw)
-{
-	struct snd_soc_tplg_private *private = &tw->priv;
-	struct sof_ipc_comp_mixer *mixer;
-	size_t ipc_size = sizeof(*mixer);
-	int ret;
-
-	mixer = (struct sof_ipc_comp_mixer *)
-		sof_comp_alloc(swidget, &ipc_size, index);
-	if (!mixer)
-		return -ENOMEM;
-
-	/* configure mixer IPC message */
-	mixer->comp.type = SOF_COMP_MIXER;
-	mixer->config.hdr.size = sizeof(mixer->config);
-
-	ret = sof_parse_tokens(scomp, &mixer->config, comp_tokens,
-			       ARRAY_SIZE(comp_tokens), private->array,
-			       le32_to_cpu(private->size));
-	if (ret != 0) {
-		dev_err(scomp->dev, "error: parse mixer.cfg tokens failed %d\n",
-			private->size);
-		kfree(mixer);
-		return ret;
-	}
-
-	sof_dbg_comp_config(scomp, &mixer->config);
-
-	swidget->private = mixer;
-
-	return 0;
-}
-
 /*
  * Mux topology
  */
@@ -2341,9 +2302,6 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		list_add(&dai->list, &sdev->dai_list);
 		swidget->private = dai;
 		break;
-	case snd_soc_dapm_mixer:
-		ret = sof_widget_load_mixer(scomp, index, swidget, tw);
-		break;
 	case snd_soc_dapm_pga:
 		if (!le32_to_cpu(tw->num_kcontrols)) {
 			dev_err(scomp->dev, "invalid kcontrol count %d for volume\n",
@@ -2353,6 +2311,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		}
 
 		fallthrough;
+	case snd_soc_dapm_mixer:
 	case snd_soc_dapm_buffer:
 	case snd_soc_dapm_scheduler:
 	case snd_soc_dapm_aif_out:
-- 
2.25.1

