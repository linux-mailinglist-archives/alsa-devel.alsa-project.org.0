Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB78365FA4E
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 04:31:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A22C13143;
	Fri,  6 Jan 2023 04:30:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A22C13143
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672975909;
	bh=U4aSjeqHLpR6S1C0bjIwSiiZxIRRv6FTYJHPplqM39s=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RfHJvgVYtjzbHV/yFMtFW5aQZE0R+9RSYBsqpKBloQgYI54MjFHr8KdBwFU70Yn10
	 YCDnTZbDGQzhpx8QlZnoZe7qSq8ugiCzSUXxZ/J5VnHqLS/VAabQc2XIatbfuWKmYm
	 m6xr2wB3w8Pb4mhwZlBWQIbLAQRa1EMr7x7uvl9Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 052DFF8057D;
	Fri,  6 Jan 2023 04:29:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37D40F80580; Fri,  6 Jan 2023 04:29:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from out29-79.mail.aliyun.com (out29-79.mail.aliyun.com
 [115.124.29.79])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0A5AF8057D
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 04:29:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0A5AF8057D
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1530381|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.325954-0.000438573-0.673608;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=wangweidong.a@awinic.com; NM=1;
 PH=DS; RN=26; RT=26; SR=0; TI=SMTPD_---.QlbrpT3_1672975741; 
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.QlbrpT3_1672975741) by smtp.aliyun-inc.com;
 Fri, 06 Jan 2023 11:29:04 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, james.schulman@cirrus.com,
 flatmax@flatmax.com, cezary.rojewski@intel.com, wangweidong.a@awinic.com,
 povik+lin@cutebit.org, yangxiaohua@everest-semi.com,
 daniel.beer@igorinstitute.com, 13691752556@139.com,
 srinivas.kandagatla@linaro.org, jonathan.albrieux@gmail.com, steve@sk2.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V9 5/5] ASoC: dt-bindings: Add schema for "awinic,aw88395"
Date: Fri,  6 Jan 2023 11:28:35 +0800
Message-Id: <20230106032835.141918-6-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106032835.141918-1-wangweidong.a@awinic.com>
References: <20230106032835.141918-1-wangweidong.a@awinic.com>
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
Cc: yijiangtao@awinic.com, zhaolei@awinic.com, liweilei@awinic.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Add a DT schema for describing Awinic AW88395 audio amplifiers. They are
controlled using I2C.

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 .../bindings/sound/awinic,aw88395.yaml        | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw88395.yaml

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
new file mode 100644
index 000000000000..35eef7d818a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/awinic,aw88395.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW88395 Smart Audio Amplifier
+
+maintainers:
+  - Weidong Wang <wangweidong.a@awinic.com>
+
+description:
+  The Awinic AW88395 is an I2S/TDM input, high efficiency
+  digital Smart K audio amplifier with an integrated 10.25V
+  smart boost convert.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: awinic,aw88395
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+  - reset-gpios
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        audio-codec@34 {
+            compatible = "awinic,aw88395";
+            reg = <0x34>;
+            #sound-dai-cells = <0>;
+            reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.39.0

