Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76ACB6A5770
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 12:04:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A29B084A;
	Tue, 28 Feb 2023 12:03:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A29B084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677582239;
	bh=M0BMjJ51501wpDWDJL+qs/Hg4DZbcQHuATRCbLu3HlY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FTgSRsPWWMEj/0OI76YeqpuOav1P3fVQRiSsiliXRqb2R0cEICwm3w+XFqKp3ZjA0
	 vRlg0GFlGQtqZU9CXczhVDPzLJpd6Knwgkqwo5JTSVTmWahHE9lvKeKKQe0mW4/1Hf
	 68kQKNe1mZYztzbMsY+1nOh261/kcgbv51BCRXoE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A1B9F8052D;
	Tue, 28 Feb 2023 12:02:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36B26F80527; Tue, 28 Feb 2023 12:02:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7E4BF802BE
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 12:02:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7E4BF802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=BcL1TCVr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677582125; x=1709118125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M0BMjJ51501wpDWDJL+qs/Hg4DZbcQHuATRCbLu3HlY=;
  b=BcL1TCVrLbdCNl+1pEckWsZCPbnz34RPnYY/rTiHEmOqxyw2wyM8xP3s
   X/sKjK4H3Ja/Qda1aLQPtFgx1fvfMyQNCjcQsBRX3r21mOzspPQDYuL6T
   VLveMwbTjg9RwuifLLxMy7fCKWprgW5CwoEa3WqbXh7kL0M/FWq+8S2L9
   lXZw5iJ7sGV9yq6yZDaFztTtX/jfssfS8C00P3nDnot6Lcv+PilnRMYjL
   NLGthsTuUJ64yjgVAx2GSC7bybhSIfnbnjg7Pnn5PMEpHRNTEGdyyuk0S
   EdEG7bcJMj2Pj5Osdx54+c7wd+V4etmfgSrBW/H6m3X/a6DYA59aaew2j
   A==;
X-IronPort-AV: E=Sophos;i="5.98,221,1673938800";
   d="scan'208";a="213967752"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2023 04:02:03 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 28 Feb 2023 04:02:02 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 28 Feb 2023 04:01:59 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH v3 2/3] ASoC: dt-bindings: sama7g5-pdmc: add
 microchip,startup-delay-us binding
Date: Tue, 28 Feb 2023 13:01:44 +0200
Message-ID: <20230228110145.3770525-3-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228110145.3770525-1-claudiu.beznea@microchip.com>
References: <20230228110145.3770525-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: 4PE4JDSU7USZCWS25VRBQB7EWEBVRDMO
X-Message-ID-Hash: 4PE4JDSU7USZCWS25VRBQB7EWEBVRDMO
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4PE4JDSU7USZCWS25VRBQB7EWEBVRDMO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PDMC can work with different types of microphones, thus different boards
could have different microphones. Depending on microphone type the PDMC
would need to wait longer or shorter period (at startup) than the default
chosen one to filter unwanted noise. Thus add microchip,startup-delay-us
binding to let PDMC users to specify startup delay.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
index c4cf1e5ab84b..9b40268537cb 100644
--- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
@@ -67,6 +67,12 @@ properties:
     maxItems: 4
     uniqueItems: true
 
+  microchip,startup-delay-us:
+    description: |
+      Specifies the delay in microseconds that needs to be applied after
+      enabling the PDMC microphones to avoid unwanted noise due to microphones
+      not being ready.
+
 required:
   - compatible
   - reg
-- 
2.34.1

