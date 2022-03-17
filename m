Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE3B4DCD01
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:56:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 126CA190B;
	Thu, 17 Mar 2022 18:55:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 126CA190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539777;
	bh=s54QIOYxLYpwYIrccYCban+d46ntW9dfhPYNkjuOt28=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOi0G/6PTae/bPGDOduZcxDnq7gW9EHzq4/cU9xkfbespDppVLfwfo0LI+JIwbpla
	 uWRqdj/IiM+Mj75n30I+ApV9Xx1nZxcmbfyglVPGQaMdcvCPdjzLUStuCyt8KclZTW
	 susUUKmDLQA/6vgITcDQZQiGNWU6hppgfdgeVQUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 524FBF80553;
	Thu, 17 Mar 2022 18:52:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B752F8023A; Thu, 17 Mar 2022 18:52:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEC97F8023A
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEC97F8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hSYyJpIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539515; x=1679075515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s54QIOYxLYpwYIrccYCban+d46ntW9dfhPYNkjuOt28=;
 b=hSYyJpIUJ/sK2rGxsZkQ9kA/Qopt2MyP41rO3cCJ4tlKz+Ca+yOAUHPq
 G6XxmSwdzk+cBWFLOMMIWlG8kv+rEOH3Nm720fwA8SCpxbQBzA0pbhuWS
 BpKdmggGbsTe/NGB036d/kjB/MeiRDTy8KgrNCyjlEOyO/mIjdY1dyFsS
 g84iToAbcys/OpuS0J2tHyINQSyBOECN2J833/1GuODkcizLVNiLngNJy
 kCshb3RwAwMbEFQgGpKfHk95k7NG7o8W1EV1SFINEm+nQzukqCtdFfOPN
 Rs/U1tf3qzB3sMCN2zXIgVK2mkT3MlCaGif+l9DFGj/gNBDkvlN8mqAYX Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492918"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492918"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431139"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:22 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/19] ASoC: SOF: Add bytes_ext control IPC ops for IPC3
Date: Thu, 17 Mar 2022 10:50:35 -0700
Message-Id: <20220317175044.1752400-11-ranjani.sridharan@linux.intel.com>
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

Define and set the get/put/volatile_get control IPC ops for byte
controls for IPC3.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/control.c      | 197 +++--------------------------------
 sound/soc/sof/ipc3-control.c | 171 ++++++++++++++++++++++++++++++
 2 files changed, 188 insertions(+), 180 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 2a4997e1cd1e..de1778c4002b 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -45,33 +45,6 @@ static void update_mute_led(struct snd_sof_control *scontrol,
 #endif
 }
 
-static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
-{
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	struct snd_soc_component *scomp = scontrol->scomp;
-	int ret;
-
-	if (!scontrol->comp_data_dirty)
-		return;
-
-	if (!pm_runtime_active(scomp->dev))
-		return;
-
-	/* set the ABI header values */
-	cdata->data->magic = SOF_ABI_MAGIC;
-	cdata->data->abi = SOF_ABI_VERSION;
-
-	/* refresh the component data from DSP */
-	scontrol->comp_data_dirty = false;
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
-	if (ret < 0) {
-		dev_err(scomp->dev, "Failed to get control data: %d\n", ret);
-
-		/* Set the flag to re-try next time to get the data */
-		scontrol->comp_data_dirty = true;
-	}
-}
-
 int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_value *ucontrol)
 {
@@ -221,74 +194,18 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 			  const unsigned int __user *binary_data,
 			  unsigned int size)
 {
-	struct soc_bytes_ext *be =
-		(struct soc_bytes_ext *)kcontrol->private_value;
+	struct soc_bytes_ext *be = (struct soc_bytes_ext *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = be->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	struct snd_ctl_tlv header;
-	const struct snd_ctl_tlv __user *tlvd =
-		(const struct snd_ctl_tlv __user *)binary_data;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
 	/* make sure we have at least a header */
 	if (size < sizeof(struct snd_ctl_tlv))
 		return -EINVAL;
 
-	/*
-	 * The beginning of bytes data contains a header from where
-	 * the length (as bytes) is needed to know the correct copy
-	 * length of data from tlvd->tlv.
-	 */
-	if (copy_from_user(&header, tlvd, sizeof(struct snd_ctl_tlv)))
-		return -EFAULT;
-
-	/* make sure TLV info is consistent */
-	if (header.length + sizeof(struct snd_ctl_tlv) > size) {
-		dev_err_ratelimited(scomp->dev, "error: inconsistent TLV, data %d + header %zu > %d\n",
-				    header.length, sizeof(struct snd_ctl_tlv), size);
-		return -EINVAL;
-	}
-
-	/* be->max is coming from topology */
-	if (header.length > be->max) {
-		dev_err_ratelimited(scomp->dev, "error: Bytes data size %d exceeds max %d.\n",
-				    header.length, be->max);
-		return -EINVAL;
-	}
-
-	/* Check that header id matches the command */
-	if (header.numid != cdata->cmd) {
-		dev_err_ratelimited(scomp->dev,
-				    "error: incorrect numid %d\n",
-				    header.numid);
-		return -EINVAL;
-	}
-
-	if (copy_from_user(cdata->data, tlvd->tlv, header.length))
-		return -EFAULT;
-
-	if (cdata->data->magic != SOF_ABI_MAGIC) {
-		dev_err_ratelimited(scomp->dev,
-				    "error: Wrong ABI magic 0x%08x.\n",
-				    cdata->data->magic);
-		return -EINVAL;
-	}
-
-	if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION, cdata->data->abi)) {
-		dev_err_ratelimited(scomp->dev, "error: Incompatible ABI version 0x%08x.\n",
-				    cdata->data->abi);
-		return -EINVAL;
-	}
-
-	/* be->max has been verified to be >= sizeof(struct sof_abi_hdr) */
-	if (cdata->data->size > be->max - sizeof(struct sof_abi_hdr)) {
-		dev_err_ratelimited(scomp->dev, "error: Mismatch in ABI data size (truncated?).\n");
-		return -EINVAL;
-	}
-
-	/* notify DSP of byte control updates */
-	if (pm_runtime_active(scomp->dev))
-		snd_sof_ipc_set_get_comp_data(scontrol, true);
+	if (tplg_ops->control->bytes_ext_put)
+		return tplg_ops->control->bytes_ext_put(scontrol, binary_data, size);
 
 	return 0;
 }
