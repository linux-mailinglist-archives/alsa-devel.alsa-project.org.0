Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEAD7B2602
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 21:42:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83DB1A4C;
	Thu, 28 Sep 2023 21:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83DB1A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695930163;
	bh=+f/LROZgFTPzcFy5/y8VtrXLG8LIcts2Ik8CzlQ3RsM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mjahMdMwjB+JGSuongodbz6ALr+e5TuI2slmih0Mwmmpwss/qhvYMwoxVl+q6Jrp5
	 PmWnh+q0htwwmQTobCEdWAFQVVMrbKlD4sOQMSuu8G0CaN8wmgU9vFuHyLa3qFQyy3
	 6sTjGOE59VPlX5XlOgWZvOMvOrYLmBEzRlnyhoD4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB722F8016A; Thu, 28 Sep 2023 21:41:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88CA8F8016A;
	Thu, 28 Sep 2023 21:41:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA2DFF801D5; Thu, 28 Sep 2023 21:41:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C9FFF80130
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 21:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C9FFF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GS04NkNV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CB3D61CD8;
	Thu, 28 Sep 2023 19:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE9AC433C7;
	Thu, 28 Sep 2023 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695930095;
	bh=+f/LROZgFTPzcFy5/y8VtrXLG8LIcts2Ik8CzlQ3RsM=;
	h=From:To:Cc:Subject:Date:From;
	b=GS04NkNVwjZ5aAvctflC98Uo4+fIaRixp/S7KhAw1pj6pKgWEnR6iDPnRHcMrbxWk
	 GDRgbrpFlHSnG52T5EMZagd0oohD+/xcuCf4IvfL4xylZ6RTNK1drD97IFlFBhvAYe
	 rMlWf9Os5/p+g+hY6SnSR+EjfGnV8WR42DL5Bu6SarRJs1I73kT6nkyt2N6xugHotX
	 DZjlqz/z04UMNuNoCQsaclN3jzUEiyc2uE39Ahqx7ekUBFq46WzlKbD3tNmilxO26P
	 x6jbj8r7HxHo4ukR3juucsPsAq1CpDdnM/+vHzKqpvc1t4NAi6L8MkFv3DsG1aPtw7
	 SevonLnDNfLVg==
Received: (nullmailer pid 1147011 invoked by uid 1000);
	Thu, 28 Sep 2023 19:41:33 -0000
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: Simplify referencing dai-params.yaml
Date: Thu, 28 Sep 2023 14:41:16 -0500
Message-Id: <20230928194126.1146622-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ODWDJ63W6N6XISG337BHH3MIZJP363OE
X-Message-ID-Hash: ODWDJ63W6N6XISG337BHH3MIZJP363OE
X-MailFrom: SRS0=w7AI=FM=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODWDJ63W6N6XISG337BHH3MIZJP363OE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There's generally no need to use definitions to reference from
individual properties. All the property names are the same, and all the
defined properties are used by all the users.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/audio-graph-port.yaml      | 20 ++++++-------------
 .../bindings/sound/audio-graph.yaml           |  9 +++------
 .../devicetree/bindings/sound/dai-params.yaml | 11 ++++------
 3 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index fa9f9a853365..60b5e3fd1115 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -13,19 +13,17 @@ select: false
 
 definitions:
   port-base:
-    $ref: /schemas/graph.yaml#/$defs/port-base
+    allOf:
+      - $ref: /schemas/graph.yaml#/$defs/port-base
+      - $ref: /schemas/sound/dai-params.yaml#
     properties:
-      convert-rate:
-        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-rate
-      convert-channels:
-        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-channels
-      convert-sample-format:
-        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-format
       mclk-fs:
         $ref: simple-card.yaml#/definitions/mclk-fs
 
   endpoint-base:
-    $ref: /schemas/graph.yaml#/$defs/endpoint-base
+    allOf:
+      - $ref: /schemas/graph.yaml#/$defs/endpoint-base
+      - $ref: /schemas/sound/dai-params.yaml#
     properties:
       mclk-fs:
         $ref: simple-card.yaml#/definitions/mclk-fs
@@ -68,12 +66,6 @@ definitions:
             - pdm
             - msb
             - lsb
-      convert-rate:
-        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-rate
-      convert-channels:
-        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-channels
-      convert-sample-format:
-        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-format
 
       dai-tdm-slot-num:
         description: Number of slots in use.
diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
index ed31e04ff6a6..71f52f7e55f6 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -9,6 +9,9 @@ title: Audio Graph
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
+allOf:
+  - $ref: /schemas/sound/dai-params.yaml#
+
 properties:
   dais:
     $ref: /schemas/types.yaml#/definitions/phandle-array
@@ -30,12 +33,6 @@ properties:
       widget ("Microphone", "Line", "Headphone", "Speaker"), the
       second being the machine specific name for the widget.
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
-  convert-rate:
-    $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-rate
-  convert-channels:
-    $ref: /schemas/sound/dai-params.yaml#/$defs/dai-channels
-  convert-sample-format:
-    $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-format
 
   pa-gpios:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/dai-params.yaml b/Documentation/devicetree/bindings/sound/dai-params.yaml
index f5fb71f9b603..cd8508175564 100644
--- a/Documentation/devicetree/bindings/sound/dai-params.yaml
+++ b/Documentation/devicetree/bindings/sound/dai-params.yaml
@@ -11,15 +11,14 @@ maintainers:
 
 select: false
 
-$defs:
-
-  dai-channels:
+properties:
+  convert-channels:
     description: Number of audio channels used by DAI
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 1
     maximum: 32
 
-  dai-sample-format:
+  convert-sample-format:
     description: Audio sample format used by DAI
     $ref: /schemas/types.yaml#/definitions/string
     enum:
@@ -29,12 +28,10 @@ $defs:
       - s24_3le
       - s32_le
 
-  dai-sample-rate:
+  convert-rate:
     description: Audio sample rate used by DAI
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 8000
     maximum: 192000
 
-properties: {}
-
 additionalProperties: true
-- 
2.40.1

