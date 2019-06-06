Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D3C38054
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:11:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0469A822;
	Fri,  7 Jun 2019 00:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0469A822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559859089;
	bh=4e943grRTixfvtVHjuxzB56QWLWPkuRqkvdo7HJ1OfY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GXKN/f/Mxb33M7RFN1RumkM4oh1tEb0SBV1wNmDX/qMmlQA7iwK+1/wQ9RCjH205+
	 SQfhgqIrwj1vKNPgSFkKmUSjJAqP0yS8OU9niLWbUZ8M5V/HC7t1x25aUCrpvsPEfi
	 uhj7seNZrsXXJPs4PPAnp2kQ2c4gPx+jmT3/pDsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F78AF8971E;
	Thu,  6 Jun 2019 23:29:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FF09F8978E; Thu,  6 Jun 2019 23:27:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EF93F8978E
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EF93F8978E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="v5muLxPm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=7vWcQz2DVaPw5zg4GEc6RVCrLddBtkPlI1ZRbrIiQ58=; b=v5muLxPm5j1j
 G7b1z/f+J1vuWv8jIm6jGqZGgzDmj91Nsq+9QQxGARkOz7bZpMv1UeE/ziB54Pgy6Ulv/toE5t5C8
 Xw4Ub9qihD72wEe79X6ytMOLxDuLCbbh/j0X4eMTJGoZOxHPwbGalR4HqpjbPx13gW0SASnEVRoUr
 gSZ5A=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzu5-0007NL-Sz; Thu, 06 Jun 2019 21:26:33 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 5134F440046; Thu,  6 Jun 2019 22:26:33 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878suficsn.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212633.5134F440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:33 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: wm1133-ev1: use modern dai_link
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

   ASoC: fsl: wm1133-ev1: use modern dai_link style

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

From c90cf3d3fb4aee7717eba73f16924394022990bd Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:14:59 +0900
Subject: [PATCH] ASoC: fsl: wm1133-ev1: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/wm1133-ev1.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/wm1133-ev1.c b/sound/soc/fsl/wm1133-ev1.c
index aad24ccbef90..52d321bede9c 100644
--- a/sound/soc/fsl/wm1133-ev1.c
+++ b/sound/soc/fsl/wm1133-ev1.c
@@ -216,18 +216,20 @@ static int wm1133_ev1_init(struct snd_soc_pcm_runtime *rtd)
 }
 
 
+SND_SOC_DAILINK_DEFS(ev1,
+	DAILINK_COMP_ARRAY(COMP_CPU("imx-ssi.0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm8350-codec.0-0x1a", "wm8350-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("imx-ssi.0")));
+
 static struct snd_soc_dai_link wm1133_ev1_dai = {
 	.name = "WM1133-EV1",
 	.stream_name = "Audio",
-	.cpu_dai_name = "imx-ssi.0",
-	.codec_dai_name = "wm8350-hifi",
-	.platform_name = "imx-ssi.0",
-	.codec_name = "wm8350-codec.0-0x1a",
 	.init = wm1133_ev1_init,
 	.ops = &wm1133_ev1_ops,
 	.symmetric_rates = 1,
 	.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBM_CFM,
+	SND_SOC_DAILINK_REG(ev1),
 };
 
 static struct snd_soc_card wm1133_ev1 = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
