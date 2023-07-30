Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCB876852F
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Jul 2023 13:57:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E217E4E;
	Sun, 30 Jul 2023 13:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E217E4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690718221;
	bh=zx3hN+Up5QAZ/q/aPY364O/Y+TzNTFnUms5KkfFCuSU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=p4WT8zEToB7hYJyV9bowd9UU1s5Y1k6nzn3MyY2HjOf311xWQ3/3JjnfxazAakAyj
	 zi1waDsWA3dZTiIaKTzY5+2GmBcXymY5Hi6DkNg1Lyz70V/7Ii05FODNIEhlFzsn7f
	 eUzaPYAsfXxrrhJ3j1LbFZ7pV+WtX2gJgLI35/bE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D393F80425; Sun, 30 Jul 2023 13:56:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14C3AF80163;
	Sun, 30 Jul 2023 13:56:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D92FCF8016D; Sun, 30 Jul 2023 13:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_DYNAMIC,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1847F80153
	for <alsa-devel@alsa-project.org>; Sun, 30 Jul 2023 13:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1847F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ixit.cz header.i=@ixit.cz header.a=rsa-sha256
 header.s=dkim header.b=hQdlEPrk
Received: from localhost.localdomain (fhswifi.lu.lv [5.179.19.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 0903716048A;
	Sun, 30 Jul 2023 13:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1690717966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ovt4Qpvn4486eU5bed4MB8D25IRv5/81RC376BDybAA=;
	b=hQdlEPrkpgDa6aIXfcQWbw2CR+KTbZVVhBkSxutv6kddE9G/tgb7Ma7w2p29tWk60Iqroj
	KTAaza/AnTQNnE+MNkClBGhSugpdIlJYM50Vk59qgDH4RSaHREppXORX1+xz6PZiiWlAuL
	u4GHnW34uZAvkrYqRzdwcRDUFnjOdlk=
From: David Heidelberg <david@ixit.cz>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	- <kernel@puri.sm>
Cc: David Heidelberg <david@ixit.cz>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v2] dt-bindings: sound: gtm601: convert to YAML
Date: Sun, 30 Jul 2023 14:51:50 +0300
Message-Id: <20230730115150.38887-1-david@ixit.cz>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QAWVJDRUQVEE75UP5CB7RJOS7WGLIW6L
X-Message-ID-Hash: QAWVJDRUQVEE75UP5CB7RJOS7WGLIW6L
X-MailFrom: david@ixit.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QAWVJDRUQVEE75UP5CB7RJOS7WGLIW6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert GTM601 binding to the YAML format.

Signed-off-by: David Heidelberg <david@ixit.cz>

Cc: kernel@puri.sm
---
v2:
 - add #sound-dai-cells
 - put kernel@puri.sm into maintainers

 .../devicetree/bindings/sound/gtm601.txt      | 19 ----------
 .../devicetree/bindings/sound/gtm601.yaml     | 36 +++++++++++++++++++
 2 files changed, 36 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/gtm601.txt
 create mode 100644 Documentation/devicetree/bindings/sound/gtm601.yaml

diff --git a/Documentation/devicetree/bindings/sound/gtm601.txt b/Documentation/devicetree/bindings/sound/gtm601.txt
deleted file mode 100644
index efa32a486c4a..000000000000
--- a/Documentation/devicetree/bindings/sound/gtm601.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-GTM601 UMTS modem audio interface CODEC
-
-This device has no configuration interface. The sample rate and channels are
-based on the compatible string
-	"option,gtm601" = 8kHz mono
-	"broadmobi,bm818" = 48KHz stereo
-
-Required properties:
-
-  - compatible : one of
-	"option,gtm601"
-	"broadmobi,bm818"
-
-
-Example:
-
-codec: gtm601_codec {
-	compatible = "option,gtm601";
-};
diff --git a/Documentation/devicetree/bindings/sound/gtm601.yaml b/Documentation/devicetree/bindings/sound/gtm601.yaml
new file mode 100644
index 000000000000..e81a6aa75522
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/gtm601.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/gtm601.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GTM601 UMTS modem audio interface CODEC
+
+maintainers:
+  - kernel@puri.sm
+
+description: >
+  This device has no configuration interface. The sample rate and channels are
+  based on the compatible string
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: broadmobi,bm818
+          - const: option,gtm601
+      - items:
+          - enum:
+              - broadmobi,bm818  # 48 kHz stereo
+              - option,gtm601  # 8 kHz mono
+
+  '#sound-dai-cells':
+    const: 0
+
+additionalProperties: false
+
+examples:
+  - |
+    gtm601_codec {
+        compatible = "option,gtm601";
+    };
-- 
2.40.1

