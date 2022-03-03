Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326A44CC683
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 20:49:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5FD518AA;
	Thu,  3 Mar 2022 20:48:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5FD518AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646336973;
	bh=rO4HGt6MVmy4sV4n6+y5x/CW/fQZC+UV5sLuGKXUndg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Es5hyhchKmMWCR4/Ux4DWOmgLktZyTCLtU6LjNV2wIWY2McSErQPkVad8fgYcMhfy
	 rO6JxD8n7NacGJAF4Ron3sjBsUzGwoeKH0X1uwZ68yGrHD/xAES/t+3gUBapSXGhbT
	 kGIlAnkZoDXohyGIOrRj6cF7/V9+Z8/w/DQ/Y4B0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11F44F80166;
	Thu,  3 Mar 2022 20:48:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1FB2F800F0; Thu,  3 Mar 2022 20:48:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FE55F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 20:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FE55F800F0
Received: by mail-oo1-f47.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso6990467ooa.4
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 11:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9yFbGp0EZ8ry89Lh1bMjpmj2K73JEWfQSj/2tdftbTg=;
 b=IBScR9GiYnIVBRkzUPmzNgKkZDcQTqCY74sAT74xCn1Ze58BIboP0wgfAg+t+wYdKt
 0bj5WZhofTQROxgbadsNR7cghErXiBnGZVzfFQv38mVQssuDgXgd52hMRy/vcxNyIf+c
 2epNVpfk2Mj3B/U8ghH7JomEYk1tnZsTTIqLqQAXrcSscqKiCcMKR6WVPH80+kad628N
 Z9//iApXsClslgrTJb35HwP5+6/psXd9Ppyi0yJaCI9sh71LZfONM8AJjYNb/wWRao0p
 Yt3/MgLGliKNNOFKSwAf83Deq5+D02fsnNxekHfimG7bXBQSLYyylW04z7HRs/MXeYFG
 jXAQ==
X-Gm-Message-State: AOAM530WiKiW0/2TZCpdXzEfSfdJLGNwzRLSaXlx5ckBIr2C/kp3Iomf
 UmMRADkiGSfsHWclCbRK7w==
X-Google-Smtp-Source: ABdhPJyTGsyf+8qFhYYvUNW2ISTyF/8adw+l7DqOzzvPLIU9gt+qyaJ1gyJmKaUVl9jH6aWYPV40sw==
X-Received: by 2002:a05:6870:b427:b0:d3:5044:db1b with SMTP id
 x39-20020a056870b42700b000d35044db1bmr5123974oap.2.1646336892232; 
 Thu, 03 Mar 2022 11:48:12 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.googlemail.com with ESMTPSA id
 w15-20020a9d70cf000000b005ad26785e7dsm1360906otj.57.2022.03.03.11.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 11:48:11 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee.jones@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>, - <patches@opensource.cirrus.com>
Subject: [PATCH] dt-bindings: mfd: Fix pinctrl node name warnings
Date: Thu,  3 Mar 2022 13:47:37 -0600
Message-Id: <20220303194737.2258809-1-robh@kernel.org>
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
 Documentation/devicetree/bindings/mfd/brcm,cru.yaml          | 4 ++--
 Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)

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
index c00ad3e21c21..975a46f3c46f 100644
--- a/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
+++ b/Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml
@@ -126,7 +126,7 @@ properties:
       clock-frequency:
         const: 12288000
 
-  lochnagar-pinctrl:
+  pinctrl:
     type: object
     $ref: /schemas/pinctrl/cirrus,lochnagar.yaml#
 
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

