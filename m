Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6E91B69A
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 15:03:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E29E1703;
	Mon, 13 May 2019 15:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E29E1703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557752593;
	bh=0r2ESKxikG9dW2RGWXRzx2WsjbJgj9aSLaFSyLiqgaw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=j/xsDmxDTWdcGzGQ86CeZMLCwBTCsNK6RQ4/lr3IClBEroATLO8Y2LZwKcVIXdkNN
	 A0XiSLXyTvEuHbzUhd5z24Dhgl2UAhMl1btfwUT/Lpf1ZVlxXjTLtc5YmLuNPhnmX3
	 nnDU2KNY4VlMRuUmFcjB8xTsgWOHclo+7QhV6aKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 394D3F89720;
	Mon, 13 May 2019 15:00:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07E46F8973F; Mon, 13 May 2019 14:31:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1739F89684
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 14:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1739F89684
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sb/KHm0t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=d+xof+Ekal9UR/JUrb/eJW0pQzdjt/cMcvYJ16XTUAg=; b=sb/KHm0tB/Eb
 ZOsn2dRKyfHPE5Kuyc09CG4gev9nSVa96NdojgoWFCpiFgd+KM9fCzHjvqkDQi1miSnGgJp0V573n
 xglPwC+8+bWTQMFVQEM9LI0V6jZyLBVZRYNYu4LZqwORPQyuxVYqQvFWXaTio5nyOIWkTdJs+wfEU
 G4gCo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hQA68-0006Wj-PZ; Mon, 13 May 2019 12:30:28 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 873A91129239; Mon, 13 May 2019 13:30:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tvdyalsp.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190513123027.873A91129239@debutante.sirena.org.uk>
Date: Mon, 13 May 2019 13:30:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: tidyup soc_bind_dai_link()
	comment balance" to the asoc tree
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

   ASoC: soc-core: tidyup soc_bind_dai_link() comment balance

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From e2b30edfb9435879dc68cdb7ce20299492012101 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 13 May 2019 16:06:44 +0900
Subject: [PATCH] ASoC: soc-core: tidyup soc_bind_dai_link() comment balance

Many code at soc_bind_dai_link() was changed, and its comment is
now a little bit anbalanced.
This patch tidyup these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 2ceca7fdf622..c80e7df3b20b 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -906,9 +906,8 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 	}
 	snd_soc_rtdcom_add(rtd, rtd->cpu_dai->component);
 
-	rtd->num_codecs = dai_link->num_codecs;
-
 	/* Find CODEC from registered CODECs */
+	rtd->num_codecs = dai_link->num_codecs;
 	for_each_link_codecs(dai_link, i, codecs) {
 		rtd->codec_dais[i] = snd_soc_find_dai(codecs);
 		if (!rtd->codec_dais[i]) {
@@ -922,7 +921,7 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 	/* Single codec links expect codec and codec_dai in runtime data */
 	rtd->codec_dai = rtd->codec_dais[0];
 
-	/* find one from the set of registered platforms */
+	/* Find PLATFORM from registered PLATFORMs */
 	for_each_component(component) {
 		if (!snd_soc_is_matching_component(dai_link->platforms,
 						   component))
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
