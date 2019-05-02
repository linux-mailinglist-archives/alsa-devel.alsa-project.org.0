Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF0F11174
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:25:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B24361741;
	Thu,  2 May 2019 04:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B24361741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556763958;
	bh=xKoeupEo6UoPRp54SdI8kOiqVn0curk2W8broZki15c=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KYbiVfNJ1o34v5qQgjOe/D5BjT2RoiXr+aR7UzNjpuppTc2uM2BGfqZTvsu77dVlp
	 zP9ZgTWDnMoJ+cLyQRnqIScpVZYdyT5fZWxUXZETZvt+OSieiY2UM8QXGtxvhL7T4i
	 wJKK6oMHWyFiMbc04sksGc76FIMD5DS6KSQEVVT4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6F26F896FA;
	Thu,  2 May 2019 04:19:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBB81F89735; Thu,  2 May 2019 04:18:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 579E3F896C7
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 579E3F896C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="GdEmgfdr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=IObOfCj0E5/wgTDxjhBJZYz1gTtpGLm0TKS2eT1X5e0=; b=GdEmgfdrgCdN
 jSls5+gbaXky1ZYxNLkAtkrqLfjg663/CYSwyeAMyIAytLPhrYgv3Ylv5MEQJd109tCN33YTXsG5X
 0j2Xwk62aZ7O5tGyf4JCcnM4qcR3IoXMppeoiSHarsx3Fcmr1yoZVhINR5buwjaeFH5nt3egvKjLN
 qwWIo=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1Ie-0005qP-7B; Thu, 02 May 2019 02:18:16 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 45C05441D3B; Thu,  2 May 2019 03:18:08 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <20190409044159.17202-1-nh6z@nh6z.net>
X-Patchwork-Hint: ignore
Message-Id: <20190502021808.45C05441D3B@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:08 +0100 (BST)
Cc: team@nwdigitalradio.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: tlv320aic32x4: Fix potential
	uninitialized variable" to the asoc tree
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

   ASoC: tlv320aic32x4: Fix potential uninitialized variable

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From a23e34c064b933cf5f24e443f86bbfdd624d2e8b Mon Sep 17 00:00:00 2001
From: Annaliese McDermond <nh6z@nh6z.net>
Date: Mon, 8 Apr 2019 21:41:59 -0700
Subject: [PATCH] ASoC: tlv320aic32x4: Fix potential uninitialized variable

Fix compiler warning about uninitialized variable reported by
Stephen Rothwell <sfr@canb.auug.org.au>.

Signed-off-by: Annaliese McDermond <nh6z@nh6z.net>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tlv320aic32x4-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-clk.c b/sound/soc/codecs/tlv320aic32x4-clk.c
index 9e4899eb1d8e..156c153c12ab 100644
--- a/sound/soc/codecs/tlv320aic32x4-clk.c
+++ b/sound/soc/codecs/tlv320aic32x4-clk.c
@@ -82,7 +82,7 @@ static int clk_aic32x4_pll_get_muldiv(struct clk_aic32x4 *pll,
 	int ret;
 
 	ret = regmap_read(pll->regmap, AIC32X4_PLLPR, &val);
-	if (ret)
+	if (ret < 0)
 		return ret;
 	settings->r = val & AIC32X4_PLL_R_MASK;
 	settings->p = (val & AIC32X4_PLL_P_MASK) >> AIC32X4_PLL_P_SHIFT;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
