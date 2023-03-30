Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7911B6D034C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 13:35:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D0A1F4;
	Thu, 30 Mar 2023 13:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D0A1F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680176107;
	bh=LJbRZy/hYyUHUDqg7BG9Pzna5GDkSSvGwKWWSY6OZZ0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rcJqy5njGwoVlaJFr8i4+2jCPkGPngcy/2M/b6rvQKaMy5sNab6SMpYARvY5d9g+p
	 +biqAg3RxjEGbvAwXaamxw+9SseJj2N/osQWwneNmslnzslNpKy+VLSnH5Y/5l/xzu
	 FJru7KFoSG+1P/TpPicYuqVpwvUUo6jGfEJs+VhU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81275F8024E;
	Thu, 30 Mar 2023 13:34:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52DBCF80272; Thu, 30 Mar 2023 13:34:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EB02F80114
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 13:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EB02F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=m5vCBuGJ
Received: by mail-lf1-x129.google.com with SMTP id g19so10975496lfr.9
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Mar 2023 04:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680176049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cYbYycdmup7ooDPSWSxlw+wfKu3e5N7WtJR3yxq44lc=;
        b=m5vCBuGJqx23A5v6T6OBZyfULIxy1bEKyorWAYsxthAaAh8Ux79BG67VzvWO2dAw0v
         HzpXSAVyZlV2PXHkKaI9klWO20uBj9Y5D9PiqlGESLiioNu4mewtsVuUhmj6rC47FDMQ
         9R2Fcwg1NptgNmfG2JthKxOnyGHykCR9X0F0eTCJCL7SaUWDTYJPwIokZKQpvuriFr2K
         z45zgkJGpZZrkMTfsNjmatrlCjCt0MYqw/kQVZeh9hDAQi5mrHJAj9RnJ8DgE2Leke+E
         1bppdiJVzOtkLqBNWEd+L3Vz+45u3whZeUa9Kr5aL82S5GIEBheMp2UQw1QbOocBzLcx
         NQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680176049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cYbYycdmup7ooDPSWSxlw+wfKu3e5N7WtJR3yxq44lc=;
        b=PgM9b0RLnkGi+uiCn0sKp0jlyT+wZT5s4S4AubF3J93ErixlXueHSLeq0pCNUkeklw
         jxZfErxyQ2InPzCoklk81b3ogJS7aiHq9DpVq992IMBSHCklUIhsCzKhJMw2Ui6r4IoH
         pipgUE6uZY1FVuN6Ur2cZv2B9OX/J4HEFBNiS4cCgmKenFjRuBva23ukvFtGd61rcv2Z
         K1+MxaYCabt/MJeUWzX1IKE3uGM5TTnduTCzQLzNLIdBFkzuGGKUpccdkNNwEsAtHQq8
         +0o4kYGrl1md91vV/j7ov6Sof5AOj+0pzUIlskQ7J/h6ICVLeJfAX3PRPiLU2S82tJRL
         u1VA==
X-Gm-Message-State: AAQBX9dX8bXyNqiELjWgvJefXYJDnZQtkan2J+w3SfQD22STNaNSC1C9
	ZV3Z5X9DXy8bxvoLo2zrT+x1eg==
X-Google-Smtp-Source: 
 AKy350a2EDWQYZVhflo+GOFEPA/WWu3pQ/gL6jWPerrjJR9OygRe+bysk5u936muBYaB+ATgDKZ6jQ==
X-Received: by 2002:ac2:5623:0:b0:4eb:c24:205b with SMTP id
 b3-20020ac25623000000b004eb0c24205bmr4787726lff.69.1680176048706;
        Thu, 30 Mar 2023 04:34:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id
 21-20020ac24855000000b004d5a720e689sm5877690lfy.126.2023.03.30.04.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 04:34:08 -0700 (PDT)
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
Subject: [PATCH v5] ASoC: dt-bindings: qcom,lpass-va-macro: Add missing NPL
 clock
Date: Thu, 30 Mar 2023 13:34:05 +0200
Message-Id: <20230330113405.55722-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GJUY3VFWHD6VSRRNH6H4NSIUGHTXDOK3
X-Message-ID-Hash: GJUY3VFWHD6VSRRNH6H4NSIUGHTXDOK3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJUY3VFWHD6VSRRNH6H4NSIUGHTXDOK3/>
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

Changes since v4:
1. Rebased on:
   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.4

Changes since v3:
1. Only rebase. Other patches from this set were applied:
https://lore.kernel.org/all/168010864198.3244592.2114017565664183933.b4-ty@kernel.org/

Changes since v1:
1. New patch.
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 68 ++++++++++++++++---
 1 file changed, 57 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 4cf778e3afdd..4a56108c444b 100644
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
-      - items:   #for ADSP based platforms
-          - const: mclk
-          - const: macro
-          - const: dcodec
-      - items:   #for ADSP bypass based platforms
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

