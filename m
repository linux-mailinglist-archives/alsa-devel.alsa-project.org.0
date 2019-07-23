Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CA671721
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 13:31:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B540186C;
	Tue, 23 Jul 2019 13:31:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B540186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563881513;
	bh=oajuEkY27SYf9rORrSl9vSTAQ62X4fYVRWM1lEyPHBQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HNpG/ex+Z+0M/JB3Nus34G0Tjsrha4rSGa3OaaXm+pEssqCuXbBFx2NqvEJZ8be3P
	 fd84JM/3DLPPe+KMmhKjA61Be51QxjCVsWjo6ixYYQ2fyABDx25P6a40zEBZ9Y5hLn
	 hRn3SqjFY9hJspg/ssjBRAEwJyCDFk9HupHfZRDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F81CF8049A;
	Tue, 23 Jul 2019 13:29:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32D67F8049A; Tue, 23 Jul 2019 13:29:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A181F800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 13:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A181F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wmbzqoGL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=P+SAY9Bpw+fJMdcQn+f3fi645FXn/oZnT9P2Hy96xW4=; b=wmbzqoGLS4K0
 zc/D4SQN/PjIu69hhfdRP8tuZLwZEZC0snyAjLK+A5njfQ0WMWnKjwzl8uIwGVZC+WG/3AIX39xDo
 iMbSwXCZn63u/XnagpLCX1C55rHhC3MHMGTh0FP8WyAeEMq8Gk7cxleQiBgHPCOZqrj44GHZH9B/z
 JElig=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpsyl-0003IZ-L2; Tue, 23 Jul 2019 11:29:11 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 223AB2742BAB; Tue, 23 Jul 2019 12:29:11 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Rander Wang <rander.wang@linux.intel.com>
In-Reply-To: <20190722141402.7194-20-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723112911.223AB2742BAB@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 12:29:11 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: fix stream id setting"
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

   ASoC: SOF: Intel: hda: fix stream id setting

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

From 810dbea3656912d6ad8db691a9a4b2ad97d4b736 Mon Sep 17 00:00:00 2001
From: Rander Wang <rander.wang@linux.intel.com>
Date: Mon, 22 Jul 2019 09:14:00 -0500
Subject: [PATCH] ASoC: SOF: Intel: hda: fix stream id setting

snd_hdac_ext_link_clear_stream_id maps stream id to
link output, which is for playback, not capture.

Tested on Whiskey Lake platform.

Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190722141402.7194-20-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dai.c | 15 +++++++++++----
 sound/soc/sof/intel/hda-dsp.c |  8 +++++++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 2b5e2b8c69c2..8796f385be76 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -327,8 +327,12 @@ static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
 					  DMA_CHAN_INVALID, substream->stream);
 		if (ret < 0)
 			return ret;
-		stream_tag = hdac_stream(link_dev)->stream_tag;
-		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			stream_tag = hdac_stream(link_dev)->stream_tag;
+			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+		}
+
 		link_dev->link_prepared = 0;
 
 		/* fallthrough */
@@ -369,8 +373,11 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 	if (!link)
 		return -EINVAL;
 
-	stream_tag = hdac_stream(link_dev)->stream_tag;
-	snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		stream_tag = hdac_stream(link_dev)->stream_tag;
+		snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+	}
+
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 	snd_hdac_ext_stream_release(link_dev, HDAC_EXT_STREAM_TYPE_LINK);
 	link_dev->link_prepared = 0;
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index e38008194574..fb55a3c5afd0 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -450,9 +450,15 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 			link = snd_hdac_ext_bus_get_link(bus, name);
 			if (!link)
 				return -EINVAL;
+
+			stream->link_prepared = 0;
+
+			if (hdac_stream(stream)->direction ==
+				SNDRV_PCM_STREAM_CAPTURE)
+				continue;
+
 			stream_tag = hdac_stream(stream)->stream_tag;
 			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
-			stream->link_prepared = 0;
 		}
 	}
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
