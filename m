Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 243ABC3F5B
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 20:06:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3FBD1697;
	Tue,  1 Oct 2019 20:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3FBD1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569953186;
	bh=4HzH6bD1D0dDCHpM/UWcwktJyY7HFZc2+IuHrIq6of0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AATY3ZOEAVYQWk2PGwxnIRcyTPci4jvzET5itDpOJwylPzkmgRAv6crW4cvjpE9bW
	 GHAWDXnT89vsVi5VeP6YHXJ1ozL6rbKlJg+QQPOwRhau+XW2uHTXJ0cvJcvFIdG4oC
	 QKUasBvsXnmk/cJ6OIDmgQPubih6E/ZWNEVQrW5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 412A1F80726;
	Tue,  1 Oct 2019 19:57:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A272F8067A; Tue,  1 Oct 2019 19:57:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06901F8063A
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 19:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06901F8063A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TVQ3I3T/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=BXpY8LkvBELJJsn3zZ+R6i87/EGtGz+bVwF6i1tRvgk=; b=TVQ3I3T/xiqE
 PhDOsakalFltvTigZVuH46obY78kVlyrLYhWktDPAJQLNi+MPRmZF7JpKKiitM13T9xJDNHQX5qqK
 G9LvxLPYD49wJdWJVFeNCPTeCsHmdaki8Jt9TkyCN6Pp/YigQ7feRMhm8BBViRblh+JAvuuCmtL33
 0KaDs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFMOH-0005tN-Bl; Tue, 01 Oct 2019 17:56:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D1F0C2742A10; Tue,  1 Oct 2019 18:56:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pan Xiuli <xiuli.pan@linux.intel.com>
In-Reply-To: <20190927200538.660-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001175648.D1F0C2742A10@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 18:56:48 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: pcm: harden PCM STOP sequence" to
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

   ASoC: SOF: pcm: harden PCM STOP sequence

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

From 0a1b08345bc5d9214dc701f8ec5d67c473fab735 Mon Sep 17 00:00:00 2001
From: Pan Xiuli <xiuli.pan@linux.intel.com>
Date: Fri, 27 Sep 2019 15:05:31 -0500
Subject: [PATCH] ASoC: SOF: pcm: harden PCM STOP sequence

The old STOP sequence is: 1. stop DMA 2. send STOP ipc
If delay happen before the steps 1 and 2, the DMA buffer will be empty in
short time and cause pipeline xrun then stop the pipeline.
Then the step 2 ipc stop will return error as pipeline is already stopped.

Suggested change to avoid the issue is to switch the order of steps 1 and 2
for the stop sequence.

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190927200538.660-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index fa7769dd825c..2b876d497447 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -323,6 +323,7 @@ static int sof_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct sof_ipc_stream stream;
 	struct sof_ipc_reply reply;
 	bool reset_hw_params = false;
+	bool ipc_first = false;
 	int ret;
 
 	/* nothing to do for BE */
@@ -343,6 +344,7 @@ static int sof_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_PAUSE;
+		ipc_first = true;
 		break;
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_RELEASE;
@@ -363,6 +365,7 @@ static int sof_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_STOP;
+		ipc_first = true;
 		reset_hw_params = true;
 		break;
 	default:
@@ -370,12 +373,22 @@ static int sof_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 		return -EINVAL;
 	}
 
-	snd_sof_pcm_platform_trigger(sdev, substream, cmd);
+	/*
+	 * DMA and IPC sequence is different for start and stop. Need to send
+	 * STOP IPC before stop DMA
+	 */
+	if (!ipc_first)
+		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
 
 	/* send IPC to the DSP */
 	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
 				 sizeof(stream), &reply, sizeof(reply));
 
+	/* need to STOP DMA even if STOP IPC failed */
+	if (ipc_first)
+		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
+
+	/* free PCM if reset_hw_params is set and the STOP IPC is successful */
 	if (!ret && reset_hw_params)
 		ret = sof_pcm_dsp_pcm_free(substream, sdev, spcm);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
