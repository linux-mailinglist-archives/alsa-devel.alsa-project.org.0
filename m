Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C08EC8FE08C
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 10:07:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A36DE84D;
	Thu,  6 Jun 2024 10:07:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A36DE84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717661263;
	bh=1y0aJBMNzzU/0LQjfOvpee00DXAiGgdtWGL31QFkJrc=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=HbNMtxTgG0Qj4tOPfLSWShQa4DIJKGbkSQKkvhrj+mtQJofR8WIp94QErjA5jnUb7
	 yuHR9aDK43l0B49Be+xI+NPIiQFfchxlFx0l/wG2rfmqtw5jqEdbsk2vGJ0+A2zhGV
	 eYKHc8naY5ohus4BWiYwqi5Sd1XrvrjiKY6BVb+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71A4EF80587; Thu,  6 Jun 2024 10:07:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D63C7F8025A;
	Thu,  6 Jun 2024 10:07:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A019F8025A; Thu,  6 Jun 2024 10:07:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5822DF8001D
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 10:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5822DF8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Nk6WgXEq
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3550134ef25so680082f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 01:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717661220; x=1718266020;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u7hiYkj91RUaU+iS0uljhHNfGcki3QtOOpKSiUyUuf4=;
        b=Nk6WgXEqYW5Ra3Fm8Okq3xQyEEQjL5/FJESK0vMbU4dNkAp3mp7xver3KjufZYeNZf
         dPVEX/HUQiq0NVJ16omIO0oJs7LnjAVaGMzlWTbbFWGJLiMxySapHO4rPR4s3y6qOsi6
         C9IDLlC6mo0wkKAtZGKLjuVwGMzO9gSuWDQRUG/qB6g5u6ZupU47SAFRtPrx28+0d27I
         UsJMzFGrD4i4qHOPQrrIieeFGqsKHbf7aKEOtCvBcjQXqiT/EK0+vSIzoRy1sDO+XWIw
         VaiY5flQ/EWRIdoV5Kr+qaP8AX+ijS7RNVnMmiBy9bIbKw9oxvcejQZOfIha7xht90Qi
         +zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717661220; x=1718266020;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u7hiYkj91RUaU+iS0uljhHNfGcki3QtOOpKSiUyUuf4=;
        b=bt4196cpU3gJGVLeedtVNasqID1crdZvtnzxMFdd45Hl6jDFEUqvO7v7W42YMRdTa5
         HyWS5J4OunU1X2W++O6Wtn7wADukIJH+93CzMboDOcTDzCSxltcKTXmLXVXX9HxeTlxn
         ITu9e1JPqlUyavb0ANFccFyXKq/AWvFMujAUE5iFvnbciTcma4t3XRrNfEptqz4mWQLb
         v8L9pssFxQPKY+/DiEUKkhBrzw609f5p9R0bOaHgVfpM7bBCbqKuMxjc0lkAlyStGuZp
         siIgvV3v2eNlvpkmvTwAdA+pGIy9EYdEsUhw9m9DpLbKm3QAlROLX5O2arYtJUmm8mj7
         dUlQ==
X-Gm-Message-State: AOJu0Yzu+MWi7KwuydHvgBOhxStNWf+om+fRhoE4CzgTOKz1IyG6XN1+
	Ng2WKdANrSGnv+n2O/74nG13UKcfA2bfsED0RkHtwDN+UX9nBdbKc+FqZgBhvY8=
X-Google-Smtp-Source: 
 AGHT+IEZYO9oq1GhQAcOgxg+qi6W3zUjN5wlcTNOdZBAx1Esog+GP3ZmqjC+yd5zkil3a/PtA/bsPA==
X-Received: by 2002:adf:f00c:0:b0:355:39d:f82 with SMTP id
 ffacd0b85a97d-35e8ef5f8efmr3724702f8f.53.1717661219564;
        Thu, 06 Jun 2024 01:06:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e989besm861205f8f.76.2024.06.06.01.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:06:59 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Jun 2024 10:06:58 +0200
Subject: [PATCH v2] ASoC: dt-bindings: convert amlogic,g12a-tohdmitx to
 dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240606-topic-amlogic-upstream-bindings-convert-g12a-tohdmitx-v2-1-70d44fa30790@linaro.org>
