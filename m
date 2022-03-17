Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8BA4DCCFC
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:55:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D86E191F;
	Thu, 17 Mar 2022 18:54:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D86E191F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539710;
	bh=//31PYFIAylqF9BN8lgzTSi6M1KjhCNv4fekcap99XU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PGdqEY8n6fb5SLkEnUDQzeS165Urb9zYgqafeFCD8dreeDbB0jVJs/T5u55ozF8DN
	 BZYAzc2ZdQeZpmNQL10/SnMyxYpr2OP2A5BRkIuzOoAEZwY4xjqso/5hJkEky1eh5P
	 SI3jz50NZTpZ1jQsQrLtaZeQlXQYX2kJrvQ7StGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B218BF80539;
	Thu, 17 Mar 2022 18:52:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7284F80534; Thu, 17 Mar 2022 18:51:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70ED7F80516
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70ED7F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="S08ff3/+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539512; x=1679075512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=//31PYFIAylqF9BN8lgzTSi6M1KjhCNv4fekcap99XU=;
 b=S08ff3/+JMxFJCYL3MvyTcm6AJpJHLlKwvdhkg5IwqJko59Mh+ShWzLS
 UpAI1NJyXWLZemNITtotC3hwGFTWFqYu9Znb3RRdPCiXy2ig+cYus9Xce
 7vrGFnUuOVS9T2fMXaLVAg+9USyK3nI3uVdSZqeRWc/sliWgiE+An2w0f
 490DeW0AhGzM1a2pQo+NxTWm8/vXUiOei7LrnEiSPUk8i4y/l7Iew9XwX
 E7Tja8m67Uy+cx6msPdTQGCEbNyF+QrmpQqHfoUOksBvSwTxt4RnLlQBv
 DfZoOHRi9MWcxohA5uGMIyIfVwiKm8jG5C1/pI60xRXtAKbwIoTSMnQ6m A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492916"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492916"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431134"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:22 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/19] ASoC: SOF: Add bytes_get/put control IPC ops for IPC3
Date: Thu, 17 Mar 2022 10:50:34 -0700
Message-Id: <20220317175044.1752400-10-ranjani.sridharan@linux.intel.com>
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

