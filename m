Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 671921D2019
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 22:18:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05A3A1670;
	Wed, 13 May 2020 22:17:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05A3A1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589401081;
	bh=JrnumsbOMAo/nXOeqVDjsVNEQ187q5HoRsgJFD2++yI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TLUM/m7zuyveyrHkTFnN7Q+qr5YfOCpnj4MGZr/AV5Od6vFTizbPSHCiAr5iuA4Ds
	 BQzwD/fVsLFsRMn3ywqtkQt66b5Ndr/dDvavFJh4KG1r5C7ZhoPFQcoXOa/YsnUM5z
	 oGeOxM7Po0uzCYNS1yvndD59xr2/899T4r6a0BS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 393EFF80254;
	Wed, 13 May 2020 22:15:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71746F800BD; Wed, 13 May 2020 22:15:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C474F800BD
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 22:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C474F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="h05ZFNyJ"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04DKFQht122613;
 Wed, 13 May 2020 15:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589400926;
 bh=H30QMIFzoF2nkWUEQ+aNsHNe38YJ4A6p2K+vwiRIvOs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=h05ZFNyJrByhxULBd8H1XQzC7WSLa9PNGvvJ4TBrhFwqeqsF+t2Kcu7s7KgedIh1Q
 eOktVWAdmBXGq7hlGyJBdzfe1KDYtEOUEibBSuyeOvmxbE8r2w/zlBr47XJFdAd72g
 RcYihNk/n6fRbax+mPduA2L4xurtEqlXQlu9RXBs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04DKFQVp090834
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 May 2020 15:15:26 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 13
 May 2020 15:15:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 13 May 2020 15:15:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04DKFQsl017974;
 Wed, 13 May 2020 15:15:26 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH v2 2/3] ASoC: tlv320adcx140: Add device tree property for PDM
 edges
Date: Wed, 13 May 2020 15:05:48 -0500
Message-ID: <20200513200549.12213-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513200549.12213-1-dmurphy@ti.com>
References: <20200513200549.12213-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
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

Add a device tree property to configure the PDM sampling edge for each
digital microphone.

CC: Rob Herring <robh@kernel.org>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/sound/tlv320adcx140.yaml   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
index ab2268c0ee67..55668c7d261d 100644
--- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
@@ -63,6 +63,19 @@ properties:
       - $ref: /schemas/types.yaml#/definitions/uint32
       - enum: [0, 1, 2]
 
+  ti,pdm-edge-select:
+    description: |
+       Defines the sampling edge configuration for the PDM inputs.  This is an
+       array defined as <PDMIN1 PDMIN2 PDMIN3 PDMIN4>. 0 (default) is negative
+       sampling edge and 1 is positive sampling edge.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - minItems: 1
+        maxItems: 4
+        items:
+          maximum: 1
+        default: [0, 0, 0, 0]
+
 required:
   - compatible
   - reg
@@ -77,6 +90,7 @@ examples:
         compatible = "ti,tlv320adc5140";
         reg = <0x4c>;
         ti,mic-bias-source = <6>;
+        ti,pdm-edge-select = < 0 1 0 1>;
         reset-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
       };
     };
-- 
2.26.2

