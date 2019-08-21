Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2CE98002
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 18:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C91801664;
	Wed, 21 Aug 2019 18:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C91801664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566404713;
	bh=rySHadozrXqf3QkPN4Nj23vhtwsbLGxKSmlhfYAq8Ao=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nBmwUDjYvGtTsbvVS8ke9QcVF3NGhnSBhuj+nhGBW2J6Swjg+4W69Rf7eJppC1brn
	 9VI4YexSgnbE7YaR8TsQzMsEV9P5KuQf2bRXjJ0HmoPqz4XNTDLARprDFttG4njlu7
	 f6vFakirMrDjdxzQHXTWeFrTEmC9umfok8jG2osQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F1EF80306;
	Wed, 21 Aug 2019 18:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D14BF80306; Wed, 21 Aug 2019 18:23:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48AE9F802E0
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 18:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48AE9F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ICtotNKT"
Received: by mail-lj1-x242.google.com with SMTP id t14so2725654lji.4
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 09:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xf/6rfwEQrp0EASftgj20EORMnDX6q6RijKIZ+q88Yw=;
 b=ICtotNKToutmkB9nQx4VfVASkgYOePOm5hNb5a50PjlQSPE8U/q7rMyR8+baLwJ3Mh
 CmpM2az23gX4d8pJXVnKdTcEVV5StqRg0ruKCqRAncp2kVvhsU4v3rGns4QcMHPGpGs5
 deDw2MMACqpkGH3EHbsJAgMnM/SgXO8eGr9MFODIg4AmcObsh9VgNuXKDMCs6mH+DPp6
 OlgeHmCNiCs25WSbUJ9eRVzUAUmkug7RfCE7G2UOBfyqv/4fdTT9kN9e1Y0TjSryV7fg
 h9O7TGJclq3r9cvz35xXkPFCC2stimMZxKZjFNm8rBNgSSGlacZrGpFEUCUKk3vUPDFx
 qDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xf/6rfwEQrp0EASftgj20EORMnDX6q6RijKIZ+q88Yw=;
 b=tastzbtmaiczc0ePszKz25sx0/DxRXK+q1C1RciPUW3SQ0Yz5dpCbbB/cGPvVitJw+
 k0NXPjuctjaCOk2w+6eosfLKphCuurbUnBkLZ6stBmsr3gqJ2TH9u8j+AZAUEJdHXXL7
 Fs0BHRr97JZZAUikiuwW+A/oME2QqNbOO6erfiocKZVrSQXBnsL2D9FrfZeOOEIdA5nH
 Wkrdn0hFEivu0e+YGn5F1P+3ZmGn2vNkTEfEvDsZL++QmmKh9eGcpJm751qQuZhidcij
 JZNvg+kUohz5SkXFg6rjN8zL+xo7yi9k0u/5XMqm2BtxIWOK2D2bYYXfk5DmN7L5yvAx
 p/Bg==
X-Gm-Message-State: APjAAAUAbT4cmpV//U0jWppNMIvzSld6oN7/VXMnzhdKef9LUMuhMrkA
 CsO1mDvIltakpLzXIWS6Yvc=
X-Google-Smtp-Source: APXvYqw0Y5MwdTrgHht2bigyxlj2q89zbpnhdEqIAMmmgkr3ySoVRKSHKJT1agiTNTA6HqwVbhHygw==
X-Received: by 2002:a05:651c:1a7:: with SMTP id
 c7mr19081216ljn.89.1566404602914; 
 Wed, 21 Aug 2019 09:23:22 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id n9sm1867681ljj.62.2019.08.21.09.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 09:23:21 -0700 (PDT)
From: codekipper@gmail.com
To: mripard@kernel.org,
	wens@csie.org,
	linux-sunxi@googlegroups.com
Date: Wed, 21 Aug 2019 18:23:20 +0200
Message-Id: <20190821162320.28653-1-codekipper@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] ASoC: sun4i-i2s: incorrect regmap for A83t
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Marcus Cooper <codekipper@gmail.com>

Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index cbc6e59aa089..056a299c03fb 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1109,7 +1109,7 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
 static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
 	.has_reset		= true,
 	.reg_offset_txdata	= SUN8I_I2S_FIFO_TX_REG,
-	.sun4i_i2s_regmap	= &sun4i_i2s_regmap_config,
+	.sun4i_i2s_regmap	= &sun8i_i2s_regmap_config,
 	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
 	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
