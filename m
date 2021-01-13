Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 557402F4EDD
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:36:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A4621754;
	Wed, 13 Jan 2021 16:35:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A4621754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610552192;
	bh=mKXrENZTMhqviCsY4zcnkKK8vjdntUsClPQO4yFj/wE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rwFkvWykk87XBloZkzK6F9DnzDc2Jkcf7CcWRo1bMqiSRNgz9THFPVzbGW7kPRh0L
	 BzEmDRznuuUkgYHJEbD3ECzjPZvM2PUAArBlXyYP28AL2Zbs+zrnFnbDlq43e8gj6y
	 TY/RNinvAxAuyZ3aE9n+e58gijRlMkwdklmn5Faw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD768F804C3;
	Wed, 13 Jan 2021 16:34:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89C70F804C2; Wed, 13 Jan 2021 16:34:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEFD2F8014D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:34:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEFD2F8014D
IronPort-SDR: tOkFmbXau8yMfM9ffM0+4SGHBdlMNKpS117A64GrlLTyMKFdGCJXGEQiWy9khzOYlrQgKeQPAS
 az79GFSn9z5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="178366949"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="178366949"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:34:09 -0800
IronPort-SDR: DFg9Qas/tGzjfovr1jx06IyVCGgODCbK5tzYyVGm57QJKlLnwQ8OohPHuKXA/gt8pNcTw7G85/
 fWnS+OX3+vRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="348856516"
Received: from kekkonen.fi.intel.com ([10.237.72.68])
 by orsmga003.jf.intel.com with ESMTP; 13 Jan 2021 07:34:08 -0800
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH v2 2/2] ASoC: SOF: topology: use individual kcontrol types
Date: Wed, 13 Jan 2021 17:25:40 +0200
Message-Id: <20210113152540.2116439-3-jaska.uimonen@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20210113152540.2116439-1-jaska.uimonen@linux.intel.com>
References: <20210113152540.2116439-1-jaska.uimonen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

Change control creation and deletion to use individual kcontrol types.
This enables the use of multiple different type of controls in single
widget.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
---
 sound/soc/sof/topology.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 2c9581c6b92d..fbe7b7c9fb67 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1063,6 +1063,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	scontrol->min_volume_step = le32_to_cpu(mc->min);
 	scontrol->max_volume_step = le32_to_cpu(mc->max);
 	scontrol->num_channels = le32_to_cpu(mc->num_channels);
+	scontrol->control_data->index = kc->index;
 
 	/* set cmd for mixer control */
 	if (le32_to_cpu(mc->max) == 1) {
@@ -1140,7 +1141,7 @@ static int sof_control_load_enum(struct snd_soc_component *scomp,
 
 	scontrol->comp_id = sdev->next_comp_id;
 	scontrol->num_channels = le32_to_cpu(ec->num_channels);
-
+	scontrol->control_data->index = kc->index;
 	scontrol->cmd = SOF_CTRL_CMD_ENUM;
 
 	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d comp_id %d\n",
@@ -1188,6 +1189,7 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 
 	scontrol->comp_id = sdev->next_comp_id;
 	scontrol->cmd = SOF_CTRL_CMD_BINARY;
+	scontrol->control_data->index = kc->index;
 
 	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d\n",
 		scontrol->comp_id, scontrol->num_channels);
@@ -2133,7 +2135,7 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 	for (i = 0; i < widget->num_kcontrols; i++) {
 		kc = &widget->kcontrol_news[i];
 
-		switch (widget->dobj.widget.kcontrol_type) {
+		switch (widget->dobj.widget.kcontrol_type[i]) {
 		case SND_SOC_TPLG_TYPE_MIXER:
 			sm = (struct soc_mixer_control *)kc->private_value;
 			wdata[i].control = sm->dobj.private;
@@ -2148,7 +2150,7 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 			break;
 		default:
 			dev_err(scomp->dev, "error: unknown kcontrol type %d in widget %s\n",
-				widget->dobj.widget.kcontrol_type,
+				widget->dobj.widget.kcontrol_type[i],
 				widget->name);
 			return -EINVAL;
 		}
@@ -2164,7 +2166,8 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 			return -EINVAL;
 
 		/* make sure data is valid - data can be updated at runtime */
-		if (wdata[i].pdata->magic != SOF_ABI_MAGIC)
+		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
+		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
 			return -EINVAL;
 
 		*size += wdata[i].pdata->size;
@@ -2605,7 +2608,7 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 	}
 	for (i = 0; i < widget->num_kcontrols; i++) {
 		kc = &widget->kcontrol_news[i];
-		switch (dobj->widget.kcontrol_type) {
+		switch (widget->dobj.widget.kcontrol_type[i]) {
 		case SND_SOC_TPLG_TYPE_MIXER:
 			sm = (struct soc_mixer_control *)kc->private_value;
 			scontrol = sm->dobj.private;
-- 
2.24.1

