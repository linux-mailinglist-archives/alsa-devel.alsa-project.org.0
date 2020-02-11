Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EF0159D7D
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 00:40:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CDA0165D;
	Wed, 12 Feb 2020 00:39:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CDA0165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581464431;
	bh=C0+l+QzTFNQz7bhSbTgcg+FS2ckCGFoRZRJv2qV0gos=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LLkr+c+FfTRWzRxPwUGPEglxCjY+iNfsCRCXCR7YuTIDJAZ3IwHO+J8u4iHNq2ZMe
	 j8bXPwZUfpY9s8LmKyRvDlt6rIhAdKHSF5R8Swzng22098WtbRO8XFxNYkC9GXwzH4
	 d3t+EQU1G58lmBc+JJbuHFrRyWMj9GHsVfuSZlxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5572DF80146;
	Wed, 12 Feb 2020 00:38:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 682BFF80145; Wed, 12 Feb 2020 00:38:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14443F800E7
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 00:38:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14443F800E7
Received: from 79.184.254.199.ipv4.supernova.orange.pl (79.184.254.199) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.341)
 id 520e3db86b693f71; Wed, 12 Feb 2020 00:38:42 +0100
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Linux PM <linux-pm@vger.kernel.org>
Date: Wed, 12 Feb 2020 00:34:15 +0100
Message-ID: <197693303.hiACyxC3Vm@kreacher>
In-Reply-To: <1654227.8mz0SueHsU@kreacher>
References: <1654227.8mz0SueHsU@kreacher>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Amit Kucheria <amit.kucheria@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH 24/28] sound: Call cpu_latency_qos_*() instead
	of pm_qos_*()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

Call cpu_latency_qos_add/update/remove_request() and
cpu_latency_qos_request_active() instead of
pm_qos_add/update/remove_request() and pm_qos_request_active(),
respectively, because the latter are going to be dropped.

