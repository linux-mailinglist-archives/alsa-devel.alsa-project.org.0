Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF227FD5C0
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 12:31:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B13CE0D;
	Wed, 29 Nov 2023 12:31:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B13CE0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701257478;
	bh=9D4eSW4UN3pB5KIo9Q3SbLZVvVHr5a6Q8vZOvVgeSpI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bvAvyjgynAbY3DHuvI/bAOnqCSOVfluxcMJet1M4gjyqM1JmnKRlGQzf7w3lm+Hh4
	 p+xdfmUi9UNTE9xJN/r9TvZCRAdmFmd+iAxCfRV2qBBIQwPyA/m8lAhE5KjtTD3Qiy
	 CUlDP63/1Nczpy6j8XqHFICyHWricvT5DReNPsZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3CFFF80254; Wed, 29 Nov 2023 12:30:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58CA5F805BA;
	Wed, 29 Nov 2023 12:30:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A1C4F80236; Wed, 29 Nov 2023 12:30:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD41CF800F5
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 12:30:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD41CF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tfI9St3t
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-54b7ef7f4d5so3976703a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 03:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701257418; x=1701862218;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5PpRWp/0m/xWdvHLqY46oTCz3fciQWVaXGN2a0hf71o=;
        b=tfI9St3t0FzrY8b85gxvLqaRF7DGJ1Xkq4kizrmxH/RZb6tIfk/eWWoSB965cLyFee
         1HiEy6gi0JqGiEQRrs4xqriVvU9pGCnkFztPqaVmfmdQ1cKr8CBBPZ31tknqgP6LVW67
         wxFpWuFRb/dpeEfKQInC4naQvKb1GbmKE2ntWiYRwgNefndtPWsAuiebZW4tVM0F33PJ
         szXVfg2uSmdP+BIgYzlbYbnF/xpuC4W9LZhAwUKZBz0znAEw+1rWK3QuaO13tVstQCHC
         PMO2J2rKOZ9VgY09rE36Ddc7frGPownkqEVJtN7b2KlZ4wulSkdbAtK3/RtmDlMBAAix
         4oQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701257418; x=1701862218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5PpRWp/0m/xWdvHLqY46oTCz3fciQWVaXGN2a0hf71o=;
        b=AjrcWsSlxIyz+2lQo4a0dk3r1aXpHSWUt5c1Z1lJcKmv9ZMhB4MZF7BFpInvQfoZbz
         qhgkgNgn9stSYD8xh/28D0oqeqq1OpS5yxZlMvizsvmSvqr53OArUOQ7Z0KnDLOnV0jc
         uuYbmWhwBc3LTqC3AN/M6MJgHDo9Dyo1sx2pZP3bBz8gEpnd24zFxmt2jUkoozSkp6iX
         Vd1sylLSJ89eANktyZXkChUYdnpk86RFCvvZUHxFi0A/e8EaBWGLfpUCh+RU9x1fqxmz
         7Hnqd7SK5/BnSdmTfH964vBAo4gOEMHIJ9NmjVpoU6SEQngt4uusiphmC7GcUUV/LYpz
         0AYA==
X-Gm-Message-State: AOJu0Yz0zTup7NaqyQizFdHtpfHRCBpKckle5e6cBbb8GMVPpQ89VEwy
	ZrcnbZIwu4hu4Ojk6ZBv+LqI1w==
X-Google-Smtp-Source: 
 AGHT+IGbP5HyFHFVjrl6/DXNoynkgfMp56NuMHTtlRoK03FAheE2R3knt3zZS32ZUham4wZO8PA/lg==
X-Received: by 2002:a50:9994:0:b0:54b:3457:a656 with SMTP id
 m20-20020a509994000000b0054b3457a656mr9592023edb.25.1701257418541;
        Wed, 29 Nov 2023 03:30:18 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 y5-20020a056402440500b0054af224a87bsm6213829eda.33.2023.11.29.03.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:30:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 1/4] ASoC: dt-bindings: qcom,lpass-rx-macro: Add SM8650 LPASS
 RX
Date: Wed, 29 Nov 2023 12:30:11 +0100
Message-Id: <20231129113014.38837-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KY3N5ZQWXOQTGLMMCTXXTZRYQ2PDOIOW
X-Message-ID-Hash: KY3N5ZQWXOQTGLMMCTXXTZRYQ2PDOIOW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KY3N5ZQWXOQTGLMMCTXXTZRYQ2PDOIOW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for Qualcomm SM8650 Low Power Audio SubSystem (LPASS) RX
macro codec, which looks like compatible with earlier SM8550.

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
index ec4b0ac8ad68..cbc36646100f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -11,12 +11,16 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,sc7280-lpass-rx-macro
-      - qcom,sm8250-lpass-rx-macro
-      - qcom,sm8450-lpass-rx-macro
-      - qcom,sm8550-lpass-rx-macro
-      - qcom,sc8280xp-lpass-rx-macro
+    oneOf:
+      - enum:
+          - qcom,sc7280-lpass-rx-macro
+          - qcom,sm8250-lpass-rx-macro
+          - qcom,sm8450-lpass-rx-macro
+          - qcom,sm8550-lpass-rx-macro
+          - qcom,sc8280xp-lpass-rx-macro
+      - items:
+          - const: qcom,sm8650-lpass-rx-macro
+          - const: qcom,sm8550-lpass-rx-macro
 
   reg:
     maxItems: 1
@@ -96,8 +100,9 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sm8550-lpass-rx-macro
+          contains:
+            enum:
+              - qcom,sm8550-lpass-rx-macro
     then:
       properties:
         clocks:
-- 
2.34.1

