Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 293EF6E5AE0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 09:48:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20573E82;
	Tue, 18 Apr 2023 09:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20573E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681804132;
	bh=PVV912S4Xoyy5K6KTIPk3ilhr0riYluJO70872u9vAo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t6a86S8ZPX3AfWTuiHWvUvuqzY8kuWOLCtYNqaI5y2Xx+AzmnV7wA0R73RB8OHm9n
	 Nu0ThH5YxvNzwWu8yy/6hvjcyiNFxeHTzWiFrM1p/yvBq6Pj3I+sNZRX6hIHl7h9Mj
	 A+9QyjsaSbGUVcahPq8DAffXi/8QT3ew9S6PhuZ4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F2EF8053B;
	Tue, 18 Apr 2023 09:46:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C882DF8019B; Tue, 18 Apr 2023 09:46:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2ACD8F8019B
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 09:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ACD8F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JIXcMkwq
Received: by mail-ej1-x630.google.com with SMTP id fy21so27819671ejb.9
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 00:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681803996; x=1684395996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSTh/SJop5c2Us/dQwQInLvSKG2b28WOhmpUgImXSN4=;
        b=JIXcMkwqYs0HXlx9VovWlfO/IO9++uYT98RcF6INoHP4EgPbfvGOPQK1wUAQELPIdB
         W5T7j/au9BAmdU7nOY6jxXvLUxudGbK1t1mOIpCUqZRqqnzCUwe2ix1fZ9h7oXecqx+r
         PyJKJspYUymwBkNi7sFxN0azJce4VLjL0qv2hLFOauSfxPl5bOIguOqqj+0sWIW7s3qx
         HqN3ScBUfGn9fW4WGfbxWWhkGmHcR5o/US0p2E5zTGOoGQXMVn+jna9bK+zN6Qh9rUAl
         K5mxSbz9fS89h4O1enbZ+FldagCVrl9P7cAvtfb9NI2aB7WETL6ND2nVlMSBtEl0Qz6Z
         /ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681803996; x=1684395996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSTh/SJop5c2Us/dQwQInLvSKG2b28WOhmpUgImXSN4=;
        b=Hi0rWldYdWdrBjhkCfDTEabfkiJPD4iq5M0QpttZOgLL7T39/2DvGAt5d2y2Rl8Hyp
         gxGMeq/RI7JIWD00InZI2wCMnA3Db3MBK9DVYrc+VUoxnRsG0mu1HhGzcbXvpE5HYXi1
         DH25kxELspZxWwDz3nZUVFiO//lXjegKPcvC/qJL6AdeD3A70n3eHHCzvs5GVaKI3vr4
         2In1qf8Yv1fyHPEHhQ/jT0Mb1RNnOSnqBYDHRT+80uiDpFTXzJ0SUD16YwgO6hzGFj2m
         ey9G6Y4yLej0y/7WtxNP3t86lVcNlBQd9YLniA/F9FW7gqMiugGuJSE/Av3mLOubSt1T
         w5MQ==
X-Gm-Message-State: AAQBX9do/fEajdOY9M0ixdw1sz5wbzYSH+iFzGFIPrQDyP0izrCqaa5E
	RWv1zWdr3ONWKrAeuZDp6sdzPg==
X-Google-Smtp-Source: 
 AKy350aFbYeUj+m3sjqAo982f1YulOZ6YRhgeEz5UQC+6oQsPQ9qMNORKSSgrLdCZEKgnbCvHw3jVg==
X-Received: by 2002:a17:907:2d09:b0:94f:444c:fc25 with SMTP id
 gs9-20020a1709072d0900b0094f444cfc25mr8326449ejc.12.1681803996664;
        Tue, 18 Apr 2023 00:46:36 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id
 sa39-20020a1709076d2700b0094f410225c7sm3731993ejc.169.2023.04.18.00.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 00:46:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] ASoC: codecs: wcd938x: Simplify with dev_err_probe
Date: Tue, 18 Apr 2023 09:46:30 +0200
Message-Id: <20230418074630.8681-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230418074630.8681-1-krzysztof.kozlowski@linaro.org>
References: <20230418074630.8681-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3NKP3KQKPKOCYTAN5TOVYXNJDUZAY4PK
X-Message-ID-Hash: 3NKP3KQKPKOCYTAN5TOVYXNJDUZAY4PK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NKP3KQKPKOCYTAN5TOVYXNJDUZAY4PK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace dev_err() in probe() path with dev_err_probe() to:
1. Make code a bit simpler and easier to read,
2. Do not print messages on deferred probe.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Re-write commit msg.
---
 sound/soc/codecs/wcd938x.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index f033f79ed238..11b264a63b04 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -4235,18 +4235,15 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 	int ret;
 
 	wcd938x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);
-	if (wcd938x->reset_gpio < 0) {
-		dev_err(dev, "Failed to get reset gpio: err = %d\n",
-			wcd938x->reset_gpio);
-		return wcd938x->reset_gpio;
-	}
+	if (wcd938x->reset_gpio < 0)
+		return dev_err_probe(dev, wcd938x->reset_gpio,
+				     "Failed to get reset gpio\n");
 
 	wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
 						GPIOD_OUT_LOW);
-	if (IS_ERR(wcd938x->us_euro_gpio)) {
-		dev_err(dev, "us-euro swap Control GPIO not found\n");
-		return PTR_ERR(wcd938x->us_euro_gpio);
-	}
+	if (IS_ERR(wcd938x->us_euro_gpio))
+		return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
+				     "us-euro swap Control GPIO not found\n");
 
 	cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
 
@@ -4256,16 +4253,12 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 	wcd938x->supplies[3].supply = "vdd-mic-bias";
 
 	ret = regulator_bulk_get(dev, WCD938X_MAX_SUPPLY, wcd938x->supplies);
-	if (ret) {
-		dev_err(dev, "Failed to get supplies: err = %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get supplies\n");
 
 	ret = regulator_bulk_enable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
-	if (ret) {
-		dev_err(dev, "Failed to enable supplies: err = %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
 
 	wcd938x_dt_parse_micbias_info(dev, wcd938x);
 
-- 
2.34.1

