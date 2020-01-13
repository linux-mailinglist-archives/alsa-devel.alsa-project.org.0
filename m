Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F293A13AB0E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:28:45 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4EFD1F88;
	Mon, 13 Jan 2020 16:21:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4EFD1F88
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E96FF802FB;
	Mon, 13 Jan 2020 16:13:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 999A1F802BD; Mon, 13 Jan 2020 16:13:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D78CF8027D
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 16:13:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D78CF8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bAhuEMFG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=quzXsJn1UDuD0mZsuAs6hJrLvoZKfxTpBmKhlhWE+cw=; b=bAhuEMFGaj6Q
 /kofRum/OgDG9xlr9ePB5//EC7d8031Z3Tk9IXvUmVpFJ0sPc4SQp0JjAYumpCg8Z1oTYfn6jypv2
 cMuJxKHnqFAI+Ug5VRztJ2/dps4h2PwIf7LAnkBYK6VKAtjOZGClBYe6Uj+zpTxl9RrBeOEB0I8GC
 9AaVA=;
Received: from fw-tnat-cam7.arm.com ([217.140.106.55]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ir1P2-0003M5-7R; Mon, 13 Jan 2020 15:13:16 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id EF2A8D01AE4; Mon, 13 Jan 2020 15:13:15 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200110235751.3404-7-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200110235751.3404-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Date: Mon, 13 Jan 2020 15:13:15 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: fix PCM playback through ALSA OSS
	emulation" to the asoc tree
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

   ASoC: SOF: fix PCM playback through ALSA OSS emulation

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

From cfe8191b1bbf2b41581b63eb97e56cd6bc3c34a1 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Fri, 10 Jan 2020 17:57:49 -0600
Subject: [PATCH] ASoC: SOF: fix PCM playback through ALSA OSS emulation

Any app using ALSA OSS emulation on top of SOF will fail
to error from OSS SNDCTL_DSP_SETFMT ioctl. Reported initially
as an issue with xournalpp (application using PortAudio with
an OSS backend), but applies more generally to other apps
using OSS as well.

Problem is caused by SOF PCM not supporting repeated calls
to hw_params(), without matching calls to pcm_free(). This
is however exactly what the ALSA OSS PCM code is doing when
it is handling the OSS ioctls.

The problem will lead to leaking of DSP resources and eventual
failure of DSP PCM_PARAMS IPC.

BugLink: https://github.com/thesofproject/linux/issues/1510
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200110235751.3404-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c | 53 ++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 9bb6388742e1..314f3095c12f 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -92,7 +92,27 @@ void snd_sof_pcm_period_elapsed(struct snd_pcm_substream *substream)
 }
 EXPORT_SYMBOL(snd_sof_pcm_period_elapsed);
 
-/* this may get called several times by oss emulation */
+static int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream,
+				struct snd_sof_dev *sdev,
+				struct snd_sof_pcm *spcm)
+{
+	struct sof_ipc_stream stream;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	stream.hdr.size = sizeof(stream);
+	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
+	stream.comp_id = spcm->stream[substream->stream].comp_id;
+
+	/* send IPC to the DSP */
+	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
+				 sizeof(stream), &reply, sizeof(reply));
+	if (!ret)
+		spcm->prepared[substream->stream] = false;
+
+	return ret;
+}
+
 static int sof_pcm_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
@@ -113,6 +133,16 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	if (!spcm)
 		return -EINVAL;
 
+	/*
+	 * Handle repeated calls to hw_params() without free_pcm() in
+	 * between. At least ALSA OSS emulation depends on this.
+	 */
+	if (spcm->prepared[substream->stream]) {
+		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
+		if (ret < 0)
+			return ret;
+	}
+
 	dev_dbg(component->dev, "pcm: hw params stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
@@ -201,27 +231,6 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	return ret;
 }
 
-static int sof_pcm_dsp_pcm_free(struct snd_pcm_substream *substream,
-				struct snd_sof_dev *sdev,
-				struct snd_sof_pcm *spcm)
-{
-	struct sof_ipc_stream stream;
-	struct sof_ipc_reply reply;
-	int ret;
-
-	stream.hdr.size = sizeof(stream);
-	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
-	stream.comp_id = spcm->stream[substream->stream].comp_id;
-
-	/* send IPC to the DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
-				 sizeof(stream), &reply, sizeof(reply));
-	if (!ret)
-		spcm->prepared[substream->stream] = false;
-
-	return ret;
-}
-
 static int sof_pcm_hw_free(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
