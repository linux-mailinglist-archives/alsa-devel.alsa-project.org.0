Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EAE37F5CF
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 12:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05E6C17E6;
	Thu, 13 May 2021 12:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05E6C17E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620902724;
	bh=bqlshS0S2XCdLHNDJbncerW+nqpUCEUAtMiuiwFPvJw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sXLllZSbpLTU4jLoCS4r/QSX7FBv2bIp/WxCIEQR43MNN3GPYtIg3Csu5gA46SxDK
	 sel1w83cJQv+KA/LGv61OSp0JkXIpb1slp08TCs5f7FUOcqat9ZSXi1GRDi6jE/duQ
	 n42HO7k9zToZIcV8K7OLQOtJb6sCdoX+a9N+1dlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03AF3F8028D;
	Thu, 13 May 2021 12:43:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF1ECF8012E; Thu, 13 May 2021 12:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36DCFF8012E
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 12:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36DCFF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="ocwmxCcg"
ARC-Seal: i=1; a=rsa-sha256; t=1620902603; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=EGNaYPHQlC5lU8PXw+0QOkJ4hDBr7oBSDswKwXD9IBH6F//YyUFB4+fxgq1T0bVRmr
 Az16hyk2XBr3LXWUi6qypoyPB0aNAZLTXC2n03jNy3Mjy+f4HeLN2ukqVvkhXvteMeiq
 P7gl51PTA26mX+gm92BSuxBnQmsPfmdmx2ATAQ00AI+VU5L4bFev5rAlMFanW2mxtzdE
 0nkCA5CwI9UmXHyZCaXTS8Y9e5YLELhj4DOKm4dpRPfaiTRx4pkceDiHQlyW8rt/8MlE
 FmnoxCDvaGPF8RoldQp5sSa9sRIiIjREkv+1FiMe9iQPSo2DK9XhSeUtbwnH1ojiCLEF
 aJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620902603;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=n1wCL+fq1gwX1B/7sXKYovHlJD7nUV7ac25vUwP6dCc=;
 b=poqgbDGewXJY/QkYvTcX7YDGL/znb08isg5oMziRZ7XWxrneDbGQRPdUSV61LbMv3N
 XToFBAl9FhR9x+w9HwyTkBWDTZ7uwsfeFlEUfDHUKJtXtFIyeSbPWaVNlNN7WW1lQf+m
 smOPdXFFG5n1+L2KyHaZ4iG9ayx5mmB5rohy9SvSNvxkmbH0AyIh6NZSOyF2FfFypW+i
 5T1xa8c0HlzMaO1BBkIPAqohGeGuOt6mrKKdCyCa4KnxtlQlkFHj3sPAZWmzd2ydAIjM
 m2aOvPjK+uVnVS3cXDieJ0KUQXOFi9JKsHKnYBDDSCTiYa2D7HuVisyhNKxlk9Nuen3n
 nneA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620902603;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=n1wCL+fq1gwX1B/7sXKYovHlJD7nUV7ac25vUwP6dCc=;
 b=ocwmxCcgnSmnlKSoPT3ig/B4+VTQC6O1CN701poWxWHjeU0GrtlmmPChm0lQTP+v8J
 C9BgmfS8HAFFpzqNx4Hhz3my9EUPTh2vcLX8m59cRByvu02oUnGW/N0Licw6YRDggzvT
 mvyn+9NWoYbg21/RTeTjSxd1kms6AMq8Tk0wSSKHazn+eOIrcpIXOrxFkVKa6mLrvBWr
 7xRe9FwQFzBdpR1IxYmrIvM0nwkjMXFMfRN8T3XKNBxY1AK8cvlw+VfggkC5ljLlFvf1
 pyiiylKYlTBuQgOgSPBfR1rX/0XkWMYW1LTEp1eFYgb1bvCdwWOmZCWY7z90bAkLHsiW
 h+dg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6OJCs="
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.25.7 DYNA|AUTH)
 with ESMTPSA id j06c13x4DAhMA9H
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 13 May 2021 12:43:22 +0200 (CEST)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [RFC PATCH 1/2] ASoC: dt-bindings: codecs: Add bindings for nxp,
 tfa989x
Date: Thu, 13 May 2021 12:41:28 +0200
Message-Id: <20210513104129.36583-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Vincent Knecht <vincent.knecht@mailoo.org>
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

NXP/Goodix TFA989X (TFA1) amplifiers are controlled via an I2C bus.
Add simple device tree bindings that describe how to set them up
in the device tree.

Right now only nxp,tfa9895 is supported but this will be extended
to at least nxp,tfa9897 in the near future.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 .../bindings/sound/nxp,tfa989x.yaml           | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
new file mode 100644
index 000000000000..45db5776550c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,tfa989x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP/Goodix TFA989X (TFA1) Audio Amplifiers
+
+maintainers:
+  - Stephan Gerhold <stephan@gerhold.net>
+
+properties:
+  compatible:
+    enum:
+      - nxp,tfa9895
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  sound-name-prefix:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Used as prefix for sink/source names of the component. Must be a
+      unique string among multiple instances of the same component.
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      audio-codec@34 {
+        compatible = "nxp,tfa9895";
+        reg = <0x34>;
+        sound-name-prefix = "Speaker Left";
+        #sound-dai-cells = <0>;
+      };
+      audio-codec@36 {
+        compatible = "nxp,tfa9895";
+        reg = <0x36>;
+        sound-name-prefix = "Speaker Right";
+        #sound-dai-cells = <0>;
+      };
+    };
-- 
2.31.1