@@ -299,67 +216,24 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 	struct soc_bytes_ext *be = (struct soc_bytes_ext *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = be->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	struct snd_ctl_tlv header;
-	struct snd_ctl_tlv __user *tlvd = (struct snd_ctl_tlv __user *)binary_data;
-	size_t data_size;
-	int ret;
-	int err;
-
-	/*
-	 * Decrement the limit by ext bytes header size to
-	 * ensure the user space buffer is not exceeded.
-	 */
-	if (size < sizeof(struct snd_ctl_tlv))
-		return -ENOSPC;
-	size -= sizeof(struct snd_ctl_tlv);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	int ret, err;
 
 	ret = pm_runtime_get_sync(scomp->dev);
 	if (ret < 0 && ret != -EACCES) {
-		dev_err_ratelimited(scomp->dev, "error: bytes_ext get failed to resume %d\n", ret);
+		dev_err_ratelimited(scomp->dev, "%s: failed to resume %d\n", __func__, ret);
 		pm_runtime_put_noidle(scomp->dev);
 		return ret;
 	}
 
-	/* set the ABI header values */
-	cdata->data->magic = SOF_ABI_MAGIC;
-	cdata->data->abi = SOF_ABI_VERSION;
-	/* get all the component data from DSP */
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
-	if (ret < 0)
-		goto out;
-
-	/* check data size doesn't exceed max coming from topology */
-	if (cdata->data->size > be->max - sizeof(struct sof_abi_hdr)) {
-		dev_err_ratelimited(scomp->dev, "error: user data size %d exceeds max size %zu.\n",
-				    cdata->data->size,
-				    be->max - sizeof(struct sof_abi_hdr));
-		ret = -EINVAL;
-		goto out;
-	}
-
-	data_size = cdata->data->size + sizeof(struct sof_abi_hdr);
+	if (tplg_ops->control->bytes_ext_volatile_get)
+		ret = tplg_ops->control->bytes_ext_volatile_get(scontrol, binary_data, size);
 
-	/* make sure we don't exceed size provided by user space for data */
-	if (data_size > size) {
-		ret = -ENOSPC;
-		goto out;
-	}
-
-	header.numid = cdata->cmd;
-	header.length = data_size;
-	if (copy_to_user(tlvd, &header, sizeof(struct snd_ctl_tlv))) {
-		ret = -EFAULT;
-		goto out;
-	}
-
-	if (copy_to_user(tlvd->tlv, cdata->data, data_size))
-		ret = -EFAULT;
-out:
 	pm_runtime_mark_last_busy(scomp->dev);
 	err = pm_runtime_put_autosuspend(scomp->dev);
 	if (err < 0)
-		dev_err_ratelimited(scomp->dev, "error: bytes_ext get failed to idle %d\n", err);
+		dev_err_ratelimited(scomp->dev, "%s: failed to idle %d\n", __func__, err);
 
 	return ret;
 }
