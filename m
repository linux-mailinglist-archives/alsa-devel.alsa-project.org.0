Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9845B11752F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:06:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAABB169B;
	Mon,  9 Dec 2019 20:05:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAABB169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918387;
	bh=lmSMGXdamgUnsgf8bYS9eZnOU38Gp0GJLVAa8A2EJT4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=P13GvFrR4Q/UJMVRw27VQ5q6T1BzGFjKMgvynPecny9R8ShjfhmZjb3t4F7ky2gj0
	 KhbCqsa40QRGow4M0zyMIqNiy7+JzLEfJSuCVBYtcTlAQd25oBh+F1aThCo3fFtPTc
	 8BWDLTX9dhR3XDVLJUzyTqlhz5ILEaPJCiw6pe7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA11BF802A8;
	Mon,  9 Dec 2019 19:59:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4177DF80291; Mon,  9 Dec 2019 19:59:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0B79AF8025E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B79AF8025E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 074D6328;
 Mon,  9 Dec 2019 10:58:49 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3C413F6CF;
 Mon,  9 Dec 2019 10:58:47 -0800 (PST)
Date: Mon, 09 Dec 2019 18:58:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20191204211556.12671-9-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191204211556.12671-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: partition audio-related parts from
	SOF core" to the asoc tree
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

   ASoC: SOF: partition audio-related parts from SOF core

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From ee1e79b72e3cf5eac42ba9de827536f91d4c04e2 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 4 Dec 2019 15:15:51 -0600
Subject: [PATCH] ASoC: SOF: partition audio-related parts from SOF core

Move all the audio-specific code in the core,
audio-specific logic in the top-level PM callbacks
and the core header files into a separate file
(sof-audio.*) in preparation for adding an
audio client device.

In the process of moving all structure definitions
for widget, routes, pcm's etc, the snd_sof_dev
member in all these structs is replaced with
the snd_soc_component member. Also, use the component
device instead of the snd_sof_dev device wherever
possible in the PCM component driver,
control IO functions and the topology parser as the
component device will be moved over to the client
device later on.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191204211556.12671-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/Makefile           |   2 +-
 sound/soc/sof/control.c          |  55 ++---
 sound/soc/sof/core.c             | 120 ----------
 sound/soc/sof/intel/hda-dai.c    |   1 +
 sound/soc/sof/intel/hda-pcm.c    |   4 +-
 sound/soc/sof/intel/hda-stream.c |   1 +
 sound/soc/sof/ipc.c              |  16 +-
 sound/soc/sof/pcm.c              | 123 ++++++-----
 sound/soc/sof/pm.c               | 219 +------------------
 sound/soc/sof/sof-audio.c        | 362 ++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h        | 207 ++++++++++++++++++
 sound/soc/sof/sof-priv.h         | 187 ----------------
 sound/soc/sof/topology.c         | 365 +++++++++++++++----------------
 13 files changed, 861 insertions(+), 801 deletions(-)
 create mode 100644 sound/soc/sof/sof-audio.c
 create mode 100644 sound/soc/sof/sof-audio.h

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index b0a6f01bdc44..0a8bc72c28a5 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
-		control.o trace.o utils.o
+		control.o trace.o utils.o sof-audio.o
 
 snd-sof-pci-objs := sof-pci-dev.o
 snd-sof-acpi-objs := sof-acpi-dev.o
diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 7baf7f1507c3..dfc412e2d956 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -13,6 +13,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/leds.h>
 #include "sof-priv.h"
