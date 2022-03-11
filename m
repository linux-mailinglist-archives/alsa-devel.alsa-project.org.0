Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADC14D6AF0
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Mar 2022 00:49:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC80518F0;
	Sat, 12 Mar 2022 00:48:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC80518F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647042571;
	bh=/Jo6gyJr/2BDpAy/Q+/jpBVSGELXNqHHKoiBkeVqunE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DIPHIr4Wu1Yhqxrd/DaGOJyjPQl///MsMeCy/2mYiySd60IXCMKAJYfhw33DHQTr4
	 TppS+00mVkSMlUKutK8obTkPOkBMb5iEkI94SqNLaONRYDatKgBA7PfiCEhfPFC24F
	 aTJTRSIK/DAzw5EGo85v8hkQZH+sLfmKQJ1W8ULA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD263F80238;
	Sat, 12 Mar 2022 00:48:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 219E2F80227; Sat, 12 Mar 2022 00:48:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72AEAF8012C
 for <alsa-devel@alsa-project.org>; Sat, 12 Mar 2022 00:48:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72AEAF8012C
Received: by mail-oi1-f171.google.com with SMTP id o83so3684173oif.0
 for <alsa-devel@alsa-project.org>; Fri, 11 Mar 2022 15:48:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x6lwOUs0d65LCqBi3QipuhYyxDJ9eIewRF/1SecNNVk=;
 b=E1Yn+5MA+IaBf/gjiUyYRsdqVYXvKngXTRJE4qH76mErTJstVnQtY9eQEMnQZZVDL1
 MF+LJNgF1HVAINhVlKgfXBrfip41p4i1FiOoPIErYYj681vkGn0fB/TbmZqO3OLjg/hd
 arEaNUGstSGkJL8zXUnCcpjMD+82U383JtbubMpiz7yKfadiZ4ReX9kjql/pSH7xGN9r
 tvTb51LBH7W/MtkrtQ+d2y+h/pd8qKAsHDRbBfGbpRo8ypSwyjVYPARlZ809jr0VcDZd
 UpsZ1td3I5dd65XsyIUnyI8aMDz9zeGNjMyd5+zb5IGgnuaNb55bslNsJ8xLE4uqfeuk
 bH3A==
X-Gm-Message-State: AOAM533XestB2dxzbSjI0Mmw7TSg0Bb9hEtwl4P4fi5su1s7KAS9nQaB
 9p0VNmBs6kRfKX/AyUAUZg==
X-Google-Smtp-Source: ABdhPJyvZ0r+1P93joNo0ptbuIsXbm7FYq3d7tYAdY68/bzI93gYnyJbwvMNDQDUCKsJKaNoyhXoNg==
X-Received: by 2002:a05:6808:2013:b0:2d9:dbed:6999 with SMTP id
 q19-20020a056808201300b002d9dbed6999mr14493688oiw.30.1647042496534; 
 Fri, 11 Mar 2022 15:48:16 -0800 (PST)
