Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35417B43E
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:14:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EAF016C8;
	Sat, 27 Apr 2019 20:13:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EAF016C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388887;
	bh=ZnodC1cwpWJ0qKb2PgOpMWEsbzAG9eKgpknMVfWjZzE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pHGw3f9/0ydkySL2NeqNQyz7dUaDZKrAPoKROzAcly5griw8fq+4VbKj13Z/4gyom
	 hRF2K4fDT9S7fnKBjVfmRtJcKQ2S/MkBdxZmv7XeAE8vP9LJHBDqPjiQ9EFLhF5Ze4
	 ATKCy/IPLqoLNqQBfmwo8+Y2qZfvXErIm9NY/24s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4585F89835;
	Sat, 27 Apr 2019 19:55:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BF93F8975D; Sat, 27 Apr 2019 19:53:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADC55F8973B;
 Sat, 27 Apr 2019 19:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADC55F8973B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ECT9iNEK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=wTX8U+/ywl56Co8fhRtEPvUFRxX20vGu2oOnfXkou1U=; b=ECT9iNEKsMgB
 9TNaRZBUuq6362gCsT04nsH1cbX3/Meic+nF6kk2factq0mdx9r39MLzLdK0hiMJQQgDJan+slzHE
 w4P19yPkbAxoUxnH+yNnQ673osU6rDT5MGxkEY+jYlg48hGwGUlKZG03KgOZObds9H9M5mjZQMU8b
 IoPGQ=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVa-0004rY-Ux; Sat, 27 Apr 2019 17:53:07 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id BBB51441D3D; Sat, 27 Apr 2019 18:53:03 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160519.30207-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175303.BBB51441D3D@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:53:03 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add Sound Open Firmware KControl
	support" to the asoc tree
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

   ASoC: SOF: Add Sound Open Firmware KControl support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From c3078f5397046755ddcd0447d202124c398469c5 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:05:07 -0500
Subject: [PATCH] ASoC: SOF: Add Sound Open Firmware KControl support

SOF exposes regular ALSA Kcontrols that are defined by topology. This
patch converts the Kcontrol IO to DSP IPC.

The current implementation is aligned with previous Intel solutions,
but is not optimal and can be improved:
a) for every get/put the host wakes up the DSP and generates an
IPC. The kernel should cache the values and generate an IPC only when
strictly necessary.
b) the firmware can be implemented to only instantiate the pipelines
and related control-related parts that are needed at a given time, and
power-gate the relevant SRAM blocks.

