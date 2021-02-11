Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE624318A79
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 13:29:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57EA31707;
	Thu, 11 Feb 2021 13:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57EA31707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613046573;
	bh=B0g5/mA0LddrbFQ/vHnKBRpX/Dlo8yOFIuzeUJ5USIs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y1WWJj5sRXD/afhfNtliuyV6LsA7inNH2nnlwjlLyejS24wOVdRYskImHXgpPBrXG
	 /v4YB9r9iaxCBQXLRs7ZzE48yqCDG82DpFzusGyx3U9C0xpexFEr1ClFN7SvUTAEJQ
	 tM18iHsERsg/IHnoyYeGY3GdaEStr9tbzp3NIHBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93F02F80264;
	Thu, 11 Feb 2021 13:27:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 901E5F8025F; Thu, 11 Feb 2021 13:27:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FA96F8016B
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 13:27:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FA96F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sZOo9pSD"
Received: by mail-wm1-x32d.google.com with SMTP id j11so5371408wmi.3
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 04:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CqOeoZ5rOWKn/umE1C8T+JZK8lqxm0pfRIhp35rn7a8=;
 b=sZOo9pSDJCQlE0taFkAVz8Yanr5CMlblH6hChE3cgddeGGSH7lP+/xQjRB1D9H03QC
 O+/dDfEZ/ULkaAsr6UHdG+6bTBBIxAlDrgeW1MFTOldGQXGfXMtwONaL+vE62boYVZ6/
 xMos6MsBzY/UNZVMum6Od9zz1NUKQbp02qRYhrONmuPRWrHQTNFx+SyFPHZTFRSwTLt4
 vxl9bHLsx0fYl29SZilEdNT1W5v5vE6mF9CtF4GxOjHk4LKUFV1pza8I3QHGRTpOEZYE
 DvAqIsrpKCIePM5Zv3EabhWH/nRjjLlcV+2+3G7lD/+LH/qyjm1WJMVSBZp3tQWs2nWz
 msFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CqOeoZ5rOWKn/umE1C8T+JZK8lqxm0pfRIhp35rn7a8=;
 b=nzduLuCN3B7NrKmGHv2/yWWduD2Q3IrVSHrSLs9ER8pcHuQCs6aYKWZPUDrLFGcs22
 xCIyX14/CEmKx/MzgKmRmxU1ywKVN8VKfRHDM8R8K5V5djWqjjjwldwlT/8im1TAgc6X
 rp9taV7IrLYFTGGHYqMKnykGVcfZGEo1kNBtvhcVNy+0XDdNTWCSwE9Ut8EkGSno0lnT
 vj0TZNXFs24ubv5GBFmy41Q0kSpXc4X9X/Qy4Y2ghXb4gPMUAKrd4hgi15TDovYAVKc3
 jFbV1m9uodYKxwAQ9eXEDQWRYb90pZwC1J5BZD9py2/yk8mvqI4CCe5zUxSu+T/1NvOq
 PNKQ==
X-Gm-Message-State: AOAM533bCBThnI6KytgFMd1WXyP7mCeYWbO0qjTbMF2aB5iZUdSVzZKn
 iVC1JqOjBFFP0BDghSAv5/e/5Q==
X-Google-Smtp-Source: ABdhPJw09oXv1VbECNCO7KpfMy0zp70JtFR7JMRop3+xbW6chEVfTw5HIM8edAocV0uRp63Z+rojUw==
X-Received: by 2002:a1c:3b42:: with SMTP id i63mr5093415wma.124.1613046465637; 
 Thu, 11 Feb 2021 04:27:45 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id d20sm4026477wrc.12.2021.02.11.04.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:27:45 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v5 1/7] ASoC: qcom: dt-bindings: add bindings for lpass rx
 macro codec
Date: Thu, 11 Feb 2021 12:27:29 +0000
Message-Id: <20210211122735.5691-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210211122735.5691-1-srinivas.kandagatla@linaro.org>
References: <20210211122735.5691-1-srinivas.kandagatla@linaro.org>
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

This binding is for LPASS has internal codec RX macro which is
for connecting with SoundWire RX codecs like WCD938x.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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

