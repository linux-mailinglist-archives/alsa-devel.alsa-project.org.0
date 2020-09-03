Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E0D25CA95
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 22:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C79A193D;
	Thu,  3 Sep 2020 22:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C79A193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599165240;
	bh=r7Ue8kNyxAcBE/xGMGQkOvb3XVZZAMNMJK4mO0m9yjs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QGNFR8x1+wBvBdf8RPgAbcrN6cI2sM8Ojj1NG+1YAHTxQDSIS104MSXeqOl0yGNKz
	 MOzkeiyxIiADZx2IfZTNyBWfLpAS3ofA4FEv+/Se/ns7GwV7KHl6j7HppC25bSeu0w
	 3epp9ua+LIHjPPmIIvFXURqx7FbW+qyVQPL4qK/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11D13F802EA;
	Thu,  3 Sep 2020 22:31:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73D1AF802E0; Thu,  3 Sep 2020 22:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A29CF802A1
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A29CF802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QB5fuzCP"
Received: by mail-wr1-x444.google.com with SMTP id x14so4540024wrl.12
 for <alsa-devel@alsa-project.org>; Thu, 03 Sep 2020 13:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SOE/OufDVdftX3/5DbSJXaktDiZZ0XiuGv+LhNkVuyU=;
 b=QB5fuzCP50t8x9ptrCUFxBtgRq7mzEUX8Hl9zZI6AyIfW9pojvgYUQUBCBRxr3kqlA
 14rr62erX03m/hCwXDn0RD6DzKVkH/Jhovz7Ens7xMjD6qkBwYNaDCJZ7eDoNtCGAW5u
 TT1XfpsyHG8AcneQzaHt4aV42oTpzRKku2o3V8RhmdB/S3SltLxzYc8CHX5mbjqsrPLb
 6MD6TQVYc6UWK52vDugIpUgFNXrObpNmQ5kKJHmj8AhRFX8I6SP/WQx2OgVBs0djoCwc
 nT0vqytArb7OOq2VZWbuWfkLwrH/G5zroo0ONuDDKzGzd/APM/xilplzX6st297R8rqz
 cHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SOE/OufDVdftX3/5DbSJXaktDiZZ0XiuGv+LhNkVuyU=;
 b=G+saEDbd0rXtKu96SCeNRubp6H03fa7QLmeVbhhExoh9kQNSeUax5MMMr8g1h4qnME
 xQQfxzITkwaNyCZo//M00U1Nv9hInvThTd2ZIEmarTvl1thBoIRmVrCU9QZgsLPbwR6g
 W73WuTlk5C2WdQWp91REOwHdbeQQyVzdSY/4m5Pwgm2CXyNjghyHpiYw7fzWU8B7c2O4
 x10Jpt8Fkcu9jLvThv8JcfpowQDscv7QF6YM0z7+hfmslv9Ox/mmUQowugmzvKS4v80F
 Cxb0Gtrmcn6kMX36RK6BKf1Kmo1pUe31ALQp+RtzO9pUhchYJX2YcmFhFr6Sn848rXaG
 9PiQ==
X-Gm-Message-State: AOAM531LPUHqEkQWtRbky1PW9gFdEVE0JjnVFmRxXnMSD+01h8dkvSZN
 h42wQaU44GS3q8u9167CNRM=
X-Google-Smtp-Source: ABdhPJzhycUboTpC49Og5dyxs3aR2NUwKbYldNcNkiriHvt0HEJBsbOEZK4Uoye30aMEWSu3nDvefg==
X-Received: by 2002:adf:e84a:: with SMTP id d10mr4642478wrn.60.1599165049590; 
 Thu, 03 Sep 2020 13:30:49 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id q186sm6818274wma.45.2020.09.03.13.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:30:48 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 05/20] ASoC: sun4i-i2s: Set sign extend sample
Date: Thu,  3 Sep 2020 22:30:19 +0200
Message-Id: <20200903203034.1057334-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200903203034.1057334-1-peron.clem@gmail.com>
References: <20200903203034.1057334-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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
index 1b4482b0f4af..13e64180e917 100644
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
 
@@ -671,6 +677,7 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 	}
 	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
 			   SUN4I_I2S_CTRL_MODE_MASK, val);
+
 	return 0;
 }
 
@@ -767,6 +774,11 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 			   SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_OUT,
 			   val);
 
+	/* Set sign extension to pad out LSB with 0 */
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
+			   SUN8I_I2S_FMT1_REG_SEXT_MASK,
+			   SUN8I_I2S_FMT1_REG_SEXT(0));
+
 	return 0;
 }
 
@@ -863,6 +875,11 @@ static int sun50i_h6_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
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

