Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 126F965DD2B
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 20:55:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CC06C76A;
	Wed,  4 Jan 2023 20:54:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CC06C76A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672862125;
	bh=sFXZRSOGgAsCXhxHpKiih4SIl20fwijDGosnd3EEM6c=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gikQQ43TstwjyXDfcImGlyONNN1OeOH4Ks+2mjpLKLAGfxZ1Seb6TxsarRm1DLKAc
	 hw7FENQ//VnT9OQNPvW/3DpdCD2Of7HIFMV8RCkNcYUExVAicEag6sJ6SCeohLx9Kq
	 r2HC7alcnmfnFwjUQRy9uqbhL0w9hkn9KHnaYrmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CFB3F8024D;
	Wed,  4 Jan 2023 20:54:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29AEEF80240; Wed,  4 Jan 2023 20:54:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp-out-03.comm2000.it (smtp-out-03.comm2000.it [212.97.32.66])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26AB0F800C0
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 20:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26AB0F800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mailserver.it header.i=@mailserver.it
 header.a=rsa-sha256 header.s=mailsrv header.b=F4W1Hk7s
Received: from francesco-nb.toradex.int (31-10-206-125.static.upc.ch
 [31.10.206.125])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-03.comm2000.it (Postfix) with ESMTPSA id 5F922B446B0;
 Wed,  4 Jan 2023 20:53:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1672862053;
 bh=sFXZRSOGgAsCXhxHpKiih4SIl20fwijDGosnd3EEM6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=F4W1Hk7sdGLoukyjWsdzgB38yhBiCGFxt1Vpi8clhtpu1vZ3BRRHjwneUwYc/dFZA
 ciNl+m9eYFBh7jdNaZzgnv1wBM/NSWV6+DMdW7hT0fduLYdiu+Ma5gqdfzCGCpznDy
 hYdscCZj/PlvX8UDzFFDcNGCJ3JkDgPaxcAjLER9g/tiM9nuUz3bRu++NJvXTtu70q
 icco4RwBYibmtNgjbDOgbbIZl8Q1l+TP8E/xEpr6p02sDL5cMgza5dtKaNjN1c+mc2
 GAv44NlKVdRoRd0P9ZKFT447GdDg9WbRwMwowNObJwx6pxpr/C4jnZxMTP6/aKor3S
 WG7hCQDVkQlpQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/3] ASoC: dt-bindings: nau8822: add nuvoton,
 spk-btl property to dtschema
Date: Wed,  4 Jan 2023 20:53:50 +0100
Message-Id: <20230104195350.149300-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104140412.35575-1-francesco@dolcini.it>
References: <20230104140412.35575-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: wtli@nuvoton.com, Takashi Iwai <tiwai@suse.com>, kchsu0@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Marty <info@benjaminmarty.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Add nuvoton,spk-btl to configure the two loudspeaker outputs
as Bridge Tied Load

Cc: David Lin <CTLIN0@nuvoton.com>
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v2: Added Acked-by: Krzysztof
---
 .../devicetree/bindings/sound/nuvoton,nau8822.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
index 2810924e3a47..65105402a53d 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
@@ -21,6 +21,12 @@ properties:
   reg:
     maxItems: 1
 
+  nuvoton,spk-btl:
+    description:
+      If set, configure the two loudspeaker outputs as a Bridge Tied Load output
+      to drive a high power external loudspeaker.
+    $ref: /schemas/types.yaml#/definitions/flag
+
 required:
   - compatible
   - reg
-- 
2.25.1

