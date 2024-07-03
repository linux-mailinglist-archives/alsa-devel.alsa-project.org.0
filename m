Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 952FF925FF9
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:16:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CE6FAA;
	Wed,  3 Jul 2024 14:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CE6FAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720009001;
	bh=DS/IDp+LqdRHE3mvtnrgUtVAz5GNkmhuj8B4aFV9euQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Np724zJa6HibaeELgzn8XDqrswpkSXpkdiMxnR7Ee+p8hLPl+/aFpSje5IG513PRx
	 cp1y2d5pychGvtQC3rnj9j1q1aH8iziY1YM+fk1mJBp3vID/J80HD9VeNXvsSqVwQa
	 NUkgi8pV6+oPkiEg2N0ixQUW5uQYf6ojKxsty240=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C15FBF806DF; Wed,  3 Jul 2024 14:14:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CEC0F806DA;
	Wed,  3 Jul 2024 14:14:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 044EDF8025E; Wed,  3 Jul 2024 14:13:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCC82F800FE
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCC82F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uAZHHVVD
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-424ad991cbbso41182375e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008678; x=1720613478;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V81m9R3WE5N86wntgnBniIBHNui3TaNJXIYWRSi4OAc=;
        b=uAZHHVVDpfwPC7bD9Mru9q02duUantYu6+IKyZ5vQwjjGLAYBbeDQc37PD6E6buCIW
         VP2nFyoULwiS3qBMpQ02G/u60yZDQjU688zIZSkE+XqofWgjh5aow4aBWOcPkJc0JPVz
         9eumhrd5qkvQ28OwwL/d+K4wmqiIXOT08moDZrqxXQHG6lZ63sLAHmAsu2TQM6cblYGH
         lBkCUi42rKZ4QirjjqG/rDzSADI9m8Kuxfwu8THTUrsZRPbF6JiZXNuGOGbjZfQkWInH
         gwXtj7o+vBfsz+gWGC44YRDYW0dm4TpJ1eBnKFr89TwHWN3e0Al3n8581bnCDUHFFMou
         3l+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008678; x=1720613478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V81m9R3WE5N86wntgnBniIBHNui3TaNJXIYWRSi4OAc=;
        b=rFbd07vXSQ84u4GCjxC/efB1p4xIWD5sOik9zN44ZjuVTYWHitpahtmQXTXBa4/qpA
         Nhflg9eysO3p4vl4npsqS61psWbJyORe27CNAlU93kBffQAwQYha9USeZQMy6g4Rmk4U
         ejXsWW8R2JT8A7VrZeArUhr8yhijZqU7BGY9ZtcNewsWO1TF/Mx0m4JDl8/diojfmCiW
         jM8A+5q2B7rc4n2D8+b4ZlW5qYxktIGAyJMmt1SB8KHhhZeGyh5ekSumhYt9TOeIuYgT
         utzUCTb9Rg15cp47WKKP68ntYzq9qr12aM77WAOG5zpcTv+SXw3eEx7y+kJKONl3w8fk
         a/0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5QxuB31QhTILuwk6vko46ABOSziGpp9YfPUZrV+D11fyIlnrDbUeu3gLix2czZHszWtmhKj1fY6oax/73kQL4dvRYkcKh+Cz8ntc=
X-Gm-Message-State: AOJu0Yywmg8VaKUJXRrzShsEq1pFljLbWbo+pVYxpi8iqRxPywizHWex
	rwFYMVuCHWdQIOTf8F/yZlfEtpltRpv8wJLOuvS1ASKqydGAOYbBkHHWXZhnsbc=
X-Google-Smtp-Source: 
 AGHT+IEy3cvbIPXgRehmrxbeY1VP2hPk71QJIpRF5k9fYxa9g3eh0P0YLDcrqZVRfqAtmQR/bgW1Eg==
X-Received: by 2002:a5d:58c8:0:b0:367:4d9d:569e with SMTP id
 ffacd0b85a97d-3677573211fmr7148838f8f.71.1720008677736;
        Wed, 03 Jul 2024 05:11:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:11:00 +0200
Subject: [PATCH 06/11] ASoC: audio-graph-card: Use cleanup.h instead of
 devm_kfree()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-6-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=DS/IDp+LqdRHE3mvtnrgUtVAz5GNkmhuj8B4aFV9euQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/WXyjhdMmNo0GaMA/nQmQHmNLei7121GkMX
 9CXdHbwkg2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/1gAKCRDBN2bmhouD
 1zySD/9moQASzEdIyJNIMW/1XTuG74QTsA+WHBfP/SMJNsQ14mbjd5gXLpmMxWJ5nTj2Tn3HvqP
 FGGryHmFFr3jexVUU5Ueq8LvG8EfsLNZLrGhJQdeTGo5CPdCR00RvhkIWBBzvT8r3ix7fltedvS
 KD79KoVa6+ARsgBCqGNmzmfaiUjsOTIyfzG4BX3lHtBoJ01r6g2HhjStY2Tp6xvqQlHvG8S12md
 pBW8QUI1YM+gk6L0L/wSzBMIb6C5q7aTJpRjY4rAP5267YeLa/m994LCzRcjHz8DYihyO3AlxfX
 wvrHCLk89XyUuS+LavCeHanMxHB0/AlaEeF8eE9vtudNWKrTFhQU0w26qVqWHq9lVw3C+jqqs4x
 GgpgQgl6k3QzHJQziZ05kyolA/N0hPYuPGBUGxjgJZVn4/q8FuaB4VYlJfmocBRNJe4kYJnUqXI
 5azhw7+mDi7iJSMQe1QazVFW0Q8M5JuEc6lRRggJ8ZH6+lTqnUn6UtPM4EQGzqytgduJXtaXm7z
 XWERZodnnF9NJ4B3YEaCO47KNoW/ZRxGgXAviKq7L8U4uaxuKV7Qgvk2rLNaqzOKAkPV1lzcmLO
 0s5ffkOj2vDYNcjqLFht/W2+R8i97qRsLWTf7l9GWinkLTZSaTTJYXVoK0fhKqpjTs4eM3roqP3
 SVE73xekq9kTZcA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: XKHQL2VGX455OXRNXOJFXFJZB6FSZYFR
X-Message-ID-Hash: XKHQL2VGX455OXRNXOJFXFJZB6FSZYFR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKHQL2VGX455OXRNXOJFXFJZB6FSZYFR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h, instead of devm interface, to
make the code more obvious that memory is not used outside this scope.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/generic/audio-graph-card.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index acf7d92d21e6..3425fbbcbd7e 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -7,6 +7,7 @@
 //
 // based on ${LINUX}/sound/soc/generic/simple-card.c
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
@@ -573,10 +574,9 @@ static int graph_get_dais_count(struct simple_util_priv *priv,
 int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
-	struct link_info *li;
 	int ret;
 
-	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
+	struct link_info *li __free(kfree) = kzalloc(sizeof(*li), GFP_KERNEL);
 	if (!li)
 		return -ENOMEM;
 
@@ -628,7 +628,6 @@ int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto err;
 
-	devm_kfree(dev, li);
 	return 0;
 
 err:

-- 
2.43.0

