Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 695E52A7D46
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 12:39:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B26F816A3;
	Thu,  5 Nov 2020 12:38:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B26F816A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604576366;
	bh=KcJLPuCMMol0lHcWHHO3Ta1SFH82PUjCR9ovpWos27w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/u0V/544AXC5qast0HZIUwHcE/2L1vkf0kUkiUrP8PH6uaZVw9sQVYPqnliZMMcE
	 9Sm/4nwZS7czdNzhypG3pkFlZuLDKMBpdMe559VRJPdePMS5oBtROlYyX7O6hC5Gt1
	 EnNgdelPDRJQv1ftIWJYZPacDkJZXLPz+fvbAkpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 948ACF80507;
	Thu,  5 Nov 2020 12:35:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED823F80162; Thu,  5 Nov 2020 12:35:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A87EF80162
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 12:35:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A87EF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="A5gN26/Q"
Received: by mail-wr1-x432.google.com with SMTP id b8so1368960wrn.0
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 03:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h26eF40PaZ6KFdIeJwqF0Jrhx2dZ+TjpA76DU5/WGXs=;
 b=A5gN26/QGnbFvWXObUHshDqAtdfrClrjhHVzBuZ2Em2uF1PHbH4rhMRUWcxsKi3aS2
 Npc/b7sch95U53NAI9/xCSy3FOM9XALICFJfyZvurXHYfDQXw322nZqcEtynhR8L+yLu
 NIAE26kV3+aPVl0X0+8YSmbuOEC0PUEVwoR1HeZNN9/JmfcxDX+6jgzCA7eHPYe6F8Yx
 HF5bzJQULgMQtlxkn0TZoGFhE3Qcj+1vP4otC+CI2G8/qDgATB5nXKRXmC3Iy1ermgxS
 X5U6w37i5mEr7Eoa7eW5sr40UGS6t5UA8SyMSM7cuF7QdctTJ0+rg0Sj4qvgCs0y4tzv
 Umig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h26eF40PaZ6KFdIeJwqF0Jrhx2dZ+TjpA76DU5/WGXs=;
 b=pQU9yo2yvsUW82LqedYoqfe1IE9mchJiXpC9+u5crndwkUvqUAMOUcYDR3tnXLX2Tp
 1Cwv8U9X+KpVkgPt9e5oOmV12JiZLVeJNSaTMi+6dOdwtVnhyLckIaONNFqK2Dn8huCk
 299OC/xDZSrNnypE8mLRQaAVdEAfO4P35n8AAkBJxMKz6VlIfqXMcCXe97NcaQVsQeCa
 DRJNscbA/WD2RZxCPL0NtKQQklvNO20kir+ABRbn5rCKuxLgMasz+AJTTvM1dh2yxIfD
 VUoSACFOYmMTEdQ6xok5EbMt6gd2WmW9AR69hdYdRT/QckqIp0kPRQwZJm7ExtnbsuUH
 y0Xw==
X-Gm-Message-State: AOAM533VJWxai9YYTjaIglwbKtN5jmbGdlVLVwG4UDv8i5dkVeE3Ooay
 etxVpufF0z+/Yty7KapPufyyKQ==
X-Google-Smtp-Source: ABdhPJzVH+JLYWx3/VdBd29lN0VHHvZvfqQqzrKcNGXGXvJOP8nTqgblg5xpxlLZ5X7yOtAzJmWlcg==
X-Received: by 2002:adf:eaca:: with SMTP id o10mr2513853wrn.9.1604576107810;
 Thu, 05 Nov 2020 03:35:07 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t199sm2096129wmt.46.2020.11.05.03.35.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 03:35:06 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 4/6] ASoC: qcom: dt-bindings: add bindings for lpass va
 macro codec
Date: Thu,  5 Nov 2020 11:34:56 +0000
Message-Id: <20201105113458.12360-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201105113458.12360-1-srinivas.kandagatla@linaro.org>
References: <20201105113458.12360-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
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

This binding is for LPASS has internal codec VA macro which is
for connecting with DMICs.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/qcom,lpass-va-macro.yaml   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
new file mode 100644
index 000000000000..679b49cbe30f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -0,0 +1,67 @@
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
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    codec@3370000 {
+      compatible = "qcom,sm8250-lpass-va-macro";
+      reg = <0x3370000 0x1000>;
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      clocks = <&aoncc 0>,
+               <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+      clock-names = "mclk", "core", "dcodec";
+      clock-output-names = "fsgen";
+      qcom,dmic-sample-rate = <600000>;
+      vdd-micb-supply = <&vreg_s4a_1p8>;
+    };
-- 
2.21.0