No intentional functional impact.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 sound/core/pcm_native.c               | 14 +++++++-------
 sound/soc/intel/atom/sst/sst.c        |  5 ++---
 sound/soc/intel/atom/sst/sst_loader.c |  4 ++--
 sound/soc/ti/omap-dmic.c              |  7 ++++---
 sound/soc/ti/omap-mcbsp.c             | 16 ++++++++--------
 sound/soc/ti/omap-mcpdm.c             | 16 ++++++++--------
 6 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 336406bcb59e..151bac1bbd0b 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -748,11 +748,11 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 	snd_pcm_timer_resolution_change(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
 
-	if (pm_qos_request_active(&substream->latency_pm_qos_req))
-		pm_qos_remove_request(&substream->latency_pm_qos_req);
+	if (cpu_latency_qos_request_active(&substream->latency_pm_qos_req))
+		cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
 	if ((usecs = period_to_usecs(runtime)) >= 0)
-		pm_qos_add_request(&substream->latency_pm_qos_req,
-				   PM_QOS_CPU_DMA_LATENCY, usecs);
+		cpu_latency_qos_add_request(&substream->latency_pm_qos_req,
+					    usecs);
 	return 0;
  _error:
 	/* hardware might be unusable from this time,
@@ -821,7 +821,7 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
 		return -EBADFD;
 	result = do_hw_free(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
-	pm_qos_remove_request(&substream->latency_pm_qos_req);
+	cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
 	return result;
 }
 
@@ -2598,8 +2598,8 @@ void snd_pcm_release_substream(struct snd_pcm_substream *substream)
 		substream->ops->close(substream);
 		substream->hw_opened = 0;
 	}
-	if (pm_qos_request_active(&substream->latency_pm_qos_req))
-		pm_qos_remove_request(&substream->latency_pm_qos_req);
+	if (cpu_latency_qos_request_active(&substream->latency_pm_qos_req))
+		cpu_latency_qos_remove_request(&substream->latency_pm_qos_req);
 	if (substream->pcm_release) {
 		substream->pcm_release(substream);
 		substream->pcm_release = NULL;
diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index 68bcec5241f7..d6563985e008 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -325,8 +325,7 @@ int sst_context_init(struct intel_sst_drv *ctx)
 		ret = -ENOMEM;
 		goto do_free_mem;
 	}
-	pm_qos_add_request(ctx->qos, PM_QOS_CPU_DMA_LATENCY,
-				PM_QOS_DEFAULT_VALUE);
+	cpu_latency_qos_add_request(ctx->qos, PM_QOS_DEFAULT_VALUE);
 
 	dev_dbg(ctx->dev, "Requesting FW %s now...\n", ctx->firmware_name);
 	ret = request_firmware_nowait(THIS_MODULE, true, ctx->firmware_name,
@@ -364,7 +363,7 @@ void sst_context_cleanup(struct intel_sst_drv *ctx)
 	sysfs_remove_group(&ctx->dev->kobj, &sst_fw_version_attr_group);
 	flush_scheduled_work();
 	destroy_workqueue(ctx->post_msg_wq);
-	pm_qos_remove_request(ctx->qos);
+	cpu_latency_qos_remove_request(ctx->qos);
 	kfree(ctx->fw_sg_list.src);
 	kfree(ctx->fw_sg_list.dst);
 	ctx->fw_sg_list.list_len = 0;
diff --git a/sound/soc/intel/atom/sst/sst_loader.c b/sound/soc/intel/atom/sst/sst_loader.c
index ce11c36848c4..9b0e3739c738 100644
--- a/sound/soc/intel/atom/sst/sst_loader.c
+++ b/sound/soc/intel/atom/sst/sst_loader.c
@@ -412,7 +412,7 @@ int sst_load_fw(struct intel_sst_drv *sst_drv_ctx)
 		return -ENOMEM;
 
 	/* Prevent C-states beyond C6 */
-	pm_qos_update_request(sst_drv_ctx->qos, 0);
+	cpu_latency_qos_update_request(sst_drv_ctx->qos, 0);
 
 	sst_drv_ctx->sst_state = SST_FW_LOADING;
 
@@ -442,7 +442,7 @@ int sst_load_fw(struct intel_sst_drv *sst_drv_ctx)
 
 restore:
 	/* Re-enable Deeper C-states beyond C6 */
-	pm_qos_update_request(sst_drv_ctx->qos, PM_QOS_DEFAULT_VALUE);
+	cpu_latency_qos_update_request(sst_drv_ctx->qos, PM_QOS_DEFAULT_VALUE);
 	sst_free_block(sst_drv_ctx, block);
 	dev_dbg(sst_drv_ctx->dev, "fw load successful!!!\n");
 
diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
index 3f226be123d4..913579c43e9d 100644
--- a/sound/soc/ti/omap-dmic.c
+++ b/sound/soc/ti/omap-dmic.c
@@ -112,7 +112,7 @@ static void omap_dmic_dai_shutdown(struct snd_pcm_substream *substream,
 
 	mutex_lock(&dmic->mutex);
 
-	pm_qos_remove_request(&dmic->pm_qos_req);
+	cpu_latency_qos_remove_request(&dmic->pm_qos_req);
 
 	if (!dai->active)
 		dmic->active = 0;
@@ -230,8 +230,9 @@ static int omap_dmic_dai_prepare(struct snd_pcm_substream *substream,
 	struct omap_dmic *dmic = snd_soc_dai_get_drvdata(dai);
 	u32 ctrl;
 
-	if (pm_qos_request_active(&dmic->pm_qos_req))
-		pm_qos_update_request(&dmic->pm_qos_req, dmic->latency);
+	if (cpu_latency_qos_request_active(&dmic->pm_qos_req))
+		cpu_latency_qos_update_request(&dmic->pm_qos_req,
+					       dmic->latency);
 
 	/* Configure uplink threshold */
 	omap_dmic_write(dmic, OMAP_DMIC_FIFO_CTRL_REG, dmic->threshold);
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 26b503bbdb5f..302d5c493c29 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -836,10 +836,10 @@ static void omap_mcbsp_dai_shutdown(struct snd_pcm_substream *substream,
 	int stream2 = tx ? SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
 	if (mcbsp->latency[stream2])
-		pm_qos_update_request(&mcbsp->pm_qos_req,
-				      mcbsp->latency[stream2]);
+		cpu_latency_qos_update_request(&mcbsp->pm_qos_req,
+					       mcbsp->latency[stream2]);
 	else if (mcbsp->latency[stream1])
-		pm_qos_remove_request(&mcbsp->pm_qos_req);
+		cpu_latency_qos_remove_request(&mcbsp->pm_qos_req);
 
 	mcbsp->latency[stream1] = 0;
 
@@ -863,10 +863,10 @@ static int omap_mcbsp_dai_prepare(struct snd_pcm_substream *substream,
 	if (!latency || mcbsp->latency[stream1] < latency)
 		latency = mcbsp->latency[stream1];
 
-	if (pm_qos_request_active(pm_qos_req))
-		pm_qos_update_request(pm_qos_req, latency);
+	if (cpu_latency_qos_request_active(pm_qos_req))
+		cpu_latency_qos_update_request(pm_qos_req, latency);
 	else if (latency)
-		pm_qos_add_request(pm_qos_req, PM_QOS_CPU_DMA_LATENCY, latency);
+		cpu_latency_qos_add_request(pm_qos_req, latency);
 
 	return 0;
 }
@@ -1434,8 +1434,8 @@ static int asoc_mcbsp_remove(struct platform_device *pdev)
 	if (mcbsp->pdata->ops && mcbsp->pdata->ops->free)
 		mcbsp->pdata->ops->free(mcbsp->id);
 
-	if (pm_qos_request_active(&mcbsp->pm_qos_req))
-		pm_qos_remove_request(&mcbsp->pm_qos_req);
+	if (cpu_latency_qos_request_active(&mcbsp->pm_qos_req))
+		cpu_latency_qos_remove_request(&mcbsp->pm_qos_req);
 
 	if (mcbsp->pdata->buffer_size)
 		sysfs_remove_group(&mcbsp->dev->kobj, &additional_attr_group);
diff --git a/sound/soc/ti/omap-mcpdm.c b/sound/soc/ti/omap-mcpdm.c
index a726cd7a8252..d7ac4df6f2d9 100644
--- a/sound/soc/ti/omap-mcpdm.c
+++ b/sound/soc/ti/omap-mcpdm.c
@@ -281,10 +281,10 @@ static void omap_mcpdm_dai_shutdown(struct snd_pcm_substream *substream,
 	}
 
 	if (mcpdm->latency[stream2])
-		pm_qos_update_request(&mcpdm->pm_qos_req,
-				      mcpdm->latency[stream2]);
+		cpu_latency_qos_update_request(&mcpdm->pm_qos_req,
+					       mcpdm->latency[stream2]);
 	else if (mcpdm->latency[stream1])
-		pm_qos_remove_request(&mcpdm->pm_qos_req);
+		cpu_latency_qos_remove_request(&mcpdm->pm_qos_req);
 
 	mcpdm->latency[stream1] = 0;
 
@@ -386,10 +386,10 @@ static int omap_mcpdm_prepare(struct snd_pcm_substream *substream,
 	if (!latency || mcpdm->latency[stream1] < latency)
 		latency = mcpdm->latency[stream1];
 
-	if (pm_qos_request_active(pm_qos_req))
-		pm_qos_update_request(pm_qos_req, latency);
+	if (cpu_latency_qos_request_active(pm_qos_req))
+		cpu_latency_qos_update_request(pm_qos_req, latency);
 	else if (latency)
-		pm_qos_add_request(pm_qos_req, PM_QOS_CPU_DMA_LATENCY, latency);
+		cpu_latency_qos_add_request(pm_qos_req, latency);
 
 	if (!omap_mcpdm_active(mcpdm)) {
 		omap_mcpdm_start(mcpdm);
@@ -451,8 +451,8 @@ static int omap_mcpdm_remove(struct snd_soc_dai *dai)
 	free_irq(mcpdm->irq, (void *)mcpdm);
 	pm_runtime_disable(mcpdm->dev);
 
-	if (pm_qos_request_active(&mcpdm->pm_qos_req))
-		pm_qos_remove_request(&mcpdm->pm_qos_req);
+	if (cpu_latency_qos_request_active(&mcpdm->pm_qos_req))
+		cpu_latency_qos_remove_request(&mcpdm->pm_qos_req);
 
 	return 0;
 }
-- 
2.16.4





_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
