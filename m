Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0182B44BDB
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9286C1886;
	Thu, 13 Jun 2019 21:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9286C1886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453185;
	bh=Wg9ABrKP00czAR7qTxCR/sa6Y6Kzp+7LQJ1XemkHrpw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pjVLidozal7COjZfnphTuSPDcVAtJ74kX0oweVbom2JGwVXdQzwHVT7bfIYq8s/I6
	 9K0sxu+vDsJj34bWX5Y2+aZ5SONDVHdPB8253U2f+1DxUWwuu1Npt8pYm9miKiWPyK
	 rm53iusZNoozlVHRYhjbSZODRfR2HkGh2PEA5Q7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C18F89767;
	Thu, 13 Jun 2019 21:06:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25978F89758; Thu, 13 Jun 2019 21:06:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A112F89756
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A112F89756
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Bqno7vJY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=TiHpNvp6Dwe2JObflTjWRPr3ZoakiGJnPJv77gKT8T4=; b=Bqno7vJYVZxf
 chRWYg805LHe5UEPRcNWpb+d8LDuVfsrnp1LA4kumV3CsQoOISmkNk3fhOfgm+liNhBpz+Cu52kmw
 b+LvaQpc3Cr3MnTLSpH7I3zjcWRqEtAbvIZm1a93VrRETVsc56hUog2ebqNEFeAfnTJNZT+JGpb8e
 X4Ess=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbV2s-0005RN-TX; Thu, 13 Jun 2019 19:05:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 2C2CA440046; Thu, 13 Jun 2019 20:05:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20190612170148.15327-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190613190558.2C2CA440046@finisterre.sirena.org.uk>
Date: Thu, 13 Jun 2019 20:05:58 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: dont wake dsp up in kcontrol IO"
	to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: dont wake dsp up in kcontrol IO

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 0c888baba8e041c92c5c1882f25b8df5c29bff9f Mon Sep 17 00:00:00 2001
From: Bard Liao <yung-chuan.liao@linux.intel.com>
Date: Wed, 12 Jun 2019 12:01:48 -0500
Subject: [PATCH] ASoC: SOF: dont wake dsp up in kcontrol IO

Always get kcontrol value from cache, set kcontrol value to DSP
when DSP is active. Kcontrol values will be restored when DSP boot up.
We will set the default value of kcontrol in sof_complete to make sure
the value is align with firmware.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/control.c  | 270 ++++++---------------------------------
 sound/soc/sof/topology.c |  48 +++++++
 2 files changed, 86 insertions(+), 232 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 84e2cbfbbcbb..a4983f90ff5b 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -39,26 +39,8 @@ int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *sm =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = sm->dobj.private;
-	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
-	int err, ret;
-
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: volume get failed to resume %d\n",
-				    ret);
-		pm_runtime_put_noidle(sdev->dev);
-		return ret;
-	}
-
-	/* get all the mixer data from DSP */
-	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-				      SOF_IPC_COMP_GET_VALUE,
-				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
-				      SOF_CTRL_CMD_VOLUME,
-				      false);
 
 	/* read back each channel */
 	for (i = 0; i < channels; i++)
@@ -66,12 +48,6 @@ int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 			ipc_to_mixer(cdata->chanv[i].value,
 				     scontrol->volume_table, sm->max + 1);
 
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev,
-				    "error: volume get failed to idle %d\n",
-				    err);
 	return 0;
 }
 
@@ -84,16 +60,6 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
-	int ret, err;
-
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: volume put failed to resume %d\n",
-				    ret);
-		pm_runtime_put_noidle(sdev->dev);
-		return ret;
-	}
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
@@ -104,18 +70,13 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* notify DSP of mixer updates */
-	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-				      SOF_IPC_COMP_SET_VALUE,
-				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
-				      SOF_CTRL_CMD_VOLUME,
-				      true);
-
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev,
-				    "error: volume put failed to idle %d\n",
-				    err);
+	if (pm_runtime_active(sdev->dev))
+		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+					      SOF_IPC_COMP_SET_VALUE,
+					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+					      SOF_CTRL_CMD_VOLUME,
+					      true);
+
 	return 0;
 }
 
@@ -125,37 +86,13 @@ int snd_sof_switch_get(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *sm =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = sm->dobj.private;
-	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
-	int err, ret;
-
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: switch get failed to resume %d\n",
-				    ret);
-		pm_runtime_put_noidle(sdev->dev);
-		return ret;
-	}
-
-	/* get all the mixer data from DSP */
-	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-				      SOF_IPC_COMP_GET_VALUE,
-				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
-				      SOF_CTRL_CMD_SWITCH,
-				      false);
 
 	/* read back each channel */
 	for (i = 0; i < channels; i++)
 		ucontrol->value.integer.value[i] = cdata->chanv[i].value;
 
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev,
-				    "error: switch get failed to idle %d\n",
-				    err);
 	return 0;
 }
 
