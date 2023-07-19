Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2C97595E8
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 14:49:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80407203;
	Wed, 19 Jul 2023 14:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80407203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689770959;
	bh=TKonb7ri7B03ZBVsNZLJ34UsMXcCiIc//zz/rciSZ2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F/htLq01+42f/naS4RbbguZkSMdbcZEeW9Myy+Jj78U6EpkwHv5nhS7Op7pKQLHuI
	 54fcZF+Th/xU0xzJ5MIzqITWv6XEGSP2j+O2VRv6xP3itNoHesdkpSWR2YenXjx8Hu
	 kYNWobGe8grMs+NlDzUWqcBm07eLtEgHFtKEZgys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F466F80557; Wed, 19 Jul 2023 14:48:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C438F80544;
	Wed, 19 Jul 2023 14:48:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78D8FF80564; Wed, 19 Jul 2023 14:48:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E4E34F80557
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 14:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4E34F80557
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A7484209AC;
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
Subject: [PATCH v1 2/2] ASoC: dt-bindings: nau8822: Add MCLK clock
Date: Wed, 19 Jul 2023 14:47:52 +0200
Message-Id: <20230719124752.248898-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230719124752.248898-1-francesco@dolcini.it>
References: <20230719124752.248898-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BWBWEHJPP4UKQWIE66GBWQTFAWOLACJT
X-Message-ID-Hash: BWBWEHJPP4UKQWIE66GBWQTFAWOLACJT
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BWBWEHJPP4UKQWIE66GBWQTFAWOLACJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add nau8822 master clock input.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../devicetree/bindings/sound/nuvoton,nau8822.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
index edc8cc756980..cb8182bbc491 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
@@ -24,6 +24,12 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mclk
+
   nuvoton,spk-btl:
     description:
       If set, configure the two loudspeaker outputs as a Bridge Tied Load output
-- 
2.25.1

