Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 140302B564E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 02:36:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F61217B0;
	Tue, 17 Nov 2020 02:35:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F61217B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605576997;
	bh=vfruJhnw2CLxNbqqlX0eEGSQ56pym/W8DvMsHDB2w2o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bRbKHOSsxTl/R5RmUaWxekjtoG6+Mdaf4pqYZ371R5HhMbD0rIkN0Vqg2LxLJsGcS
	 wf4qmO2jX7VgsnJ4B6C9r/pOSltCvtEc5pDTS5C7zrTdEYdkoQoeKU5r/HmMOifHWx
	 2GOpk/o094cUaOjwTlyd7XNBuyvBUc4S52D5/ZuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD4FAF804CC;
	Tue, 17 Nov 2020 02:34:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF9F4F802A9; Tue, 17 Nov 2020 02:34:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA4A7F8016C
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 02:33:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA4A7F8016C
Received: by mail-oi1-f196.google.com with SMTP id c80so20962883oib.2
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 17:33:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wNb4ssqi6GnjfKnwrQ0BaPlK7z2Z97OJHzDNpZ85994=;
 b=ppJ6sWCxnTaMfXTv9xOkRO679ISCukfhf+jP27w0vgtUDQs+f022gf3lCdxefFVnYn
 yVr4t/C6dVQNNltudHPh8ESyvAACyPoVz1tB5zJ3zhFnQpxonJu2ISr5/RzOgCysw8Jf
 4qcO4wwLIP4W7inFAiuGuLASybs9d0ril2EA8F2VfZYFfE8yClV9Fxd0I33wtynlq/bg
 l3tka4YaPQsA5PRx8EuwTt94CDQmA9uMXsWXvtQiwLtPDwLwC6GkaVknhnC5S5MgxZSE
 VhEJvVc9VyEJSfgNiPhP1DFqp+wYm9csBEiNtG17+mkEYOoVH842xrIaWTA2+msnOyaX
 5Zaw==
X-Gm-Message-State: AOAM531Gm3faa/aCF017oLCmxjiuOf+TUTymlLbyhYqnasb5wlhsTjpg
 Wbhjs7/3VFaGLlGoBTJDSg==
X-Google-Smtp-Source: ABdhPJyDkvsLj4rCoRr0stY/uAY+Ho1h7TjbcsWWN9IwYjbAu6/wt1w8uWs//J0UNqwvW85u68w85A==
X-Received: by 2002:aca:cd17:: with SMTP id d23mr917590oig.171.1605576833830; 
 Mon, 16 Nov 2020 17:33:53 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id j9sm3861325oij.44.2020.11.16.17.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 17:33:53 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/4] ASoC: dt-bindings: marvell,
 mmp-sspa: Use audio-graph-port schema
Date: Mon, 16 Nov 2020 19:33:48 -0600
Message-Id: <20201117013349.2458416-4-robh@kernel.org>
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

Now that we have a graph schema, reference it from the marvell,mmp-sspa
schema.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/marvell,mmp-sspa.yaml      | 25 +++----------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml b/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
index 6d20a24a2ae9..234f64a32184 100644
--- a/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
+++ b/Documentation/devicetree/bindings/sound/marvell,mmp-sspa.yaml
@@ -9,6 +9,9 @@ title: Marvel SSPA Digital Audio Interface Bindings
 maintainers:
   - Lubomir Rintel <lkundrak@v3.sk>
 
+allOf:
+  - $ref: audio-graph-port.yaml#
+
 properties:
   $nodename:
     pattern: "^audio-controller(@.*)?$"
@@ -58,29 +61,9 @@ properties:
         type: object
 
         properties:
-          remote-endpoint: true
-
-          frame-master:
-            type: boolean
-            description: SoC generates the frame clock
-
-          bitclock-master:
-            type: boolean
-            description: SoC generates the bit clock
-
           dai-format:
-            $ref: /schemas/types.yaml#/definitions/string
-            description: The digital audio format
             const: i2s
 
-        required:
-          - remote-endpoint
-
-    required:
-      - endpoint
-
-    additionalProperties: false
-
 required:
   - "#sound-dai-cells"
   - compatible
@@ -112,8 +95,6 @@ examples:
       port {
         endpoint {
           remote-endpoint = <&rt5631_0>;
-          frame-master;
-          bitclock-master;
           dai-format = "i2s";
         };
       };
-- 
2.25.1

