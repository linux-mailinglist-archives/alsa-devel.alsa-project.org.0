Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 449194FF857
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 16:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA23E178D;
	Wed, 13 Apr 2022 16:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA23E178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649858555;
	bh=h0wzoW7Le5k1QDIGCZSFusSdPhQ2vJYgk89zImbp+mI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YljrMq1OWLRuJIAR7UFaxV2DkH1iXqYillfVN55J3fjh6qGJ6KvUgRXdRz/u85ebI
	 F2bb91oHM/rmQy+u6vSx+OQjfeE1Pzc5IyNiWdazdH5b2DfV3AbHIM9LWcM5xQG5kj
	 qcXB0ZQXoeNrWYFStQ/EHXB4ZD3N4ouTQfg8oTfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26B82F8028B;
	Wed, 13 Apr 2022 16:01:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50AEEF80248; Wed, 13 Apr 2022 16:01:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EEB9F80124
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 16:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EEB9F80124
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-ddfa38f1c1so2062850fac.11
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 07:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kj/dMLICDp8pu3HTv362IKpvU4oSd9uXdOmA9Gpau0o=;
 b=qvni9rimmiS2v3MPUiU2/TfcqHOHP1VKZx7wRGyVvy3Q+XeGQHDk5HASpBKw28NPhi
 stWKyZTIg1i5owBynJ66EQ3LtN7xmOAp18h7RPF3DyjS/bDrIWW0aTC0+cAibiNtQ36U
 Q3PK2/+xErGfIdH2D9Ccbt4B/TgjAzSsPnXGGZG3ul6GaBIDw+UwcDBZO21BOhPj6CmY
 nS8bqFJR6rvQnUrJQ/1DCWdNf9cFD16BG2xGvucTsUDoP2TY0giWoZVvVNX4J0cb2hD0
 YXrt0ksL4pGWoCzK4o/tYgpiuUqC4MYKVvAcnsesRpQpIJMaZhskoDbdZIkkzVN8wm3Y
 SOEg==
X-Gm-Message-State: AOAM531hJc/Cn5fLhkaNnz+2ZqtnpEz6z4oI3F5ckuHbqZB7gxpm6uU0
 cU0MFbqa5u5fSlm9jbtLnw==
X-Google-Smtp-Source: ABdhPJysepoRmg0UJTcPB4IkpN1yDuH8vtXxsQePwZZquqTXl0dPKH9xPDWoEW7s3ArRKkyQKapuAw==
X-Received: by 2002:a05:6870:8896:b0:da:f5e5:5b62 with SMTP id
 m22-20020a056870889600b000daf5e55b62mr4345486oam.229.1649858483572; 
 Wed, 13 Apr 2022 07:01:23 -0700 (PDT)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 c20-20020a4a2854000000b00329d3f076aasm2157772oof.24.2022.04.13.07.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 07:01:23 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: Fix array constraints on scalar properties
Date: Wed, 13 Apr 2022 09:01:21 -0500
Message-Id: <20220413140121.3132837-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-iio@vger.kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-hwmon@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Agathe Porte <agathe.porte@nokia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>
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

Scalar properties shouldn't have array constraints (minItems, maxItems,
items). These constraints can simply be dropped with any constraints under
'items' moved up a level.

Cc: Agathe Porte <agathe.porte@nokia.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-hwmon@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Cc: linux-iio@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml       | 5 ++---
 .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 4 +---
 Documentation/devicetree/bindings/media/coda.yaml            | 1 -
 .../devicetree/bindings/media/mediatek,vcodec-decoder.yaml   | 2 --
 .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml   | 2 --
 .../bindings/media/mediatek,vcodec-subdev-decoder.yaml       | 1 -
 .../devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml | 4 +---
 Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml  | 2 --
 8 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
index 801ca9ba7d34..e7493e25a7d2 100644
--- a/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
+++ b/Documentation/devicetree/bindings/hwmon/ti,tmp464.yaml
@@ -58,9 +58,8 @@ patternProperties:
           The value (two's complement) to be programmed in the channel specific N correction register.
           For remote channels only.
         $ref: /schemas/types.yaml#/definitions/int32
-        items:
-          minimum: -128
-          maximum: 127
+        minimum: -128
+        maximum: 127
 
     required:
       - reg
diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
index 7c260f209687..952bc900d0fa 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
@@ -108,9 +108,7 @@ patternProperties:
           - [1-5]: order 1 to 5.
           For audio purpose it is recommended to use order 3 to 5.
         $ref: /schemas/types.yaml#/definitions/uint32
-        items:
-          minimum: 0
-          maximum: 5
+        maximum: 5
 
       "#io-channel-cells":
         const: 1
diff --git a/Documentation/devicetree/bindings/media/coda.yaml b/Documentation/devicetree/bindings/media/coda.yaml
index 36781ee4617f..c9d5adbc8c4a 100644
--- a/Documentation/devicetree/bindings/media/coda.yaml
+++ b/Documentation/devicetree/bindings/media/coda.yaml
@@ -65,7 +65,6 @@ properties:
   iram:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: phandle pointing to the SRAM device node
-    maxItems: 1
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
index 9b179bb44dfb..aa55ca65d6ed 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
@@ -63,13 +63,11 @@ properties:
 
   mediatek,vpu:
     $ref: /schemas/types.yaml#/definitions/phandle
-    maxItems: 1
     description:
       Describes point to vpu.
 
   mediatek,scp:
     $ref: /schemas/types.yaml#/definitions/phandle
-    maxItems: 1
     description:
       Describes point to scp.
 
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index e7b65a91c92c..2746dea3ce79 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -55,13 +55,11 @@ properties:
 
   mediatek,vpu:
     $ref: /schemas/types.yaml#/definitions/phandle
-    maxItems: 1
     description:
       Describes point to vpu.
 
   mediatek,scp:
     $ref: /schemas/types.yaml#/definitions/phandle
-    maxItems: 1
     description:
       Describes point to scp.
 
diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 7687be0f50aa..c73bf2352aca 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -61,7 +61,6 @@ properties:
 
   mediatek,scp:
     $ref: /schemas/types.yaml#/definitions/phandle
-    maxItems: 1
     description: |
       The node of system control processor (SCP), using
       the remoteproc & rpmsg framework.
diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
index 2424de733ee4..d99a729d2710 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
@@ -104,8 +104,7 @@ properties:
   qcom,smem-state-names:
     $ref: /schemas/types.yaml#/definitions/string
     description: The names of the state bits used for SMP2P output
-    items:
-      - const: stop
+    const: stop
 
   glink-edge:
     type: object
@@ -130,7 +129,6 @@ properties:
       qcom,remote-pid:
         $ref: /schemas/types.yaml#/definitions/uint32
         description: ID of the shared memory used by GLINK for communication with WPSS
-        maxItems: 1
 
     required:
       - interrupts
diff --git a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
index b104899205f6..5de710adfa63 100644
--- a/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
+++ b/Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
@@ -124,7 +124,6 @@ properties:
     description: |
       Override the default TX fifo size.  Unit is words.  Ignored if 0.
     $ref: /schemas/types.yaml#/definitions/uint32
-    maxItems: 1
     default: 64
 
   renesas,rx-fifo-size:
@@ -132,7 +131,6 @@ properties:
     description: |
       Override the default RX fifo size.  Unit is words.  Ignored if 0.
     $ref: /schemas/types.yaml#/definitions/uint32
-    maxItems: 1
     default: 64
 
 required:
-- 
2.32.0

