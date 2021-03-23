Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2012D346579
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 17:39:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A32971663;
	Tue, 23 Mar 2021 17:38:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A32971663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616517564;
	bh=RwktkxnTTVH0Z2j6naMLRu5s8qLvKqa+JzjV3TjWS6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WTnc0mqLjz6OlYjQn76Nxd359BR9si4xstvrWu/uCwSPBj99GI1gTfMY2tMJq9I5M
	 QmsuH5j/rnQGMaSjmCC15+N6I0IW8gUnoNmcM30gTbC54XDc491vi7sAzYA32PNZ32
	 vEUu3kqUmK0RmXhC+LnpmvyJD2wO+JaZgHBursYM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92D1BF8032C;
	Tue, 23 Mar 2021 17:37:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 073F1F802E3; Tue, 23 Mar 2021 17:36:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6448F8025F
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 17:36:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6448F8025F
Received: by mail-io1-f51.google.com with SMTP id z3so18363556ioc.8
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 09:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VXRg8g46EQQdfaQQE5j+9aJCuQ11jH3qTJJtKuhoDX4=;
 b=ZOLpX7F9zGEL8PXrs9u2yczUGcmbvKAkMzoKZY0GYaPoiMxwM8VrdPFXNvXr7XIUbl
 p4xdDAFNjm03msZQvSayIgekP3wxVAJPmlzcOSNwxAwxb1UCKQgdvITyBAqXE2N5YVDH
 wvH5+IEiJYc3ikNb3hd97AJ2P+qqD8uVLho5zcMKueaHm79vYKhP46MrL9AGdNjT+Jjl
 FdtoP0lmQdRWvCDB3mw1sa4fD8xkV6j1aokwqM1f+GW1tOlcVq+dl0cITUeAcrqkobYC
 JikFb6wV+6Fk8XFIwpb53Qjnag83kRs7Rht4/NEv1DfEY2ICOTbpCWZwNrI3774MlNgP
 SObA==
X-Gm-Message-State: AOAM5300wBEDHkF0og0nx+obP7MjndsI2MoAo+/Wzvlh3y/rzRA2zeqp
 FJa56EZz4K2W2sBzg1e9PYIWvaK0Kw==
X-Google-Smtp-Source: ABdhPJwiD4IP2KKeyuJ/y+wBT2DqL20iY/vmH0Iz5F5gZwG4IlajzysJQDKNcuox7dUAwqmvuthNAg==
X-Received: by 2002:a6b:b587:: with SMTP id e129mr5090193iof.19.1616517404673; 
 Tue, 23 Mar 2021 09:36:44 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
 by smtp.googlemail.com with ESMTPSA id r18sm9771268ilj.86.2021.03.23.09.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:36:43 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] ASoC: dt-bindings: Use OF graph schema
Date: Tue, 23 Mar 2021 10:36:33 -0600
Message-Id: <20210323163634.877511-3-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323163634.877511-1-robh@kernel.org>
References: <20210323163634.877511-1-robh@kernel.org>
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