The development tasks for these two improvements has started, once
validated they will be provided in an update.

Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/control.c | 552 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 552 insertions(+)
 create mode 100644 sound/soc/sof/control.c

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
new file mode 100644
index 000000000000..11762c4580f1
--- /dev/null
+++ b/sound/soc/sof/control.c
@@ -0,0 +1,552 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//
+
+/* Mixer Controls */
+
+#include <linux/pm_runtime.h>
+#include "sof-priv.h"
+
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
+int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *sm =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = sm->dobj.private;
+	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	unsigned int i, channels = scontrol->num_channels;
+	int err, ret;
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: volume get failed to resume %d\n",
+				    ret);
+		pm_runtime_put_noidle(sdev->dev);
+		return ret;
+	}
+
+	/* get all the mixer data from DSP */
+	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+				      SOF_IPC_COMP_GET_VALUE,
+				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+				      SOF_CTRL_CMD_VOLUME,
+				      false);
+
+	/* read back each channel */
+	for (i = 0; i < channels; i++)
+		ucontrol->value.integer.value[i] =
+			ipc_to_mixer(cdata->chanv[i].value,
+				     scontrol->volume_table, sm->max + 1);
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: volume get failed to idle %d\n",
+				    err);
+	return 0;
+}
+
+int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *sm =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = sm->dobj.private;
+	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	unsigned int i, channels = scontrol->num_channels;
+	int ret, err;
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: volume put failed to resume %d\n",
+				    ret);
+		pm_runtime_put_noidle(sdev->dev);
+		return ret;
+	}
+
+	/* update each channel */
+	for (i = 0; i < channels; i++) {
+		cdata->chanv[i].value =
+			mixer_to_ipc(ucontrol->value.integer.value[i],
+				     scontrol->volume_table, sm->max + 1);
+		cdata->chanv[i].channel = i;
+	}
+
+	/* notify DSP of mixer updates */
+	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+				      SOF_IPC_COMP_SET_VALUE,
+				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+				      SOF_CTRL_CMD_VOLUME,
+				      true);
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: volume put failed to idle %d\n",
+				    err);
+	return 0;
+}
+
+int snd_sof_switch_get(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *sm =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = sm->dobj.private;
+	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	unsigned int i, channels = scontrol->num_channels;
+	int err, ret;
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: switch get failed to resume %d\n",
+				    ret);
+		pm_runtime_put_noidle(sdev->dev);
+		return ret;
+	}
+
+	/* get all the mixer data from DSP */
+	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+				      SOF_IPC_COMP_GET_VALUE,
+				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+				      SOF_CTRL_CMD_SWITCH,
+				      false);
+
+	/* read back each channel */
+	for (i = 0; i < channels; i++)
+		ucontrol->value.integer.value[i] = cdata->chanv[i].value;
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: switch get failed to idle %d\n",
+				    err);
+	return 0;
+}
+
+int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *sm =
+		(struct soc_mixer_control *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = sm->dobj.private;
+	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	unsigned int i, channels = scontrol->num_channels;
+	int ret, err;
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: switch put failed to resume %d\n",
+				    ret);
+		pm_runtime_put_noidle(sdev->dev);
+		return ret;
+	}
+
+	/* update each channel */
+	for (i = 0; i < channels; i++) {
+		cdata->chanv[i].value = ucontrol->value.integer.value[i];
+		cdata->chanv[i].channel = i;
+	}
+
+	/* notify DSP of mixer updates */
+	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+				      SOF_IPC_COMP_SET_VALUE,
+				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+				      SOF_CTRL_CMD_SWITCH,
+				      true);
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: switch put failed to idle %d\n",
+				    err);
+	return 0;
+}
+
+int snd_sof_enum_get(struct snd_kcontrol *kcontrol,
+		     struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *se =
+		(struct soc_enum *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = se->dobj.private;
+	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	unsigned int i, channels = scontrol->num_channels;
+	int err, ret;
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: enum get failed to resume %d\n",
+				    ret);
+		pm_runtime_put_noidle(sdev->dev);
+		return ret;
+	}
+
+	/* get all the enum data from DSP */
+	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+				      SOF_IPC_COMP_GET_VALUE,
+				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+				      SOF_CTRL_CMD_ENUM,
+				      false);
+
+	/* read back each channel */
+	for (i = 0; i < channels; i++)
+		ucontrol->value.enumerated.item[i] = cdata->chanv[i].value;
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: enum get failed to idle %d\n",
+				    err);
+	return 0;
+}
+
+int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
+		     struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_enum *se =
+		(struct soc_enum *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = se->dobj.private;
+	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	unsigned int i, channels = scontrol->num_channels;
+	int ret, err;
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: enum put failed to resume %d\n",
+				    ret);
+		pm_runtime_put_noidle(sdev->dev);
+		return ret;
+	}
+
+	/* update each channel */
+	for (i = 0; i < channels; i++) {
+		cdata->chanv[i].value = ucontrol->value.enumerated.item[i];
+		cdata->chanv[i].channel = i;
+	}
+
+	/* notify DSP of enum updates */
+	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+				      SOF_IPC_COMP_SET_VALUE,
+				      SOF_CTRL_TYPE_VALUE_CHAN_GET,
+				      SOF_CTRL_CMD_ENUM,
+				      true);
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: enum put failed to idle %d\n",
+				    err);
+	return 0;
+}
+
+int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
+		      struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_bytes_ext *be =
+		(struct soc_bytes_ext *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = be->dobj.private;
+	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	struct sof_abi_hdr *data = cdata->data;
+	size_t size;
+	int ret, err;
+
+	if (be->max > sizeof(ucontrol->value.bytes.data)) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: data max %d exceeds ucontrol data array size\n",
+				    be->max);
+		return -EINVAL;
+	}
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: bytes get failed to resume %d\n",
+				    ret);
+		pm_runtime_put_noidle(sdev->dev);
+		return ret;
+	}
+
+	/* get all the binary data from DSP */
+	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+				      SOF_IPC_COMP_GET_DATA,
+				      SOF_CTRL_TYPE_DATA_GET,
+				      scontrol->cmd,
+				      false);
+
+	size = data->size + sizeof(*data);
+	if (size > be->max) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: DSP sent %zu bytes max is %d\n",
+				    size, be->max);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* copy back to kcontrol */
+	memcpy(ucontrol->value.bytes.data, data, size);
+
+out:
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: bytes get failed to idle %d\n",
+				    err);
+	return ret;
+}
+
+int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
+		      struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_bytes_ext *be =
+		(struct soc_bytes_ext *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = be->dobj.private;
+	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	struct sof_abi_hdr *data = cdata->data;
+	int ret, err;
+
+	if (be->max > sizeof(ucontrol->value.bytes.data)) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: data max %d exceeds ucontrol data array size\n",
+				    be->max);
+		return -EINVAL;
+	}
+
+	if (data->size > be->max) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: size too big %d bytes max is %d\n",
+				    data->size, be->max);
+		return -EINVAL;
+	}
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: bytes put failed to resume %d\n",
+				    ret);
+		pm_runtime_put_noidle(sdev->dev);
+		return ret;
+	}
+
+	/* copy from kcontrol */
+	memcpy(data, ucontrol->value.bytes.data, data->size);
+
+	/* notify DSP of byte control updates */
+	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+				      SOF_IPC_COMP_SET_DATA,
+				      SOF_CTRL_TYPE_DATA_SET,
+				      scontrol->cmd,
+				      true);
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: bytes put failed to idle %d\n",
+				    err);
+	return ret;
+}
+
+int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
+			  const unsigned int __user *binary_data,
+			  unsigned int size)
+{
+	struct soc_bytes_ext *be =
+		(struct soc_bytes_ext *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = be->dobj.private;
+	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	struct snd_ctl_tlv header;
+	const struct snd_ctl_tlv __user *tlvd =
+		(const struct snd_ctl_tlv __user *)binary_data;
+	int ret;
+	int err;
+
+	/*
+	 * The beginning of bytes data contains a header from where
+	 * the length (as bytes) is needed to know the correct copy
+	 * length of data from tlvd->tlv.
+	 */
+	if (copy_from_user(&header, tlvd, sizeof(const struct snd_ctl_tlv)))
+		return -EFAULT;
+
+	/* be->max is coming from topology */
+	if (header.length > be->max) {
+		dev_err_ratelimited(sdev->dev, "error: Bytes data size %d exceeds max %d.\n",
+				    header.length, be->max);
+		return -EINVAL;
+	}
+
+	/* Check that header id matches the command */
+	if (header.numid != scontrol->cmd) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: incorrect numid %d\n",
+				    header.numid);
+		return -EINVAL;
+	}
+
+	if (copy_from_user(cdata->data, tlvd->tlv, header.length))
+		return -EFAULT;
+
+	if (cdata->data->magic != SOF_ABI_MAGIC) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: Wrong ABI magic 0x%08x.\n",
+				    cdata->data->magic);
+		return -EINVAL;
+	}
+
+	if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION, cdata->data->abi)) {
+		dev_err_ratelimited(sdev->dev, "error: Incompatible ABI version 0x%08x.\n",
+				    cdata->data->abi);
+		return -EINVAL;
+	}
+
+	if (cdata->data->size + sizeof(const struct sof_abi_hdr) > be->max) {
+		dev_err_ratelimited(sdev->dev, "error: Mismatch in ABI data size (truncated?).\n");
+		return -EINVAL;
+	}
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: bytes_ext put failed to resume %d\n",
+				    ret);
+		pm_runtime_put_noidle(sdev->dev);
+		return ret;
+	}
+
+	/* notify DSP of byte control updates */
+	snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+				      SOF_IPC_COMP_SET_DATA,
+				      SOF_CTRL_TYPE_DATA_SET,
+				      scontrol->cmd,
+				      true);
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: bytes_ext put failed to idle %d\n",
+				    err);
+
+	return ret;
+}
+
+int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
+			  unsigned int __user *binary_data,
+			  unsigned int size)
+{
+	struct soc_bytes_ext *be =
+		(struct soc_bytes_ext *)kcontrol->private_value;
+	struct snd_sof_control *scontrol = be->dobj.private;
+	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
+	struct snd_ctl_tlv header;
+	struct snd_ctl_tlv __user *tlvd =
+		(struct snd_ctl_tlv __user *)binary_data;
+	int data_size;
+	int err;
+	int ret;
+
+	ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(sdev->dev,
+				    "error: bytes_ext get failed to resume %d\n",
+				    ret);
+		pm_runtime_put_noidle(sdev->dev);
+		return ret;
+	}
+
+	/*
+	 * Decrement the limit by ext bytes header size to
+	 * ensure the user space buffer is not exceeded.
+	 */
+	size -= sizeof(const struct snd_ctl_tlv);
+
+	/* set the ABI header values */
+	cdata->data->magic = SOF_ABI_MAGIC;
+	cdata->data->abi = SOF_ABI_VERSION;
+
+	/* get all the component data from DSP */
+	ret = snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+					    SOF_IPC_COMP_GET_DATA,
+					    SOF_CTRL_TYPE_DATA_GET,
+					    scontrol->cmd,
+					    false);
+
+	/* Prevent read of other kernel data or possibly corrupt response */
+	data_size = cdata->data->size + sizeof(const struct sof_abi_hdr);
+
+	/* check data size doesn't exceed max coming from topology */
+	if (data_size > be->max) {
+		dev_err_ratelimited(sdev->dev, "error: user data size %d exceeds max size %d.\n",
+				    data_size, be->max);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	header.numid = scontrol->cmd;
+	header.length = data_size;
+	if (copy_to_user(tlvd, &header, sizeof(const struct snd_ctl_tlv))) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	if (copy_to_user(tlvd->tlv, cdata->data, data_size))
+		ret = -EFAULT;
+
+out:
+	pm_runtime_mark_last_busy(sdev->dev);
+	err = pm_runtime_put_autosuspend(sdev->dev);
+	if (err < 0)
+		dev_err_ratelimited(sdev->dev,
+				    "error: bytes_ext get failed to idle %d\n",
+				    err);
+	return ret;
+}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
