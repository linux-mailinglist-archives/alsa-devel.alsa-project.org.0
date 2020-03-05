Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A717A635
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:17:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B119166B;
	Thu,  5 Mar 2020 14:16:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B119166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583414243;
	bh=3Q/K9VkRIGDmtyGTwKcI8eFT56z8ZWkc3aHHWp2bbOA=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZVHfzGL75EQZSF7siUhK8cPU9Z8cbCfwm9G8Tz24vw4MZMccEeTgsQe1b8sScbDyl
	 tV78dZIQWZK5P0LeFXniKTgT2gfRzEE0RmJZAzbQKoumeBJ94dSOgM4xDLbBA52FoG
	 Z5rbdr/6zk8YpTu7Q8GMhTn2AoeBwZ3aJ2in7oqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C306F8025F;
	Thu,  5 Mar 2020 14:15:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92FD7F80126; Thu,  5 Mar 2020 14:15:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CC10AF80245
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC10AF80245
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C87A21FB;
 Thu,  5 Mar 2020 05:15:33 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BE143F6CF;
 Thu,  5 Mar 2020 05:15:33 -0800 (PST)
Date: Thu, 05 Mar 2020 13:15:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: use defined stream" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

   ASoC: soc-pcm: use defined stream

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

From 25c2f5156dd57f03aee2de079248c23a56222c92 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 27 Feb 2020 10:54:38 +0900
Subject: [PATCH] ASoC: soc-pcm: use defined stream

Many functions defines "stream = substream->stream", but
some of them is using "substream->stream" instead of "stream".
It is pointless. This patch uses defined stream.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87mu947q1t.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 90857138c823..8c27eb4d5e4c 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -644,8 +644,7 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 		 * bailed out on a higher level, since there would be no
 		 * CODEC to support the transfer direction in that case.
 		 */
-		if (!snd_soc_dai_stream_valid(codec_dai,
-					      substream->stream))
+		if (!snd_soc_dai_stream_valid(codec_dai, stream))
 			continue;
 
 		codec_stream = snd_soc_dai_get_pcm_stream(codec_dai, stream);
@@ -2149,7 +2148,7 @@ static int dpcm_fe_dai_startup(struct snd_pcm_substream *fe_substream)
 
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_FE);
 
-	ret = dpcm_be_dai_startup(fe, fe_substream->stream);
+	ret = dpcm_be_dai_startup(fe, stream);
 	if (ret < 0) {
 		dev_err(fe->dev,"ASoC: failed to start some BEs %d\n", ret);
 		goto be_err;
@@ -2180,7 +2179,7 @@ static int dpcm_fe_dai_startup(struct snd_pcm_substream *fe_substream)
 	return 0;
 
 unwind:
-	dpcm_be_dai_startup_unwind(fe, fe_substream->stream);
+	dpcm_be_dai_startup_unwind(fe, stream);
 be_err:
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
 	return ret;
@@ -2234,7 +2233,7 @@ static int dpcm_fe_dai_shutdown(struct snd_pcm_substream *substream)
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_FE);
 
 	/* shutdown the BEs */
-	dpcm_be_dai_shutdown(fe, substream->stream);
+	dpcm_be_dai_shutdown(fe, stream);
 
 	dev_dbg(fe->dev, "ASoC: close FE %s\n", fe->dai_link->name);
 
@@ -2412,9 +2411,9 @@ static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
 	mutex_lock_nested(&fe->card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_FE);
 
-	memcpy(&fe->dpcm[substream->stream].hw_params, params,
+	memcpy(&fe->dpcm[stream].hw_params, params,
 			sizeof(struct snd_pcm_hw_params));
-	ret = dpcm_be_dai_hw_params(fe, substream->stream);
+	ret = dpcm_be_dai_hw_params(fe, stream);
 	if (ret < 0) {
 		dev_err(fe->dev,"ASoC: hw_params BE failed %d\n", ret);
 		goto out;
@@ -2736,7 +2735,7 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 		goto out;
 	}
 
-	ret = dpcm_be_dai_prepare(fe, substream->stream);
+	ret = dpcm_be_dai_prepare(fe, stream);
 	if (ret < 0)
 		goto out;
 
-- 
2.20.1

