Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DED2496805
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 19:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732F31658;
	Tue, 20 Aug 2019 19:48:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732F31658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566323387;
	bh=KM3X1wde3FYC53vV/2uYHkC+dp+OPrakj2PECpV/ShM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=X8MzNR3KTej96fkWitSsP9CUrHnWgJ3Frxdm1lLlAdCkANG/Vog/4MomrwMd+eo54
	 Dpa/gB00YNqXlhaHSKI1yv5Iln3hVI/RL8p83e5oXsW9m2DwtVpH8yeqnwRY8WXGlF
	 ZEimd9OdJZbZe6JWLy5zHrN9/FGqEsv1nTdEK9X8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C6C0F806ED;
	Tue, 20 Aug 2019 19:41:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C2B2F805FA; Tue, 20 Aug 2019 19:41:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f97.google.com (mail-wm1-f97.google.com
 [209.85.128.97])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8354DF805F5
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 19:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8354DF805F5
Received: by mail-wm1-f97.google.com with SMTP id p77so2926335wme.0
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 10:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=0sfeTaSMLRPw6OQW2nsE+rZY6o1t1xUbogKZMDZLLEw=;
 b=fB/N5RP2tGmP+hiu1HrnVip5Rv7KgbEA5we4S+ngbucRL6Xz5N5rfhv5Yqnw5XSOan
 NX0CSK8yRb+jX1Qjv1BsD3mFork5pzcTzhBUFLdW3N5VgCYzY7rXmmN9xztwscZlZNGx
 Wh8YDKNGdZAaOK5sCL0qr7VZYu63ShHfMDxy+g1C4ylFv7KUNO8uEjEulKF/o5DWeKEw
 AZ2634iFv7AJi30djjVZzkY7JZ1OPsQ8R7iaozG44QPL9nZHPLhNHpJCM3+/L58CRXAR
 hdYMmjEmg8NdXY9lnuDLwXW4dGjapoF5Y+N8QD/gh3E82pJB6IGrkw0WBWzEGVvkq2vH
 V1VQ==
X-Gm-Message-State: APjAAAVY086Sd1brpen2vPOfyYZeITqTWhvkzvE4ouohUOAZmysk9imi
 /MPMjyZnTitu43eUmU0vV8DHxLSuD7WenXsUBL7QGSoiDEByzo3yQeEf5ikArLbmYw==
X-Google-Smtp-Source: APXvYqyIoehCXJci24dNeS0SujgmrXX94WJNLwdaZsUvlBYtjeo3m37ZNLL3PxpVGQ7oj91dmq6wrflUgmRj
X-Received: by 2002:a05:600c:2102:: with SMTP id
 u2mr1243986wml.105.1566322865711; 
 Tue, 20 Aug 2019 10:41:05 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id s11sm3417wmj.44.2019.08.20.10.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 10:41:05 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i0881-00032b-EF; Tue, 20 Aug 2019 17:41:05 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id C46BB274314F; Tue, 20 Aug 2019 18:41:04 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
In-Reply-To: <d93f0943cc39d880750daf459a0eeab34c63518e.1566242458.git-series.maxime.ripard@bootlin.com>
X-Patchwork-Hint: ignore
Message-Id: <20190820174104.C46BB274314F@ypsilon.sirena.org.uk>
Date: Tue, 20 Aug 2019 18:41:04 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 codekipper@gmail.com, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: sun4i-i2s: Fix WSS and SR fields for
	the A83t" to the asoc tree
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

   ASoC: sun4i-i2s: Fix WSS and SR fields for the A83t

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

From 2e04fc4dbf50195262aa5a2ae6d35baa5b598cae Mon Sep 17 00:00:00 2001
From: Maxime Ripard <maxime.ripard@bootlin.com>
Date: Mon, 19 Aug 2019 21:25:21 +0200
Subject: [PATCH] ASoC: sun4i-i2s: Fix WSS and SR fields for the A83t

The A83t has the same bit fields offsets than the A10 and A31, while this
was the first device with the new layout, fix that.

Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
Link: https://lore.kernel.org/r/d93f0943cc39d880750daf459a0eeab34c63518e.1566242458.git-series.maxime.ripard@bootlin.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 29b5eacd3abe..59d809df8d2a 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1048,8 +1048,8 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
 	.reg_offset_txdata	= SUN8I_I2S_FIFO_TX_REG,
 	.sun4i_i2s_regmap	= &sun4i_i2s_regmap_config,
 	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 7, 7),
-	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 2, 3),
-	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 5),
+	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
+	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
 	.bclk_dividers		= sun8i_i2s_clk_div,
 	.num_bclk_dividers	= ARRAY_SIZE(sun8i_i2s_clk_div),
 	.mclk_dividers		= sun8i_i2s_clk_div,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
