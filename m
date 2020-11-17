Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DBD2B564C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 02:35:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADD291790;
	Tue, 17 Nov 2020 02:34:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADD291790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605576946;
	bh=tuJTjCr29azU1T3/wPMq7j0qP7iS8sllKRkfMC4mPXg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hroylkp/r06pFnKiJLPZYhQ21M771kVDRrheDmsvRW3cjLfXCKydXLJk2UCPz7m2X
	 8dEYpUoOrILutBgkW0mvgeZnWo/Jysb9PjnhOydcCQ2Im0/QY5s7eipat2FGPZovhv
	 Enzt1C0l1irZT14JE+wiT0XsJIbXuWo30XwjC8j4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E99BF804B1;
	Tue, 17 Nov 2020 02:34:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6669EF8016E; Tue, 17 Nov 2020 02:34:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE8C1F800D8
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 02:33:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE8C1F800D8
Received: by mail-oi1-f195.google.com with SMTP id m13so20938937oih.8
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 17:33:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=spsmauWvc5A5SYudUomXMMzn+PeDbEjuioZTNAq65wc=;
 b=E9Kg8LpScepEpomNbePQZJay2lvHwuRMSwy/OuYHu5dWY+9m5n9PWu/lJqzYLHurwC
 bMoQKE1aXSuSFH9sTavM1S4WLeKmDBVB98A6hlPRkF3GDzqIK7TeeC52qtCQfkM+pODQ
 8ZcqxYAlUrU2I+spUruXZ+KcG07FGbZ2blyliBQR3AsNsnHJKQ6Y/UxWqZrQv+Ridb4B
 wDsWH+TOTGWpUzmH8yE47f/XdBcTrYj9oVldKFLpHpbrlx5aiyyX8Exx8xuxHRA/TPMB
 xscy3JDFIolaSwZgKitKoasBDZ9GMiTtWC1fbToTLVVKGrqpi3htRGALHG0EWmvC0paR
 LqAQ==
X-Gm-Message-State: AOAM531F1ZnRgTra/E9ZxKZM6QZ2hMcpst2D2ROcD7eQ0akR69mU8CuN
 v93v0gvovQdZqxwc3+URBw==
X-Google-Smtp-Source: ABdhPJwAoktwKb9CWVlc2LS2AAtpaWZoLT4ef5gt28xJSOD8nEazcXh9uwt/ZK7/G6xwTypii9uUJA==
X-Received: by 2002:aca:fcd5:: with SMTP id a204mr970460oii.161.1605576832729; 
 Mon, 16 Nov 2020 17:33:52 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id j9sm3861325oij.44.2020.11.16.17.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 17:33:52 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/4] ASoC: dt-bindings: Use OF graph schema
Date: Mon, 16 Nov 2020 19:33:47 -0600
Message-Id: <20201117013349.2458416-3-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117013349.2458416-1-robh@kernel.org>
References: <20201117013349.2458416-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Lubomir Rintel <lkundrak@v3.sk>
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

Now that we have an OF graph schema, let's use it for the
audio-graph-port schema.

There's no need to define 'ports' nodes as specific bindings must define
that and port numbering of the child 'port' nodes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Note that graph.yaml is part of dtschema now intead of the kernel tree.
---
 .../bindings/sound/audio-graph-port.yaml         | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 9db19d4edc6a..c05d5643b10e 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -13,11 +13,9 @@ select: false
 
 properties:
   port:
-    description: single OF-Graph subnode
+    $ref: /schemas/graph.yaml#/properties/port
     type: object
     properties:
-      reg:
-        maxItems: 1
       prefix:
         description: "device name prefix"
         $ref: /schemas/types.yaml#/definitions/string
@@ -31,8 +29,6 @@ properties:
       "^endpoint(@[0-9a-f]+)?":
         type: object
         properties:
-          remote-endpoint:
-            maxItems: 1
           mclk-fs:
             description: |
               Multiplication factor between stream rate and codec mclk.
@@ -73,14 +69,6 @@ properties:
             description: CPU to Codec rate channels.
             $ref: /schemas/types.yaml#/definitions/uint32
 
-        required:
-          - remote-endpoint
-
-  ports:
-    description: multi OF-Graph subnode
-    type: object
-    patternProperties:
-      "^port(@[0-9a-f]+)?":
-        $ref: "#/properties/port"
+    additionalProperties: false
 
 additionalProperties: true
-- 
2.25.1