X-B4-Tracking: v=1; b=H4sIACFuYWYC/6WOQQrDIBREr1Jc95coMZiueo+ShdFf8yHRoFZSQ
 u5emyt0NbxhmJmdJYyEid0vO4tYKFHwFcT1wsykvUMgW5mJRrRN10jIYSUDepmDq/peU46oFxj
 JW/IugQm+YMzguNA1PNmF8gZWyaaXquNWKVa714gv2s7d51B5opRD/Jw3Cv+5/y4WDhxGJbnhv
 UTR8sdMXsdwC9Gx4TiOL3m2HqD7AAAA
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3894;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1y0aJBMNzzU/0LQjfOvpee00DXAiGgdtWGL31QFkJrc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYW4h9Jzln7/TviHyxOE5x5rMDExs9dXnNCJXaGS3
 u6lM2XiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmFuIQAKCRB33NvayMhJ0ZD/EA
 CU3evx4cxhODhk+lefwnpVuu5JQUFqdnm0RFajEvCjdkk6pyM4dAtAS7LwQiZQlWqsFHImZN7sFKLh
 RpA+AHshG8+uektkvJdA5EXvjBF5iaRmv2KtXZHyd5a++PBpgdXRfUuS/rvSxvSGcG7rjswT3newSt
 nxPqDqKpwIpcG/8oBgctbunISD4hNChY0JqbIgtm97dK9MOac7jh9QGLQ2PUh6ctjHecQLFAuv+hiA
 WGcRo+2C0llKaFGnqk6uktleLuZKPAxDp/VRK0lVhFv/FS2PmmT1r3d/itr4LM4OSl3IWnn2ydl25Y
 9mSbQEj0X0hGAtki6jOfdkHpQA1iCGq5WZvjpY4sJbEEf2XfDvQXbxbPaUFrQM6H+ghtUK6sSnDkBu
 KKvzjdH8LPULBtWd4bncC/vUhVUGR+9+cqvvs3ZwpySSEnNueQyDxWUQjBsPkdeK3uXDSsxn3b1rPB
 6MZR3sJca4ihf9LtAQREuESburCE2IFoo4SMmm5T0px4pGDzt2KCn8lx1CGHB7eH+CsvUtoGt0eaDH
 w87hjqRMO4FXc0uXQsSqG5oHikVJdUhrWpfd59HMa4H0KtWY3L/HUmnRuCl0bojZxQdEGb39eAZFqy
 yFtPk0WEeP+eKFjFQxH1bxco7TD+e2FgGyestVNvpsdwBadPfjJ4dBS/FibA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: RQ2RGGUY4ZQDQNZZJ3WC22IXL6CNQGI2
X-Message-ID-Hash: RQ2RGGUY4ZQDQNZZJ3WC22IXL6CNQGI2
X-MailFrom: neil.armstrong@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RQ2RGGUY4ZQDQNZZJ3WC22IXL6CNQGI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert text bindings to dt-schema format for the Amlogic TX HDMI
control glue.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- re-order properties and required
- switch to unevaluatedProperties and drop sound-name-prefix
- Add review tag
- Link to v1: https://lore.kernel.org/r/20240605-topic-amlogic-upstream-bindings-convert-g12a-tohdmitx-v1-1-b851c195e241@linaro.org
---
 .../bindings/sound/amlogic,g12a-tohdmitx.txt       | 58 ----------------------
 .../bindings/sound/amlogic,g12a-tohdmitx.yaml      | 54 ++++++++++++++++++++
 2 files changed, 54 insertions(+), 58 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
deleted file mode 100644
index 4e8cd7eb7cec..000000000000
--- a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.txt
+++ /dev/null
@@ -1,58 +0,0 @@
-* Amlogic HDMI Tx control glue
-
-Required properties:
-- compatible: "amlogic,g12a-tohdmitx" or
-	      "amlogic,sm1-tohdmitx"
-- reg: physical base address of the controller and length of memory
-       mapped region.
-- #sound-dai-cells: should be 1.
-- resets: phandle to the dedicated reset line of the hdmitx glue.
-
-Example on the S905X2 SoC:
-
-tohdmitx: audio-controller@744 {
-	compatible = "amlogic,g12a-tohdmitx";
-	reg = <0x0 0x744 0x0 0x4>;
-	#sound-dai-cells = <1>;
-	resets = <&clkc_audio AUD_RESET_TOHDMITX>;
-};
-
-Example of an 'amlogic,axg-sound-card':
-
-sound {
-	compatible = "amlogic,axg-sound-card";
-
-[...]
-
-	dai-link-x {
-		sound-dai = <&tdmif_a>;
-		dai-format = "i2s";
-		dai-tdm-slot-tx-mask-0 = <1 1>;
-
-		codec-0 {
-			sound-dai = <&tohdmitx TOHDMITX_I2S_IN_A>;
-		};
-
-		codec-1 {
-			sound-dai = <&external_dac>;
-		};
-	};
-
-	dai-link-y {
-		sound-dai = <&tdmif_c>;
-		dai-format = "i2s";
-		dai-tdm-slot-tx-mask-0 = <1 1>;
-
-		codec {
-			sound-dai = <&tohdmitx TOHDMITX_I2S_IN_C>;
-		};
-	};
-
-	dai-link-z {
-		sound-dai = <&tohdmitx TOHDMITX_I2S_OUT>;
-
-		codec {
-			sound-dai = <&hdmi_tx>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml
new file mode 100644
index 000000000000..b4b78475c5b8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/amlogic,g12a-tohdmitx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic G12a HDMI TX Control Glue
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  $nodename:
+    pattern: "^audio-controller@.*"
+
+  compatible:
+    oneOf:
+      - items:
+          - const: amlogic,g12a-tohdmitx
+      - items:
+          - enum:
+              - amlogic,sm1-tohdmitx
+          - const: amlogic,g12a-tohdmitx
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    tohdmitx: audio-controller@744 {
+        compatible = "amlogic,g12a-tohdmitx";
+        reg = <0x744 0x4>;
+        resets = <&clkc_audio AUD_RESET_TOHDMITX>;
+        #sound-dai-cells = <1>;
+    };

---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240605-topic-amlogic-upstream-bindings-convert-g12a-tohdmitx-d85095861d88

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

