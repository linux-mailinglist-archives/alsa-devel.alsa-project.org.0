Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CFE7F6E5D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 09:38:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 151BFDF4;
	Fri, 24 Nov 2023 09:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 151BFDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700815129;
	bh=UwcMrVVKiBtuFZX0xEPnSowZYbwBbMudmtkSsGwoylw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fhLZYfbH1z5shbNgo1pYFJampgXzsPOnF2o+EOI1R5XzpkYzg+J7j1d/VGzR4QUk9
	 tQovGcpXXZBmCBG/gwnhHOVXHOKE6khCOyFA1XmTbGwQe0JGwpvUdwZdFZyj04lkYQ
	 zLmPyVy2J9VbwlI7CzeEsJPTvM5bJpuJt07PWvg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7029F8057C; Fri, 24 Nov 2023 09:38:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D145F8055C;
	Fri, 24 Nov 2023 09:38:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A20B5F802E8; Fri, 24 Nov 2023 09:38:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37CB2F80249
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 09:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37CB2F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wjjO7oie
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-54afd43c83cso292567a12.0
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Nov 2023 00:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700815087; x=1701419887;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CYqzi/+XlQ/s+DJqiECuwYHNpVRCGbZDGfLfIlCHIxk=;
        b=wjjO7oieEoxbt9rpAikMYzIt/jvC6pF2G5N19IbXeAyo9KNoZO6AskgcaNDKR6Qp7V
         ktfVCrJlo+cVkd4m79Jt1OZ4SuhRFpmHaU6zmWwStRXlu3TKf3R4FbuNHtfIoNemWOqv
         PMpD0sTV3gTdVhVdlFKNyX4FKEcWuMvB2GMZb3ZZ5GUvfZ1cYCaaJi+X9Qq75nojTscj
         dOh/Gv6Swx/wmmFWVXHzLJ3PdfaeQpDK0BLw2XwtqIBW58BMOrBs5en5WsT9kxkDslI4
         U/nQf/cVgTiSt3jnbYNzIBA6MXbCO1c7Vt1NiysLwurgXXArl1uW9iyhcGvJcaOHI53F
         TX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815087; x=1701419887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYqzi/+XlQ/s+DJqiECuwYHNpVRCGbZDGfLfIlCHIxk=;
        b=uiu46/M5BUDtibAeKhC2WGRynRXY7KjP5RjRV6hZOQ2uJcCAHChKVTcQVLa0sBajWG
         I7yor3Qd22sLlwpmPIivQnlM8R1lK3zGxvbt6DYcOkAMcpPj6Nr6mCZ8ECRG4SSEYebG
         MJdiAedDbrDNDQnryPcwXe0L+vj2NAYElDHZDPNmQ+e3gQMfXZcITjoPo4yGc9a9TN8K
         9HwVRPTwy92aycGtwbxGFjfB9Y12C1Nx44s4FFG7iSE+ihjlGKLPedH3J/XxGN/ADFLZ
         L7MjMaQnB7Wp3m4vvgNerrsEFf8pPRVTL4f2KVD9Dpg8WEbX+ZQrOH1l5fZo1UrtwdID
         gtjg==
X-Gm-Message-State: AOJu0Yw/bAIrOGV9RiKu+lvJ7HJme7Cy+wf4W4c6KfwpY72dkHC9BQ/c
	DTyg3IylPghzpakFVlT5YsI4Jg==
X-Google-Smtp-Source: 
 AGHT+IE/6AvzGFpXeoUuooNv8Hkv3iVH5oo4ItGvDeCTDaiH0at3wQHZPjucHgaXdu9YSCtq8CFIyQ==
X-Received: by 2002:a17:906:2756:b0:9bd:9bfe:e40b with SMTP id
 a22-20020a170906275600b009bd9bfee40bmr1324090ejd.75.1700815087137;
        Fri, 24 Nov 2023 00:38:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id
 ks20-20020a170906f85400b009db53aa4f7bsm1781574ejb.28.2023.11.24.00.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 00:38:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Seven Lee <wtli@nuvoton.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: correct white-spaces in examples
