Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA27F27EF73
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 18:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 624C4183F;
	Wed, 30 Sep 2020 18:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 624C4183F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601484014;
	bh=xUByHiyZnc0u0GArJKw6O6m6qqno7GOujggKNiE4x+8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GKnQpIPlwnETW17nqncHOxV6o4NKUsXwatueXrrXHzN+zSugUyhBZFcquKh2i5cor
	 UoLZh/575ZQXqSt4iuOeBKcnZfxKJtZxM3f7m6ruiTs9+c271WQUgIFC+zNYy+zlIC
	 DMV3lTwAGLuFMmVpbVjR9kcrJD34AGc31aXz8S5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 707D2F801F9;
	Wed, 30 Sep 2020 18:38:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49AC4F801ED; Wed, 30 Sep 2020 18:38:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B18A4F800AB
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 18:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B18A4F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DSspbDPy"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08UGcLpo100181;
 Wed, 30 Sep 2020 11:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601483901;
 bh=+9e+e3U3sfHhwn5PMnTHu6NY606IQ6st10bFkNcuyR0=;
 h=From:To:CC:Subject:Date;
 b=DSspbDPyu9QOLJewr7aT4vS/fsr0fmTW0yr9BeU2GUBXyDRBf0OkLcxkS3+TpM8zy
 MCg+4rw1bQJQtHvsr13nwpCKTR53xVheCzFLhalY1P8OVI7uB3hplAHpDCcuze1kxl
 6djzvtrAcb/W/alFvRcNpIxdjtidw7xS18LJWDC8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08UGcLKd120041
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 11:38:21 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 30
 Sep 2020 11:38:21 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 30 Sep 2020 11:38:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08UGcK3g016759;
 Wed, 30 Sep 2020 11:38:20 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <robh+dt@kernel.org>
Subject: [PATCH 1/2] dt-bindings: tas2764: Add the TAS2764 binding doc
Date: Wed, 30 Sep 2020 11:38:08 -0500
Message-ID: <20200930163809.6978-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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

Add the binding for the TAS2764 Smart Amplifier.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 .../devicetree/bindings/sound/tas2764.yaml    | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas2764.yaml

diff --git a/Documentation/devicetree/bindings/sound/tas2764.yaml b/Documentation/devicetree/bindings/sound/tas2764.yaml
new file mode 100644
index 000000000000..4e758ff81003
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas2764.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/tas2764.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Texas Instruments TAS2764 Smart PA
+
+maintainers:
+  - Dan Murphy <dmurphy@ti.com>
+
+description: |
+  The TAS2764 is a mono, digital input Class-D audio amplifier optimized for
+  efficiently driving high peak power into small loudspeakers.
+  Integrated speaker voltage and current sense provides for
+  real time monitoring of loudspeaker behavior.
+
+properties:
+  compatible:
+    enum:
+      - ti,tas2764
+
+  reg:
+    maxItems: 1
+    description: |
+       I2C address of the device can be between 0x38 to 0x45.
+
+  reset-gpio:
+    description: GPIO used to reset the device.
+
+  shutdown-gpios:
+    description: GPIO used to control the state of the device.
+
+  interrupts:
+    maxItems: 1
+
+  ti,imon-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TDM TX current sense time slot.
+
+  ti,vmon-slot-no:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: TDM TX voltage sense time slot.
+
+  '#sound-dai-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/gpio/gpio.h>
+   i2c0 {
+     #address-cells = <1>;
+     #size-cells = <0>;
+     codec: codec@38 {
+       compatible = "ti,tas2764";
+       reg = <0x38>;
+       #sound-dai-cells = <1>;
+       interrupt-parent = <&gpio1>;
+       interrupts = <14>;
+       reset-gpio = <&gpio1 15 0>;
+       shutdown-gpios = <&gpio1 15 0>;
+       ti,imon-slot-no = <0>;
+       ti,vmon-slot-no = <2>;
+     };
+   };
+
+...
-- 
2.28.0.585.ge1cfff676549

