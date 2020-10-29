Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A529EA28
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 12:10:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 746CA1657;
	Thu, 29 Oct 2020 12:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 746CA1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603969832;
	bh=PTV7Zxxy2y0se4fVMJUCPwt4YhDwZ+l9qgjJAQonUxM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mvfjzv+9p21ApkeAczndkT6miyLrBgw+UYYPx/DnhiJvg2k7HE45OTsWg+vRu7pAP
	 iAVZmliKA0FWC1XQFooJC5Uk1w3FFNLhAw1KEA5zT68d1geOr8VMKNcxxvY5kLMvd5
	 pt+Hl2l4PedQ30jyAODYyeXhYv87azdWl8Lnj174=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78CBDF8028B;
	Thu, 29 Oct 2020 12:08:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12D46F80217; Thu, 29 Oct 2020 12:08:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17E18F800D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 12:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17E18F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Ecgz5qHF"
Received: by mail-wr1-x42f.google.com with SMTP id w1so2296931wrm.4
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/3gNqkE0Rt+WwKhPrdqCOYgsX+TR72hWXEKI4+Ir+B4=;
 b=Ecgz5qHFCC0xkZin/OSTXC6WslgznGQEV4jEOrncjDTygu7NmaIBq9jF/zg6I/7uu0
 CX8pGDB8tZVnepm5fnfxqhtADMUpVKKLZMg7QEObOPEY8Zs1Rlii2c1HqpKb8tHv5NyW
 vTt+65Ouc3Rq84ullY4WAmnGKznxqRc99T/4piNGD156QuDAsyGJg0IR1350IbWm519O
 3RJdNOqZJOVvbg1mrrPgzsdQxcbuZovB5xjRvKnlat59Puy1iSVPFt+dz5KfN/aObv4c
 zFN2xbsbgCvGTEw0j04OiuWAAJDevFgYD2NXg4K+jA7/hGHzdi2QxeCBP7BjboQob7+u
 bVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/3gNqkE0Rt+WwKhPrdqCOYgsX+TR72hWXEKI4+Ir+B4=;
 b=TYZOUw814aIhDQC4ZJ/deJxbv4z0wh19AAJAFtEgemVkSKW2U8pVhp7m7RwkzC/Fb3
 TyTD+DZg0vsv76jTvaTtTOq4FNYZFR0ufimsnD7a8HIWVy0fIryjRjf4YpIgwMOpKx5k
 dUo96zGuSFrK4m0WUpVJbaDGoUgrBUNOIjCJJKh+gOvGPAb5MYsZjMdQcStsDxb+Z+qJ
 v1kqvbzpN6r51XTuKhOxRR64jthemsBHG1LufpOAjTD5H03/GdWf/FPjfbqgFS7Sv5vb
 mya8VseN4NkgBFjDtbCDMhr7MdxKIK5bm2njvk8vH9tEsaJm4yeinWP5Vg59v632rA8p
 H5mg==
X-Gm-Message-State: AOAM533B49DbJB61GAmuylL4VWUBYcjtfBmbXvqE7TNHjkKSmHpPT0hw
 OGPYZ3nJel/xnwrZn5XgGTm/mQ==
X-Google-Smtp-Source: ABdhPJyjx1tewy2ssRVNGcVaXrfzGcvyw+lhMD2Mr6TXfnvwvBguV/HdKRrkE1n9KbjATDV3zK5tFw==
X-Received: by 2002:adf:8296:: with SMTP id 22mr2468015wrc.341.1603969721966; 
 Thu, 29 Oct 2020 04:08:41 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n4sm3710830wmi.32.2020.10.29.04.08.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 04:08:41 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/6] ASoC: qcom: dt-bindings: add bindings for lpass wsa
 macro codec
Date: Thu, 29 Oct 2020 11:08:24 +0000
Message-Id: <20201029110829.16425-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201029110829.16425-1-srinivas.kandagatla@linaro.org>
References: <20201029110829.16425-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

This binding is for LPASS has internal codec WSA macro which is
for connecting with WSA Smart speakers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
new file mode 100644
index 000000000000..435b019a1e3d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPASS(Low Power Audio Subsystem) VA Macro audio codec DT bindings
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-wsa-macro
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
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: mclk
+      - const: npl
+      - const: macro
+      - const: dcodec
+      - const: fsgen
+
+  clock-output-names:
+    items:
+      - const: mclk
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
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    codec@3240000 {
+      compatible = "qcom,sm8250-lpass-wsa-macro";
+      reg = <0x3240000 0x1000>;
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      clocks = <&audiocc 1>,
+               <&audiocc 0>,
+               <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&vamacro>;
+      clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+      clock-output-names = "mclk";
+    };
-- 
2.21.0

