Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18527A2D6
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:37:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC1A8169E;
	Sun, 27 Sep 2020 21:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC1A8169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235432;
	bh=JSYUuxqyR7L0JutcxKz9SrjvS6niDrE7O917SS8zhBE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b3zNp8EPfCREmIA3j5HMRJFgtzGBDjcBbOuvTCDRtf1Aw0f5OHgRi+FnZs+lWTjGT
	 ILuzb7T/ZJOzNeOcD2y4/vonBtdYgt0tKPzGVdY6KS1erIdYFbkFkEicKhWj8zydgV
	 WslJVfaS8mdedWpcZLBnXv8DyP+jxTTFYts1UVEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 111BAF80334;
	Sun, 27 Sep 2020 21:30:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B10C6F802EC; Sun, 27 Sep 2020 21:29:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F9CDF800B5
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F9CDF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m2gdLZ+4"
Received: by mail-wr1-x442.google.com with SMTP id t10so9582620wrv.1
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=403l/Us7aRgOIyQKfBkM8buNZnuotwhLbaKDtAVk4oo=;
 b=m2gdLZ+4J6yyiV2mG9DjdtecYFnEjhXB5woq2f3GfleRlGh8jgjTQR3nDIivt6V3qW
 VD0PFcB15gtUeUUkGjd6Gc/EfypLEHMqv5N/R4oJ+bBcgm9DG+OEQN+QVoNINrnxCp71
 0HTO2vcjA3Lfvib+TSY8pfelrJGmbccbnfVffPEhuS5nnMoZdRjf/OL70wPpNHqb/qQe
 R/oBdSeoqTIoRjpGDY2goKYIYtFaATFk9rDKACViL8JUvBEJbjVjTL2DyQuf7inhKPKg
 qqkGy2eFokq4BvcLhvvOILJogY/gqpYOcWS9CwHID94pF7AQA1V5IPyajuXvbrqboxaQ
 OLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=403l/Us7aRgOIyQKfBkM8buNZnuotwhLbaKDtAVk4oo=;
 b=OW+F2lfZ1rJuCd/f7d9Xv1Q96DxJeUUxxTp70ZBVW3xpy4TiiDyhlzSFNEsK59WuYr
 uEPemUPQ+5Dl+xyRA5u/AdbSimcdlNX9su5vJ8DTBaGUHv9XvKpwDOB+UF+wDcBjpdMi
 NtKrM3URw3hsiJeZP85iJNuQzGfYSJyvimg4iHLjDcz7Bd4ND4sIZ/ST+tQQ3bw2zn1r
 sY5fveP1Q+Fr68sEZHn3gZax1ZOERzb/X3sul4aNUc4V9v22/PhGkl9fvrklsomed7P6
 82jqFsI7Cibxjt3hwPfNIHnnRJdjGoQ71TQAJerAU9bkrfuF/lf4+wRrbeaTj6muPjjG
 9twg==
X-Gm-Message-State: AOAM5302gJdw/j0M85jV3k0NNrhMGdGb7C7vjkwKEmeFToUyHOXDcniQ
 wsK4MqyD/vVV83xteo/RLFc=
X-Google-Smtp-Source: ABdhPJynrgzzn25/R/NZnQ/YXW4o8ysWoCGC0ENp2ON7akwtDALLDl6r/2CUcfYpIj7vCIdBjc2e2w==
X-Received: by 2002:a5d:6886:: with SMTP id h6mr15683819wru.374.1601234965951; 
 Sun, 27 Sep 2020 12:29:25 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:25 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 07/20] ASoC: sun4i-i2s: Fix sun8i volatile regs
Date: Sun, 27 Sep 2020 21:28:59 +0200
Message-Id: <20200927192912.46323-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
References: <20200927192912.46323-1-peron.clem@gmail.com>
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

The FIFO TX reg is volatile and sun8i i2s register
mapping is different from sun4i.

Even if in this case it's doesn't create an issue,
Avoid setting some regs that are undefined in sun8i.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 60b2fec1bbe9..3f9110d70941 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1152,12 +1152,19 @@ static bool sun8i_i2s_rd_reg(struct device *dev, unsigned int reg)
 
 static bool sun8i_i2s_volatile_reg(struct device *dev, unsigned int reg)
 {
-	if (reg == SUN8I_I2S_INT_STA_REG)
+	switch (reg) {
+	case SUN4I_I2S_FIFO_CTRL_REG:
+	case SUN4I_I2S_FIFO_RX_REG:
+	case SUN4I_I2S_FIFO_STA_REG:
+	case SUN4I_I2S_RX_CNT_REG:
+	case SUN4I_I2S_TX_CNT_REG:
+	case SUN8I_I2S_FIFO_TX_REG:
+	case SUN8I_I2S_INT_STA_REG:
 		return true;
-	if (reg == SUN8I_I2S_FIFO_TX_REG)
-		return false;
 
-	return sun4i_i2s_volatile_reg(dev, reg);
+	default:
+		return false;
+	}
 }
 
 static const struct reg_default sun4i_i2s_reg_defaults[] = {
-- 
2.25.1

