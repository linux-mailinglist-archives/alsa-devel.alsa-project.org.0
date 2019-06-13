Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FB744C05
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:19:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2921A1850;
	Thu, 13 Jun 2019 21:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2921A1850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453545;
	bh=wst7fqLYMSa6Mb2UBDMDZPpKBgX13fCRFtCFLIleIx0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rXVF101yopqwFR2sG7Wqy2XdGfO8CTWYWkwX3X/W2d44aG313gDRnEtI4UNpUhhR3
	 ktN3racctOI9P6HJZbGHzzeY0GCw9f5PiAviYoI/rac731Z2Ez3WLI7NP3dP9dpN5D
	 cfu7sVyrFJLUTzrBc9K17Ic1GGe6TuRF0PNIEqxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA7B4F89793;
	Thu, 13 Jun 2019 21:06:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9459F89779; Thu, 13 Jun 2019 21:06:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87B7AF89770
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87B7AF89770
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mE+4SSbn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=odYH5jh5iqYcEq0WcQQwpiFTomDVAY1DZTeNz2YF128=; b=mE+4SSbntrcj
 IkbdRgfjFG2i5xCWfgECoVM2enoZflxejdTzlhPVGny3Ux8q9EPXi2rGDvKBoyrRAaMQxoQ023Djy
 3Y8VY/Vazltmyjph9+zQaiRQwnbCQkkdji3UFTMVLuaJJTlJcB4kxGKPEY/GDfpvsDGqsaBlw/Nnr
 2sokc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbV33-0005SQ-Tg; Thu, 13 Jun 2019 19:06:09 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 6F9F5440046; Thu, 13 Jun 2019 20:06:09 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Nathan Huckleberry <nhuck@google.com>
In-Reply-To: <20190612232502.256846-1-nhuck@google.com>
X-Patchwork-Hint: ignore
Message-Id: <20190613190609.6F9F5440046@finisterre.sirena.org.uk>
Date: Thu, 13 Jun 2019 20:06:09 +0100 (BST)
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, clang-built-linux@googlegroups.com,
 Mark Brown <broonie@kernel.org>, cernekee@chromium.org
Subject: [alsa-devel] Applied "ASoC: tas571x: Fix -Wunused-const-variable"
	to the asoc tree
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

   ASoC: tas571x: Fix -Wunused-const-variable

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

From 2f7e015c1f20cfdbe97df25868abbfa8b7514778 Mon Sep 17 00:00:00 2001
From: Nathan Huckleberry <nhuck@google.com>
Date: Wed, 12 Jun 2019 16:25:02 -0700
Subject: [PATCH] ASoC: tas571x: Fix -Wunused-const-variable

Clang produces the following warning

sound/soc/codecs/tas571x.c:666:38: warning: unused variable
'tas5721_controls' [-Wunused-const-variable]

In the chip struct definition tas5711_controls is used rather than
tac5712_controls. Looks like a typo was made in the original commit.

Since tac5711_controls is identical to tas5721_controls we can just swap
them

Cc: clang-built-linux@googlegroups.com
Link: https://github.com/ClangBuiltLinux/linux/issues/522
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas571x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index ca2dfe12344e..684b7afa9252 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -725,8 +725,8 @@ static const struct regmap_config tas5721_regmap_config = {
 static const struct tas571x_chip tas5721_chip = {
 	.supply_names			= tas5721_supply_names,
 	.num_supply_names		= ARRAY_SIZE(tas5721_supply_names),
-	.controls			= tas5711_controls,
-	.num_controls			= ARRAY_SIZE(tas5711_controls),
+	.controls			= tas5721_controls,
+	.num_controls			= ARRAY_SIZE(tas5721_controls),
 	.regmap_config			= &tas5721_regmap_config,
 	.vol_reg_size			= 1,
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
