Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E9C948E2B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 13:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4799D3969;
	Tue,  6 Aug 2024 13:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4799D3969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722945132;
	bh=qAxAXkSzlzsy3YZMDd8hkLWqB7BSzVrCOez5JOG9HB0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TEHDZ4ApaCXblCWj5Gg8+C4Gzz0CVNYnrIXVIwVyt4m8WcfO5MFJDyJewxGKfYWtu
	 Nib0wn/iJ7NHpu5B+JkkcjZt/bvr55FGUZ+wcPRBZh9Dvi0soanzEaF8dBGhhh4o6a
	 SBmxs9kAG5o0FdCN87Ii4A0mcpj1Vw7U8H0ZRaXo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BA36F805C0; Tue,  6 Aug 2024 13:51:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2781F805B2;
	Tue,  6 Aug 2024 13:51:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FB01F80448; Tue,  6 Aug 2024 13:49:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BE87F8023A
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 13:49:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BE87F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mECr8Xqw
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-428141be2ddso3658825e9.2
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Aug 2024 04:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722944981; x=1723549781;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+W/spHaH4ZPrFJzwLUAvkjiFq7Yei24v520B0MhGrw=;
        b=mECr8Xqw3a58qUEP8p1bD6zWmY6yR9VYHp6HvQQERH0P1QQQiOwLVOXQNV2nkY9T/x
         8Svomq5H+plXOr0qic0BqjcI43mqixVBZbKca9piv1uDg4XFL3EbrhzdrfboHzMZXj1j
         xb2oTmOemwJfqvDS/1+jv7AE2QxZ2cQsNyLGNf7O2F8jUcVzOS2UwvZRjmsVDtNbOqbh
         yug/gmF5scBD+ceCq2+oFi+pobsflH9daV9L+o8EdZ3Yhq8Eb2OieMKuKm3n+RkmvY9c
         rD0MEN0DesC8r3CA+Mmzqqg1qBH532MJR8xXVNPdfLPIECoMWszXM5T66aqE3Qhfgjps
         pSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944981; x=1723549781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+W/spHaH4ZPrFJzwLUAvkjiFq7Yei24v520B0MhGrw=;
        b=qkkVU6mjlAj6ir7hqL6CfeRXmyVoPUJuTgqfWWzSv8O27AcdQb+LDBITqXW6V7kMLd
         rJwpQWWkK5dTPpZUx89OkyelcXBiBjmbGWa6nb/0XvGxAb3l4l4uuChqr7VVzST86gW2
         5QC2whuNYXC+wGMyIRdeBK4n+wt0iq2Tn9dTmG8r9xbiOFW/r4aldRigJE0cBPJwHiSI
         oERJJT2ygyAbwNoXQ3VVna+USaXC0AhbjKG5PPEhQOKEc7f5QR/dx0x5S2NwugrD1fVS
         6P1Mn3y5cDWlS3oLSbQw5LV3M069fkiWsr0Sa+geht4whqM15cutrmHBpQWEnkpvckdr
         Dbug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWikVwUqZCML3V/XhvIgP8l5bmOgBZA16/IEDD4bM4rVY65F7QAvDnFwVoBQSB2vdT4MvjrRb1l3C40BEREA9OK+0PK3WppHdfHFgw=
X-Gm-Message-State: AOJu0YzOTmGTb7tBgCvqhCiQa4ARxOORNBZh63LoozAR3d1njFTu2oKh
	gON9kUn2ImegS4Ngzb2/2B93Jg8lEaSzapaIvDjBFNRKpJ+xRfRdiEN05lGcuO4=
X-Google-Smtp-Source: 
 AGHT+IF2nxOVw8Nfp4RadNqv6qJ7oMtw9VFIh5K7+RrZpNtzMo+RT0FI7T/1iBoDUzrE75hfcrLE1Q==
X-Received: by 2002:a05:600c:524c:b0:426:5ef5:bcb1 with SMTP id
 5b1f17b1804b1-428e6af80aamr99654155e9.6.1722944980982;
        Tue, 06 Aug 2024 04:49:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6e0357asm180287485e9.12.2024.08.06.04.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:49:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] ASoC: dt-bindings: qcom,wcd938x: Correct reset GPIO
 polarity in example
Date: Tue,  6 Aug 2024 13:49:30 +0200
Message-ID: <20240806114931.40090-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
References: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2JJ73LH3BZICQGUVATFYSAJMKCFCG2U5
X-Message-ID-Hash: 2JJ73LH3BZICQGUVATFYSAJMKCFCG2U5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2JJ73LH3BZICQGUVATFYSAJMKCFCG2U5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The reset GPIO of WCD9380/WCD9385 is active low and that's how it is
routed on typical boards, so correct the example DTS to use expected
polarity.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index cf6c3787adfe..10531350c336 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -34,9 +34,10 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     codec {
         compatible = "qcom,wcd9380-codec";
-        reset-gpios = <&tlmm 32 0>;
+        reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
         #sound-dai-cells = <1>;
         qcom,tx-device = <&wcd938x_tx>;
         qcom,rx-device = <&wcd938x_rx>;
-- 
2.43.0

