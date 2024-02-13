Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25662853DD7
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 22:59:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B84814E6;
	Tue, 13 Feb 2024 22:59:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B84814E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707861557;
	bh=jfZkHq9HMbZcPnc0fldRolB1xckrU5dTpOn3zFrSjtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zs6nC3wFc6XZBNC8DUY82BvOUlXbZivtMM/wIDRQjxLipyTwkUuOMGIBljqavEBX6
	 +2dEH4AEr+XoO7zCHL0U5Crn5RF9i4Vss58xBsEEEFOtlR3zCxWe38vlwp3Yk3lWYZ
	 TePQvuJM/WfLei23JiuL7ceYM1W4wetqkOvtbwdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23246F805C1; Tue, 13 Feb 2024 22:58:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0607F805CA;
	Tue, 13 Feb 2024 22:58:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB499F8025A; Tue, 13 Feb 2024 22:58:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00DE7F8015B
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 22:58:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00DE7F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=TBGTByGt
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3394ca0c874so3289621f8f.2
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Feb 2024 13:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707861498;
 x=1708466298; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhlnphO38kFK64rZw6/MYfY4vE6pLo1I8JNTrKfTc6I=;
        b=TBGTByGtTXEch/gRV6TejS9FXHK4pGq8Ox6uvEU4wLO25OOiG5ImGSH7r3OwTcMK3n
         OQavgNyRr/UyOWIjroJKVTWlF/GaPQ3BwLwx8SSHzJj7+fXZxBxM8FwHsOWNQPJje54w
         qi3yrzWL9/UlfLv0n0MUj52P4BFAWLuPW5FWMoUq8z/hBPpgzagkkI6g2WsNkaLsP4qG
         X6K+a8ujVeGmy3UJmEaDGg2k6DvjsXISN+sX9e19uL4TkK0Pf3JpcwuQrt7K5OM1VqY3
         5C5dcI+icBPUFadJOrtVYrES9xyL3nT7Oigx8cVPyM84hoT5pJqXL6EPRHZc2yF1pRyW
         XoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707861498; x=1708466298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhlnphO38kFK64rZw6/MYfY4vE6pLo1I8JNTrKfTc6I=;
        b=xDAE30drUoFTcxFPPpjckCPD2B9Wns6HMqThwJT4Rm3EzidEdVNuSXzAXoMJygMpCO
         FOQadWKoyupDvxIUahANmRqBJ7LUCjvliGrMM/tuTyOM9aXZcxuBbntdWOs96koCB7vy
         tiXqXe5CvkaP8EtEs4sH+xQ/FRcUnQWhl7t1aN1DOGG5P10WzVIrlw/W9nXWZJvJcOSv
         unaYAK5p5mWiQEjC99K2XnHvB+tG/EnIZoDriuADg0h0QyiOJ5HzrUK1T75b9JwsfFMG
         3efKlAbgoLhvybzfDzpEgSsLCJzUwDa7OPnNOSi79gb5410fyaNtZcBoeqBsgMYe1dAx
         ihfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg61+bv2zcBqB3SphPN487ZF5Smqx6TvE+u1AuCIV0WwwUkrjHfyBNu6/ldVqn/qlYTaf+qLg+ekG3fxWzPHeB0qiw7XxhmqRdJYg=
X-Gm-Message-State: AOJu0Yy73XVb8n39N6Bi7chgwPSNPWaBCMCnrP/yggszyR8r2fdowByc
	mDNYrihhUJR4l0qY8R3nrgFrgtNmabFlM3MNc3fBkibVymIBtIHP1U82qT/2vB8=
X-Google-Smtp-Source: 
 AGHT+IFZ3n4e4596jcQPvb4/M0w5BxopAfbxvEnr7lIBU6iDbCf0cnXOAXxypGjN46bUXfIJV5p8/Q==
