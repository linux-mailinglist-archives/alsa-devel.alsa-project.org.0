Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DC1316260
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 10:36:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC83D16F5;
	Wed, 10 Feb 2021 10:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC83D16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612949767;
	bh=q6YNvbktcqe/3+uMVir/pSc2XEQDqkgVUaZDOHK4d6k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bg28Qk2fUD+jFcXtYoollJHDpEugErtQXAxEPfxCm8emo8FPVXctMSLgTNYd2tLak
	 6EJbmh9Tg3j4mySRhD1eRQphlW63MOd0RwiQYJ9a7EWOrp0lth36fUqV2ipvWhV/vn
	 fiYQAgmvmg44n1N11krAhrDGJfeYw6GBZhkNKskM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F0D6F804D1;
	Wed, 10 Feb 2021 10:32:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EA20F804B4; Wed, 10 Feb 2021 10:32:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3834AF8042F
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 10:32:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3834AF8042F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="adzTDDLt"
Received: by mail-wr1-x435.google.com with SMTP id n6so1641508wrv.8
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 01:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y4A5Uf4Os6WPGl/YWHkNN/4TU8yF2iW13SGgEG1fF60=;
 b=adzTDDLthXXtZaBFlQRqslziLqKvZsWzA05hRdVadOeTo6a4itsepNDCfhBKcm4H/d
 /DHljJo5F31vdH5ia0X5PLamOixs+5hhp/6a6397c75pPKBj6S4BmzlntJEBzDLi2cvk
 E8Z+u8DzS/lBmK7VCxK5wC1p3rbavEHTa69WtDtFURWm2iGvyxElBXNYOBdzRzkFJ8gp
 cQueylBc9+j4cxgCk/ehqkHYHSaslLtxN6jP0L0Jk5wA4Hmx7k91yzcosxBfvnzdAvdl
 6VU9/m/zncoR4GnNw1ZTqR3uCnJkC/5fhy/ZT8MT6hoJhR5+SzGoP0peI0s/iKj7xtrj
 TSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y4A5Uf4Os6WPGl/YWHkNN/4TU8yF2iW13SGgEG1fF60=;
 b=KyMtkgipFSIPFtLbIHQk/bYzUKqjvSYCJzv1Hn2n1+Ryq3VVB/O7CXiUVvIdFlfZwg
 dunANMscY2LpsUmLm9BPU769nArq+LmIrD1xcBIL/Z66cKuSHLTyc6Z29/Cz1lb9nnQT
 JTIoDe4dKbIdKoT/Dt4aYlpOmrx11oDRY5d7r9xvQt3cNF4mdN9FvooC8n7GXUVYHpup
 Nl4MC/D6xULCrdPGUxI6QWY7+PSu6H/4ix/AH0PS6CQVOe/aV4e1Mc++jMvesSzKCEyw
 vVU6tWq9xuTZwFg9wbGAx9ifQlXjF1uJwu1YcfFCL+aa0XXACOsHB/wAexIk5YN/yZTK
 a+sQ==
X-Gm-Message-State: AOAM530oLPbUBmyhpF3jjYffP8sSAZ+twm4h8W2YrhaK99gMh5BkgEOJ
 xpBxalAcy1JSM6igf9nfJMzfrQ==
X-Google-Smtp-Source: ABdhPJwh53VbXv1w+xpdN/qRQno7PAQqQ65fFnPwfNieIO4vpJ9+3vDNvUXnu1JZhnq87887ExdDmA==
X-Received: by 2002:adf:fc88:: with SMTP id g8mr2503989wrr.259.1612949548930; 
 Wed, 10 Feb 2021 01:32:28 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t2sm2150583wru.53.2021.02.10.01.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 01:32:28 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 5/7] ASoC: qcom: dt-bindings: add bindings for lpass tx
 macro codec
Date: Wed, 10 Feb 2021 09:30:53 +0000
Message-Id: <20210210093055.18350-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210210093055.18350-1-srinivas.kandagatla@linaro.org>
References: <20210210093055.18350-1-srinivas.kandagatla@linaro.org>
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

This binding is for LPASS has internal codec TX macro which is
for connecting with Soundwire TX codecs like WCD938x.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,lpass-tx-macro.yaml   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
new file mode 100644
index 000000000000..6b5ca02ccce4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,lpass-tx-macro.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LPASS(Low Power Audio Subsystem) TX Macro audio codec DT bindings
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+properties:
+  compatible:
+    const: qcom,sm8250-lpass-tx-macro
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
+    codec@3220000 {
+      compatible = "qcom,sm8250-lpass-tx-macro";
+      reg = <0x3220000 0x1000>;
+      #sound-dai-cells = <1>;
+      #clock-cells = <0>;
+      clocks = <&aoncc 0>,
+               <&aoncc 1>,
+               <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+               <&vamacro>;
+      clock-names = "mclk", "npl", "macro", "dcodec", "fsgen";
+      clock-output-names = "mclk";
+      qcom,dmic-sample-rate = <600000>;
+    };
-- 
2.21.0

