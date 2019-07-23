Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2833571728
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:32:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACB921867;
	Tue, 23 Jul 2019 13:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACB921867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563881558;
	bh=bvkcEHbruSJyBxlPNzFxSiByqCBHLRe4t5ioLubhIE4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DoDQO1KWH+lcf+JT07J41sXvZBTRc8UBNzhcR/pUt4TuVcuZQp0aRK9Ec6XyQ5TQ3
	 8FkF/DPhTPWBN/Jlh2EwrMdF7IJgV8QREgHhEe6eVdwqSBD54ZkcL1+EDo4Gu1VaVY
	 X37bSWhNYwL9m88DX8bSsFwSU0f3tOu3Br5eGkiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DBC2F8049C;
	Tue, 23 Jul 2019 13:29:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AE5EF804CB; Tue, 23 Jul 2019 13:29:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADE7AF80448
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADE7AF80448
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pE9WSgU/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=AledcQnzeSSiG5CjiwTRpn0PM1LXw5PpBGmsKAHeF/Q=; b=pE9WSgU/jhxq
 FEZLVi6QirWBOVeZ/eETSR2295i1WrN+ab2K4dk7+Rra0QoSQQ4LD6nkPK1bxSeu1jDLTlURWJuQs
 kv9hMIx4MmvVMOtwcF9KP9iuHtpXoMiqwfompPIYM0p4GVbYuA03GXxaHtsZ2zfKru3izshCDJwEb
 iMVvY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsyl-0003Ic-Qv; Tue, 23 Jul 2019 11:29:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 513212742BAC; Tue, 23 Jul 2019 12:29:11 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Rander Wang <rander.wang@linux.intel.com>
In-Reply-To: <20190722141402.7194-19-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112911.513212742BAC@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:11 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: fix link DMA config"
	to the asoc tree
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

   ASoC: SOF: Intel: hda: fix link DMA config

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

From 934bf82203d679a8f2ff22817e341bc059f5f7fc Mon Sep 17 00:00:00 2001
From: Rander Wang <rander.wang@linux.intel.com>
Date: Mon, 22 Jul 2019 09:13:59 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: fix link DMA config

For this bug, there are two capture pcm streams active, with one
stream and its related stream tag released before suspend. Later
when system suspend is done, the stream tag for the remaining
active stream is released by SOF driver. After system resume, hda
codec driver restores the stream tag for the active pcm stream,
but SOF goes to assign a new one, which now doesn't match with the
stream tag used by codec driver, and this causes DMA to fail
receiving data, leading to unrecoverable XRUN condition in FW.

For stream tag is stored in both hda codec and SOF driver, it
shouldn't be released only in SOF driver. This patch just keeps the
stream information in dma data and checks whether there is a stored
DMA data for stream resuming from S3 and restores it. And it also
removes DMA data when the stream is released.

Tested on Whiskey Lake platform.

GitHub issue: https://github.com/thesofproject/sof/issues/1594
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190722141402.7194-19-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dai.c | 15 +++++++++------
 sound/soc/sof/intel/hda-dsp.c | 10 ++++------
 2 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index a448be60f6dd..2b5e2b8c69c2 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -210,9 +210,13 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	int stream_tag;
 	int ret;
 
-	link_dev = hda_link_stream_assign(bus, substream);
-	if (!link_dev)
-		return -EBUSY;
+	/* get stored dma data if resuming from system suspend */
+	link_dev = snd_soc_dai_get_dma_data(dai, substream);
+	if (!link_dev) {
+		link_dev = hda_link_stream_assign(bus, substream);
+		if (!link_dev)
+			return -EBUSY;
+	}
 
 	stream_tag = hdac_stream(link_dev)->stream_tag;
 
@@ -316,7 +320,7 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 		/*
-		 * clear and release link DMA channel. It will be assigned when
+		 * clear link DMA channel. It will be assigned when
 		 * hw_params is set up again after resume.
 		 */
 		ret = hda_link_config_ipc(hda_stream, dai->name,
@@ -325,8 +329,6 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 			return ret;
 		stream_tag = hdac_stream(link_dev)->stream_tag;
 		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-		snd_hdac_ext_stream_release(link_dev,
-					    HDAC_EXT_STREAM_TYPE_LINK);
 		link_dev->link_prepared = 0;
 
 		/* fallthrough */
@@ -369,6 +371,7 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 
 	stream_tag = hdac_stream(link_dev)->stream_tag;
 	snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+	snd_soc_dai_set_dma_data(dai, substream, NULL);
 	snd_hdac_ext_stream_release(link_dev, HDAC_EXT_STREAM_TYPE_LINK);
 	link_dev->link_prepared = 0;
 
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index e82ecaad1763..e38008194574 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -439,10 +439,10 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 		stream = stream_to_hdac_ext_stream(s);
 
 		/*
-		 * clear and release stream. This should already be taken care
-		 * for running streams when the SUSPEND trigger is called.
-		 * But paused streams do not get suspended, so this needs to be
-		 * done explicitly during suspend.
+		 * clear stream. This should already be taken care for running
+		 * streams when the SUSPEND trigger is called. But paused
+		 * streams do not get suspended, so this needs to be done
+		 * explicitly during suspend.
 		 */
 		if (stream->link_substream) {
 			rtd = snd_pcm_substream_chip(stream->link_substream);
@@ -452,8 +452,6 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 				return -EINVAL;
 			stream_tag = hdac_stream(stream)->stream_tag;
 			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-			snd_hdac_ext_stream_release(stream,
-						    HDAC_EXT_STREAM_TYPE_LINK);
 			stream->link_prepared = 0;
 		}
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