@@ -168,16 +105,6 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
-	int ret, err;
-
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: switch put failed to resume %d\n",
-				    ret);
-		pm_runtime_put_noidle(sdev->dev);
-		return ret;
-	}
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
@@ -186,18 +113,13 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* notify DSP of mixer updates */
-	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-				      SOF_IPC_COMP_SET_VALUE,
-				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
-				      SOF_CTRL_CMD_SWITCH,
-				      true);
-
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev,
-				    "error: switch put failed to idle %d\n",
-				    err);
+	if (pm_runtime_active(sdev->dev))
+		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+					      SOF_IPC_COMP_SET_VALUE,
+					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+					      SOF_CTRL_CMD_SWITCH,
+					      true);
+
 	return 0;
 }
 
@@ -207,37 +129,13 @@ int snd_sof_enum_get(struct snd_kcontrol *kcontrol,
 	struct soc_enum *se =
 		(struct soc_enum *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = se->dobj.private;
-	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
-	int err, ret;
-
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: enum get failed to resume %d\n",
-				    ret);
-		pm_runtime_put_noidle(sdev->dev);
-		return ret;
-	}
-
-	/* get all the enum data from DSP */
-	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-				      SOF_IPC_COMP_GET_VALUE,
-				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
-				      SOF_CTRL_CMD_ENUM,
-				      false);
 
 	/* read back each channel */
 	for (i = 0; i < channels; i++)
 		ucontrol->value.enumerated.item[i] = cdata->chanv[i].value;
 
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev,
-				    "error: enum get failed to idle %d\n",
-				    err);
 	return 0;
 }
 
@@ -250,16 +148,6 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_dev *sdev = scontrol->sdev;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
-	int ret, err;
-
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: enum put failed to resume %d\n",
-				    ret);
-		pm_runtime_put_noidle(sdev->dev);
-		return ret;
-	}
 
 	/* update each channel */
 	for (i = 0; i < channels; i++) {
@@ -268,18 +156,13 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* notify DSP of enum updates */
-	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-				      SOF_IPC_COMP_SET_VALUE,
-				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
-				      SOF_CTRL_CMD_ENUM,
-				      true);
-
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev,
-				    "error: enum put failed to idle %d\n",
-				    err);
+	if (pm_runtime_active(sdev->dev))
+		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+					      SOF_IPC_COMP_SET_VALUE,
+					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+					      SOF_CTRL_CMD_ENUM,
+					      true);
+
 	return 0;
 }
 
@@ -293,7 +176,7 @@ int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	struct sof_abi_hdr *data = cdata->data;
 	size_t size;
-	int ret, err;
+	int ret = 0;
 
 	if (be->max > sizeof(ucontrol->value.bytes.data)) {
 		dev_err_ratelimited(sdev->dev,
@@ -302,22 +185,6 @@ int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: bytes get failed to resume %d\n",
-				    ret);
-		pm_runtime_put_noidle(sdev->dev);
-		return ret;
-	}
-
-	/* get all the binary data from DSP */
-	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-				      SOF_IPC_COMP_GET_DATA,
-				      SOF_CTRL_TYPE_DATA_GET,
-				      scontrol->cmd,
-				      false);
-
 	size = data->size + sizeof(*data);
 	if (size > be->max) {
 		dev_err_ratelimited(sdev->dev,
@@ -331,12 +198,6 @@ int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 	memcpy(ucontrol->value.bytes.data, data, size);
 
 out:
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev,
-				    "error: bytes get failed to idle %d\n",
-				    err);
 	return ret;
 }
 
@@ -350,7 +211,6 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	struct sof_abi_hdr *data = cdata->data;
 	size_t size = data->size + sizeof(*data);
-	int ret, err;
 
 	if (be->max > sizeof(ucontrol->value.bytes.data)) {
 		dev_err_ratelimited(sdev->dev,
@@ -366,32 +226,18 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: bytes put failed to resume %d\n",
-				    ret);
-		pm_runtime_put_noidle(sdev->dev);
-		return ret;
-	}
-
 	/* copy from kcontrol */
 	memcpy(data, ucontrol->value.bytes.data, size);
 
 	/* notify DSP of byte control updates */
-	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-				      SOF_IPC_COMP_SET_DATA,
-				      SOF_CTRL_TYPE_DATA_SET,
-				      scontrol->cmd,
-				      true);
-
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev,
-				    "error: bytes put failed to idle %d\n",
-				    err);
-	return ret;
+	if (pm_runtime_active(sdev->dev))
+		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+					      SOF_IPC_COMP_SET_DATA,
+					      SOF_CTRL_TYPE_DATA_SET,
+					      scontrol->cmd,
+					      true);
+
+	return 0;
 }
 
 int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
