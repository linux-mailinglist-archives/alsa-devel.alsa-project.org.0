Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C9937A30F
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 11:10:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F16991786;
	Tue, 11 May 2021 11:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F16991786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620724243;
	bh=ng0zdv9MtGw4RQmlOInYW8acJHPVCJ1GaSptKfbkA0Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YXn8OjN7xDDyME/uJlyiVqFcWRuiZ+u9jIhcKN8NPrvNSGWc6GCXkctfVmUZimDXF
	 dlEIdAGq1pgc7y/kWkWnY1l42wfNGGa1KIZOxvEMlaUMjXZe9KtrRCC3rPxH57SiM7
	 GjO4G+L/vtO1K0g3qLL2G710kCb882CWHG0Z2zOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58822F8042F;
	Tue, 11 May 2021 11:08:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A56FF80240; Mon, 10 May 2021 22:45:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9327FF800EA
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 22:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9327FF800EA
Received: by mail-ot1-f48.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so2222082otc.6
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 13:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iT6yh/cPHLGtBTa1IYIRkFWCRkmzrN2dS0BaWLF63LY=;
 b=f010aTDbGz8cNWzEGc6Y09AEiCV9LCtg4B4UxcNMQB8p0jKsvXvffwWGVbUaCChTMl
 P7Mt0Z8QFABXxeLtgzrkdo8wOe3SFz+pyssTgXlLlQVWgbXI5AH5nTKHvcl4xYk4psbU
 2YnhIhNMHUXHrLlqJstwbSjrBAMFww/Wykb+neM04gxwLqAGFT0paKCW0kvtoROnPmdU
 raR48zimvCJ9cycoaNfLW3zKigHv7O+AceNrLS2/sRFcsqXzxi2S+VzgnZ9jYpJpSYJV
 vOrwZVWqpDw43XTdks4YQ2Nhkj59D/YVOHwk1bINUzR3Zajef0uby5eX4Jx/W/VbBZfN
 NGQQ==
X-Gm-Message-State: AOAM533x454jE53XPCkBrpo8dJ7+jH6MjwpGbs6czdcfVd3xI1WZoMX5
 ggGzfz/LR79kIf+pghAsow==
X-Google-Smtp-Source: ABdhPJwgrvtWQSp23OuaxQoKqHfbE3fMubvosTqs2k+Gkw6N64h91HjzWMGpRK+NaEo44+Q6KznypA==
X-Received: by 2002:a05:6830:1556:: with SMTP id
 l22mr22884062otp.34.1620679527190; 
 Mon, 10 May 2021 13:45:27 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id i2sm3307576oto.66.2021.05.10.13.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 13:45:26 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: More removals of type references on common
 properties
Date: Mon, 10 May 2021 15:45:24 -0500
Message-Id: <20210510204524.617390-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 May 2021 11:08:22 +0200
Cc: alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, linux-input@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Odelu Kukatla <okukatla@codeaurora.org>, linux-pm@vger.kernel.org,
 Luca Ceresoli <luca@lucaceresoli.net>, Mark Brown <broonie@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-arm-kernel@lists.infradead.org, Alex Elder <elder@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Georgi Djakov <djakov@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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

Users of common properties shouldn't have a type definition as the
common schemas already have one. A few new ones slipped in and
*-names was missed in the last clean-up pass. Drop all the unnecessary
type references in the tree.

A meta-schema update to catch these is pending.

Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Georgi Djakov <djakov@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>
Cc: Odelu Kukatla <okukatla@codeaurora.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Cc: linux-iio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-input@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/idt,versaclock5.yaml    | 2 --
 .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml         | 1 -
 Documentation/devicetree/bindings/input/input.yaml              | 1 -
 Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml   | 1 -
 Documentation/devicetree/bindings/net/qcom,ipa.yaml             | 1 -
 .../devicetree/bindings/power/supply/sc2731-charger.yaml        | 2 +-
 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml          | 2 +-
 7 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index c268debe5b8d..28675b0b80f1 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -60,7 +60,6 @@ properties:
     maxItems: 2
 
   idt,xtal-load-femtofarads:
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 9000
     maximum: 22760
     description: Optional load capacitor for XTAL1 and XTAL2
@@ -84,7 +83,6 @@ patternProperties:
         enum: [ 1800000, 2500000, 3300000 ]
       idt,slew-percent:
         description: The Slew rate control for CMOS single-ended.
-        $ref: /schemas/types.yaml#/definitions/uint32
         enum: [ 80, 85, 90, 100 ]
 
 required:
diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
index 6f2398cdc82d..1e7894e524f9 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
@@ -102,7 +102,6 @@ patternProperties:
 
       st,adc-channel-names:
         description: List of single-ended channel names.
-        $ref: /schemas/types.yaml#/definitions/string-array
 
       st,filter-order:
         description: |
diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
index 74244d21d2b3..d41d8743aad4 100644
--- a/Documentation/devicetree/bindings/input/input.yaml
+++ b/Documentation/devicetree/bindings/input/input.yaml
@@ -38,6 +38,5 @@ properties:
       Duration in seconds which the key should be kept pressed for device to
       reset automatically. Device with key pressed reset feature can specify
       this property.
-    $ref: /schemas/types.yaml#/definitions/uint32
 
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
index cb6498108b78..36c955965d90 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
@@ -92,7 +92,6 @@ properties:
       this interconnect to send RPMh commands.
 
   qcom,bcm-voter-names:
-    $ref: /schemas/types.yaml#/definitions/string-array
     description: |
       Names for each of the qcom,bcm-voters specified.
 
diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
index 7443490d4cc6..5fe6d3dceb08 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -105,7 +105,6 @@ properties:
       - description: Whether the IPA clock is enabled (if valid)
 
   qcom,smem-state-names:
-    $ref: /schemas/types.yaml#/definitions/string-array
     description: The names of the state bits used for SMP2P output
     items:
       - const: ipa-clock-enabled-valid
diff --git a/Documentation/devicetree/bindings/power/supply/sc2731-charger.yaml b/Documentation/devicetree/bindings/power/supply/sc2731-charger.yaml
index db1aa238cda5..b62c2431f94e 100644
--- a/Documentation/devicetree/bindings/power/supply/sc2731-charger.yaml
+++ b/Documentation/devicetree/bindings/power/supply/sc2731-charger.yaml
@@ -20,7 +20,7 @@ properties:
     maxItems: 1
 
   phys:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
     description: phandle to the USB phy
 
   monitored-battery:
diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index b4c190bddd84..61802a11baf4 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -49,7 +49,7 @@ properties:
     maxItems: 1
 
   memory-region:
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
     description:
       phandle to a node describing reserved memory (System RAM memory)
       The M core can't access all the DDR memory space on some platform,
-- 
2.27.0

