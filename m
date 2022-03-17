Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB4B4DCCF8
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:54:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1F6B190B;
	Thu, 17 Mar 2022 18:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1F6B190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539682;
	bh=icr7OkwnHEwr801hagV2X9F7RXGHcVlRXX/SRsTK6Rc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q4imtiz7UbjjPYFHbtKu09Pj33/ArTRW5C89t1arJcGqu12ubJDoJDQ31myGHGyJK
	 fbkM+5gwp8w9TC1ujtK64aag32SVU7rEBok2Y9pY7ii5cgxdchhPsft9Mq+f0G+Go/
	 3ZQljPuMWbNC1lX6iLzwRT3STdGLhXorQqBSxFKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF63BF8051B;
	Thu, 17 Mar 2022 18:52:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 653C0F80526; Thu, 17 Mar 2022 18:51:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 209A9F8020D
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 209A9F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UxG59dZc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539511; x=1679075511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=icr7OkwnHEwr801hagV2X9F7RXGHcVlRXX/SRsTK6Rc=;
 b=UxG59dZcrpivfAxkrXKU4Rpzw3Pd08Bc0TKpkRZkZx6i8w0GxTcAofgP
 OBN3Ts6D9osYBa1TICW3ueVknmEGVXGU/2EcCOfz+JZqZW2rEcpbplI4C
 uh1k+GCAj/awzzH03p3NzRT07IczvLyUb6eCZIj6Ycvhf9LRzavxDKdT9
 7zYZeAj9EMhkjtJzLwgBmcsXDfARzEP678iBjo5GJK6452Lf8igmN7sDD
 6uuZ9WkmniZe1I4GEjz5sSaB7QpoQBy7xkFKKkGx3KLpP29fx1+pQXiW6
 b2FfBvYehysndSXtzbJk9Vbz0rGvOkF2VJlP1oZVRYg5R6LasKSWqS9tJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492913"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492913"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431129"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:22 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/19] ASoC: SOF: Add enum_get/put control ops for IPC3
Date: Thu, 17 Mar 2022 10:50:33 -0700
Message-Id: <20220317175044.1752400-9-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Define and set the enum_get/put control IPC ops for IPC3.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/control.c      | 39 +++++++++-------------------
 sound/soc/sof/ipc3-control.c | 50 ++++++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+), 27 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index f9f8bd37b480..499d426c5d38 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -160,17 +160,14 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 int snd_sof_enum_get(struct snd_kcontrol *kcontrol,
 		     struct snd_ctl_elem_value *ucontrol)
 {
-	struct soc_enum *se =
-		(struct soc_enum *)kcontrol->private_value;
+	struct soc_enum *se = (struct soc_enum *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = se->dobj.private;
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	unsigned int i, channels = scontrol->num_channels;
-
-	snd_sof_refresh_control(scontrol);
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
-	/* read back each channel */
-	for (i = 0; i < channels; i++)
-		ucontrol->value.enumerated.item[i] = cdata->chanv[i].value;
+	if (tplg_ops->control->enum_get)
+		return tplg_ops->control->enum_get(scontrol, ucontrol);
 
 	return 0;
 }
@@ -178,28 +175,16 @@ int snd_sof_enum_get(struct snd_kcontrol *kcontrol,
 int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 		     struct snd_ctl_elem_value *ucontrol)
 {
-	struct soc_enum *se =
-		(struct soc_enum *)kcontrol->private_value;
+	struct soc_enum *se = (struct soc_enum *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = se->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	unsigned int i, channels = scontrol->num_channels;
-	bool change = false;
-	u32 value;
-
-	/* update each channel */
-	for (i = 0; i < channels; i++) {
-		value = ucontrol->value.enumerated.item[i];
-		change = change || (value != cdata->chanv[i].value);
-		cdata->chanv[i].channel = i;
-		cdata->chanv[i].value = value;
-	}
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
-	/* notify DSP of enum updates */
-	if (pm_runtime_active(scomp->dev))
-		snd_sof_ipc_set_get_comp_data(scontrol, true);
+	if (tplg_ops->control->enum_put)
+		return tplg_ops->control->enum_put(scontrol, ucontrol);
 
-	return change;
+	return false;
 }
 
 int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index ba9cde011b5a..03948f8f7eb0 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -157,6 +157,54 @@ static bool sof_ipc3_switch_put(struct snd_sof_control *scontrol,
 	return change;
 }
 
+static int sof_ipc3_enum_get(struct snd_sof_control *scontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
+	unsigned int channels = scontrol->num_channels;
+	unsigned int i;
+
+	snd_sof_refresh_control(scontrol);
+
+	/* read back each channel */
+	for (i = 0; i < channels; i++)
+		ucontrol->value.enumerated.item[i] = cdata->chanv[i].value;
+
+	return 0;
+}
+
+static bool sof_ipc3_enum_put(struct snd_sof_control *scontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	unsigned int channels = scontrol->num_channels;
+	unsigned int i;
+	bool change = false;
+	u32 value;
+
+	/* update each channel */
+	for (i = 0; i < channels; i++) {
+		value = ucontrol->value.enumerated.item[i];
+		change = change || (value != cdata->chanv[i].value);
+		cdata->chanv[i].channel = i;
+		cdata->chanv[i].value = value;
+	}
+
+	/* notify DSP of enum updates */
+	if (pm_runtime_active(scomp->dev)) {
+		int ret = snd_sof_ipc_set_get_comp_data(scontrol, true);
+
+		if (ret < 0) {
+			dev_err(scomp->dev, "Failed to set enum updates for %s\n",
+				scontrol->name);
+			return false;
+		}
+	}
+
+	return change;
+}
+
 static void snd_sof_update_control(struct snd_sof_control *scontrol,
 				   struct sof_ipc_ctrl_data *cdata)
 {
@@ -302,5 +350,7 @@ const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops = {
 	.volume_get = sof_ipc3_volume_get,
 	.switch_put = sof_ipc3_switch_put,
 	.switch_get = sof_ipc3_switch_get,
+	.enum_put = sof_ipc3_enum_put,
+	.enum_get = sof_ipc3_enum_get,
 	.update = sof_ipc3_control_update,
 };
-- 
2.25.1

