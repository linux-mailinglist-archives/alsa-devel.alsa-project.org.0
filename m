Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F6147B3DB
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Dec 2021 20:40:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BCA31774;
	Mon, 20 Dec 2021 20:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BCA31774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640029206;
	bh=lemlXquTS0nN8VDw9hKqIsDNGAze45CcccMhX4gx0fM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FNU2HMsBell7g2NBR7t5kYIs2fRmJDBUyppl1sC3cyEspMuIMb/i5fANrcpuH2Y9E
	 2G7H0rtiOOlCwJDdCKy1MWKssYTKKyv6WSNI1mRXvv/8A6wbketvlpbMfUmNuPnRSv
	 vZaOTPmgL3bSp5p70v4kmYKwVxBkgmgU7DxpCAD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74033F8028D;
	Mon, 20 Dec 2021 20:38:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC1EFF8025B; Mon, 20 Dec 2021 20:38:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from msg-4.mailo.com (ip-15.mailobj.net [213.182.54.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7452F80125
 for <alsa-devel@alsa-project.org>; Mon, 20 Dec 2021 20:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7452F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org
 header.b="jt81mpAI"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
 t=1640029070; bh=lemlXquTS0nN8VDw9hKqIsDNGAze45CcccMhX4gx0fM=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 b=jt81mpAIUX+vk9yJcW7r8Lsn6PTMWwbMPWvR+2pSGd+xGgEzFgQ1rytzMuD8s4pCy
 3yQ6MOxyfgY1mAamKJi42QnqNroEvFXybF/N9Ix0FO7drye6X5UrCzpzy0g17B2k/6
 3d3hsnF0gDZp4+9xvte6wzejzJH/GX6XPQ95wQTo=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via proxy.mailoo.org [213.182.55.207]
 Mon, 20 Dec 2021 20:37:50 +0100 (CET)
X-EA-Auth: b7Mo3T0KbdTHogRefIKytdYuExPxQulrJ6XWn+/8Bze2SmOx8jmtqxmb7O7UqDw2g42SGmgRi3w+z3Mdzy5T/ZQvpTkTNaTxuhtULkZDfrk=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 1/2] ASoC: dt-bindings: codecs: Add bindings for ak4375
Date: Mon, 20 Dec 2021 20:37:24 +0100
Message-Id: <20211220193725.2650356-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Vincent Knecht <vincent.knecht@mailoo.org>
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

AK4375 is an audio DAC with headphones amplifier controlled via I2C.
Add simple device tree bindings that describe how to set it up.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
Changed in v2:
- Changed avdd-supply to be required
- Picked up Rob's Reviewed-by
  Sorry if it was not appropriate following the avdd change...
---
 .../devicetree/bindings/sound/ak4375.yaml     | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ak4375.yaml

diff --git a/Documentation/devicetree/bindings/sound/ak4375.yaml b/Documentation/devicetree/bindings/sound/ak4375.yaml
new file mode 100644
index 000000000000..f1d5074a024d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ak4375.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ak4375.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AK4375 DAC and headphones amplifier Device Tree Bindings
+
+maintainers:
+  - Vincent Knecht <vincent.knecht@mailoo.org>
+
+properties:
+  compatible:
+    const: asahi-kasei,ak4375
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  avdd-supply:
+    description: regulator phandle for the AVDD power supply.
+
+  tvdd-supply:
+    description: regulator phandle for the TVDD power supply.
+
+  pdn-gpios:
+    description: optional GPIO to set the PDN pin.
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+  - avdd-supply
+  - tvdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      headphones: audio-codec@10 {
+        compatible = "asahi-kasei,ak4375";
+        reg = <0x10>;
+        avdd-supply = <&reg_headphones_avdd>;
+        tvdd-supply = <&pm8916_l6>;
+        pdn-gpios = <&msmgpio 114 GPIO_ACTIVE_HIGH>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&headphones_pdn_default>;
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.31.1