X-Received: by 2002:a05:6000:8c:b0:33b:eef:86bf with SMTP id
 m12-20020a056000008c00b0033b0eef86bfmr388447wrx.25.1707861498107;
        Tue, 13 Feb 2024 13:58:18 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ0VVy771lMRNflwR2yXi3R6/+dub54OOGnNJcvbuYIcEQsS5QlZrroSyMaWyijwq5c2hC2NvAD1pLPuWErPD4resXTwAhLmgxRmddslpV+8WAJTZhqazEat8FROH6ieAWumwv9lwt2Yn+FPrC6KmppIxwT/69asnfrePkZYVyJm3MK8h6ONvWc4IVBliqIFds5PZnsuGbkN5YWb7v+EZ3lPaVlx8GQXS98E5BHdIkhe2fksr9g6fEQtBkmWZfjgIWHMdjABQC/Deor8k9BzNBZ/jZxeieUroSwXKpwXdAHo9GV7XRnDmuBhbRO+C92L59xtUs95jer13d1n3ZBFTan8/bDFyhPVJtW6W85pRJdzcG8SMhFTgzPnvTI9XyGvrfPCYEwTn2530CpHXZlnm58uKPeqEc/f4S8CjWah4EKiga/vB75UKu5a61ol+z+cTSNM2/+4nM0LDdsn3Xe02hOUew7hU8xN0JxTWaapP3O2LfNImUG8yZiMxgbypKxrbgjYv0pwfGsy5NiexdQymHchYp1g1/WlBYRa30jRBImDVuDC3qnO+VtTeO4PfPh4VlA4esexQfeGrSzLs05LRvxWwnxHyNEIOclcbc1msQ1BOqA/4=
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:af6b:4350:776e:dcda])
        by smtp.googlemail.com with ESMTPSA id
 r3-20020adfca83000000b0033cdbe335bcsm2415244wrh.71.2024.02.13.13.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:58:17 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 2/2] ASoC: meson: t9015: fix function pointer type mismatch
Date: Tue, 13 Feb 2024 22:58:04 +0100
Message-ID: <20240213215807.3326688-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213215807.3326688-1-jbrunet@baylibre.com>
References: <20240213215807.3326688-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MXQTMWZLGAWEVZVZB2L2QGZ7YVHFVBWJ
X-Message-ID-Hash: MXQTMWZLGAWEVZVZB2L2QGZ7YVHFVBWJ
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXQTMWZLGAWEVZVZB2L2QGZ7YVHFVBWJ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

clang-16 warns about casting functions to incompatible types, as is done
here to call clk_disable_unprepare:

sound/soc/meson/t9015.c:274:4: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
  274 |                         (void(*)(void *))clk_disable_unprepare,

The pattern of getting, enabling and setting a disable callback for a
clock can be replaced with devm_clk_get_enabled(), which also fixes
this warning.

Fixes: 33901f5b9b16 ("ASoC: meson: add t9015 internal DAC driver")
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/t9015.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index 9c6b4dac6893..571f65788c59 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -48,7 +48,6 @@
 #define POWER_CFG	0x10
 
 struct t9015 {
-	struct clk *pclk;
 	struct regulator *avdd;
 };
 
@@ -249,6 +248,7 @@ static int t9015_probe(struct platform_device *pdev)
 	struct t9015 *priv;
 	void __iomem *regs;
 	struct regmap *regmap;
+	struct clk *pclk;
 	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -256,26 +256,14 @@ static int t9015_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, priv);
 
-	priv->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(priv->pclk))
-		return dev_err_probe(dev, PTR_ERR(priv->pclk), "failed to get core clock\n");
+	pclk = devm_clk_get_enabled(dev, "pclk");
+	if (IS_ERR(pclk))
+		return dev_err_probe(dev, PTR_ERR(pclk), "failed to get core clock\n");
 
 	priv->avdd = devm_regulator_get(dev, "AVDD");
 	if (IS_ERR(priv->avdd))
 		return dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
 
-	ret = clk_prepare_enable(priv->pclk);
-	if (ret) {
-		dev_err(dev, "core clock enable failed\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev,
-			(void(*)(void *))clk_disable_unprepare,
-			priv->pclk);
-	if (ret)
-		return ret;
-
 	ret = device_reset(dev);
 	if (ret) {
 		dev_err(dev, "reset failed\n");
-- 
2.43.0

