Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 724D36ACACD
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6444F1137;
	Mon,  6 Mar 2023 18:38:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6444F1137
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124377;
	bh=NqqfRUX1WdUBgmU4CP14pjltPXWkZUXa0mllkkDuIsA=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sW4fKtBSn1YAY6AY3k/+6l3ZFPY9jf8eUi5AY28QYD7u8qX5OWhsByj8ssHXERjPa
	 ZUFPPsd3b81FZnXdzo7rBwC7Q1rnKyUcmYE0pk65vmSET5kIep1V66Ke0sBlxtN+2u
	 vLOp8QwcQLlGxDLpkFPrOak7yCIIH1kws7sUnHT8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B69CF80236;
	Mon,  6 Mar 2023 18:38:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0DC5F8051B; Thu,  2 Mar 2023 12:57:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-37.mta1.migadu.com (out-37.mta1.migadu.com [95.215.58.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2217EF80310
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 12:57:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2217EF80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=UPiAwD8A
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1677758240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lacV+ZSJrTyZ6DynOqgF52q9M292vYw544hATtzWJ1U=;
	b=UPiAwD8Aezv+ZVDhgXZdkVwLDXFcVnot+rOvl2jJwf7c8Suxiy8q7GI6bPjtYSyIjA8tDk
	fC221+XDLRZj9FDCNDJGtu6w0yl1R9tNbsw2+aONPjEsLCJJE7cGcqJqHMar//GHUUkIfc
	3/rI1S39VCkas1vViAtLhi+5YWO6GtA=
From: richard.leitner@linux.dev
Date: Thu, 02 Mar 2023 12:55:01 +0100
Subject: [PATCH 1/3] ASoC: dt-bindings: maxim,max9867: convert txt bindings
 to yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230302-max9867-v1-1-aa9f7f25db5e@skidata.com>
References: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
In-Reply-To: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benjamin Bara <benjamin.bara@skidata.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2215;
 i=richard.leitner@skidata.com; h=from:subject:message-id;
 bh=EaR0IGpFQVasEFVxFQvnkwT/6aa1vj6aIM7Wyp90Ang=;
 b=owGbwMvMwCX2R2KahkXN7wuMp9WSGFIY+uUqpuu8L567xvpO/qcH++aum3UuKHtpqDmzzjSrfcIp
 hi9ZO0pZGMS4GGTFFFnsjbna3XPL3lcq6uTCzGFlAhnCwMUpABOZYM3wh9Nz/dKzhxdN9tqkeExNj7
 WC1bXg2LzqWQ5SrxRD8xg+6zEyrD716kr8idn3VK8Jh1j6Xt/AfyLhX/7yqCfTNmerz3nOwgsA
X-Developer-Key: i=richard.leitner@skidata.com; a=openpgp;
 fpr=3F330A87476D76EF79212C6DFC189628387CFBD0
X-Migadu-Flow: FLOW_OUT
X-MailFrom: richard.leitner@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SNQUYOCERRYLVY6QKEDF5IZMTTZW4TYX
X-Message-ID-Hash: SNQUYOCERRYLVY6QKEDF5IZMTTZW4TYX
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:38:42 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNQUYOCERRYLVY6QKEDF5IZMTTZW4TYX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Leitner <richard.leitner@skidata.com>

Convert from max9867.txt to maxim,max9867.yaml and add missing
'#sound-dai-cells' property.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 .../devicetree/bindings/sound/max9867.txt          | 17 --------
 .../devicetree/bindings/sound/maxim,max9867.yaml   | 51 ++++++++++++++++++++++
 2 files changed, 51 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/max9867.txt b/Documentation/devicetree/bindings/sound/max9867.txt
deleted file mode 100644
index b8bd914ee697..000000000000
--- a/Documentation/devicetree/bindings/sound/max9867.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-max9867 codec
-
-This device supports I2C mode only.
-
-Required properties:
-
-- compatible : "maxim,max9867"
-- reg : The chip select number on the I2C bus
-
-Example:
-
-&i2c {
-	max9867: max9867@18 {
-		compatible = "maxim,max9867";
-		reg = <0x18>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/sound/maxim,max9867.yaml b/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
new file mode 100644
index 000000000000..cefa43c3d34e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/max9867.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX9867 CODEC
+
+description: |
+  This device supports I2C only.
+  Pins on the device (for linking into audio routes):
+      * LOUT
+      * ROUT
+      * LINL
+      * LINR
+      * MICL
+      * MICR
+      * DMICL
+      * DMICR
+
+maintainers:
+  - Ladislav Michl <ladis@linux-mips.org>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - maxim,max9867
+
+  '#sound-dai-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    &i2c {
+            max9867: max9867@18 {
+                    compatible = "maxim,max9867";
+                    #sound-dai-cells = <0>;
+                    reg = <0x18>;
+            };
+    };
+...

-- 
2.39.2

