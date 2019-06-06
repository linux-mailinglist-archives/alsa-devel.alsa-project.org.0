Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7B1380C8
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E4961689;
	Fri,  7 Jun 2019 00:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E4961689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559860225;
	bh=TX6AN939qFgsha6QjrBlFVxdk/Y9slkccuesOKa6FrY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Qug/fjkf232L9V1CDyQMhTYl/4RZ5EtdSqoEFHgyP4Xw6RzVdxUSplYmVfQSelDCZ
	 64mpYoNEaXSRXmB7hPv17qXHSy25SMBMrgNs/SH6y7QC7XNnJ2ZQy4SHyN7DNFFz7n
	 uSRV3GBzqL626HTqPbsHofghvcar6/8iMDqLs0DY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4AFF8994B;
	Thu,  6 Jun 2019 23:30:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0D8CF8974C; Thu,  6 Jun 2019 23:28:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35097F897BB
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35097F897BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BuSI5X/5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=npUPrf2gImt6et+1lF6HfhnyqLFBsdBavlHKsvVcn1E=; b=BuSI5X/5Fb3t
 WWx53KJ1tEa+Ls3Y+EL+hKkE5CloDmTX8+GgQHW94438NZr5T5VQdpFyOieMjBPtyrzHDm0wwBk0z
 +OJZGTFhPNZv5ltdj8v6Va6qORTfZg5uuvHEdpROT1I6+WpqWZ8KSuKlkL1QgExxyBNwB2lWFiU0C
 CTStA=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuK-0007Q0-Ut; Thu, 06 Jun 2019 21:26:49 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 6DCA4440046; Thu,  6 Jun 2019 22:26:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87blzbjrgq.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212648.6DCA4440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:48 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ti: ams-delta: use modern dai_link
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

   ASoC: ti: ams-delta: use modern dai_link style

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

From acb9a2d52e2c4839c7fcfb72c06ab437eed9cc92 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:12:48 +0900
Subject: [PATCH] ASoC: ti: ams-delta: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/ams-delta.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index b9611db14c86..50ca3c42642f 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -518,17 +518,19 @@ static int ams_delta_cx20442_init(struct snd_soc_pcm_runtime *rtd)
 }
 
 /* DAI glue - connects codec <--> CPU */
+SND_SOC_DAILINK_DEFS(cx20442,
+	DAILINK_COMP_ARRAY(COMP_CPU("omap-mcbsp.1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("cx20442-codec", "cx20442-voice")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("omap-mcbsp.1")));
+
 static struct snd_soc_dai_link ams_delta_dai_link = {
 	.name = "CX20442",
 	.stream_name = "CX20442",
-	.cpu_dai_name = "omap-mcbsp.1",
-	.codec_dai_name = "cx20442-voice",
 	.init = ams_delta_cx20442_init,
-	.platform_name = "omap-mcbsp.1",
-	.codec_name = "cx20442-codec",
 	.ops = &ams_delta_ops,
 	.dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF |
 		   SND_SOC_DAIFMT_CBM_CFM,
+	SND_SOC_DAILINK_REG(cx20442),
 };
 
 /* Audio card driver */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
