Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2BA821EE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:28:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 489EF16AE;
	Mon,  5 Aug 2019 18:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 489EF16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022532;
	bh=47AKx4EDgJJupztn8o3v+/aHxtVBqsu/P474Wgo0PkM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=isXdVfPCkK0LPiZeoRPH463kNLuUacZ+WZd1LjoOmNoRk6WcFKVlr9RVAiKMf86Ih
	 ErmiX1zL6DV/Ptb05+dy7FS8uBQKw3tn3ecm99eGZ4/JxK8GpNXPKPAouTcOzld18k
	 ESZbKUiXIRtnUguZl1L3xpNrohM59Xxt9hg7u1A8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57A4CF8087D;
	Mon,  5 Aug 2019 18:10:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01AD9F80677; Mon,  5 Aug 2019 18:10:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA5DFF80635
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA5DFF80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HCdt7tco"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=qkbWi4QeSrZTIoOsZsuoA+t7Tmll3tuYLsOS2iEL/qs=; b=HCdt7tcoziXi
 1X2nIHaIB9uLwgH6lC1l2e/V9XAiwa+dq4i+PPBj7wrQo64GRJUzOK5rWOO1YLMeeaYy03YoE4Ncr
 WNK56Mgo8TQRIMS8OaevkhWSDTbM2GU/yh/Xmj1OgVf2G7VBNPuAgbZEjiHbuRtGsA6QAkzjpHo0J
 0rnSQ=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYi-0000mQ-9U; Mon, 05 Aug 2019 16:10:04 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2F0F62742EB3; Mon,  5 Aug 2019 17:10:02 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfwl5rot.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805161002.2F0F62742EB3@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:10:02 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-pcm: remove
	soc_rtdcom_copy_kernel()" to the asoc tree
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

   ASoC: soc-pcm: remove soc_rtdcom_copy_kernel()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 4efbb20971af527990f3c51056d142e3f7dc6b4a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:49:29 +0900
Subject: [PATCH] ASoC: soc-pcm: remove soc_rtdcom_copy_kernel()

No ALSA SoC driver has .copy_kernel at component->driver->ops.
We can revive it if some-driver want to use it, but let's remove it
so far to avoid maintaining complex code

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87lfwl5rot.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index bf04b69d6878..e85548244b55 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2896,28 +2896,6 @@ static int soc_rtdcom_copy_user(struct snd_pcm_substream *substream, int channel
 	return -EINVAL;
 }
 
-static int soc_rtdcom_copy_kernel(struct snd_pcm_substream *substream, int channel,
-				  unsigned long pos, void *buf, unsigned long bytes)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_component *component;
-
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		if (!component->driver->ops ||
-		    !component->driver->ops->copy_kernel)
-			continue;
-
-		/* FIXME. it returns 1st copy now */
-		return component->driver->ops->copy_kernel(substream, channel,
-							   pos, buf, bytes);
-	}
-
-	return -EINVAL;
-}
-
 static int soc_rtdcom_fill_silence(struct snd_pcm_substream *substream, int channel,
 				   unsigned long pos, unsigned long bytes)
 {
@@ -3111,8 +3089,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 
 		if (ops->copy_user)
 			rtd->ops.copy_user	= soc_rtdcom_copy_user;
-		if (ops->copy_kernel)
-			rtd->ops.copy_kernel	= soc_rtdcom_copy_kernel;
 		if (ops->fill_silence)
 			rtd->ops.fill_silence	= soc_rtdcom_fill_silence;
 		if (ops->page)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
