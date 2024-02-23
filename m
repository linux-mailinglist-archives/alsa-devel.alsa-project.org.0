Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A2867E4B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 18:24:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCD42E94;
	Mon, 26 Feb 2024 18:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCD42E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708968261;
	bh=Zuw2kUsXk1o2lkzNgp948IBHTt7y/pU6Q3zzvW0bjQo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NJyLB7j+thhxgp+7dh+REV43Y93+sEfv8l2xPl9uxH071UfX9iWdHlsuOAnIC8hQC
	 kWanVhCEsGkY+VAN2L5RF6U9VRyEH3Z8tocgUp1EYReDSx3SOblmzwVXrQlKyitQ9/
	 L9XIpJlwqpPLY54BRA8qrH6dC63f5YVzmeBH89V8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80AC5F80619; Mon, 26 Feb 2024 18:23:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56686F8061B;
	Mon, 26 Feb 2024 18:23:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3253F80496; Fri, 23 Feb 2024 18:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9E92F800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 18:26:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9E92F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=tEzsrsvD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1708709193; x=1740245193;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zuw2kUsXk1o2lkzNgp948IBHTt7y/pU6Q3zzvW0bjQo=;
  b=tEzsrsvDRZP8FxCBQ6043ehBOOoV9O0kTA9O6fQxoPIgeQaoW73OT4j1
   PPjV5pWQF1QxJZt+/FEh0nDqLX5abc51xl3SOPRaWk/4TvMygevLCOxE7
   g97GvBzc9w7zJ4iyxtXp7rB6AdfaDeXbXBS+k1DKiG84P8T38UJGf8e4y
   x1/X8zNrfjrDW1IFyoDF6H5T6DL7QUXTfZfTU3bLhRRHWx5LYoqMmIF0b
   Xir7IyKu5ox/YjSCVhd3Cashks+WCCOF6q1YAnRjkomL7UsfGnUOL/zDi
   dbY7hM6se/5QUwTzpTQG1iNS5ZApzyvN2E59U8kqFGhDGccGVHA1xnd9k
   Q==;
X-CSE-ConnectionGUID: t18HA6KHT7+gZ8BIMsEZ6A==
X-CSE-MsgGUID: IB6QRYiQRsut+YfRq1SLEA==
X-IronPort-AV: E=Sophos;i="6.06,180,1705388400";
   d="scan'208";a="16734497"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Feb 2024 10:26:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 10:26:18 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 10:26:14 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH v4 13/39] ASoC: dt-bindings: atmel-classd: add sam9x7
 compatible
Date: Fri, 23 Feb 2024 22:56:08 +0530
Message-ID: <20240223172608.672190-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: Varshini.Rajendran@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: G7BFJ3IQXLZKD74NYJQPMIWL5K2U5MXL
X-Message-ID-Hash: G7BFJ3IQXLZKD74NYJQPMIWL5K2U5MXL
X-Mailman-Approved-At: Mon, 26 Feb 2024 17:22:49 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G7BFJ3IQXLZKD74NYJQPMIWL5K2U5MXL/>
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
Changes in v4:
- Changed the subject prefix matching the subsystem
- Removed unwanted '-items' from the syntax
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

