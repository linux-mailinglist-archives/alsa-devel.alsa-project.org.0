Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A08EB434
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:07:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB6F81659;
	Sat, 27 Apr 2019 20:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB6F81659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388470;
	bh=CsSex4tzq54Lb4QldsnsCzTyc/n5jy4tKQoMJQAGkwg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EXfOg0iHUzkoWs9LD+lNju07bvxVCbERSze4pO29Z67xQUYNrdumEge+6jnfc8MIe
	 cweB4aRrgK7lK3DsqYB8epjNF/ejV95Xs5fTmKjsN4dBY/VLhHr4j5YgyMMsnfwLoi
	 QmwyXCV43EMdoUyZXR7P/Fuowpri9DErW0EuFp2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4BACF89724;
	Sat, 27 Apr 2019 19:54:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3247CF8975E; Sat, 27 Apr 2019 19:53:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC8ADF8972F;
 Sat, 27 Apr 2019 19:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC8ADF8972F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Rzbs/Mtu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=q2ATBDcXXt8XIVKDDbioWzOAIS0MECuowDlCipEG32k=; b=Rzbs/MtuwOGO
 w1FtNfcExR3bSyl5peeal5DKX0n/2+zw7PWRwhICu7foWFj6f/6QLAbGtrxSiFp+TgYFcWejuuREW
 yDH/0MsMiDykO3/jA3TIQHtRJj91Zv7MyJkMNisigIcwX6caBgJ7+COf7SAMCDaxiq7HYvXCqdW59
 WhjdM=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVV-0004qV-9c; Sat, 27 Apr 2019 17:53:01 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 0F411441D57; Sat, 27 Apr 2019 18:52:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160519.30207-12-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175258.0F411441D57@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:58 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 andriy.shevchenko@linux.intel.com, Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add PM support" to the asoc tree
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

   ASoC: SOF: Add PM support

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

From 8920153c6461da69e49014a35275dc80cbf6ba14 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:05:16 -0500
Subject: [PATCH] ASoC: SOF: Add PM support

Add support for saving and restoring DSP context in D3 to host DDR.

The suspend callback includes: suspend all pcm's stream that are running,
send CTX_SAVE ipc, drop all ipc's, release trace dma and then
power off the DSP.

And the resume callback performs the following steps: load FW, run FW,
re-initialize trace, restore pipeline, restore the kcontrol values
and finally send the ctx restore ipc to the dsp.

