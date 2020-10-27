Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A812A29C746
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 19:34:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECF5716C7;
	Tue, 27 Oct 2020 19:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECF5716C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603823677;
	bh=8oKnk986wVVqckI97tYTq2r2NjYAo521JEG24xYPuxk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BypUeI/wqkIC9yIgqapaHeuYi2V5oq6pfhB1I6D+CuCBEP7Zr/nq+SF5vZXEPAn5r
	 NRni9BxjRnKYB6bqeV3PLvM35nBpX/uWk9Di6iUim8YtktlsrzYjjcUTxolp/4Lpxj
	 u1wNTdADa7cPwRFzCDMHf5X8kiXf1gMaKJhuQCCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AD49F8019D;
	Tue, 27 Oct 2020 19:32:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5B9AF804D8; Tue, 27 Oct 2020 19:32:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A29C9F80240
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:31:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A29C9F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cPyXQd8b"
Received: by mail-wm1-x342.google.com with SMTP id c194so2315388wme.2
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EO+XgfqYhS1hWPZ5l+hsM+hp/BUXxbM/bDwLpUj+eH0=;
 b=cPyXQd8bpobuaTcZbflF+9ISJGHRfsusHYPfQhnJAlbApOn2LHLwmI/KUP8W41pMEH
 YhVaLV6hJL8RVHkO8xjOAEUDCMUg3XwW4FZfJaNDh/g56geus/uLQMfuXbWacVu7l58k
 Yp1DRySxAHwMS2ziQKrB5PiFluap3kCoSezNPsT4INGW8y8YAJ1Gd0B7+c+3ubZRLv+u
 Y50S9wzPWKWHEZbfl/trFf5287+SEMFkxNL9rRfsWgDzfC2VvX0AHsaOiM8SO4AIRVkr
 Xukph5Fl/ewvLAni+mLc3HTH1+1a9owNE8MJLDT9wZKijF7KhvyVycUQYIcHg9zjS+HF
 TxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EO+XgfqYhS1hWPZ5l+hsM+hp/BUXxbM/bDwLpUj+eH0=;
 b=ViFH8nWsRV3/1C/NHmKjkYZzc2jfj/WjVNTMqle39SZAAcAO5At9uBGUmYuhjkGp7j
 D5mWM1qEtIvn2I8tp79EJE0lBf21KMJAKoOHviYtOH3IBlfOJxyAtDFWFj3Kk9kaSbK7
 joiRV3BwXKBUgFs0UgAGYinonyCuNr1xHtAtLEkgrCxzWg+KLeDo4nKjQBxwwB9nv0yI
 EDxieMy5xNFQ/14fqyU50fJd4y1aUtLrDqWv2YbtAH+1tgufFzSK2y1UsxCY4oEE28lv
 t2JyzZxq1TIW1Xl5RnCfwcq07b6mZyuLVMKLvWQ1eJzCcISD4W83tQtokqpA8OjSS5ao
 MfnA==
X-Gm-Message-State: AOAM530xMxeMGil04z5NSl194jQjIy+BqbwH4Vc2eCfA+x0O12LdNfAZ
 ZaNcwt9DLKctLmEIUk3itbA=
X-Google-Smtp-Source: ABdhPJz51xl2Ade7TO2COWem4gvbYEgstwB3/gSBh+1t+c45C6pZQU7QwS2H6fG7zZ5N/uwbbZayEw==
X-Received: by 2002:a7b:c387:: with SMTP id s7mr4042645wmj.52.1603823519008;
 Tue, 27 Oct 2020 11:31:59 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id m9sm2864148wmc.31.2020.10.27.11.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:31:58 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v9 06/14] ASoC: sun4i-i2s: Fix sun8i volatile regs
Date: Tue, 27 Oct 2020 19:31:41 +0100
Message-Id: <20201027183149.145165-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027183149.145165-1-peron.clem@gmail.com>
References: <20201027183149.145165-1-peron.clem@gmail.com>
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

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 39b56d0de1fd..83537538f8ee 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1162,12 +1162,19 @@ static bool sun8i_i2s_rd_reg(struct device *dev, unsigned int reg)
 
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

