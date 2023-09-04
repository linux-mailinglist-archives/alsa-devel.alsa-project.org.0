Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762679166F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 13:48:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0AAC83A;
	Mon,  4 Sep 2023 13:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0AAC83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693828115;
	bh=tIkE2N7Zmy85SE+XWE1H0xUYidSDByThb7ZjyiO88GM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AzKPiXouNMQJUnZ6aKxyu68CaWtjHRhXFqSYTeLUyqimDm53jIe/86CzOMXw2Pqn3
	 wvaDuBaiGRathrHtt2KrfFS2/ZKg03nEnqUn3iQNp6RvoeJh+UTeNzFy1S1DJRVYyR
	 UL/erKSKIcBGUlXALoYh4Cfz2e68xals5+2Xbkh8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5EE4F80578; Mon,  4 Sep 2023 13:46:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A2F7F8055A;
	Mon,  4 Sep 2023 13:46:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 723E2F8047D; Mon,  4 Sep 2023 13:46:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from out28-193.mail.aliyun.com (out28-193.mail.aliyun.com
 [115.124.28.193])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AC69F80141
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 13:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AC69F80141
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.2192019|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0431418-0.000499539-0.956359;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047211;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=24;RT=24;SR=0;TI=SMTPD_---.UXIjsmr_1693827991;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.UXIjsmr_1693827991)
          by smtp.aliyun-inc.com;
          Mon, 04 Sep 2023 19:46:38 +0800
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
	rdunlap@infradead.org,
	13916275206@139.com,
	ryans.lee@analog.com,
	linus.walleij@linaro.org,
	ckeepax@opensource.cirrus.com,
	yijiangtao@awinic.com,
	liweilei@awinic.com,
	colin.i.king@gmail.com,
	trix@redhat.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
Subject: [PATCH V1 1/3] ASoC: dt-bindings: Add schema for "awinic,aw87390"
Date: Mon,  4 Sep 2023 19:46:19 +0800
Message-ID: <20230904114621.4457-2-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904114621.4457-1-wangweidong.a@awinic.com>
References: <20230904114621.4457-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OTZECDMCGMZ3NERY2KMA35UP2GHPWWGW
X-Message-ID-Hash: OTZECDMCGMZ3NERY2KMA35UP2GHPWWGW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OTZECDMCGMZ3NERY2KMA35UP2GHPWWGW/>
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

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 .../bindings/sound/awinic,aw87390.yaml        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw87390.yaml

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml b/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
new file mode 100644
index 000000000000..b4de99c9830e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/awinic,aw87390.yaml
@@ -0,0 +1,43 @@
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
+required:
+  - compatible
+  - reg
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
+        };
+    };
-- 
2.41.0

