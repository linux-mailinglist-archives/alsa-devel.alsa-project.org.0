Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474D038040
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:06:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0D1816D0;
	Fri,  7 Jun 2019 00:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0D1816D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858795;
	bh=LIMIqJR0yHcZQUul9vz2+aDH3ElmglqxhoHA0ED+Z4c=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=o6FCFnwfa0/i3UmhGmvq2MiqM6wKYmo19xeRrqXTNRM+IJ4FkqAbYb4ZWzslzb8Cj
	 S8BYyJEskdllpcw1alNpbOC5mRCUsY3YXC0WpWdVQfS5pGWs2YiVm1AC36lT4CW663
	 Usy7KHbAEjRpbudBbhIWgZXOCCVjvOcyVXpQH82Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 794DFF89752;
	Thu,  6 Jun 2019 23:29:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D909F8982D; Thu,  6 Jun 2019 23:27:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AD53F8978C
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AD53F8978C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="OllEJShL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Apca0O5QJdJ+0KxI3OK1YBbWcsC+g3mD1RNyYPUu7UI=; b=OllEJShLVdM7
 5fmucAEs/3Ov2Xdb1qT6lueSECY/jn9V+x/L3UA8GvVPO7T1O8/x7UGbGLlVN17SGE/q9xnq6ch1t
 937dgxP6HCVORSuqMC/fI6Cnm6Z6fIqrIXdVtBReKPtuYWr8oqIvBWjYi9i9qxqN/bj8AZ+xGtwsm
 9seZU=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzu1-0007Md-U3; Thu, 06 Jun 2019 21:26:29 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 63B4D440049; Thu,  6 Jun 2019 22:26:29 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y32fgy64.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212629.63B4D440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:29 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: pcm030-audio-fabric: use modern
	dai_link style" to the asoc tree
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

   ASoC: fsl: pcm030-audio-fabric: use modern dai_link style

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

From 61c29313cb812a6de3dc7bfd7baa3d20cf7e3e83 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:16:14 +0900
Subject: [PATCH] ASoC: fsl: pcm030-audio-fabric: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/pcm030-audio-fabric.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index a7fe4ad25c52..af3c3b90c0ac 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -23,20 +23,26 @@ struct pcm030_audio_data {
 	struct platform_device *codec_device;
 };
 
+SND_SOC_DAILINK_DEFS(analog,
+	DAILINK_COMP_ARRAY(COMP_CPU("mpc5200-psc-ac97.0")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec", "wm9712-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(iec958,
+	DAILINK_COMP_ARRAY(COMP_CPU("mpc5200-psc-ac97.1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm9712-codec", "wm9712-aux")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 static struct snd_soc_dai_link pcm030_fabric_dai[] = {
 {
 	.name = "AC97.0",
 	.stream_name = "AC97 Analog",
-	.codec_dai_name = "wm9712-hifi",
-	.cpu_dai_name = "mpc5200-psc-ac97.0",
-	.codec_name = "wm9712-codec",
+	SND_SOC_DAILINK_REG(analog),
 },
 {
 	.name = "AC97.1",
 	.stream_name = "AC97 IEC958",
-	.codec_dai_name = "wm9712-aux",
-	.cpu_dai_name = "mpc5200-psc-ac97.1",
-	.codec_name = "wm9712-codec",
+	SND_SOC_DAILINK_REG(iec958),
 },
 };
 
@@ -76,7 +82,7 @@ static int pcm030_fabric_probe(struct platform_device *op)
 	}
 
 	for_each_card_prelinks(card, i, dai_link)
-		dai_link->platform_of_node = platform_np;
+		dai_link->platforms->of_node = platform_np;
 
 	ret = request_module("snd-soc-wm9712");
 	if (ret)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
