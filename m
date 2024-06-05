Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8622C8FD2DF
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 18:24:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8128DAE8;
	Wed,  5 Jun 2024 18:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8128DAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717604667;
	bh=Kh6qdgD8gN3kAFOnYgqdARfzmUnV4nBrhS9jybICIxU=;
	h=From:Date:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D4yt1o+6aOJJuoCI4h9iZoezH9vGx7DRH3lPVoHXRZohGFy7y/C8D+UcNBbBvIz63
	 M59SkuFPkUcXBmQfg2NhIPNngEvyUWciXzHE8u943fXpNN3dsjHn7deRmtNGlAy6MT
	 FOgr8aAp6d999rQAs3ofhlvKfHQXzeGz0EYJnOac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E45ACF80589; Wed,  5 Jun 2024 18:23:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EDE0F805A1;
	Wed,  5 Jun 2024 18:23:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32594F802DB; Wed,  5 Jun 2024 18:23:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00A48F8003A
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 18:23:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00A48F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Dz9+O0WF
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4215ac379fdso186385e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jun 2024 09:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717604623; x=1718209423;
 darn=alsa-project.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gHdEt550F1bEVRbDb46OyuzqxvV/QnpebMYwJjNOjY4=;
        b=Dz9+O0WFdBxIclBvUzH8Yz1104sljbZG5Jt+q/RUtr8mHb+fp+JTLMFPOxHrNAtl/G
         +rb9VRy5yMxe/AOsiWfhaTi1TwokOLwTr49/tcbn2ov6SrjlqaUxVo8qc2/4DkK+U2Jd
         e0RefBDbjGxL1NYaNL69AhsSQRw6HZzh3Lh2whOtqDJn06Zz9ZEPSdnGz5sEzt8oa/TT
         WPH8QK/kdOWx3K/DQhiGc5YM20UVa8OwISC5zNSQ/IdJfn2g3yj25rAkoKPqeqAd4DjM
         c/RpFTWYanr2bTk+rSBpyrGZSXyx7HHW3A26J7mzOk2pDwqARwlAdfOMI/vnZ9/WPDhS
         1Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717604623; x=1718209423;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHdEt550F1bEVRbDb46OyuzqxvV/QnpebMYwJjNOjY4=;
        b=sn71Ik2S/bnFhlMEYWEemTrTpf43CdqcNfNFU0uNymdIY+VJGpIEwx8gDNZ8JPaO5d
         8f15NZUp1wX2VlgbUjpfuaxBepvURl2du4f9Pmy7Kkm5uRsI1JeGCLvmVGBT12ZPsNXs
         7/is0keMawoOagBKl8Xkd6KgCtkxCOZD17DKI+nV84vvOiTCPEtX+Lrj9x9/WM+10RHA
         qS9wvJhdFyObKe9IBpNcCbHJdDMnycIBYgz49MPQsYg4d/Ybkq75jP4PIHYMpQzvjyOp
         isoBD/HlC6ObkzTxY+wbvcstcqURo+vCy188Gd7MmOO4Mvk8sPEERlv1qGzEV8Zo8HFn
         lGIw==
X-Gm-Message-State: AOJu0YzwipXVTZQ8Kjm0BynuqP99V6Hs6a0cbgmYoPytulYewSg/bggz
	qeZNmH4yPli9JrxDbUFieKaItkkYcTuiul0knyQq3Gz/r0LbGlJThgdvDWGS59g=
X-Google-Smtp-Source: 
 AGHT+IF1O2G99r4xRgtljG98+ucYesGFfJbY7KI63jODvWrBBCVZMWvqxSh7GcUBaF2AJhCDveDj+w==
X-Received: by 2002:a05:600c:4212:b0:421:5609:115d with SMTP id
 5b1f17b1804b1-42156355b00mr22614075e9.41.1717604623476;
        Wed, 05 Jun 2024 09:23:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421581016e0sm28191635e9.9.2024.06.05.09.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 09:23:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Jun 2024 18:23:42 +0200
