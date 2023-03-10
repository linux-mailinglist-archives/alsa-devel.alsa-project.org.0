Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 089446B4058
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:25:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5091A189A;
	Fri, 10 Mar 2023 14:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5091A189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678454710;
	bh=ima4IHqVZOJfDwanAmncSDMCsvurQ0bgCKhXhaTy4Ss=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LLoJpoZNa7aQ6wCbirfP7EIkMH0tJyM/kakWRXbwqKNKtjSq2n5IFCZZm8n7GxEhh
	 Tj+slznXCjUaQuQpqqSDTsVhyP9ifipRgeUmHu6/gcSIQZUXQmedEyIUuo2wQGUp+O
	 hi7vu3p50LydZ9QBG42LAmLXbrPBO09KgjWWLG6g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72ADBF80558;
	Fri, 10 Mar 2023 14:22:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4718F80533; Fri, 10 Mar 2023 14:22:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C779F80431
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C779F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RER2Rx5g
Received: by mail-ed1-x531.google.com with SMTP id ay14so20251995edb.11
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 05:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goKtutnQ2PFd8NfCZ2pE04cCvKUKzYAaQ26RIq4NWcQ=;
        b=RER2Rx5gJ5R+wduk0rXzfE5ryA2rbohjb7XXb5g/kkl2V2gOITdv2x91WBUBe7GyZu
         gzQbl+KyFVnkjtsfyt9c8aTcZ18c1l+o5RLpBbGD68Ni62VRCbISEs5sNNCcsi+36g4f
         2vVyUQ1J6lHFysa2mx7T/qGJ+l0ANCp4QCkyc0QDHgTG5l7m32OikC7JGiDQLVYgfyCH
         XjJe4M3wPRViScfkziAQb7/3RSrIi3jjT8TWv2XSG1eOnKcUU5ncO7NE6gh93BC8K+lC
         CFJiG/yjDHOOGiz9uglm9l8ev1HtlL2Y2sK6FaFJcbDq30igz/dR79IR18o3dXzc3Ke9
         /7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goKtutnQ2PFd8NfCZ2pE04cCvKUKzYAaQ26RIq4NWcQ=;
        b=uA63UZc9jDeS78g66R8v/ElMLcIR9X8u9cL3otOCZLWlhEf7ohIXB3f1JEM85Y3v8p
         19+zCyktjB4+uOV4dtdmaG69xsjtpO3s7Wm0uOdhyXNSmtpWGCpQ/HHlMUoQCDB1jjTS
         W0wQ7gA6PylqjdGEDTUFNIsEILU4kuzh3SoHf9tco4Gdk4hD/kE0UaNOZs9QgE31VpU8
         JN2GJ9t+HB8OwyNjw7TlNOo7Apg9P6zx44UjcYKcerIuuEiduElo3xzYKhsRDuWhwora
         lPuKmDnCZTDRrbNpZSvYzfXaDZxay6m33zPN/4Jvc4ee2tqQFu9wNWEKCbhQ5JgJulI6
         mkVA==
X-Gm-Message-State: AO0yUKVffyRvZN6eFUDVlNvWrtZymuboV9qgMYltiN89UbaP5R7/W/Tt
	uVAztrat/2+mZmDo4d+Xi+M5hg==
X-Google-Smtp-Source: 
 AK7set/7m+fKbY/1jI+CUKTq8FToiMZNX8tVAOxvsseLOOiw8ysUD1u+jkKI1OdVBofqe2vcOObR+g==
X-Received: by 2002:a17:906:1ed1:b0:8e9:6f9f:7c2d with SMTP id
 m17-20020a1709061ed100b008e96f9f7c2dmr1874600ejj.35.1678454531631;
        Fri, 10 Mar 2023 05:22:11 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id
 zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:11 -0800 (PST)
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
Subject: [PATCH 7/9] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8550 VA
 macro
Date: Fri, 10 Mar 2023 14:21:59 +0100
Message-Id: <20230310132201.322148-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L6I4IM3YGFUWT7P56OFBUBMSLQUU2J36
X-Message-ID-Hash: L6I4IM3YGFUWT7P56OFBUBMSLQUU2J36
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6I4IM3YGFUWT7P56OFBUBMSLQUU2J36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the VA macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/r/20221118071849.25506-2-srinivas.kandagatla@linaro.org
---
 .../bindings/sound/qcom,lpass-va-macro.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 528b677a439c..4a56108c444b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-va-macro
       - qcom,sm8250-lpass-va-macro
       - qcom,sm8450-lpass-va-macro
+      - qcom,sm8550-lpass-va-macro
       - qcom,sc8280xp-lpass-va-macro
 
   reg:
@@ -110,6 +111,23 @@ allOf:
             - const: dcodec
             - const: npl
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8550-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

