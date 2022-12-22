Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC74654121
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 13:35:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8782341E4;
	Thu, 22 Dec 2022 13:35:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8782341E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671712554;
	bh=XGPGYykJ94qWIpjimQHutpA1dquMygT2Ys7IA/8hTwQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HoIsoUtTOxSST7xUv83ooK6xDdrrB3ev8WtYeCMM0U/qqDHiIglAAPECTB6lIiVrC
	 B72qBb/A7tJ+hxQ09ErKHhEcO0Ty8JY8J9wgrOU1JsabxUFDJ1zO6HTJFzrCjpVijC
	 s1L+NlN0Qg13BHg1LHM9KqIL48JmnpLiET7yvG70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30AB5F8024D;
	Thu, 22 Dec 2022 13:34:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15A46F8025F; Thu, 22 Dec 2022 13:34:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out29-151.mail.aliyun.com (out29-151.mail.aliyun.com
 [115.124.29.151])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A39EEF80022
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 13:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A39EEF80022
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.2206428|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.131169-0.000743072-0.868088;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=28; RT=28; SR=0; TI=SMTPD_---.QbOEy66_1671712480; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QbOEy66_1671712480) by smtp.aliyun-inc.com;
 Thu, 22 Dec 2022 20:34:48 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 james.schulman@cirrus.com, flatmax@flatmax.com, ryan.lee.analog@gmail.com,
 jonathan.albrieux@gmail.com, tanureal@opensource.cirrus.com,
 povik+lin@cutebit.org, 13691752556@139.com, cezary.rojewski@intel.com,
 stephan@gerhold.net, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V7 5/5] ASoC: dt-bindings: Add schema for "awinic,aw883xx"
Date: Thu, 22 Dec 2022 20:34:31 +0800
Message-Id: <20221222123431.106425-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: duanyibo@awinic.com, Weidong Wang <wangweidong.a@awinic.com>,
 zhaolei@awinic.com, liweilei@awinic.com, yijiangtao@awinic.com,
 zhangjianming@awinic.com
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
index 000000000000..af4e0e27f8f7
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
+  - $ref: dai-common.yaml#
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
+            reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.38.1

