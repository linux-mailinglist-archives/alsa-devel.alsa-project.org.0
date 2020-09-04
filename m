Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F125D9EC
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 15:35:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 310BA1B12;
	Fri,  4 Sep 2020 15:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 310BA1B12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599226543;
	bh=CJ+U/SQaFopwWdwUo233gya6bHmXdvCTO7p4suFQ8UY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BiLZP1J2dmNzcRfsiSMH9q6YKtsmZmdSVBs+zAZj5TjH5OihCjbSe3pCHBHwwGV6C
	 StvSe+tA7+cWWbJPrZeczq+AjRBNb6cVDcZV8+FZv6GKn+wZLrqbNtNSICwaPSTM6u
	 dnIWgbNnF5liXub01CvHSSO2IYdPlnzxUmblGMPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D144DF80328;
	Fri,  4 Sep 2020 15:30:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE825F80317; Fri,  4 Sep 2020 15:30:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00228F801DA
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 15:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00228F801DA
IronPort-SDR: Vpe6DjsZ70vayaLveiehDw7zygDhoNTYhVlopBFcW9f1aWoNCOJOCZfSdA1/ow+Cb7enuhanZ8
 3aSTqA7AWxoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="157002855"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="157002855"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 06:29:46 -0700
IronPort-SDR: 6uJCCA1XFyCHORDlAWeODpewcq1/IlMbytWYQHUwFlkjj1Hy2QCW7VQJCl50P0nFcDTrpeWeoI
 HJEC1dMyr3zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284416720"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 04 Sep 2020 06:29:41 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 07/16] ASoC: SOF: append extended data to sof_ipc_comp_dai
Date: Fri,  4 Sep 2020 16:27:35 +0300
Message-Id: <20200904132744.1699575-8-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
References: <20200904132744.1699575-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Keyon Jie <yang.jie@linux.intel.com>

Append the extended data to the end of the struct sof_ipc_comp_dai, and
update the ext_data_offset, to construct the IPC for the topology load
and runtime restore.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 23 +++++++++++++++-----
 sound/soc/sof/topology.c  | 46 +++++++++++++++++++++++----------------
 2 files changed, 45 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index d05f99cd7919..cd506a4bfc4b 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -165,8 +165,9 @@ int sof_restore_pipelines(struct device *dev)
 	struct snd_sof_route *sroute;
 	struct sof_ipc_pipe_new *pipeline;
 	struct snd_sof_dai *dai;
-	struct sof_ipc_comp_dai *comp_dai;
 	struct sof_ipc_cmd_hdr *hdr;
+	struct sof_ipc_comp *comp;
+	size_t ipc_size;
 	int ret;
 
 	/* restore pipeline components */
@@ -189,12 +190,24 @@ int sof_restore_pipelines(struct device *dev)
 		switch (swidget->id) {
 		case snd_soc_dapm_dai_in:
 		case snd_soc_dapm_dai_out:
+			ipc_size = sizeof(struct sof_ipc_comp_dai) +
+				   sizeof(struct sof_ipc_comp_ext);
+			comp = kzalloc(ipc_size, GFP_KERNEL);
+			if (!comp)
+				return -ENOMEM;
+
 			dai = swidget->private;
-			comp_dai = &dai->comp_dai;
-			ret = sof_ipc_tx_message(sdev->ipc,
-						 comp_dai->comp.hdr.cmd,
-						 comp_dai, sizeof(*comp_dai),
+			memcpy(comp, &dai->comp_dai,
+			       sizeof(struct sof_ipc_comp_dai));
+
+			/* append extended data to the end of the component */
+			memcpy((u8 *)comp + sizeof(struct sof_ipc_comp_dai),
+			       &swidget->comp_ext, sizeof(swidget->comp_ext));
+
+			ret = sof_ipc_tx_message(sdev->ipc, comp->hdr.cmd,
+						 comp, ipc_size,
 						 &r, sizeof(r));
+			kfree(comp);
 			break;
 		case snd_soc_dapm_scheduler:
 
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 836da1a6f7cc..d8732cc5cdeb 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1506,49 +1506,57 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
-	struct sof_ipc_comp_dai comp_dai;
+	struct sof_ipc_comp_dai *comp_dai;
+	size_t ipc_size = sizeof(*comp_dai);
 	int ret;
 
+	comp_dai = (struct sof_ipc_comp_dai *)
+		   sof_comp_alloc(swidget, &ipc_size, index, core);
+	if (!comp_dai)
+		return -ENOMEM;
+
 	/* configure dai IPC message */
-	memset(&comp_dai, 0, sizeof(comp_dai));
-	comp_dai.comp.hdr.size = sizeof(comp_dai);
-	comp_dai.comp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_NEW;
-	comp_dai.comp.id = swidget->comp_id;
-	comp_dai.comp.type = SOF_COMP_DAI;
-	comp_dai.comp.pipeline_id = index;
-	comp_dai.comp.core = core;
-	comp_dai.config.hdr.size = sizeof(comp_dai.config);
-
-	ret = sof_parse_tokens(scomp, &comp_dai, dai_tokens,
+	comp_dai->comp.type = SOF_COMP_DAI;
+	comp_dai->config.hdr.size = sizeof(comp_dai->config);
+
+	ret = sof_parse_tokens(scomp, comp_dai, dai_tokens,
 			       ARRAY_SIZE(dai_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
 		dev_err(scomp->dev, "error: parse dai tokens failed %d\n",
 			le32_to_cpu(private->size));
-		return ret;
+		goto finish;
 	}
 
-	ret = sof_parse_tokens(scomp, &comp_dai.config, comp_tokens,
+	ret = sof_parse_tokens(scomp, &comp_dai->config, comp_tokens,
 			       ARRAY_SIZE(comp_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
 		dev_err(scomp->dev, "error: parse dai.cfg tokens failed %d\n",
 			private->size);
-		return ret;
+		goto finish;
 	}
 
 	dev_dbg(scomp->dev, "dai %s: type %d index %d\n",
-		swidget->widget->name, comp_dai.type, comp_dai.dai_index);
-	sof_dbg_comp_config(scomp, &comp_dai.config);
+		swidget->widget->name, comp_dai->type, comp_dai->dai_index);
+	sof_dbg_comp_config(scomp, &comp_dai->config);
 
-	ret = sof_ipc_tx_message(sdev->ipc, comp_dai.comp.hdr.cmd,
-				 &comp_dai, sizeof(comp_dai), r, sizeof(*r));
+	ret = sof_ipc_tx_message(sdev->ipc, comp_dai->comp.hdr.cmd,
+				 comp_dai, ipc_size, r, sizeof(*r));
 
 	if (ret == 0 && dai) {
 		dai->scomp = scomp;
-		memcpy(&dai->comp_dai, &comp_dai, sizeof(comp_dai));
+
+		/*
+		 * copy only the sof_ipc_comp_dai to avoid collapsing
+		 * the snd_sof_dai, the extended data is kept in the
+		 * snd_sof_widget.
+		 */
+		memcpy(&dai->comp_dai, comp_dai, sizeof(*comp_dai));
 	}
 
+finish:
+	kfree(comp_dai);
 	return ret;
 }
 
-- 
2.27.0

