Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C292D376
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 15:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FBAC847;
	Wed, 10 Jul 2024 15:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FBAC847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720619647;
	bh=jEk16JQFT0IAvURH2BypgqgsTIx/BJn3KXaiR2tgfp4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ul/VM2mtCVAOWOsskCtXpg2sDaHwAPqj4r81qoJ0u7KsS6BUdRZfos/N6kzMcA4xp
	 jzT4sRcr8c3f6IdQLmFlDX9NzDvVh2hl7ivcyKiovfWfCPrTCdwCwSGb679EmF99+y
	 cNqfY1Nlcqc5xziHCk9Cppr89ldtluPaGCaBMYPM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF10DF8060E; Wed, 10 Jul 2024 15:53:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D53F8061D;
	Wed, 10 Jul 2024 15:53:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2533F805D7; Wed, 10 Jul 2024 15:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F75BF801F5
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 15:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F75BF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=viyhyJb4
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57cf8880f95so8352050a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Jul 2024 06:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720619565; x=1721224365;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slbrxxj5rb9E58CEYCsM+P7UiVj11eTUBnO9G+P7KZc=;
        b=viyhyJb4iW5uf0JkbY/bWTfC401wez1FtJugtHcISt6mncceJVWAaBpnf2MSLRBjsc
         VLrI9gLa826GZuk6ns3Zyqz9FJQcI4wlhp1v6bw/oTjd0oUb+mhHj9sZWhbZC8hFpd8M
         peMdvSuNdaRNcVIuG5mAlwX8b9z8x7yUTkl7j0eyrLv2PLorLgqpdOlYqmzkQcVCV2P1
         TbY5/PDdLzSJWfFAZiPNKdXAezOWaJ4bZo4S22kE7d2yVf54OSh6dkW1eVn+9067w/go
         jt/92oJ0viuDZJNMkLHrqn4dXA/sGtZp7jpIPPk+hfQHBQwFJ6TmBcwO0wFTGFfm69x7
         jBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619565; x=1721224365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slbrxxj5rb9E58CEYCsM+P7UiVj11eTUBnO9G+P7KZc=;
        b=e31b9AQH+2OZng6z4Z0yExu63YogrfjXILOS55+bjoTFVHgkl7P5tjNhnPB8fiWi+j
         S6AxENDPJ8Sajrc9lupB/QuSc5AFd+M1wqE6DSY9CGoRyxBBcuVTQW0piNnMTeeZsq+b
         t15eJTnR9J7KvF5WXLlZ/0fyjvnzXEML32ZAYjQkI7yDBTfS6tjCz5fRMV7+xHHD3KpP
         I1Sa4CZAFqHiYsCHsvgOCYx/1N6iO3DzFmdhz4Q6SdgFQde5wAwAfOEm16ltNS0hBD84
         uMnkSFs5KAOlmilvPCPsjTfRuOazykUV3rwyLnIEePUgZamrDXHiI1yDOpVxlfZhsyjt
         h3NA==
X-Gm-Message-State: AOJu0YxETx5xLfu0jZo2MKzj7ypqg1HMJsvzH+iiKClYe82xYpjrEZtC
	AUMeDdMTzMoIq9stWaoA54E7sTNjkwnqeo6muU6/ZlBDaySLRSE1X1c4l7E1pu4=
X-Google-Smtp-Source: 
 AGHT+IEKMN2BAmzuOkKYboabNS9K1iF67rmPiNfGv71WggM/iASILIt6zY8AU4pXkJL1/oEkdkd06A==
X-Received: by 2002:a17:906:f592:b0:a77:cf9d:f495 with SMTP id
 a640c23a62f3a-a780b7010a0mr599191166b.40.1720619565419;
        Wed, 10 Jul 2024 06:52:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a8551afsm160440366b.166.2024.07.10.06.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:52:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Jul 2024 15:52:32 +0200
Subject: [PATCH 3/4] ASoC: codecs: wsa883x: Simplify handling
 variant/version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-asoc-wsa88xx-version-v1-3-f1c54966ccde@linaro.org>
