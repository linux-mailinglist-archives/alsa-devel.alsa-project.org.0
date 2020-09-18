Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC8226FBB7
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 13:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7785A16E1;
	Fri, 18 Sep 2020 13:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7785A16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600429339;
	bh=p4gLwOTXI2+3jP4zc7Yz+ZicFx0pazEsFwsxu1l5wno=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HYsXJdUigWcRgtcM5wgbHZC1mPPlYQFL55ZGZW1lmlw1t2a9hiEddWde+T46gV5Mw
	 yLeNzJUJK3qkkT569Gegfz+G9qLQAkMA2iyJXgmV+VcTu6bTLNJc5r4ydVwMi8eZ9J
	 PGWj2I4SLEtOOiNyIfOVr08UN1VPAIUHolUZWC10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DDDCF8012D;
	Fri, 18 Sep 2020 13:40:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A33A9F8015C; Fri, 18 Sep 2020 13:40:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28E71F800E8
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 13:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28E71F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="iDyjxaey"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=2871; q=dns/txt; s=axis-central1;
 t=1600429231; x=1631965231;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nf9xyKjOJLYLLbRB2/HBWzS8DPHd3qUqka4CHMmC6qo=;
 b=iDyjxaeyQ8I36uhfZa5D374jEeAh772ICWkvd1PAOYGSip95fVGODOFg
 tyg619EKVOADPnhQY0eOv3iYa3goSgRd46toi8FinEzpjmoVBB3DL5PkS
 o+qkMggJWWipPTRtm67BHazyQoQPAcaj/fOo1hSnURt1c5JKmGc10/EYU
 LS30zmyDxPZ6L8esTjDBzo6dIWDYddzbz2dwugplsNHxa6YLVICnV4/eN
 CFYD74iO/la63DJARyVt9DMoVkgWOUHXRM8cDXjx+DdR18eFn6a+DPsww
 T+6iBZcbmiOox5HxK7s6k9iiw/LApB02ZWZEjbgJZL0vfZg9ZgzWJLwtc Q==;
IronPort-SDR: MeyJ+ipT9q80W1KxznfMpqfE4aU7/yQs4lPs05Y8+BohAR/d1+bypJN+EFkzhVi983AtROHYn3
 ym2J9g1K7jb7RiyEiWv2AFz6CT2cr7UMwvuqFW2nI7POTFlt7WidD+GBobSLbfUM+QnFfrtQBT
 Lbp7AD5Y2+iu9873B8TEGalLKd4h5EMo0qLDNkn4HDHF3PPVh3G4VUWbvWbOJD8BTsgFqckxQ7
 sGWCqfgQqZ1zMVP/O9fms0Z2auo9axhc73YzkDFHi8pNqIvtgnJUXO/4iDAQc9lWZPNKIavsF2
 Pmo=
X-IronPort-AV: E=Sophos;i="5.77,274,1596492000"; d="scan'208";a="12637619"
From: Camel Guo <camel.guo@axis.com>
To: <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <tiwai@suse.com>, <dmurphy@ti.com>
Subject: [PATCH v5 1/2] dt-bindings: tlv320adcx140: Add GPIO config and drive
 config
Date: Fri, 18 Sep 2020 13:40:24 +0200
Message-ID: <20200918114025.18205-1-camel.guo@axis.com>
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

