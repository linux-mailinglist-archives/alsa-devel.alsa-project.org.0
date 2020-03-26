Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A7919472F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 20:10:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4210E1674;
	Thu, 26 Mar 2020 20:09:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4210E1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585249840;
	bh=tWVwJbncxgFGfaHXkUVvCxp3hxIXFU+pUxmK9K4e010=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=iQAq4Wo37AAuLChwHShavCubEkYdGfpXy21Ua65K/JpkTzH7Ie3KW62LdMZr67DHd
	 kINX/T1vCRUEPpInZMCd0RplA+EUvvtQ+Zytns2dKC/icJzbGpWp+6GD42Rrmdar2X
	 5QreExIpcT2JbYn9YjNs28c0wDb8dfKY27mpNxbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A786F802DF;
	Thu, 26 Mar 2020 20:05:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 375AFF802DD; Thu, 26 Mar 2020 20:05:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 693D3F802C3
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 20:05:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 693D3F802C3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A08B37FA;
 Thu, 26 Mar 2020 12:05:15 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2547E3F71F;
 Thu, 26 Mar 2020 12:05:15 -0700 (PDT)
Date: Thu, 26 Mar 2020 19:05:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Applied "ASoC: SOF: (cosmetic) use for_each_pcm_streams() in
 sof_dai_load()" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: (cosmetic) use for_each_pcm_streams() in sof_dai_load()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From c688cf1d3a2cc1bca5737e7849325b3ac8e69a41 Mon Sep 17 00:00:00 2001
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Date: Wed, 25 Mar 2020 16:12:30 -0500
Subject: [PATCH] ASoC: SOF: (cosmetic) use for_each_pcm_streams() in
 sof_dai_load()

Use for_each_pcm_streams() to enumerate streams in sof_dai_load()
instead of doing that manually.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20200325211233.27394-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 058de94fb8cf..54437caf9488 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2448,7 +2448,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	struct snd_soc_tplg_stream_caps *caps;
 	struct snd_soc_tplg_private *private = &pcm->priv;
 	struct snd_sof_pcm *spcm;
-	int stream = SNDRV_PCM_STREAM_PLAYBACK;
+	int stream;
 	int ret = 0;
 
 	/* nothing to do for BEs atm */
@@ -2460,8 +2460,9 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 		return -ENOMEM;
 
 	spcm->scomp = scomp;
-	spcm->stream[SNDRV_PCM_STREAM_PLAYBACK].comp_id = COMP_ID_UNASSIGNED;
-	spcm->stream[SNDRV_PCM_STREAM_CAPTURE].comp_id = COMP_ID_UNASSIGNED;
+
+	for_each_pcm_streams(stream)
+		spcm->stream[stream].comp_id = COMP_ID_UNASSIGNED;
 
 	spcm->pcm = *pcm;
 	dev_dbg(scomp->dev, "tplg: load pcm %s\n", pcm->dai_name);
@@ -2482,8 +2483,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	if (!spcm->pcm.playback)
 		goto capture;
 
+	stream = SNDRV_PCM_STREAM_PLAYBACK;
+
 	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: playback d0i3:%d\n",
-		 spcm->pcm.pcm_name, spcm->stream[0].d0i3_compatible);
+		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
 
 	caps = &spcm->pcm.caps[stream];
 
@@ -2513,7 +2516,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 		return ret;
 
 	dev_vdbg(scomp->dev, "tplg: pcm %s stream tokens: capture d0i3:%d\n",
-		 spcm->pcm.pcm_name, spcm->stream[1].d0i3_compatible);
+		 spcm->pcm.pcm_name, spcm->stream[stream].d0i3_compatible);
 
 	caps = &spcm->pcm.caps[stream];
 
-- 
2.20.1

