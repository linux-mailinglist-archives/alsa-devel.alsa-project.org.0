Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC1E7A48E2
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 13:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2971CA4A;
	Mon, 18 Sep 2023 13:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2971CA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695038110;
	bh=6+FiM3cQiBaq44evE7pOihMB+TtsUrWgZ2mMbYnZ8PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VoUsFYQx6PFbNwS/30d6NJK2Vfiz/7lxuztbMgiI9VIPtNfQ7Drcn3kKqUqS3HxMi
	 G0WHt3Fo4CWELCKdzy8hgEjFw3kyFBWu3k0FJwMNgRCSnt4FY3serIi0BS/Z/1Oc5v
	 +yycSjIiJnvfYcLZ/nFBCOWMRyE9vB9adt91NvdM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F70EF8057D; Mon, 18 Sep 2023 13:53:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B871F80571;
	Mon, 18 Sep 2023 13:53:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99EABF80578; Mon, 18 Sep 2023 13:53:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-5.mail.aliyun.com (out28-5.mail.aliyun.com
 [115.124.28.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFA57F8056F
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 13:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA57F8056F
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1414002|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.302725-0.000405716-0.696869;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047199;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=28;RT=28;SR=0;TI=SMTPD_---.Ui7aPWT_1695037993;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Ui7aPWT_1695037993)
          by smtp.aliyun-inc.com;
          Mon, 18 Sep 2023 19:53:21 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	wangweidong.a@awinic.com,
	herve.codina@bootlin.com,
	shumingf@realtek.com,
	13916275206@139.com,
	ryans.lee@analog.com,
	linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com,
	povik+lin@cutebit.org,
	arnd@arndb.de,
	harshit.m.mogalapalli@oracle.com,
	u.kleine-koenig@pengutronix.de,
	yang.lee@linux.alibaba.com,
	liweilei@awinic.com,
	yijiangtao@awinic.com,
	trix@redhat.com,
	colin.i.king@gmail.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Subject: [PATCH V3 2/5] ASoC: dt-bindings: Add schema for "awinic,aw87390"
Date: Mon, 18 Sep 2023 19:52:52 +0800
Message-ID: <20230918115255.33171-3-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918115255.33171-1-wangweidong.a@awinic.com>
References: <20230918115255.33171-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JGLXXGQXYAKTRXH5422QYBJ54OXKQDJV
X-Message-ID-Hash: JGLXXGQXYAKTRXH5422QYBJ54OXKQDJV
X-MailFrom: wangweidong.a@awinic.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JGLXXGQXYAKTRXH5422QYBJ54OXKQDJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Add a DT schema for describing awinic aw87390 audio amplifiers.
They are controlled using I2C.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 .../bindings/sound/awinic,aw87390.yaml        | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw87390.yaml

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml b/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
new file mode 100644
index 000000000000..ba9d8767c5d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/awinic,aw87390.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic Aw87390 Audio Amplifier
+
+maintainers:
+  - Weidong Wang <wangweidong.a@awinic.com>
+
+description:
+  The awinic aw87390 is specifically designed to improve
+  the musical output dynamic range, enhance the overall
+  sound quallity, which is a new high efficiency, low
+  noise, constant large volume, 6th Smart K audio amplifier.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: awinic,aw87390
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
+
+  awinic,audio-channel:
+    description:
+      It is used to distinguish multiple PA devices, so that different
+      configurations can be loaded to different PA devices
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - awinic,audio-channel
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        audio-codec@58 {
+            compatible = "awinic,aw87390";
+            reg = <0x58>;
+            #sound-dai-cells = <0>;
+            awinic,audio-channel = <0>;
+        };
+    };
-- 
2.41.0

