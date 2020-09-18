Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB826FB70
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 13:28:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A024B16E4;
	Fri, 18 Sep 2020 13:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A024B16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600428508;
	bh=p4gLwOTXI2+3jP4zc7Yz+ZicFx0pazEsFwsxu1l5wno=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y4nw7G7ZSe5BqGKwBMTyF9DNO9eFH7xTps/jPCyugvGZ9daNdklXfo9iU0Gp8e3aJ
	 JzGg+FZx+o/YPT4EQCN4LSt5EKARlp6/Yr/RtMvd41uski8jsSZTUDujSv1LPioUvR
	 d64xw2vTrbb1Iq2DjOMLvoQYDg/4sXnuMfhG479A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA57BF80150;
	Fri, 18 Sep 2020 13:26:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEBFBF8015A; Fri, 18 Sep 2020 13:26:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94ADCF8012D
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 13:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94ADCF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="nV12yoOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=2871; q=dns/txt; s=axis-central1;
 t=1600428400; x=1631964400;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nf9xyKjOJLYLLbRB2/HBWzS8DPHd3qUqka4CHMmC6qo=;
 b=nV12yoOncZEy5pWYIahalrsKlOHvI7yyQXvSKbKvgEMv6iPt8YXhEV3M
 I/4Jw+XCZT9X/YSSK+x98INrBdMpPKqTwEsCbxdHzBAekEDatamdSg+ef
 x8cRH60Zkem5LTtBYlACI1u11Oe2K3umxPLu+I7PANFTHhxyltiU196zL
 4xyZrtmCC71Afde0qBxcrfvoUeiRX6DADsX6mCRxccTekv1iMT9gzgBhN
 D4OERwhEG2VgEyPJu/yKdZcJyFxwqv2Nq8nVAWTylXMNrnEiYYTfzoGko
 pAHSKZfQoQPXoqaJwTsdE4Dp7D3ozdzLRtGxufUOJDKWQnx+PRxZmL8jY A==;
IronPort-SDR: Wm68cUyutQ/yZufGg2RwvdgbyWG4H6Us9tO92e0nTRFhcL5G7fU2xmjltFz4EL6lutkaTb21Mx
 akPkFIUJ/kazqwkvHURjIqsrnL/0XAxDhDhahUzXf6ARYEw/DLK1faCn1aBQsvduNODlhk0/fv
 R2fTtMY4d4AYk2nymM6/apcdM3weTefCZm9YfEUuOQ0UB9cEcH0tR9wdyjLgBWi+5xb0tfkW3g
 2uMIDBAGbqx7i++lzvnX0nveQUcLUDaAWWiZZUxRH/AT8Y7oBRS2Nc+DNkbXUvs/FFnSOjGXHV
 9t4=
X-IronPort-AV: E=Sophos;i="5.77,274,1596492000"; d="scan'208";a="12636759"
From: Camel Guo <camel.guo@axis.com>
To: <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <tiwai@suse.com>, <dmurphy@ti.com>
Subject: [PATCH v4 1/2] dt-bindings: tlv320adcx140: Add GPIO config and drive
 config
Date: Fri, 18 Sep 2020 13:26:21 +0200
Message-ID: <20200918112622.17262-1-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kernel@axis.com,
 linux-kernel@vger.kernel.org, Camel Guo <camelg@axis.com>
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

Add properties for configuring the General Purpose Input Output (GPIO).
There are 2 settings for GPIO, configuration and the output drive type.

Signed-off-by: Camel Guo <camelg@axis.com>
Acked-by: Dan Murphy <dmurphy@ti.com>
---
 v4:
  - Rebase
 v3: 
  - Fix typo
  - Add Acked-By from Dan 

 .../bindings/sound/tlv320adcx140.yaml         | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
index e79f8d1891e4..798b366fe6d1 100644
--- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
@@ -140,6 +140,49 @@ patternProperties:
        4d - Drive weak low and active high
        5d - Drive Hi-Z and active high
 
+  ti,gpio-config:
+    description: |
+       Defines the configuration and output drive for the General Purpose
+       Input and Output pin (GPIO1). Its value is a pair, the first value is for
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
@@ -156,6 +199,7 @@ examples:
         ti,mic-bias-source = <6>;
         ti,pdm-edge-select = <0 1 0 1>;
         ti,gpi-config = <4 5 6 7>;
+        ti,gpio-config = <10 2>;
         ti,gpo-config-1 = <0 0>;
         ti,gpo-config-2 = <0 0>;
         reset-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
-- 
2.20.1

