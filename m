Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0794517C130
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 16:05:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 773D115E4;
	Fri,  6 Mar 2020 16:04:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 773D115E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583507139;
	bh=Gj4KKNUGLDY1sHZqWMfVK6sjM60UWWF3KrxqmehYQHQ=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=N/lfQQa8liVCT0m6Lu0BcSmMeiBmhWg5jkttG+hTkf1bxW5SehtVEIeGrnTXmOw2P
	 Hrj8QqLmGd6y1LamC3nol6okc/UBOm1ynzqPyKVNQT0uMcjOqIx6xaLLJGW29HMixD
	 /a3Tvq2KxE7VXehbvnn9JQL6W/rH+yeXjMY5caMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03B39F80232;
	Fri,  6 Mar 2020 16:03:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 880BCF80229; Fri,  6 Mar 2020 16:03:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 61803F80126
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 16:03:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61803F80126
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF49931B;
 Fri,  6 Mar 2020 07:03:09 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6342C3F237;
 Fri,  6 Mar 2020 07:03:09 -0800 (PST)
Date: Fri, 06 Mar 2020 15:03:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: Do Digital Mute for both CPU/Codec in same
 timing." to the asoc tree
In-Reply-To: <87imjip9ty.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87imjip9ty.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

   ASoC: soc-pcm: Do Digital Mute for both CPU/Codec in same timing.

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

From a9ee331b537a3dfe6778fa4e07c0801f33e474f5 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 6 Mar 2020 10:10:17 +0900
Subject: [PATCH] ASoC: soc-pcm: Do Digital Mute for both CPU/Codec in same
 timing.

Digital Mute for CPU   is done at soc_pcm_close(), and
Digital Mute for Codec is done at soc_pcm_hw_free().
It is just confusable.
This patch do Digital Mute for both CPU/Codec in same timing.
Then, it cares DAI activity

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87imjip9ty.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index af0e17bfeeab..90d26fccb0da 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -760,9 +760,6 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 
 	snd_soc_runtime_deactivate(rtd, substream->stream);
 
-	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
-		snd_soc_dai_digital_mute(cpu_dai, 1, substream->stream);
-
 	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
 		snd_soc_dai_shutdown(cpu_dai, substream);
 
@@ -1232,6 +1229,14 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 						 substream->stream);
 	}
 
+	for_each_rtd_cpu_dai(rtd, i, cpu_dai) {
+		int active = cpu_dai->stream_active[substream->stream];
+
+		if (active == 1)
+			snd_soc_dai_digital_mute(cpu_dai, 1,
+						 substream->stream);
+	}
+
 	/* free any machine hw params */
 	soc_rtd_hw_free(rtd, substream);
 
-- 
2.20.1

