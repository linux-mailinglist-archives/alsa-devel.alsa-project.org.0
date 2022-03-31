Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A23E4ED0AD
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 02:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC5211A44;
	Thu, 31 Mar 2022 02:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC5211A44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648685237;
	bh=+KmEFqmIdDsWpjx370TkKd/+8aZ8TQBHU8o77qI8xBU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7JpMBUgg5ZxvdghqCwCTrYxBKBqds2ISLOg9tqFNXpUZ9mGEU28/FZlr9YMzG/vh
	 3iVEPLZAsM2ITGJMMqDiMDjxHsJ8sHi2Aqte9ii4bxnGeGmvvRGYo8HchrlWT/3bfC
	 62FaQJwZFr43FDu/teMEoGOUgPNTwC3bgl4/AAL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35622F80254;
	Thu, 31 Mar 2022 02:05:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFA00F80516; Thu, 31 Mar 2022 02:05:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4C38F80253
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 02:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4C38F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="QCK9u2U6"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1648685130; bh=vNAuOBEbxoca294MRvbJQo3FQJuHQNSkCGQ2YVXzgTs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QCK9u2U6MJT4PWy9Qe6btEbbolw5xt6EHdkL9DoSrAieQ0zCSYIXXtWbxiyAU78/n
 Mbkx0pcPFKwPWzSJPpP/C/dO4TjL3rdw72rss1RtR6LKROyfE+kNcTZn6zX0WxwSXo
 wSeWd9SXuI3BKym2mmg9ajUy4GWtEXxJ2HfBypN8=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [RFC PATCH 1/5] dt-bindings: sound: Add Apple Macs sound system
Date: Thu, 31 Mar 2022 02:04:45 +0200
Message-Id: <20220331000449.41062-2-povik+lin@cutebit.org>
In-Reply-To: <20220331000449.41062-1-povik+lin@cutebit.org>
References: <20220331000449.41062-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

Add binding for Apple Silicon Macs' machine-level sound system.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 .../bindings/sound/apple,macaudio.yaml        | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/apple,macaudio.yaml

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..a6380e4bdd1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Silicon Macs integrated sound system
+
+maintainers:
+  - Martin Povišer <povik+lin@cutebit.org>
+
+definitions:
+  dai:
+    type: object
+    properties:
+      sound-dai: true
+    required:
+      - sound-dai
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,j274-macaudio
+          - apple,j293-macaudio
+          - apple,j314-macaudio
+      - const: apple,macaudio
+  "#address-cells":
+    const: 1
+  "#size-cells":
+    const: 0
+  model:
+    description: |
+      Model name to use when the sound system is presented to users as a sound card.
+    $ref: /schemas/types.yaml#/definitions/string
+
+patternProperties:
+  "^dai-link(@[0-9a-f]+)?$":
+    description: |
+      A DAI link comprising of CPU and CODEC DAI specifiers and supplemental properties.
+    type: object
+    properties:
+      reg:
+        maxItems: 1
+      mclk-fs:
+        description: |
+          Forced MCLK/samplerate factor (optional).
+        $ref: /schemas/types.yaml#/definitions/uint32
+      link-name:
+        description: Name for the DAI link to present to users.
+        $ref: /schemas/types.yaml#/definitions/string
+      cpu:
+        $ref: "#/definitions/dai"
+      codec:
+        $ref: "#/definitions/dai"
+    required:
+      - reg
+      - cpu
+      - codec
+    additionalProperties: false
+
+required:
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "apple,j293-macaudio", "apple,macaudio";
+      model = "MacBook Pro J293 integrated audio";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      dai-link@0 {
+        reg = <0>;
+        link-name = "Speakers";
+        mclk-fs = <64>;
+
+        cpu {
+          sound-dai = <&mca 0>, <&mca 1>;
+        };
+        codec {
+          sound-dai = <&speaker_left_front>, <&speaker_right_front>,
+            <&speaker_left_rear>, <&speaker_right_rear>;
+        };
+      };
+
+      dai-link@1 {
+        reg = <1>;
+        link-name = "Headphones Jack";
+        mclk-fs = <64>;
+
+        cpu {
+          sound-dai = <&mca 2>;
+        };
+        codec {
+          sound-dai = <&jack_codec>;
+        };
+      };
+    };
-- 
2.33.0