Subject: [PATCH] ASoC: dt-binding: convert amlogic,g12a-tohdmitx to
 dt-schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240605-topic-amlogic-upstream-bindings-convert-g12a-tohdmitx-v1-1-b851c195e241@linaro.org>
X-B4-Tracking: v=1; b=H4sIAA2RYGYC/x2NywrDIBBFfyXMugMqNdj+SunC6sQM1AdqQyDk3
 ytZHQ4c7j2gUWVq8JwOqLRx45yGyNsEbrUpELIfDkqou5iFxp4LO7Txm8Pgr7ReyUb8cPKcQkO
 X00a1Y5DKjnj1kfuO3mjx0GaW3hgY26XSwvv1+3qf5x8dr8+YhwAAAA==
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3588;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Kh6qdgD8gN3kAFOnYgqdARfzmUnV4nBrhS9jybICIxU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYJEO8xzG0MMshcpkcqCqBsYFkiu8m34xyUH6ua1c
 bNJ27u6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmCRDgAKCRB33NvayMhJ0ZtQEA
 DO/VXqjr5leAf37OKLLcpq0P8pr5p2aYKq9yRyRGGp4k7bDR1s095+LdF/r63uDB5HQzmGu0Nbn3JI
 bRXRdpXjU7uJvUs850YRL4hh0TLLlQigv/gDWY7JvyGXSS80EGUcsLBhd2ppf9DyFaviGOzDRCwPPI
 LIjPm1pYNw/LLweXvwhAnaw70MOhzeM6AB9CcP2jzWdA+YsFEBJqW8wnZWVN4h202S/YNvKxCC6pKd
 v6fyU4MG0JSCNNUFqm9zlI4ueEiL24Bq19lzzkIUp6AKj61/DeAI9dXYHudrzoID0CrmJb/r0dU6uA
 5E+zh1jU4SKJLntVJ9YpMeHD5DhBovYN4jjDp8gS96BFQdIu87Kj0btTJSnCAZLX9k51GPQrEjaJPf
 uCYnjxjPwSh9aP7Sw9vX0x+IZF8SPdlYraRTFBy8sut3gbGVHGB6UWONPVPycNKDuDMhUqySYw8QUd
 Km8HYwcSUsJCkqkfpxBYwyZUt25AAsuSmZWOVYk5YZDB4g/R0oqjHUil2BwkWyuIVDbrYtv+AI+fWH
 JNtNbSs9Zs7nDl1aH3plyRyiMS11OUa+wmMnjfFdnVhWhPXwAgVlQg/Xz2hljMxcWiqUjFLNLR6X3J
 yNgT+BW9wWwOqjlLc7AxcRv8KYQOIuD+X+4k3bixrCFyVSgPWg9Bzwt9HgxA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: ELDTQ6LUL3YXPQKK2NLAEIS6CITQIAEQ
X-Message-ID-Hash: ELDTQ6LUL3YXPQKK2NLAEIS6CITQIAEQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ELDTQ6LUL3YXPQKK2NLAEIS6CITQIAEQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert text bindings to dt-schema format for the Amlogic TX HDMI
control glue.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/sound/amlogic,g12a-tohdmitx.txt       | 58 ----------------------
 .../bindings/sound/amlogic,g12a-tohdmitx.yaml      | 56 +++++++++++++++++++++
 2 files changed, 56 insertions(+), 58 deletions(-)

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
index 000000000000..34e9de1366f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,g12a-tohdmitx.yaml
@@ -0,0 +1,56 @@
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
+  "#sound-dai-cells":
+    const: 1
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
+  sound-name-prefix: true
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/amlogic,meson-g12a-audio-reset.h>
+
+    tohdmitx: audio-controller@744 {
+        compatible = "amlogic,g12a-tohdmitx";
+        reg = <0x744 0x4>;
+        #sound-dai-cells = <1>;
+        resets = <&clkc_audio AUD_RESET_TOHDMITX>;
+    };

---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240605-topic-amlogic-upstream-bindings-convert-g12a-tohdmitx-d85095861d88

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

