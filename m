Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2824B916EB6
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 19:01:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AF2E950;
	Tue, 25 Jun 2024 19:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AF2E950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719334887;
	bh=LPxzSDIC0bWWiTuwSNjSkbPq6ilg698BH/kDijwxfsY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MkJdicwUpIkgGmrNwx8wD1OHw9DcKiys63QgAxRR+iZDhYxoaxKCdaofpq/pUUInf
	 W9rpexmne+Lyo0coKoaY1WVLwdjdwpigjBRCCci5wbq4ZB5Cq4PZVvxQ249S6jvn8N
	 ryvR7B2t8OPvkcCpXsSS/tWHflmUEuovTU1P17dQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F53BF805AF; Tue, 25 Jun 2024 19:00:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5760FF805B0;
	Tue, 25 Jun 2024 19:00:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3C12F8049C; Tue, 25 Jun 2024 18:57:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 899AEF800ED
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 18:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 899AEF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=w9sAqUg8
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52cdf4bc083so5045282e87.2
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 09:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334661; x=1719939461;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j1XpUiv8RRrKO5F/X4U0smbjR19Jj8NAdavi9RRkoig=;
        b=w9sAqUg8QkS5G/yUJPamIuZ51vnp1WaXohyjKTLjdR86yq2U1QYKPXfpeeQyBVkk4i
         fSArsz4WEgqcp+Sa0084UofViCE65P9hUs8VlJCAeY78Dks0JsY6xlCHCxwbLSrWG9me
         DifexBaz6Q4P9He+QBzKdOqVRJTCc8tir4qL8Cn4jMRxpTlPRzsOqM9iHl2pY3ihXH0A
         XOwsCYcsQhr5Dcw1gyRhpmnzZxQCJuGlJll/9MseMu4n6B33OFpReX6xDwWIhqT9Pi4u
         otzykwHEwYPpGG4JYBHmvPw72HXs32N2l4JxfR255QmHxNCG2xovUIALAV7fqhXqUgdX
         cRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334661; x=1719939461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1XpUiv8RRrKO5F/X4U0smbjR19Jj8NAdavi9RRkoig=;
        b=USbGtyysztE+HeW/yrrw5qmOOhVA2Nvkp70K0bNZTWRkEJgmjr2bAdp+1RS2OjlO5o
         BwZHYG8gHezp1DNYAzEC8MVRpovP6v0DZetd6wuo+rLLs8juM27rBSNjzrZA6WE9iqDG
         J4HLIolsbzx02Q+lbCU7rywXqxUGVh+8F716nrkkx/r/1p9oviqKcWELCuPaU7wI7iaY
         76D0gbKW1r98nen7+sDrFmkKoB1pvPBgW4Xuz5mjsktmV1Vb5TgAIZy8AZvI6v57Ut8Y
         Ll6VH69Mlf1HPLSiqV74yNCTvm9atHZHWnoc68Eukws2htD6oTxjov69U76CxqsWBUew
         +Ajw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoJqxNrRroMlscp50ec0FpM9ewLO2+wZEj+PII7HvMm/w5VP4EhxN2HTZMKj6S/NJ3rNFj7AN7Mn3yqklA3BOly35mH+ynxmUpvDM=
X-Gm-Message-State: AOJu0YyVjuk+sbObc9Z92m2JJqA+oN9XeJOzJa5NyGJg2L7g+m65g/kn
	hmGpUeCiG8Qm7PPH9erJOhC5V41rh6xuPnCmX0ifP4IdSpUFq1T6Kci7tZrGN0pasQxSAzvt1Lr
	t
X-Google-Smtp-Source: 
 AGHT+IF+dVYgyh8tXVU2XlGCKPydiP8H7EHqIFJAhnmGeg7Yj/64VIHLGroClHUHimYmWRgI8KJmSQ==
X-Received: by 2002:a05:6512:70c:b0:52c:e054:4149 with SMTP id
 2adb3069b0e04-52ce0619798mr5410849e87.15.1719334660778;
        Tue, 25 Jun 2024 09:57:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8cb6d2sm13360519f8f.111.2024.06.25.09.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:57:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: codecs: lpass-macro: Gracefully handle unknown
 version
Date: Tue, 25 Jun 2024 18:57:35 +0200
Message-ID: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7XC2KSXN5TULJ2UOU72ROUX52HZRPKH4
X-Message-ID-Hash: 7XC2KSXN5TULJ2UOU72ROUX52HZRPKH4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XC2KSXN5TULJ2UOU72ROUX52HZRPKH4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Qualcomm LPASS macro codec driver parses registers in order to
detect version of the codec.  It recognizes codecs v2.0 - v2.8, however
we know that there are earlier versions and 'enum lpass_codec_version'
has also v1.0, v1.1 and v1.2.  If by any chance we run on unrecognized
version, driver will use random value from the stack as the codec
version.

Fix it by mapping such cases to an enum of value 0:
LPASS_CODEC_VERSION_UNKNOWN.

Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-macro-common.h | 3 ++-
 sound/soc/codecs/lpass-va-macro.c     | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index f6f1bfe8eb77..94697d0ba8c9 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -19,7 +19,8 @@ enum lpass_version {
 };
 
 enum lpass_codec_version {
-	LPASS_CODEC_VERSION_1_0 = 1,
+	LPASS_CODEC_VERSION_UNKNOWN,
+	LPASS_CODEC_VERSION_1_0,
 	LPASS_CODEC_VERSION_1_1,
 	LPASS_CODEC_VERSION_1_2,
 	LPASS_CODEC_VERSION_2_0,
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index ae80865cd459..f9262d7d2c26 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1463,7 +1463,8 @@ static int va_macro_validate_dmic_sample_rate(u32 dmic_sample_rate,
 
 static void va_macro_set_lpass_codec_version(struct va_macro *va)
 {
-	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0, version;
+	int core_id_0 = 0, core_id_1 = 0, core_id_2 = 0;
+	int version = LPASS_CODEC_VERSION_UNKNOWN;
 
 	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_0, &core_id_0);
 	regmap_read(va->regmap, CDC_VA_TOP_CSR_CORE_ID_1, &core_id_1);
-- 
2.43.0

