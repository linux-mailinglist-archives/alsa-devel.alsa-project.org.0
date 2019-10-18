Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F29DBAC9
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 02:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53E31678;
	Fri, 18 Oct 2019 02:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53E31678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571358316;
	bh=nDqlGsvTJg5GtbU/5LkzzJ+rnF6AvHrj8jJCOkp2woM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WdPdFAor4saCKjAypd7Q81zLAB+YAAJ7R+w3s/0XR0g6o8pw3S9QoMasCu2a69T9H
	 6IMlC4d4XmwgxtN+j6bahkk+MHbcvYdmuRgzkBJO1LQ9QUKWKlnt6t7MXWvgsL8pnT
	 U1yxwREFoxEWXtVvFjJvKK5credsQPb3Y2sDeDQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FDA3F8065D;
	Fri, 18 Oct 2019 02:20:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D21A1F80639; Fri, 18 Oct 2019 02:20:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 270E9F805FD
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 02:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 270E9F805FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LIaho/b0"
Received: by mail-wm1-x341.google.com with SMTP id v17so4308208wml.4
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QGtqqoloz6hjB0cfAJP9qri2qA1iaYEqSaS6htthArs=;
 b=LIaho/b0J0bCWjv6CBIj3ZqtNf200u7TNu0EqK9EI/D1EbS9cAYhiXleb9Uuiaqiu/
 fXTNI2o/N4Ml6abfGPssQl9a3BGnzm9yUVQrdqtGthafs5VwIdKWiFle8XjR6MBn5VZT
 bsHgs7DnzUSfOZcfj8Scuv913Cu8IdvSTdCkK2X/FqwpHtzfaKSYL1iNHBPtwKy+IXju
 dge0dRglAXmJRAT8ibNcpVEbZ5d9nm9VTdo4kRCCDgKVtgKZDN4MVeGa/tulRTotYkk6
 EbCi4a6rWfry6/yYGE5QMVEuWuLY/WZLHAkqUD4pYofrxv3I3xrhzFiQ9UXPi3lX0WKH
 nSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QGtqqoloz6hjB0cfAJP9qri2qA1iaYEqSaS6htthArs=;
 b=DxgOhjvpwRodbycGjBoKfdNGMxoKQLA4FtIE32MwaWuKCK0ulfZHFxfC699pyhRlwx
 jqhwnYAgl7T3FuD6DKP6wqLqc4EvMBoMNY987WLLHry4ZImCLPVEMS3Ol115ahS5ryEY
 ONeXPIe52WjFjTVc50qdK3DiSdF3hZPczDGzYEkSkESCJRKLyIzrYHOcuwoL5LuNaiKB
 8bQ/QM9X8NQn3dUfQlrwATUpnvwx88iCi8TNd2aUQuh/eG3cd5vzMwhBmvNsfZvMrOjt
 kumweelluo0AwlgUFHCGxkW8WpAJgKHWvN4caEJV1uqiK644UaMb5rGy36C3HWs1+gWF
 Ja2Q==
X-Gm-Message-State: APjAAAWn1+3mU/9A0mHncXSg/4Ka9STK5BA/OxkJMoOsvqIFpTRNtqq0
 X7HdRzzzUsbjVd8d00zycamIAacfSCs=
X-Google-Smtp-Source: APXvYqx1D7V2pK2CNerimKn2kRSQmnmpBiXII2FunyzWAOtbGGBEB9dmQc42ffr4CshM5SaUVCtzuA==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr4991011wmc.80.1571358007133; 
 Thu, 17 Oct 2019 17:20:07 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id z189sm4851248wmc.25.2019.10.17.17.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 17:20:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
 lee.jones@linaro.org
Date: Fri, 18 Oct 2019 01:18:46 +0100
Message-Id: <20191018001849.27205-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v2 08/11] dt-bindings: pinctrl: qcom-wcd934x:
	Add bindings for gpio
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
---
 .../pinctrl/qcom,wcd934x-pinctrl.yaml         | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
new file mode 100644
index 000000000000..c8a36cbc4935
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,wcd934x-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: WCD9340/WCD9341 GPIO Pin controller
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
+      - qcom,wcd9340-pinctrl
+      - qcom,wcd9341-pinctrl
+
+  reg:
+    maxItems: 1
+
+  gpio-controller: true
+
+  gpio-ranges:
+    maxItems: 1
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - gpio-controller
+  - gpio-ranges
+  - "#gpio-cells"
+
+
+examples:
+  - |
+    wcdpinctrl: wcdpinctrl@42 {
+        compatible = "qcom,wcd9340-pinctrl";
+        reg = <0x042 0x2>;
+        gpio-controller;
+        gpio-ranges = <&wcdpinctrl 0 0 5>;
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