+#include "sof-audio.h"
 
 static void update_mute_led(struct snd_sof_control *scontrol,
 			    struct snd_kcontrol *kcontrol,
@@ -88,7 +89,7 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *sm =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = sm->dobj.private;
-	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
 	bool change = false;
@@ -104,8 +105,8 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* notify DSP of mixer updates */
-	if (pm_runtime_active(sdev->dev))
-		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+	if (pm_runtime_active(scomp->dev))
+		snd_sof_ipc_set_get_comp_data(scontrol,
 					      SOF_IPC_COMP_SET_VALUE,
 					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
 					      SOF_CTRL_CMD_VOLUME,
@@ -135,7 +136,7 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *sm =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = sm->dobj.private;
-	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
 	bool change = false;
@@ -153,8 +154,8 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 		update_mute_led(scontrol, kcontrol, ucontrol);
 
 	/* notify DSP of mixer updates */
-	if (pm_runtime_active(sdev->dev))
-		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+	if (pm_runtime_active(scomp->dev))
+		snd_sof_ipc_set_get_comp_data(scontrol,
 					      SOF_IPC_COMP_SET_VALUE,
 					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
 					      SOF_CTRL_CMD_SWITCH,
@@ -185,7 +186,7 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *se =
 		(struct soc_enum *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = se->dobj.private;
-	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	unsigned int i, channels = scontrol->num_channels;
 	bool change = false;
@@ -200,8 +201,8 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	}
 
 	/* notify DSP of enum updates */
-	if (pm_runtime_active(sdev->dev))
-		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+	if (pm_runtime_active(scomp->dev))
+		snd_sof_ipc_set_get_comp_data(scontrol,
 					      SOF_IPC_COMP_SET_VALUE,
 					      SOF_CTRL_TYPE_VALUE_CHAN_GET,
 					      SOF_CTRL_CMD_ENUM,
@@ -216,14 +217,14 @@ int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *be =
 		(struct soc_bytes_ext *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = be->dobj.private;
-	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	struct sof_abi_hdr *data = cdata->data;
 	size_t size;
 	int ret = 0;
 
 	if (be->max > sizeof(ucontrol->value.bytes.data)) {
-		dev_err_ratelimited(sdev->dev,
+		dev_err_ratelimited(scomp->dev,
 				    "error: data max %d exceeds ucontrol data array size\n",
 				    be->max);
 		return -EINVAL;
@@ -231,7 +232,7 @@ int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 
 	size = data->size + sizeof(*data);
 	if (size > be->max) {
-		dev_err_ratelimited(sdev->dev,
+		dev_err_ratelimited(scomp->dev,
 				    "error: DSP sent %zu bytes max is %d\n",
 				    size, be->max);
 		ret = -EINVAL;
@@ -251,20 +252,20 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *be =
 		(struct soc_bytes_ext *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = be->dobj.private;
-	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	struct sof_abi_hdr *data = cdata->data;
 	size_t size = data->size + sizeof(*data);
 
 	if (be->max > sizeof(ucontrol->value.bytes.data)) {
-		dev_err_ratelimited(sdev->dev,
+		dev_err_ratelimited(scomp->dev,
 				    "error: data max %d exceeds ucontrol data array size\n",
 				    be->max);
 		return -EINVAL;
 	}
 
 	if (size > be->max) {
-		dev_err_ratelimited(sdev->dev,
+		dev_err_ratelimited(scomp->dev,
 				    "error: size too big %zu bytes max is %d\n",
 				    size, be->max);
 		return -EINVAL;
@@ -274,8 +275,8 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 	memcpy(data, ucontrol->value.bytes.data, size);
 
 	/* notify DSP of byte control updates */
-	if (pm_runtime_active(sdev->dev))
-		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+	if (pm_runtime_active(scomp->dev))
+		snd_sof_ipc_set_get_comp_data(scontrol,
 					      SOF_IPC_COMP_SET_DATA,
 					      SOF_CTRL_TYPE_DATA_SET,
 					      scontrol->cmd,
@@ -291,7 +292,7 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *be =
 		(struct soc_bytes_ext *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = be->dobj.private;
-	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	struct snd_ctl_tlv header;
 	const struct snd_ctl_tlv __user *tlvd =
@@ -307,14 +308,14 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 
 	/* be->max is coming from topology */
 	if (header.length > be->max) {
-		dev_err_ratelimited(sdev->dev, "error: Bytes data size %d exceeds max %d.\n",
+		dev_err_ratelimited(scomp->dev, "error: Bytes data size %d exceeds max %d.\n",
 				    header.length, be->max);
 		return -EINVAL;
 	}
 
 	/* Check that header id matches the command */
 	if (header.numid != scontrol->cmd) {
-		dev_err_ratelimited(sdev->dev,
+		dev_err_ratelimited(scomp->dev,
 				    "error: incorrect numid %d\n",
 				    header.numid);
 		return -EINVAL;
@@ -324,26 +325,26 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 		return -EFAULT;
 
 	if (cdata->data->magic != SOF_ABI_MAGIC) {
-		dev_err_ratelimited(sdev->dev,
+		dev_err_ratelimited(scomp->dev,
 				    "error: Wrong ABI magic 0x%08x.\n",
 				    cdata->data->magic);
 		return -EINVAL;
 	}
 
 	if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION, cdata->data->abi)) {
-		dev_err_ratelimited(sdev->dev, "error: Incompatible ABI version 0x%08x.\n",
+		dev_err_ratelimited(scomp->dev, "error: Incompatible ABI version 0x%08x.\n",
 				    cdata->data->abi);
 		return -EINVAL;
 	}
 
 	if (cdata->data->size + sizeof(const struct sof_abi_hdr) > be->max) {
-		dev_err_ratelimited(sdev->dev, "error: Mismatch in ABI data size (truncated?).\n");
+		dev_err_ratelimited(scomp->dev, "error: Mismatch in ABI data size (truncated?).\n");
 		return -EINVAL;
 	}
 
 	/* notify DSP of byte control updates */
-	if (pm_runtime_active(sdev->dev))
-		snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+	if (pm_runtime_active(scomp->dev))
+		snd_sof_ipc_set_get_comp_data(scontrol,
 					      SOF_IPC_COMP_SET_DATA,
 					      SOF_CTRL_TYPE_DATA_SET,
 					      scontrol->cmd,
@@ -359,7 +360,7 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	struct soc_bytes_ext *be =
 		(struct soc_bytes_ext *)kcontrol->private_value;
 	struct snd_sof_control *scontrol = be->dobj.private;
-	struct snd_sof_dev *sdev = scontrol->sdev;
+	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	struct snd_ctl_tlv header;
 	struct snd_ctl_tlv __user *tlvd =
@@ -382,7 +383,7 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 
 	/* check data size doesn't exceed max coming from topology */
 	if (data_size > be->max) {
-		dev_err_ratelimited(sdev->dev, "error: user data size %d exceeds max size %d.\n",
+		dev_err_ratelimited(scomp->dev, "error: user data size %d exceeds max size %d.\n",
 				    data_size, be->max);
 		ret = -EINVAL;
 		goto out;
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index d8446fb9fdde..9832322adbec 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -24,126 +24,6 @@ MODULE_PARM_DESC(sof_debug, "SOF core debug options (0x0 all off)");
 #define TIMEOUT_DEFAULT_IPC_MS  500
 #define TIMEOUT_DEFAULT_BOOT_MS 2000
 
-/*
- * Generic object lookup APIs.
- */
-
-struct snd_sof_pcm *snd_sof_find_spcm_name(struct snd_sof_dev *sdev,
-					   const char *name)
-{
-	struct snd_sof_pcm *spcm;
-
-	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		/* match with PCM dai name */
-		if (strcmp(spcm->pcm.dai_name, name) == 0)
-			return spcm;
-
-		/* match with playback caps name if set */
-		if (*spcm->pcm.caps[0].name &&
-		    !strcmp(spcm->pcm.caps[0].name, name))
-			return spcm;
-
-		/* match with capture caps name if set */
-		if (*spcm->pcm.caps[1].name &&
-		    !strcmp(spcm->pcm.caps[1].name, name))
-			return spcm;
-	}
-
-	return NULL;
-}
-
-struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_sof_dev *sdev,
-					   unsigned int comp_id,
-					   int *direction)
-{
-	struct snd_sof_pcm *spcm;
-
-	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		if (spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id == comp_id) {
-			*direction = SNDRV_PCM_STREAM_PLAYBACK;
-			return spcm;
-		}
-		if (spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id == comp_id) {
-			*direction = SNDRV_PCM_STREAM_CAPTURE;
-			return spcm;
-		}
-	}
-
-	return NULL;
-}
-
-struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_sof_dev *sdev,
-					     unsigned int pcm_id)
-{
-	struct snd_sof_pcm *spcm;
-
-	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		if (le32_to_cpu(spcm->pcm.pcm_id) == pcm_id)
-			return spcm;
-	}
-
-	return NULL;
-}
-
-struct snd_sof_widget *snd_sof_find_swidget(struct snd_sof_dev *sdev,
-					    const char *name)
-{
-	struct snd_sof_widget *swidget;
-
-	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		if (strcmp(name, swidget->widget->name) == 0)
-			return swidget;
-	}
-
-	return NULL;
-}
-
-/* find widget by stream name and direction */
-struct snd_sof_widget *snd_sof_find_swidget_sname(struct snd_sof_dev *sdev,
-						  const char *pcm_name, int dir)
-{
-	struct snd_sof_widget *swidget;
-	enum snd_soc_dapm_type type;
-
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-		type = snd_soc_dapm_aif_in;
-	else
-		type = snd_soc_dapm_aif_out;
-
-	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		if (!strcmp(pcm_name, swidget->widget->sname) && swidget->id == type)
-			return swidget;
-	}
-
-	return NULL;
-}
-
-struct snd_sof_dai *snd_sof_find_dai(struct snd_sof_dev *sdev,
-				     const char *name)
-{
-	struct snd_sof_dai *dai;
-
-	list_for_each_entry(dai, &sdev->dai_list, list) {
-		if (dai->name && (strcmp(name, dai->name) == 0))
-			return dai;
-	}
-
-	return NULL;
-}
-
-bool snd_sof_dsp_d0i3_on_suspend(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_pcm *spcm;
-
-	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		if (spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].suspend_ignored ||
-		    spcm->stream[SNDRV_PCM_STREAM_CAPTURE].suspend_ignored)
-			return true;
-	}
-
-	return false;
-}
-
 /*
  * FW Panic/fault handling.
  */
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 8796f385be76..2d9ac0035bd2 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -11,6 +11,7 @@
 #include <sound/pcm_params.h>
 #include <sound/hdaudio_ext.h>
 #include "../sof-priv.h"
+#include "../sof-audio.h"
 #include "hda.h"
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 575f5f5877d8..23872f6e708d 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -17,6 +17,7 @@
 
 #include <sound/hda_register.h>
 #include <sound/pcm_params.h>
+#include "../sof-audio.h"
 #include "../ops.h"
 #include "hda.h"
 
@@ -147,12 +148,13 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 				      struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *scomp = sdev->component;
 	struct hdac_stream *hstream = substream->runtime->private_data;
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct snd_sof_pcm *spcm;
 	snd_pcm_uframes_t pos;
 
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	spcm = snd_sof_find_spcm_dai(scomp, rtd);
 	if (!spcm) {
 		dev_warn_ratelimited(sdev->dev, "warn: can't find PCM with DAI ID %d\n",
 				     rtd->dai_link->id);
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 927a36f92c24..c0ab9bb2a797 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -20,6 +20,7 @@
 #include <sound/hda_register.h>
 #include <sound/sof.h>
 #include "../ops.h"
+#include "../sof-audio.h"
 #include "hda.h"
 
 /*
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 5994e1073364..293c5ae8e882 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 
 #include "sof-priv.h"
+#include "sof-audio.h"
 #include "ops.h"
 
 static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_id);
@@ -412,12 +413,13 @@ static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_id)
 
 static void ipc_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
 {
+	struct snd_soc_component *scomp = sdev->component;
 	struct snd_sof_pcm_stream *stream;
 	struct sof_ipc_stream_posn posn;
 	struct snd_sof_pcm *spcm;
 	int direction;
 
-	spcm = snd_sof_find_spcm_comp(sdev, msg_id, &direction);
+	spcm = snd_sof_find_spcm_comp(scomp, msg_id, &direction);
 	if (!spcm) {
 		dev_err(sdev->dev,
 			"error: period elapsed for unknown stream, msg_id %d\n",
@@ -441,12 +443,13 @@ static void ipc_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
 /* DSP notifies host of an XRUN within FW */
 static void ipc_xrun(struct snd_sof_dev *sdev, u32 msg_id)
 {
+	struct snd_soc_component *scomp = sdev->component;
 	struct snd_sof_pcm_stream *stream;
 	struct sof_ipc_stream_posn posn;
 	struct snd_sof_pcm *spcm;
 	int direction;
 
-	spcm = snd_sof_find_spcm_comp(sdev, msg_id, &direction);
+	spcm = snd_sof_find_spcm_comp(scomp, msg_id, &direction);
 	if (!spcm) {
 		dev_err(sdev->dev, "error: XRUN for unknown stream, msg_id %d\n",
 			msg_id);
@@ -488,10 +491,11 @@ static void ipc_stream_message(struct snd_sof_dev *sdev, u32 msg_cmd)
 }
 
 /* get stream position IPC - use faster MMIO method if available on platform */
-int snd_sof_ipc_stream_posn(struct snd_sof_dev *sdev,
+int snd_sof_ipc_stream_posn(struct snd_soc_component *scomp,
 			    struct snd_sof_pcm *spcm, int direction,
 			    struct sof_ipc_stream_posn *posn)
 {
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc_stream stream;
 	int err;
 
@@ -620,15 +624,15 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 /*
  * IPC get()/set() for kcontrols.
  */
-int snd_sof_ipc_set_get_comp_data(struct snd_sof_ipc *ipc,
-				  struct snd_sof_control *scontrol,
+int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 				  u32 ipc_cmd,
 				  enum sof_ipc_ctrl_type ctrl_type,
 				  enum sof_ipc_ctrl_cmd ctrl_cmd,
 				  bool send)
 {
+	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
-	struct snd_sof_dev *sdev = ipc->sdev;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
 	struct sof_ipc_ctrl_data_params sparams;
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index a9c47f6bf657..54ec78799c30 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -14,38 +14,38 @@
 #include <sound/pcm_params.h>
 #include <sound/sof.h>
 #include "sof-priv.h"
+#include "sof-audio.h"
 #include "ops.h"
 
-#define DRV_NAME	"sof-audio-component"
-
 /* Create DMA buffer page table for DSP */
 static int create_page_table(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     unsigned char *dma_area, size_t size)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	struct snd_dma_buffer *dmab = snd_pcm_get_dma_buf(substream);
 	int stream = substream->stream;
 
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return -EINVAL;
 
-	return snd_sof_create_page_table(sdev->dev, dmab,
+	return snd_sof_create_page_table(component->dev, dmab,
 		spcm->stream[stream].page_table.area, size);
 }
 
 static int sof_pcm_dsp_params(struct snd_sof_pcm *spcm, struct snd_pcm_substream *substream,
 			      const struct sof_ipc_pcm_params_reply *reply)
 {
-	struct snd_sof_dev *sdev = spcm->sdev;
+	struct snd_soc_component *scomp = spcm->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+
 	/* validate offset */
 	int ret = snd_sof_ipc_pcm_params(sdev, substream, reply);
 
 	if (ret < 0)
-		dev_err(sdev->dev, "error: got wrong reply for PCM %d\n",
+		dev_err(scomp->dev, "error: got wrong reply for PCM %d\n",
 			spcm->pcm.pcm_id);
 
 	return ret;
@@ -70,13 +70,12 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_pcm *spcm;
 
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm) {
-		dev_err(sdev->dev,
+		dev_err(component->dev,
 			"error: period elapsed for unknown stream!\n");
 		return;
 	}
@@ -110,11 +109,11 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	if (rtd->dai_link->no_pcm)
 		return 0;
 
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return -EINVAL;
 
-	dev_dbg(sdev->dev, "pcm: hw params stream %d dir %d\n",
+	dev_dbg(component->dev, "pcm: hw params stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
 	memset(&pcm, 0, sizeof(pcm));
@@ -122,7 +121,7 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	/* allocate audio buffer pages */
 	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: could not allocate %d bytes for PCM %d\n",
+		dev_err(component->dev, "error: could not allocate %d bytes for PCM %d\n",
 			params_buffer_bytes(params), spcm->pcm.pcm_id);
 		return ret;
 	}
@@ -187,17 +186,17 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 					     params,
 					     &pcm.params);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: platform hw params failed\n");
+		dev_err(component->dev, "error: platform hw params failed\n");
 		return ret;
 	}
 
-	dev_dbg(sdev->dev, "stream_tag %d", pcm.params.stream_tag);
+	dev_dbg(component->dev, "stream_tag %d", pcm.params.stream_tag);
 
 	/* send IPC to the DSP */
 	ret = sof_ipc_tx_message(sdev->ipc, pcm.hdr.cmd, &pcm, sizeof(pcm),
 				 &ipc_params_reply, sizeof(ipc_params_reply));
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: hw params ipc failed for stream %d\n",
+		dev_err(component->dev, "error: hw params ipc failed for stream %d\n",
 			pcm.params.stream_tag);
 		return ret;
 	}
@@ -247,12 +246,12 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 	if (rtd->dai_link->no_pcm)
 		return 0;
 
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return -EINVAL;
 
-	dev_dbg(sdev->dev, "pcm: free stream %d dir %d\n", spcm->pcm.pcm_id,
-		substream->stream);
+	dev_dbg(component->dev, "pcm: free stream %d dir %d\n",
+		spcm->pcm.pcm_id, substream->stream);
 
 	if (spcm->prepared[substream->stream]) {
 		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
@@ -266,7 +265,7 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: platform hw free failed\n");
+		dev_err(component->dev, "error: platform hw free failed\n");
 		err = ret;
 	}
 
@@ -277,7 +276,6 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
 	int ret;
 
@@ -285,21 +283,22 @@ static int sof_pcm_prepare(struct snd_soc_component *component,
 	if (rtd->dai_link->no_pcm)
 		return 0;
 
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return -EINVAL;
 
 	if (spcm->prepared[substream->stream])
 		return 0;
 
-	dev_dbg(sdev->dev, "pcm: prepare stream %d dir %d\n", spcm->pcm.pcm_id,
-		substream->stream);
+	dev_dbg(component->dev, "pcm: prepare stream %d dir %d\n",
+		spcm->pcm.pcm_id, substream->stream);
 
 	/* set hw_params */
 	ret = sof_pcm_hw_params(component,
 				substream, &spcm->params[substream->stream]);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: set pcm hw_params after resume\n");
+		dev_err(component->dev,
+			"error: set pcm hw_params after resume\n");
 		return ret;
 	}
 
@@ -326,11 +325,11 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	if (rtd->dai_link->no_pcm)
 		return 0;
 
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return -EINVAL;
 
-	dev_dbg(sdev->dev, "pcm: trigger stream %d dir %d cmd %d\n",
+	dev_dbg(component->dev, "pcm: trigger stream %d dir %d cmd %d\n",
 		spcm->pcm.pcm_id, substream->stream, cmd);
 
 	stream.hdr.size = sizeof(stream);
@@ -359,7 +358,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		/* set up hw_params */
 		ret = sof_pcm_prepare(component, substream);
 		if (ret < 0) {
-			dev_err(sdev->dev,
+			dev_err(component->dev,
 				"error: failed to set up hw_params upon resume\n");
 			return ret;
 		}
@@ -396,7 +395,8 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		reset_hw_params = true;
 		break;
 	default:
-		dev_err(sdev->dev, "error: unhandled trigger cmd %d\n", cmd);
+		dev_err(component->dev, "error: unhandled trigger cmd %d\n",
+			cmd);
 		return -EINVAL;
 	}
 
@@ -438,7 +438,7 @@ static snd_pcm_uframes_t sof_pcm_pointer(struct snd_soc_component *component,
 	if (sof_ops(sdev)->pcm_pointer)
 		return sof_ops(sdev)->pcm_pointer(sdev, substream);
 
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return -EINVAL;
 
@@ -448,7 +448,8 @@ static snd_pcm_uframes_t sof_pcm_pointer(struct snd_soc_component *component,
 	dai = bytes_to_frames(substream->runtime,
 			      spcm->stream[substream->stream].posn.dai_posn);
 
-	dev_dbg(sdev->dev, "PCM: stream %d dir %d DMA position %lu DAI position %lu\n",
+	dev_dbg(component->dev,
+		"PCM: stream %d dir %d DMA position %lu DAI position %lu\n",
 		spcm->pcm.pcm_id, substream->stream, host, dai);
 
 	return host;
@@ -469,12 +470,12 @@ static int sof_pcm_open(struct snd_soc_component *component,
 	if (rtd->dai_link->no_pcm)
 		return 0;
 
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return -EINVAL;
 
-	dev_dbg(sdev->dev, "pcm: open stream %d dir %d\n", spcm->pcm.pcm_id,
-		substream->stream);
+	dev_dbg(component->dev, "pcm: open stream %d dir %d\n",
+		spcm->pcm.pcm_id, substream->stream);
 
 	INIT_WORK(&spcm->stream[substream->stream].period_elapsed_work,
 		  sof_pcm_period_elapsed_work);
@@ -504,13 +505,13 @@ static int sof_pcm_open(struct snd_soc_component *component,
 	 */
 	runtime->hw.buffer_bytes_max = le32_to_cpu(caps->buffer_size_max);
 
-	dev_dbg(sdev->dev, "period min %zd max %zd bytes\n",
+	dev_dbg(component->dev, "period min %zd max %zd bytes\n",
 		runtime->hw.period_bytes_min,
 		runtime->hw.period_bytes_max);
-	dev_dbg(sdev->dev, "period count %d max %d\n",
+	dev_dbg(component->dev, "period count %d max %d\n",
 		runtime->hw.periods_min,
 		runtime->hw.periods_max);
-	dev_dbg(sdev->dev, "buffer max %zd bytes\n",
+	dev_dbg(component->dev, "buffer max %zd bytes\n",
 		runtime->hw.buffer_bytes_max);
 
 	/* set wait time - TODO: come from topology */
@@ -523,7 +524,7 @@ static int sof_pcm_open(struct snd_soc_component *component,
 
 	ret = snd_sof_pcm_platform_open(sdev, substream);
 	if (ret < 0)
-		dev_err(sdev->dev, "error: pcm open failed %d\n", ret);
+		dev_err(component->dev, "error: pcm open failed %d\n", ret);
 
 	return ret;
 }
@@ -540,16 +541,16 @@ static int sof_pcm_close(struct snd_soc_component *component,
 	if (rtd->dai_link->no_pcm)
 		return 0;
 
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm)
 		return -EINVAL;
 
-	dev_dbg(sdev->dev, "pcm: close stream %d dir %d\n", spcm->pcm.pcm_id,
-		substream->stream);
+	dev_dbg(component->dev, "pcm: close stream %d dir %d\n",
+		spcm->pcm.pcm_id, substream->stream);
 
 	err = snd_sof_pcm_platform_close(sdev, substream);
 	if (err < 0) {
-		dev_err(sdev->dev, "error: pcm close failed %d\n",
+		dev_err(component->dev, "error: pcm close failed %d\n",
 			err);
 		/*
 		 * keep going, no point in preventing the close
@@ -575,14 +576,14 @@ static int sof_pcm_new(struct snd_soc_component *component,
 	int stream = SNDRV_PCM_STREAM_PLAYBACK;
 
 	/* find SOF PCM for this RTD */
-	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	spcm = snd_sof_find_spcm_dai(component, rtd);
 	if (!spcm) {
-		dev_warn(sdev->dev, "warn: can't find PCM with DAI ID %d\n",
+		dev_warn(component->dev, "warn: can't find PCM with DAI ID %d\n",
 			 rtd->dai_link->id);
 		return 0;
 	}
 
-	dev_dbg(sdev->dev, "creating new PCM %s\n", spcm->pcm.pcm_name);
+	dev_dbg(component->dev, "creating new PCM %s\n", spcm->pcm.pcm_name);
 
 	/* do we need to pre-allocate playback audio buffer pages */
 	if (!spcm->pcm.playback)
@@ -591,7 +592,8 @@ static int sof_pcm_new(struct snd_soc_component *component,
 	caps = &spcm->pcm.caps[stream];
 
 	/* pre-allocate playback audio buffer pages */
-	dev_dbg(sdev->dev, "spcm: allocate %s playback DMA buffer size 0x%x max 0x%x\n",
+	dev_dbg(component->dev,
+		"spcm: allocate %s playback DMA buffer size 0x%x max 0x%x\n",
 		caps->name, caps->buffer_size_min, caps->buffer_size_max);
 
 	snd_pcm_lib_preallocate_pages(pcm->streams[stream].substream,
@@ -608,7 +610,8 @@ static int sof_pcm_new(struct snd_soc_component *component,
 	caps = &spcm->pcm.caps[stream];
 
 	/* pre-allocate capture audio buffer pages */
-	dev_dbg(sdev->dev, "spcm: allocate %s capture DMA buffer size 0x%x max 0x%x\n",
+	dev_dbg(component->dev,
+		"spcm: allocate %s capture DMA buffer size 0x%x max 0x%x\n",
 		caps->name, caps->buffer_size_min, caps->buffer_size_max);
 
 	snd_pcm_lib_preallocate_pages(pcm->streams[stream].substream,
@@ -629,14 +632,14 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 						SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dai *dai =
-		snd_sof_find_dai(sdev, (char *)rtd->dai_link->name);
+		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
 
 	/* no topology exists for this BE, try a common configuration */
 	if (!dai) {
-		dev_warn(sdev->dev, "warning: no topology found for BE DAI %s config\n",
+		dev_warn(component->dev,
+			 "warning: no topology found for BE DAI %s config\n",
 			 rtd->dai_link->name);
 
 		/*  set 48k, stereo, 16bits by default */
@@ -666,7 +669,7 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
 		break;
 	default:
-		dev_err(sdev->dev, "error: No available DAI format!\n");
+		dev_err(component->dev, "error: No available DAI format!\n");
 		return -EINVAL;
 	}
 
@@ -678,9 +681,9 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		channels->min = dai->dai_config->ssp.tdm_slots;
 		channels->max = dai->dai_config->ssp.tdm_slots;
 
-		dev_dbg(sdev->dev,
+		dev_dbg(component->dev,
 			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
-		dev_dbg(sdev->dev,
+		dev_dbg(component->dev,
 			"channels_min: %d channels_max: %d\n",
 			channels->min, channels->max);
 
@@ -688,7 +691,7 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	case SOF_DAI_INTEL_DMIC:
 		/* DMIC only supports 16 or 32 bit formats */
 		if (dai->comp_dai.config.frame_fmt == SOF_IPC_FRAME_S24_4LE) {
-			dev_err(sdev->dev,
+			dev_err(component->dev,
 				"error: invalid fmt %d for DAI type %d\n",
 				dai->comp_dai.config.frame_fmt,
 				dai->dai_config->type);
@@ -704,12 +707,12 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		channels->min = dai->dai_config->esai.tdm_slots;
 		channels->max = dai->dai_config->esai.tdm_slots;
 
-		dev_dbg(sdev->dev,
+		dev_dbg(component->dev,
 			"channels_min: %d channels_max: %d\n",
 			channels->min, channels->max);
 		break;
 	default:
-		dev_err(sdev->dev, "error: invalid DAI type %d\n",
+		dev_err(component->dev, "error: invalid DAI type %d\n",
 			dai->dai_config->type);
 		break;
 	}
@@ -734,9 +737,9 @@ static int sof_pcm_probe(struct snd_soc_component *component)
 	if (!tplg_filename)
 		return -ENOMEM;
 
-	ret = snd_sof_load_topology(sdev, tplg_filename);
+	ret = snd_sof_load_topology(component, tplg_filename);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to load DSP topology %d\n",
+		dev_err(component->dev, "error: failed to load DSP topology %d\n",
 			ret);
 		return ret;
 	}
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 0fd5567237a8..d1a7b98886d1 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -10,192 +10,7 @@
 
 #include "ops.h"
 #include "sof-priv.h"
-
-static int sof_restore_kcontrols(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_control *scontrol;
-	int ipc_cmd, ctrl_type;
-	int ret = 0;
-
-	/* restore kcontrol values */
-	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-		/* reset readback offset for scontrol after resuming */
-		scontrol->readback_offset = 0;
-
-		/* notify DSP of kcontrol values */
-		switch (scontrol->cmd) {
-		case SOF_CTRL_CMD_VOLUME:
-		case SOF_CTRL_CMD_ENUM:
-		case SOF_CTRL_CMD_SWITCH:
-			ipc_cmd = SOF_IPC_COMP_SET_VALUE;
-			ctrl_type = SOF_CTRL_TYPE_VALUE_CHAN_SET;
-			ret = snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-							    ipc_cmd, ctrl_type,
-							    scontrol->cmd,
-							    true);
-			break;
-		case SOF_CTRL_CMD_BINARY:
-			ipc_cmd = SOF_IPC_COMP_SET_DATA;
-			ctrl_type = SOF_CTRL_TYPE_DATA_SET;
-			ret = snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
-							    ipc_cmd, ctrl_type,
-							    scontrol->cmd,
-							    true);
-			break;
-
-		default:
-			break;
-		}
-
-		if (ret < 0) {
-			dev_err(sdev->dev,
-				"error: failed kcontrol value set for widget: %d\n",
-				scontrol->comp_id);
-
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
-static int sof_restore_pipelines(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_widget *swidget;
-	struct snd_sof_route *sroute;
-	struct sof_ipc_pipe_new *pipeline;
-	struct snd_sof_dai *dai;
-	struct sof_ipc_comp_dai *comp_dai;
-	struct sof_ipc_cmd_hdr *hdr;
-	int ret;
-
-	/* restore pipeline components */
-	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
-		struct sof_ipc_comp_reply r;
-
-		/* skip if there is no private data */
-		if (!swidget->private)
-			continue;
-
-		switch (swidget->id) {
-		case snd_soc_dapm_dai_in:
-		case snd_soc_dapm_dai_out:
-			dai = swidget->private;
-			comp_dai = &dai->comp_dai;
-			ret = sof_ipc_tx_message(sdev->ipc,
-						 comp_dai->comp.hdr.cmd,
-						 comp_dai, sizeof(*comp_dai),
-						 &r, sizeof(r));
-			break;
-		case snd_soc_dapm_scheduler:
-
-			/*
-			 * During suspend, all DSP cores are powered off.
-			 * Therefore upon resume, create the pipeline comp
-			 * and power up the core that the pipeline is
-			 * scheduled on.
-			 */
-			pipeline = swidget->private;
-			ret = sof_load_pipeline_ipc(sdev, pipeline, &r);
-			break;
-		default:
-			hdr = swidget->private;
-			ret = sof_ipc_tx_message(sdev->ipc, hdr->cmd,
-						 swidget->private, hdr->size,
-						 &r, sizeof(r));
-			break;
-		}
-		if (ret < 0) {
-			dev_err(sdev->dev,
-				"error: failed to load widget type %d with ID: %d\n",
-				swidget->widget->id, swidget->comp_id);
-
-			return ret;
-		}
-	}
-
-	/* restore pipeline connections */
-	list_for_each_entry_reverse(sroute, &sdev->route_list, list) {
-		struct sof_ipc_pipe_comp_connect *connect;
-		struct sof_ipc_reply reply;
-
-		/* skip if there's no private data */
-		if (!sroute->private)
-			continue;
-
-		connect = sroute->private;
-
-		/* send ipc */
-		ret = sof_ipc_tx_message(sdev->ipc,
-					 connect->hdr.cmd,
-					 connect, sizeof(*connect),
-					 &reply, sizeof(reply));
-		if (ret < 0) {
-			dev_err(sdev->dev,
-				"error: failed to load route sink %s control %s source %s\n",
-				sroute->route->sink,
-				sroute->route->control ? sroute->route->control
-					: "none",
-				sroute->route->source);
-
-			return ret;
-		}
-	}
-
-	/* restore dai links */
-	list_for_each_entry_reverse(dai, &sdev->dai_list, list) {
-		struct sof_ipc_reply reply;
-		struct sof_ipc_dai_config *config = dai->dai_config;
-
-		if (!config) {
-			dev_err(sdev->dev, "error: no config for DAI %s\n",
-				dai->name);
-			continue;
-		}
-
-		/*
-		 * The link DMA channel would be invalidated for running
-		 * streams but not for streams that were in the PAUSED
-		 * state during suspend. So invalidate it here before setting
-		 * the dai config in the DSP.
-		 */
-		if (config->type == SOF_DAI_INTEL_HDA)
-			config->hda.link_dma_ch = DMA_CHAN_INVALID;
-
-		ret = sof_ipc_tx_message(sdev->ipc,
-					 config->hdr.cmd, config,
-					 config->hdr.size,
-					 &reply, sizeof(reply));
-
-		if (ret < 0) {
-			dev_err(sdev->dev,
-				"error: failed to set dai config for %s\n",
-				dai->name);
-
-			return ret;
-		}
-	}
-
-	/* complete pipeline */
-	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		switch (swidget->id) {
-		case snd_soc_dapm_scheduler:
-			swidget->complete =
-				snd_sof_complete_pipeline(sdev, swidget);
-			break;
-		default:
-			break;
-		}
-	}
-
-	/* restore pipeline kcontrols */
-	ret = sof_restore_kcontrols(sdev);
-	if (ret < 0)
-		dev_err(sdev->dev,
-			"error: restoring kcontrols after resume\n");
-
-	return ret;
-}
+#include "sof-audio.h"
 
 static int sof_send_pm_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
 {
@@ -213,34 +28,6 @@ static int sof_send_pm_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
 				 sizeof(pm_ctx), &reply, sizeof(reply));
 }
 
-static int sof_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
-{
-	struct snd_pcm_substream *substream;
-	struct snd_sof_pcm *spcm;
-	snd_pcm_state_t state;
-	int dir;
-
-	/*
-	 * SOF requires hw_params to be set-up internally upon resume.
-	 * So, set the flag to indicate this for those streams that
-	 * have been suspended.
-	 */
-	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		for (dir = 0; dir <= SNDRV_PCM_STREAM_CAPTURE; dir++) {
-			substream = spcm->stream[dir].substream;
-			if (!substream || !substream->runtime)
-				continue;
-
-			state = substream->runtime->status->state;
-			if (state == SNDRV_PCM_STATE_SUSPENDED)
-				spcm->prepared[dir] = false;
-		}
-	}
-
-	/* set internal flag for BE */
-	return snd_sof_dsp_hw_params_upon_resume(sdev);
-}
-
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
 static void sof_cache_debugfs(struct snd_sof_dev *sdev)
 {
@@ -311,7 +98,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	}
 
 	/* restore pipelines */
-	ret = sof_restore_pipelines(sdev);
+	ret = sof_restore_pipelines(sdev->dev);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to restore pipeline after resume %d\n",
@@ -346,7 +133,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 
 	/* set restore_stream for all streams during system suspend */
 	if (!runtime_suspend) {
-		ret = sof_set_hw_params_upon_resume(sdev);
+		ret = sof_set_hw_params_upon_resume(sdev->dev);
 		if (ret < 0) {
 			dev_err(sdev->dev,
 				"error: setting hw_params flag during suspend %d\n",
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
new file mode 100644
index 000000000000..bf99d040c9c1
--- /dev/null
+++ b/sound/soc/sof/sof-audio.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2019 Intel Corporation. All rights reserved.
+//
+// Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
+//
+
+#include "sof-audio.h"
+#include "ops.h"
+
+bool snd_sof_dsp_d0i3_on_suspend(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_pcm *spcm;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		if (spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].suspend_ignored ||
+		    spcm->stream[SNDRV_PCM_STREAM_CAPTURE].suspend_ignored)
+			return true;
+	}
+
+	return false;
+}
+
+int sof_set_hw_params_upon_resume(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_pcm_substream *substream;
+	struct snd_sof_pcm *spcm;
+	snd_pcm_state_t state;
+	int dir;
+
+	/*
+	 * SOF requires hw_params to be set-up internally upon resume.
+	 * So, set the flag to indicate this for those streams that
+	 * have been suspended.
+	 */
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		for (dir = 0; dir <= SNDRV_PCM_STREAM_CAPTURE; dir++) {
+			substream = spcm->stream[dir].substream;
+			if (!substream || !substream->runtime)
+				continue;
+
+			state = substream->runtime->status->state;
+			if (state == SNDRV_PCM_STATE_SUSPENDED)
+				spcm->prepared[dir] = false;
+		}
+	}
+
+	/* set internal flag for BE */
+	return snd_sof_dsp_hw_params_upon_resume(sdev);
+}
+
+static int sof_restore_kcontrols(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_sof_control *scontrol;
+	int ipc_cmd, ctrl_type;
+	int ret = 0;
+
+	/* restore kcontrol values */
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
+		/* reset readback offset for scontrol after resuming */
+		scontrol->readback_offset = 0;
+
+		/* notify DSP of kcontrol values */
+		switch (scontrol->cmd) {
+		case SOF_CTRL_CMD_VOLUME:
+		case SOF_CTRL_CMD_ENUM:
+		case SOF_CTRL_CMD_SWITCH:
+			ipc_cmd = SOF_IPC_COMP_SET_VALUE;
+			ctrl_type = SOF_CTRL_TYPE_VALUE_CHAN_SET;
+			ret = snd_sof_ipc_set_get_comp_data(scontrol,
+							    ipc_cmd, ctrl_type,
+							    scontrol->cmd,
+							    true);
+			break;
+		case SOF_CTRL_CMD_BINARY:
+			ipc_cmd = SOF_IPC_COMP_SET_DATA;
+			ctrl_type = SOF_CTRL_TYPE_DATA_SET;
+			ret = snd_sof_ipc_set_get_comp_data(scontrol,
+							    ipc_cmd, ctrl_type,
+							    scontrol->cmd,
+							    true);
+			break;
+
+		default:
+			break;
+		}
+
+		if (ret < 0) {
+			dev_err(dev,
+				"error: failed kcontrol value set for widget: %d\n",
+				scontrol->comp_id);
+
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+int sof_restore_pipelines(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_sof_widget *swidget;
+	struct snd_sof_route *sroute;
+	struct sof_ipc_pipe_new *pipeline;
+	struct snd_sof_dai *dai;
+	struct sof_ipc_comp_dai *comp_dai;
+	struct sof_ipc_cmd_hdr *hdr;
+	int ret;
+
+	/* restore pipeline components */
+	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
+		struct sof_ipc_comp_reply r;
+
+		/* skip if there is no private data */
+		if (!swidget->private)
+			continue;
+
+		switch (swidget->id) {
+		case snd_soc_dapm_dai_in:
+		case snd_soc_dapm_dai_out:
+			dai = swidget->private;
+			comp_dai = &dai->comp_dai;
+			ret = sof_ipc_tx_message(sdev->ipc,
+						 comp_dai->comp.hdr.cmd,
+						 comp_dai, sizeof(*comp_dai),
+						 &r, sizeof(r));
+			break;
+		case snd_soc_dapm_scheduler:
+
+			/*
+			 * During suspend, all DSP cores are powered off.
+			 * Therefore upon resume, create the pipeline comp
+			 * and power up the core that the pipeline is
+			 * scheduled on.
+			 */
+			pipeline = swidget->private;
+			ret = sof_load_pipeline_ipc(dev, pipeline, &r);
+			break;
+		default:
+			hdr = swidget->private;
+			ret = sof_ipc_tx_message(sdev->ipc, hdr->cmd,
+						 swidget->private, hdr->size,
+						 &r, sizeof(r));
+			break;
+		}
+		if (ret < 0) {
+			dev_err(dev,
+				"error: failed to load widget type %d with ID: %d\n",
+				swidget->widget->id, swidget->comp_id);
+
+			return ret;
+		}
+	}
+
+	/* restore pipeline connections */
+	list_for_each_entry_reverse(sroute, &sdev->route_list, list) {
+		struct sof_ipc_pipe_comp_connect *connect;
+		struct sof_ipc_reply reply;
+
+		/* skip if there's no private data */
+		if (!sroute->private)
+			continue;
+
+		connect = sroute->private;
+
+		/* send ipc */
+		ret = sof_ipc_tx_message(sdev->ipc,
+					 connect->hdr.cmd,
+					 connect, sizeof(*connect),
+					 &reply, sizeof(reply));
+		if (ret < 0) {
+			dev_err(dev,
+				"error: failed to load route sink %s control %s source %s\n",
+				sroute->route->sink,
+				sroute->route->control ? sroute->route->control
+					: "none",
+				sroute->route->source);
+
+			return ret;
+		}
+	}
+
+	/* restore dai links */
+	list_for_each_entry_reverse(dai, &sdev->dai_list, list) {
+		struct sof_ipc_reply reply;
+		struct sof_ipc_dai_config *config = dai->dai_config;
+
+		if (!config) {
+			dev_err(dev, "error: no config for DAI %s\n",
+				dai->name);
+			continue;
+		}
+
+		/*
+		 * The link DMA channel would be invalidated for running
+		 * streams but not for streams that were in the PAUSED
+		 * state during suspend. So invalidate it here before setting
+		 * the dai config in the DSP.
+		 */
+		if (config->type == SOF_DAI_INTEL_HDA)
+			config->hda.link_dma_ch = DMA_CHAN_INVALID;
+
+		ret = sof_ipc_tx_message(sdev->ipc,
+					 config->hdr.cmd, config,
+					 config->hdr.size,
+					 &reply, sizeof(reply));
+
+		if (ret < 0) {
+			dev_err(dev,
+				"error: failed to set dai config for %s\n",
+				dai->name);
+
+			return ret;
+		}
+	}
+
+	/* complete pipeline */
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		switch (swidget->id) {
+		case snd_soc_dapm_scheduler:
+			swidget->complete =
+				snd_sof_complete_pipeline(dev, swidget);
+			break;
+		default:
+			break;
+		}
+	}
+
+	/* restore pipeline kcontrols */
+	ret = sof_restore_kcontrols(dev);
+	if (ret < 0)
+		dev_err(dev,
+			"error: restoring kcontrols after resume\n");
+
+	return ret;
+}
+
+/*
+ * Generic object lookup APIs.
+ */
+
+struct snd_sof_pcm *snd_sof_find_spcm_name(struct snd_soc_component *scomp,
+					   const char *name)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_sof_pcm *spcm;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		/* match with PCM dai name */
+		if (strcmp(spcm->pcm.dai_name, name) == 0)
+			return spcm;
+
+		/* match with playback caps name if set */
+		if (*spcm->pcm.caps[0].name &&
+		    !strcmp(spcm->pcm.caps[0].name, name))
+			return spcm;
+
+		/* match with capture caps name if set */
+		if (*spcm->pcm.caps[1].name &&
+		    !strcmp(spcm->pcm.caps[1].name, name))
+			return spcm;
+	}
+
+	return NULL;
+}
+
+struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
+					   unsigned int comp_id,
+					   int *direction)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_sof_pcm *spcm;
+	int dir;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		dir = SNDRV_PCM_STREAM_PLAYBACK;
+		if (spcm->stream[dir].comp_id == comp_id) {
+			*direction = dir;
+			return spcm;
+		}
+
+		dir = SNDRV_PCM_STREAM_CAPTURE;
+		if (spcm->stream[dir].comp_id == comp_id) {
+			*direction = dir;
+			return spcm;
+		}
+	}
+
+	return NULL;
+}
+
+struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_soc_component *scomp,
+					     unsigned int pcm_id)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_sof_pcm *spcm;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		if (le32_to_cpu(spcm->pcm.pcm_id) == pcm_id)
+			return spcm;
+	}
+
+	return NULL;
+}
+
+struct snd_sof_widget *snd_sof_find_swidget(struct snd_soc_component *scomp,
+					    const char *name)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_sof_widget *swidget;
+
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (strcmp(name, swidget->widget->name) == 0)
+			return swidget;
+	}
+
+	return NULL;
+}
+
+/* find widget by stream name and direction */
+struct snd_sof_widget *
+snd_sof_find_swidget_sname(struct snd_soc_component *scomp,
+			   const char *pcm_name, int dir)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_sof_widget *swidget;
+	enum snd_soc_dapm_type type;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		type = snd_soc_dapm_aif_in;
+	else
+		type = snd_soc_dapm_aif_out;
+
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (!strcmp(pcm_name, swidget->widget->sname) &&
+		    swidget->id == type)
+			return swidget;
+	}
+
+	return NULL;
+}
+
+struct snd_sof_dai *snd_sof_find_dai(struct snd_soc_component *scomp,
+				     const char *name)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_sof_dai *dai;
+
+	list_for_each_entry(dai, &sdev->dai_list, list) {
+		if (dai->name && (strcmp(name, dai->name) == 0))
+			return dai;
+	}
+
+	return NULL;
+}
+
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
new file mode 100644
index 000000000000..5703698633af
--- /dev/null
+++ b/sound/soc/sof/sof-audio.h
@@ -0,0 +1,207 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2019 Intel Corporation. All rights reserved.
+ *
+ * Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_SOF_AUDIO_H
+#define __SOUND_SOC_SOF_AUDIO_H
+
+#include <sound/soc.h>
+#include <sound/control.h>
+#include <sound/sof/stream.h> /* needs to be included before control.h */
+#include <sound/sof/control.h>
+#include <sound/sof/dai.h>
+#include <sound/sof/topology.h>
+#include "sof-priv.h"
+
+#define SOF_AUDIO_PCM_DRV_NAME	"sof-audio-component"
+
+/* max number of FE PCMs before BEs */
+#define SOF_BE_PCM_BASE		16
+
+#define DMA_CHAN_INVALID	0xFFFFFFFF
+
+/* PCM stream, mapped to FW component  */
+struct snd_sof_pcm_stream {
+	u32 comp_id;
+	struct snd_dma_buffer page_table;
+	struct sof_ipc_stream_posn posn;
+	struct snd_pcm_substream *substream;
+	struct work_struct period_elapsed_work;
+	bool d0i3_compatible; /* DSP can be in D0I3 when this pcm is opened */
+	/*
+	 * flag to indicate that the DSP pipelines should be kept
+	 * active or not while suspending the stream
+	 */
+	bool suspend_ignored;
+};
+
+/* ALSA SOF PCM device */
+struct snd_sof_pcm {
+	struct snd_soc_component *scomp;
+	struct snd_soc_tplg_pcm pcm;
+	struct snd_sof_pcm_stream stream[2];
+	struct list_head list;	/* list in sdev pcm list */
+	struct snd_pcm_hw_params params[2];
+	bool prepared[2]; /* PCM_PARAMS set successfully */
+};
+
+struct snd_sof_led_control {
+	unsigned int use_led;
+	unsigned int direction;
+	unsigned int led_value;
+};
+
+/* ALSA SOF Kcontrol device */
+struct snd_sof_control {
+	struct snd_soc_component *scomp;
+	int comp_id;
+	int min_volume_step; /* min volume step for volume_table */
+	int max_volume_step; /* max volume step for volume_table */
+	int num_channels;
+	u32 readback_offset; /* offset to mmapped data if used */
+	struct sof_ipc_ctrl_data *control_data;
+	u32 size;	/* cdata size */
+	enum sof_ipc_ctrl_cmd cmd;
+	u32 *volume_table; /* volume table computed from tlv data*/
+
+	struct list_head list;	/* list in sdev control list */
+
+	struct snd_sof_led_control led_ctl;
+};
+
+/* ASoC SOF DAPM widget */
+struct snd_sof_widget {
+	struct snd_soc_component *scomp;
+	int comp_id;
+	int pipeline_id;
+	int complete;
+	int id;
+
+	struct snd_soc_dapm_widget *widget;
+	struct list_head list;	/* list in sdev widget list */
+
+	void *private;		/* core does not touch this */
+};
+
+/* ASoC SOF DAPM route */
+struct snd_sof_route {
+	struct snd_soc_component *scomp;
+
+	struct snd_soc_dapm_route *route;
+	struct list_head list;	/* list in sdev route list */
+
+	void *private;
+};
+
+/* ASoC DAI device */
+struct snd_sof_dai {
+	struct snd_soc_component *scomp;
+	const char *name;
+	const char *cpu_dai_name;
+
+	struct sof_ipc_comp_dai comp_dai;
+	struct sof_ipc_dai_config *dai_config;
+	struct list_head list;	/* list in sdev dai list */
+};
+
+/*
+ * Kcontrols.
+ */
+
+int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+int snd_sof_switch_get(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
+		       struct snd_ctl_elem_value *ucontrol);
+int snd_sof_enum_get(struct snd_kcontrol *kcontrol,
+		     struct snd_ctl_elem_value *ucontrol);
+int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
+		     struct snd_ctl_elem_value *ucontrol);
+int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
+		      struct snd_ctl_elem_value *ucontrol);
+int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
+		      struct snd_ctl_elem_value *ucontrol);
+int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
+			  const unsigned int __user *binary_data,
+			  unsigned int size);
+int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
+			  unsigned int __user *binary_data,
+			  unsigned int size);
+
+/*
+ * Topology.
+ * There is no snd_sof_free_topology since topology components will
+ * be freed by snd_soc_unregister_component,
+ */
+int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file);
+int snd_sof_complete_pipeline(struct device *dev,
+			      struct snd_sof_widget *swidget);
+
+int sof_load_pipeline_ipc(struct device *dev,
+			  struct sof_ipc_pipe_new *pipeline,
+			  struct sof_ipc_comp_reply *r);
+
+/*
+ * Stream IPC
+ */
+int snd_sof_ipc_stream_posn(struct snd_soc_component *scomp,
+			    struct snd_sof_pcm *spcm, int direction,
+			    struct sof_ipc_stream_posn *posn);
+
+struct snd_sof_widget *snd_sof_find_swidget(struct snd_soc_component *scomp,
+					    const char *name);
+struct snd_sof_widget *
+snd_sof_find_swidget_sname(struct snd_soc_component *scomp,
+			   const char *pcm_name, int dir);
+struct snd_sof_dai *snd_sof_find_dai(struct snd_soc_component *scomp,
+				     const char *name);
+
+static inline
+struct snd_sof_pcm *snd_sof_find_spcm_dai(struct snd_soc_component *scomp,
+					  struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+
+	struct snd_sof_pcm *spcm = NULL;
+
+	list_for_each_entry(spcm, &sdev->pcm_list, list) {
+		if (le32_to_cpu(spcm->pcm.dai_id) == rtd->dai_link->id)
+			return spcm;
+	}
+
+	return NULL;
+}
+
+struct snd_sof_pcm *snd_sof_find_spcm_name(struct snd_soc_component *scomp,
+					   const char *name);
+struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_soc_component *scomp,
+					   unsigned int comp_id,
+					   int *direction);
+struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_soc_component *scomp,
+					     unsigned int pcm_id);
+void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
+
+/*
+ * Mixer IPC
+ */
+int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
+				  u32 ipc_cmd,
+				  enum sof_ipc_ctrl_type ctrl_type,
+				  enum sof_ipc_ctrl_cmd ctrl_cmd,
+				  bool send);
+
+/* PM */
+int sof_restore_pipelines(struct device *dev);
+int sof_set_hw_params_upon_resume(struct device *dev);
+bool snd_sof_dsp_d0i3_on_suspend(struct snd_sof_dev *sdev);
+
+#endif
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 18dd832f2053..eae1fc209a65 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -12,20 +12,11 @@
 #define __SOUND_SOC_SOF_PRIV_H
 
 #include <linux/device.h>
-
 #include <sound/hdaudio.h>
-#include <sound/soc.h>
-#include <sound/control.h>
-
 #include <sound/sof.h>
-#include <sound/sof/stream.h> /* needs to be included before control.h */
-#include <sound/sof/control.h>
-#include <sound/sof/dai.h>
 #include <sound/sof/info.h>
 #include <sound/sof/pm.h>
-#include <sound/sof/topology.h>
 #include <sound/sof/trace.h>
-
 #include <uapi/sound/sof/fw.h>
 
 /* debug flags */
@@ -48,9 +39,6 @@ extern int sof_core_debug;
 /* DMA buffer size for trace */
 #define DMA_BUF_SIZE_FOR_TRACE (PAGE_SIZE * 16)
 
-/* max number of FE PCMs before BEs */
-#define SOF_BE_PCM_BASE		16
-
 #define SOF_IPC_DSP_REPLY		0
 #define SOF_IPC_HOST_REPLY		1
 
@@ -66,8 +54,6 @@ extern int sof_core_debug;
 	(IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE) || \
 	 IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST))
 
-#define DMA_CHAN_INVALID	0xFFFFFFFF
-
 /* DSP D0ix sub-state */
 enum sof_d0_substate {
 	SOF_DSP_D0I0 = 0,	/* DSP default D0 substate */
@@ -303,90 +289,6 @@ struct snd_sof_ipc_msg {
 	bool ipc_complete;
 };
 
-/* PCM stream, mapped to FW component  */
-struct snd_sof_pcm_stream {
-	u32 comp_id;
-	struct snd_dma_buffer page_table;
-	struct sof_ipc_stream_posn posn;
-	struct snd_pcm_substream *substream;
-	struct work_struct period_elapsed_work;
-	bool d0i3_compatible; /* DSP can be in D0I3 when this pcm is opened */
-	/*
-	 * flag to indicate that the DSP pipelines should be kept
-	 * active or not while suspending the stream
-	 */
-	bool suspend_ignored;
-};
-
-/* ALSA SOF PCM device */
-struct snd_sof_pcm {
-	struct snd_sof_dev *sdev;
-	struct snd_soc_tplg_pcm pcm;
-	struct snd_sof_pcm_stream stream[2];
-	struct list_head list;	/* list in sdev pcm list */
-	struct snd_pcm_hw_params params[2];
-	bool prepared[2]; /* PCM_PARAMS set successfully */
-};
-
-struct snd_sof_led_control {
-	unsigned int use_led;
-	unsigned int direction;
-	unsigned int led_value;
-};
-
-/* ALSA SOF Kcontrol device */
-struct snd_sof_control {
-	struct snd_sof_dev *sdev;
-	int comp_id;
-	int min_volume_step; /* min volume step for volume_table */
-	int max_volume_step; /* max volume step for volume_table */
-	int num_channels;
-	u32 readback_offset; /* offset to mmaped data if used */
-	struct sof_ipc_ctrl_data *control_data;
-	u32 size;	/* cdata size */
-	enum sof_ipc_ctrl_cmd cmd;
-	u32 *volume_table; /* volume table computed from tlv data*/
-
-	struct list_head list;	/* list in sdev control list */
-
-	struct snd_sof_led_control led_ctl;
-};
-
-/* ASoC SOF DAPM widget */
-struct snd_sof_widget {
-	struct snd_sof_dev *sdev;
-	int comp_id;
-	int pipeline_id;
-	int complete;
-	int id;
-
-	struct snd_soc_dapm_widget *widget;
-	struct list_head list;	/* list in sdev widget list */
-
-	void *private;		/* core does not touch this */
-};
-
-/* ASoC SOF DAPM route */
-struct snd_sof_route {
-	struct snd_sof_dev *sdev;
-
-	struct snd_soc_dapm_route *route;
-	struct list_head list;	/* list in sdev route list */
-
-	void *private;
-};
-
-/* ASoC DAI device */
-struct snd_sof_dai {
-	struct snd_sof_dev *sdev;
-	const char *name;
-	const char *cpu_dai_name;
-
-	struct sof_ipc_comp_dai comp_dai;
-	struct sof_ipc_dai_config *dai_config;
-	struct list_head list;	/* list in sdev dai list */
-};
-
 /*
  * SOF Device Level.
  */
@@ -531,67 +433,6 @@ int snd_sof_ipc_valid(struct snd_sof_dev *sdev);
 int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
 		       void *msg_data, size_t msg_bytes, void *reply_data,
 		       size_t reply_bytes);
-struct snd_sof_widget *snd_sof_find_swidget(struct snd_sof_dev *sdev,
-					    const char *name);
-struct snd_sof_widget *snd_sof_find_swidget_sname(struct snd_sof_dev *sdev,
-						  const char *pcm_name,
-						  int dir);
-struct snd_sof_dai *snd_sof_find_dai(struct snd_sof_dev *sdev,
-				     const char *name);
-
-static inline
-struct snd_sof_pcm *snd_sof_find_spcm_dai(struct snd_sof_dev *sdev,
-					  struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_sof_pcm *spcm = NULL;
-
-	list_for_each_entry(spcm, &sdev->pcm_list, list) {
-		if (le32_to_cpu(spcm->pcm.dai_id) == rtd->dai_link->id)
-			return spcm;
-	}
-
-	return NULL;
-}
-
-bool snd_sof_dsp_d0i3_on_suspend(struct snd_sof_dev *sdev);
-
-struct snd_sof_pcm *snd_sof_find_spcm_name(struct snd_sof_dev *sdev,
-					   const char *name);
-struct snd_sof_pcm *snd_sof_find_spcm_comp(struct snd_sof_dev *sdev,
-					   unsigned int comp_id,
-					   int *direction);
-struct snd_sof_pcm *snd_sof_find_spcm_pcm_id(struct snd_sof_dev *sdev,
-					     unsigned int pcm_id);
-void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream);
-
-/*
- * Stream IPC
- */
-int snd_sof_ipc_stream_posn(struct snd_sof_dev *sdev,
-			    struct snd_sof_pcm *spcm, int direction,
-			    struct sof_ipc_stream_posn *posn);
-
-/*
- * Mixer IPC
- */
-int snd_sof_ipc_set_get_comp_data(struct snd_sof_ipc *ipc,
-				  struct snd_sof_control *scontrol, u32 ipc_cmd,
-				  enum sof_ipc_ctrl_type ctrl_type,
-				  enum sof_ipc_ctrl_cmd ctrl_cmd,
-				  bool send);
-
-/*
- * Topology.
- * There is no snd_sof_free_topology since topology components will
- * be freed by snd_soc_unregister_component,
- */
-int snd_sof_load_topology(struct snd_sof_dev *sdev, const char *file);
-int snd_sof_complete_pipeline(struct snd_sof_dev *sdev,
-			      struct snd_sof_widget *swidget);
-
-int sof_load_pipeline_ipc(struct snd_sof_dev *sdev,
-			  struct sof_ipc_pipe_new *pipeline,
-			  struct sof_ipc_comp_reply *r);
 
 /*
  * Trace/debug
@@ -623,40 +464,12 @@ void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev);
  */
 extern struct snd_compr_ops sof_compressed_ops;
 
-/*
- * Kcontrols.
- */
-
-int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
-		       struct snd_ctl_elem_value *ucontrol);
-int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
-		       struct snd_ctl_elem_value *ucontrol);
-int snd_sof_switch_get(struct snd_kcontrol *kcontrol,
-		       struct snd_ctl_elem_value *ucontrol);
-int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
-		       struct snd_ctl_elem_value *ucontrol);
-int snd_sof_enum_get(struct snd_kcontrol *kcontrol,
-		     struct snd_ctl_elem_value *ucontrol);
-int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
-		     struct snd_ctl_elem_value *ucontrol);
-int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
-		      struct snd_ctl_elem_value *ucontrol);
-int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
-		      struct snd_ctl_elem_value *ucontrol);
-int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
-			  const unsigned int __user *binary_data,
-			  unsigned int size);
-int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
-			  unsigned int __user *binary_data,
-			  unsigned int size);
-
 /*
  * DSP Architectures.
  */
 static inline void sof_stack(struct snd_sof_dev *sdev, void *oops, u32 *stack,
 			     u32 stack_words)
 {
-	if (sof_arch_ops(sdev)->dsp_stack)
 		sof_arch_ops(sdev)->dsp_stack(sdev, oops, stack, stack_words);
 }
 
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b8701d3407ad..1ae06a1f9b0b 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -13,6 +13,7 @@
 #include <sound/pcm_params.h>
 #include <uapi/sound/sof/tokens.h>
 #include "sof-priv.h"
+#include "sof-audio.h"
 #include "ops.h"
 
 #define COMP_ID_UNASSIGNED		0xffffffff
@@ -53,7 +54,8 @@ struct sof_widget_data {
 static int ipc_pcm_params(struct snd_sof_widget *swidget, int dir)
 {
 	struct sof_ipc_pcm_params_reply ipc_params_reply;
-	struct snd_sof_dev *sdev = swidget->sdev;
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc_pcm_params pcm;
 	struct snd_pcm_hw_params *params;
 	struct snd_sof_pcm *spcm;
@@ -62,9 +64,9 @@ static int ipc_pcm_params(struct snd_sof_widget *swidget, int dir)
 	memset(&pcm, 0, sizeof(pcm));
 
 	/* get runtime PCM params using widget's stream name */
-	spcm = snd_sof_find_spcm_name(sdev, swidget->widget->sname);
+	spcm = snd_sof_find_spcm_name(scomp, swidget->widget->sname);
 	if (!spcm) {
-		dev_err(sdev->dev, "error: cannot find PCM for %s\n",
+		dev_err(scomp->dev, "error: cannot find PCM for %s\n",
 			swidget->widget->name);
 		return -EINVAL;
 	}
@@ -102,7 +104,7 @@ static int ipc_pcm_params(struct snd_sof_widget *swidget, int dir)
 	ret = sof_ipc_tx_message(sdev->ipc, pcm.hdr.cmd, &pcm, sizeof(pcm),
 				 &ipc_params_reply, sizeof(ipc_params_reply));
 	if (ret < 0)
-		dev_err(sdev->dev, "error: pcm params failed for %s\n",
+		dev_err(scomp->dev, "error: pcm params failed for %s\n",
 			swidget->widget->name);
 
 	return ret;
@@ -111,7 +113,8 @@ static int ipc_pcm_params(struct snd_sof_widget *swidget, int dir)
  /* send stream trigger ipc */
 static int ipc_trigger(struct snd_sof_widget *swidget, int cmd)
 {
-	struct snd_sof_dev *sdev = swidget->sdev;
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc_stream stream;
 	struct sof_ipc_reply reply;
 	int ret = 0;
@@ -125,7 +128,7 @@ static int ipc_trigger(struct snd_sof_widget *swidget, int cmd)
 	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
 				 sizeof(stream), &reply, sizeof(reply));
 	if (ret < 0)
-		dev_err(sdev->dev, "error: failed to trigger %s\n",
+		dev_err(scomp->dev, "error: failed to trigger %s\n",
 			swidget->widget->name);
 
 	return ret;
@@ -135,23 +138,23 @@ static int sof_keyword_dapm_event(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *k, int event)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *scomp;
 	int stream = SNDRV_PCM_STREAM_CAPTURE;
-	struct snd_sof_dev *sdev;
 	struct snd_sof_pcm *spcm;
 	int ret = 0;
 
 	if (!swidget)
 		return 0;
 
-	sdev = swidget->sdev;
+	scomp = swidget->scomp;
 
-	dev_dbg(sdev->dev, "received event %d for widget %s\n",
+	dev_dbg(scomp->dev, "received event %d for widget %s\n",
 		event, w->name);
 
 	/* get runtime PCM params using widget's stream name */
-	spcm = snd_sof_find_spcm_name(sdev, swidget->widget->sname);
+	spcm = snd_sof_find_spcm_name(scomp, swidget->widget->sname);
 	if (!spcm) {
-		dev_err(sdev->dev, "error: cannot find PCM for %s\n",
+		dev_err(scomp->dev, "error: cannot find PCM for %s\n",
 			swidget->widget->name);
 		return -EINVAL;
 	}
@@ -160,14 +163,14 @@ static int sof_keyword_dapm_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (spcm->stream[stream].suspend_ignored) {
-			dev_dbg(sdev->dev, "PRE_PMU event ignored, KWD pipeline is already RUNNING\n");
+			dev_dbg(scomp->dev, "PRE_PMU event ignored, KWD pipeline is already RUNNING\n");
 			return 0;
 		}
 
 		/* set pcm params */
 		ret = ipc_pcm_params(swidget, stream);
 		if (ret < 0) {
-			dev_err(sdev->dev,
+			dev_err(scomp->dev,
 				"error: failed to set pcm params for widget %s\n",
 				swidget->widget->name);
 			break;
@@ -176,27 +179,27 @@ static int sof_keyword_dapm_event(struct snd_soc_dapm_widget *w,
 		/* start trigger */
 		ret = ipc_trigger(swidget, SOF_IPC_STREAM_TRIG_START);
 		if (ret < 0)
-			dev_err(sdev->dev,
+			dev_err(scomp->dev,
 				"error: failed to trigger widget %s\n",
 				swidget->widget->name);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (spcm->stream[stream].suspend_ignored) {
-			dev_dbg(sdev->dev, "POST_PMD even ignored, KWD pipeline will remain RUNNING\n");
+			dev_dbg(scomp->dev, "POST_PMD even ignored, KWD pipeline will remain RUNNING\n");
 			return 0;
 		}
 
 		/* stop trigger */
 		ret = ipc_trigger(swidget, SOF_IPC_STREAM_TRIG_STOP);
 		if (ret < 0)
-			dev_err(sdev->dev,
+			dev_err(scomp->dev,
 				"error: failed to trigger widget %s\n",
 				swidget->widget->name);
 
 		/* pcm free */
 		ret = ipc_trigger(swidget, SOF_IPC_STREAM_PCM_FREE);
 		if (ret < 0)
-			dev_err(sdev->dev,
+			dev_err(scomp->dev,
 				"error: failed to trigger widget %s\n",
 				swidget->widget->name);
 		break;
@@ -838,7 +841,7 @@ static void sof_parse_word_tokens(struct snd_soc_component *scomp,
 
 				/* check if array index is valid */
 				if (!index || *index == 0) {
-					dev_err(sdev->dev,
+					dev_err(scomp->dev,
 						"error: invalid array offset\n");
 					continue;
 				} else {
@@ -866,7 +869,6 @@ static int sof_parse_tokens(struct snd_soc_component *scomp,
 			    struct snd_soc_tplg_vendor_array *array,
 			    int priv_size)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	int asize;
 
 	while (priv_size > 0) {
@@ -874,7 +876,7 @@ static int sof_parse_tokens(struct snd_soc_component *scomp,
 
 		/* validate asize */
 		if (asize < 0) { /* FIXME: A zero-size array makes no sense */
-			dev_err(sdev->dev, "error: invalid array size 0x%x\n",
+			dev_err(scomp->dev, "error: invalid array size 0x%x\n",
 				asize);
 			return -EINVAL;
 		}
@@ -882,7 +884,7 @@ static int sof_parse_tokens(struct snd_soc_component *scomp,
 		/* make sure there is enough data before parsing */
 		priv_size -= asize;
 		if (priv_size < 0) {
-			dev_err(sdev->dev, "error: invalid array size 0x%x\n",
+			dev_err(scomp->dev, "error: invalid array size 0x%x\n",
 				asize);
 			return -EINVAL;
 		}
@@ -905,7 +907,7 @@ static int sof_parse_tokens(struct snd_soc_component *scomp,
 					      array);
 			break;
 		default:
-			dev_err(sdev->dev, "error: unknown token type %d\n",
+			dev_err(scomp->dev, "error: unknown token type %d\n",
 				array->type);
 			return -EINVAL;
 		}
@@ -920,9 +922,7 @@ static int sof_parse_tokens(struct snd_soc_component *scomp,
 static void sof_dbg_comp_config(struct snd_soc_component *scomp,
 				struct sof_ipc_comp_config *config)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-
-	dev_dbg(sdev->dev, " config: periods snk %d src %d fmt %d\n",
+	dev_dbg(scomp->dev, " config: periods snk %d src %d fmt %d\n",
 		config->periods_sink, config->periods_source,
 		config->frame_fmt);
 }
@@ -974,7 +974,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 
 	/* extract tlv data */
 	if (get_tlv_data(kc->tlv.p, tlv) < 0) {
-		dev_err(sdev->dev, "error: invalid TLV data\n");
+		dev_err(scomp->dev, "error: invalid TLV data\n");
 		ret = -EINVAL;
 		goto out_free;
 	}
@@ -982,7 +982,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	/* set up volume table */
 	ret = set_up_volume_table(scontrol, tlv, le32_to_cpu(mc->max) + 1);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: setting up volume table\n");
+		dev_err(scomp->dev, "error: setting up volume table\n");
 		goto out_free;
 	}
 
@@ -999,12 +999,12 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 			       ARRAY_SIZE(led_tokens), mc->priv.array,
 			       le32_to_cpu(mc->priv.size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse led tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse led tokens failed %d\n",
 			le32_to_cpu(mc->priv.size));
 		goto out_free_table;
 	}
 
-	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d\n",
+	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d\n",
 		scontrol->comp_id, scontrol->num_channels);
 
 	return ret;
@@ -1043,7 +1043,7 @@ static int sof_control_load_enum(struct snd_soc_component *scomp,
 
 	scontrol->cmd = SOF_CTRL_CMD_ENUM;
 
-	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d comp_id %d\n",
+	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d comp_id %d\n",
 		scontrol->comp_id, scontrol->num_channels, scontrol->comp_id);
 
 	return 0;
@@ -1067,7 +1067,7 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 		le32_to_cpu(control->priv.size);
 
 	if (scontrol->size > max_size) {
-		dev_err(sdev->dev, "err: bytes data size %d exceeds max %d.\n",
+		dev_err(scomp->dev, "err: bytes data size %d exceeds max %d.\n",
 			scontrol->size, max_size);
 		ret = -EINVAL;
 		goto out;
@@ -1083,7 +1083,7 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 	scontrol->comp_id = sdev->next_comp_id;
 	scontrol->cmd = SOF_CTRL_CMD_BINARY;
 
-	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d\n",
+	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d\n",
 		scontrol->comp_id, scontrol->num_channels);
 
 	if (le32_to_cpu(control->priv.size) > 0) {
@@ -1091,14 +1091,14 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 		       le32_to_cpu(control->priv.size));
 
 		if (cdata->data->magic != SOF_ABI_MAGIC) {
-			dev_err(sdev->dev, "error: Wrong ABI magic 0x%08x.\n",
+			dev_err(scomp->dev, "error: Wrong ABI magic 0x%08x.\n",
 				cdata->data->magic);
 			ret = -EINVAL;
 			goto out_free;
 		}
 		if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION,
 						 cdata->data->abi)) {
-			dev_err(sdev->dev,
+			dev_err(scomp->dev,
 				"error: Incompatible ABI version 0x%08x.\n",
 				cdata->data->abi);
 			ret = -EINVAL;
@@ -1106,7 +1106,7 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 		}
 		if (cdata->data->size + sizeof(const struct sof_abi_hdr) !=
 		    le32_to_cpu(control->priv.size)) {
-			dev_err(sdev->dev,
+			dev_err(scomp->dev,
 				"error: Conflict in bytes vs. priv size.\n");
 			ret = -EINVAL;
 			goto out_free;
@@ -1134,14 +1134,14 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 	struct snd_sof_control *scontrol;
 	int ret = -EINVAL;
 
-	dev_dbg(sdev->dev, "tplg: load control type %d name : %s\n",
+	dev_dbg(scomp->dev, "tplg: load control type %d name : %s\n",
 		hdr->type, hdr->name);
 
 	scontrol = kzalloc(sizeof(*scontrol), GFP_KERNEL);
 	if (!scontrol)
 		return -ENOMEM;
 
-	scontrol->sdev = sdev;
+	scontrol->scomp = scomp;
 
 	switch (le32_to_cpu(hdr->ops.info)) {
 	case SND_SOC_TPLG_CTL_VOLSW:
@@ -1170,7 +1170,7 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 	case SND_SOC_TPLG_DAPM_CTL_ENUM_VALUE:
 	case SND_SOC_TPLG_DAPM_CTL_PIN:
 	default:
-		dev_warn(sdev->dev, "control type not supported %d:%d:%d\n",
+		dev_warn(scomp->dev, "control type not supported %d:%d:%d\n",
 			 hdr->ops.get, hdr->ops.put, hdr->ops.info);
 		kfree(scontrol);
 		return 0;
@@ -1193,7 +1193,7 @@ static int sof_control_unload(struct snd_soc_component *scomp,
 	struct sof_ipc_free fcomp;
 	struct snd_sof_control *scontrol = dobj->private;
 
-	dev_dbg(sdev->dev, "tplg: unload control name : %s\n", scomp->name);
+	dev_dbg(scomp->dev, "tplg: unload control name : %s\n", scomp->name);
 
 	fcomp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_FREE;
 	fcomp.hdr.size = sizeof(fcomp);
@@ -1217,12 +1217,11 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 				  struct snd_soc_tplg_dapm_widget *tw,
 				  struct snd_sof_dai *dai)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_card *card = scomp->card;
 	struct snd_soc_pcm_runtime *rtd;
 
 	list_for_each_entry(rtd, &card->rtd_list, list) {
-		dev_vdbg(sdev->dev, "tplg: check widget: %s stream: %s dai stream: %s\n",
+		dev_vdbg(scomp->dev, "tplg: check widget: %s stream: %s dai stream: %s\n",
 			 w->name,  w->sname, rtd->dai_link->stream_name);
 
 		if (!w->sname || !rtd->dai_link->stream_name)
@@ -1236,13 +1235,13 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 		case snd_soc_dapm_dai_out:
 			rtd->cpu_dai->capture_widget = w;
 			dai->name = rtd->dai_link->name;
-			dev_dbg(sdev->dev, "tplg: connected widget %s -> DAI link %s\n",
+			dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
 				w->name, rtd->dai_link->name);
 			break;
 		case snd_soc_dapm_dai_in:
 			rtd->cpu_dai->playback_widget = w;
 			dai->name = rtd->dai_link->name;
-			dev_dbg(sdev->dev, "tplg: connected widget %s -> DAI link %s\n",
+			dev_dbg(scomp->dev, "tplg: connected widget %s -> DAI link %s\n",
 				w->name, rtd->dai_link->name);
 			break;
 		default:
@@ -1252,7 +1251,7 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
 
 	/* check we have a connection */
 	if (!dai->name) {
-		dev_err(sdev->dev, "error: can't connect DAI %s stream %s\n",
+		dev_err(scomp->dev, "error: can't connect DAI %s stream %s\n",
 			w->name, w->sname);
 		return -EINVAL;
 	}
@@ -1284,7 +1283,7 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(dai_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse dai tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse dai tokens failed %d\n",
 			le32_to_cpu(private->size));
 		return ret;
 	}
@@ -1293,12 +1292,12 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(comp_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse dai.cfg tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse dai.cfg tokens failed %d\n",
 			private->size);
 		return ret;
 	}
 
-	dev_dbg(sdev->dev, "dai %s: type %d index %d\n",
+	dev_dbg(scomp->dev, "dai %s: type %d index %d\n",
 		swidget->widget->name, comp_dai.type, comp_dai.dai_index);
 	sof_dbg_comp_config(scomp, &comp_dai.config);
 
@@ -1306,7 +1305,7 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 				 &comp_dai, sizeof(comp_dai), r, sizeof(*r));
 
 	if (ret == 0 && dai) {
-		dai->sdev = sdev;
+		dai->scomp = scomp;
 		memcpy(&dai->comp_dai, &comp_dai, sizeof(comp_dai));
 	}
 
@@ -1342,13 +1341,13 @@ static int sof_widget_load_buffer(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(buffer_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse buffer tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse buffer tokens failed %d\n",
 			private->size);
 		kfree(buffer);
 		return ret;
 	}
 
-	dev_dbg(sdev->dev, "buffer %s: size %d caps 0x%x\n",
+	dev_dbg(scomp->dev, "buffer %s: size %d caps 0x%x\n",
 		swidget->widget->name, buffer->size, buffer->caps);
 
 	swidget->private = buffer;
@@ -1356,7 +1355,7 @@ static int sof_widget_load_buffer(struct snd_soc_component *scomp, int index,
 	ret = sof_ipc_tx_message(sdev->ipc, buffer->comp.hdr.cmd, buffer,
 				 sizeof(*buffer), r, sizeof(*r));
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: buffer %s load failed\n",
+		dev_err(scomp->dev, "error: buffer %s load failed\n",
 			swidget->widget->name);
 		kfree(buffer);
 	}
@@ -1365,16 +1364,16 @@ static int sof_widget_load_buffer(struct snd_soc_component *scomp, int index,
 }
 
 /* bind PCM ID to host component ID */
-static int spcm_bind(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm,
+static int spcm_bind(struct snd_soc_component *scomp, struct snd_sof_pcm *spcm,
 		     int dir)
 {
 	struct snd_sof_widget *host_widget;
 
-	host_widget = snd_sof_find_swidget_sname(sdev,
+	host_widget = snd_sof_find_swidget_sname(scomp,
 						 spcm->pcm.caps[dir].name,
 						 dir);
 	if (!host_widget) {
-		dev_err(sdev->dev, "can't find host comp to bind pcm\n");
+		dev_err(scomp->dev, "can't find host comp to bind pcm\n");
 		return -EINVAL;
 	}
 
@@ -1415,7 +1414,7 @@ static int sof_widget_load_pcm(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(pcm_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse host tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse host tokens failed %d\n",
 			private->size);
 		goto err;
 	}
@@ -1424,12 +1423,12 @@ static int sof_widget_load_pcm(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(comp_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse host.cfg tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse host.cfg tokens failed %d\n",
 			le32_to_cpu(private->size));
 		goto err;
 	}
 
-	dev_dbg(sdev->dev, "loaded host %s\n", swidget->widget->name);
+	dev_dbg(scomp->dev, "loaded host %s\n", swidget->widget->name);
 	sof_dbg_comp_config(scomp, &host->config);
 
 	swidget->private = host;
@@ -1446,24 +1445,25 @@ static int sof_widget_load_pcm(struct snd_soc_component *scomp, int index,
 /*
  * Pipeline Topology
  */
-int sof_load_pipeline_ipc(struct snd_sof_dev *sdev,
+int sof_load_pipeline_ipc(struct device *dev,
 			  struct sof_ipc_pipe_new *pipeline,
 			  struct sof_ipc_comp_reply *r)
 {
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct sof_ipc_pm_core_config pm_core_config;
 	int ret;
 
 	ret = sof_ipc_tx_message(sdev->ipc, pipeline->hdr.cmd, pipeline,
 				 sizeof(*pipeline), r, sizeof(*r));
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: load pipeline ipc failure\n");
+		dev_err(dev, "error: load pipeline ipc failure\n");
 		return ret;
 	}
 
 	/* power up the core that this pipeline is scheduled on */
 	ret = snd_sof_dsp_core_power_up(sdev, 1 << pipeline->core);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: powering up pipeline schedule core %d\n",
+		dev_err(dev, "error: powering up pipeline schedule core %d\n",
 			pipeline->core);
 		return ret;
 	}
@@ -1487,7 +1487,7 @@ int sof_load_pipeline_ipc(struct snd_sof_dev *sdev,
 				 &pm_core_config, sizeof(pm_core_config),
 				 &pm_core_config, sizeof(pm_core_config));
 	if (ret < 0)
-		dev_err(sdev->dev, "error: core enable ipc failure\n");
+		dev_err(dev, "error: core enable ipc failure\n");
 
 	return ret;
 }
@@ -1497,7 +1497,6 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp,
 				    struct snd_soc_tplg_dapm_widget *tw,
 				    struct sof_ipc_comp_reply *r)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_pipe_new *pipeline;
 	struct snd_sof_widget *comp_swidget;
@@ -1514,9 +1513,9 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp,
 	pipeline->comp_id = swidget->comp_id;
 
 	/* component at start of pipeline is our stream id */
-	comp_swidget = snd_sof_find_swidget(sdev, tw->sname);
+	comp_swidget = snd_sof_find_swidget(scomp, tw->sname);
 	if (!comp_swidget) {
-		dev_err(sdev->dev, "error: widget %s refers to non existent widget %s\n",
+		dev_err(scomp->dev, "error: widget %s refers to non existent widget %s\n",
 			tw->name, tw->sname);
 		ret = -EINVAL;
 		goto err;
@@ -1524,26 +1523,26 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp,
 
 	pipeline->sched_id = comp_swidget->comp_id;
 
-	dev_dbg(sdev->dev, "tplg: pipeline id %d comp %d scheduling comp id %d\n",
+	dev_dbg(scomp->dev, "tplg: pipeline id %d comp %d scheduling comp id %d\n",
 		pipeline->pipeline_id, pipeline->comp_id, pipeline->sched_id);
 
 	ret = sof_parse_tokens(scomp, pipeline, sched_tokens,
 			       ARRAY_SIZE(sched_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse pipeline tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse pipeline tokens failed %d\n",
 			private->size);
 		goto err;
 	}
 
-	dev_dbg(sdev->dev, "pipeline %s: period %d pri %d mips %d core %d frames %d\n",
+	dev_dbg(scomp->dev, "pipeline %s: period %d pri %d mips %d core %d frames %d\n",
 		swidget->widget->name, pipeline->period, pipeline->priority,
 		pipeline->period_mips, pipeline->core, pipeline->frames_per_sched);
 
 	swidget->private = pipeline;
 
 	/* send ipc's to create pipeline comp and power up schedule core */
-	ret = sof_load_pipeline_ipc(sdev, pipeline, r);
+	ret = sof_load_pipeline_ipc(scomp->dev, pipeline, r);
 	if (ret >= 0)
 		return ret;
 err:
@@ -1581,7 +1580,7 @@ static int sof_widget_load_mixer(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(comp_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse mixer.cfg tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse mixer.cfg tokens failed %d\n",
 			private->size);
 		kfree(mixer);
 		return ret;
@@ -1628,7 +1627,7 @@ static int sof_widget_load_mux(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(comp_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse mux.cfg tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse mux.cfg tokens failed %d\n",
 			private->size);
 		kfree(mux);
 		return ret;
@@ -1668,7 +1667,7 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 		return -ENOMEM;
 
 	if (!le32_to_cpu(tw->num_kcontrols)) {
-		dev_err(sdev->dev, "error: invalid kcontrol count %d for volume\n",
+		dev_err(scomp->dev, "error: invalid kcontrol count %d for volume\n",
 			tw->num_kcontrols);
 		ret = -EINVAL;
 		goto err;
@@ -1686,7 +1685,7 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(volume_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse volume tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse volume tokens failed %d\n",
 			private->size);
 		goto err;
 	}
@@ -1694,7 +1693,7 @@ static int sof_widget_load_pga(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(comp_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse volume.cfg tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse volume.cfg tokens failed %d\n",
 			le32_to_cpu(private->size));
 		goto err;
 	}
@@ -1754,7 +1753,7 @@ static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(src_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse src tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse src tokens failed %d\n",
 			private->size);
 		goto err;
 	}
@@ -1763,12 +1762,12 @@ static int sof_widget_load_src(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(comp_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse src.cfg tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse src.cfg tokens failed %d\n",
 			le32_to_cpu(private->size));
 		goto err;
 	}
 
-	dev_dbg(sdev->dev, "src %s: source rate %d sink rate %d\n",
+	dev_dbg(scomp->dev, "src %s: source rate %d sink rate %d\n",
 		swidget->widget->name, src->source_rate, src->sink_rate);
 	sof_dbg_comp_config(scomp, &src->config);
 
@@ -1813,7 +1812,7 @@ static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(tone_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse tone tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse tone tokens failed %d\n",
 			le32_to_cpu(private->size));
 		goto err;
 	}
@@ -1822,12 +1821,12 @@ static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(comp_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse tone.cfg tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse tone.cfg tokens failed %d\n",
 			le32_to_cpu(private->size));
 		goto err;
 	}
 
-	dev_dbg(sdev->dev, "tone %s: frequency %d amplitude %d\n",
+	dev_dbg(scomp->dev, "tone %s: frequency %d amplitude %d\n",
 		swidget->widget->name, tone->frequency, tone->amplitude);
 	sof_dbg_comp_config(scomp, &tone->config);
 
@@ -1842,7 +1841,7 @@ static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
-static int sof_get_control_data(struct snd_sof_dev *sdev,
+static int sof_get_control_data(struct snd_soc_component *scomp,
 				struct snd_soc_dapm_widget *widget,
 				struct sof_widget_data *wdata,
 				size_t *size)
@@ -1872,14 +1871,14 @@ static int sof_get_control_data(struct snd_sof_dev *sdev,
 			wdata[i].control = se->dobj.private;
 			break;
 		default:
-			dev_err(sdev->dev, "error: unknown kcontrol type %d in widget %s\n",
+			dev_err(scomp->dev, "error: unknown kcontrol type %d in widget %s\n",
 				widget->dobj.widget.kcontrol_type,
 				widget->name);
 			return -EINVAL;
 		}
 
 		if (!wdata[i].control) {
-			dev_err(sdev->dev, "error: no scontrol for widget %s\n",
+			dev_err(scomp->dev, "error: no scontrol for widget %s\n",
 				widget->name);
 			return -EINVAL;
 		}
@@ -1932,7 +1931,7 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 	int i;
 
 	if (type == SOF_COMP_NONE) {
-		dev_err(sdev->dev, "error: invalid process comp type %d\n",
+		dev_err(scomp->dev, "error: invalid process comp type %d\n",
 			type);
 		return -EINVAL;
 	}
@@ -1947,7 +1946,7 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 			return -ENOMEM;
 
 		/* get possible component controls and get size of all pdata */
-		ret = sof_get_control_data(sdev, widget, wdata,
+		ret = sof_get_control_data(scomp, widget, wdata,
 					   &ipc_data_size);
 
 		if (ret < 0)
@@ -1982,7 +1981,7 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(comp_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse process.cfg tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse process.cfg tokens failed %d\n",
 			le32_to_cpu(private->size));
 		goto err;
 	}
@@ -2010,7 +2009,7 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 				 ipc_size, r, sizeof(*r));
 
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: create process failed\n");
+		dev_err(scomp->dev, "error: create process failed\n");
 		goto err;
 	}
 
@@ -2021,13 +2020,13 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 	/* send control data with large message supported method */
 	for (i = 0; i < widget->num_kcontrols; i++) {
 		wdata[i].control->readback_offset = 0;
-		ret = snd_sof_ipc_set_get_comp_data(sdev->ipc, wdata[i].control,
+		ret = snd_sof_ipc_set_get_comp_data(wdata[i].control,
 						    wdata[i].ipc_cmd,
 						    wdata[i].ctrl_type,
 						    wdata[i].control->cmd,
 						    true);
 		if (ret != 0) {
-			dev_err(sdev->dev, "error: send control failed\n");
+			dev_err(scomp->dev, "error: send control failed\n");
 			break;
 		}
 	}
@@ -2050,14 +2049,13 @@ static int sof_widget_load_process(struct snd_soc_component *scomp, int index,
 				   struct snd_soc_tplg_dapm_widget *tw,
 				   struct sof_ipc_comp_reply *r)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &tw->priv;
 	struct sof_ipc_comp_process config;
 	int ret;
 
 	/* check we have some tokens - we need at least process type */
 	if (le32_to_cpu(private->size) == 0) {
-		dev_err(sdev->dev, "error: process tokens not found\n");
+		dev_err(scomp->dev, "error: process tokens not found\n");
 		return -EINVAL;
 	}
 
@@ -2068,7 +2066,7 @@ static int sof_widget_load_process(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(process_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse process tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse process tokens failed %d\n",
 			le32_to_cpu(private->size));
 		return ret;
 	}
@@ -2077,14 +2075,14 @@ static int sof_widget_load_process(struct snd_soc_component *scomp, int index,
 	ret = sof_process_load(scomp, index, swidget, tw, r,
 			       find_process_comp_type(config.type));
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: process loading failed\n");
+		dev_err(scomp->dev, "error: process loading failed\n");
 		return ret;
 	}
 
 	return 0;
 }
 
-static int sof_widget_bind_event(struct snd_sof_dev *sdev,
+static int sof_widget_bind_event(struct snd_soc_component *scomp,
 				 struct snd_sof_widget *swidget,
 				 u16 event_type)
 {
@@ -2110,7 +2108,7 @@ static int sof_widget_bind_event(struct snd_sof_dev *sdev,
 		break;
 	}
 
-	dev_err(sdev->dev,
+	dev_err(scomp->dev,
 		"error: invalid event type %d for widget %s\n",
 		event_type, swidget->widget->name);
 	return -EINVAL;
@@ -2132,7 +2130,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	if (!swidget)
 		return -ENOMEM;
 
-	swidget->sdev = sdev;
+	swidget->scomp = scomp;
 	swidget->widget = w;
 	swidget->comp_id = sdev->next_comp_id++;
 	swidget->complete = 0;
@@ -2141,7 +2139,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	swidget->private = NULL;
 	memset(&reply, 0, sizeof(reply));
 
-	dev_dbg(sdev->dev, "tplg: ready widget id %d pipe %d type %d name : %s stream %s\n",
+	dev_dbg(scomp->dev, "tplg: ready widget id %d pipe %d type %d name : %s stream %s\n",
 		swidget->comp_id, index, swidget->id, tw->name,
 		strnlen(tw->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0
 			? tw->sname : "none");
@@ -2212,14 +2210,14 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	case snd_soc_dapm_dai_link:
 	case snd_soc_dapm_kcontrol:
 	default:
-		dev_warn(sdev->dev, "warning: widget type %d name %s not handled\n",
+		dev_warn(scomp->dev, "warning: widget type %d name %s not handled\n",
 			 swidget->id, tw->name);
 		break;
 	}
 
 	/* check IPC reply */
 	if (ret < 0 || reply.rhdr.error < 0) {
-		dev_err(sdev->dev,
+		dev_err(scomp->dev,
 			"error: DSP failed to add widget id %d type %d name : %s stream %s reply %d\n",
 			tw->shift, swidget->id, tw->name,
 			strnlen(tw->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0
@@ -2230,10 +2228,10 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 
 	/* bind widget to external event */
 	if (tw->event_type) {
-		ret = sof_widget_bind_event(sdev, swidget,
+		ret = sof_widget_bind_event(scomp, swidget,
 					    le16_to_cpu(tw->event_type));
 		if (ret) {
-			dev_err(sdev->dev, "error: widget event binding failed\n");
+			dev_err(scomp->dev, "error: widget event binding failed\n");
 			kfree(swidget->private);
 			kfree(swidget);
 			return ret;
@@ -2301,7 +2299,7 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 		pipeline = swidget->private;
 		ret = snd_sof_dsp_core_power_down(sdev, 1 << pipeline->core);
 		if (ret < 0)
-			dev_err(sdev->dev, "error: powering down pipeline schedule core %d\n",
+			dev_err(scomp->dev, "error: powering down pipeline schedule core %d\n",
 				pipeline->core);
 
 		/* update enabled cores mask */
@@ -2329,7 +2327,7 @@ static int sof_widget_unload(struct snd_soc_component *scomp,
 			scontrol = sbe->dobj.private;
 			break;
 		default:
-			dev_warn(sdev->dev, "unsupported kcontrol_type\n");
+			dev_warn(scomp->dev, "unsupported kcontrol_type\n");
 			goto out;
 		}
 		kfree(scontrol->control_data);
@@ -2372,12 +2370,12 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	if (!spcm)
 		return -ENOMEM;
 
-	spcm->sdev = sdev;
+	spcm->scomp = scomp;
 	spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id = COMP_ID_UNASSIGNED;
 	spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id = COMP_ID_UNASSIGNED;
 
 	spcm->pcm = *pcm;
-	dev_dbg(sdev->dev, "tplg: load pcm %s\n", pcm->dai_name);
+	dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
 
 	dai_drv->dobj.private = spcm;
 	list_add(&spcm->list, &sdev->pcm_list);
@@ -2386,7 +2384,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(stream_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret) {
-		dev_err(sdev->dev, "error: parse stream tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse stream tokens failed %d\n",
 			le32_to_cpu(private->size));
 		return ret;
 	}
@@ -2395,7 +2393,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	if (!spcm->pcm.playback)
 		goto capture;
 
-	dev_vdbg(sdev->dev, "tplg: pcm %s stream tokens: playback d0i3:%d\n",
+	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: playback d0i3:%d\n",
 		 spcm->pcm.pcm_name, spcm->stream[0].d0i3_compatible);
 
 	caps = &spcm->pcm.caps[stream];
@@ -2404,16 +2402,16 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev,
 				  PAGE_SIZE, &spcm->stream[stream].page_table);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: can't alloc page table for %s %d\n",
+		dev_err(scomp->dev, "error: can't alloc page table for %s %d\n",
 			caps->name, ret);
 
 		return ret;
 	}
 
 	/* bind pcm to host comp */
-	ret = spcm_bind(sdev, spcm, stream);
+	ret = spcm_bind(scomp, spcm, stream);
 	if (ret) {
-		dev_err(sdev->dev,
+		dev_err(scomp->dev,
 			"error: can't bind pcm to host\n");
 		goto free_playback_tables;
 	}
@@ -2425,7 +2423,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	if (!spcm->pcm.capture)
 		return ret;
 
-	dev_vdbg(sdev->dev, "tplg: pcm %s stream tokens: capture d0i3:%d\n",
+	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: capture d0i3:%d\n",
 		 spcm->pcm.pcm_name, spcm->stream[1].d0i3_compatible);
 
 	caps = &spcm->pcm.caps[stream];
@@ -2434,15 +2432,15 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev,
 				  PAGE_SIZE, &spcm->stream[stream].page_table);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: can't alloc page table for %s %d\n",
+		dev_err(scomp->dev, "error: can't alloc page table for %s %d\n",
 			caps->name, ret);
 		goto free_playback_tables;
 	}
 
 	/* bind pcm to host comp */
-	ret = spcm_bind(sdev, spcm, stream);
+	ret = spcm_bind(scomp, spcm, stream);
 	if (ret) {
-		dev_err(sdev->dev,
+		dev_err(scomp->dev,
 			"error: can't bind pcm to host\n");
 		snd_dma_free_pages(&spcm->stream[stream].page_table);
 		goto free_playback_tables;
@@ -2568,7 +2566,7 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(ssp_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse ssp tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse ssp tokens failed %d\n",
 			le32_to_cpu(private->size));
 		return ret;
 	}
@@ -2582,7 +2580,7 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 	config->ssp.rx_slots = le32_to_cpu(hw_config->rx_slots);
 	config->ssp.tx_slots = le32_to_cpu(hw_config->tx_slots);
 
-	dev_dbg(sdev->dev, "tplg: config SSP%d fmt 0x%x mclk %d bclk %d fclk %d width (%d)%d slots %d mclk id %d quirks %d\n",
+	dev_dbg(scomp->dev, "tplg: config SSP%d fmt 0x%x mclk %d bclk %d fclk %d width (%d)%d slots %d mclk id %d quirks %d\n",
 		config->dai_index, config->format,
 		config->ssp.mclk_rate, config->ssp.bclk_rate,
 		config->ssp.fsync_rate, config->ssp.sample_valid_bits,
@@ -2591,13 +2589,13 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 
 	/* validate SSP fsync rate and channel count */
 	if (config->ssp.fsync_rate < 8000 || config->ssp.fsync_rate > 192000) {
-		dev_err(sdev->dev, "error: invalid fsync rate for SSP%d\n",
+		dev_err(scomp->dev, "error: invalid fsync rate for SSP%d\n",
 			config->dai_index);
 		return -EINVAL;
 	}
 
 	if (config->ssp.tdm_slots < 1 || config->ssp.tdm_slots > 8) {
-		dev_err(sdev->dev, "error: invalid channel count for SSP%d\n",
+		dev_err(scomp->dev, "error: invalid channel count for SSP%d\n",
 			config->dai_index);
 		return -EINVAL;
 	}
@@ -2608,7 +2606,7 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 				 sizeof(reply));
 
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to set DAI config for SSP%d\n",
+		dev_err(scomp->dev, "error: failed to set DAI config for SSP%d\n",
 			config->dai_index);
 		return ret;
 	}
@@ -2616,7 +2614,7 @@ static int sof_link_ssp_load(struct snd_soc_component *scomp, int index,
 	/* set config for all DAI's with name matching the link name */
 	ret = sof_set_dai_config(sdev, size, link, config);
 	if (ret < 0)
-		dev_err(sdev->dev, "error: failed to save DAI config for SSP%d\n",
+		dev_err(scomp->dev, "error: failed to save DAI config for SSP%d\n",
 			config->dai_index);
 
 	return ret;
@@ -2655,7 +2653,7 @@ static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(esai_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse esai tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse esai tokens failed %d\n",
 			le32_to_cpu(private->size));
 		return ret;
 	}
@@ -2669,14 +2667,14 @@ static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
 	config->esai.rx_slots = le32_to_cpu(hw_config->rx_slots);
 	config->esai.tx_slots = le32_to_cpu(hw_config->tx_slots);
 
-	dev_info(sdev->dev,
+	dev_info(scomp->dev,
 		 "tplg: config ESAI%d fmt 0x%x mclk %d width %d slots %d mclk id %d\n",
 		config->dai_index, config->format,
 		config->esai.mclk_rate, config->esai.tdm_slot_width,
 		config->esai.tdm_slots, config->esai.mclk_id);
 
 	if (config->esai.tdm_slots < 1 || config->esai.tdm_slots > 8) {
-		dev_err(sdev->dev, "error: invalid channel count for ESAI%d\n",
+		dev_err(scomp->dev, "error: invalid channel count for ESAI%d\n",
 			config->dai_index);
 		return -EINVAL;
 	}
@@ -2686,7 +2684,7 @@ static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
 				 config->hdr.cmd, config, size, &reply,
 				 sizeof(reply));
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to set DAI config for ESAI%d\n",
+		dev_err(scomp->dev, "error: failed to set DAI config for ESAI%d\n",
 			config->dai_index);
 		return ret;
 	}
@@ -2694,7 +2692,7 @@ static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
 	/* set config for all DAI's with name matching the link name */
 	ret = sof_set_dai_config(sdev, size, link, config);
 	if (ret < 0)
-		dev_err(sdev->dev, "error: failed to save DAI config for ESAI%d\n",
+		dev_err(scomp->dev, "error: failed to save DAI config for ESAI%d\n",
 			config->dai_index);
 
 	return ret;
@@ -2727,7 +2725,7 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(dmic_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse dmic tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse dmic tokens failed %d\n",
 			le32_to_cpu(private->size));
 		return ret;
 	}
@@ -2762,7 +2760,7 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(dmic_pdm_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse dmic pdm tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse dmic pdm tokens failed %d\n",
 			le32_to_cpu(private->size));
 		goto err;
 	}
@@ -2771,27 +2769,27 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 	ipc_config->hdr.size = size;
 
 	/* debug messages */
-	dev_dbg(sdev->dev, "tplg: config DMIC%d driver version %d\n",
+	dev_dbg(scomp->dev, "tplg: config DMIC%d driver version %d\n",
 		ipc_config->dai_index, ipc_config->dmic.driver_ipc_version);
-	dev_dbg(sdev->dev, "pdmclk_min %d pdm_clkmax %d duty_min %hd\n",
+	dev_dbg(scomp->dev, "pdmclk_min %d pdm_clkmax %d duty_min %hd\n",
 		ipc_config->dmic.pdmclk_min, ipc_config->dmic.pdmclk_max,
 		ipc_config->dmic.duty_min);
-	dev_dbg(sdev->dev, "duty_max %hd fifo_fs %d num_pdms active %d\n",
+	dev_dbg(scomp->dev, "duty_max %hd fifo_fs %d num_pdms active %d\n",
 		ipc_config->dmic.duty_max, ipc_config->dmic.fifo_fs,
 		ipc_config->dmic.num_pdm_active);
-	dev_dbg(sdev->dev, "fifo word length %hd\n",
+	dev_dbg(scomp->dev, "fifo word length %hd\n",
 		ipc_config->dmic.fifo_bits);
 
 	for (j = 0; j < ipc_config->dmic.num_pdm_active; j++) {
-		dev_dbg(sdev->dev, "pdm %hd mic a %hd mic b %hd\n",
+		dev_dbg(scomp->dev, "pdm %hd mic a %hd mic b %hd\n",
 			ipc_config->dmic.pdm[j].id,
 			ipc_config->dmic.pdm[j].enable_mic_a,
 			ipc_config->dmic.pdm[j].enable_mic_b);
-		dev_dbg(sdev->dev, "pdm %hd polarity a %hd polarity b %hd\n",
+		dev_dbg(scomp->dev, "pdm %hd polarity a %hd polarity b %hd\n",
 			ipc_config->dmic.pdm[j].id,
 			ipc_config->dmic.pdm[j].polarity_mic_a,
 			ipc_config->dmic.pdm[j].polarity_mic_b);
-		dev_dbg(sdev->dev, "pdm %hd clk_edge %hd skew %hd\n",
+		dev_dbg(scomp->dev, "pdm %hd clk_edge %hd skew %hd\n",
 			ipc_config->dmic.pdm[j].id,
 			ipc_config->dmic.pdm[j].clk_edge,
 			ipc_config->dmic.pdm[j].skew);
@@ -2808,7 +2806,7 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 				 sizeof(reply));
 
 	if (ret < 0) {
-		dev_err(sdev->dev,
+		dev_err(scomp->dev,
 			"error: failed to set DAI config for DMIC%d\n",
 			config->dai_index);
 		goto err;
@@ -2817,7 +2815,7 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 	/* set config for all DAI's with name matching the link name */
 	ret = sof_set_dai_config(sdev, size, link, ipc_config);
 	if (ret < 0)
-		dev_err(sdev->dev, "error: failed to save DAI config for DMIC%d\n",
+		dev_err(scomp->dev, "error: failed to save DAI config for DMIC%d\n",
 			config->dai_index);
 
 err:
@@ -2908,21 +2906,21 @@ static int sof_link_hda_load(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(hda_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse hda tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse hda tokens failed %d\n",
 			le32_to_cpu(private->size));
 		return ret;
 	}
 
 	dai = snd_soc_find_dai(link->cpus);
 	if (!dai) {
-		dev_err(sdev->dev, "error: failed to find dai %s in %s",
+		dev_err(scomp->dev, "error: failed to find dai %s in %s",
 			link->cpus->dai_name, __func__);
 		return -EINVAL;
 	}
 
 	ret = sof_link_hda_process(sdev, link, config);
 	if (ret < 0)
-		dev_err(sdev->dev, "error: failed to process hda dai link %s",
+		dev_err(scomp->dev, "error: failed to process hda dai link %s",
 			link->name);
 
 	return ret;
@@ -2948,7 +2946,7 @@ static int sof_link_alh_load(struct snd_soc_component *scomp, int index,
 				 sizeof(reply));
 
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to set DAI config for ALH %d\n",
+		dev_err(scomp->dev, "error: failed to set DAI config for ALH %d\n",
 			config->dai_index);
 		return ret;
 	}
@@ -2956,7 +2954,7 @@ static int sof_link_alh_load(struct snd_soc_component *scomp, int index,
 	/* set config for all DAI's with name matching the link name */
 	ret = sof_set_dai_config(sdev, size, link, config);
 	if (ret < 0)
-		dev_err(sdev->dev, "error: failed to save DAI config for ALH %d\n",
+		dev_err(scomp->dev, "error: failed to save DAI config for ALH %d\n",
 			config->dai_index);
 
 	return ret;
@@ -2967,7 +2965,6 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 			 struct snd_soc_dai_link *link,
 			 struct snd_soc_tplg_link_config *cfg)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &cfg->priv;
 	struct sof_ipc_dai_config config;
 	struct snd_soc_tplg_hw_config *hw_config;
@@ -2976,10 +2973,10 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	int i = 0;
 
 	if (!link->platforms) {
-		dev_err(sdev->dev, "error: no platforms\n");
+		dev_err(scomp->dev, "error: no platforms\n");
 		return -EINVAL;
 	}
-	link->platforms->name = dev_name(sdev->dev);
+	link->platforms->name = dev_name(scomp->dev);
 
 	/*
 	 * Set nonatomic property for FE dai links as their trigger action
@@ -2998,7 +2995,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 
 	/* check we have some tokens - we need at least DAI type */
 	if (le32_to_cpu(private->size) == 0) {
-		dev_err(sdev->dev, "error: expected tokens for DAI, none found\n");
+		dev_err(scomp->dev, "error: expected tokens for DAI, none found\n");
 		return -EINVAL;
 	}
 
@@ -3010,7 +3007,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 			       ARRAY_SIZE(dai_link_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
-		dev_err(sdev->dev, "error: parse link tokens failed %d\n",
+		dev_err(scomp->dev, "error: parse link tokens failed %d\n",
 			le32_to_cpu(private->size));
 		return ret;
 	}
@@ -3022,12 +3019,12 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 	num_hw_configs = le32_to_cpu(cfg->num_hw_configs);
 	if (!num_hw_configs) {
 		if (config.type != SOF_DAI_INTEL_HDA) {
-			dev_err(sdev->dev, "error: unexpected DAI config count %d!\n",
+			dev_err(scomp->dev, "error: unexpected DAI config count %d!\n",
 				le32_to_cpu(cfg->num_hw_configs));
 			return -EINVAL;
 		}
 	} else {
-		dev_dbg(sdev->dev, "tplg: %d hw_configs found, default id: %d!\n",
+		dev_dbg(scomp->dev, "tplg: %d hw_configs found, default id: %d!\n",
 			cfg->num_hw_configs, le32_to_cpu(cfg->default_hw_config_id));
 
 		for (i = 0; i < num_hw_configs; i++) {
@@ -3036,7 +3033,7 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 		}
 
 		if (i == num_hw_configs) {
-			dev_err(sdev->dev, "error: default hw_config id: %d not found!\n",
+			dev_err(scomp->dev, "error: default hw_config id: %d not found!\n",
 				le32_to_cpu(cfg->default_hw_config_id));
 			return -EINVAL;
 		}
@@ -3075,7 +3072,8 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 					 &config);
 		break;
 	default:
-		dev_err(sdev->dev, "error: invalid DAI type %d\n", config.type);
+		dev_err(scomp->dev, "error: invalid DAI type %d\n",
+			config.type);
 		ret = -EINVAL;
 		break;
 	}
@@ -3123,7 +3121,7 @@ static int sof_link_unload(struct snd_soc_component *scomp,
 			goto found;
 	}
 
-	dev_err(sdev->dev, "error: failed to find dai %s in %s",
+	dev_err(scomp->dev, "error: failed to find dai %s in %s",
 		link->name, __func__);
 	return -EINVAL;
 found:
@@ -3138,7 +3136,7 @@ static int sof_link_unload(struct snd_soc_component *scomp,
 		ret = sof_link_hda_unload(sdev, link);
 		break;
 	default:
-		dev_err(sdev->dev, "error: invalid DAI type %d\n",
+		dev_err(scomp->dev, "error: invalid DAI type %d\n",
 			sof_dai->dai_config->type);
 		ret = -EINVAL;
 		break;
@@ -3164,7 +3162,7 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	if (!sroute)
 		return -ENOMEM;
 
-	sroute->sdev = sdev;
+	sroute->scomp = scomp;
 
 	connect = kzalloc(sizeof(*connect), GFP_KERNEL);
 	if (!connect) {
@@ -3175,14 +3173,14 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	connect->hdr.size = sizeof(*connect);
 	connect->hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_CONNECT;
 
-	dev_dbg(sdev->dev, "sink %s control %s source %s\n",
+	dev_dbg(scomp->dev, "sink %s control %s source %s\n",
 		route->sink, route->control ? route->control : "none",
 		route->source);
 
 	/* source component */
-	source_swidget = snd_sof_find_swidget(sdev, (char *)route->source);
+	source_swidget = snd_sof_find_swidget(scomp, (char *)route->source);
 	if (!source_swidget) {
-		dev_err(sdev->dev, "error: source %s not found\n",
+		dev_err(scomp->dev, "error: source %s not found\n",
 			route->source);
 		ret = -EINVAL;
 		goto err;
@@ -3201,9 +3199,9 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	connect->source_id = source_swidget->comp_id;
 
 	/* sink component */
-	sink_swidget = snd_sof_find_swidget(sdev, (char *)route->sink);
+	sink_swidget = snd_sof_find_swidget(scomp, (char *)route->sink);
 	if (!sink_swidget) {
-		dev_err(sdev->dev, "error: sink %s not found\n",
+		dev_err(scomp->dev, "error: sink %s not found\n",
 			route->sink);
 		ret = -EINVAL;
 		goto err;
@@ -3227,7 +3225,7 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	 */
 	if (source_swidget->id != snd_soc_dapm_buffer &&
 	    sink_swidget->id != snd_soc_dapm_buffer) {
-		dev_dbg(sdev->dev, "warning: neither Linked source component %s nor sink component %s is of buffer type, ignoring link\n",
+		dev_dbg(scomp->dev, "warning: neither Linked source component %s nor sink component %s is of buffer type, ignoring link\n",
 			route->source, route->sink);
 		ret = 0;
 		goto err;
@@ -3239,7 +3237,7 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 
 		/* check IPC return value */
 		if (ret < 0) {
-			dev_err(sdev->dev, "error: failed to add route sink %s control %s source %s\n",
+			dev_err(scomp->dev, "error: failed to add route sink %s control %s source %s\n",
 				route->sink,
 				route->control ? route->control : "none",
 				route->source);
@@ -3248,7 +3246,7 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 
 		/* check IPC reply */
 		if (reply.error < 0) {
-			dev_err(sdev->dev, "error: DSP failed to add route sink %s control %s source %s result %d\n",
+			dev_err(scomp->dev, "error: DSP failed to add route sink %s control %s source %s result %d\n",
 				route->sink,
 				route->control ? route->control : "none",
 				route->source, reply.error);
@@ -3275,8 +3273,9 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 /* Function to set the initial value of SOF kcontrols.
  * The value will be stored in scontrol->control_data
  */
-static int snd_sof_cache_kcontrol_val(struct snd_sof_dev *sdev)
+static int snd_sof_cache_kcontrol_val(struct snd_soc_component *scomp)
 {
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_sof_control *scontrol = NULL;
 	int ipc_cmd, ctrl_type;
 	int ret = 0;
@@ -3296,33 +3295,34 @@ static int snd_sof_cache_kcontrol_val(struct snd_sof_dev *sdev)
 			ctrl_type = SOF_CTRL_TYPE_DATA_GET;
 			break;
 		default:
-			dev_err(sdev->dev,
+			dev_err(scomp->dev,
 				"error: Invalid scontrol->cmd: %d\n",
 				scontrol->cmd);
 			return -EINVAL;
 		}
-		ret = snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+		ret = snd_sof_ipc_set_get_comp_data(scontrol,
 						    ipc_cmd, ctrl_type,
 						    scontrol->cmd,
 						    false);
 		if (ret < 0) {
-			dev_warn(sdev->dev,
-				"error: kcontrol value get for widget: %d\n",
-				scontrol->comp_id);
+			dev_warn(scomp->dev,
+				 "error: kcontrol value get for widget: %d\n",
+				 scontrol->comp_id);
 		}
 	}
 
 	return ret;
 }
 
-int snd_sof_complete_pipeline(struct snd_sof_dev *sdev,
+int snd_sof_complete_pipeline(struct device *dev,
 			      struct snd_sof_widget *swidget)
 {
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct sof_ipc_pipe_ready ready;
 	struct sof_ipc_reply reply;
 	int ret;
 
-	dev_dbg(sdev->dev, "tplg: complete pipeline %s id %d\n",
+	dev_dbg(dev, "tplg: complete pipeline %s id %d\n",
 		swidget->widget->name, swidget->comp_id);
 
 	memset(&ready, 0, sizeof(ready));
@@ -3352,7 +3352,7 @@ static void sof_complete(struct snd_soc_component *scomp)
 		switch (swidget->id) {
 		case snd_soc_dapm_scheduler:
 			swidget->complete =
-				snd_sof_complete_pipeline(sdev, swidget);
+				snd_sof_complete_pipeline(scomp->dev, swidget);
 			break;
 		default:
 			break;
@@ -3362,14 +3362,13 @@ static void sof_complete(struct snd_soc_component *scomp)
 	 * cache initial values of SOF kcontrols by reading DSP value over
 	 * IPC. It may be overwritten by alsa-mixer after booting up
 	 */
-	snd_sof_cache_kcontrol_val(sdev);
+	snd_sof_cache_kcontrol_val(scomp);
 }
 
 /* manifest - optional to inform component of manifest */
 static int sof_manifest(struct snd_soc_component *scomp, int index,
 			struct snd_soc_tplg_manifest *man)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	u32 size;
 	u32 abi_version;
 
@@ -3377,16 +3376,16 @@ static int sof_manifest(struct snd_soc_component *scomp, int index,
 
 	/* backward compatible with tplg without ABI info */
 	if (!size) {
-		dev_dbg(sdev->dev, "No topology ABI info\n");
+		dev_dbg(scomp->dev, "No topology ABI info\n");
 		return 0;
 	}
 
 	if (size != SOF_TPLG_ABI_SIZE) {
-		dev_err(sdev->dev, "error: invalid topology ABI size\n");
+		dev_err(scomp->dev, "error: invalid topology ABI size\n");
 		return -EINVAL;
 	}
 
-	dev_info(sdev->dev,
+	dev_info(scomp->dev,
 		 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
 		 man->priv.data[0], man->priv.data[1],
 		 man->priv.data[2], SOF_ABI_MAJOR, SOF_ABI_MINOR,
@@ -3397,15 +3396,15 @@ static int sof_manifest(struct snd_soc_component *scomp, int index,
 				  man->priv.data[2]);
 
 	if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION, abi_version)) {
-		dev_err(sdev->dev, "error: incompatible topology ABI version\n");
+		dev_err(scomp->dev, "error: incompatible topology ABI version\n");
 		return -EINVAL;
 	}
 
 	if (abi_version > SOF_ABI_VERSION) {
 		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS)) {
-			dev_warn(sdev->dev, "warn: topology ABI is more recent than kernel\n");
+			dev_warn(scomp->dev, "warn: topology ABI is more recent than kernel\n");
 		} else {
-			dev_err(sdev->dev, "error: topology ABI is more recent than kernel\n");
+			dev_err(scomp->dev, "error: topology ABI is more recent than kernel\n");
 			return -EINVAL;
 		}
 	}
@@ -3463,25 +3462,25 @@ static struct snd_soc_tplg_ops sof_tplg_ops = {
 	.bytes_ext_ops_count	= ARRAY_SIZE(sof_bytes_ext_ops),
 };
 
-int snd_sof_load_topology(struct snd_sof_dev *sdev, const char *file)
+int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 {
 	const struct firmware *fw;
 	int ret;
 
-	dev_dbg(sdev->dev, "loading topology:%s\n", file);
+	dev_dbg(scomp->dev, "loading topology:%s\n", file);
 
-	ret = request_firmware(&fw, file, sdev->dev);
+	ret = request_firmware(&fw, file, scomp->dev);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: tplg request firmware %s failed err: %d\n",
+		dev_err(scomp->dev, "error: tplg request firmware %s failed err: %d\n",
 			file, ret);
 		return ret;
 	}
 
-	ret = snd_soc_tplg_component_load(sdev->component,
+	ret = snd_soc_tplg_component_load(scomp,
 					  &sof_tplg_ops, fw,
 					  SND_SOC_TPLG_INDEX_ALL);
 	if (ret < 0) {
-		dev_err(sdev->dev, "error: tplg component load failed %d\n",
+		dev_err(scomp->dev, "error: tplg component load failed %d\n",
 			ret);
 		ret = -EINVAL;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
