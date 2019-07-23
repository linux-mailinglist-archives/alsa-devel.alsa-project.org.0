Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCA57174E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:43:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B5E188E;
	Tue, 23 Jul 2019 13:42:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B5E188E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563882179;
	bh=kLiziGeF++seY5Nf7DqI/7TOUSJ+KLa5MSZwR6P2mJw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sHWWtL98cu+ZWzoxmfw8ExQ6kLoF/1GxeDDGL/BG1KRJLi6bxNEzHT8GmI7+CWVAu
	 r8XNsKrfT/Bckv1XXoaewOCTtutuUd5fN9KE15ZO8YCO+qw5VQfgQCb2iWvmMNc8mO
	 YWJ+Kew+hDXu1zB/QEg2rr9PMFuozw3RCbito8kE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD53DF80674;
	Tue, 23 Jul 2019 13:30:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B8D5F804A9; Tue, 23 Jul 2019 13:29:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AAB1F804AA
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AAB1F804AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KloXEN7u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=JtmT2nU/dUA+J4hItzcsBqGAz03KH637NkoiREcJzgY=; b=KloXEN7uRx+V
 W17319AxNLb6bG1MWb8xRRwq1HezaFDe2vQVKyrqIVisTvuyVaZFzviAunKYFkPUSPBdT8J6N/ody
 h8/84obOKa8Bnn8OxKRICzY4imA7YoFP8tOH/k68Q6pEk5qZPtwrBoAr6gS9gWklIRm+4oi4obp05
 K/fso=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsyp-0003KI-Lt; Tue, 23 Jul 2019 11:29:15 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 07AFC2742B59; Tue, 23 Jul 2019 12:29:15 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20190722141402.7194-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112915.07AFC2742B59@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:15 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: reset DMA state in prepare" to the
	asoc tree
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

   ASoC: SOF: reset DMA state in prepare

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 04c8027764bc82a325d3abc6f39a6a4642a937cb Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Mon, 22 Jul 2019 09:13:43 -0500
Subject: [PATCH] ASoC: SOF: reset DMA state in prepare

When application goes through SUSPEND/STOP->PREPARE->START
cycle, we should always reprogram the SOF device to start
DMA from a known state so that hw_ptr/appl_ptrs remain valid.
This is expected by ALSA core as it resets the buffer
state as part of prepare (see snd_pcm_do_prepare()).

Fix the issue by forcing reconfiguration of the FW with
STREAM_PCM_PARAMS in prepare(). Use combined logic to handle
prepare and the existing flow to reprogram hw-params after
system suspend.

Without the fix, first call to pcm pointer() will return
an invalid hw_ptr and application may immediately observe XRUN
status, unless "start_threshold" SW parameter is set to maximum
value by the application.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190722141402.7194-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c      | 27 +++++++++++++++------------
 sound/soc/sof/pm.c       |  2 +-
 sound/soc/sof/sof-priv.h |  2 +-
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 334e9d59b1ba..3b8955e755b2 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -208,12 +208,11 @@ static int sof_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
+	spcm->prepared[substream->stream] = true;
+
 	/* save pcm hw_params */
 	memcpy(&spcm->params[substream->stream], params, sizeof(*params));
 
-	/* clear hw_params_upon_resume flag */
-	spcm->hw_params_upon_resume[substream->stream] = 0;
-
 	return ret;
 }
 
@@ -236,6 +235,9 @@ static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 	if (!spcm)
 		return -EINVAL;
 
+	if (!spcm->prepared[substream->stream])
+		return 0;
+
 	dev_dbg(sdev->dev, "pcm: free stream %d dir %d\n", spcm->pcm.pcm_id,
 		substream->stream);
 
@@ -258,6 +260,8 @@ static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		dev_err(sdev->dev, "error: platform hw free failed\n");
 
+	spcm->prepared[substream->stream] = false;
+
 	return ret;
 }
 
@@ -278,11 +282,7 @@ static int sof_pcm_prepare(struct snd_pcm_substream *substream)
 	if (!spcm)
 		return -EINVAL;
 
-	/*
-	 * check if hw_params needs to be set-up again.
-	 * This is only needed when resuming from system sleep.
-	 */
-	if (!spcm->hw_params_upon_resume[substream->stream])
+	if (spcm->prepared[substream->stream])
 		return 0;
 
 	dev_dbg(sdev->dev, "pcm: prepare stream %d dir %d\n", spcm->pcm.pcm_id,
@@ -311,6 +311,7 @@ static int sof_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct snd_sof_pcm *spcm;
 	struct sof_ipc_stream stream;
 	struct sof_ipc_reply reply;
+	bool reset_hw_params = false;
 	int ret;
 
 	/* nothing to do for BE */
@@ -351,6 +352,7 @@ static int sof_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_STOP;
+		reset_hw_params = true;
 		break;
 	default:
 		dev_err(sdev->dev, "error: unhandled trigger cmd %d\n", cmd);
@@ -363,17 +365,17 @@ static int sof_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
 				 sizeof(stream), &reply, sizeof(reply));
 
-	if (ret < 0 || cmd != SNDRV_PCM_TRIGGER_SUSPEND)
+	if (ret < 0 || !reset_hw_params)
 		return ret;
 
 	/*
-	 * The hw_free op is usually called when the pcm stream is closed.
-	 * Since the stream is not closed during suspend, the DSP needs to be
-	 * notified explicitly to free pcm to prevent errors upon resume.
+	 * In case of stream is stopped, DSP must be reprogrammed upon
+	 * restart, so free PCM here.
 	 */
 	stream.hdr.size = sizeof(stream);
 	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
 	stream.comp_id = spcm->stream[substream->stream].comp_id;
+	spcm->prepared[substream->stream] = false;
 
 	/* send IPC to the DSP */
 	return sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
@@ -481,6 +483,7 @@ static int sof_pcm_open(struct snd_pcm_substream *substream)
 	spcm->stream[substream->stream].posn.host_posn = 0;
 	spcm->stream[substream->stream].posn.dai_posn = 0;
 	spcm->stream[substream->stream].substream = substream;
+	spcm->prepared[substream->stream] = false;
 
 	ret = snd_sof_pcm_platform_open(sdev, substream);
 	if (ret < 0)
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 278abfd10490..48c6d78d72e2 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -233,7 +233,7 @@ static int sof_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 
 			state = substream->runtime->status->state;
 			if (state == SNDRV_PCM_STATE_SUSPENDED)
-				spcm->hw_params_upon_resume[dir] = 1;
+				spcm->prepared[dir] = false;
 		}
 	}
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index b8c0b2a22684..fa5cb7d2a660 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -297,7 +297,7 @@ struct snd_sof_pcm {
 	struct snd_sof_pcm_stream stream[2];
 	struct list_head list;	/* list in sdev pcm list */
 	struct snd_pcm_hw_params params[2];
-	int hw_params_upon_resume[2]; /* set up hw_params upon resume */
+	bool prepared[2]; /* PCM_PARAMS set successfully */
 };
 
 /* ALSA SOF Kcontrol device */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
