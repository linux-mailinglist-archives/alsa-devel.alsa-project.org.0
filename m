Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F94349329C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jan 2022 02:55:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 201DB2DFA;
	Wed, 19 Jan 2022 02:55:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 201DB2DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642557354;
	bh=5rFmBURZkN8HrXOzHNzSNjgpgAjjQjU3npfWRh5tGpA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bwhp4mQsyzbcOLONNROLrWaeHP4SJ8GrCoZr6ASEgMTSBMsD4H+viwa3lWX/1O6Oi
	 VMq/3iP1LdRSm9fGeQTxmk+Gt/ZR7Izd9WONvgWdsjJ5X/rafE9AsZAecvQe/6PmTw
	 lVAcOKYyhhsWOVzwMZVtqVYN43YBZA4ejwLGWCV0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99352F800D8;
	Wed, 19 Jan 2022 02:54:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0A43F8023B; Wed, 19 Jan 2022 02:54:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23FE9F800D8
 for <alsa-devel@alsa-project.org>; Wed, 19 Jan 2022 02:54:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23FE9F800D8
Received: by mail-ot1-f47.google.com with SMTP id
 l64-20020a9d1b46000000b005983a0a8aaaso1047171otl.3
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 17:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qwNF7gDQbaVP4ndpQ6YMR5OTB3DEGyDODGB0cvvqRfI=;
 b=3PbuZf53KbChtlzRPyR9tofJLBSqx8OBgzOlrCN6YAVrrlLrNgkez/psD4UyUc/KJ6
 tt7EEmWEZNoiBM5jioiXhCcZEIYM0S7W0sWlXqdnvlq98haiysVenKkJOTW0rxKfqsFu
 EZZyJlqMbG7K2Ah8oexIrSQ0hfhLBl6SQ8hrnGrZ5uck/PTB23yDV8XulCLiMwh/WLeS
 qDsM5/tTCZLd2OzzCEOeNB+N218xCm27LvkT3y9r4Sy0o1vO91b/duIMwiHAgV1FfMKO
 GY9f0UIt3y728WuWpvg0dUmxWN+4v0o+iwAW9G2FRMj51dbFsulDkCGo5ClOaOtPTJyp
 FAwQ==
X-Gm-Message-State: AOAM530jIXjr97rVN+Z5bvCCFQvvxys8ewbMnBA/GYhoDOSpRT3RV8ve
 uk2t4gUAsylUkCAfUgtV5A==
X-Google-Smtp-Source: ABdhPJzVUKXAC2YcMFSv4hVv2ACgxjnkM4ifG2UCVa32kabvoUCd5Cz5lVIyctz4yYEGV/7yATw++g==
X-Received: by 2002:a9d:4b13:: with SMTP id q19mr22246546otf.300.1642557282257; 
 Tue, 18 Jan 2022 17:54:42 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id x26sm8030086ote.78.2022.01.18.17.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 17:54:41 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 - <patches@opensource.cirrus.com>
Subject: [PATCH] dt-bindings: Drop unnecessary pinctrl properties
Date: Tue, 18 Jan 2022 19:53:25 -0600
Message-Id: <20220119015325.2438277-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

For a single pinctrl mode, it is not necessary to define pinctrl
properties as the tools always allow pinctrl properties.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../display/rockchip/rockchip,rk3066-hdmi.yaml         |  8 --------
 Documentation/devicetree/bindings/input/gpio-keys.yaml |  6 ------
 .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml  |  9 ---------
 .../devicetree/bindings/pinctrl/cirrus,madera.yaml     | 10 ----------
 .../devicetree/bindings/sound/samsung-i2s.yaml         |  6 ------
 5 files changed, 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
index 008c144257cb..1a68a940d165 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,rk3066-hdmi.yaml
@@ -26,14 +26,6 @@ properties:
   clock-names:
     const: hclk
 
-  pinctrl-0:
-    maxItems: 2
-
-  pinctrl-names:
-    const: default
-    description:
-      Switch the iomux for the HPD/I2C pins to HDMI function.
-
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index dbe7ecc19ccb..7fe1966ea28a 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -88,12 +88,6 @@ patternProperties:
             which can be disabled to suppress events from the button.
           type: boolean
 
-        pinctrl-0:
-          maxItems: 1
-
-        pinctrl-names:
-          maxItems: 1
-
       required:
         - linux,code
 
diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
index 80020539c3bb..5cd512b7d5ba 100644
--- a/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.yaml
@@ -51,15 +51,6 @@ properties:
       appropriate of the LOCHNAGARx_PIN_NUM_GPIOS define, see [3].
     maxItems: 1
 
-  pinctrl-0:
-    description:
-      A phandle to the default pinctrl state.
-
-  pinctrl-names:
-    description:
-      A pinctrl state named "default" must be defined.
-    const: default
-
   pin-settings:
     type: object
     patternProperties:
diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
index e50d7ad5c229..c85f759ae5a3 100644
--- a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
@@ -30,16 +30,6 @@ description: |
     Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
 
 properties:
-  pinctrl-0:
-    description:
-      A phandle to the node containing the subnodes containing default
-      configurations.
-
-  pinctrl-names:
-    description:
-      A pinctrl state named "default" must be defined.
-    const: default
-
   pin-settings:
     description:
       One subnode is required to contain the default settings. It
diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
index 2e3628ef48df..84c4d6cba521 100644
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -110,12 +110,6 @@ properties:
       Internal DMA register base address of the audio
       subsystem (used in secondary sound source).
 
-  pinctrl-0:
-    description: Should specify pin control groups used for this controller.
-
-  pinctrl-names:
-    const: default
-
   power-domains:
     maxItems: 1
 
-- 
2.32.0