The streams that are suspended are resumed by the ALSA resume trigger.
If the streams are paused during system suspend, they are marked
explicitly so they can be restored during PAUSE_RELEASE.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pm.c | 385 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 385 insertions(+)
 create mode 100644 sound/soc/sof/pm.c

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
new file mode 100644
index 000000000000..fc599e1b6f65
--- /dev/null
+++ b/sound/soc/sof/pm.c
@@ -0,0 +1,385 @@
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
+#include "ops.h"
+#include "sof-priv.h"
+
+static int sof_restore_kcontrols(struct snd_sof_dev *sdev)
+{
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
+			ret = snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
+							    ipc_cmd, ctrl_type,
+							    scontrol->cmd,
+							    true);
+			break;
+		case SOF_CTRL_CMD_BINARY:
+			ipc_cmd = SOF_IPC_COMP_SET_DATA;
+			ctrl_type = SOF_CTRL_TYPE_DATA_SET;
+			ret = snd_sof_ipc_set_get_comp_data(sdev->ipc, scontrol,
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
+			dev_err(sdev->dev,
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
+static int sof_restore_pipelines(struct snd_sof_dev *sdev)
+{
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
+			ret = sof_load_pipeline_ipc(sdev, pipeline, &r);
+			break;
+		default:
+			hdr = swidget->private;
+			ret = sof_ipc_tx_message(sdev->ipc, hdr->cmd,
+						 swidget->private, hdr->size,
+						 &r, sizeof(r));
+			break;
+		}
+		if (ret < 0) {
+			dev_err(sdev->dev,
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
+			dev_err(sdev->dev,
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
+			dev_err(sdev->dev, "error: no config for DAI %s\n",
+				dai->name);
+			continue;
+		}
+
+		ret = sof_ipc_tx_message(sdev->ipc,
+					 config->hdr.cmd, config,
+					 config->hdr.size,
+					 &reply, sizeof(reply));
+
+		if (ret < 0) {
+			dev_err(sdev->dev,
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
+				snd_sof_complete_pipeline(sdev, swidget);
+			break;
+		default:
+			break;
+		}
+	}
+
+	/* restore pipeline kcontrols */
+	ret = sof_restore_kcontrols(sdev);
+	if (ret < 0)
+		dev_err(sdev->dev,
+			"error: restoring kcontrols after resume\n");
+
+	return ret;
+}
+
+static int sof_send_pm_ipc(struct snd_sof_dev *sdev, int cmd)
+{
+	struct sof_ipc_pm_ctx pm_ctx;
+	struct sof_ipc_reply reply;
+
+	memset(&pm_ctx, 0, sizeof(pm_ctx));
+
+	/* configure ctx save ipc message */
+	pm_ctx.hdr.size = sizeof(pm_ctx);
+	pm_ctx.hdr.cmd = SOF_IPC_GLB_PM_MSG | cmd;
+
+	/* send ctx save ipc to dsp */
+	return sof_ipc_tx_message(sdev->ipc, pm_ctx.hdr.cmd, &pm_ctx,
+				 sizeof(pm_ctx), &reply, sizeof(reply));
+}
+
+static void sof_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
+{
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
+				spcm->hw_params_upon_resume[dir] = 1;
+		}
+	}
+}
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
+static void sof_cache_debugfs(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_dfsentry *dfse;
+
+	list_for_each_entry(dfse, &sdev->dfsentry_list, list) {
+
+		/* nothing to do if debugfs buffer is not IO mem */
+		if (dfse->type == SOF_DFSENTRY_TYPE_BUF)
+			continue;
+
+		/* cache memory that is only accessible in D0 */
+		if (dfse->access_type == SOF_DEBUGFS_ACCESS_D0_ONLY)
+			memcpy_fromio(dfse->cache_buf, dfse->io_mem,
+				      dfse->size);
+	}
+}
+#endif
+
+static int sof_resume(struct device *dev, bool runtime_resume)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	int ret;
+
+	/* do nothing if dsp resume callbacks are not set */
+	if (!sof_ops(sdev)->resume || !sof_ops(sdev)->runtime_resume)
+		return 0;
+
+	/*
+	 * if the runtime_resume flag is set, call the runtime_resume routine
+	 * or else call the system resume routine
+	 */
+	if (runtime_resume)
+		ret = snd_sof_dsp_runtime_resume(sdev);
+	else
+		ret = snd_sof_dsp_resume(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: failed to power up DSP after resume\n");
+		return ret;
+	}
+
+	/* load the firmware */
+	ret = snd_sof_load_firmware(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: failed to load DSP firmware after resume %d\n",
+			ret);
+		return ret;
+	}
+
+	/* boot the firmware */
+	ret = snd_sof_run_firmware(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: failed to boot DSP firmware after resume %d\n",
+			ret);
+		return ret;
+	}
+
+	/* resume DMA trace, only need send ipc */
+	ret = snd_sof_init_trace_ipc(sdev);
+	if (ret < 0) {
+		/* non fatal */
+		dev_warn(sdev->dev,
+			 "warning: failed to init trace after resume %d\n",
+			 ret);
+	}
+
+	/* restore pipelines */
+	ret = sof_restore_pipelines(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: failed to restore pipeline after resume %d\n",
+			ret);
+		return ret;
+	}
+
+	/* notify DSP of system resume */
+	ret = sof_send_pm_ipc(sdev, SOF_IPC_PM_CTX_RESTORE);
+	if (ret < 0)
+		dev_err(sdev->dev,
+			"error: ctx_restore ipc error during resume %d\n",
+			ret);
+
+	return ret;
+}
+
+static int sof_suspend(struct device *dev, bool runtime_suspend)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	int ret;
+
+	/* do nothing if dsp suspend callback is not set */
+	if (!sof_ops(sdev)->suspend)
+		return 0;
+
+	/* release trace */
+	snd_sof_release_trace(sdev);
+
+	/* set restore_stream for all streams during system suspend */
+	if (!runtime_suspend)
+		sof_set_hw_params_upon_resume(sdev);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
+	/* cache debugfs contents during runtime suspend */
+	if (runtime_suspend)
+		sof_cache_debugfs(sdev);
+#endif
+	/* notify DSP of upcoming power down */
+	ret = sof_send_pm_ipc(sdev, SOF_IPC_PM_CTX_SAVE);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: ctx_save ipc error during suspend %d\n",
+			ret);
+		return ret;
+	}
+
+	/* power down all DSP cores */
+	if (runtime_suspend)
+		ret = snd_sof_dsp_runtime_suspend(sdev, 0);
+	else
+		ret = snd_sof_dsp_suspend(sdev, 0);
+	if (ret < 0)
+		dev_err(sdev->dev,
+			"error: failed to power down DSP during suspend %d\n",
+			ret);
+
+	return ret;
+}
+
+int snd_sof_runtime_suspend(struct device *dev)
+{
+	return sof_suspend(dev, true);
+}
+EXPORT_SYMBOL(snd_sof_runtime_suspend);
+
+int snd_sof_runtime_resume(struct device *dev)
+{
+	return sof_resume(dev, true);
+}
+EXPORT_SYMBOL(snd_sof_runtime_resume);
+
+int snd_sof_resume(struct device *dev)
+{
+	return sof_resume(dev, false);
+}
+EXPORT_SYMBOL(snd_sof_resume);
+
+int snd_sof_suspend(struct device *dev)
+{
+	return sof_suspend(dev, false);
+}
+EXPORT_SYMBOL(snd_sof_suspend);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
