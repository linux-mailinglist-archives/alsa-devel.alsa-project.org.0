Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E509670206
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 16:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AE40180A;
	Mon, 22 Jul 2019 16:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AE40180A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563804961;
	bh=mV/3EOlPmAzlRSMbnJorzXxjFXKvscV/1/R07Ac2Ly4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VxfNAcNvgDNKvnG+eHgYYZ8BrsO/oDNVO46dGT4JafjkSCOTTqLURwRi25ur1oTK3
	 2LKS0nDGJJnQOijSSw0fraXQlLLsG/CqHUd7H4w6HzWu7JcC7EYgZHL50DFxY1KXr3
	 1IiinpoPbPZcj4vaf/I5V8by0inWtMke4FG0eUzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DC42F803F4;
	Mon, 22 Jul 2019 16:14:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89A88F80482; Mon, 22 Jul 2019 16:14:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D770F803D5
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 16:14:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D770F803D5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 07:14:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,295,1559545200"; d="scan'208";a="192733272"
Received: from agalla-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.103.46])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2019 07:14:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 22 Jul 2019 09:13:43 -0500
Message-Id: <20190722141402.7194-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
References: <20190722141402.7194-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 02/21] ASoC: SOF: reset DMA state in prepare
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

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
