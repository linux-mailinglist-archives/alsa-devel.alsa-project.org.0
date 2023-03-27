Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6D26CA5BC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 15:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B97E2832;
	Mon, 27 Mar 2023 15:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B97E2832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679923547;
	bh=DMDNr5L1HeLn7Eg709LVMRKvOruNj7poKMeRRbKV5fk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ly3xjHc/11KdVOWW+xl0GCYYN0/ZwpEvc5G4R25VkDt9IIVPDNH4pKRZxJm3kNK2a
	 iGUbOKD5yyx6/9FRiU1ko2MAFKz/BHpPMmYM5Sd1hkxbOz0Nri6z+ZTyEgD+1X2Y6y
	 wkzOFOHkAh4yplQ19yhZLT/a8rYWHYgI9JZht3Wg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A5EBF80563;
	Mon, 27 Mar 2023 15:23:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB527F80533; Mon, 27 Mar 2023 15:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4AD8F8052D
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 15:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4AD8F8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tWrKDhnZ
Received: by mail-ed1-x52a.google.com with SMTP id t10so36046415edd.12
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3h2EW4IkC/IhJho4gz7j5uQBbsCW60DmV4AKGgO8D1Y=;
        b=tWrKDhnZ6AGETvmeHspz3EI2jNfpXQCcKz6vH7eFhOXGDhPAYJ1Ph39gX1PYLGiAaK
         ZCY9dcC5NlA1YaM3wcUP6PDbzj3MdHXo0l0jk3oQ4qKk4SbDLREYPdwGNC13x1j9xKQr
         uWJpKsT25yZNLP95Zv6vU/9kCWKXC6jF+fRtww+yDvO+DF2qeyOhTzADxTO+/zH4TZXQ
         ZaF8lhZxJXuHr+nEPb4BLTZCzXCY8WnzSySgwN4V1hVRW7w0Dyu/LcGBfn/iiltTD5Xk
         +F1WZfT1krNOlarDbwsSHAT1yuDUHZ2Oald4vmswgI3nNmAthkpZTCgEPHOi6KRhr+/T
         of/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3h2EW4IkC/IhJho4gz7j5uQBbsCW60DmV4AKGgO8D1Y=;
        b=yxSbb5ymw6y7zrX4K5cc5iv4b4zqu1ZYOj/ILiUsoRWewNJoDWPourblFvh3HFwT9d
         ajfIRWLuqCTDKChMDa3EykgwwdN36FejOJaLqpgDXDqFYJJ/5pTWntRKfjSuxrWNFjQ8
         97Yr8uXC+l4U+nwLjp0kxb/aMsX80CWuFkgBLZtjefkAdsWbPf/ozF0qwTdaFbf8jCwI
         i8KP7YQvYlcHfXUTg5JW11wvbElKCzXOPt5NHAbt08hIJaWBx3qkUKLfxDUWcnjUlP1U
         M0jFEms99s2jXZWPRrA8BY9a1GhpAbLsrEe5lIoFKoNwR4hg8nOQkn9hSCwRnuReu2xz
         pP0A==
X-Gm-Message-State: AAQBX9e8FYec8F5jQ2EiTFTDj2k+HZ3i4bhCiH3MR9FhWU5wjgrINKg7
	FOPzSNNkinP+Lz6CEM09t5x+UQ==
X-Google-Smtp-Source: 
 AKy350ZJqDj58+VXAULylaQnvX/jFbNdWA6zLvHxp5BuYYqU7OhYiBa0XnryAcFW+5/p8jwi2hqTVA==
X-Received: by 2002:a17:907:d22:b0:932:5b67:6dee with SMTP id
 gn34-20020a1709070d2200b009325b676deemr13660233ejc.27.1679923399821;
        Mon, 27 Mar 2023 06:23:19 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:19 -0700 (PDT)
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
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/10] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8550
 WSA macro
Date: Mon, 27 Mar 2023 15:22:53 +0200
Message-Id: <20230327132254.147975-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C6S7N3SKIPOVDO2MYQPTGRG7TACMKKBG
X-Message-ID-Hash: C6S7N3SKIPOVDO2MYQPTGRG7TACMKKBG
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C6S7N3SKIPOVDO2MYQPTGRG7TACMKKBG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the WSA macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 66cbb1f5e31a..eea7609d1b33 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-wsa-macro
       - qcom,sm8250-lpass-wsa-macro
       - qcom,sm8450-lpass-wsa-macro
+      - qcom,sm8550-lpass-wsa-macro
       - qcom,sc8280xp-lpass-wsa-macro
 
   reg:
@@ -27,11 +28,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 5
+    minItems: 4
     maxItems: 6
 
   clock-names:
-    minItems: 5
+    minItems: 4
     maxItems: 6
 
   clock-output-names:
@@ -62,6 +63,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -89,6 +91,23 @@ allOf:
             - const: va
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-lpass-wsa-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

