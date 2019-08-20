Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD0E967FD
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:48:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F49E1607;
	Tue, 20 Aug 2019 19:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F49E1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323311;
	bh=YEuOGUyv2iTvZ8kkWukjYAgk0irHYnQPMEEW611ZhG0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Cm12cWxWe6dEAYB/eIzk+moo+ANaMaLrf6eNVUtYMZ4vMfEpHbZrp0nqjPFewJECC
	 WUt+exNGyvx00znCmQQ2dhK9n7NjCpP5jhpzK7qCRvG82/9e4w7+htX1v5OFOwaCao
	 3lD/uwfK9oyGa7LdPrd2ev3ho5aAEElNpkhpCUvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CE2DF80678;
	Tue, 20 Aug 2019 19:41:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2E62F80633; Tue, 20 Aug 2019 19:41:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_26, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FCF0F805FA
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FCF0F805FA
Received: by mail-wm1-f99.google.com with SMTP id v19so3380836wmj.5
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=kKDiaFCwlI0LG0aQF2OZkw6zY1nZxCPFkp4+u3CT6J4=;
 b=NA4lv0u+GFnayzLTvE0wRymw11dZ1VBckplQhVfbetqXNTtkr3C7FhuA8c7FthA6Bx
 IJUwpGh+Xm6rwOrzva1hfcdyU8MllXb+NpIOIgg2AzzQELZFDQ3m5Q2j4OHSvzFfVVlT
 z/6P7yPbEK44Z91LAPrzDnurAJwbhGFS6Li/NyB37gupa5FE959XEhIzjPrJf2EHxNaU
 xXc9946IHr83Pn5covjhuZITDUd3kOKG2FKNyoe7WdNrScX6z9I5S+044mLs9xe4H4Q8
 OXxB/gMzp6E9IEMm7VzGDe5iBbT0DwfRrcPiQFu2EKMEg9k+ReHOfu2/c+hRbdSx00cb
 JLVg==
X-Gm-Message-State: APjAAAVFYPBZxsA5rLErwKnXw6JGdrWpOUC2SHVdNx3faUOshNmyRVV/
 S+U3+IsoM1eilnshjBY0y6EO8kldXFo4oLJoU6lYYSv1j+qVqjUKEtEVJm4LkMyTsg==
X-Google-Smtp-Source: APXvYqz01JLuHJLn0Dp3nZavjwETeEjksL0n8HDLWQn0OO42CozJjNxHMz07TpXOEgSP5pxKNxvMFZvfsmkH
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr1179446wmm.119.1566322866279; 
 Tue, 20 Aug 2019 10:41:06 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id x21sm7945wmj.52.2019.08.20.10.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:06 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0882-00032m-0T; Tue, 20 Aug 2019 17:41:06 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 63827274314E; Tue, 20 Aug 2019 18:41:05 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <8b26477560ad5fd8f69e037b167c5e61de5c26a3.1566242458.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174105.63827274314E@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:05 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: RX and TX counter registers
	are swapped" to the asoc tree
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

   ASoC: sun4i-i2s: RX and TX counter registers are swapped

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

From cf2c0e1ce9544df42170fb921f12da82dc0cc8d6 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 19 Aug 2019 21:25:17 +0200
Subject: [PATCH] ASoC: sun4i-i2s: RX and TX counter registers are swapped

The RX and TX counters registers offset have been swapped, fix that.

Fixes: fa7c0d13cb26 ("ASoC: sunxi: Add Allwinner A10 Digital Audio driver")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/8b26477560ad5fd8f69e037b167c5e61de5c26a3.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 0a7f1d0f7371..53c95e5289f5 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -76,8 +76,8 @@
 #define SUN4I_I2S_CLK_DIV_MCLK_MASK		GENMASK(3, 0)
 #define SUN4I_I2S_CLK_DIV_MCLK(mclk)			((mclk) << 0)
 
-#define SUN4I_I2S_RX_CNT_REG		0x28
-#define SUN4I_I2S_TX_CNT_REG		0x2c
+#define SUN4I_I2S_TX_CNT_REG		0x28
+#define SUN4I_I2S_RX_CNT_REG		0x2c
 
 #define SUN4I_I2S_TX_CHAN_SEL_REG	0x30
 #define SUN4I_I2S_CHAN_SEL_MASK			GENMASK(2, 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
