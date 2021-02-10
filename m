Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C74E31624B
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 10:33:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E58516E2;
	Wed, 10 Feb 2021 10:32:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E58516E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612949628;
	bh=wZPshLqGR2Le1bMG/am1PfeNZZwaf74QF6887B0Gi5k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tENT2PZI8iQxhxK91+RY1pvclIdVS/9pvxW6Kyo1coxOXWh/SE69v9WP0DYuL9PYj
	 kBWg+bzsYQxUH+jYMsIEx71SRbZekz5oPvas5kFoBiPDcte+XLz6FXp6mRyWgNcQyq
	 pzZshhHcIcvUsErp6yTrq2Fat3XTD3Z/EOkFUsDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C380F8022D;
	Wed, 10 Feb 2021 10:32:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F340AF8026B; Wed, 10 Feb 2021 10:32:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9E71F8022D
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 10:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9E71F8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TMEzTh9g"
Received: by mail-wr1-x42c.google.com with SMTP id u14so1678761wri.3
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 01:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5s1sQMKmA5X4b0lhaDVUuKBYgKx/IDMprYcIvq92de4=;
 b=TMEzTh9geMRRJWQhpTLw+8HJy+00LR7QXqD597quqbBxBvGS8e92GmYT8BsMeC7QiP
 4UB7NY3LAm6oGcMyNxvY6RXy+TvYiUGx7Pf8G4AnpyMwR3m1zhoJTZX7ZueuWlvZXCZj
 QKpFH4KuvP8/mBD508Iq2lajhbTYaBbEtPqFNFNfNxxAmOLvG0yvsLA0ITG9hngSyZgw
 u9k1XoPJW5oJOdLP76PCqpSmrWyGkki0JMk9a5j1Kr0L5CO7EvA/n4dOI8Su7FRqIURR
 gaXIsvIfGxgQ1fIjaiZaLGV8S+iN2U3eD2aBuGA5AQ5+9VRwhH2hjs5wr8xgxGKWSvXG
 VEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5s1sQMKmA5X4b0lhaDVUuKBYgKx/IDMprYcIvq92de4=;
 b=imdI8s1hrUjLpzL9mmUNcGTF6p0cVG4ylRHuuVP/hJW0ZN9vvQ+0xBjPJbyfs77qNr
 55T4Kv1tHGIDLuefyomasA8iPYF/HlwzCIuolc6ulXrp6rUpY9PCf7ttqqLvUR3RCsQQ
 49DvwqSytC398KQUIoIcy7tBHaq9/CtzphaG07wdwyXQmmvxlF9o+qiXAuot0FH8I2gc
 5OSfBHhgTb5wWQ1aawXwN5CsXJcG1y2vEc7MwqS1ztr5B6bN2SEBo9NqD+OfCgFbaU5Y
 WxfBl74ApEK97o/cr05gOMLb4HBn53hyUR5lD3NJ815VXDGMD3feaBYxOwKgykPCbqp9
 1uFQ==
X-Gm-Message-State: AOAM532jufK17LdGzirLoXv0WSHL4MiFHcQzN0gKjGZQzTf/aO3Am2+A
 7jY+AIKerjaJTME2XxHw3a8+WQ==
X-Google-Smtp-Source: ABdhPJwQPgc2a9gC9tMHeDJPWYCiqQIfehTdTaUROF1aZjwatXDpjkqGFnDgxhV32vHXn2QqNioAwg==
X-Received: by 2002:adf:fb49:: with SMTP id c9mr2645300wrs.72.1612949523910;
 Wed, 10 Feb 2021 01:32:03 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t2sm2150583wru.53.2021.02.10.01.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 01:32:03 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 1/7] ASoC: qcom: dt-bindings: add bindings for lpass rx
 macro codec
Date: Wed, 10 Feb 2021 09:30:49 +0000
Message-Id: <20210210093055.18350-2-srinivas.kandagatla@linaro.org>
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

