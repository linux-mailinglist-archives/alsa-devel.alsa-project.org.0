Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6E28FEB8C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 16:25:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29331DFA;
	Thu,  6 Jun 2024 16:25:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29331DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717683956;
	bh=xJku9zrC1AGBM4qIss9yGk4RWlUTIUI3bVn4WgsRBgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QDIOMrmr26a3kEtULPTXJAICfGsHCakD5tkM59GUcvUKbHt2/CsJVethyBC2eqTP2
	 0iOrcVShCQdTFKJVzYED0MapFxFlVV3EvlIJYjudyoZBHglaVPUKINUDPkfvyr1pvq
	 WepoOt/yznWK2rnm7f+KOa6HHmbqHnXEEyYceqhY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8293EF805D5; Thu,  6 Jun 2024 16:25:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCF9AF805D4;
	Thu,  6 Jun 2024 16:25:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FD03F804E5; Thu,  6 Jun 2024 16:25:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB99CF80088
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 16:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB99CF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kxxr2R1C
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe6392eso1260251a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 07:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717683901; x=1718288701;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVtqnXLiuL7l3W2O7J4uf50LECKlp3bPPW+XuGMKMgU=;
        b=kxxr2R1CxQjCHK1XvRIPJOcM43GwCMOCgZJacOqig7isEjPMakOdVSN/51kRmny+bH
         639o/Yen/bSSTw8RVhFmxG31MbmpsomNLRMAbfM0IwsK97Dwplyh7mxWBo4rTr0RtHPH
         wW2sfC68UyzROq6cV2/IFIjpoGFzOb9z69TzpxAp7KRe9N/4pr5y03MVMXcMJVVo0/Lu
         cXc6qsBmCGmPVgvzFIWMvHS8b25WIKNH/oR/gxLeGHCxMTtegkveM/4KBS6acQ0BpJvn
         KY4dverMo07Rv8doCcKmNVJfUPwB7S6qRI62J4MTTWZDgl3UqMlU2BVa/0rkjnc7yEFe
         2Y6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717683901; x=1718288701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVtqnXLiuL7l3W2O7J4uf50LECKlp3bPPW+XuGMKMgU=;
        b=knTAwY3rpSMuGLvXfTEZN7hcDAOXinVpTmdN2Jd7ySQYHmYRrcyzL3jFbz4yBodN6l
         kf4iieRojLaIpoUSmZvl/srq6aAYTAm0i5LI/UszFPVPdK+4TtB6Suc41swq1zcbkbtP
         eEH5ZVEG0q28vRt+a5PP8z1VrKSw8VoHd3lzO6XYi1u45W0f+VM+SefwlGRVZGndKGvb
         U9D6q5oBMfyoGbilt/vqsewtGEKYYrn8rQ68etviq5EV2eQVZ/V35J5vElW3Z5dqNXip
         I7/cap5tLqUjm6OPa8QWLC7IXA0jhT4pd5tPOzJtWDOdS0lndZX7lA6qKKIhf7sZ9VN4
         Zx9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAiIn3hMkd1UHt1P7516TDVqOSCjWordz1yASY49f3S/M+tNIyVMYyyMI286EkO0IhGdvWK7hzIoK6Tu1h30isu2H29FwycrLuJ3w=
X-Gm-Message-State: AOJu0YwXvxkB3S03jzaitDYxe6weZ1MPl2FjU4z7nHVmOf5zoVQwQn/M
	5VxP1s4N4bY42it+f0vouXXw+5Ko570pJjRu7FeKWr6lRUo0RwoXkkmoVhmM7l4=
X-Google-Smtp-Source: 
 AGHT+IEO/my6BpSvTRKxq1xS59je88+5g73ZUGox37kyzNUmrfjMY4VeX3kfUHK+a9QRzvx7ruZs5Q==
X-Received: by 2002:a17:906:840a:b0:a68:e1a8:9d2b with SMTP id
 a640c23a62f3a-a69a024f584mr362648366b.68.1717683901196;
        Thu, 06 Jun 2024 07:25:01 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c80582110sm104953466b.32.2024.06.06.07.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 07:25:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] mfd: madera: Simplify with spi_get_device_match_data()
Date: Thu,  6 Jun 2024 16:24:57 +0200
Message-ID: <20240606142457.130553-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240606142457.130553-1-krzysztof.kozlowski@linaro.org>
References: <20240606142457.130553-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3BR4ONLMRK6IB53KES63VGIMQBCYEEKV
X-Message-ID-Hash: 3BR4ONLMRK6IB53KES63VGIMQBCYEEKV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BR4ONLMRK6IB53KES63VGIMQBCYEEKV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use spi_get_device_match_data() helper to simplify a bit the driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/mfd/madera-spi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mfd/madera-spi.c b/drivers/mfd/madera-spi.c
index ad07ebe29e59..ce9e90322c9c 100644
--- a/drivers/mfd/madera-spi.c
+++ b/drivers/mfd/madera-spi.c
@@ -18,21 +18,14 @@
 
 static int madera_spi_probe(struct spi_device *spi)
 {
-	const struct spi_device_id *id = spi_get_device_id(spi);
 	struct madera *madera;
 	const struct regmap_config *regmap_16bit_config = NULL;
 	const struct regmap_config *regmap_32bit_config = NULL;
-	const void *of_data;
 	unsigned long type;
 	const char *name;
 	int ret;
 
-	of_data = of_device_get_match_data(&spi->dev);
-	if (of_data)
-		type = (unsigned long)of_data;
-	else
-		type = id->driver_data;
-
+	type = (unsigned long)spi_get_device_match_data(spi);
 	switch (type) {
 	case CS47L15:
 		if (IS_ENABLED(CONFIG_MFD_CS47L15)) {
-- 
2.43.0