References: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
In-Reply-To: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2199;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jEk16JQFT0IAvURH2BypgqgsTIx/BJn3KXaiR2tgfp4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjpIlOgCYWfv4QovLUr9t2eeUmCY7lvvKDS73A
 VovMzO7Si2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo6SJQAKCRDBN2bmhouD
 19O3EACDQ8/ZgiJhxAwvdrYT9Y2yfZkcfzRJ2uk1DlBttj+8mn4kHwjx/iLc7H/P5lTj30Wu8NT
 Kaey6f2Q0xWYAxn+yx/nDwJwtY2ZKb5xmdf4Hko7bSsXDDL3VJRpV5kg6whjscNB8jmd1uraTVA
 cbdnHVXfICieiv+Ixsykpx94arFN5WsaAAynMv6hNwv3HT7d19ZUFFrqPnndTX0TAa2f/sWzbaF
 Dp/dsk/oUufHNz/X+C1PkKIQNCNMDkNmBqL8mUrymEHcb5BrFaSvYIIAdyNFt0FBOIizc0L+xE0
 U7dLgJnJifAz+vhqPJCHBWM/DCmTQue7ezM/P78hHj92oGcNidqlM7RGMhc+pJQ69/6wS3JMk9K
 2tamTHAsZ/JGa4bWBfqJ3eWf0atekroeY5xmfkfIyCNCORkgFCPhbnhntCjVgAox8ZB1beblCzQ
 Z7cZC4o2WvAOzROymQz3GrgLpB4NuO4I9vwIKVgwjGxXSuS9N94fsWZtJRI3F1PP5VKjsyrDmWv
 apyqKSVAyseJP+HqRHWIlWFioigECh8ZvnR2jXmiYRzF9tI5Mac0UC70pW/lV+JTL88+QA+wtbg
 5FQf5ARkfSONAFlt/QW91s+MqPui5LEFFoqLiQRVwIXITx+7FhFgPQXqR27WJxmumNXZR2of/Uv
 7zTxJXk/P9DlhKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: DFJYIFX77BG3DVVKUDQIRTLUAMRA3ZSP
X-Message-ID-Hash: DFJYIFX77BG3DVVKUDQIRTLUAMRA3ZSP
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFJYIFX77BG3DVVKUDQIRTLUAMRA3ZSP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver does not use detected variant/version variables past the init
function, so do not store them in the state container structure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 60b78560f4b7..0692bc39308f 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -438,8 +438,6 @@ struct wsa883x_priv {
 	struct gpio_desc *sd_n;
 	bool port_prepared[WSA883X_MAX_SWR_PORTS];
 	bool port_enable[WSA883X_MAX_SWR_PORTS];
-	int version;
-	int variant;
 	int active_ports;
 	int dev_mode;
 	int comp_offset;
@@ -1005,29 +1003,28 @@ static int wsa883x_init(struct wsa883x_priv *wsa883x)
 	ret = regmap_read(regmap, WSA883X_OTP_REG_0, &variant);
 	if (ret)
 		return ret;
-	wsa883x->variant = variant & WSA883X_ID_MASK;
+	variant = variant & WSA883X_ID_MASK;
 
 	ret = regmap_read(regmap, WSA883X_CHIP_ID0, &version);
 	if (ret)
 		return ret;
-	wsa883x->version = version;
 
-	switch (wsa883x->variant) {
+	switch (variant) {
 	case WSA8830:
 		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8830\n",
-			 wsa883x->version);
+			 version);
 		break;
 	case WSA8835:
 		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8835\n",
-			 wsa883x->version);
+			 version);
 		break;
 	case WSA8832:
 		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8832\n",
-			 wsa883x->version);
+			 version);
 		break;
 	case WSA8835_V2:
 		dev_info(wsa883x->dev, "WSA883X Version 1_%d, Variant: WSA8835_V2\n",
-			 wsa883x->version);
+			 version);
 		break;
 	default:
 		break;
@@ -1038,7 +1035,7 @@ static int wsa883x_init(struct wsa883x_priv *wsa883x)
 	/* Initial settings */
 	regmap_multi_reg_write(regmap, reg_init, ARRAY_SIZE(reg_init));
 
-	if (wsa883x->variant == WSA8830 || wsa883x->variant == WSA8832) {
+	if (variant == WSA8830 || variant == WSA8832) {
 		wsa883x->comp_offset = COMP_OFFSET3;
 		regmap_update_bits(regmap, WSA883X_DRE_CTL_0,
 				   WSA883X_DRE_OFFSET_MASK,

-- 
2.43.0

