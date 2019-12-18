Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D013912534C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:22:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732C2843;
	Wed, 18 Dec 2019 21:21:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732C2843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576700566;
	bh=d88jvhwah4JZEcqe/4NW3dagPduRoZhTD56MQg0HUJs=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=u2vBnXt+tnbgVQFhYAO10ejDhMSuwD/ThvYIUQv1UbRyEPPZNec044wotZThl417x
	 5sgNcpAZaXAzLj/O3A4DZAA1m2ci+/IRNbm/kvyHd90llXpIkEtcsSs7r+CHVedAhp
	 YpehQyJpt6PlqPPrFKuDYpLiY/Nz/eayIvwzpkbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E4DF8038E;
	Wed, 18 Dec 2019 21:06:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0A82F80385; Wed, 18 Dec 2019 21:06:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id AD0B5F8036C
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:06:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD0B5F8036C
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97B22113E;
 Wed, 18 Dec 2019 12:06:25 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 157A03F67D;
 Wed, 18 Dec 2019 12:06:24 -0800 (PST)
Date: Wed, 18 Dec 2019 20:06:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191218000518.5830-3-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191218000518.5830-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: hda-dai: fix oops on
	hda_link .hw_free" to the asoc tree
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

   ASoC: SOF: Intel: hda: hda-dai: fix oops on hda_link .hw_free

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

From 921162c81a089aa2f442103290f1af9ba281fc9f Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 17 Dec 2019 18:05:17 -0600
Subject: [PATCH] ASoC: SOF: Intel: hda: hda-dai: fix oops on hda_link .hw_free

When the PCM_PARAM IPC fails while configuring the FE, the kernel
oopses in the HDaudio link DMA .hw_free operation. The root cause is a
NULL dma_data since the BE .hw_params was never called by the SOC
core.

This error can also happen if the HDaudio link DMA configuration IPC
fails in the BE .hw_params.

This patches makes sure the dma_data is properly saved in .hw_params,
and tested before being use in hw_free.

GitHub issue: https://github.com/thesofproject/linux/issues/1417

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191218000518.5830-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dai.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 8796f385be76..896d21984b73 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -216,6 +216,8 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 		link_dev = hda_link_stream_assign(bus, substream);
 		if (!link_dev)
 			return -EBUSY;
+
+		snd_soc_dai_set_dma_data(dai, substream, (void *)link_dev);
 	}
 
 	stream_tag = hdac_stream(link_dev)->stream_tag;
@@ -228,8 +230,6 @@ static int hda_link_hw_params(struct snd_pcm_substream *substream,
 	if (ret < 0)
 		return ret;
 
-	snd_soc_dai_set_dma_data(dai, substream, (void *)link_dev);
-
 	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
 	if (!link)
 		return -EINVAL;
@@ -361,6 +361,13 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 	bus = hstream->bus;
 	rtd = snd_pcm_substream_chip(substream);
 	link_dev = snd_soc_dai_get_dma_data(dai, substream);
+
+	if (!link_dev) {
+		dev_dbg(dai->dev,
+			"%s: link_dev is not assigned\n", __func__);
+		return -EINVAL;
+	}
+
 	hda_stream = hstream_to_sof_hda_stream(link_dev);
 
 	/* free the link DMA channel in the FW */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
