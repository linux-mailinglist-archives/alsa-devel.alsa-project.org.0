Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7905269B2AC
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 19:54:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D107DFB9;
	Fri, 17 Feb 2023 19:54:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D107DFB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676660092;
	bh=/LXsSGlAhqL+EPIVMAxJgQNtIq4ftT9f6HG07/pdwts=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gx7xCxrmouV5F8L7CaSUZ5WYgHd1GiBra5nkaEAjMAp8QeJOMHNaFJQDCUCacz7l5
	 eDrS/LviV8XBYx1xZBh97RQA9ih5xAMVywR22rP6NcOeG9OX+RLoDW/PZUUlAXOBQt
	 vVDDbiiuxo8ct+kf90SuhilrWonFNy3h1/LX3Q5Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 109F8F804FC;
	Fri, 17 Feb 2023 19:53:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BCB7F801C0; Fri, 17 Feb 2023 19:53:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 192A0F800AA
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 19:52:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 192A0F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OOf1QpSO
Received: by mail-wm1-x329.google.com with SMTP id
 bg22-20020a05600c3c9600b003dff4480a17so1170589wmb.1
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Feb 2023 10:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNEF4fipdoHCuo0/Rmv+9N9jdN1WQtjB48jcLvFIJM0=;
        b=OOf1QpSOIHQet9Z855DB1KvVOZV7THJ0Rp4RGA7bYB63FSuZCk5geY2X2z3jZpOXvb
         TwYuhtKLKVxOFcIDFIKAUAurb0ExHImNkalYjmFY2Rt3a3iqX9Djl63phjmYt7mqo+l9
         n/LlON1GPytkE2pagZEKsrMSMM923YE+UJLVLIFRWIFe2IbvVMs/8D/ZQ+zy+FjBtVVr
         hZ35KKgzCWfOpB/50WA1g0W7igIHf+MblBJAWkTVTl7vEBWwTd+BAlEhsXDnr6NWH8+o
         IRji+5aiSNWCUD2AirGx70z4QG5mRLZkVD1dVW4c4w2Rd1Y9ja717zvnD8S+kQyRvotd
         g8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNEF4fipdoHCuo0/Rmv+9N9jdN1WQtjB48jcLvFIJM0=;
        b=KWLBPAIl4IKMt0ouQpfU4E0vxgEKyZutkAsabZYqCQQmhDtgpStfNWTNA2jo+Y9jZS
         LL7ImNE9AHT7/WeJCNsloZs3HXTvzcMXu0WjlSQU5kRXFm6gnUdBBs7mizdgWXH8we3/
         MXk/uvbXM36YDHb6PXXQd9w9A84jK6sK/lufbi/98kjBuapmktK6u81mYEZP+RC3BCOt
         XCnE/xQViuBS5MwT99iC9gI4o/raSVMdFtzykyj1Wxbq1+4gO0hvYZMgHTprSKfheWMz
         7/idhA+6496ZTzpFJwYymBhaIseuF2vjjXQLdvkrFVs1Tu32CYVK0ccvxrwzkiJTtAg8
         CVrA==
X-Gm-Message-State: AO0yUKUSuftzAOAvFW1jpAdqzn5Aw4W+g0ZU5QezZE+1LOn2OHcet9Vt
	wCemMQGQlURVYiJ7tDqUciI=
X-Google-Smtp-Source: 
 AK7set/HQOxX57eReSaexgzyj9+zEziOHOg6F2mkRMYC/iABeacCkHDexTxzBR/lDcupAVxTveVafQ==
X-Received: by 2002:a7b:ce0d:0:b0:3dc:576c:ab07 with SMTP id
 m13-20020a7bce0d000000b003dc576cab07mr1970177wmc.14.1676659977422;
        Fri, 17 Feb 2023 10:52:57 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:d8bd:e692:c27f:c09d])
        by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003db0ad636d1sm2964514wms.28.2023.02.17.10.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:52:56 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/4] ASoC: dt-bindings: renesas,rz-ssi: Update interrupts and
 interrupt-names properties
Date: Fri, 17 Feb 2023 18:52:22 +0000
Message-Id: <20230217185225.43310-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XJH2MOXEISFAH2UACQE3CNJC64B6L3OP
X-Message-ID-Hash: XJH2MOXEISFAH2UACQE3CNJC64B6L3OP
X-MailFrom: prabhakar.csengg@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJH2MOXEISFAH2UACQE3CNJC64B6L3OP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

>From R01UH0914EJ0120 Rev.1.20 HW manual, for full duplex channels
(SSI0/1/3) dma_rt interrupt has now being marked as reserved and similarly
for half duplex channel (SSI2) dma_rx and dma_tx interrupts have now being
marked as reserved (this applies to RZ/G2L and alike SoC's). This patch
updates the binding doc to match the same.

While at it also updated the example node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/sound/renesas,rz-ssi.yaml        | 21 +++++++++++--------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index 196881d94396..3b5ae45eee4a 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -25,14 +25,18 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 4
+    minItems: 2
+    maxItems: 3
 
   interrupt-names:
-    items:
-      - const: int_req
-      - const: dma_rx
-      - const: dma_tx
-      - const: dma_rt
+    oneOf:
+      - items:
+          - const: int_req
+          - const: dma_rx
+          - const: dma_tx
+      - items:
+          - const: int_req
+          - const: dma_rt
 
   clocks:
     maxItems: 4
@@ -106,9 +110,8 @@ examples:
             reg = <0x10049c00 0x400>;
             interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 327 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>,
-                         <GIC_SPI 329 IRQ_TYPE_EDGE_RISING>;
-            interrupt-names = "int_req", "dma_rx", "dma_tx", "dma_rt";
+                         <GIC_SPI 328 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "int_req", "dma_rx", "dma_tx";
             clocks = <&cpg CPG_MOD R9A07G044_SSI0_PCLK2>,
                      <&cpg CPG_MOD R9A07G044_SSI0_PCLK_SFR>,
                      <&audio_clk1>,
-- 
2.25.1

