Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FEEE743E
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 15:59:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A4E91F4B;
	Mon, 28 Oct 2019 15:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A4E91F4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572274747;
	bh=+53TUecHM6IqzKqlOv4aHC50nqtKBqkOsW70gfThArY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZWTpA7mXWRO5NQ8+afNhsDf2No59NIafVdN0nKKlWgNM2sgIRId12/AsHXstPjvaS
	 BzTr+8Ye8bnbxLHldNGJINoXAkfAcmXIrKJj/RBqQ3Mg0lwPEEQhxsSdIkMHy1Zixf
	 g7xuBmYp1ydYmMmot+G9B4dpSdhIUKWYASQaO6qU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4902FF80659;
	Mon, 28 Oct 2019 15:56:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A1DDF8063A; Mon, 28 Oct 2019 15:56:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14D64F800E7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14D64F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jRRYFEI5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=cbli8FGvv7b73siBqAnn6gk9V7m+7/k1fqy0V+xJkCY=; b=jRRYFEI5fwvl
 OATu6MtKpZ9oCZCWSvYJcMRFJTEclbGPBREM721UGJk1jB/W3RAqMyVzsWRQCKyav7MARqt01L7NM
 hOODX3UCKlf/UQC7UClO9Yj0aqt5YdvxPnftYhg8KrFuzjKM43zVPjMfsywo6pXSzhFAYNa8tmPjO
 fvN3I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Ra-0008Os-Fr; Mon, 28 Oct 2019 14:56:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 11F8427403FD; Mon, 28 Oct 2019 14:56:29 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-23-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145629.11F8427403FD@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:29 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: ignore suspend/resume for D0ix
	compatible streams" to the asoc tree
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

   ASoC: SOF: ignore suspend/resume for D0ix compatible streams

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

From ac8c046f19f94ec419c60d7a073af75a71386e97 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:18 -0500
Subject: [PATCH] ASoC: SOF: ignore suspend/resume for D0ix compatible streams

During system suspend, the PM framework will freeze all applications and
the ALSA/ASoC core will suspend all RUNNING PCM streams.

However, D0ix-compatible PCM streams should keep the related pipelines
active in the DSP when the system is entering S0ix. The TRIGGER_SUSPEND
event is trapped in such cases to prevent the pipelines from being
stopped. Likewise, the TRIGGER_RESUME/START events should not affect the
pipeline state.

The SOF driver also triggers some DSP Firmware pipelines based on the
DAPM widgets power events. In such cases, we also ignore PRE_PMU and
POST_PMD events to keep the pipelines active.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-23-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c      | 31 +++++++++++++++++++++++++++++++
 sound/soc/sof/topology.c | 17 ++++++++++++++++-
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 9ba505cf5966..3d5cd1b445ba 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -346,6 +346,16 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_RELEASE;
 		break;
 	case SNDRV_PCM_TRIGGER_RESUME:
+		if (spcm->stream[substream->stream].suspend_ignored) {
+			/*
+			 * this case will be triggered when INFO_RESUME is
+			 * supported, no need to resume streams that remained
+			 * enabled in D0ix.
+			 */
+			spcm->stream[substream->stream].suspend_ignored = false;
+			return 0;
+		}
+
 		/* set up hw_params */
 		ret = sof_pcm_prepare(component, substream);
 		if (ret < 0) {
@@ -356,9 +366,30 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 
 		/* fallthrough */
 	case SNDRV_PCM_TRIGGER_START:
+		if (spcm->stream[substream->stream].suspend_ignored) {
+			/*
+			 * This case will be triggered when INFO_RESUME is
+			 * not supported, no need to re-start streams that
+			 * remained enabled in D0ix.
+			 */
+			spcm->stream[substream->stream].suspend_ignored = false;
+			return 0;
+		}
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_START;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (sdev->s0_suspend &&
+		    spcm->stream[substream->stream].d0i3_compatible) {
+			/*
+			 * trap the event, not sending trigger stop to
+			 * prevent the FW pipelines from being stopped,
+			 * and mark the flag to ignore the upcoming DAPM
+			 * PM events.
+			 */
+			spcm->stream[substream->stream].suspend_ignored = true;
+			return 0;
+		}
+		/* fallthrough */
 	case SNDRV_PCM_TRIGGER_STOP:
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_STOP;
 		ipc_first = true;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index cc138ac6a8eb..e0e2ae734632 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -135,7 +135,9 @@ static int sof_keyword_dapm_event(struct snd_soc_dapm_widget *w,
 				  struct snd_kcontrol *k, int event)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
+	int stream = SNDRV_PCM_STREAM_CAPTURE;
 	struct snd_sof_dev *sdev;
+	struct snd_sof_pcm *spcm;
 	int ret = 0;
 
 	if (!swidget)
@@ -146,11 +148,19 @@ static int sof_keyword_dapm_event(struct snd_soc_dapm_widget *w,
 	dev_dbg(sdev->dev, "received event %d for widget %s\n",
 		event, w->name);
 
+	/* get runtime PCM params using widget's stream name */
+	spcm = snd_sof_find_spcm_name(sdev, swidget->widget->sname);
+
 	/* process events */
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
+		if (spcm->stream[stream].suspend_ignored) {
+			dev_dbg(sdev->dev, "PRE_PMU event ignored, KWD pipeline is already RUNNING\n");
+			return 0;
+		}
+
 		/* set pcm params */
-		ret = ipc_pcm_params(swidget, SOF_IPC_STREAM_CAPTURE);
+		ret = ipc_pcm_params(swidget, stream);
 		if (ret < 0) {
 			dev_err(sdev->dev,
 				"error: failed to set pcm params for widget %s\n",
@@ -166,6 +176,11 @@ static int sof_keyword_dapm_event(struct snd_soc_dapm_widget *w,
 				swidget->widget->name);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
+		if (spcm->stream[stream].suspend_ignored) {
+			dev_dbg(sdev->dev, "POST_PMD even ignored, KWD pipeline will remain RUNNING\n");
+			return 0;
+		}
+
 		/* stop trigger */
 		ret = ipc_trigger(swidget, SOF_IPC_STREAM_TRIG_STOP);
 		if (ret < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
