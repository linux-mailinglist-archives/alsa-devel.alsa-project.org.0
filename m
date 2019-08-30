Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D13A3B8D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2019 18:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A555B86F;
	Fri, 30 Aug 2019 18:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A555B86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567181327;
	bh=kN1+ErGTYgiTyPBeiCpGqjTuoKCpO2lc3qxymi+O1Ms=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HQeDgT3QGL7QiY3n7Aav1KVebOJNVaynZb9qTT6kmpUx/Up/onnZnVA7rgqsYeo3o
	 2NBiWxFUtd1/dLn3E6B/Uy/qDXG33DVlCxe8qMVJYINjHb30+QgBGv1/L9tLR5EHxd
	 OtL6dTbT4ITPIXZy532fG4My4L9W+1Iw+iQUNIY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B48EF80362;
	Fri, 30 Aug 2019 18:06:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C70AAF80444; Fri, 30 Aug 2019 18:06:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C392BF800D1
 for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2019 18:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C392BF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FgnjNAHH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=QaQIPz734ZuB86glYtm2xLF0Nti2PRLZlSMnpxtRw0w=; b=FgnjNAHH+qRK
 xKPCj9M98CFXPYvXgSDNzWGGTNnR+6Za+nvgmnHH58QAxk7IlHkCsvKkieGLtZILDYkrkvcdWKZc+
 CcSTIeQFaOjphvADFf3m8S4iQLHRdOs7PNrSgynM2lLSnhGCvaSyuQ1FMWXhGtaCSY0ejozMxyB1L
 1+2To=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i3jPc-00078z-Jq; Fri, 30 Aug 2019 16:06:08 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0EFC22742CA7; Fri, 30 Aug 2019 17:06:08 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20190830074240.195166-5-tzungbi@google.com>
X-Patchwork-Hint: ignore
Message-Id: <20190830160608.0EFC22742CA7@ypsilon.sirena.org.uk>
Date: Fri, 30 Aug 2019 17:06:08 +0100 (BST)
Cc: tzungbi@google.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, dgreid@google.com, cychiang@google.com
Subject: [alsa-devel] Applied "ASoC: mediatek: mt8183: fix space issues" to
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

   ASoC: mediatek: mt8183: fix space issues

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

From e5b3ae3e8c4772106713698075a87bff1e86e710 Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 30 Aug 2019 15:42:40 +0800
Subject: [PATCH] ASoC: mediatek: mt8183: fix space issues

Fix space issues:
- No space before ';'.
- No trailing blank line.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20190830074240.195166-5-tzungbi@google.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 30a7735c4af3..bb9cdc0d6552 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -471,7 +471,7 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->pinctrl);
 	}
 
-	for (i = 0 ; i < PIN_STATE_MAX ; i++) {
+	for (i = 0; i < PIN_STATE_MAX; i++) {
 		priv->pin_states[i] = pinctrl_lookup_state(priv->pinctrl,
 							   mt8183_pin_str[i]);
 		if (IS_ERR(priv->pin_states[i])) {
@@ -526,4 +526,3 @@ MODULE_DESCRIPTION("MT8183-MT6358-TS3A227-MAX98357 ALSA SoC machine driver");
 MODULE_AUTHOR("Shunli Wang <shunli.wang@mediatek.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("mt8183_mt6358_ts3a227_max98357 soc card");
-
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
