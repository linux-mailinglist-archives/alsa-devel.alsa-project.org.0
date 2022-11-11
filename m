Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DACC8625961
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:29:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 785FE1652;
	Fri, 11 Nov 2022 12:28:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 785FE1652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166180;
	bh=YDU3+JfYzj70R1Fq6bS+ilPWkYRl17FO97bMnGJ4bYA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IZdsDDMxbxLBcrrO2BGZ4Jo+Uy6jAvPA0dONItrQQbdOETk1Ss5fkwsY8i7d6jJpD
	 q6S58fadB04Lhi3kOpRy6xvul9PQeFu8pGG8ylm0diPaykP7F7ORL/Bo3pqloreqLN
	 AF4abAo3oesLVFckGtSWai975kM8IQImpgNZJTHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27064F8059F;
	Fri, 11 Nov 2022 12:27:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BCE4F80580; Fri, 11 Nov 2022 12:27:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out29-148.mail.aliyun.com (out29-148.mail.aliyun.com
 [115.124.29.148])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8F5AF800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:27:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8F5AF800CC
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.233368|-1;
 BR=01201311R751S60rulernew998_84748_2000303; CH=blue; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.122565-0.000795741-0.876639;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.Q5.SfdL_1668166026; 
Received: from localhost.localdomain(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Q5.SfdL_1668166026) by smtp.aliyun-inc.com;
 Fri, 11 Nov 2022 19:27:08 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, pierre-louis.bossart@linux.intel.com,
 cy_huang@richtek.com
Subject: [PATCH V3 5/6] ASoC: dt-bindings: Add schema for "awinic,aw883xx"
Date: Fri, 11 Nov 2022 19:26:31 +0800
Message-Id: <1668165992-6493-6-git-send-email-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1668165992-6493-1-git-send-email-wangweidong.a@awinic.com>
References: <000701d8e7521f78bc05e6a340awinic.com>
 <1668165992-6493-1-git-send-email-wangweidong.a@awinic.com>
Cc: duanyibo@awinic.com, Weidong Wang <wangweidong.a@awinic.com>,
 zhaolei@awinic.com, liweilei@awinic.com, yijiangtao@awinic.com,
 zhangjianming@awinic.com
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

From: Weidong Wang <wangweidong.a@awinic.com>

Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
controlled using I2C.

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 .../devicetree/bindings/sound/awinic,aw883xx.yaml  | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
new file mode 100644
index 0000000..1c0c726
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/awinic,aw883xx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW883xx Smart Audio Amplifier
+
+maintainers:
+  - Stephan Gerhold <stephan@gerhold.net>
+
+description:
+  The Awinic AW883XX is an I2S/TDM input, high efficiency
+  digital Smart K audio amplifier with an integrated 10.25V
+  smart boost convert.
+
+allOf:
+  - $ref: name-prefix.yaml#
+
+properties:
+  compatible:
+    const: awinic,aw883xx_smartpa
+
+  reg:
+    maxItems: 1
+
+  reset-gpio:
+    maxItems: 1
+
+  irq-gpio:
+    maxItems: 1
+
+  sound-channel:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpio
+  - irq-gpio
+  - sound-channel
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        aw883xx_smartpa@34 {
+            compatible = "awinic,aw883xx_smartpa";
+            reg = <0x34>;
+            reset-gpio = <&ap_gpio 92 0>;
+            irq-gpio = <&ap_gpio 93 0>;
+            sound-channel = <0>;
+        };
+    };
-- 
2.7.4

