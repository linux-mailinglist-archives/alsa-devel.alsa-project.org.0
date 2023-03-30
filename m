Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BB16CFC31
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 09:04:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D80541ED;
	Thu, 30 Mar 2023 09:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D80541ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680159890;
	bh=EpKZhIjWmu4Z3qY1Qsy+NlRjzvWwDLzZlsCWL64G/tg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uZ1o3CjfFB94tkH8kt5G4XoIlaLDkVdC6CYszir0FOSffiV2hnr7MFmEcyB3Ftb9E
	 oBlh8g/dEFuzibAR5a0C4iORp2ppoLg9E+S9yc/IqgAgrRnAoBqA7tDbVpd7h2F2RJ
	 mH0RIoce4oPC57bdKBdHGERjhBxUNqp1E46deJfY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 572D9F8024E;
	Thu, 30 Mar 2023 09:04:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4430F80272; Thu, 30 Mar 2023 09:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1824AF8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 09:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1824AF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=axOEcx2S
Received: by mail-lf1-x130.google.com with SMTP id y20so23300637lfj.2
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Mar 2023 00:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680159826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b4Bb5GX+FMlQrfFYYOGtNxySJjTQGtWiEDeRjZZCDOc=;
        b=axOEcx2StVb58YNriRAGg9TE9X8Qyz/E81tNpwlLZio4996hAhzfrW736X8NP+UbYN
         5jEovPDXc6bUjOpzAWrPO0oHqdFWhtZW270LQkLxVYL/nFAJR0exUikcMyr9IPtcLvaO
         MgAnp3mEL9MfKZaRn1yWqCKB6ZMOIzqlRmnipXwVtv1/kUS4KfYl+YIPzv1cEOz7/4pU
         xZLM4xQ6CQOBjWe4akb42KEQOdAauFeuP7jnTSvyHw4Di7nQ6gbquhNZmsCLFgfSCqqV
         JdjbXEnYBRvC10parnWyUnl+Ba4BoHlZJG0JIp3TKyj7sFeU6o/K8YgX7J6vfURiouqI
         UAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680159826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4Bb5GX+FMlQrfFYYOGtNxySJjTQGtWiEDeRjZZCDOc=;
        b=H0xjb4XCk8FHi9oo+QkmoJSj3yDRkWws4W7fxZ7eOiO+fkfbPHvJLssBeMn0hq/H82
         mZRvcaCne8zXGdq5QB33jJ+BZwowZJf9DQfTpjLP0Ps9JCmol0Hmdpv42Ov3yLV2PPHi
         1zxyJFIF9IIDVPcl8aEizXg/m3CXDyzdvfSSNhKv60UxYHN6jumncI3dNbXLn9EzDo3N
         J5XvNx0xcgVyxyxelpe680KamkT+sZm8vOTNHjbYOehLZVjvCYG6/mWmCQDYo11G0hJo
         sim6lKJEvHEdwq0XjUjxOQWq0IDqO7glvxNclhy8qgdAZ24mt0IuXE3Yo1mueqG/W4E5
         IjqA==
X-Gm-Message-State: AAQBX9dKqUV+sUEtYFPwQOY7A154folbuo9AEqpIc7V+z/Czm40gKwzm
	gx5DkLNfC9rBpmSr8lf8g2EdcQ==
X-Google-Smtp-Source: 
 AKy350YZiokYUbkODadn+Xnup62W1KHlFr+bEB6GBWiAojf0zCSjvFeDAc1NaWwuJnOuIl4bmta8kw==
X-Received: by 2002:ac2:4c17:0:b0:4ea:f227:c1d6 with SMTP id
 t23-20020ac24c17000000b004eaf227c1d6mr6518049lfq.67.1680159826438;
        Thu, 30 Mar 2023 00:03:46 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 q29-20020ac2511d000000b004eb09820adbsm2243637lfb.105.2023.03.30.00.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 00:03:46 -0700 (PDT)
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
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] ASoC: dt-bindings: qcom,lpass-va-macro: Add missing NPL
 clock
Date: Thu, 30 Mar 2023 09:03:42 +0200
Message-Id: <20230330070342.19448-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q2HKCX5MQLSRIZUEXFHGKSQBLXWJC4WP
X-Message-ID-Hash: Q2HKCX5MQLSRIZUEXFHGKSQBLXWJC4WP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2HKCX5MQLSRIZUEXFHGKSQBLXWJC4WP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several devices (e.g. SC8280XP and SM8450) expect a NPL (Near Pad Logic)
clock.  Add the clock and customize allowed clocks per each variant.
The clocks are also required by ADSP in all variants.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v3:
1. Only rebase. Other patches from this set were applied:
https://lore.kernel.org/all/168010864198.3244592.2114017565664183933.b4-ty@kernel.org/

Changes since v1:
1. New patch.
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 68 ++++++++++++++++---
 1 file changed, 57 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 608207152a02..4a56108c444b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -9,9 +9,6 @@ title: LPASS(Low Power Audio Subsystem) VA Macro audio codec
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -31,16 +28,12 @@ properties:
     const: 0
 
   clocks:
-    maxItems: 3
+    minItems: 1
+    maxItems: 4
 
   clock-names:
-    oneOf:
-      - items:   # for ADSP based platforms
-          - const: mclk
-          - const: macro
-          - const: dcodec
-      - items:   # for ADSP bypass based platforms
-          - const: mclk
+    minItems: 1
+    maxItems: 4
 
   clock-output-names:
     maxItems: 1
@@ -64,6 +57,59 @@ required:
   - compatible
   - reg
   - "#sound-dai-cells"
+  - clock-names
+  - clocks
+
+allOf:
+  - $ref: dai-common.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: mclk
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8250-lpass-va-macro
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
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc8280xp-lpass-va-macro
+              - qcom,sm8450-lpass-va-macro
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
+            - const: npl
 
   - if:
       properties:
-- 
2.34.1

