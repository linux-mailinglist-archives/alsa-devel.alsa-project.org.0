Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F17A6070
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:59:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E624EE94;
	Tue, 19 Sep 2023 12:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E624EE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695121171;
	bh=6+FiM3cQiBaq44evE7pOihMB+TtsUrWgZ2mMbYnZ8PI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ujRQwOHAymh5xMhEaNL4DvoAQJnhD0d1m3EaCR1Xq3+IqBadYGI3cpIsDUgFtSBrm
	 wOGEGQE/VCY/BOMUa6+6IbF+dvdKv8zN3exXletg2RtWxEG6Ku5hhV6PzymnIuqIdA
	 pn0GdryhhhcHuaqJoAcbWYybK7OFHOCDFvUGpQP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1699DF80580; Tue, 19 Sep 2023 12:58:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B37B4F8057B;
	Tue, 19 Sep 2023 12:58:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 956BDF8057C; Tue, 19 Sep 2023 12:57:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,UNPARSEABLE_RELAY,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com
 [115.124.28.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F418EF8057A
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F418EF8057A
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.1436925|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.302725-0.000405716-0.696869;FP=5027444005159162298|1|1|19|0|-1|-1|-1;HT=ay29a033018047198;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=28;RT=28;SR=0;TI=SMTPD_---.Uj4ERvv_1695121062;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Uj4ERvv_1695121062)
          by smtp.aliyun-inc.com;
          Tue, 19 Sep 2023 18:57:49 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	wangweidong.a@awinic.com,
	rf@opensource.cirrus.com,
	herve.codina@bootlin.com,
	shumingf@realtek.com,
	ryans.lee@analog.com,
	13916275206@139.com,
	linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com,
	povik+lin@cutebit.org,
	harshit.m.mogalapalli@oracle.com,
	arnd@arndb.de,
	yijiangtao@awinic.com,
	yang.lee@linux.alibaba.com,
	liweilei@awinic.com,
	u.kleine-koenig@pengutronix.de,
	colin.i.king@gmail.com,
	trix@redhat.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>
Subject: [PATCH V4 2/7] ASoC: dt-bindings: Add schema for "awinic,aw87390"
Date: Tue, 19 Sep 2023 18:57:19 +0800
Message-ID: <20230919105724.105624-3-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919105724.105624-1-wangweidong.a@awinic.com>
References: <20230919105724.105624-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5UQTXGUODYWM7VP4KP2XVOR5CNQ2VMWM
X-Message-ID-Hash: 5UQTXGUODYWM7VP4KP2XVOR5CNQ2VMWM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5UQTXGUODYWM7VP4KP2XVOR5CNQ2VMWM/>
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