Date: Fri, 24 Nov 2023 09:38:03 +0100
Message-Id: <20231124083803.12773-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HCNEOMLERT6Y6KUTOK5M7SOKI7S72CNK
X-Message-ID-Hash: HCNEOMLERT6Y6KUTOK5M7SOKI7S72CNK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HCNEOMLERT6Y6KUTOK5M7SOKI7S72CNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use only one and exactly one space around '=' in DTS example.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/sound/nuvoton,nau8821.yaml        | 2 +-
 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml | 4 ++--
 .../devicetree/bindings/sound/qcom,wcd938x-sdw.yaml       | 4 ++--
 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml | 4 ++--
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 8 ++++----
 .../devicetree/bindings/sound/ti,tlv320aic32x4.yaml       | 2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
index 3380b6aa9542..054b53954ac3 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
@@ -135,7 +135,7 @@ examples:
             nuvoton,jack-insert-debounce = <7>;
             nuvoton,jack-eject-debounce = <0>;
             nuvoton,dmic-clk-threshold = <3072000>;
-            nuvoton,dmic-slew-rate= <0>;
+            nuvoton,dmic-slew-rate = <0>;
             #sound-dai-cells = <0>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
index 4df59f3b7b01..beb0ff0245b0 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
@@ -201,9 +201,9 @@ examples:
   - |
     codec@1,0{
         compatible = "slim217,250";
-        reg  = <1 0>;
+        reg = <1 0>;
         reset-gpios = <&tlmm 64 0>;
-        slim-ifc-dev  = <&wcd9340_ifd>;
+        slim-ifc-dev = <&wcd9340_ifd>;
         #sound-dai-cells = <1>;
         interrupt-parent = <&tlmm>;
         interrupts = <54 4>;
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
index b430dd3e1841..7b31bf93f1a1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
@@ -51,7 +51,7 @@ examples:
         reg = <0x03210000 0x2000>;
         wcd938x_rx: codec@0,4 {
             compatible = "sdw20217010d00";
-            reg  = <0 4>;
+            reg = <0 4>;
             qcom,rx-port-mapping = <1 2 3 4 5>;
         };
     };
@@ -62,7 +62,7 @@ examples:
         reg = <0x03230000 0x2000>;
         wcd938x_tx: codec@0,3 {
             compatible = "sdw20217010d00";
-            reg  = <0 3>;
+            reg = <0 3>;
             qcom,tx-port-mapping = <2 3 4 5>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
index 018565793a3e..adbfa67f88ed 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
@@ -137,7 +137,7 @@ examples:
         reg = <0x03210000 0x2000>;
         wcd938x_rx: codec@0,4 {
             compatible = "sdw20217010d00";
-            reg  = <0 4>;
+            reg = <0 4>;
             qcom,rx-port-mapping = <1 2 3 4 5>;
         };
     };
@@ -148,7 +148,7 @@ examples:
         reg = <0x03230000 0x2000>;
         wcd938x_tx: codec@0,3 {
             compatible = "sdw20217010d00";
-            reg  = <0 3>;
+            reg = <0 3>;
             qcom,tx-port-mapping = <2 3 4 5>;
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 1174205286d4..0d7a6b576d88 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -497,19 +497,19 @@ examples:
         rcar_sound,dai {
             dai0 {
                 playback = <&ssi5>, <&src5>;
-                capture  = <&ssi6>;
+                capture = <&ssi6>;
             };
             dai1 {
                 playback = <&ssi3>;
             };
             dai2 {
-                capture  = <&ssi4>;
+                capture = <&ssi4>;
             };
             dai3 {
                 playback = <&ssi7>;
             };
             dai4 {
-                capture  = <&ssi8>;
+                capture = <&ssi8>;
             };
         };
 
@@ -523,7 +523,7 @@ examples:
                 frame-master = <&rsnd_endpoint0>;
 
                 playback = <&ssi0>, <&src0>, <&dvc0>;
-                capture  = <&ssi1>, <&src1>, <&dvc1>;
+                capture = <&ssi1>, <&src1>, <&dvc1>;
             };
         };
     };
diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320aic32x4.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320aic32x4.yaml
index a7cc9aa34468..4783e6dbb5c4 100644
--- a/Documentation/devicetree/bindings/sound/ti,tlv320aic32x4.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tlv320aic32x4.yaml
@@ -90,7 +90,7 @@ examples:
         ldoin-supply = <&reg_3v3>;
         clocks = <&clks 201>;
         clock-names = "mclk";
-        aic32x4-gpio-func= <
+        aic32x4-gpio-func = <
           0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
           0xff /* AIC32X4_MFPX_DEFAULT_VALUE */
           0x04 /* MFP3 AIC32X4_MFP3_GPIO_ENABLED */
-- 
2.34.1

