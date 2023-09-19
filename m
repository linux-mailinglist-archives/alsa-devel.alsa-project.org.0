Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA8A7A606E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5247BDEF;
	Tue, 19 Sep 2023 12:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5247BDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695121154;
	bh=bwVazyFODUtTL1uRXirulJII+AA4y7umzrAIjXe9YAw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WMtQ7pXqstnY/O7FVNZRPsiSc4k+VKMaswnPd3Otwii3Xw1cbReTOVBxgMSEVgGld
	 e/hzdHvI/3uLb6tY0UnOOukrlauSpVgkQYoiiW+YaELaa8gUy6zUQzjxMDB2UoW+LE
	 Goz9wpW956tlySTNNs6WpI3QKglOJQdyFWANmRo0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C212F80568; Tue, 19 Sep 2023 12:57:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06BD0F8055B;
	Tue, 19 Sep 2023 12:57:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D4E9F8055C; Tue, 19 Sep 2023 12:57:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,UNPARSEABLE_RELAY
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out28-75.mail.aliyun.com (out28-75.mail.aliyun.com
 [115.124.28.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D60C1F800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D60C1F800F4
X-Alimail-AntiSpam: 
 AC=CONTINUE;BC=0.3465002|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.42984-0.00186958-0.568291;FP=7261269027978073474|1|1|19|0|-1|-1|-1;HT=ay29a033018047194;MF=wangweidong.a@awinic.com;NM=1;PH=DS;RN=27;RT=27;SR=0;TI=SMTPD_---.Uj4ERmC_1695121054;
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com
 fp:SMTPD_---.Uj4ERmC_1695121054)
          by smtp.aliyun-inc.com;
          Tue, 19 Sep 2023 18:57:41 +0800
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
Subject: [PATCH V4 1/7] ASoC: dt-bindings: awinic,aw88395: Add properties for
 multiple PA support
Date: Tue, 19 Sep 2023 18:57:18 +0800
Message-ID: <20230919105724.105624-2-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919105724.105624-1-wangweidong.a@awinic.com>
References: <20230919105724.105624-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UPGZPY4TWVGR7LHFZDF3W773VVOUILCZ
X-Message-ID-Hash: UPGZPY4TWVGR7LHFZDF3W773VVOUILCZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPGZPY4TWVGR7LHFZDF3W773VVOUILCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Weidong Wang <wangweidong.a@awinic.com>

Add two properties, the "awinic,audio-channel" property and the
"awinic,sync-flag". The "awinic,audio-channel" is used to make
different PA load different configurations, the "awinic,sync-flag"
is used to synchronize the phases of multiple PA. These two properties
will be read by the corresponding driver, allowing multi-PA to
achieve better playback effect.

Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
---
 .../bindings/sound/awinic,aw88395.yaml           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
index 4051c2538caf..b977d3de87cb 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -32,11 +32,25 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  awinic,audio-channel:
+    description:
+      It is used to distinguish multiple PA devices, so that different
+      configurations can be loaded to different PA devices
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+
+  awinic,sync-flag:
+    description:
+      Flag bit used to keep the phase synchronized in the case of multiple PA
+    $ref: /schemas/types.yaml#/definitions/flag
+
 required:
   - compatible
   - reg
   - '#sound-dai-cells'
   - reset-gpios
+  - awinic,audio-channel
 
 unevaluatedProperties: false
 
@@ -51,5 +65,7 @@ examples:
             reg = <0x34>;
             #sound-dai-cells = <0>;
             reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
+            awinic,audio-channel = <0>;
+            awinic,sync-flag;
         };
     };
-- 
2.41.0

