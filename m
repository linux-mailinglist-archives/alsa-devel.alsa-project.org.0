Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5363265B32
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 10:09:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE1661676;
	Fri, 11 Sep 2020 10:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE1661676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599811795;
	bh=C5m3RosdUvw/L8jpqQPJR6i8hfS4Qd3wM9VnYLKpAjQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SMuItT9oOzD027d4MQw/6ZOdfT+r93HynXxqJ+klNGSB0HKCMn6aVxJVBdpgZadqo
	 ARPp+B+afvWKmMaQ1V1mWPXf0HovxrwxUEipjGfUwQpJa6Tfj3rz474KqxM0ZSE26G
	 1qaQdlX76kWp9YAbDQ67pOO3eGgbWRdoP6nSjDG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4D49F80256;
	Fri, 11 Sep 2020 10:08:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3283F80240; Fri, 11 Sep 2020 10:08:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB66DF80115
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 10:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB66DF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="TMbNTQfP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=2770; q=dns/txt; s=axis-central1;
 t=1599811684; x=1631347684;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cPa4cUMFiotpZ68Fm/qKTiIofFwHyG7dO+acVYumhHg=;
 b=TMbNTQfPV3HcwVwEfOLVVtdj3X4q0Ip7QoKH5fcduBYr4gK+i0irCMEt
 s8vPwTny3dhkCk7iDGdD0yXcgwGkpk+9RSuWDi9OsMySwlPDAaXpcUfKK
 jGcD8XbzeCj0uGfewINj3dTwoSlryDBzwz7lORw3py/bddD/WLiomZf1H
 EZFz3sC2/Z4ou9vr3kDwoToOfHsT0H3RlF3shz8Mm4FRSr26ExbVXB66b
 TzXFO7mzd+LXbs8KfRe8ktVeIAt+MXI7FI5rX2+VCa52juabvfFpt89Km
 EB2Gl8LLEheWL55H9K2lW75HpoW5EZW0TjnxN1ZNVb5+iRIvakM9KUklB w==;
IronPort-SDR: 3tkqyX7XKLPM/R6pI8Xcz34ofl09t0Fwhm+XpilNpZqxb+Pa6otPLkk4027QJuX553TRbIioiQ
 z+y5l2YxCN97cn+I1nhuY/7QwdyDkP4UpLAwN/h5hZ5vCefBBq4EYjMDbIVbAAvAF2Klk5Ngra
 /lWUI20C163PB9adsex6cX+505NFBlMuPQTGpoELj5eg7kTw7lhh6jZq4QUXFyR9sLqlQdnQOy
 ctmei6aGyoYN+R6Yf65C4GKTMY7uHk4BxRB+KsPUOX6QjSaApUMesrk9WiG76y8obKquwrvAIX
 n9g=
X-IronPort-AV: E=Sophos;i="5.76,414,1592863200"; d="scan'208";a="12818358"
From: Camel Guo <camel.guo@axis.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <dmurphy@ti.com>
Subject: [PATCH v2 1/3] dt-bindings: tlv320adcx140: Add GPIO config and drive
 config
Date: Fri, 11 Sep 2020 10:07:51 +0200
Message-ID: <20200911080753.30342-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

From: Camel Guo <camelg@axis.com>

Add properties for configuring the General Purpose Input Outputs (GPIO).
There are 2 settings for GPIO, configuration and the output drive type.

Signed-off-by: Camel Guo <camelg@axis.com>
---
 .../bindings/sound/tlv320adcx140.yaml         | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
index f578f17f3e04..7b0b4554da59 100644
--- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
@@ -134,6 +134,49 @@ patternProperties:
        4d - Drive weak low and active high
        5d - Drive Hi-Z and active high
 
+  ti,gpio-config:
+    description: |
+       Defines the configuration and output driver for the general purpose
+       input and output pin (GPIO1). Its value is a pair, the first value is for
+       the configuration type and the second value is for the output drive
+       type. The array is defined as <GPIO1_CFG GPIO1_DRV>
+
+       configuration for the GPIO pin can be one of the following:
+       0 - disabled
+       1 - GPIO1 is configured as a general-purpose output (GPO)
+       2 - (default) GPIO1 is configured as a device interrupt output (IRQ)
+       3 - GPIO1 is configured as a secondary ASI output (SDOUT2)
+       4 - GPIO1 is configured as a PDM clock output (PDMCLK)
+       8 - GPIO1 is configured as an input to control when MICBIAS turns on or
+           off (MICBIAS_EN)
+       9 - GPIO1 is configured as a general-purpose input (GPI)
+       10 - GPIO1 is configured as a master clock input (MCLK)
+       11 - GPIO1 is configured as an ASI input for daisy-chain (SDIN)
+       12 - GPIO1 is configured as a PDM data input for channel 1 and channel 2
+            (PDMDIN1)
+       13 - GPIO1 is configured as a PDM data input for channel 3 and channel 4
+            (PDMDIN2)
+       14 - GPIO1 is configured as a PDM data input for channel 5 and channel 6
+            (PDMDIN3)
+       15 - GPIO1 is configured as a PDM data input for channel 7 and channel 8
+            (PDMDIN4)
+
+       output drive type for the GPIO pin can be one of the following:
+       0 - Hi-Z output
+       1 - Drive active low and active high
+       2 - (default) Drive active low and weak high
+       3 - Drive active low and Hi-Z
+       4 - Drive weak low and active high
+       5 - Drive Hi-Z and active high
+
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - minItems: 2
+        maxItems: 2
+        items:
+          maximum: 15
+        default: [2, 2]
+
 required:
   - compatible
   - reg
@@ -150,6 +193,7 @@ examples:
         ti,mic-bias-source = <6>;
         ti,pdm-edge-select = <0 1 0 1>;
         ti,gpi-config = <4 5 6 7>;
+        ti,gpio-config = <10 2>;
         ti,gpo-config-1 = <0 0>;
         ti,gpo-config-2 = <0 0>;
         reset-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
-- 
2.20.1

