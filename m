Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34813298F22
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 15:22:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C77E316BF;
	Mon, 26 Oct 2020 15:21:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C77E316BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603722148;
	bh=dC1W60VTqgA/i3Cw4DaDpM63Ydx3jeRdxhl7Wc7Bpjs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OxU4xMk5TUqyUdkl9DI66h8nzHeh/iT1AaC9snVIZsCD6pA5Qy6AaAuWcYIAiXZ6H
	 ARDLPwjXDF90LS1EbbEGBV3dC6Pwm+UvBzRlqCziFsBxarv7MiGHXD0gO8FS7ZW6+F
	 C4Ymh6PEq9Q4nqVCt+ilHzSaPoc+BN2EwFa9fur0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE690F80249;
	Mon, 26 Oct 2020 15:20:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05BDBF804BD; Mon, 26 Oct 2020 15:20:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AA2FF80086
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 15:19:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AA2FF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n8mxJ2N5"
Received: by mail-wm1-x341.google.com with SMTP id k18so12632715wmj.5
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9fhF75GuKHMndQwzvj5pm/aPCcKWXm3nNYC2yFpkJSw=;
 b=n8mxJ2N5zGLAVgMbyvJa2AD3AWeMri/klQxXd2NFfZg3SVtfycsOGmmXQoRyJaZm0R
 uj+Nytd4IuM3ItTvSr1BaaQyS70biV+qHdpZ2ZICzYJIYj/vOtu1GMuQWAyw7PNXLK5j
 xg8tnS1FvFm7DlHZhl/GEc/ovK+dLYhLt5uCUlC1n4HMtyhOrEyHRxdGYFQjeGTLmTdW
 yF+aCe+KPRwKdqNXHHLssg1p6RqcX8VyHJbLlyln+egHJfbDuTJckSO9eNypAZbVz4ju
 YONoQy+iJz5sgSIVwhT/FAyQzbNHrJUDgfE6vmF3PawwDSegYJWjgmlCNOYA60vA4u9N
 MzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9fhF75GuKHMndQwzvj5pm/aPCcKWXm3nNYC2yFpkJSw=;
 b=U0RQ1zNirxCbZMIj+XV4ZUF5cyz4vIJlu49GeOvFb3hR/VqeM5js59jAArkXY7scOj
 LzK2nboBYVmHIi46syJikczERlg6LWeO0wfsYC9/11O1TlDV7Ss0A0BltoM5zCHGSQlQ
 FqbDyB+MS4vnj/z75LdEeOZ7+q+m7/N0aBGN7pcOsi2SU9WD4q7gbCpbl9QdFWNjmsRZ
 VW0ymsMwbF/OpWxsti9KCpH7IWZJOGza1IHRg5PLaHmnJfO2biv4Vdj2PZvxB8SImmzw
 olmctCHB9lktOZUxK+lX+u9gb7vK8E+zcXoNHd8dndmKdTOEujK6dZ8eJCk2DoiW6r5g
 eI8g==
X-Gm-Message-State: AOAM533GX8dgwerO7nHcPns2VW8dTOqhGhJrkhr8KyRrOrNcylZDOGbK
 SjcOQ/N04vRSxdPVXOWaI6Rg3A==
X-Google-Smtp-Source: ABdhPJzRknpzQ3DDUBfPXoKWaIYT8Q1ET9vJ4ZC9mONx0jPu42Q5mgIlfYfzAJTNI8FXYCCXXKXr/Q==
X-Received: by 2002:a1c:b707:: with SMTP id h7mr17236581wmf.105.1603721999005; 
 Mon, 26 Oct 2020 07:19:59 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g4sm20253333wmh.13.2020.10.26.07.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 07:19:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v1 4/6] ASoC: qcom: dt-bindings: add bindings for lpass va
 macro codec
Date: Mon, 26 Oct 2020 14:19:43 +0000
Message-Id: <20201026141945.19707-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
References: <20201026141945.19707-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This binding is for LPASS has internal codec VA macro which is
for connecting with DMICs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
bindings depend on gfm headers from "clk: qcom : add sm8250 LPASS GFM drivers"
patches posted at
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2352255.html

 .../bindings/sound/qcom,lpass-va-macro.yaml   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
new file mode 100644
index 000000000000..214b4b117d39
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPASS(Low Power Audio Subsystem) VA Macro audio codec DT bindings
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-va-macro
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 1
+
+  '#clock-cells':
+    const: 0
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: mclk
+      - const: core
+      - const: dcodec
+
+  clock-output-names:
+    items:
+      - const: fsgen
+
+  qcom,dmic-sample-rate:
+    description: dmic sample rate
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  vdd-micb-supply:
+    description: phandle to voltage regulator of MIC Bias
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    codec@3370000 {
+      compatible = "qcom,sm8250-lpass-va-macro";
+      reg = <0x3370000 0x1000>;
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      clocks = <&aoncc LPASS_CDC_VA_MCLK>,
+               <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+      clock-names = "mclk", "core", "dcodec";
+      clock-output-names = "fsgen";
+      qcom,dmic-sample-rate = <600000>;
+      vdd-micb-supply = <&vreg_s4a_1p8>;
+    };
-- 
2.21.0

