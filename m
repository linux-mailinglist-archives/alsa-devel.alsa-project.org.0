Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1292934B7C
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 17:04:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 983CB167C;
	Tue,  4 Jun 2019 17:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 983CB167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559660689;
	bh=YzDlCjWCaNzpAyJKDynArACZXLFwY+VXYWqJwkVLOCs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qoW/on5Vy9/uFgHj/s5lvZIWyeSlj8voHyKZwvPLUj3IVXxpL/kzCHOZyXbjpGHTp
	 1OXeX6l8cbNQ0OgMCS0ABYEdxSembRkXqp14CHMPaYAQ/C5S/YcdysYnm+zdl0frZX
	 77MYyHOtdTncy/cMx+NfWTBtwUBeZG7HS+KFVgTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C903F8974D;
	Tue,  4 Jun 2019 16:59:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24A23F89718; Tue,  4 Jun 2019 16:59:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8775F8971F
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 16:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8775F8971F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="PqJS5kV1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=LmvDBFBaxX8IESNmPJ1qIhurOxBytWFJfTUlkeGLfyk=; b=PqJS5kV1PwRs
 7fINX6Dm6j3c5xOTv/jCLhat7cloSMMtpSC/CHYAD9BWbehf76Ssgk1II4UVQWTYiqL9GA9BRLQg3
 XC2RgjRfEswTaw6k4gCHJHVWcct1Eu0oKMH/qU9BGUSEnxaVTqjAZuPQdEqX4rfTeuofVJza0HGXY
 GKWDw=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYAtu-0006EJ-1j; Tue, 04 Jun 2019 14:58:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 84383440049; Tue,  4 Jun 2019 15:58:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Marcus Cooper <codekipper@gmail.com>
In-Reply-To: <20190603174735.21002-2-codekipper@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190604145857.84383440049@finisterre.sirena.org.uk>
Date: Tue,  4 Jun 2019 15:58:57 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-sunxi@googlegroups.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, be17068@iperbole.bo.it, wens@csie.org,
 Mark Brown <broonie@kernel.org>, maxime.ripard@free-electrons.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Fix sun8i tx channel offset
	mask" to the asoc tree
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

   ASoC: sun4i-i2s: Fix sun8i tx channel offset mask

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 7e46169a5f35762f335898a75d1b8a242f2ae0f5 Mon Sep 17 00:00:00 2001
From: Marcus Cooper <codekipper@gmail.com>
Date: Mon, 3 Jun 2019 19:47:27 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Fix sun8i tx channel offset mask

Although not causing any noticeable issues, the mask for the
channel offset is covering too many bits.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d5ec1a20499d..8162e107e50b 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -110,7 +110,7 @@
 
 #define SUN8I_I2S_TX_CHAN_MAP_REG	0x44
 #define SUN8I_I2S_TX_CHAN_SEL_REG	0x34
-#define SUN8I_I2S_TX_CHAN_OFFSET_MASK		GENMASK(13, 11)
+#define SUN8I_I2S_TX_CHAN_OFFSET_MASK		GENMASK(13, 12)
 #define SUN8I_I2S_TX_CHAN_OFFSET(offset)	(offset << 12)
 #define SUN8I_I2S_TX_CHAN_EN_MASK		GENMASK(11, 4)
 #define SUN8I_I2S_TX_CHAN_EN(num_chan)		(((1 << num_chan) - 1) << 4)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