@@ -406,8 +252,6 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_tlv header;
 	const struct snd_ctl_tlv __user *tlvd =
 		(const struct snd_ctl_tlv __user *)binary_data;
-	int ret;
-	int err;
 
 	/*
 	 * The beginning of bytes data contains a header from where
@@ -453,30 +297,15 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: bytes_ext put failed to resume %d\n",
-				    ret);
-		pm_runtime_put_noidle(sdev->dev);
-		return ret;
-	}
-
 	/* notify DSP of byte control updates */
-	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-				      SOF_IPC_COMP_SET_DATA,
-				      SOF_CTRL_TYPE_DATA_SET,
-				      scontrol->cmd,
-				      true);
-
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev,
-				    "error: bytes_ext put failed to idle %d\n",
-				    err);
+	if (pm_runtime_active(sdev->dev))
+		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+					      SOF_IPC_COMP_SET_DATA,
+					      SOF_CTRL_TYPE_DATA_SET,
+					      scontrol->cmd,
+					      true);
 
-	return ret;
+	return 0;
 }
 
 int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
@@ -492,17 +321,7 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_tlv __user *tlvd =
 		(struct snd_ctl_tlv __user *)binary_data;
 	int data_size;
-	int err;
-	int ret;
-
-	ret = pm_runtime_get_sync(sdev->dev);
-	if (ret < 0) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: bytes_ext get failed to resume %d\n",
-				    ret);
-		pm_runtime_put_noidle(sdev->dev);
-		return ret;
-	}
+	int ret = 0;
 
 	/*
 	 * Decrement the limit by ext bytes header size to
@@ -514,13 +333,6 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	cdata->data->magic = SOF_ABI_MAGIC;
 	cdata->data->abi = SOF_ABI_VERSION;
 
-	/* get all the component data from DSP */
-	ret = snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-					    SOF_IPC_COMP_GET_DATA,
-					    SOF_CTRL_TYPE_DATA_GET,
-					    scontrol->cmd,
-					    false);
-
 	/* Prevent read of other kernel data or possibly corrupt response */
 	data_size = cdata->data->size + sizeof(const struct sof_abi_hdr);
 
@@ -543,11 +355,5 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 		ret = -EFAULT;
 
 out:
-	pm_runtime_mark_last_busy(sdev->dev);
-	err = pm_runtime_put_autosuspend(sdev->dev);
-	if (err < 0)
-		dev_err_ratelimited(sdev->dev,
-				    "error: bytes_ext get failed to idle %d\n",
-				    err);
 	return ret;
 }
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 8e00f829bfdb..aaf459af89d0 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3016,6 +3016,49 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
+/* Function to set the initial value of SOF kcontrols.
+ * The value will be stored in scontrol->control_data
+ */
+static int snd_sof_cache_kcontrol_val(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_control *scontrol = NULL;
+	int ipc_cmd, ctrl_type;
+	int ret = 0;
+
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
+
+		/* notify DSP of kcontrol values */
+		switch (scontrol->cmd) {
+		case SOF_CTRL_CMD_VOLUME:
+		case SOF_CTRL_CMD_ENUM:
+		case SOF_CTRL_CMD_SWITCH:
+			ipc_cmd = SOF_IPC_COMP_GET_VALUE;
+			ctrl_type = SOF_CTRL_TYPE_VALUE_CHAN_GET;
+			break;
+		case SOF_CTRL_CMD_BINARY:
+			ipc_cmd = SOF_IPC_COMP_GET_DATA;
+			ctrl_type = SOF_CTRL_TYPE_DATA_GET;
+			break;
+		default:
+			dev_err(sdev->dev,
+				"error: Invalid scontrol->cmd: %d\n",
+				scontrol->cmd);
+			return -EINVAL;
+		}
+		ret = snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+						    ipc_cmd, ctrl_type,
+						    scontrol->cmd,
+						    false);
+		if (ret < 0) {
+			dev_warn(sdev->dev,
+				"error: kcontrol value get for widget: %d\n",
+				scontrol->comp_id);
+		}
+	}
+
+	return ret;
+}
+
 int snd_sof_complete_pipeline(struct snd_sof_dev *sdev,
 			      struct snd_sof_widget *swidget)
 {
@@ -3059,6 +3102,11 @@ static void sof_complete(struct snd_soc_component *scomp)
 			break;
 		}
 	}
+	/*
+	 * cache initial values of SOF kcontrols by reading DSP value over
+	 * IPC. It may be overwritten by alsa-mixer after booting up
+	 */
+	snd_sof_cache_kcontrol_val(sdev);
 }
 
 /* manifest - optional to inform component of manifest */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
