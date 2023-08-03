Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC5576F4EB
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 23:57:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30F99829;
	Thu,  3 Aug 2023 23:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30F99829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691099872;
	bh=WCfWs79Jnovl/9teMjna0/EditpRFlhVB9Jvl+c3Mbs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FQuMGzMMsUXJpvaXonWVxg3czshchYbO/U0e7tDgM6Sf+oiOLKS39uOEkYKzw26+b
	 yhxL6Zfag81SwDM9d+LS3Cc9F1//t3JDBG72D7W0aXY4HbU3ITkdl+34GnfCSwXA0S
	 p5ea5x40HJzm73jekO72FMld8ibDp6KowqwOFm2k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9EB7F80553; Thu,  3 Aug 2023 23:56:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEB2BF80549;
	Thu,  3 Aug 2023 23:56:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 019C6F801D5; Thu,  3 Aug 2023 23:56:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D231F80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 23:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D231F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=WNrHGWva
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-56d26137095so224180eaf.1
        for <alsa-devel@alsa-project.org>;
 Thu, 03 Aug 2023 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691099757; x=1691704557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2UZl4QpAWyxcUJwZDlhPGc5WDh+5opBLbzbcmNoQ3A=;
        b=WNrHGWvajB9owXhq72vzLzjORCtYxgjEOKy3ToAroBO5cc2iVV/AOa2sGrWr0XC6OS
         F7OgtlIlUStnTLixmFI+RoRlt37gLqLiAAu1I4V/HyJUTRJXABtAv2jMTLzlNyWy8PNr
         YqGIeH8sk75ovTjISR7M3n3QbQV4vsc9WMoP8ov9sl0brrhIqHw2FVNscdzgitba0a7F
         hnfeRmxRL7gs0aA9qbFwvukrXFSyo1vgHimoSTJbPu7v+EZyPmzk0tkHeDLJF45U4ajs
         KFrY+ad2rWJwpsZPKyIm3cV5wzbAa+xL/2ocix9fblYTDcL03n5JJpRpnEHVnbS6k9Bs
         m4lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691099757; x=1691704557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2UZl4QpAWyxcUJwZDlhPGc5WDh+5opBLbzbcmNoQ3A=;
        b=JvSufTG0lLkaBIaOules2TDZuhaiFLGBZV/kAi6Rg1+tPkPBReiFMZRJaApqU9NNQQ
         iofDybSe8aEA7XXpuDJZSJKopRvLWklcdfsazX9TinlN0wwG6wBtkiMxjNYLfn08jMMm
         Bu0tQB3eEZpdOkovVQlvCmLhu8MLzkasQwia4+pUyffNUYGQtLD7ehWqlszw+w39DZDR
         6yGzyB385KOx5Ln9KFgMSm17bjEJvmv3iJOWgnLEffdr9vTVGkPZulnio6Scw/6YY0zM
         On3wiCQTWuyX5ja0b3u6MJAEgXlDlYauBGj+en/uLWLhvieYkjxTCz8jMbagsu5dcrzi
         MAXQ==
X-Gm-Message-State: ABy/qLbYbYkixdCiZAilsmzAjWxKmH8sWT3SDH2+aCJ4ymeSzWwQvZPL
	7+1Eg60G+Jk3+g48wC0d+6o=
X-Google-Smtp-Source: 
 APBJJlFHH3Qb47XCMYL9bftxfoCCIs5KfvjB0KLR6Ld/3K3C0v7ygbIViTI9b9JE7yUcKBTNwq8mUQ==
X-Received: by 2002:a05:6820:2108:b0:56c:5e21:c72d with SMTP id
 cd8-20020a056820210800b0056c5e21c72dmr14882225oob.1.1691099757208;
        Thu, 03 Aug 2023 14:55:57 -0700 (PDT)
Received: from fabio-Precision-3551..
 ([2804:14c:485:4b61:48ea:73bf:1876:eaf3])
        by smtp.gmail.com with ESMTPSA id
 w15-20020a4aa98f000000b005660ed0becesm321978oom.39.2023.08.03.14.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 14:55:56 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/2] ASoC: wm8960: Add support for the power supplies
Date: Thu,  3 Aug 2023 18:55:06 -0300
Message-Id: <20230803215506.142922-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803215506.142922-1-festevam@gmail.com>
References: <20230803215506.142922-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 523ZY62YPINSYTY4L6JVPROHVE5GP4PI
X-Message-ID-Hash: 523ZY62YPINSYTY4L6JVPROHVE5GP4PI
X-MailFrom: festevam@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/523ZY62YPINSYTY4L6JVPROHVE5GP4PI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Fabio Estevam <festevam@denx.de>

WM8960 has the following power supplies:

- AVDD
- DBVDD
- DCVDD
- SPKVDD1
- SPKVDD1

Add support for them.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Hi,

I haven't tested this. The motivation for this patch is due to a schema
warning on imx8m-evk.dts that says 'SPKVDD1-supply' is not a valid property.

 sound/soc/codecs/wm8960.c | 34 +++++++++++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index d4bc97088354..0a50180750e8 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -120,6 +120,15 @@ static bool wm8960_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
+#define WM8960_NUM_SUPPLIES 5
+static const char *wm8960_supply_names[WM8960_NUM_SUPPLIES] = {
+	"DCVDD",
+	"DBVDD",
+	"AVDD",
+	"SPKVDD1",
+	"SPKVDD2",
+};
+
 struct wm8960_priv {
 	struct clk *mclk;
 	struct regmap *regmap;
@@ -137,6 +146,7 @@ struct wm8960_priv {
 	bool is_stream_in_use[2];
 	struct wm8960_data pdata;
 	ktime_t dsch_start;
+	struct regulator_bulk_data supplies[WM8960_NUM_SUPPLIES];
 };
 
 #define wm8960_reset(c)	regmap_write(c, WM8960_RESET, 0)
@@ -1417,6 +1427,7 @@ static int wm8960_i2c_probe(struct i2c_client *i2c)
 {
 	struct wm8960_data *pdata = dev_get_platdata(&i2c->dev);
 	struct wm8960_priv *wm8960;
+	unsigned int i;
 	int ret;
 	u8 val;
 
@@ -1439,6 +1450,23 @@ static int wm8960_i2c_probe(struct i2c_client *i2c)
 		}
 	}
 
+	for (i = 0; i < ARRAY_SIZE(wm8960->supplies); i++)
+		wm8960->supplies[i].supply = wm8960_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&i2c->dev, ARRAY_SIZE(wm8960->supplies),
+				 wm8960->supplies);
+	if (ret <  0) {
+		dev_err(&i2c->dev, "Failed to request supplies: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(wm8960->supplies),
+				    wm8960->supplies);
+	if (ret < 0) {
+		dev_err(&i2c->dev, "Failed to enable supplies: %d\n", ret);
+		return ret;
+	}
+
 	wm8960->regmap = devm_regmap_init_i2c(i2c, &wm8960_regmap);
 	if (IS_ERR(wm8960->regmap))
 		return PTR_ERR(wm8960->regmap);
@@ -1505,7 +1533,11 @@ static int wm8960_i2c_probe(struct i2c_client *i2c)
 }
 
 static void wm8960_i2c_remove(struct i2c_client *client)
-{}
+{
+	struct wm8960_priv *wm8960 = i2c_get_clientdata(client);
+
+	regulator_bulk_disable(ARRAY_SIZE(wm8960->supplies), wm8960->supplies);
+}
 
 static const struct i2c_device_id wm8960_i2c_id[] = {
 	{ "wm8960", 0 },
-- 
2.34.1

