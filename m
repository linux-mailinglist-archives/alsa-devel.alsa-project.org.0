Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B207F4CCA06
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 00:25:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 542A917EB;
	Fri,  4 Mar 2022 00:24:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 542A917EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646349934;
	bh=KJsLZsw2YUqixcZ+vZy6kIRO1uYoWK0zywCMicxr0rA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oV80BFmnndf1oRLqLX5Jwrp4XA9P0Zb7N2hkOnPadQS8+rNsBXEw5H2xB0eHe6A1W
	 p3Nj8jYBAaWJw0WQFcpoO+qVTf9Bt+yRaNCSekbPjJOHqaZKy8FYPKHnoaIhgcLoDu
	 O0AsKkew/uStdFDz8NVZanpqd/OFSE7UAjhX7W1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFBD2F80166;
	Fri,  4 Mar 2022 00:24:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A6B0F80152; Fri,  4 Mar 2022 00:24:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38089F80109
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 00:24:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38089F80109
Received: by mail-oo1-f49.google.com with SMTP id
 189-20020a4a03c6000000b003179d7b30d8so7586008ooi.2
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 15:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vfm2jK+tU0YA9XVn2HUL++BRTsYSj8H0ghNLcRVI0aY=;
 b=pxs1RyNy9LF/WgD46AH1tng+7xgx8hgz/QYrAVU8ngOfmq7vTyFL2xQ/oZaC6PYvEa
 cMlPxR3S42+635O6DD1+xdiYYi0pmOCCPO+daTKguKuxz8Mh3MuJFmzwAauxl8vrToNO
 iA9uI8qBHuG5PV1TjC82LS4/6wCVZqFKzOWvM3TYxezdWRdGDzTU34cpsVrOZAHQqdnU
 upmOnKyx+KFMb3ns0Gl3/SngtK5/i6Ga4INjh+9EDm9PDGwmu22QSGj5zX2QX/95XyJG
 zdKVaTO+KjuqU/OiEnBl80iSIZ/CQPL1QDFvUKKNEmygf1CCqsp8j4ZE4HvvJf+d88Iq
 LoEg==
X-Gm-Message-State: AOAM5327PG05Nx874X1GG9fcaKq/wUMHfIpLeOJiXT9Yv7AxjO+OI3+Q
 35puFHIM83QwgoUnNYU7Og==
X-Google-Smtp-Source: ABdhPJy/AfNGD3ko7bxz0ZgWRWoEoA/ewhRmp21gvsTgCpu1A+pig7QyPb5sbwgUIyO1QIXOWxOmYw==
X-Received: by 2002:a05:6870:f286:b0:d7:84b:f1bf with SMTP id
 u6-20020a056870f28600b000d7084bf1bfmr6015116oap.179.1646349854971; 
 Thu, 03 Mar 2022 15:24:14 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.googlemail.com with ESMTPSA id
 l6-20020a056870d3c600b000d75713938csm1724128oag.7.2022.03.03.15.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 15:24:14 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee.jones@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>, - <patches@opensource.cirrus.com>
Subject: [PATCH v3] dt-bindings: mfd: Fix pinctrl node name warnings
Date: Thu,  3 Mar 2022 17:23:49 -0600
Message-Id: <20220303232350.2591143-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
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

The recent addition pinctrl.yaml in commit c09acbc499e8 ("dt-bindings:
pinctrl: use pinctrl.yaml") resulted in some node name warnings:

Documentation/devicetree/bindings/mfd/cirrus,lochnagar.example.dt.yaml: \
 lochnagar-pinctrl: $nodename:0: 'lochnagar-pinctrl' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
Documentation/devicetree/bindings/mfd/cirrus,madera.example.dt.yaml: \
 codec@1a: $nodename:0: 'codec@1a' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: \
 pin-controller@1c0: $nodename:0: 'pin-controller@1c0' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'

Fix the node names to the preferred 'pinctrl'. For cirrus,madera,
nothing from pinctrl.yaml schema is used, so just drop the reference.

Fixes: c09acbc499e8 ("dt-bindings: pinctrl: use pinctrl.yaml")
Cc: Rafał Miłecki <rafal@milecki.pl>
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Fix lochnagar-pinctrl nodename in example
v3:
 - And fix lochnagar-pinctrl nodename in 'required'. Sigh...
---
 Documentation/devicetree/bindings/mfd/brcm,cru.yaml         | 4 ++--
 Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml | 6 +++---
 .../devicetree/bindings/pinctrl/cirrus,madera.yaml          | 3 ---
 3 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/brcm,cru.yaml b/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
index be4a2df71c25..b85819fbb07c 100644
--- a/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
+++ b/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
@@ -39,7 +39,7 @@ patternProperties:
   '^phy@[a-f0-9]+$':
     $ref: ../phy/bcm-ns-usb2-phy.yaml
 
-  '^pin-controller@[a-f0-9]+$':
+  '^pinctrl@[a-f0-9]+$':
     $ref: ../pinctrl/brcm,ns-pinmux.yaml
 
   '^syscon@[a-f0-9]+$':
@@ -94,7 +94,7 @@ examples:
             reg = <0x180 0x4>;
         };
 
-        pin-controller@1c0 {
+        pinctrl@1c0 {
             compatible = "brcm,bcm4708-pinmux";
             reg = <0x1c0 0x24>;
             reg-names = "cru_gpio_control";
diff --git a/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
index c00ad3e21c21..ad285cb480c9 100644
--- a/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
+++ b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
@@ -126,7 +126,7 @@ properties:
       clock-frequency:
         const: 12288000
 
-  lochnagar-pinctrl:
+  pinctrl:
     type: object
     $ref: /schemas/pinctrl/cirrus,lochnagar.yaml#
 
@@ -255,7 +255,7 @@ required:
   - reg
   - reset-gpios
   - lochnagar-clk
-  - lochnagar-pinctrl
+  - pinctrl
 
 additionalProperties: false
 
@@ -293,7 +293,7 @@ examples:
                 clock-frequency = <32768>;
             };
 
-            lochnagar-pinctrl {
+            pinctrl {
                 compatible = "cirrus,lochnagar-pinctrl";
 
                 gpio-controller;
diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
index c85f759ae5a3..8a90d8273767 100644
--- a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
@@ -107,9 +107,6 @@ properties:
 
     additionalProperties: false
 
-allOf:
-  - $ref: "pinctrl.yaml#"
-
 required:
   - pinctrl-0
   - pinctrl-names
-- 
2.32.0

