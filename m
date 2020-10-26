Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C4299633
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 19:57:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6836F16BE;
	Mon, 26 Oct 2020 19:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6836F16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603738646;
	bh=3HGrqn0s4tuWvSL+wUbJI2u5OpWmlmVsTF25qYwPXDU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qAyZxyqKOxaPZsRLc1sDaF/pPh0pbruvRRE9QkA2vDGiefHLq/HPppmN5JfMrT7sl
	 HvjKYSFj18rIa6zmcfGH3rKKq3p3pVUPd/xGfhQHNdsajI0aOSP1SdFs6XXOOWJP4O
	 numXmADK+dNqqCwok7EWv8r7tHzObNQrOPJRgDWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A995DF804FB;
	Mon, 26 Oct 2020 19:53:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4940F804D6; Mon, 26 Oct 2020 19:53:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A01FF80086
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 19:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A01FF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eZ49tzP1"
Received: by mail-wr1-x442.google.com with SMTP id n6so13872438wrm.13
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 11:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MV0Vedow4etdUV5MYJB38BsVPsxN1obeyBLGuXltraA=;
 b=eZ49tzP1pyDtQrusuKWVvPynjdDSUYbYk/Pf7IjVXifYBHVV2xSmh1Y3Lw38u/5kY4
 gYHSqwME7tvdlVU7ahKClZ6QaaHoGFxb1FC6NmU2vnl9SKgxQwDcuWfZltwFcXS0UsYY
 u8Zk0YYeyU+rrAfXzwuUPsgjJb/zaQVG8cSIkgws1xRnUTqXMVGybHVTCOnFBWKtOeoT
 yC0VHJguAIEAvXa+rR+DxlKlz/IYq/FNw9Cy6CB8/VPFfR1OtQeg5eR+7bqQt54Dq3EO
 /05v9D7ugOd4S8YI5SIglhv/UhlRyRR4g8e43fyMVGjxmxi2fDMfAh9MZgPsbccMKRlG
 UZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MV0Vedow4etdUV5MYJB38BsVPsxN1obeyBLGuXltraA=;
 b=af506Qgi6KBd01St5PbKX6iKD75BT9+A6F2T+/SfJfXsiezLyaNj5/+nFzHDfQuzDj
 uvQeQrVpPMNnl0pIm34sx3upbNoBqi9V3BT/n/WhHQaUBDAyf10Ba4dn8ElmVXhqhg+n
 htw64xx3A7V7E1DjFnQa/O0MRK1PZjtP0GmJSdb7CgAgTtjRIfwQJvbgycOiREXfs7GE
 Zk+AdwBwzxg9MppdmRbVzc4iJaBYMa7L1oTTlN93yilZh9xtaKpMJmJUGHc4IKcf5pwL
 g0ld2k8AzxdXmaEprSrE+xNIeE955P0JVDHV19GzfHfP59Ozw0MYbwg5Ow0tHqxKqQ5E
 knKw==
X-Gm-Message-State: AOAM5323O44R7S1HQQqlXkA3Wepk9wuG6IBTkx9DSJqmpHsLXeApoSQ4
 u1soR+Dou6CGM12W1dQmXCY=
X-Google-Smtp-Source: ABdhPJyu8GqRa4KgXOETmGaGeq0afG8g9xoC8IeUU96J0XE4Pcleg0KxfIR8tThfFcir0kcQYxdxYg==
X-Received: by 2002:adf:fc8b:: with SMTP id g11mr19587553wrr.300.1603738371204; 
 Mon, 26 Oct 2020 11:52:51 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id f7sm24885193wrx.64.2020.10.26.11.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 11:52:50 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v8 07/14] ASoC: sun4i-i2s: Fix setting of FIFO modes
Date: Mon, 26 Oct 2020 19:52:32 +0100
Message-Id: <20201026185239.379417-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026185239.379417-1-peron.clem@gmail.com>
References: <20201026185239.379417-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
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

From: Samuel Holland <samuel@sholland.org>

Because SUN4I_I2S_FIFO_CTRL_REG is volatile, writes done while the
regmap is cache-only are ignored. To work around this, move the
configuration to a callback that runs while the ASoC core has a
runtime PM reference to the device.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index dee8688f0d37..703327dc8606 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -595,6 +595,13 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	/* Set significant bits in our FIFOs */
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
+			   SUN4I_I2S_FIFO_CTRL_TX_MODE_MASK |
+			   SUN4I_I2S_FIFO_CTRL_RX_MODE_MASK,
+			   SUN4I_I2S_FIFO_CTRL_TX_MODE(1) |
+			   SUN4I_I2S_FIFO_CTRL_RX_MODE(1));
+
 	switch (params_physical_width(params)) {
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
@@ -923,13 +930,6 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return ret;
 	}
 
-	/* Set significant bits in our FIFOs */
-	regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
-			   SUN4I_I2S_FIFO_CTRL_TX_MODE_MASK |
-			   SUN4I_I2S_FIFO_CTRL_RX_MODE_MASK,
-			   SUN4I_I2S_FIFO_CTRL_TX_MODE(1) |
-			   SUN4I_I2S_FIFO_CTRL_RX_MODE(1));
-
 	i2s->format = fmt;
 
 	return 0;
-- 
2.25.1

