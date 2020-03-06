Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFFF17C13D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 16:07:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 140CA9F6;
	Fri,  6 Mar 2020 16:06:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 140CA9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583507244;
	bh=oy2pFxRC7dHuJnQ+QqxS2+mJgxZslMaynKNgseCr4qs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dBOAwQUPyYB9Siz6xiNzUlzl1sSkGm2gZDlW21wh9PYhU4lpVdL+0LAAZ6yeLOIE3
	 hA3OW8PvqvlVabdY/4Kn7Al4cbnhnR1+4G7fuXRT4uSyDMWnpdQvtCaPoX9Rhg0SP0
	 lR+Vsdw4tiXQY/IrNknwL4oT9F0YONtxE7+8aklQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C947CF802A2;
	Fri,  6 Mar 2020 16:03:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E38AEF802A7; Fri,  6 Mar 2020 16:03:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 299F4F802A1
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 16:03:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 299F4F802A1
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDA7D31B;
 Fri,  6 Mar 2020 07:03:22 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 418073F237;
 Fri,  6 Mar 2020 07:03:22 -0800 (PST)
Date: Fri, 06 Mar 2020 15:03:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: use snd_soc_dai_get_pcm_stream() at
 dpcm_set_fe_runtime()" to the asoc tree
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

   ASoC: soc-pcm: use snd_soc_dai_get_pcm_stream() at dpcm_set_fe_runtime()

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

From 0c9ba720f0be457443ba89b09a5198616cd3e811 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 6 Mar 2020 10:09:54 +0900
Subject: [PATCH] ASoC: soc-pcm: use snd_soc_dai_get_pcm_stream() at
 dpcm_set_fe_runtime()

We already have snd_soc_dai_get_pcm_stream(),
let's use it

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87mu8up9ul.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b405fb3a181b..3a30776858bf 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2022,7 +2022,6 @@ static void dpcm_set_fe_runtime(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai;
-	struct snd_soc_dai_driver *cpu_dai_drv;
 	int i;
 
 	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
@@ -2033,11 +2032,9 @@ static void dpcm_set_fe_runtime(struct snd_pcm_substream *substream)
 		if (!snd_soc_dai_stream_valid(cpu_dai, substream->stream))
 			continue;
 
-		cpu_dai_drv = cpu_dai->driver;
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			dpcm_init_runtime_hw(runtime, &cpu_dai_drv->playback);
-		else
-			dpcm_init_runtime_hw(runtime, &cpu_dai_drv->capture);
+		dpcm_init_runtime_hw(runtime,
+			snd_soc_dai_get_pcm_stream(cpu_dai,
+						   substream->stream));
 	}
 
 	dpcm_runtime_merge_format(substream, &runtime->hw.formats);
-- 
2.20.1

