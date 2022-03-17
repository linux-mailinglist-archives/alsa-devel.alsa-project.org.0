Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 433FB4DCCF6
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:54:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D77121862;
	Thu, 17 Mar 2022 18:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D77121862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539649;
	bh=fHsyIITrqRUCS4qFa0kVAZRjYFat2lFNdC2Uyn3h9IE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bKOcUHunAkBd1cl3vFDPTIRBHp6jnEL/qBiPXk/2KcoR24+fNqRt+c1Evgtp1rzxV
	 oVTX2UGbMbpuWfbwhzYEQSPJ71QfaCbet80gVk8alyzsawG6gWcab/M9mI7jmYq3tG
	 QQPJKep1S9eW3ZTnXovWH1tResqOe/Oe2guP4O8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E557DF80516;
	Thu, 17 Mar 2022 18:51:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5431DF80526; Thu, 17 Mar 2022 18:51:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E49FF802DF
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E49FF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hFprFEBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539509; x=1679075509;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fHsyIITrqRUCS4qFa0kVAZRjYFat2lFNdC2Uyn3h9IE=;
 b=hFprFEBc76umj9i4PItQ684bfULWpj/lTKf7MHiK8EEKGPwoZPXWF9sb
 mV6AAYC38q5XZAyjmlTRvmXKAoP3BouoA7fbqnf5Rl+/KlE76oQm1yTvN
 MOa1+GKjOMJopAINEfM/8rM1cGeFH3dyTHlDyV8HGU0F9fbZ9+f//lqrC
 4HaVuE5DlKqC80h0lwM5tc3F4uOd4ZZQPvnrpl5Hw1ZTKmO31x6tnzAfI
 0CYMbjnkULv5bZUIK0AyNSpOe41ZXhGBySrH8wfK3yLGmbrVh5BiH2OTr
 MrcBaC3DmgpFXveK8jYOddvpl0pJFjVIyz0ZnuUQVQfX7utXCtE2l/FEB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492908"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492908"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431125"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:22 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/19] ASoC: SOF: Add volume_get/put IPC3 ops
Date: Thu, 17 Mar 2022 10:50:31 -0700
Message-Id: <20220317175044.1752400-7-ranjani.sridharan@linux.intel.com>
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

Define and set the volume_get/put control IPC ops for IPC3.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/control.c      |  64 +++++-----------------
 sound/soc/sof/ipc3-control.c | 100 +++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+), 50 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index fb2311d880d3..9eb54b7024b3 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -45,26 +45,6 @@ static void update_mute_led(struct snd_sof_control *scontrol,
 #endif
 }
 
