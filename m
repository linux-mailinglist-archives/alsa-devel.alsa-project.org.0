Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0B271748
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:41:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2D0518B3;
	Tue, 23 Jul 2019 13:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2D0518B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563882104;
	bh=S9OBV66RwkocHoktKUFycQRocJLYriC9ztFSzFXR5U8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cq4Kb+cQFI+Xop2jm9pwEBzSfrZUNdyB6cRZTtaBgoZMzY2ZGOW0yghkL2JKF9Ccd
	 xksVb2f2Al+ijZF/6Y4NgV1kmqxPgGk0VZFsq8r8JXy36gQbiBGblaUOXYIcR498MU
	 3WO7Gj1hi9i/KQaoMRzaZH691mkkDps42OIab8T0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1E52F80649;
	Tue, 23 Jul 2019 13:30:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D64A5F8044A; Tue, 23 Jul 2019 13:29:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBFEFF804AB
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBFEFF804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TxBw37zI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jxlI1zOngfzK8uag5wthaLyC1wcXFeXNKR4pdRe5468=; b=TxBw37zIX6SV
 PyRqn5sQKyjNMR12pXN8hFJe+dQ8XWu47YO7EMLGhUcxD3kBl4kw94sO9Str6oQGa9j6O5TlLAFZf
 BYF8Juu9GQ/7CK6N7RYv7gi0tcPuKnVP9C/nuVPKXxYGmNrmuYmALww4Vkb+81uXh8OC7CDTwvZA4
 ohtdA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsyp-0003K8-El; Tue, 23 Jul 2019 11:29:15 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id CAA912742BAB; Tue, 23 Jul 2019 12:29:14 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20190722141402.7194-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112914.CAA912742BAB@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:14 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: use common code to send PCM_FREE
	IPC" to the asoc tree
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

   ASoC: SOF: use common code to send PCM_FREE IPC

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

From a49b687192752bd373f33551520cc98389460ad0 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Mon, 22 Jul 2019 09:13:44 -0500
Subject: [PATCH] ASoC: SOF: use common code to send PCM_FREE IPC

Remove duplicated code by using a common helper function
to send the PCM_FREE IPC message to FW.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190722141402.7194-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c | 50 ++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 3b8955e755b2..8612896673a5 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -216,6 +216,27 @@ static int sof_pcm_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
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
 static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -223,8 +244,6 @@ static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 		snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_sof_pcm *spcm;
-	struct sof_ipc_stream stream;
-	struct sof_ipc_reply reply;
 	int ret;
 
 	/* nothing to do for BE */
@@ -241,13 +260,7 @@ static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 	dev_dbg(sdev->dev, "pcm: free stream %d dir %d\n", spcm->pcm.pcm_id,
 		substream->stream);
 
-	stream.hdr.size = sizeof(stream);
-	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
-	stream.comp_id = spcm->stream[substream->stream].comp_id;
-
-	/* send IPC to the DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
-				 sizeof(stream), &reply, sizeof(reply));
+	ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
 
 	snd_pcm_lib_free_pages(substream);
 
@@ -260,8 +273,6 @@ static int sof_pcm_hw_free(struct snd_pcm_substream *substream)
 	if (ret < 0)
 		dev_err(sdev->dev, "error: platform hw free failed\n");
 
-	spcm->prepared[substream->stream] = false;
-
 	return ret;
 }
 
@@ -365,21 +376,10 @@ static int sof_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
 				 sizeof(stream), &reply, sizeof(reply));
 
-	if (ret < 0 || !reset_hw_params)
-		return ret;
-
-	/*
-	 * In case of stream is stopped, DSP must be reprogrammed upon
-	 * restart, so free PCM here.
-	 */
-	stream.hdr.size = sizeof(stream);
-	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_FREE;
-	stream.comp_id = spcm->stream[substream->stream].comp_id;
-	spcm->prepared[substream->stream] = false;
+	if (!ret && reset_hw_params)
+		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
 
-	/* send IPC to the DSP */
-	return sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
-				  sizeof(stream), &reply, sizeof(reply));
+	return ret;
 }
 
 static snd_pcm_uframes_t sof_pcm_pointer(struct snd_pcm_substream *substream)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
