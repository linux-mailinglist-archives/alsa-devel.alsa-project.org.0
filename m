Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 306AE1A8119
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:06:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB62216F4;
	Tue, 14 Apr 2020 17:05:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB62216F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876764;
	bh=QwSPeLgXvGoQzjt35NVPIUOZRJSyfgdQqyWgS6iVWqs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MUaAVDOmAFaWkwfYk8IpdoXSwJaQjsci+FmoFaCSK8cnjesqZ5JMRCMiIz1UF+lko
	 SAak1J4GSviIlVaLNuv33m5Ax5hW1gteAaEUO11U57cpTlh2aOiSclbvrLSGjqiW4y
	 6YTa+rKKlAgHUw2Ips9j98PotSkdl+vXJ5S7hFbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC252F803CD;
	Tue, 14 Apr 2020 16:48:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63355F803CF; Tue, 14 Apr 2020 16:48:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3801CF803AD
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3801CF803AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oR/ytNXI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EC102076D;
 Tue, 14 Apr 2020 14:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875718;
 bh=QwSPeLgXvGoQzjt35NVPIUOZRJSyfgdQqyWgS6iVWqs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=oR/ytNXIZMlDAVazCnmkNIZbauKOoen4PPYYt0W+/2fO6bdS8OCS56KExZaX9XxZg
 N2I4Ft3BjOXBS/b8uDZoKThSbvGdz0dzUO1j550PPjUZCd9NUVv2VmZBkE95IAF1CM
 k55kOUSVKWoIhGomq3eT/f5vc0CkWjgpH66ucaP0=
Date: Tue, 14 Apr 2020 15:48:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-core: tidyup soc_new_pcm_runtime() rtd setups" to
 the asoc tree
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

   ASoC: soc-core: tidyup soc_new_pcm_runtime() rtd setups

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

From 01faf501eefa86fa6f334bb9c71a48498de653e6 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 30 Mar 2020 10:48:14 +0900
Subject: [PATCH] ASoC: soc-core: tidyup soc_new_pcm_runtime() rtd setups

soc_new_pcm_runtime() setups rtd, but code is very random.
This patch tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87ftdqbokh.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8cef4fd6df36..4d617c495864 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -492,17 +492,12 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	rtd->codec_dais	= &rtd->dais[dai_link->num_cpus];
 	rtd->num_cpus	= dai_link->num_cpus;
 	rtd->num_codecs	= dai_link->num_codecs;
-
-	/*
-	 * rtd remaining settings
-	 */
-	rtd->card = card;
-	rtd->dai_link = dai_link;
+	rtd->card	= card;
+	rtd->dai_link	= dai_link;
+	rtd->num	= card->num_rtd++;
 
 	/* see for_each_card_rtds */
 	list_add_tail(&rtd->list, &card->rtd_list);
-	rtd->num = card->num_rtd;
-	card->num_rtd++;
 
 	return rtd;
 
-- 
2.20.1

