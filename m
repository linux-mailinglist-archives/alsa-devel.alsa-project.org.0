Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CAD38063
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:16:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0C0F16B6;
	Fri,  7 Jun 2019 00:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0C0F16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559859361;
	bh=2haPP4CR0yYAOQ2tsFYiXKKQlE5ggFdVb0zNKnIX0Us=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TKkKfSwQZoR/LXbNfSLIYP9zJOmjzGLEG3UrQktuPfdWqXGgKhura0LrlpIVjlgKB
	 oXskPyQBb30SZsD0jM5TtShxRspamJfqzcZW+BUHSWNrEcEGqslotLtRTGGJJLGkMF
	 dF3Wu/fgtnwlho8J2xY7UrDoCgyptH46grYIIZG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 305C9F898C9;
	Thu,  6 Jun 2019 23:30:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E838BF8983D; Thu,  6 Jun 2019 23:27:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73D4AF89730
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73D4AF89730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qt1Zph6o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+i7qwSAY98MrDJveDK11ZX3xlXfylncfpLkXP10F27Q=; b=qt1Zph6odKNj
 /syRYAJtcxjypLFQA7AEhT3KxrFacODoJTIFLUo7ozwVQ48xobLMkIY8gNVqkTfGHh/iYQiP97oxc
 Iu2Uv+k1ZWDMdDj9pDJxJ/seFbZfXWybRrchNSTX7CPYJ3jx5rwImmv2qUkOwNZhyzxQdVE/20v68
 micKM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzu9-0007Nv-5n; Thu, 06 Jun 2019 21:26:37 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id AE945440046; Thu,  6 Jun 2019 22:26:36 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h893icto.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212636.AE945440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:36 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: cirrus: simone: use modern dai_link
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

   ASoC: cirrus: simone: use modern dai_link style

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

From cda80e05c648ff5b702ddbbbf1cd170cc00dba02 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:14:22 +0900
Subject: [PATCH] ASoC: cirrus: simone: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/cirrus/simone.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/cirrus/simone.c b/sound/soc/cirrus/simone.c
index cb850530331b..88b082c15c66 100644
--- a/sound/soc/cirrus/simone.c
+++ b/sound/soc/cirrus/simone.c
@@ -21,13 +21,15 @@
 
 #include <asm/mach-types.h>
 
+SND_SOC_DAILINK_DEFS(hifi,
+	DAILINK_COMP_ARRAY(COMP_CPU("ep93xx-ac97")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("ac97-codec", "ac97-hifi")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("ep93xx-ac97")));
+
 static struct snd_soc_dai_link simone_dai = {
 	.name		= "AC97",
 	.stream_name	= "AC97 HiFi",
-	.cpu_dai_name	= "ep93xx-ac97",
-	.codec_dai_name	= "ac97-hifi",
-	.codec_name	= "ac97-codec",
-	.platform_name	= "ep93xx-ac97",
+	SND_SOC_DAILINK_REG(hifi),
 };
 
 static struct snd_soc_card snd_soc_simone = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
