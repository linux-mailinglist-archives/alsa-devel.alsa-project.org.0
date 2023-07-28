Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB4B769189
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:21:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A7F06C0;
	Mon, 31 Jul 2023 11:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A7F06C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690795308;
	bh=HWrdd9pLnOMwuwU7EGPxFgfJcPWwAXMfj31MXLpYoBY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WcLxFuMJfq+LaaKQbAwRkr0JZAdTRLZN8GY5Ck03puhUh7d16KXk1Di5nhFlw8WDa
	 51bUzGWboVH/2/+fNCN50HNJee2Z7nWHlhRNnFPS3WZVpMBjE3vuaZ7pDDqya+opf2
	 r6vbXmXyWeuyJAQK1LAgwWrItDLJgz8H4oshOO9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FE5AF805FF; Mon, 31 Jul 2023 11:18:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FD20F805F7;
	Mon, 31 Jul 2023 11:18:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5555F8019B; Fri, 28 Jul 2023 12:28:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 97EA2F800D2
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 12:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97EA2F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=Q8eZYgRU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690540119; x=1722076119;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HWrdd9pLnOMwuwU7EGPxFgfJcPWwAXMfj31MXLpYoBY=;
  b=Q8eZYgRUxitj/NRcAKkQucS6aI47I7BT2dZhDoFndIgqRAbIPqgXLENG
   YFMG9ska14csDdhzt6CbxgtBUsxa+9Sv3kZTpe/aYC8+aSIjMMbJL3DYt
   pSUkIIRBGlpnlFk+kVpD+aOh2KTajeq7qEaHsQR1tKP9xPWTDIMmI//eW
   GIhlY34yJ6fZ1Z97HTjznFHRbfiVQ8X7NyUNEl7Y5BVnkyDj5eT8qk2Xm
   /yzk9SvG12ZA++P7B9PMwBsF5JA2KAHkygiEX/iUq2a8ajg+aUWSL077/
   ZRHtXaXk42mKl+BebnEM0v1UxnzmQF+izzzI6QmXWNM5pADO1550i6WJK
   w==;
X-IronPort-AV: E=Sophos;i="6.01,237,1684825200";
   d="scan'208";a="238401621"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Jul 2023 03:28:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Jul 2023 03:28:35 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 28 Jul 2023 03:28:30 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <claudiu.beznea@microchip.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<codrin.ciubotariu@microchip.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH v3 31/50] ASoC: dt-bindings: microchip: add sam9x7
Date: Fri, 28 Jul 2023 15:58:28 +0530
Message-ID: <20230728102828.266861-1-varshini.rajendran@microchip.com>
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
Message-ID-Hash: EEO6AT7E7HKNRAJAN3GCK6XWUCET7UEG
X-Message-ID-Hash: EEO6AT7E7HKNRAJAN3GCK6XWUCET7UEG
X-Mailman-Approved-At: Mon, 31 Jul 2023 09:18:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EEO6AT7E7HKNRAJAN3GCK6XWUCET7UEG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sam9x7 compatible in the DT documentation.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 .../bindings/sound/microchip,sama7g5-i2smcc.yaml      | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
index 651f61c7c25a..fb630a184350 100644
--- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
@@ -24,9 +24,14 @@ properties:
     const: 0
 
   compatible:
-    enum:
-      - microchip,sam9x60-i2smcc
-      - microchip,sama7g5-i2smcc
+    oneOf:
+      - enum:
+          - microchip,sam9x60-i2smcc
+          - microchip,sama7g5-i2smcc
+      - items:
+          - enum:
+              - microchip,sam9x7-i2smcc
+          - const: microchip,sam9x60-i2smcc
 
   reg:
     maxItems: 1
-- 
2.25.1

