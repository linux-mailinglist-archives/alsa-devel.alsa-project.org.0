Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558141A813C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:06:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF1D816F7;
	Tue, 14 Apr 2020 17:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF1D816F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876804;
	bh=uSNXJRFtmX3jqdkRxoLMzrTVezfKq+ep9fPdb9qicvo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=K+w6KNTLCFa1g0AZAyj462Lnw14zNFDyMsJvhFrhTY7ROIIF5m4dpU+fiTE3RjEr7
	 Vrhi7k7inn22KJo1NU80eGiOseCBqE6blMC4dpAqCpklbUd4sXtEoC2YT2CvOLj3SU
	 PZuRI4/f5WRgSINRtBqWSEc/Vu/ABgDcqLPcDUiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBBD9F80299;
	Tue, 14 Apr 2020 16:48:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EFD8F803EB; Tue, 14 Apr 2020 16:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 180F9F803CA
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:48:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 180F9F803CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eDNAR/f6"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36CCF2076D;
 Tue, 14 Apr 2020 14:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875723;
 bh=uSNXJRFtmX3jqdkRxoLMzrTVezfKq+ep9fPdb9qicvo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=eDNAR/f62JgvtH1ftIPV3B+sVa3b5ZX60YiSICIAG7HBF79e+EsoR/rrVzyi5dIjD
 irelOF1mLqUDqg8LrleQ7VKPqmclXiAdazBERbKb1Df/3UB4+f1pCvQxTmeSW7Ptxw
 sQ/dTJGeiIv8I0nueFKW9wAu1+JBu1gRZY0YJOCg=
Date: Tue, 14 Apr 2020 15:48:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-core: set rtd->num_cpu/codec at
 soc_new_pcm_runtime()" to the asoc tree
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

   ASoC: soc-core: set rtd->num_cpu/codec at soc_new_pcm_runtime()

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

From 49648d02008dd75ddd84b16f9abf29f24c383519 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 30 Mar 2020 10:47:54 +0900
Subject: [PATCH] ASoC: soc-core: set rtd->num_cpu/codec at
 soc_new_pcm_runtime()

rtd->cpu_dais/codec_dais are set at soc_new_pcm_runtime().
rtd->num_cpus/codecs should be set there.
This patch do it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87h7y6bol1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 4ad64b96d893..8cef4fd6df36 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -490,6 +490,8 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	 */
 	rtd->cpu_dais	= &rtd->dais[0];
 	rtd->codec_dais	= &rtd->dais[dai_link->num_cpus];
+	rtd->num_cpus	= dai_link->num_cpus;
+	rtd->num_codecs	= dai_link->num_codecs;
 
 	/*
 	 * rtd remaining settings
@@ -989,7 +991,6 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 	if (!rtd)
 		return -ENOMEM;
 
-	rtd->num_cpus = dai_link->num_cpus;
 	for_each_link_cpus(dai_link, i, cpu) {
 		asoc_rtd_to_cpu(rtd, i) = snd_soc_find_dai(cpu);
 		if (!asoc_rtd_to_cpu(rtd, i)) {
@@ -1004,7 +1005,6 @@ int snd_soc_add_pcm_runtime(struct snd_soc_card *card,
 	rtd->cpu_dai = rtd->cpu_dais[0];
 
 	/* Find CODEC from registered CODECs */
-	rtd->num_codecs = dai_link->num_codecs;
 	for_each_link_codecs(dai_link, i, codec) {
 		asoc_rtd_to_codec(rtd, i) = snd_soc_find_dai(codec);
 		if (!asoc_rtd_to_codec(rtd, i)) {
-- 
2.20.1

