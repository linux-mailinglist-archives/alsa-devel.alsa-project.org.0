Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A96948E25
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 13:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D883C388C;
	Tue,  6 Aug 2024 13:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D883C388C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722945062;
	bh=c3lLdrRtY4V+BRsUGT6/6tMSRh9ZQZeDQGE6aMuniG0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fezVwAyB78AqaliU351WLw/rIWt5lD6NCm9eoiRsORrSlSGUBSFR3ec2J9mYmc5OF
	 N6LDqUnuaPu7WjsFB062aCDOIgUNQb8XDWWx8sY4K9GNXAFMAnyJUJM2kmRGvjzKP5
	 7C+dqDG4cLJ5bHbRGhw82yS1oCZVAgjy6m0HfzgM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F996F805AC; Tue,  6 Aug 2024 13:50:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05C35F805AB;
	Tue,  6 Aug 2024 13:50:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C45CEF8049C; Tue,  6 Aug 2024 13:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84811F800B0
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 13:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84811F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZQPXoZ/v
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so3508755e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Aug 2024 04:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722944978; x=1723549778;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kV0Yieskmet+YpNp74afVHBUJdlYUWak9w5VSG2Hzvo=;
        b=ZQPXoZ/vh3Vl87OSSoTe0hXkCbrT+no5b/a4gU8Tr5BRL7g3YQDmGdsmcNO+5pIrKD
         1ijGqCyVTBotkiJWbrrQ/RkqwH5iG+w7B+Z1kg44wjLAE/38E/o7DsKPZ7iVAQ5uDyyp
         XxswRRs8O8OU9ZdZ5VlNQLbzYTJRhxypcXZnCxHth0SNTL3b0Dt6fEbNj1HyCKlDjX26
         0MudZckHd4cdmC8hngiiTa7YS1AzCB0giOmnkvzlybrswbzTCYY8wYj6FbqGblfKyHOS
         avlT/wkbw1ctlOA5EKzcIVLm09H8T5M6EEq7V5CF4OcI0sUZm4GIywPSmXU/OLVSDao7
         eouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944978; x=1723549778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV0Yieskmet+YpNp74afVHBUJdlYUWak9w5VSG2Hzvo=;
        b=LSwYBVbAAnHk5cwQFcdQVwSOMlJkso0fkwAdGhPwrEVaiLot6g7XV4nhLHszvqdRc+
         BQiGcoLPRQbQrlCXjsArT/7PiYVBR8VpBgaHvzsmS0WASLYUFIEe1OdoGS1Z2aAHOmnM
         g3gQyJ8Vps1v4YOabqJb2KE1iiIKwua91B9wSMafX1Wm9fn3Qq0mVFn/cQ1YmTUck/3U
         ogJaSackVNR5H+y9FXsdvLjHn0SCREZ6Mq+ysLJWDcwkDMWiJ/amQFtFLYZZrD3WZCFW
         2u0TPHzsWxl05FGvuimYjM1yQAi7uETsuFyYykkbo1NAxhdQRK7T45h7GTVRJ1iQGOKi
         fi7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWz4CqhYkLiTQFZzOdrddkVUuwnjxhtQ5/yMXD+aECt9KxFpZANoQoLBp7l0uaoPDj5Ujvj6H7M1IbHDDceGuTXrP9YgaBm1sZvFCE=
X-Gm-Message-State: AOJu0Yx29EXNRnnesRRdNd4Grt6n+btfQjCJVSVYtE02fzfiiUHO2JJH
	VapWBmGfqeGU98jrftFGH7oWhfNKelt23BsIV2N0yfplpO4U2CiiO7jSVh1/YxE=
X-Google-Smtp-Source: 
 AGHT+IG6f1zuYkR8BiWbt1DwVLwptX02kZYv79SfSpx5HpKdmiMF2N9rQ48DNHj2wxnv0s2vMhHcaw==
X-Received: by 2002:a05:600c:524e:b0:426:51ce:bb14 with SMTP id
 5b1f17b1804b1-428e6b7f4abmr94039055e9.30.1722944977757;
        Tue, 06 Aug 2024 04:49:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6e0357asm180287485e9.12.2024.08.06.04.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:49:37 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH 1/4] ASoC: dt-bindings: qcom,wcd937x: Correct reset GPIO
 polarity in example
Date: Tue,  6 Aug 2024 13:49:28 +0200
Message-ID: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YJK43LI2SR76MSLHKQ7VH4GGFUC2UJEX
X-Message-ID-Hash: YJK43LI2SR76MSLHKQ7VH4GGFUC2UJEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJK43LI2SR76MSLHKQ7VH4GGFUC2UJEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The reset GPIO of WCD9370/WCD9375 is active low and that's how it is
routed on typical boards, so correct the example DTS to use expected
polarity.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index de397d879acc..f94203798f24 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -42,7 +42,7 @@ examples:
         pinctrl-names = "default", "sleep";
         pinctrl-0 = <&wcd_reset_n>;
         pinctrl-1 = <&wcd_reset_n_sleep>;
-        reset-gpios = <&tlmm 83 GPIO_ACTIVE_HIGH>;
+        reset-gpios = <&tlmm 83 GPIO_ACTIVE_LOW>;
         vdd-buck-supply = <&vreg_l17b_1p8>;
         vdd-rxtx-supply = <&vreg_l18b_1p8>;
         vdd-px-supply = <&vreg_l18b_1p8>;
-- 
2.43.0