Received: from xps15.. (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
 by smtp.googlemail.com with ESMTPSA id
 o21-20020a056870e81500b000d9b2ba714asm3942423oan.21.2022.03.11.15.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 15:48:15 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: dt-bindings: Fix patternProperties with fixed strings
Date: Fri, 11 Mar 2022 17:48:01 -0600
Message-Id: <20220311234802.417610-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
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

The simple-audio-card and renesas,rsnd bindings used 'patternProperties'
with fixed strings to work-around a dtschema meta-schema limitation. This
is now fixed and the schemas can be fixed to use 'properties' instead.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/renesas,rsnd.yaml          | 16 ++++---
 .../bindings/sound/simple-card.yaml           | 42 +++++++++----------
 2 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index c2930d65728e..e17c0245f77a 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -123,9 +123,7 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
-# use patternProperties to avoid naming "xxx,yyy" issue
-patternProperties:
-  "^rcar_sound,dvc$":
+  rcar_sound,dvc:
     description: DVC subnode.
     type: object
     patternProperties:
@@ -141,7 +139,7 @@ patternProperties:
           - dma-names
     additionalProperties: false
 
-  "^rcar_sound,mix$":
+  rcar_sound,mix:
     description: MIX subnode.
     type: object
     patternProperties:
@@ -150,7 +148,7 @@ patternProperties:
         # no properties
     additionalProperties: false
 
-  "^rcar_sound,ctu$":
+  rcar_sound,ctu:
     description: CTU subnode.
     type: object
     patternProperties:
@@ -159,7 +157,7 @@ patternProperties:
         # no properties
     additionalProperties: false
 
-  "^rcar_sound,src$":
+  rcar_sound,src:
     description: SRC subnode.
     type: object
     patternProperties:
@@ -182,7 +180,7 @@ patternProperties:
           - dma-names
     additionalProperties: false
 
-  "^rcar_sound,ssiu$":
+  rcar_sound,ssiu:
     description: SSIU subnode.
     type: object
     patternProperties:
@@ -202,7 +200,7 @@ patternProperties:
           - dma-names
     additionalProperties: false
 
-  "^rcar_sound,ssi$":
+  rcar_sound,ssi:
     description: SSI subnode.
     type: object
     patternProperties:
@@ -239,7 +237,7 @@ patternProperties:
     additionalProperties: false
 
   # For DAI base
-  "^rcar_sound,dai$":
+  rcar_sound,dai:
     description: DAI subnode.
     type: object
     patternProperties:
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 45fd9fd9eb54..103044bd32eb 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -156,45 +156,45 @@ properties:
     description: User specified audio sound card name.
     $ref: /schemas/types.yaml#/definitions/string
 
-# use patternProperties to avoid naming "xxx,yyy" issue
-patternProperties:
-  "^simple-audio-card,widgets$":
+  simple-audio-card,widgets:
     $ref: "#/definitions/widgets"
-  "^simple-audio-card,routing$":
+  simple-audio-card,routing:
     $ref: "#/definitions/routing"
-  "^simple-audio-card,cpu(@[0-9a-f]+)?":
-    $ref: "#/definitions/dai"
-  "^simple-audio-card,codec(@[0-9a-f]+)?":
-    $ref: "#/definitions/dai"
 
   # common properties
-  "^simple-audio-card,frame-master$":
+  simple-audio-card,frame-master:
     $ref: "#/definitions/frame-master"
-  "^simple-audio-card,bitclock-master$":
+  simple-audio-card,bitclock-master:
     $ref: "#/definitions/bitclock-master"
-  "^simple-audio-card,frame-inversion$":
+  simple-audio-card,frame-inversion:
     $ref: "#/definitions/frame-inversion"
-  "^simple-audio-card,bitclock-inversion$":
+  simple-audio-card,bitclock-inversion:
     $ref: "#/definitions/bitclock-inversion"
-  "^simple-audio-card,format$":
+  simple-audio-card,format:
     $ref: "#/definitions/format"
-  "^simple-audio-card,mclk-fs$":
+  simple-audio-card,mclk-fs:
     $ref: "#/definitions/mclk-fs"
-  "^simple-audio-card,aux-devs$":
+  simple-audio-card,aux-devs:
     $ref: "#/definitions/aux-devs"
-  "^simple-audio-card,convert-rate$":
+  simple-audio-card,convert-rate:
     $ref: "#/definitions/convert-rate"
-  "^simple-audio-card,convert-channels$":
+  simple-audio-card,convert-channels:
     $ref: "#/definitions/convert-channels"
-  "^simple-audio-card,prefix$":
+  simple-audio-card,prefix:
     $ref: "#/definitions/prefix"
-  "^simple-audio-card,pin-switches$":
+  simple-audio-card,pin-switches:
     $ref: "#/definitions/pin-switches"
-  "^simple-audio-card,hp-det-gpio$":
+  simple-audio-card,hp-det-gpio:
     maxItems: 1
-  "^simple-audio-card,mic-det-gpio$":
+  simple-audio-card,mic-det-gpio:
     maxItems: 1
 
+patternProperties:
+  "^simple-audio-card,cpu(@[0-9a-f]+)?$":
+    $ref: "#/definitions/dai"
+  "^simple-audio-card,codec(@[0-9a-f]+)?$":
+    $ref: "#/definitions/dai"
+
   "^simple-audio-card,dai-link(@[0-9a-f]+)?$":
     description: |
       Container for dai-link level properties and the CPU and CODEC sub-nodes.
-- 
2.32.0

