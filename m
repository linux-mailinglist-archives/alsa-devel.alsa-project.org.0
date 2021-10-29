Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0994402E2
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Oct 2021 21:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9727D1707;
	Fri, 29 Oct 2021 21:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9727D1707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635534445;
	bh=Kk0ILule9MhD4wbGZ8Y3AKDSuQ/INbyE5/WC2cy8shs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XH/4UE63X7vxNZY+Yi2vvMIJoVKpH3EXIzaY3xt0lHqEN/q5GgiuyhElOhslmnbD1
	 RopIhTFjHRLTOMvWsDnVb+zAScWlUL2tYRmziq4XFr3Yots4YenaKSToG2v3Rd4eCi
	 xwkhSO97U2cHlUgbkVxTCnqnVj48dvZsIHdYWHiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26B58F8025E;
	Fri, 29 Oct 2021 21:06:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E21C4F8025A; Fri, 29 Oct 2021 21:06:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ixit.cz (ixit.cz [94.230.151.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9E19F800F4
 for <alsa-devel@alsa-project.org>; Fri, 29 Oct 2021 21:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9E19F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz
 header.b="qfn6Zuqx"
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz
 [89.176.96.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 70DA624E6B;
 Fri, 29 Oct 2021 19:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1635530068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6ToVB7x10YgE3pIY4Ta3eLJU9jiD1tCEr5Va3QGvfnQ=;
 b=qfn6ZuqxpF4YDRb8llLEHmOpPPwLVzci3cWhqHwfs2KDNkjbel9iw1O5AvQHuF2uiQenDI
 R30KSQVOF9al1rSEMj3HA2bNB1ERwbvHuRWrNI3/5DDuxzXqJjNWzTrIXKtVujbbuspgl/
 BOBkTi9ULCmujOMYzHJx1yVUoDmOJqk=
From: David Heidelberg <david@ixit.cz>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, angus@akkea.ca
Subject: [PATCH] dt-bindings: sound: gtm601: convert to YAML
Date: Fri, 29 Oct 2021 19:54:17 +0200
Message-Id: <20211029175418.83899-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
 linux-kernel@vger.kernel.org
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

Convert GTM601 binding to the YAML format.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/sound/gtm601.txt      | 19 -----------
 .../devicetree/bindings/sound/gtm601.yaml     | 33 +++++++++++++++++++
 2 files changed, 33 insertions(+), 19 deletions(-)
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
index 000000000000..804402c72798
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/gtm601.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/gtm601.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GTM601 UMTS modem audio interface CODEC
+
+maintainers:
+  - Angus Ainslie (Purism) <angus@akkea.ca>
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
+additionalProperties: false
+
+examples:
+  - |
+    gtm601_codec {
+        compatible = "option,gtm601";
+    };
-- 
2.33.0

