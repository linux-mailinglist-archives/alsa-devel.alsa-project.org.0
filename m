Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182B6916E18
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 18:27:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 933ACAE8;
	Tue, 25 Jun 2024 18:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 933ACAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719332825;
	bh=LVjZ47687PxS3iFKdhrNIBTElhvjuA83Mgge5wOGN3k=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vOPJWKeudaOErL5towNFkqoqGh56JOFQsmvvhG0JnY+hhOGAdTTYWXNVmhP+po5Cj
	 woOpRpFl5hWbeSTPfC/T/8HaYa8vpBbSn3yscCuApRP/299mB84siTTTL5/Ahr0bp/
	 t4sCquBXuktK4y1aG6ZaoWHmfGgM6MaKBL617F4U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5721CF80587; Tue, 25 Jun 2024 18:26:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA3C6F805B2;
	Tue, 25 Jun 2024 18:26:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24530F8049C; Tue, 25 Jun 2024 18:09:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74E73F8013D
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 18:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74E73F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DCqegLXO
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a724598cfe3so399573466b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 09:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719331578; x=1719936378;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DbBz/UlSDHmmQE9XJzoYyy6K5428MNeACZ+/dAMQ9N8=;
        b=DCqegLXOGeDHU2slFpgYY93WjISRQomfXZJpzoqeRH/T4a2IfralJViD1Y7BUgn5aS
         30I2tXTpbuY3eoi5fJRFQ12t997yDMW4X4KQvI8DinIf7ICDxeiaEYlpgk7/k+Z8Zc7H
         KjZ2ono6qLpNFmxnvtuLUrt+99dG6kLpLerQN+j7nHUWIqbowsOM4A6D6nzAvJZbF2mP
         7DmmtCrN//BgkasqUIS+fJUPhxwd+7VeA9ydbUXzOBaiYxXb20bORkRc0e4YFRZJwLXp
         kac/XwGR53zOOEl8zKwD6Zth116ZwqqkFWp6n2PlNUa2WkgxP7kGKABOhmK/pgvPZPs0
         vTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719331578; x=1719936378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DbBz/UlSDHmmQE9XJzoYyy6K5428MNeACZ+/dAMQ9N8=;
        b=uMXHqQeuDzd+MYdClt4+7TMRPH7OoX77X+fx3nfQHNqgtiYOnZxMkc8H+veaEfMWWi
         pECwGaKwstschtqKhpKV/KWCIUA4zQiL3NHymYys0QwuoYP44VfpIFDWuokXnrwAe6xO
         jOLh9iWi05uy3eatN0RQwHAC/MaIHYfZzkJf5NC8yTrSPEBtHA9bQZlxfSmrGlpYyf8Y
         MXwI2X8sw+On8fxOufY/VU14DDNO8vVjos4rtUOIMaNDeHtkyHZoCmEqmgnMDfCG41l0
         N7kddZ8Ki5jaxj3nHFZDp5IfBBJug1Y8pCrqk0slustsWfyrudMcxtyh/5ci1G+7SXVn
         gZkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3iAa3jvLpH5mG2DmCLferqaCnVH6qIYRJjWu7NeaIuyuoEYQ2gXAsZatJJI0/1tdCwuugWZlsxcq98hxEA4LGfS/fxsJrBpbZfvY=
X-Gm-Message-State: AOJu0YyyeICtTL/kcN/WPi5eUsznI92mEcqLr9byLkhxyrNsYkiNG6zn
	+7f/11xG+jgLSfZJ6x9dEg+VbnrWnIxPWqhwoJGvyC/Dx4GXz0nQ7KbUwO3o99k=
X-Google-Smtp-Source: 
 AGHT+IG5pxrjRiSGtKXXcaujES4bHVw1Q9Xh73VMtvmgJPjR5I4xLxhhFfkpqfCUKfVMEnurVpstpw==
X-Received: by 2002:a17:907:c787:b0:a6f:b6c3:fb30 with SMTP id
 a640c23a62f3a-a7245b84f56mr796716166b.7.1719331578008;
        Tue, 25 Jun 2024 09:06:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30535010sm6066987a12.59.2024.06.25.09.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:06:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: codecs: lpass-rx-macro: add missing handling of v2.1
 codec
Date: Tue, 25 Jun 2024 18:06:14 +0200
Message-ID: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3A6E2DAQRCSNUTHTWNQJFMI2MONSJGLU
X-Message-ID-Hash: 3A6E2DAQRCSNUTHTWNQJFMI2MONSJGLU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3A6E2DAQRCSNUTHTWNQJFMI2MONSJGLU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We have also v2.1 version of the codec (see 'enum lpass_codec_version'),
so handle it as well in all switch cases.

Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 00ecc470ba8b..1c3429f004ed 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1601,6 +1601,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
 	case LPASS_CODEC_VERSION_1_1:
 	case LPASS_CODEC_VERSION_1_2:
 	case LPASS_CODEC_VERSION_2_0:
+	case LPASS_CODEC_VERSION_2_1:
 		return rx_pre_2_5_is_rw_register(dev, reg);
 	case LPASS_CODEC_VERSION_2_5:
 	case LPASS_CODEC_VERSION_2_6:
@@ -3639,6 +3640,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
 	case LPASS_CODEC_VERSION_1_1:
 	case LPASS_CODEC_VERSION_1_2:
 	case LPASS_CODEC_VERSION_2_0:
+	case LPASS_CODEC_VERSION_2_1:
 		controls = rx_macro_def_snd_controls;
 		num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
 		widgets = rx_macro_def_dapm_widgets;
@@ -3812,6 +3814,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	case LPASS_CODEC_VERSION_1_1:
 	case LPASS_CODEC_VERSION_1_2:
 	case LPASS_CODEC_VERSION_2_0:
+	case LPASS_CODEC_VERSION_2_1:
 		rx->rxn_reg_stride = 0x80;
 		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
 		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
-- 
2.43.0

