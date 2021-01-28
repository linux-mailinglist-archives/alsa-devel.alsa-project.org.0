Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ADC3077CB
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 15:21:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1FC16BC;
	Thu, 28 Jan 2021 15:20:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1FC16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611843702;
	bh=wZPshLqGR2Le1bMG/am1PfeNZZwaf74QF6887B0Gi5k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=daj/ypFeBn7zoMiR3JXMIe4Tez6z5ZXzLCz6bNG6q9zEheMT7HZCBaaGvxMHmNaFQ
	 02H4GIalTqHhwci+HYhuTCU8dGkWOaSwsoQXJit+PWogdhUeFEWhSRBnG4OVJYj0gg
	 FxAfMoF1P52TO3v3gfaT/7DD4RWI0FrxQ2Lg30ZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74CFEF804C2;
	Thu, 28 Jan 2021 15:20:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D52FFF80253; Thu, 28 Jan 2021 15:20:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D644F800BE
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 15:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D644F800BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="I9vxJn/1"
Received: by mail-wr1-x429.google.com with SMTP id l12so5587033wry.2
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 06:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5s1sQMKmA5X4b0lhaDVUuKBYgKx/IDMprYcIvq92de4=;
 b=I9vxJn/1Ck4iP8t6coN1ZOIjPhSLezBeAAAS9ehzuUmjGKMEXA3fWU7U0vAwJX/gXN
 +oqWM4aU24qPDxv4ZJf/4WPyimDFaAKc1PeEm9pD8wY++AIttSyIFovhY6iI6xL50o85
 Y25DgXuisgkciQiFDHYol1jrJrOle6w8mSIgOZfwMglkJM3ffY0J/w5LpJnOBBro3QsL
 9qXtGqg81IrdNX30Ww018hT2j4JbAZy2KcGeCCUkLfa1MyUdIsxGluATXUULuVFZqxOo
 RXbDNWeIF3EGccYB/tfb5zFBodWkA0XG3uCyVkS04nt09iL7lfUcaCbVrwVU5Vaav9zD
 zSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5s1sQMKmA5X4b0lhaDVUuKBYgKx/IDMprYcIvq92de4=;
 b=F9D8UsWnuMys7pseUiaTl23gVzoJTGYaLAumyslcziA5N/MRDfvxgMAreGkKTJZ/F8
 DOAd89YB9rwBnbCFcUYbacMSHwO+p/pfH5sIlBnvNrtduz8oUrPOT7eDM6QDGKBRFklZ
 MFJdaXxRBjDUdSVg27UxjIU49QYpJDNPHhKVN3/KcuRLSQd3L4D96Y2dYyWKP8DN8Ia/
 4ALU6mb6ONoC9wEO8fFSLVPLpe5AGgS6PX+E/uo6oaGstutDNhQhAHwPdF4cL5qr2oEu
 3WLz3HiUwUUjDj59TjITDxLjxbV+z9mqXX/WOMB+m1K6L0IkziYsFRAG1ZeuhYbSPjkH
 zNKw==
X-Gm-Message-State: AOAM531L6KY3sF7ci4qVixZK+TQWtObwJKq/Hk64wK2/LZn8lDUqu8c8
 ZTd8GSgiLCankbomKZUjDEzz+Q==
X-Google-Smtp-Source: ABdhPJyPrFZX+5pwRIKZPPeQK4A4jUwO3uipEsTKpcC6jWj0kzsQuyrY2QTQVfd+Xskfj8KzzUznLw==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr16095837wrp.422.1611843595619; 
 Thu, 28 Jan 2021 06:19:55 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id d9sm7257096wrq.74.2021.01.28.06.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 06:19:55 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/7] ASoC: qcom: dt-bindings: add bindings for lpass rx macro
 codec
Date: Thu, 28 Jan 2021 14:19:23 +0000
Message-Id: <20210128141929.26573-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210128141929.26573-1-srinivas.kandagatla@linaro.org>
References: <20210128141929.26573-1-srinivas.kandagatla@linaro.org>
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

This binding is for LPASS has internal codec RX macro which is
for connecting with SoundWire RX codecs like WCD938x.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,lpass-rx-macro.yaml   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
new file mode 100644
index 000000000000..443d556caa69
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,lpass-rx-macro.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPASS(Low Power Audio Subsystem) RX Macro audio codec DT bindings
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-rx-macro
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
+    codec@3200000 {
+      compatible = "qcom,sm8250-lpass-rx-macro";
+      reg = <0x3200000 0x1000>;
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      clocks = <&audiocc 0>,
+               <&audiocc 1>,
+               <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&vamacro>;
+      clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+      clock-output-names = "mclk";
+    };
-- 
2.21.0

