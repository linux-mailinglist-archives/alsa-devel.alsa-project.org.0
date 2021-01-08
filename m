Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B72EF155
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 12:35:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3DCC16EA;
	Fri,  8 Jan 2021 12:34:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3DCC16EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610105708;
	bh=g5Y1Bs1GpXwWuo+B9p35HuRqTqsmLVHcA6Q2oPQOAfU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BcUX3JO+DOV7RuOTlZAtbX2QtF3IU9N7Z6TMGYjNhExxzEaOEHMN6tWgqhzmizvNZ
	 GfKxpINbiYW/Zp8cVnBkJvn1uEVZmHmiCfQl672BudQHcxi847v/zU84NtU3p6eWiZ
	 +fB5/NOXZ+NM5vXq62+qf/uqNHqSyemDKiJx4d8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4A96F804D2;
	Fri,  8 Jan 2021 12:32:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35352F80167; Fri,  8 Jan 2021 12:32:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44398F80167
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 12:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44398F80167
IronPort-SDR: dx5QHUgU4/WoGLsnjvnVMkx+VxhUsCaIFuvg+MtDN7V8FsFvJ3gPAfjvM9/3qsKYJytBq70Nym
 GfvMa5uwkKNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="175002638"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="175002638"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2021 03:32:28 -0800
IronPort-SDR: q6/u5IPqIA9wI4rYtCfe8nooDupzWDChoWhtnQpUnkZ6334Rgv+wTthAcnWqqG3+GLJdus9IQq
 kp90BM7TAyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; d="scan'208";a="362310525"
Received: from kekkonen.fi.intel.com ([10.237.72.68])
 by orsmga002.jf.intel.com with ESMTP; 08 Jan 2021 03:32:27 -0800
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 3/3] ASoC: SOF: topology: use individual kcontrol types
Date: Fri,  8 Jan 2021 13:23:55 +0200
Message-Id: <20210108112355.2053917-4-jaska.uimonen@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20210108112355.2053917-1-jaska.uimonen@linux.intel.com>
References: <20210108112355.2053917-1-jaska.uimonen@linux.intel.com>
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
index 2c9581c6b92d..3855796936bb 100644
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
+		switch (kc->kcontrol_type) {
 		case SND_SOC_TPLG_TYPE_MIXER:
 			sm = (struct soc_mixer_control *)kc->private_value;
 			wdata[i].control = sm->dobj.private;
@@ -2148,7 +2150,7 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 			break;
 		default:
 			dev_err(scomp->dev, "error: unknown kcontrol type %d in widget %s\n",
-				widget->dobj.widget.kcontrol_type,
+				kc->kcontrol_type,
 				widget->name);
 			return -EINVAL;
 		}
@@ -2164,7 +2166,8 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
 			return -EINVAL;
 
 		/* make sure data is valid - data can be updated at runtime */
-		if (wdata[i].pdata->magic != SOF_ABI_MAGIC)
+		if (kc->kcontrol_type == SND_SOC_TPLG_TYPE_BYTES &&
+		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
 			return -EINVAL;
 
 		*size += wdata[i].pdata->size;
@@ -2605,7 +2608,7 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 	}
 	for (i = 0; i < widget->num_kcontrols; i++) {
 		kc = &widget->kcontrol_news[i];
-		switch (dobj->widget.kcontrol_type) {
+		switch (kc->kcontrol_type) {
 		case SND_SOC_TPLG_TYPE_MIXER:
 			sm = (struct soc_mixer_control *)kc->private_value;
 			scontrol = sm->dobj.private;
-- 
2.24.1

