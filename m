Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C05E38093
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:25:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D011C16F5;
	Fri,  7 Jun 2019 00:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D011C16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559859949;
	bh=KXvcyEwQw135C7os7ojxOzs2sH9yUzmexBgDGeaL0ew=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=D2OBKLXJX/yPoAM7CgbaYGBetBfNjMPp7EQh4CYrnl5etCSJFId/wlXVn0kFyYhUs
	 968ofwRhkNkCYV9WmAAaEZzHrPr0LPX1nlZcjBiI2i3ahqJOzDZZewI2BDAgFRj2VE
	 MS7bL9Uq8QNnKi7o810ZrKGE19texv5pif3osPl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A656F89925;
	Thu,  6 Jun 2019 23:30:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F375F89731; Thu,  6 Jun 2019 23:28:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F8B2F897A7
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F8B2F897A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FGQpx6oa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=03NIhMinLVFB0v5y7Yh2NF6v+j7M2wvIbkiCPQJ5r1s=; b=FGQpx6oaKNWn
 1eQ6rZWrI7Tvfckk+CDgk3ng2G19Lze5dKgOu3mNdSAWjaFUoOiBOkFuMfAfJlCdxZYJmHAzpL9yX
 VRu3heOAnPufMm3+cGl1BE0RpKZqbw+Eq6A6gx2G9bbpvbSIi2rZwcW/R6ugNm47tnOjKho5GY9uK
 pJDoA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuH-0007PJ-0Q; Thu, 06 Jun 2019 21:26:45 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8674B440046; Thu,  6 Jun 2019 22:26:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871s07jrfu.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212644.8674B440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:44 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: sh: migor: use modern dai_link style"
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

   ASoC: sh: migor: use modern dai_link style

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

From 4f209c5142dcdd4db29f734d652fba4d2ab6da71 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:13:20 +0900
Subject: [PATCH] ASoC: sh: migor: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/migor.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/migor.c b/sound/soc/sh/migor.c
index 8739c9f60672..991557e25eba 100644
--- a/sound/soc/sh/migor.c
+++ b/sound/soc/sh/migor.c
@@ -123,16 +123,18 @@ static const struct snd_soc_dapm_route audio_map[] = {
 };
 
 /* migor digital audio interface glue - connects codec <--> CPU */
+SND_SOC_DAILINK_DEFS(wm8978,
+	DAILINK_COMP_ARRAY(COMP_CPU("siu-pcm-audio")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm8978.0-001a", "wm8978-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("siu-pcm-audio")));
+
 static struct snd_soc_dai_link migor_dai = {
 	.name = "wm8978",
 	.stream_name = "WM8978",
-	.cpu_dai_name = "siu-pcm-audio",
-	.codec_dai_name = "wm8978-hifi",
-	.platform_name = "siu-pcm-audio",
-	.codec_name = "wm8978.0-001a",
 	.dai_fmt = SND_SOC_DAIFMT_NB_IF | SND_SOC_DAIFMT_I2S |
 		   SND_SOC_DAIFMT_CBS_CFS,
 	.ops = &migor_dai_ops,
+	SND_SOC_DAILINK_REG(wm8978),
 };
 
 /* migor audio machine driver */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
