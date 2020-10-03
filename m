Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 312C02824C1
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 16:26:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF9F31ABF;
	Sat,  3 Oct 2020 16:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF9F31ABF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601735202;
	bh=wR7bx9Xmk26D34GnFbYa6Jyxw3k6k4kz2lh1YvV1Ums=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yp1kEo2Og1M5hnn9GleLhSDthEbeJy0zbkaOluRKsfcTaemGq2lRPRzNZoX33aXNw
	 wje/l1Ia93q0ktSNEyD3kvpmT/Rbd5iixn/Zu/RwbNZvpJJCinRsTa1LvhxrKOWs4i
	 wL2xEheci2BSTX8pRUfXtCf1Hx2kdx53XpU9nnJo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 667FDF8032A;
	Sat,  3 Oct 2020 16:20:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06C9EF80317; Sat,  3 Oct 2020 16:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72143F802F7
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 16:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72143F802F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p4P+Px2L"
Received: by mail-wr1-x444.google.com with SMTP id o5so4840957wrn.13
 for <alsa-devel@alsa-project.org>; Sat, 03 Oct 2020 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ax58UcnPU6lZeDb3EeYExWMlNcsV/u2URQrazxH4tvQ=;
 b=p4P+Px2LIwrBSoaKTOg163my9Jegr6AXir6dFUS50USUcMZwqbkgWuXWq6zBVeWuc9
 e9CO3dejaQGMa73lKpLoVvAcEMUU4DjmpAvWYwZhrP/7ZESVLR4IJtsnqqd05gz2kAFN
 GdfsHb8jxIjB9IuQWONyNUrKV29PDOIhxxfIhWyJa5pdj3h3TMJ0jkjFivj7Z47CIcM0
 aV56vIOjANHCWmqiGXh4BYD0mvisHOBkoZjCJ4qfbFFsvrZXspU0/5WJTt4gQw1dalB9
 RmFCP56Za/jdldA1B82YOAYkxRGhobRZzBwFR/Ft2YIW5uvu9P1BFxLuJxuxjmllFaVE
 XcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ax58UcnPU6lZeDb3EeYExWMlNcsV/u2URQrazxH4tvQ=;
 b=Z6iuwbYBzdOjuZJB3iVhOCneP+T0PaqpnckAwh4gAPD5pPeDFSCoX9SLZOeRPcjos0
 9EQeEsoxQrkwpR4BY9FpejTtvnxdvcPaGZ77Mz8w/nEmWISzygH3gfM/DMFEQYhYqYDz
 +fwsIOiecADpZJDXB+8VFqkd5Z6o55l3Gd36Z5Dppmc9+jRJPSOzjmjfZn/thK+2SQVw
 zvQz5ns8qEmLkMru9zbKqo8wO9YmTy0pIJSQPOOnuz62rQ3/8BYWvuIqIPktXVbtvf+q
 6YIkRarc1TFsTMoSiG2T64YfEgVPPzEDztESayRkpZJ4suDPy+C2D899A8suZSqO/ziU
 oQ3Q==
X-Gm-Message-State: AOAM5334SKGljIyAneAGc36MRJEE8CHkGSjCHJ4cxuy5WHrRgxbFk/tR
 jytyKeCpGZVl9W83a1troaU=
X-Google-Smtp-Source: ABdhPJxNULhKp/1O+Gw2xeSC8CsfcKu+uvfzfv/TDKjxZ+wlFm3B8kTNRMittfYqQTkP6AIY46zzrw==
X-Received: by 2002:adf:df8e:: with SMTP id z14mr7450772wrl.32.1601734809588; 
 Sat, 03 Oct 2020 07:20:09 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id d18sm5417473wrm.10.2020.10.03.07.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 07:20:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 07/14] ASoC: sun4i-i2s: Fix setting of FIFO modes
Date: Sat,  3 Oct 2020 16:19:43 +0200
Message-Id: <20201003141950.455829-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201003141950.455829-1-peron.clem@gmail.com>
References: <20201003141950.455829-1-peron.clem@gmail.com>
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
index 92671eb94db9..fef68146d648 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -588,6 +588,13 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -916,13 +923,6 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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

