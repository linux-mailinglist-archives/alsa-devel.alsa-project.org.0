Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C403821BE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:28:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23E0B16C2;
	Mon,  5 Aug 2019 18:27:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23E0B16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022500;
	bh=C/tdTH92g0y4h2pnyu2UsH2tgicx+nBY6CtWbz2Z8kM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=p7aRZTN7qwLgqQRlESUHhICbUss843CNuo+jNdkzdjNo3WHvAwvKTBjQZp4WnF5mp
	 RlfVggx04jaGCYS+ZcNUl2BybR7isGsCP4r1NvjfQ7PZ5Z3aQI3ceLAzQ3QCnOdD/+
	 7b0MZd8QTgANemtjVDKd2UzbALJEqTGALP6DHCck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 868FCF8087C;
	Mon,  5 Aug 2019 18:10:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B6A6F80676; Mon,  5 Aug 2019 18:10:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F9F7F80600
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F9F7F80600
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="tfhuabFX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=LU2yt5aFJOxbPRNJk1hjWgG3kNxgVO4UYUHeg47ZdDI=; b=tfhuabFXterA
 Ai7h38fclX+ReDH+a23DF5GpGlXGbIAYp7PPq14z3NaxhDLqR0PJa0ARMf6zrgvX3jv08D6Yh1hQ+
 35a9UTXvH1vv0lK1DxEaGqrjvSX4qtRR+WOwiYvXzi2r5vmf9/4IH+mP2hoUphgyjtD0eMIVN44x/
 oTajc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hufYg-0000mM-GZ; Mon, 05 Aug 2019 16:10:02 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id EE25F2742EB0; Mon,  5 Aug 2019 17:10:01 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k1c55rof.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190805161001.EE25F2742EB0@ypsilon.sirena.org.uk>
Date: Mon,  5 Aug 2019 17:10:01 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-pcm: remove soc_fill_silence()" to
	the asoc tree
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

   ASoC: soc-pcm: remove soc_fill_silence()

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

From 57cb28856ed8db11faa7cc1c751eb6ad00e7c3f0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 26 Jul 2019 13:49:43 +0900
Subject: [PATCH] ASoC: soc-pcm: remove soc_fill_silence()

No ALSA SoC driver has .fill_silence at component->driver->ops.
We can revive it if some-driver want to use it, but let's remove it
so far to avoid maintaining complex code

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87k1c55rof.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e85548244b55..1e6c4e226933 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2896,28 +2896,6 @@ static int soc_rtdcom_copy_user(struct snd_pcm_substream *substream, int channel
 	return -EINVAL;
 }
 
-static int soc_rtdcom_fill_silence(struct snd_pcm_substream *substream, int channel,
-				   unsigned long pos, unsigned long bytes)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_rtdcom_list *rtdcom;
-	struct snd_soc_component *component;
-
-	for_each_rtdcom(rtd, rtdcom) {
-		component = rtdcom->component;
-
-		if (!component->driver->ops ||
-		    !component->driver->ops->fill_silence)
-			continue;
-
-		/* FIXME. it returns 1st silence now */
-		return component->driver->ops->fill_silence(substream, channel,
-							    pos, bytes);
-	}
-
-	return -EINVAL;
-}
-
 static struct page *soc_rtdcom_page(struct snd_pcm_substream *substream,
 				    unsigned long offset)
 {
@@ -3089,8 +3067,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 
 		if (ops->copy_user)
 			rtd->ops.copy_user	= soc_rtdcom_copy_user;
-		if (ops->fill_silence)
-			rtd->ops.fill_silence	= soc_rtdcom_fill_silence;
 		if (ops->page)
 			rtd->ops.page		= soc_rtdcom_page;
 		if (ops->mmap)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