-static inline u32 mixer_to_ipc(unsigned int value, u32 *volume_map, int size)
-{
-	if (value >= size)
-		return volume_map[size - 1];
-
-	return volume_map[value];
-}
-
-static inline u32 ipc_to_mixer(u32 value, u32 *volume_map, int size)
-{
-	int i;
-
-	for (i = 0; i < size; i++) {
-		if (volume_map[i] >= value)
-			return i;
-	}
-
-	return i - 1;
-}
-
 static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
 {
 	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
@@ -85,7 +65,8 @@ static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
 	scontrol->comp_data_dirty = false;
 	ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
 	if (ret < 0) {
-		dev_err(scomp->dev, "error: failed to get control data: %d\n", ret);
+		dev_err(scomp->dev, "Failed to get control data: %d\n", ret);
+
 		/* Set the flag to re-try next time to get the data */
 		scontrol->comp_data_dirty = true;
 	}
@@ -94,19 +75,14 @@ static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
 int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
-	struct soc_mixer_control *sm =
-		(struct soc_mixer_control *)kcontrol->private_value;
+	struct soc_mixer_control *sm = (struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = sm->dobj.private;
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	unsigned int i, channels = scontrol->num_channels;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
-	snd_sof_refresh_control(scontrol);
-
-	/* read back each channel */
-	for (i = 0; i < channels; i++)
-		ucontrol->value.integer.value[i] =
-			ipc_to_mixer(cdata->chanv[i].value,
-				     scontrol->volume_table, sm->max + 1);
+	if (tplg_ops->control->volume_get)
+		return tplg_ops->control->volume_get(scontrol, ucontrol);
 
 	return 0;
 }
@@ -114,28 +90,16 @@ int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
-	struct soc_mixer_control *sm =
-		(struct soc_mixer_control *)kcontrol->private_value;
+	struct soc_mixer_control *sm = (struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = sm->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	unsigned int i, channels = scontrol->num_channels;
-	bool change = false;
-	u32 value;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
-	/* update each channel */
-	for (i = 0; i < channels; i++) {
-		value = mixer_to_ipc(ucontrol->value.integer.value[i],
-				     scontrol->volume_table, sm->max + 1);
-		change = change || (value != cdata->chanv[i].value);
-		cdata->chanv[i].channel = i;
-		cdata->chanv[i].value = value;
-	}
+	if (tplg_ops->control->volume_put)
+		return tplg_ops->control->volume_put(scontrol, ucontrol);
 
-	/* notify DSP of mixer updates */
-	if (pm_runtime_active(scomp->dev))
-		snd_sof_ipc_set_get_comp_data(scontrol, true);
-	return change;
+	return false;
 }
 
 int snd_sof_volume_info(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_info *uinfo)
diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index d4086e805c18..12aeb3ae4e52 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -11,6 +11,104 @@
 #include "sof-audio.h"
 #include "ipc3-ops.h"
 
+static inline u32 mixer_to_ipc(unsigned int value, u32 *volume_map, int size)
+{
+	if (value >= size)
+		return volume_map[size - 1];
+
+	return volume_map[value];
+}
+
+static inline u32 ipc_to_mixer(u32 value, u32 *volume_map, int size)
+{
+	int i;
+
+	for (i = 0; i < size; i++) {
+		if (volume_map[i] >= value)
+			return i;
+	}
+
+	return i - 1;
+}
+
+static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
+{
+	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	int ret;
+
+	if (!scontrol->comp_data_dirty)
+		return;
+
+	if (!pm_runtime_active(scomp->dev))
+		return;
+
+	/* set the ABI header values */
+	cdata->data->magic = SOF_ABI_MAGIC;
+	cdata->data->abi = SOF_ABI_VERSION;
+
+	/* refresh the component data from DSP */
+	scontrol->comp_data_dirty = false;
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
+	if (ret < 0) {
+		dev_err(scomp->dev, "Failed to get control data: %d\n", ret);
+
+		/* Set the flag to re-try next time to get the data */
+		scontrol->comp_data_dirty = true;
+	}
+}
+
+static int sof_ipc3_volume_get(struct snd_sof_control *scontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
+	unsigned int channels = scontrol->num_channels;
+	unsigned int i;
+
+	snd_sof_refresh_control(scontrol);
+
+	/* read back each channel */
+	for (i = 0; i < channels; i++)
+		ucontrol->value.integer.value[i] = ipc_to_mixer(cdata->chanv[i].value,
+								scontrol->volume_table,
+								scontrol->max + 1);
+
+	return 0;
+}
+
+static bool sof_ipc3_volume_put(struct snd_sof_control *scontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	unsigned int channels = scontrol->num_channels;
+	unsigned int i;
+	bool change = false;
+
+	/* update each channel */
+	for (i = 0; i < channels; i++) {
+		u32 value = mixer_to_ipc(ucontrol->value.integer.value[i],
+					 scontrol->volume_table, scontrol->max + 1);
+
+		change = change || (value != cdata->chanv[i].value);
+		cdata->chanv[i].channel = i;
+		cdata->chanv[i].value = value;
+	}
+
+	/* notify DSP of mixer updates */
+	if (pm_runtime_active(scomp->dev)) {
+		int ret = snd_sof_ipc_set_get_comp_data(scontrol, true);
+
+		if (ret < 0) {
+			dev_err(scomp->dev, "Failed to set mixer updates for %s\n",
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
@@ -152,5 +250,7 @@ static void sof_ipc3_control_update(struct snd_sof_dev *sdev, void *ipc_control_
 }
 
 const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops = {
+	.volume_put = sof_ipc3_volume_put,
+	.volume_get = sof_ipc3_volume_get,
 	.update = sof_ipc3_control_update,
 };
-- 
2.25.1

