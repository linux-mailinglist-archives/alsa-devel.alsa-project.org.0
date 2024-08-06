Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADF6948E2A
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 13:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0128F3CEA;
	Tue,  6 Aug 2024 13:52:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0128F3CEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722945151;
	bh=Ezp1DEESNAuzSnaq1SG6uwRupUnI1fkxIZaCm2O+49I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fFBiL3Si+vkSsKQQ/LID3jqPpw44nEaSCZkfdBzmj9ZfGKte2qeAgLe2d4giWex3W
	 dy8oUcrZxK0eSkQTPg5r5AnMe+O4dAwlypav8oCQ72hiiOjochg3SSPewvX6FuaG1h
	 PAeZxuLbriaJ4R+hbW1z6awV5Fj2+AQIyPONwlmE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E9F6F805D7; Tue,  6 Aug 2024 13:51:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9522F805AF;
	Tue,  6 Aug 2024 13:51:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01977F8023A; Tue,  6 Aug 2024 13:49:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9843EF802DB
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 13:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9843EF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tUVb9Iqg
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4280bca3960so4166575e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 06 Aug 2024 04:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722944982; x=1723549782;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMlV2qVo85xWYVBMYhrk0PfH/1B6nF4UrxaGSSozyTw=;
        b=tUVb9IqgL+KPjIFEUHjo5h8Xt3iAmzRlVo5vNPmFSqqvK0uX+vi3G4KQ7uD/mdHJ3r
         ZbSOCUqQXJm7xqjfXurXvRTpnphoUtfACb5AF5XJwrku9wbxgArKqr3iz+60c930E+Xd
         65z6Acc3eQUwJ3JWaCwRuL27/anXuJcTD3JCqME9fi9tqqdTeqPq671Iy7zxqKHoysUl
         EexGOkP/DbUyVfAx2cePt4F9bT1pN/o2SMRVdT3wNCtEzn4EjGYYWEaXdryxFSjooeS2
         +YqtYv81GS6r8hR+v5r+t8Tf3TQcj2gMKsZE1a6y2EP+1VbQMnruQ6FK/MUq4mAbA7YZ
         rOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722944982; x=1723549782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMlV2qVo85xWYVBMYhrk0PfH/1B6nF4UrxaGSSozyTw=;
        b=ZiMHWWFzYlO3Yb0xeXItlw9OqxRopMTRDS+XmgInc06fq09owq/pCzzD5TCGo45SLz
         19KrnLGen3AUEzHG75odD79cwe2bbCchhecNYq7G85EM+RTvu1A7UBP/nQTtIcFWD1aq
         hYYNFWFvM06Wggrk0uWam125mBKzhGRDGnlARGpcmSJ6G3tGQkdxoqS0VL/+qKywY81T
         zIbEyBvcCnnPIUEHc66+Hkbtr0bG2cCnzJG1RKd1HRa5m+HzRBFPgoNFO5FVZzrgQ/W6
         MlZQhXri00D6ohzQtYF0A0h00y2A0RvG49FF4b7K35n2H+QkjHyXuypQC70aQ+G3qL9e
         8TZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDr2RsSFh4dQ58rvlVcHkHW+zSwE0l6QkZvPk/zRj4clIS49xKBe5SvrGgX508XJvrsobGc6Vz7g9TlrONvBI7EOPWeCCb/Qu/N04=
X-Gm-Message-State: AOJu0Yz5GFfTxIXMzPHHJbQdbJZA2xQGufU6vCctHUwv8dotG6vBk2DN
	gWBF7LGilVmI+43HYT6gaNZkGocGF284GX9EoaIdCVStJw8jC9+juWiobwG91qM=
X-Google-Smtp-Source: 
 AGHT+IG0OfTvajOEg5ehvoF4v0jk7nAbAB0WzN58qCZhXcth2JhU2Xeyj9qeu3b8QEUJOcwwmdcrrw==
X-Received: by 2002:a05:600c:444f:b0:426:5b3a:96c with SMTP id
 5b1f17b1804b1-428e6b78e3amr101124575e9.28.1722944982501;
        Tue, 06 Aug 2024 04:49:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6e0357asm180287485e9.12.2024.08.06.04.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 04:49:42 -0700 (PDT)
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
Subject: [PATCH 4/4] ASoC: dt-bindings: qcom,wcd939x: Correct reset GPIO
 polarity in example
Date: Tue,  6 Aug 2024 13:49:31 +0200
Message-ID: <20240806114931.40090-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
References: <20240806114931.40090-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UYYCLRF5Y7L6DSV5SYDKCQBQLF4DT7VS
X-Message-ID-Hash: UYYCLRF5Y7L6DSV5SYDKCQBQLF4DT7VS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UYYCLRF5Y7L6DSV5SYDKCQBQLF4DT7VS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The reset GPIO of WCD9390/WCD9395 is active low and that's how it is
routed on typical boards, so correct the example DTS to use expected
polarity, instead of IRQ flag (which is a logical mistake on its own).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
index 6e76f6a8634f..c69291f4d575 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
@@ -52,10 +52,10 @@ unevaluatedProperties: false
 
 examples:
   - |
-    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
     codec {
         compatible = "qcom,wcd9390-codec";
-        reset-gpios = <&tlmm 32 IRQ_TYPE_NONE>;
+        reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
         #sound-dai-cells = <1>;
         qcom,tx-device = <&wcd939x_tx>;
         qcom,rx-device = <&wcd939x_rx>;
-- 
2.43.0

