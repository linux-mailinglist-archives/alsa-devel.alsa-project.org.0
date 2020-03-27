Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA3E195A3B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:47:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F286B1691;
	Fri, 27 Mar 2020 16:46:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F286B1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324064;
	bh=J9fIjV192foo9x6RYyXQKeDhuXEudky7RejAsnAW3yo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ty3AdOsPqSsoi/XYIORoI36qAIb7z8R9rJrYLLR9o5jJQ1LYwJ7wNWWlxI5vxOIyb
	 z4DpGMaYUnv3OIlo9ihuNCLE59BwwjRkotwqYkflfARZH304XKCIRISSrFDZqFbI9V
	 MFBRZ8JwjgJ9zfPzB7i1Qa4OIG6Z0yaHVJdSKP3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6B08F80370;
	Fri, 27 Mar 2020 16:35:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E28EF8036F; Fri, 27 Mar 2020 16:35:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9C646F8035F
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C646F8035F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB3D41FB;
 Fri, 27 Mar 2020 08:35:01 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FB043F71F;
 Fri, 27 Mar 2020 08:35:01 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:34:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: sunxi: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer" to the asoc tree
In-Reply-To: <878sjrir43.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-878sjrir43.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
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

   ASoC: sunxi: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer

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

From 2dc5fd034142426de1a4c60f63149b3ea8fc0b88 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 23 Mar 2020 14:21:00 +0900
Subject: [PATCH] ASoC: sunxi: use asoc_rtd_to_cpu() / asoc_rtd_to_codec()
 macro for DAI pointer

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/878sjrir43.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 98a9fe645521..86779a99df75 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -244,7 +244,7 @@ static int sun4i_spdif_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(rtd->cpu_dai);
+	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 
 	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
 		return -EINVAL;
-- 
2.20.1

