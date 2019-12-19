Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A17125F53
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 11:39:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 330BE826;
	Thu, 19 Dec 2019 11:38:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 330BE826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576751943;
	bh=E/QQSbezSiqAcXWzCtjeGViHO6zehff4xIfVlRfchKk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T6zu82zfO2Iaton0v1kjP7M0+nLgzrb0zeXw1DWRnBX4bivBtLWsqp3LI/FJ8fX05
	 U5vdqJTqU0QCVIFr9F78kQnT3mPr2JmrT8UXUwm/bmJD0WqGE1G0GSlGGmNQWm268a
	 RggBn4Zn6IdzXQTvyb3UjnfPHVeNABritJGlDiDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 033E0F802C3;
	Thu, 19 Dec 2019 11:33:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 144F1F80292; Thu, 19 Dec 2019 11:33:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61EADF80272
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 11:33:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61EADF80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SMNsyxx7"
Received: by mail-wm1-x341.google.com with SMTP id 20so4933857wmj.4
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 02:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bP6qV0Ge4OMghuS4pDxfRI185IDu6wuYLbRLvgY6Moc=;
 b=SMNsyxx7pM0b1zkW0RLF0Ik1SoN8mF1dLMIOX7+uhrefdK8m4QfUEC8B7dESlSX43D
 o3Mm5OxXX1I1Rmrn4vAqg/c16QLZxlUS8daAh+vH2g1yQMIfxGCGj0/au5+jzW7+1MJV
 CjB5wB1FWHFqTBnr0RjOy39QxfQFfJC7GICtDSTJoct4srrMWKb9neNcdaKXc8URW2X+
 L+2HYf0iz/nnCVEkCxGVR1+guCkiAJp/XUKavpVFnQLjl77N/PiCHP+0qHECp+Wuz7aV
 NaQ2ATplLJ1sXdZE+5WBn6F0StShPIDMLvlccayCdSw+CQBZR/x2LVc0zyEIuLiugJP4
 HfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bP6qV0Ge4OMghuS4pDxfRI185IDu6wuYLbRLvgY6Moc=;
 b=Tq7ltN+njphU9j28D9paslqmg5xVMUOnw2U3iCCO5OYxzfwGiWYwjhtY4JaSoETXCU
 8My9FiOnB30gvYQ+5glP5vpttZXJZL0lse8z4ILA/wLQZA7H1dCGDBY2ceDZEMqoF+2L
 mk4RWObRs3OAIuMZdbDYddlO/YVwgI7F2HUBs2wB6Oo4DA2uuVeQ7U6J05pw+CHejWhW
 jPBb5LN8lpy4EihM1Hx/mw5jThQAhtJmjyavP7jyIRNYqg08/H27Ww0sYG3ggoMuuqdx
 f/lzFZmpCeE0c0BpomTOxtTCYYFx5ch3SfPtyKttTJM8WGh7Y37aVTRkdhW3npcyNTqb
 5lrA==
X-Gm-Message-State: APjAAAUp2jDC8AN9ivbmch9B7dacSWLUahnd/Eso0Tc+250Px5aAyrFR
 HcqWRZoY2ITmEqueAYo3JjYw2w==
X-Google-Smtp-Source: APXvYqzwOH98SgAnD5SDQMHUns16r8ldkHFrtDb0Q3HVojtJ8JC8Dm2IqDYd3FXluATryDb1bNRBCQ==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr8751070wmc.131.1576751592455; 
 Thu, 19 Dec 2019 02:33:12 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id i11sm5962942wrs.10.2019.12.19.02.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 02:33:11 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	lee.jones@linaro.org,
	linus.walleij@linaro.org
Date: Thu, 19 Dec 2019 10:31:50 +0000
Message-Id: <20191219103153.14875-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v6 08/11] dt-bindings: gpio: wcd934x: Add
	bindings for gpio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
gpio controller to control 5 gpios on the chip. This patch adds
required device tree bindings for it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/gpio/qcom,wcd934x-gpio.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
new file mode 100644
index 000000000000..32a566ec3558
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/qcom,wcd934x-gpio.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/qcom,wcd934x-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WCD9340/WCD9341 GPIO controller
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
+  gpio controller to control 5 gpios on the chip.
+
+properties:
+  compatible:
+    enum:
+      - qcom,wcd9340-gpio
+      - qcom,wcd9341-gpio
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - "#gpio-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    wcdgpio: gpio@42 {
+        compatible = "qcom,wcd9340-gpio";
+        reg = <0x042 0x2>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
+
+...
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
