Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EC87DE1EB
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 15:11:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAD033E8;
	Wed,  1 Nov 2023 15:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAD033E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698847893;
	bh=S4P6igh5PaMPcNl25eTG22Qa/g41nI2j5idcJ/z5fqM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D2DUIwP4V8r+BVRghlt9EZyX6mOe0qCJ6w2iVeXmzjvpe36FlxWYe3cxJuIkvZhpL
	 7H3/4pCtWj81t6KNg51jXFjbbuErSDZrF8u/uISPabVma5sQLydi5jvZApYhXCXuxC
	 kBtW+64XoQC5REYSPXYGcyamg1MYbUFZWsvAVYmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78F3CF80425; Wed,  1 Nov 2023 15:10:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D47DF8016D;
	Wed,  1 Nov 2023 15:10:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1A25F8020D; Wed,  1 Nov 2023 15:10:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A6D1F8014B
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 15:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A6D1F8014B
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6ce322b62aeso4231561a34.3
        for <alsa-devel@alsa-project.org>;
 Wed, 01 Nov 2023 07:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698847831; x=1699452631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hJIap+tCQCXrXsRRf3ecX3dDJMX+ntMEJi4qcuSxVfc=;
        b=UT4FuxL1ky5AQK4lGQMMWb/A5ic/+Khp6mLti4tnx+oG12WEa8B8BokavqM5pCYjcI
         L7F4kwPZ1qrBK0HS8iwiBJX5n9dcbPRQcw3JyoEhh8wd358012ElRX5IAonx6BU+LHMT
         oVPKq2zoAknvJISLPT77SMXda+UjFtn9YUVy/UFLFLd/Wu8jCbqC3XKDEJHSWNPNcsXG
         VA5oxiAJmvb6sABw+aPLTQDYIHf9q8pdTUBGqE4WXC6DnfBpeaPtvzYcQ3LystCVQ5ZU
         d1DBZceQIoj+JJUKu9I4yYAJBT//U0OrlRb8pRl+gM6uAR/dNOWgWxrCdMLeIPrkS0Bx
         WuRg==
X-Gm-Message-State: AOJu0YwygsG7LaqMMNTZslJfB50LCN7GhFtPUx9rw/Qhd5R+2cwqCF7H
	7unhndh9a7iNn7ssHMRMlg==
X-Google-Smtp-Source: 
 AGHT+IH/87KuiC8dP6zyfc4p1YF9Mp+7bxURSq2rjTaXtjGK1fMj7tBOMpK/Hf6grESE8beZhbyRCQ==
X-Received: by 2002:a05:6830:1d83:b0:6d3:1dc1:6ecc with SMTP id
 y3-20020a0568301d8300b006d31dc16eccmr1417903oti.19.1698847830885;
        Wed, 01 Nov 2023 07:10:30 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 l6-20020a05683004a600b006ce292a8be4sm208006otd.10.2023.11.01.07.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 07:10:30 -0700 (PDT)
Received: (nullmailer pid 23329 invoked by uid 1000);
	Wed, 01 Nov 2023 14:10:29 -0000
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: Simplify port schema
Date: Wed,  1 Nov 2023 09:09:22 -0500
Message-ID: <20231101140923.16344-2-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RCG3E7SNFYQUWQ3HMKLBMN4YKY3NTOQJ
X-Message-ID-Hash: RCG3E7SNFYQUWQ3HMKLBMN4YKY3NTOQJ
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCG3E7SNFYQUWQ3HMKLBMN4YKY3NTOQJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The use of 'definitions' is not necessary and also problematic because the
dtschema tools don't process 'definitions' resulting in this spurious
warning:

Documentation/devicetree/bindings/sound/renesas,rsnd.example.dtb: sound@ec500000: port:endpoint: Unevaluated properties are not allowed ('phandle' was unexpected)
        from schema $id: http://devicetree.org/schemas/sound/renesas,rsnd.yaml#

Fix this by moving the port schema to #/properties/port and referencing
that directly from the 'ports' schema.

Really, a binding should just always use 'ports' if multiple ports are
possible. There's no benefit to supporting both forms. However, it appears
there are already lots of users of this one with a single 'port' node.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Please apply for 6.7 to fix the warning.

 .../bindings/sound/renesas,rsnd.yaml          | 28 ++++++++-----------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 13a5a0a10fe6..1174205286d4 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -9,20 +9,6 @@ title: Renesas R-Car Sound Driver
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
-definitions:
-  port-def:
-    $ref: audio-graph-port.yaml#/definitions/port-base
-    unevaluatedProperties: false
-    patternProperties:
-      "^endpoint(@[0-9a-f]+)?":
-        $ref: audio-graph-port.yaml#/definitions/endpoint-base
-        properties:
-          playback:
-            $ref: /schemas/types.yaml#/definitions/phandle-array
-          capture:
-            $ref: /schemas/types.yaml#/definitions/phandle-array
-        unevaluatedProperties: false
-
 properties:
 
   compatible:
@@ -125,7 +111,17 @@ properties:
 
   # ports is below
   port:
-    $ref: "#/definitions/port-def"
+    $ref: audio-graph-port.yaml#/definitions/port-base
+    unevaluatedProperties: false
+    patternProperties:
+      "^endpoint(@[0-9a-f]+)?":
+        $ref: audio-graph-port.yaml#/definitions/endpoint-base
+        properties:
+          playback:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+          capture:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+        unevaluatedProperties: false
 
   rcar_sound,dvc:
     description: DVC subnode.
@@ -269,7 +265,7 @@ patternProperties:
     unevaluatedProperties: false
     patternProperties:
       '^port(@[0-9a-f]+)?$':
-        $ref: "#/definitions/port-def"
+        $ref: "#/properties/port"
 
 required:
   - compatible
-- 
2.42.0

