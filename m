Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B1957AF77
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 05:27:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40782173F;
	Wed, 20 Jul 2022 05:26:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40782173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658287650;
	bh=y2UsnYr7A9vKtE9Gjr4NGerQubI+j3Twn32kYZqKUus=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=li07s8GgguaewkOTdDOsLa6dlRvp0ted1QRl86JOD4retd2GWq3sA2eEXQNjh3OGO
	 Rdx/gJ/Un8FI8KnNObbkCT/u5kxWoJ2w1dtpsb4miEQ2VC5r4NDABIeH+scZUHBx3J
	 jImgTfsfc9sTUogxK3FosrxBHoDcELuMFUuWHyrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2D95F800BA;
	Wed, 20 Jul 2022 05:26:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6599CF80169; Wed, 20 Jul 2022 05:26:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,SPF_HELO_NONE,SPF_NONE,
 SPOOFED_FREEMAIL,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from n169-111.mail.139.com (n169-111.mail.139.com [120.232.169.111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25045F80125
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 05:26:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25045F80125
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM: 
X-RM-SPAM-FLAG: 00000000
Received: from LAPTOP-39QA2GAC.localdomain (unknown[192.163.20.102])
 by rmsmtp-lg-appmail-13-12002 (RichMail) with SMTP id 2ee262d775ba860-b0ef2;
 Wed, 20 Jul 2022 11:26:09 +0800 (CST)
X-RM-TRANSID: 2ee262d775ba860-b0ef2
From: Raphael-Xu <13691752556@139.com>
To: robh+dt@kernel.org
Subject: [PATCH v6] ASoc:dt-bindings:tas2780:remove unused item in DT and
 revise the format
Date: Wed, 20 Jul 2022 11:25:42 +0800
Message-Id: <20220720032542.707-1-13691752556@139.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, navada@ti.com,
 broonie@kernel.org, asyrus@ti.com, raphael-xu@ti.com, shenghao-ding@ti.com,
 Raphael-Xu <13691752556@139.com>
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

1.remove unused item in DT 2.revise the format

Signed-off-by: Raphael-Xu <13691752556@139.com>
---
 .../devicetree/bindings/sound/tas2780.yaml    | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tas2780.yaml b/Documentation/devicetree/bindings/sound/tas2780.yaml
index 5a0de0995066..21389a16fdb9 100644
--- a/Documentation/devicetree/bindings/sound/tas2780.yaml
+++ b/Documentation/devicetree/bindings/sound/tas2780.yaml
@@ -22,24 +22,29 @@ properties:
       - ti,tas2780
 
   reg:
-    maxItems: 1
-    description: |
-       I2C address of the device can be between 0x38 to 0x45.
+    description:
+       I2C address of the device can be between 0x38 to 0x3f.
+    minimum: 0x38
+    maximum: 0x3f
 
   reset-gpios:
-    maxItems: 1
     description: GPIO used to reset the device.
+    maxItems: 1
 
   interrupts:
     maxItems: 1
 
   ti,imon-slot-no:
-    $ref: /schemas/types.yaml#/definitions/uint32
     description: TDM TX current sense time slot.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
 
   ti,vmon-slot-no:
-    $ref: /schemas/types.yaml#/definitions/uint32
     description: TDM TX voltage sense time slot.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
 
   '#sound-dai-cells':
     const: 1
@@ -60,10 +65,8 @@ examples:
        compatible = "ti,tas2780";
        reg = <0x38>;
        #sound-dai-cells = <1>;
-       interrupt-parent = <&gpio1>;
        interrupts = <14>;
        reset-gpios = <&gpio1 15 0>;
-       shutdown-gpios = <&gpio1 15 0>;
        ti,imon-slot-no = <0>;
        ti,vmon-slot-no = <2>;
      };
-- 
2.35.1


