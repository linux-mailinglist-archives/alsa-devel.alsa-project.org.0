Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FA91AEEFB
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 16:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B04A1676;
	Sat, 18 Apr 2020 16:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B04A1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587220922;
	bh=wpUfhNpsZQrgo3wEIYQ6F1huHLWhs14ZYbax9BNVsB8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QcmlzOVx2DYIaBGsqmsyb1yC9nC94oxB3nGqW8C3L2J8zI90hEcGBMwMwj897PZ3u
	 ir/5Pqxd+icC97BIK51F91jc6iBemn/ADTYZqK7IKdxvhe8npDpM/m/dgS9HbIa5oN
	 +1QXVV5+8SA3Vu6GHJANVBP2jM94PHAGbimDyWRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C29CF8028C;
	Sat, 18 Apr 2020 16:39:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76D45F8016F; Sat, 18 Apr 2020 16:39:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFBE4F80122
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 16:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFBE4F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VFNSOPep"
Received: by mail-wr1-x441.google.com with SMTP id x18so6396341wrq.2
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 07:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8DEFjpIBB2sTg55bEJY9HmamuD/w0H5V9QfSFLKTLl8=;
 b=VFNSOPepRO8LhHnCsEQL9MS6dTL5kqLw8PsSoFR/IqpGp4vIfHp7KkZ1uMf4VH1+L+
 q4tVepabnjhTmwyy8YKwI+NH5WJ/fSdupt4yspBkUczo1nVyHM0KyeJILornWmV/r08Q
 ku6GjZ1rIZCZIv2j045VNzd4Yj4Ly9xUvNQNB1c+vowUVT85JsQkv6dII88jTS5Dt0ob
 4e6q88RkoiFpChLzn47Q53BS7ycM235VpgDCcDwyk28GCfraICXPGXiATmwNV8AjQA/a
 ajuI93Rr95PSIWe0pCDg/R45RTTkAeDFhbtezQGd8Yyeve4x9pGR8BagKsRYB7j/APch
 Exbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8DEFjpIBB2sTg55bEJY9HmamuD/w0H5V9QfSFLKTLl8=;
 b=tQy/XqHl+sr0hVgXnUpMS91zj6jjUxBxomgUwiZRJ1/c4O/1mclwu5hc7gdWPEK5LC
 aCfgTL1MerO06el0N5d3/UXRKR7bmkE2V7yLrInRpVHTL5P9Av3C8jHQo77p53eunOdN
 hSYsDmq/J9FhHiZjq7lYEwso9qSUjlVqO1k1GbtvWs3GeAlT1JxE0Z84fN0E0oYW2nw6
 TmlaRLgALpFAFPpvGHaBAwvXoM30Y4ynmZ9CVSjB99cuZmUg5Mf7A1yR8UmcfiUZK7wZ
 B0hTGs7PD8EbVP2OPbE9ak63qT5FHF3h2G5nRJQJrPVeyrUF80YyAvSk4eRQMgmClztT
 a0lg==
X-Gm-Message-State: AGi0PuaEcHeNZHuv9K/KSzaKRQbtlD2PJkUCNTmxymOsGOkNlAbvIxIT
 SCZro4wdyPHwx6rbyx8jZfQ=
X-Google-Smtp-Source: APiQypJuUCkFiPwqfns+vAkEj6LuyE3CN+CHAPCJKI9sRF2HzFfQQW4yZlrPaWVbC5uK0hNjDwIsnA==
X-Received: by 2002:a5d:500b:: with SMTP id e11mr9191160wrt.272.1587220768520; 
 Sat, 18 Apr 2020 07:39:28 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:4e7:1fdd:b7c2:b3ab])
 by smtp.gmail.com with ESMTPSA id
 s9sm25375322wrg.27.2020.04.18.07.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 07:39:27 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/7] ASoC: sun4i-i2s: Adjust LRCLK width
Date: Sat, 18 Apr 2020 16:39:17 +0200
Message-Id: <20200418143923.19608-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418143923.19608-1-peron.clem@gmail.com>
References: <20200418143923.19608-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
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

Some codecs such as i2s based HDMI audio and the Pine64 DAC require
a different amount of bit clocks per frame than what is calculated
by the sample width. Use the values obtained by the tdm slot bindings
to adjust the LRCLK width accordingly.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d0a8d5810c0a..4198a5410bf9 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -455,6 +455,9 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 		return -EINVAL;
 	}
 
+	if (i2s->slot_width)
+		lrck_period = i2s->slot_width;
+
 	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
 			   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
 			   SUN8I_I2S_FMT0_LRCK_PERIOD(lrck_period));
-- 
2.20.1

