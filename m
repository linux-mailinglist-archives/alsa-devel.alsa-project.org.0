Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCEE4CC691
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 20:51:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E02941AC8;
	Thu,  3 Mar 2022 20:51:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E02941AC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646337119;
	bh=b5BU+SAqqYljAtWCup3n4sht4Rd4PBW6aWFPDSVogxI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dXLnrOxlTE/2Yfb3d/9xnlohwBydVVRGo7V/XmQe9O1JlLjuIotIX2hzYix3JFVuS
	 D0jZ9fnF43P83Zf+ySLwl3O/KTd3yZTgjqkzv3mc/NoRzcJ2aCO3jeGj8QiKcjqZSU
	 oNnL35a7SXubgV6SNKw5H5aauFFUlIFez4m3RF8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65796F800F0;
	Thu,  3 Mar 2022 20:50:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC46FF80152; Thu,  3 Mar 2022 20:50:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3112F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 20:50:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3112F800F0
Received: by mail-ot1-f47.google.com with SMTP id
 k9-20020a056830242900b005ad25f8ebfdso5534750ots.7
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 11:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WhMaxl9TNUY7wmimyJIBPEvN19wmFM03Xz5lz5R1wLg=;
 b=B/d3OIMsrp7hZpUVWVmscCjyUxv1GdQcZXSj8gPZ+F1RioKIzWiRCLCEF0YbEcKMvJ
 x9nX5Qwsk2PCRQcalxpfhNPKB/lT9X6+Lomcpv74BeGdFIeG5vk7oJJ6BJS2+DGzxJC8
 Sg/pl6DSXT3RrBIIukBsJfR8CT1INeTdkGpP63+8/FmMBha6A2HwP9zAvATfXHRIcQIn
 jpEjV2B/y0Wj1/oBfHg74Pp849UQkLIion52E4vVG703K5YfaHwgfhK1+SGqy1NbokWq
 0x1BIbuIsn8Et7v7OL2iZ76lG9RHJgJBYrvgseGzPNsKwIxUK99Sc3CcXaewj5aezRsq
 yGKw==
X-Gm-Message-State: AOAM533WRK1OSnVdE/WhaHOnB2K9Cm0fpd8BiqJZIYwiKXVcfpbxnnUP
 +8aq73rxNnZJCuAcE3VRMg==
X-Google-Smtp-Source: ABdhPJxNkjR26g3ZjckCD3XAvZYDK3jRzlipdtAmUPlc+MmhHO0P1uj50SZKAybUR7H9R9TVdomSGQ==
X-Received: by 2002:a05:6830:920:b0:5af:ca85:67c4 with SMTP id
 v32-20020a056830092000b005afca8567c4mr18478108ott.363.1646337040861; 
 Thu, 03 Mar 2022 11:50:40 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.googlemail.com with ESMTPSA id
 bm5-20020a056820188500b0031c42eb457csm1367350oob.43.2022.03.03.11.50.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:50:40 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee.jones@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>, - <patches@opensource.cirrus.com>
Subject: [PATCH v2] dt-bindings: mfd: Fix pinctrl node name warnings
Date: Thu,  3 Mar 2022 13:50:34 -0600
Message-Id: <20220303195034.2261989-1-robh@kernel.org>
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

 Documentation/devicetree/bindings/mfd/brcm,cru.yaml          | 4 ++--
 Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml  | 4 ++--
 Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml | 3 ---
 3 files changed, 4 insertions(+), 7 deletions(-)

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
index c00ad3e21c21..a04570335b76 100644
--- a/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
+++ b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
@@ -126,7 +126,7 @@ properties:
       clock-frequency:
         const: 12288000
 
-  lochnagar-pinctrl:
+  pinctrl:
     type: object
     $ref: /schemas/pinctrl/cirrus,lochnagar.yaml#
 
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

