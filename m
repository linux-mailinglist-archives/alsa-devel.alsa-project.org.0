Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7CB646F90
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 13:25:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69ED7190D;
	Thu,  8 Dec 2022 13:25:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69ED7190D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670502350;
	bh=ZrJLELNQITUBduwngqmQ4WbjatDk4rMERUk2mp53Y0w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n/8jbeygELDXPTjS4aLmmXKcgEnNVzgBEHvMgAE6739sfFo0WJOkP9IzbepPMRPHH
	 5MwUfQWLZ5T5aS0s/2x9JBlkh4rkJFYK+4tdnS7kTzrtvLonlzmlTAb0E48n2JqsIw
	 S+5Ae/1i2Ujb8JFqdKcuynV0Sncw8O1/6HuwH42g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C436EF8057C;
	Thu,  8 Dec 2022 13:23:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBDBFF80564; Thu,  8 Dec 2022 13:23:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from out29-200.mail.aliyun.com (out29-200.mail.aliyun.com
 [115.124.29.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F59FF8055A
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 13:23:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F59FF8055A
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2151716|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.109176-0.000643382-0.89018;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047192; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=17; RT=17; SR=0; TI=SMTPD_---.QRKcQyk_1670502211; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QRKcQyk_1670502211) by smtp.aliyun-inc.com;
 Thu, 08 Dec 2022 20:23:32 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org, perex@perex.cz, alsa-devel@alsa-project.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 quic_potturu@quicinc.com, pierre-louis.bossart@linux.intel.com,
 cy_huang@richtek.com
Subject: [PATCH V6 5/5] ASoC: dt-bindings: Add schema for "awinic,aw883xx"
Date: Thu,  8 Dec 2022 20:23:13 +0800
Message-Id: <20221208122313.55118-6-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221208122313.55118-1-wangweidong.a@awinic.com>
References: <20221208122313.55118-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 .../bindings/sound/awinic,aw883xx.yaml        | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
new file mode 100644
index 000000000000..b72c9177ebb7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
@@ -0,0 +1,49 @@
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
+  reset-gpios:
+    maxItems: 1
+
+  sound-name-prefix: true
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        audio-codec@34 {
+            compatible = "awinic,aw883xx_smartpa";
+            reg = <0x34>;
+            reset-gpios = <&gpio 9 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.38.1