Define and set the bytes_get/put IPC control ops for IPC3.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/control.c      | 64 ++++++----------------------------
 sound/soc/sof/ipc3-control.c | 67 ++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+), 54 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 499d426c5d38..2a4997e1cd1e 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -190,35 +190,14 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 		      struct snd_ctl_elem_value *ucontrol)
 {
-	struct soc_bytes_ext *be =
-		(struct soc_bytes_ext *)kcontrol->private_value;
+	struct soc_bytes_ext *be = (struct soc_bytes_ext *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = be->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	struct sof_abi_hdr *data = cdata->data;
-	size_t size;
-
-	snd_sof_refresh_control(scontrol);
-
-	if (be->max > sizeof(ucontrol->value.bytes.data)) {
-		dev_err_ratelimited(scomp->dev,
-				    "error: data max %d exceeds ucontrol data array size\n",
-				    be->max);
-		return -EINVAL;
-	}
-
-	/* be->max has been verified to be >= sizeof(struct sof_abi_hdr) */
-	if (data->size > be->max - sizeof(*data)) {
-		dev_err_ratelimited(scomp->dev,
-				    "error: %u bytes of control data is invalid, max is %zu\n",
-				    data->size, be->max - sizeof(*data));
-		return -EINVAL;
-	}
-
-	size = data->size + sizeof(*data);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
-	/* copy back to kcontrol */
-	memcpy(ucontrol->value.bytes.data, data, size);
+	if (tplg_ops->control->bytes_get)
+		return tplg_ops->control->bytes_get(scontrol, ucontrol);
 
 	return 0;
 }
@@ -226,37 +205,14 @@ int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 		      struct snd_ctl_elem_value *ucontrol)
 {
-	struct soc_bytes_ext *be =
-		(struct soc_bytes_ext *)kcontrol->private_value;
+	struct soc_bytes_ext *be = (struct soc_bytes_ext *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = be->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	struct sof_abi_hdr *data = cdata->data;
-	size_t size;
-
-	if (be->max > sizeof(ucontrol->value.bytes.data)) {
-		dev_err_ratelimited(scomp->dev,
-				    "error: data max %d exceeds ucontrol data array size\n",
-				    be->max);
-		return -EINVAL;
-	}
-
-	/* be->max has been verified to be >= sizeof(struct sof_abi_hdr) */
-	if (data->size > be->max - sizeof(*data)) {
-		dev_err_ratelimited(scomp->dev,
-				    "error: data size too big %u bytes max is %zu\n",
-				    data->size, be->max - sizeof(*data));
-		return -EINVAL;
-	}
-
-	size = data->size + sizeof(*data);
-
-	/* copy from kcontrol */
-	memcpy(data, ucontrol->value.bytes.data, size);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
-	/* notify DSP of byte control updates */
-	if (pm_runtime_active(scomp->dev))
-		snd_sof_ipc_set_get_comp_data(scontrol, true);
+	if (tplg_ops->control->bytes_put)
+		return tplg_ops->control->bytes_put(scontrol, ucontrol);
 
 	return 0;
 }
diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index 03948f8f7eb0..df8e4df9663d 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -205,6 +205,71 @@ static bool sof_ipc3_enum_put(struct snd_sof_control *scontrol,
 	return change;
 }
 
+static int sof_ipc3_bytes_get(struct snd_sof_control *scontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct sof_abi_hdr *data = cdata->data;
+	size_t size;
+
+	snd_sof_refresh_control(scontrol);
+
+	if (scontrol->max_size > sizeof(ucontrol->value.bytes.data)) {
+		dev_err_ratelimited(scomp->dev, "data max %zu exceeds ucontrol data array size\n",
+				    scontrol->max_size);
+		return -EINVAL;
+	}
+
+	/* be->max has been verified to be >= sizeof(struct sof_abi_hdr) */
+	if (data->size > scontrol->max_size - sizeof(*data)) {
+		dev_err_ratelimited(scomp->dev,
+				    "%u bytes of control data is invalid, max is %zu\n",
+				    data->size, scontrol->max_size - sizeof(*data));
+		return -EINVAL;
+	}
+
+	size = data->size + sizeof(*data);
+
+	/* copy back to kcontrol */
+	memcpy(ucontrol->value.bytes.data, data, size);
+
+	return 0;
+}
+
+static int sof_ipc3_bytes_put(struct snd_sof_control *scontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct sof_abi_hdr *data = cdata->data;
+	size_t size;
+
+	if (scontrol->max_size > sizeof(ucontrol->value.bytes.data)) {
+		dev_err_ratelimited(scomp->dev, "data max %zu exceeds ucontrol data array size\n",
+				    scontrol->max_size);
+		return -EINVAL;
+	}
+
+	/* scontrol->max_size has been verified to be >= sizeof(struct sof_abi_hdr) */
+	if (data->size > scontrol->max_size - sizeof(*data)) {
+		dev_err_ratelimited(scomp->dev, "data size too big %u bytes max is %zu\n",
+				    data->size, scontrol->max_size - sizeof(*data));
+		return -EINVAL;
+	}
+
+	size = data->size + sizeof(*data);
+
+	/* copy from kcontrol */
+	memcpy(data, ucontrol->value.bytes.data, size);
+
+	/* notify DSP of byte control updates */
+	if (pm_runtime_active(scomp->dev))
+		return snd_sof_ipc_set_get_comp_data(scontrol, true);
+
+	return 0;
+}
+
 static void snd_sof_update_control(struct snd_sof_control *scontrol,
 				   struct sof_ipc_ctrl_data *cdata)
 {
@@ -352,5 +417,7 @@ const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops = {
 	.switch_get = sof_ipc3_switch_get,
 	.enum_put = sof_ipc3_enum_put,
 	.enum_get = sof_ipc3_enum_get,
+	.bytes_put = sof_ipc3_bytes_put,
+	.bytes_get = sof_ipc3_bytes_get,
 	.update = sof_ipc3_control_update,
 };
-- 
2.25.1

