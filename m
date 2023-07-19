Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE517595EA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 14:49:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7CD1843;
	Wed, 19 Jul 2023 14:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7CD1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689770976;
	bh=e76FrVKBzL70VfAKprOXt0mE+f+NPWs/hZ9KOycSsWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C5ixMSp2fYVw6si9qMo/NJ8jAbk2/ggbT31zLwn09Ocss3cIzQzwtEzWbM4PWfNIV
	 JZoTg9UGbyZcedE+/UQm7NiNfXnX1MFVcQ52mjOibuw/46eP3dekWC7j+qZa1MQjPc
	 mP2TjaDPFUKG1K0DOsIr5tc3GoKFGihABF8iq6uo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 023CEF8057D; Wed, 19 Jul 2023 14:48:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39A79F80578;
	Wed, 19 Jul 2023 14:48:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B67B9F80563; Wed, 19 Jul 2023 14:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail11.truemail.it (mail11.truemail.it
 [IPv6:2001:4b7e:0:8::81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 10464F8055C
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 14:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10464F8055C
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 3A781209A8;
	Wed, 19 Jul 2023 14:47:57 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	CTLIN0@nuvoton.com
Subject: [PATCH v1 1/2] ASoC: dt-bindings: nau8822: Add #sound-dai-cells
Date: Wed, 19 Jul 2023 14:47:51 +0200
Message-Id: <20230719124752.248898-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230719124752.248898-1-francesco@dolcini.it>
References: <20230719124752.248898-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GZDUT7MQGPW6X234FPNFMV45LOWCKVMH
X-Message-ID-Hash: GZDUT7MQGPW6X234FPNFMV45LOWCKVMH
X-MailFrom: francesco@dolcini.it
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add #sound-dai-cells property and reference dai-common.yaml schema, this
is required since NAU8822 can be used as a platform DAI link.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../devicetree/bindings/sound/nuvoton,nau8822.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
index 65105402a53d..edc8cc756980 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
@@ -21,6 +21,9 @@ properties:
   reg:
     maxItems: 1
 
+  "#sound-dai-cells":
+    const: 0
+
   nuvoton,spk-btl:
     description:
       If set, configure the two loudspeaker outputs as a Bridge Tied Load output
@@ -31,6 +34,9 @@ required:
   - compatible
   - reg
 
+allOf:
+  - $ref: dai-common.yaml#
+
 additionalProperties: false
 
 examples:
-- 
2.25.1

