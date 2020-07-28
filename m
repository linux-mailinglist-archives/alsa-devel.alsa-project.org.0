Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BB2230EF2
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 18:11:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A5CE16E1;
	Tue, 28 Jul 2020 18:10:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A5CE16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595952684;
	bh=TQgj8Zfuxonz23CLRu3YxUXJgNk85BnS4CaWL43yyio=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EayxcAFFJKjRgUmPp2T+MHKhAeHhxHGO7ts0Y6z0yT+KBk3SJqMbkZ97hVWXXUGpi
	 xthFbt5Lb5pnO8BVmC+GSRlA7BoPYVNhWgUzfkzsrjRAZNaXFcZ9NHuKIIeBIYYaCU
	 Kkm9xybFocoo3zc1ceS/UiZYPvTprZdMCS62ZAnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1DA1F802EA;
	Tue, 28 Jul 2020 18:08:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 652A6F802C2; Tue, 28 Jul 2020 18:08:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25D4CF800AD
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 18:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25D4CF800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="pCBjWdRa"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06SG8dA1088165;
 Tue, 28 Jul 2020 11:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1595952519;
 bh=jH/FfVEnikUTSnMw2PAY6KDVMFYv6J1+LWUGiztMq0U=;
 h=From:To:CC:Subject:Date;
 b=pCBjWdRaFi4WpowH2bq5c1Mr663qG5o4KvQ6J7j5jhNx+SoP1dOFlVwKa8TtJTxwZ
 nIENgCtzibsL+bx7gEJteOdA5KPKuh8q/MBP7ngwBcIHQ9BhgCMzd5AyW+W04TGy1e
 ME6rBc3xpRddcKxsD4TK0oJPHfwwJgQvaDDQYTJU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06SG8dxK014086
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Jul 2020 11:08:39 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 28
 Jul 2020 11:08:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 28 Jul 2020 11:08:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06SG8dWm080108;
 Tue, 28 Jul 2020 11:08:39 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>
Subject: [PATCH 1/2] dt-bindings: tlv320adcx140: Add GPO config and drive
 config
Date: Tue, 28 Jul 2020 11:08:32 -0500
Message-ID: <20200728160833.24130-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
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

Add properties for configuring the General Purpose Outputs (GPO). The
GPOs. There are 2 settings for each GPO, configuration and the output drive
type.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../bindings/sound/tlv320adcx140.yaml         | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
index 2e6ac5d2ee96..0950eb69f2b2 100644
--- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
+++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
@@ -108,6 +108,32 @@ properties:
       maximum: 7
     default: [0, 0, 0, 0]
 
+patternProperties:
+ '^ti,gpo-config-[1-4]$':
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+       Defines the configuration and output driver for the general purpose
+       output pins (GPO).  These values are pairs, the first value is for the
+       configuration type and the second value is for the output drive type.
+       The array is defined as <GPO_CFG GPO_DRV>
+
+       GPO output configuration can be one of the following:
+
+       0 - (default) disabled
+       1 - GPOX is configured as a general-purpose output (GPO)
+       2 - GPOX is configured as a device interrupt output (IRQ)
+       3 - GPOX is configured as a secondary ASI output (SDOUT2)
+       4 - GPOX is configured as a PDM clock output (PDMCLK)
+
+       GPO output drive configuration for the GPO pins can be one of the following:
+
+       0d - (default) Hi-Z output
+       1d - Drive active low and active high
+       2d - Drive active low and weak high
+       3d - Drive active low and Hi-Z
+       4d - Drive weak low and active high
+       5d - Drive Hi-Z and active high
+
 required:
   - compatible
   - reg
@@ -124,6 +150,8 @@ examples:
         ti,mic-bias-source = <6>;
         ti,pdm-edge-select = <0 1 0 1>;
         ti,gpi-config = <4 5 6 7>;
+        ti,gpo-config-1 = <0 0>;
+        ti,gpo-config-2 = <0 0>;
         reset-gpios = <&gpio0 14 GPIO_ACTIVE_HIGH>;
       };
     };
-- 
2.28.0

