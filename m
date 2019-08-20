Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D1E967E4
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:44:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 876091678;
	Tue, 20 Aug 2019 19:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 876091678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323060;
	bh=cMjWxVBFjtGti0IawgzAuLuHvN4gmvpRn3Vfooc7oY8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Bwp05iUpr+hv70X/hNwCyWvVjxHN7LFAxUKW/D0La95tCaBmdQ/iDqORNAzUUCLD9
	 rWBCTTaWhaUlOAi9+sgj82CurxDO8EF5DQq66ADagqGJyb85Rz3UHCnBW4zlyWPpHf
	 qm8ZUdlD5fW3MOGwoIjPAveb6ysD9Z0O/6z5FGYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64055F8063A;
	Tue, 20 Aug 2019 19:41:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7641F80611; Tue, 20 Aug 2019 19:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f97.google.com (mail-wr1-f97.google.com
 [209.85.221.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41941F805E2
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41941F805E2
Received: by mail-wr1-f97.google.com with SMTP id b16so13265261wrq.9
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=CNHnOIouTXcfZi2QJaXlrxvoIBJ+2d0YiQ2eL3BvS1U=;
 b=aPgi1RQ4ppVLI1YyYCM+WwF1ZK747BTJ4aBU8WMZkEJIFhp1u2sb6vdKc4cQiKvtIZ
 rvjLRPfO+TyyfEXsm3mfAGKfXkIMz6BNaKG6SIDdFiOEEJRFPBi2C3gXVxX7tGocGJhn
 hyVBP4t3j33aJyPMZeZYRP+gAinvqhttcR8AkJ9KAt+hvr7z/H3HqrxwIYQ5shGqDXuJ
 +PMM/9R+MdiBDBpE+rfrkRhgDkQM51SgQvHXzTDh1kxxMlzk3dWndaE/rsSB4Hvpzdx0
 SOItxDKROCCqENO0jHkNFTa1CkbYaGn0lQzSY/frj8K+Up6t+nBTip5k84/eE91btFUZ
 5lZw==
X-Gm-Message-State: APjAAAXtL89Kuu913+sduQu3hgEef/BxQN4kfr2TYzttzlTtF7Zw0WQ/
 24ypr5VbLHJyea7EYjIyuGkRc2ZzxHxjBFLht5RtF/iOw4xx/PJgxFzwI0qauvSrhQ==
X-Google-Smtp-Source: APXvYqze162Y+KpGs3T8/NLX6GYRPKPfdwtR2t59Iiph1sIsbnGEZfF800kRYfhtJoHFNm9YuZ6/M2tO/KS9
X-Received: by 2002:adf:d1b4:: with SMTP id w20mr35978435wrc.301.1566322865376; 
 Tue, 20 Aug 2019 10:41:05 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id z17sm2346wml.40.2019.08.20.10.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:05 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0881-00032V-3M; Tue, 20 Aug 2019 17:41:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 97890274314E; Tue, 20 Aug 2019 18:41:04 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <43b07f8cd8e0e280c64ce61d57c307678c923e9b.1566242458.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174104.97890274314E@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:04 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Fix MCLK Enable bit offset
	on A83t" to the asoc tree
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

   ASoC: sun4i-i2s: Fix MCLK Enable bit offset on A83t

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

From bf943d527987c38f6fb11f9515e0cf2839286eb8 Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 19 Aug 2019 21:25:22 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Fix MCLK Enable bit offset on A83t

The A83t, unlike previous SoCs, has the MCLK enable bit at the 8th bit of
the CLK_DIV register, unlike what is declared in the driver.

Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/43b07f8cd8e0e280c64ce61d57c307678c923e9b.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 59d809df8d2a..0fce3c476772 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1047,7 +1047,7 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
 	.has_reset		= true,
 	.reg_offset_txdata	= SUN8I_I2S_FIFO_TX_REG,
 	.sun4i_i2s_regmap	= &sun4i_i2s_regmap_config,
-	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 7, 7),
+	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
 	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
 	.bclk_dividers		= sun8i_i2s_clk_div,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
