Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B76380F9
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:39:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 324DE16C7;
	Fri,  7 Jun 2019 00:38:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 324DE16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559860768;
	bh=hjCDjcj6YRd1XU03liimBZcUvrJbNibgwHhIOrjyGLc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=tuYvT16uy1P/8bVVZxaRUbBvpFt9fnn3AF3jxAKR8mOHwQ1TH/19M43+ire146IPW
	 CkCnIpkjIhXc9fD1wh5PE7HeewhnLNCpf2qAq//aGftWzr6tgFVDB9nVH6ICbI3zOl
	 omfRkjAXpsdEVls0vz1zgyF43XBka17koeMCQ0Fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1892F89991;
	Thu,  6 Jun 2019 23:31:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D709F89868; Thu,  6 Jun 2019 23:28:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 888F5F897D8
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 888F5F897D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="SExQZBcg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=BybMu4x2ptxY+9ISX+0XVb84i5oitlYsuLcdugogDx0=; b=SExQZBcgHmAq
 PRWqjIm0eHIsyEVR8UDXDEWJXtF779mfdFOQQYss3NrPn++YjBkzRhl/SQHeWWvnBBbJCJTbu1e2w
 6Bz2dWi35ymK2JKd72J/TGzV4LySmQHXdvZl6rZWDLvQwfuAl3ve28BfU4F1EqSqk3aDibD1sRmHi
 UIzA0=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuT-0007RS-9u; Thu, 06 Jun 2019 21:26:57 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id C3FFA440049; Thu,  6 Jun 2019 22:26:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wohzjrj9.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212656.C3FFA440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:56 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: pxa: em-x270: use modern dai_link
	style" to the asoc tree
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

   ASoC: pxa: em-x270: use modern dai_link style

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

From d7d8e1b14c165fc4c32037521af736669c454e02 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:11:18 +0900
Subject: [PATCH] ASoC: pxa: em-x270: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/em-x270.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/soc/pxa/em-x270.c b/sound/soc/pxa/em-x270.c
index e046770ce70e..9ff2a64e0981 100644
--- a/sound/soc/pxa/em-x270.c
+++ b/sound/soc/pxa/em-x270.c
@@ -30,22 +30,26 @@
 #include <asm/mach-types.h>
 #include <mach/audio.h>
 
+SND_SOC_DAILINK_DEFS(ac97,
+	DAILINK_COMP_ARRAY(COMP_CPU("pxa2xx-ac97")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec", "wm9712-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("pxa-pcm-audio")));
+
+SND_SOC_DAILINK_DEFS(ac97_aux,
+	DAILINK_COMP_ARRAY(COMP_CPU("pxa2xx-ac97-aux")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec", "wm9712-aux")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("pxa-pcm-audio")));
+
 static struct snd_soc_dai_link em_x270_dai[] = {
 	{
 		.name = "AC97",
 		.stream_name = "AC97 HiFi",
-		.cpu_dai_name = "pxa2xx-ac97",
-		.codec_dai_name = "wm9712-hifi",
-		.platform_name = "pxa-pcm-audio",
-		.codec_name = "wm9712-codec",
+		SND_SOC_DAILINK_REG(ac97),
 	},
 	{
 		.name = "AC97 Aux",
 		.stream_name = "AC97 Aux",
-		.cpu_dai_name = "pxa2xx-ac97-aux",
-		.codec_dai_name = "wm9712-aux",
-		.platform_name = "pxa-pcm-audio",
-		.codec_name = "wm9712-codec",
+		SND_SOC_DAILINK_REG(ac97_aux),
 	},
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
