Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49300350236
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 16:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE186168F;
	Wed, 31 Mar 2021 16:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE186168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617201020;
	bh=RwktkxnTTVH0Z2j6naMLRu5s8qLvKqa+JzjV3TjWS6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KWZKrRABnKYG1mgfOHvhmoj/kJoMEzRLQ6BIUnimgjG3vi0XF8U9IFhxsUaAJ7wpP
	 xFY7tmsWEPu92UEKEG7gUhlQ58SnYk45U6h73PZkJJ8DGb5/pqKhQSzhANFa5PniYJ
	 +C5OyVKA4C/9DqaQJRsk47iB51bvHg8ZoHek4Vd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEC7CF8020C;
	Wed, 31 Mar 2021 16:28:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E34A1F80229; Wed, 31 Mar 2021 16:28:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39D30F8014E
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 16:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39D30F8014E
Received: by mail-oi1-f173.google.com with SMTP id a8so20148266oic.11
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 07:27:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VXRg8g46EQQdfaQQE5j+9aJCuQ11jH3qTJJtKuhoDX4=;
 b=aOUIIzqvWNsbNwnpBvd3mKpQ9S1DViXCQAhdMotPvYBHwAupWwW3+ZIzT+o8RNXfSL
 fFE6UdfmZgE2K1VsWzPFfRg1BMQCqdwPjPDmcLNYwOaoKRUJG/DvXvX44Zk0qyzmfKC2
 x7k1gSXE6jy50PCYq6HzL9mSB4F4Vsfd96YYqoD8G2S4jHTjGulD46lwGZgYAlqwGuNu
 gXkFr4naaSWKDI8aKLBlp/ezczE5bDHZiKvuT60j11Hzsf4p1Ao3vKjSKPvopFeqUAf9
 1yV6C9bX8zE6baz93KUITIUyPTRhm3q/FeknDcBmuuYpHnS9LuAO6E7j8NzWs486NDhr
 /Vnw==
X-Gm-Message-State: AOAM533nPtqaoG0u3nY8g86L9SDWYsYOrnADrYsXm3UZpvsi/TG+VJbl
 mtnOqnW+fmqYRn5MR5+bdA==
X-Google-Smtp-Source: ABdhPJx/r+uJSPnbV2RZAwQzxbxafoglGFYnTVKVL5A6Xbw1EwPTr5j4W6fn8n9sai+N1CGtZQsR8g==
X-Received: by 2002:a05:6808:13d0:: with SMTP id
 d16mr2542244oiw.169.1617200875988; 
 Wed, 31 Mar 2021 07:27:55 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id v136sm451146oie.15.2021.03.31.07.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 07:27:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 2/3] ASoC: dt-bindings: Use OF graph schema
Date: Wed, 31 Mar 2021 09:27:47 -0500
Message-Id: <20210331142748.2163272-3-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331142748.2163272-1-robh@kernel.org>
References: <20210331142748.2163272-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
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

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/audio-graph-port.yaml      | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 9f68142c9ae3..43e7f86e3b23 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -11,9 +11,10 @@ maintainers:
 
 select: false
 
+allOf:
+  - $ref: /schemas/graph.yaml#/$defs/port-base
+
 properties:
-  reg:
-    maxItems: 1
   prefix:
     description: "device name prefix"
     $ref: /schemas/types.yaml#/definitions/string
@@ -25,10 +26,8 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
 patternProperties:
   "^endpoint(@[0-9a-f]+)?":
-    type: object
+    $ref: /schemas/graph.yaml#/$defs/endpoint-base
     properties:
-      remote-endpoint:
-        maxItems: 1
       mclk-fs:
         description: |
           Multiplication factor between stream rate and codec mclk.
-- 
2.27.0

