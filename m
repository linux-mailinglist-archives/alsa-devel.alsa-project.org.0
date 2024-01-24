Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E13783B1B4
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 20:02:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73A2B82C;
	Wed, 24 Jan 2024 20:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73A2B82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706122931;
	bh=tOgsZRXU9rRQFmddKn9J6mSGDO3A5r9Xtx6Ag8uTw0U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=e3F5MV7DLok7aqkPsEmuatdMWW93yoh4VtRhCnqXtDG8aRwYtFM8f4ewi+1eFiyBa
	 oMwTa7m7DWYy84YCeaW3W+uul10xxwrk5RoUWsjjmk/jsUpRfK9dMetFjhXjUdUWD0
	 pySMk5YY2JbobzI4GvWzRUEulQhTAfKkvyRVwzOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD3C6F8025F; Wed, 24 Jan 2024 20:01:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2658F804F1;
	Wed, 24 Jan 2024 20:01:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4379F802BE; Wed, 24 Jan 2024 20:01:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81E91F8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 20:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81E91F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GvuTAwEw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 568CD61D15;
	Wed, 24 Jan 2024 19:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA974C433F1;
	Wed, 24 Jan 2024 19:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706122880;
	bh=tOgsZRXU9rRQFmddKn9J6mSGDO3A5r9Xtx6Ag8uTw0U=;
	h=From:To:Cc:Subject:Date:From;
	b=GvuTAwEwBlmIaZvxxby4E//caeJa+m9jb6A6jf1IR/4Qrdij11PglW5ZLz94g9aqM
	 rwtcZYQSCvb78UR2KaycjDifkQwqeQBQlCAf1VKvbVCUp0a42xmub369OdjfdAdXkO
	 trn43tCZBE/BYImrD58p+LtIthpbyovHXb5oVF4pzGYPIua+tHZvszUfNnnwAslW2j
	 Ykh26hHQG0hYValJobzSo1U+biPNI6GR9ygDNKf2rlyMpWXQARLd5WhwDf/lIOyAbC
	 tmCIvhQgvQ05qDaypf5VWeZ+rq+b3dy7V2tuHl+haIAje9RW4+6TAtzXJW+bQ7RQH3
	 Ir6J0QvybvE/Q==
From: Rob Herring <robh@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	patches@opensource.cirrus.com
Cc: alsa-devel@alsa-project.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: Unify "input-debounce" schema
Date: Wed, 24 Jan 2024 13:01:04 -0600
Message-ID: <20240124190106.1540585-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RFBNDKTFE6VI25MAVY6JTJXWQHRCR3QC
X-Message-ID-Hash: RFBNDKTFE6VI25MAVY6JTJXWQHRCR3QC
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RFBNDKTFE6VI25MAVY6JTJXWQHRCR3QC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

nuvoton,npcm845-pinctrl defines the common "input-debounce" property as
an array rather than an scalar. Update the common definition to expand
it to an uint32-array, and update all the users of the property with
array constraints.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml   | 3 ++-
 .../devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml   | 1 -
 .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml   | 3 ++-
 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml     | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
index bb61a30321a1..482acda88e73 100644
--- a/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml
@@ -93,7 +93,8 @@ properties:
 
           input-schmitt-disable: true
 
-          input-debounce: true
+          input-debounce:
+            maxItems: 1
 
           output-low: true
 
diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
index 3e8472898800..20cf0102aa63 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
@@ -152,7 +152,6 @@ patternProperties:
         description:
           Debouncing periods in microseconds, one period per interrupt
           bank found in the controller
-        $ref: /schemas/types.yaml#/definitions/uint32-array
         minItems: 1
         maxItems: 4
 
diff --git a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
index 7b7f840ffc4c..08442c880f07 100644
--- a/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml
@@ -103,7 +103,8 @@ patternProperties:
         items:
           pattern: "^gpio1?[0-9]{1,2}$"
 
-      input-debounce: true
+      input-debounce:
+        maxItems: 1
 
     additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
index be81ed22a036..d0af21a564b4 100644
--- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
@@ -97,7 +97,7 @@ properties:
     description: disable schmitt-trigger mode
 
   input-debounce:
-    $ref: /schemas/types.yaml#/definitions/uint32
+    $ref: /schemas/types.yaml#/definitions/uint32-array
     description: Takes the debounce time in usec as argument or 0 to disable
       debouncing
 
-- 
2.43.0