@@ -368,51 +242,14 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 			  unsigned int __user *binary_data,
 			  unsigned int size)
 {
-	struct soc_bytes_ext *be =
-		(struct soc_bytes_ext *)kcontrol->private_value;
+	struct soc_bytes_ext *be = (struct soc_bytes_ext *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = be->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
-	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
-	struct snd_ctl_tlv header;
-	struct snd_ctl_tlv __user *tlvd =
-		(struct snd_ctl_tlv __user *)binary_data;
-	size_t data_size;
-
-	snd_sof_refresh_control(scontrol);
-
-	/*
-	 * Decrement the limit by ext bytes header size to
-	 * ensure the user space buffer is not exceeded.
-	 */
-	if (size < sizeof(struct snd_ctl_tlv))
-		return -ENOSPC;
-	size -= sizeof(struct snd_ctl_tlv);
-
-	/* set the ABI header values */
-	cdata->data->magic = SOF_ABI_MAGIC;
-	cdata->data->abi = SOF_ABI_VERSION;
-
-	/* check data size doesn't exceed max coming from topology */
-	if (cdata->data->size > be->max - sizeof(struct sof_abi_hdr)) {
-		dev_err_ratelimited(scomp->dev, "error: user data size %d exceeds max size %zu.\n",
-				    cdata->data->size,
-				    be->max - sizeof(struct sof_abi_hdr));
-		return -EINVAL;
-	}
-
-	data_size = cdata->data->size + sizeof(struct sof_abi_hdr);
-
-	/* make sure we don't exceed size provided by user space for data */
-	if (data_size > size)
-		return -ENOSPC;
-
-	header.numid = cdata->cmd;
-	header.length = data_size;
-	if (copy_to_user(tlvd, &header, sizeof(struct snd_ctl_tlv)))
-		return -EFAULT;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
-	if (copy_to_user(tlvd->tlv, cdata->data, data_size))
-		return -EFAULT;
+	if (tplg_ops->control->bytes_ext_get)
+		return tplg_ops->control->bytes_ext_get(scontrol, binary_data, size);
 
 	return 0;
 }
diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index df8e4df9663d..cdd5ad860a94 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -270,6 +270,174 @@ static int sof_ipc3_bytes_put(struct snd_sof_control *scontrol,
 	return 0;
 }
 
+static int sof_ipc3_bytes_ext_get(struct snd_sof_control *scontrol,
+				  const unsigned int __user *binary_data, unsigned int size)
+{
+	struct snd_ctl_tlv __user *tlvd = (struct snd_ctl_tlv __user *)binary_data;
+	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct snd_ctl_tlv header;
+	size_t data_size;
+
+	snd_sof_refresh_control(scontrol);
+
+	/*
+	 * Decrement the limit by ext bytes header size to
+	 * ensure the user space buffer is not exceeded.
+	 */
+	if (size < sizeof(struct snd_ctl_tlv))
+		return -ENOSPC;
+
+	size -= sizeof(struct snd_ctl_tlv);
+
+	/* set the ABI header values */
+	cdata->data->magic = SOF_ABI_MAGIC;
+	cdata->data->abi = SOF_ABI_VERSION;
+
+	/* check data size doesn't exceed max coming from topology */
+	if (cdata->data->size > scontrol->max_size - sizeof(struct sof_abi_hdr)) {
+		dev_err_ratelimited(scomp->dev, "User data size %d exceeds max size %zu\n",
+				    cdata->data->size,
+				    scontrol->max_size - sizeof(struct sof_abi_hdr));
+		return -EINVAL;
+	}
+
+	data_size = cdata->data->size + sizeof(struct sof_abi_hdr);
+
+	/* make sure we don't exceed size provided by user space for data */
+	if (data_size > size)
+		return -ENOSPC;
+
+	header.numid = cdata->cmd;
+	header.length = data_size;
+	if (copy_to_user(tlvd, &header, sizeof(struct snd_ctl_tlv)))
+		return -EFAULT;
+
+	if (copy_to_user(tlvd->tlv, cdata->data, data_size))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int sof_ipc3_bytes_ext_put(struct snd_sof_control *scontrol,
+				  const unsigned int __user *binary_data,
+				  unsigned int size)
+{
+	const struct snd_ctl_tlv __user *tlvd = (const struct snd_ctl_tlv __user *)binary_data;
+	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct snd_ctl_tlv header;
+
+	/*
+	 * The beginning of bytes data contains a header from where
+	 * the length (as bytes) is needed to know the correct copy
+	 * length of data from tlvd->tlv.
+	 */
+	if (copy_from_user(&header, tlvd, sizeof(struct snd_ctl_tlv)))
+		return -EFAULT;
+
+	/* make sure TLV info is consistent */
+	if (header.length + sizeof(struct snd_ctl_tlv) > size) {
+		dev_err_ratelimited(scomp->dev, "Inconsistent TLV, data %d + header %zu > %d\n",
+				    header.length, sizeof(struct snd_ctl_tlv), size);
+		return -EINVAL;
+	}
+
+	/* be->max is coming from topology */
+	if (header.length > scontrol->max_size) {
+		dev_err_ratelimited(scomp->dev, "Bytes data size %d exceeds max %zu\n",
+				    header.length, scontrol->max_size);
+		return -EINVAL;
+	}
+
+	/* Check that header id matches the command */
+	if (header.numid != cdata->cmd) {
+		dev_err_ratelimited(scomp->dev, "Incorrect command for bytes put %d\n",
+				    header.numid);
+		return -EINVAL;
+	}
+
+	if (copy_from_user(cdata->data, tlvd->tlv, header.length))
+		return -EFAULT;
+
+	if (cdata->data->magic != SOF_ABI_MAGIC) {
+		dev_err_ratelimited(scomp->dev, "Wrong ABI magic 0x%08x\n", cdata->data->magic);
+		return -EINVAL;
+	}
+
+	if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION, cdata->data->abi)) {
+		dev_err_ratelimited(scomp->dev, "Incompatible ABI version 0x%08x\n",
+				    cdata->data->abi);
+		return -EINVAL;
+	}
+
+	/* be->max has been verified to be >= sizeof(struct sof_abi_hdr) */
+	if (cdata->data->size > scontrol->max_size - sizeof(struct sof_abi_hdr)) {
+		dev_err_ratelimited(scomp->dev, "Mismatch in ABI data size (truncated?)\n");
+		return -EINVAL;
+	}
+
+	/* notify DSP of byte control updates */
+	if (pm_runtime_active(scomp->dev))
+		return snd_sof_ipc_set_get_comp_data(scontrol, true);
+
+	return 0;
+}
+
+static int sof_ipc3_bytes_ext_volatile_get(struct snd_sof_control *scontrol,
+					   const unsigned int __user *binary_data,
+					   unsigned int size)
+{
+	struct snd_ctl_tlv __user *tlvd = (struct snd_ctl_tlv __user *)binary_data;
+	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct snd_ctl_tlv header;
+	size_t data_size;
+	int ret;
+
+	/*
+	 * Decrement the limit by ext bytes header size to
+	 * ensure the user space buffer is not exceeded.
+	 */
+	if (size < sizeof(struct snd_ctl_tlv))
+		return -ENOSPC;
+
+	size -= sizeof(struct snd_ctl_tlv);
+
+	/* set the ABI header values */
+	cdata->data->magic = SOF_ABI_MAGIC;
+	cdata->data->abi = SOF_ABI_VERSION;
+
+	/* get all the component data from DSP */
+	ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
+	if (ret < 0)
+		return ret;
+
+	/* check data size doesn't exceed max coming from topology */
+	if (cdata->data->size > scontrol->max_size - sizeof(struct sof_abi_hdr)) {
+		dev_err_ratelimited(scomp->dev, "User data size %d exceeds max size %zu\n",
+				    cdata->data->size,
+				    scontrol->max_size - sizeof(struct sof_abi_hdr));
+		return -EINVAL;
+	}
+
+	data_size = cdata->data->size + sizeof(struct sof_abi_hdr);
+
+	/* make sure we don't exceed size provided by user space for data */
+	if (data_size > size)
+		return -ENOSPC;
+
+	header.numid = cdata->cmd;
+	header.length = data_size;
+	if (copy_to_user(tlvd, &header, sizeof(struct snd_ctl_tlv)))
+		return -EFAULT;
+
+	if (copy_to_user(tlvd->tlv, cdata->data, data_size))
+		return -EFAULT;
+
+	return ret;
+}
+
 static void snd_sof_update_control(struct snd_sof_control *scontrol,
 				   struct sof_ipc_ctrl_data *cdata)
 {
@@ -419,5 +587,8 @@ const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops = {
 	.enum_get = sof_ipc3_enum_get,
 	.bytes_put = sof_ipc3_bytes_put,
 	.bytes_get = sof_ipc3_bytes_get,
+	.bytes_ext_put = sof_ipc3_bytes_ext_put,
+	.bytes_ext_get = sof_ipc3_bytes_ext_get,
+	.bytes_ext_volatile_get = sof_ipc3_bytes_ext_volatile_get,
 	.update = sof_ipc3_control_update,
 };
-- 
2.25.1

