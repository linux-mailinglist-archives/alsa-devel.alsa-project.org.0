Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2BC9D58C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 20:11:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D43F416C2;
	Mon, 26 Aug 2019 20:10:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D43F416C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566843091;
	bh=NwmcmV5XWNDL2ri2LqCJato5Eg4y5PfA4RnAXUCjpAk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mxbMrEaH4ozEX8hTFLZN1lrMTmYDboMYwSSmuwTJCKYEwh64D5N7urEAHeWq5HHTy
	 V207al3CMyY0rGkUAUPP5UFQ4sw2OpEETYnQMKk18zBllRJEy7U7lsRL69GEAjNDrM
	 rHiOB6GmyBQbvU8sHMq5hT7i730yz2EHWcpcsN7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0FF4F805FF;
	Mon, 26 Aug 2019 20:07:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A133DF80390; Mon, 26 Aug 2019 20:07:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 644A6F80444
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 20:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 644A6F80444
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EgvQISlK"
Received: by mail-lf1-x143.google.com with SMTP id x3so12995404lfn.6
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 11:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/JiaxK/MezpMCfRnwIhrVE4IjsVGzm6Nc+QZ48CrwOY=;
 b=EgvQISlKJ+5es9A7LQNq8YnjzB6ejn9iKFaSRGei+/ko/Yjunes3Znum8wo5UnxF2Z
 Lz3PC6TCzXPQrogqz+mh3pSChnbCcndR6u0HBdD0n+vohJBgqkIZk719s9zvhhuW1HP3
 5HeMxENPm0LECvwvf/t0HXvBT9WgLhQEp5jUp8q4CRaopGDRFdctsx1PR/ttozm+/n/g
 3uYoHXVB8CCSEl3QkoRrbw8UHsTFhX/5x4Lv3+mGx1XPfT8Y+h/AkJN8q1p57iCO8EWv
 4xsX4dL2ZDGxcO6Usje9s1b2Y7lhJoT1lislmHWIKcK9hBu05ewqcKYUkMQvliw5WLy8
 sSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/JiaxK/MezpMCfRnwIhrVE4IjsVGzm6Nc+QZ48CrwOY=;
 b=rVHQ8rcnRxcpkeGCq5LxzpOZHsiB86bki+85Y5DwCvVy1Cmqx0paayxjzyn8alFveM
 zLG06MqoveUd+SsxWg8ZcravcjfaQ1ybO/a0Aoj069bufssEjNCosmZGdDlT/WmNkfAC
 fgU4Z+4pGXAG8onnPfjyA8Zw19AY+AfpwEcLfK1mdI/BRkwGo5RdOjJ2v48GouN3O6qB
 QmZPqow1eqI39L2UcQ3RZsxZjqISROsmWbI0bxlxDb0FtenAFlYbM/wjmj7w5BMrFIr/
 8JswgEEH9EpiKufjivMUtmmDngNrQfeF94tHdZPdg4Wr2p1asnlsmTuUfHpx5ka7zXZ3
 t83w==
X-Gm-Message-State: APjAAAWFWnVXMBwGt3R03c6m1VU3xxpD3Y1uBlGBulP7yXwX7Gs+lgPn
 /1MS+bdLOQsj8pXP6xcpdRI=
X-Google-Smtp-Source: APXvYqzvwQEeLDNp/oEFJY/UIHzL09RuXN5pNsb/Lcsmp9zAEJz0rTV9pQLcZzBHFdtOCEO3bmOhPg==
X-Received: by 2002:ac2:5939:: with SMTP id v25mr11839754lfi.115.1566842858249; 
 Mon, 26 Aug 2019 11:07:38 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id u3sm2215564lfm.16.2019.08.26.11.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 11:07:37 -0700 (PDT)
From: codekipper@gmail.com
To: mripard@kernel.org,
	wens@csie.org,
	linux-sunxi@googlegroups.com
Date: Mon, 26 Aug 2019 20:07:32 +0200
Message-Id: <20190826180734.15801-2-codekipper@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826180734.15801-1-codekipper@gmail.com>
References: <20190826180734.15801-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v6 1/3] ASoC: sun4i-i2s: incorrect regmap for
	A83T
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

The regmap configuration is set up for the legacy block on the
A83T whereas it uses the new block with a larger register map.

Fixes: 21faaea1343f ("ASoC: sun4i-i2s: Add support for A83T")
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 57bf2a33753e..34575a8aa9f6 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1100,7 +1100,7 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
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
