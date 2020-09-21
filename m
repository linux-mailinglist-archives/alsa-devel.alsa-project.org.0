Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2C0272124
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:31:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D71EB16E9;
	Mon, 21 Sep 2020 12:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D71EB16E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684275;
	bh=uqik9H8HsDWD5ZubXjn4BfWN3Etgvf034SG+MLEtjxo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QygrcjX7JRDZ0ArKALdRJDAP46VFiL0rsTYBbUxt92iHpZhtI+cuYx13lzOAy9yyc
	 DdfKJvXqGBiQwmgkDpbP94OoJ1hqYl7DLcy27TxxRC+KCt7CroI5Ud9+xbCpcAzMCl
	 WgPOdR2LyQ1tsRrz/4rk/OfOCy81DH1hMaPfk3k0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 246CBF8028E;
	Mon, 21 Sep 2020 12:28:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8D27F802E2; Mon, 21 Sep 2020 12:27:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CE61F8021C
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CE61F8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZbuYowe/"
Received: by mail-wm1-x344.google.com with SMTP id w2so11584750wmi.1
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U836kMnIm9OVtnsGLVK3iz9PKF3eFCFtxxEFlUe/IkU=;
 b=ZbuYowe/exjNSbzyxWOsn0UkKuQtse3CnJeL9q8ycWEJieTy1i2UN3YU9zsuUdOay6
 7nENve0r6Uegf7qeymFnFzLLXkkEwU86uVPdvxV8t1ReqijDJK1cI0WNPMPASQtAXZGq
 ii+Rv1shuaiirWfJdVC4xDZbT9FMYlJ4OWwBLKFfY5hGramdfm7Sl5mWs5weEgS6lO8x
 Ex2576w4v5VrB5epna9j9fgIZpX+vUeC8AG8TdgqDvaybZwKfib+2x9d87LVxlGCFn9U
 2e4pZIifUVW4RjNZeCpf702urA0M30GYCpVei+Ud7fRj7CXbNAu9ZEZfMTJz9ZR7hag9
 Vi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U836kMnIm9OVtnsGLVK3iz9PKF3eFCFtxxEFlUe/IkU=;
 b=qpC0VdnKpZpE6OvM1fNEEi60vQtbrCexpEgdvOzOj+haaVLCtPpErA3ezCzUR526wK
 nkjodZN3MxNJ43ESpVPVkAaBZ1awXVtr9Mi8d04JHgLyJlVxw2zdTN4tEw9raeEXPgK3
 qIsR+gU8IA5mvq0ffMxRlxK9RT79AMJWDmfUlQJqfoluu4RQEYXgS7POY+iDckm8wx8R
 GSQomWnu7F2rp00V3b9vCuz6jmq+/2KsxvVGzZF4tOaYHuz+lS5yJmlq5O5m7/oDxMhG
 rIIbP84Q8HqRacwbigoHRWzp6B5vaZuoIefB/htOgiZ9cJsYS8itl/9LxJ5AEHnlg3D1
 Fobw==
X-Gm-Message-State: AOAM531PYodeErtYd01/DtmESBYLKDnEsyz2TsuKOdrcgXml2bwNph0B
 XX/RJQnb+2ErxKWtZykAp3Y=
X-Google-Smtp-Source: ABdhPJx/JCXkAsyJn8R++VEiZyHBg4ONga+dVVbhmNLMXGj1NTdCtbBEHiGhSX5adMKp4LZosvZ/Ig==
X-Received: by 2002:a7b:c0ca:: with SMTP id s10mr29366622wmh.103.1600684061978; 
 Mon, 21 Sep 2020 03:27:41 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:41 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 05/22] ASoC: sun4i-i2s: Set sign extend sample
Date: Mon, 21 Sep 2020 12:27:14 +0200
Message-Id: <20200921102731.747736-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Marcus Cooper <codekipper@gmail.com>

On the newer SoCs such as the H3 and A64 this is set by default
to transfer a 0 after each sample in each slot. However the A10
and A20 SoCs that this driver was developed on had a default
setting where it padded the audio gain with zeros.

This isn't a problem while we have only support for 16bit audio
but with larger sample resolution rates in the pipeline then SEXT
bits should be cleared so that they also pad at the LSB. Without
this the audio gets distorted.

Set sign extend sample for all the sunxi generations even if they
are not affected. This will keep consistency and avoid relying on
default.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 11bbcbe24d6b..b31454eee43c 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -48,6 +48,9 @@
 #define SUN4I_I2S_FMT0_FMT_I2S				(0 << 0)
 
 #define SUN4I_I2S_FMT1_REG		0x08
+#define SUN4I_I2S_FMT1_REG_SEXT_MASK		BIT(8)
+#define SUN4I_I2S_FMT1_REG_SEXT(sext)			((sext) << 8)
+
 #define SUN4I_I2S_FIFO_TX_REG		0x0c
 #define SUN4I_I2S_FIFO_RX_REG		0x10
 
@@ -105,6 +108,9 @@
 #define SUN8I_I2S_FMT0_BCLK_POLARITY_INVERTED		(1 << 7)
 #define SUN8I_I2S_FMT0_BCLK_POLARITY_NORMAL		(0 << 7)
 
+#define SUN8I_I2S_FMT1_REG_SEXT_MASK		GENMASK(5, 4)
+#define SUN8I_I2S_FMT1_REG_SEXT(sext)			((sext) << 4)
+
 #define SUN8I_I2S_INT_STA_REG		0x0c
 #define SUN8I_I2S_FIFO_TX_REG		0x20
 
@@ -676,6 +682,7 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 	}
 	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
 			   SUN4I_I2S_CTRL_MODE_MASK, val);
+
 	return 0;
 }
 
@@ -778,6 +785,11 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 			   SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_OUT,
 			   val);
 
+	/* Set sign extension to pad out LSB with 0 */
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
+			   SUN8I_I2S_FMT1_REG_SEXT_MASK,
+			   SUN8I_I2S_FMT1_REG_SEXT(0));
+
 	return 0;
 }
 
@@ -880,6 +892,11 @@ static int sun50i_h6_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 			   SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_OUT,
 			   val);
 
+	/* Set sign extension to pad out LSB with 0 */
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
+			   SUN8I_I2S_FMT1_REG_SEXT_MASK,
+			   SUN8I_I2S_FMT1_REG_SEXT(0));
+
 	return 0;
 }
 
-- 
2.25.1

