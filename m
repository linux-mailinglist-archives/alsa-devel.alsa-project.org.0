Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D474769188
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:21:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC66B851;
	Mon, 31 Jul 2023 11:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC66B851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690795284;
	bh=X+3fbC3nQJfHYZI/7JU2s7cSRjz329rkn9qwc+BhSS8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LQgn+d4p6mrCOBu+54sTq7RquabTClaoIbZq3/99oYBcXZhTlT+2qggL96WTwPa4z
	 ZWdhf8K5yGndO7s7T75GoJuoUH1uoz9YbT7mRIWWVg9wAI7XxPbQ1rmNVaBa3Gb5uZ
	 C0GFdc+t6wKq0o6iLYA3ZP2Y7xnnhDER70tIm+Kw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D0B0F805F8; Mon, 31 Jul 2023 11:18:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E781DF805F3;
	Mon, 31 Jul 2023 11:18:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46478F8019B; Fri, 28 Jul 2023 12:27:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8879FF800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 12:27:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8879FF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=ErlRpgtL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690540076; x=1722076076;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X+3fbC3nQJfHYZI/7JU2s7cSRjz329rkn9qwc+BhSS8=;
  b=ErlRpgtLPTghypIkPNePWChXl5QrVLzZJcMiwXyKWQ+OGKwcs5H3rTtz
   wLqAqoXLyV0SP/GSYGKX/2OhsMub0W//vsS/qAFCImAKzFvuq8uEu6+rt
   1/2zBinoHnXNKDk/gmNzgjG2RnDey6tJZkjDAlniEyzEN+2uy9V5QpvlT
   xh6uvJVDbvI7fAxxMk3RaKSxWh4y5eQW+Jg0qR1sS6uJGRlqC3kxwreua
   punxYxFefzdLqiaONcP5GbLCI2g65XlWxRDwxLXMu3+/7VuDZJ84XoPeh
   /iel0Khxm9C6KckbHR58nbpHkcBk6CAr0IH25iVg+Ca5IogVnIO31btGv
   w==;
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200";
   d="scan'208";a="238401576"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jul 2023 03:27:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 03:27:52 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 28 Jul 2023 03:27:47 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <claudiu.beznea@microchip.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH v3 26/50] dt-bindings: atmel-classd: add sam9x7 compatible
Date: Fri, 28 Jul 2023 15:57:40 +0530
Message-ID: <20230728102740.266612-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: Varshini.Rajendran@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: T6CED6XKLXOW4RBE4YX4V6DK6LJWILPB
X-Message-ID-Hash: T6CED6XKLXOW4RBE4YX4V6DK6LJWILPB
X-Mailman-Approved-At: Mon, 31 Jul 2023 09:18:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6CED6XKLXOW4RBE4YX4V6DK6LJWILPB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sam9x7 compatible to DT bindings documentation.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 .../devicetree/bindings/sound/atmel,sama5d2-classd.yaml    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
index 43d04702ac2d..ae3162fcfe02 100644
--- a/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
+++ b/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.yaml
@@ -18,7 +18,12 @@ description:
 
 properties:
   compatible:
-    const: atmel,sama5d2-classd
+    oneOf:
+      - items:
+          - const: atmel,sama5d2-classd
+      - items:
+          - const: microchip,sam9x7-classd
+          - const: atmel,sama5d2-classd
 
   reg:
     maxItems: 1
-- 
2.25.1

