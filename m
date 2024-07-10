Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A496792D372
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 15:53:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96446DF9;
	Wed, 10 Jul 2024 15:53:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96446DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720619612;
	bh=+8JLB/iozDF8e+w8VM/0NLmlF4J+t2rdpXXcSD/AIOA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jrbkRyFEhdunm632qGoNNOOS2xk7hgU1KBkuCgJyaq7GCQWYLWBCcuGBV67fs7LhP
	 O/vPVzq8s263AQkjYr6EakdA7X0k04f+26yiWGXH2j5Jj4dgOzRbHSqF4+m4dbaGyQ
	 hRTlAxM1s/3tqO3EtQhadq9U3EqY7E+l8q6phy1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B014F805C2; Wed, 10 Jul 2024 15:52:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3074DF805DA;
	Wed, 10 Jul 2024 15:52:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40FF0F805C1; Wed, 10 Jul 2024 15:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57473F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 15:52:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57473F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wn03woi1
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ee77db6f97so90126111fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Jul 2024 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720619562; x=1721224362;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uHg8nYQlfxcs66nXgVo70Ul5Ax0CFj0CeSrnoDDNAc=;
        b=wn03woi10lI1IALcXWT181kVdmvSPFc3XGZVn6MBHRmdRpFqdqCTSdvebT1K4Ae15U
         nD6OHL+TYAk22GQGrzhQ0dY2vmzXlD9gTXUdwUr2I38FSbvgFpmJmtf78VzbPciff2uT
         AeunZzMhOJqVv+gerGRPpxqkZysvkSiPDllYN7T96zkW/8CWF/WWSabkXu28FxD2tOIl
         yVShmP6dZxv7ODwYCBGJ0vrqxR35ngdMavodso83b5mndCgmtg700BSgHG8QSweexJZv
         PIV4H4eHZZLsXx5J/xdZ4QlOH8kShu1VXcjruB4bpzRWD3TFmWCGNf6EHsAcK4uipfkF
         yglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720619562; x=1721224362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uHg8nYQlfxcs66nXgVo70Ul5Ax0CFj0CeSrnoDDNAc=;
        b=MOaJ59o+TGKHhw5O2olNOenukwEF1IVADAlGM4B+u6LMF0+98TkGIHKXrkY+1oyU3v
         OugITa5fg4ifoZ8ikv2pg86Gi1URcidPz1pazepgkxXUVPbH1f7O0zOnA3iFxuIr4Nup
         ldSn9Eh9FVHMH5cD7ruGvRLFUfLnPOkfzn6czWD5a/SY07KmqIOpbZ1JxnJ+sjNK2Ejo
         SFW1Y2wsg09h34QOq7b5YuIKfN/yuWfsXaRW0LtgozEw584mtzD8ZA8LKlMM2E7DQiX0
         hbI4xsTHwMQHTlKeqMf6sboK29HIXuqD21SJ+hW5Qdk5iXxypgfa11cLnb/zP+t0axUB
         lVaQ==
X-Gm-Message-State: AOJu0YwuLzvRxXlnwY4yQqk8Bfgl21O5iRg4klMCoCbVxtzjd1HltF15
	Mh8gnRveSQpVGcbADkkjU7+R8B5ADI1LYVL3/3I7hYHP+8mgL0Xog4HTvdLRYzM=
X-Google-Smtp-Source: 
 AGHT+IHQ3wTw06WNOicBulp0LREDgkQYwv8xz/Jvw664H5KQ2mPhohhSVRmLd/HfsG+DjZXAvFB4aQ==
X-Received: by 2002:a2e:9852:0:b0:2ec:5843:2fb8 with SMTP id
 38308e7fff4ca-2eeb316affamr46824141fa.42.1720619562504;
        Wed, 10 Jul 2024 06:52:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a8551afsm160440366b.166.2024.07.10.06.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 06:52:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 10 Jul 2024 15:52:30 +0200
Subject: [PATCH 1/4] ASoC: codecs: wsa881x: Drop unused version readout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-asoc-wsa88xx-version-v1-1-f1c54966ccde@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+8JLB/iozDF8e+w8VM/0NLmlF4J+t2rdpXXcSD/AIOA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjpIkusTqm9cHV9sziB2w+LwJj8kGVAW/ZbhjT
 NACmdqp9yaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo6SJAAKCRDBN2bmhouD
 1ymCD/9iwi9TkwR7xPLUX40Mlnv4dq9p3GKVP1NC0C2tDNGbYpr7aM/EGwdodgWD5CWNsZnw9BT
 gxDyZ1xojOFS1zTZGyfCfkPrK1S2rBM1nn+h0oyGVWZ4JUZMAq6TMqVkOSY5ugS/Aq2JIzGc1Lf
 9Oea9NGDKvvVxnY5t85fRmHhiUbSSjpIpdu67FVamw1fO7hzJ8Fz1mqcoyrkuqG5RCqgRCimvC1
 FPbOOSrkL9GElTjBP59MN2rR1W84dg5JtV+LLetvzb3B2mWSvNofgqovM6U6/gov4Zmqz+FbeCb
 cx6T3OOBWFjn3iamR+JzoRtyWNugjagb4+qafu1ANK9p6HI5igQH4Vs+QSgOQFTEWKn39WDUSVO
 Ozj1vUoNPw5IjqScYXaGAVWMUsRis0tMN/jQTdGowWj3HEQSfgRckDQDSoDE0m3G0MqFTEzB3LB
 lEE+GJk/Ud52A6DQ757eWlBPXzWIY/uQVhwx0mgSH9uVBzHp8QTxj1ZqhGQqwiIlJgq+7P2QwAY
 XQ8YMa9kPSDjwrBqiZq4kc652/WHJxEHQ+vPqJF1MTh6QLOnR5Uijo5xmBaJg9iSUwS7CVaoZHP
 hY/d4ilfUNOLFu1LWv6C8NNROB08OLpNYQyQSO2k5FLsRPTPQzNaMseS6U0C7rw5ipF2AwrLYM/
 F6RWcahzYIK+4Fg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: ADXLDYHKR5GXB4EXEOY6RLGECUKJCDR6
X-Message-ID-Hash: ADXLDYHKR5GXB4EXEOY6RLGECUKJCDR6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ADXLDYHKR5GXB4EXEOY6RLGECUKJCDR6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver does not use the device version after reading it from the
registers, so simplify by dropping unneeded code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 1253695bebd8..22df50041104 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -680,7 +680,6 @@ struct wsa881x_priv {
 	 * For backwards compatibility.
 	 */
 	unsigned int sd_n_val;
-	int version;
 	int active_ports;
 	bool port_prepared[WSA881X_MAX_SWR_PORTS];
 	bool port_enable[WSA881X_MAX_SWR_PORTS];
@@ -691,7 +690,6 @@ static void wsa881x_init(struct wsa881x_priv *wsa881x)
 	struct regmap *rm = wsa881x->regmap;
 	unsigned int val = 0;
 
-	regmap_read(rm, WSA881X_CHIP_ID1, &wsa881x->version);
 	regmap_register_patch(wsa881x->regmap, wsa881x_rev_2_0,
 			      ARRAY_SIZE(wsa881x_rev_2_0));
 

-- 
2.43.0

