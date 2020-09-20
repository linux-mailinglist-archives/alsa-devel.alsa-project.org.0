Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A80FC2716E0
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Sep 2020 20:11:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5057B169A;
	Sun, 20 Sep 2020 20:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5057B169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600625493;
	bh=RuL3p50Xzec6EelKbouJz05LkBlL3k/rIBBBmAFb8EY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cFyGwZlOnI/GfYGHr87QEJaNQacL9+VeEihtp27gPWfPd8N2EuKXKefXeihYq57TN
	 hDcHeRzolbTA4FN4VEhLLmIbzVJcFV4MRIey17Kf9NHvKb/W3K6SE/ymoDDqxJciFA
	 rxqXSF+QKOMc8pq4hv/gs6FNgFJBbHAtnial5f0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B36ECF80229;
	Sun, 20 Sep 2020 20:08:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9FD6F802C3; Sun, 20 Sep 2020 20:08:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6492F8010F
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 20:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6492F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QFSnlyxo"
Received: by mail-wm1-x343.google.com with SMTP id l9so10327952wme.3
 for <alsa-devel@alsa-project.org>; Sun, 20 Sep 2020 11:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=51B2jgI3bIHgfxjPvcPjrMNGsbUxZmYa6XvJWzsGsIQ=;
 b=QFSnlyxo/BfaH6nGwNsyBOoNJJPkVC6KB4pYE9ln1WStuM68Y/Zgl835QNGA5hvkb3
 wX3kQNze2x9xqbnTNX1OPyRxPEaVlYhKemqwLGDnty6CTE6jPDymYeRMWzRRT6XTr9zr
 aZh/Oz68hJCuUMYWDpT6x33/7smLG48wgdLIo19ZvBCUnaBbWf9WE9A6Bo0i/N01fUY2
 56acwaA6VTX9X8XJ4C5C4IAbtsH2OKu3YpJMgJrhZ/o+FE41kSFzq8Iq/ol05ZxnGqRD
 9LTgDTKmxqjwg7Xj3kAXmc4TOTnGTtgSjl2i0CO1i32ouybBW17v9YphPUk2IKe9QrA8
 OhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51B2jgI3bIHgfxjPvcPjrMNGsbUxZmYa6XvJWzsGsIQ=;
 b=WLwmEoFplpGvycbRoXwl12egC9EcHuYBiZ7wxNVb9vtoYn/bMCqsiW5Heywkl3X6f6
 Hdr4PNk1jq5r6TB7+32E723eBDeBe6YuKb9TByFsKZkiiuznw/Srj+12SVQE5dhWLlyB
 qKM1RPDC81pI/9cIYz4SMGsTLVxV53ZpIV/y4O1Cptc96EUZABaEoSey0Aq8axgCY2UY
 k/5eQn1c4AxCEyeO5kpeq+JQLtpKk04KF/dyOKJhEU3t0rBvMYvXqxRDSYqWaAmW0wcJ
 h6yPG7qZvPz7oXRmzQZ/2o27bujyDV/4Zl08wC8kBoIDQ9EteL3k9f/atncfAWBcOinS
 2UVw==
X-Gm-Message-State: AOAM533A8BOn8NAPvLx9NK2ILTZlv1/rIZaSh4gq0HYQVr2rH22uQJq/
 XYZ2X3aJ8chvkw7LLiNMMfk=
X-Google-Smtp-Source: ABdhPJxLTAqnrKH83UX+0zEXiX9MEMj+lyBH2GQJTV8GInqcH9Tjm7nAU0fXa7iu3uJJ+a8yX97ZFQ==
X-Received: by 2002:a1c:2c85:: with SMTP id s127mr27265752wms.31.1600625291490; 
 Sun, 20 Sep 2020 11:08:11 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id 18sm15142782wmj.28.2020.09.20.11.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 11:08:10 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v3 04/19] ASoC: sun4i-i2s: Set sign extend sample
Date: Sun, 20 Sep 2020 20:07:43 +0200
Message-Id: <20200920180758.592217-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200920180758.592217-1-peron.clem@gmail.com>
References: <20200920180758.592217-1-peron.clem@gmail.com>
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
index 246d4a45edae..57a68222f99a 100644
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
 
@@ -656,6 +662,7 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 	}
 	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
 			   SUN4I_I2S_CTRL_MODE_MASK, val);
+
 	return 0;
 }
 
@@ -758,6 +765,11 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 			   SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_OUT,
 			   val);
 
+	/* Set sign extension to pad out LSB with 0 */
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
+			   SUN8I_I2S_FMT1_REG_SEXT_MASK,
+			   SUN8I_I2S_FMT1_REG_SEXT(0));
+
 	return 0;
 }
 
@@ -854,6 +866,11 @@ static int sun50i_h6_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
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

