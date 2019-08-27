Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68CCA1E43
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:04:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46B5516AC;
	Thu, 29 Aug 2019 17:03:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46B5516AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091041;
	bh=otfwQ0yuLdnWFIsgmLu6SsVWzz8K5mjsdOuXVpdyUM0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=nlzLDBFv5sAb8HpLx3SZlm1b75D/YFiWqHzZCwLws/o1jTEHndssuJlOKCXFsw/4H
	 1+unku1eiKwlTS237AKoByC7KtWeJ1uWOTK11u6R/2uTl4XiTcNocEGp4WMz3kFh5y
	 GPd+9Kn79heuW4/E8zIAiC2Isdn6zjP+7OSSQYB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04CC5F80673;
	Tue, 27 Aug 2019 21:58:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D08CF8065A; Tue, 27 Aug 2019 21:57:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3F08F8063E
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 21:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3F08F8063E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="PknI/goa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=arR3yoBrsBx/ai1f3a6H8aBm/EqlAfpZt2z0CtrLW3U=; b=PknI/goaU39B
 FgqMyb+3b9KP5K3eMT69OcEx7NdpSz6YsSqTqxdWmSk0bHxU3zmV7yMhTL5AMNVCCGrvI7WI2KzbZ
 ioUc3poNoIATSSZE8R4fn5VJLX5TQNRERByFVrBCX+zXrSEeV9P/ssIADOeVWe2DepQwI/iX9fCyo
 XIqCk=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2hb9-0001BT-5m; Tue, 27 Aug 2019 19:57:47 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 64E50D02CEA; Tue, 27 Aug 2019 20:57:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <1566622726-27113-1-git-send-email-jiaxin.yu@mediatek.com>
X-Patchwork-Hint: ignore
Message-Id: <20190827195744.64E50D02CEA@fitzroy.sirena.org.uk>
Date: Tue, 27 Aug 2019 20:57:44 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183: fix tdm out data
	align issue" to the asoc tree
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

   ASoC: mediatek: mt8183: fix tdm out data align issue

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

From d2ac1fe0342ce2b44621f60d053800e2d94f1d21 Mon Sep 17 00:00:00 2001
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
Date: Sat, 24 Aug 2019 12:58:46 +0800
Subject: [PATCH] ASoC: mediatek: mt8183: fix tdm out data align issue

Mt8183 tdm out support S16_LE/S24_LE/S32_LE formats. When output S32_LE,
we need set hd_align so that memif can output MSB 24bits. When output
S24_LE, we need reset hd_align so that memif can output LSB 24bits.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Link: https://lore.kernel.org/r/1566622726-27113-1-git-send-email-jiaxin.yu@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index d16563408465..10ea4fdbeb1e 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -241,7 +241,7 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mtk_base_afe_memif *memif = &afe->memif[rtd->cpu_dai->id];
 	int hd_audio = 0;
-	int hd_align = 1;
+	int hd_align = 0;
 
 	/* set hd mode */
 	switch (substream->runtime->format) {
@@ -254,7 +254,6 @@ int mtk_afe_fe_prepare(struct snd_pcm_substream *substream,
 		break;
 	case SNDRV_PCM_FORMAT_S24_LE:
 		hd_audio = 1;
-		hd_align = 0;
 		break;
 	default:
 		dev_err(afe->dev, "%s() error: unsupported format %d\n",
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
