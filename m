Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A64BE4877
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 12:20:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D95E17EA;
	Fri, 25 Oct 2019 12:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D95E17EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571998802;
	bh=/vaniB24IUTQVOQJzGi/3LNn0CnIJs3kPhDfT7qqYPI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jOIr8nq/WmvnwIG+IFWHgiz0tV3uhhp012/vlS9ZY5klAg1lkX9q39TaSY9KU1Z6E
	 mQt1L0iwM6Mog6QXyz3QCoFQKcGZCQIJmPlC1xCWE5l4HibUaay3gs/dxoGidthQK/
	 mosqFwmXUBrCmn9N9TyOhXMQv3lstV+OU6egcm28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A17B0F8068A;
	Fri, 25 Oct 2019 12:12:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CCBBF8060D; Fri, 25 Oct 2019 12:12:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08515F803A6
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 12:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08515F803A6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cl7vOEIt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=2hzQdKTPCGo4lz5y2FJzsabHY9/f7A7Mmu6ykwVLubc=; b=cl7vOEItGG9J
 ZciEqdv1q+NYoCbsls0gE7G7MkjFfc6ASoyqb6YURyAL0c4OQxFpu8kbfURNy7vx00iRntq//8+oo
 CHsy9Kv7PpdIsTFqwJTYUMO16LJDPmQCZxmk9I9GBeTzevFNK2juCDjubpx2cGGWqICPBcTK1vcg+
 rBBTA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iNwZo-0006dq-2s; Fri, 25 Oct 2019 10:12:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7E126274326E; Fri, 25 Oct 2019 11:12:11 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191024210318.30068-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191025101211.7E126274326E@ypsilon.sirena.org.uk>
Date: Fri, 25 Oct 2019 11:12:11 +0100 (BST)
Cc: tiwai@suse.de, Jaska Uimonen <jaska.uimonen@intel.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: define INFO_ flags in dsp_ops" to
	the asoc tree
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

   ASoC: SOF: define INFO_ flags in dsp_ops

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 27e322fabd508ba73ced625fc41f0b7ceee26416 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 24 Oct 2019 16:03:17 -0500
Subject: [PATCH] ASoC: SOF: define INFO_ flags in dsp_ops

Currently the INFO_ flags such as PAUSE/NO_PERIOD_WAKEUP are defined
in the SOF PCM core, which doesn't scale. To account for platform
variations, these flags need to be set in DSP ops.

This patch only moves the definitions and does not change any
functionality.

Reviewed-by: Jaska Uimonen <jaska.uimonen@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191024210318.30068-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/imx/imx8.c  |  7 +++++++
 sound/soc/sof/intel/apl.c |  7 +++++++
 sound/soc/sof/intel/bdw.c |  9 ++++++++-
 sound/soc/sof/intel/byt.c | 21 +++++++++++++++++++++
 sound/soc/sof/intel/cnl.c |  7 +++++++
 sound/soc/sof/pcm.c       |  8 +++-----
 sound/soc/sof/sof-priv.h  |  3 +++
 7 files changed, 56 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 2a22b18e5ec0..cfefcfd92798 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -388,6 +388,13 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 	/* DAI drivers */
 	.drv = imx8_dai,
 	.num_drv = 1, /* we have only 1 ESAI interface on i.MX8 */
+
+	/* ALSA HW info flags */
+	.hw_info =	SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_MMAP_VALID |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP
 };
 EXPORT_SYMBOL(sof_imx8_ops);
 
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 8dc7a5558da4..15d26e8d90a9 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -97,6 +97,13 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 	.runtime_resume		= hda_dsp_runtime_resume,
 	.runtime_idle		= hda_dsp_runtime_idle,
 	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
+
+	/* ALSA HW info flags */
+	.hw_info =	SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_MMAP_VALID |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
 EXPORT_SYMBOL(sof_apl_ops);
 
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index bf961a8798a7..7b4cd1f456bf 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -591,7 +591,14 @@ const struct snd_sof_dsp_ops sof_bdw_ops = {
 
 	/* DAI drivers */
 	.drv = bdw_dai,
-	.num_drv = ARRAY_SIZE(bdw_dai)
+	.num_drv = ARRAY_SIZE(bdw_dai),
+
+	/* ALSA HW info flags */
+	.hw_info =	SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_MMAP_VALID |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
 EXPORT_SYMBOL(sof_bdw_ops);
 
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 07e5efe4945c..62edb959f1fc 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -532,6 +532,13 @@ const struct snd_sof_dsp_ops sof_tng_ops = {
 	/* DAI drivers */
 	.drv = byt_dai,
 	.num_drv = 3, /* we have only 3 SSPs on byt*/
+
+	/* ALSA HW info flags */
+	.hw_info =	SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_MMAP_VALID |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
 EXPORT_SYMBOL(sof_tng_ops);
 
@@ -693,6 +700,13 @@ const struct snd_sof_dsp_ops sof_byt_ops = {
 	/* DAI drivers */
 	.drv = byt_dai,
 	.num_drv = 3, /* we have only 3 SSPs on byt*/
+
+	/* ALSA HW info flags */
+	.hw_info =	SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_MMAP_VALID |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
 EXPORT_SYMBOL(sof_byt_ops);
 
@@ -753,6 +767,13 @@ const struct snd_sof_dsp_ops sof_cht_ops = {
 	.drv = byt_dai,
 	/* all 6 SSPs may be available for cherrytrail */
 	.num_drv = ARRAY_SIZE(byt_dai),
+
+	/* ALSA HW info flags */
+	.hw_info =	SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_MMAP_VALID |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
 EXPORT_SYMBOL(sof_cht_ops);
 
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 5b97bdfba823..e9cdcc040fb5 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -255,6 +255,13 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 	.runtime_resume		= hda_dsp_runtime_resume,
 	.runtime_idle		= hda_dsp_runtime_idle,
 	.set_hw_params_upon_resume = hda_dsp_set_hw_params_upon_resume,
+
+	/* ALSA HW info flags */
+	.hw_info =	SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_MMAP_VALID |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
 EXPORT_SYMBOL(sof_cnl_ops);
 
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index d72798d2b302..9ba505cf5966 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -440,6 +440,7 @@ static int sof_pcm_open(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	const struct snd_sof_dsp_ops *ops = sof_ops(sdev);
 	struct snd_sof_pcm *spcm;
 	struct snd_soc_tplg_stream_caps *caps;
 	int ret;
@@ -469,11 +470,8 @@ static int sof_pcm_open(struct snd_soc_component *component,
 				   le32_to_cpu(caps->period_size_min));
 
 	/* set runtime config */
-	runtime->hw.info = SNDRV_PCM_INFO_MMAP |
-			  SNDRV_PCM_INFO_MMAP_VALID |
-			  SNDRV_PCM_INFO_INTERLEAVED |
-			  SNDRV_PCM_INFO_PAUSE |
-			  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP;
+	runtime->hw.info = ops->hw_info; /* platform-specific */
+
 	runtime->hw.formats = le64_to_cpu(caps->formats);
 	runtime->hw.period_bytes_min = le32_to_cpu(caps->period_size_min);
 	runtime->hw.period_bytes_max = le32_to_cpu(caps->period_size_max);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 5a11a8517fa5..2d40de5ee285 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -211,6 +211,9 @@ struct snd_sof_dsp_ops {
 	/* DAI ops */
 	struct snd_soc_dai_driver *drv;
 	int num_drv;
+
+	/* ALSA HW info flags, will be stored in snd_pcm_runtime.hw.info */
+	u32 hw_info;
 };
 
 /* DSP architecture specific callbacks for oops and stack dumps */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
