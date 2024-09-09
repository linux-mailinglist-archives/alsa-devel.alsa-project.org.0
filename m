Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3845977E3E
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5356ADFA;
	Fri, 13 Sep 2024 13:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5356ADFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726225940;
	bh=2lafLKjnorwqVWKIDeS2ovxiuaU21GohdSm/0wFNtvY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FKyW+kZ1dyBtJhtjqlsmB18AwZ8c0zYdShXNBo6ofQ3fUfHquOifYq1twluvpHoFC
	 jpu7r4uPCnQmSLUBHCtZ7POKVEuwlXnpZ0EgDptL6OYmnnYhQiyAoZFb3eebQSj0mF
	 TV0DuD84LEtKH0nksQO2i1io1sAvEE3WgfE+9hcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D68DF805B4; Fri, 13 Sep 2024 13:11:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4A56F805B0;
	Fri, 13 Sep 2024 13:11:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A90AF8026D; Mon,  9 Sep 2024 10:36:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23380F801F5
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 10:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23380F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=g3zuc04v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725870973; x=1757406973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2lafLKjnorwqVWKIDeS2ovxiuaU21GohdSm/0wFNtvY=;
  b=g3zuc04vMxF9Sn9OdkC27DwMJjcPyobJTWfeO4mXUil1bd6BxYvvJusr
   Col0ZVIVFQKVqhiZOIAcvX4Ns1W2i+/GetKYgd/Y9okZUd4Ua1YpqfCFa
   ZhVDarjDSJhUQ2YkeGdhV0mTdN8Qs1oxiLzRALGhbBdzAj4yBtMgR3HwH
   xKCWt5d4W2X0ghtENdw245nH+On8v5CDsnx7OdeAdb78Jc/MdmHm9DeqO
   Ti0KBkeVyL/TmieYZT+2X9knBbUwCTa/3jKuS18I/c/QVYpguTO4xo+Uk
   1THqkZkyVLUfuvAez4Bj1DiXb7wB+kDsq7TiTAkhxPxpjwj1XvuRw5oI0
   w==;
X-CSE-ConnectionGUID: 3+qBZ8ypT7qJuXQunlVkIA==
X-CSE-MsgGUID: wyzCDRFkRbylqCWlGPF3Ow==
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600";
   d="scan'208";a="198940351"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Sep 2024 01:36:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 01:35:48 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 9 Sep 2024 01:35:45 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<perex@perex.cz>, <tiwai@suse.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andrei Simion
	<andrei.simion@microchip.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: microchip,sama7g5-i2smcc: Add
 'sound-name-prefix' property
Date: Mon, 9 Sep 2024 11:35:30 +0300
Message-ID: <20240909083530.14695-3-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909083530.14695-1-andrei.simion@microchip.com>
References: <20240909083530.14695-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: prvs=97557f232=Andrei.Simion@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IIUC4MUAIHOLVTY5LJLPC22ZSSJ2EZAG
X-Message-ID-Hash: IIUC4MUAIHOLVTY5LJLPC22ZSSJ2EZAG
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:11:33 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IIUC4MUAIHOLVTY5LJLPC22ZSSJ2EZAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Add 'sound-name-prefix' property to differentiate between interfaces in
DPCM use-cases. Property is optional.

[andrei.simion@microchip.com: Adjust the commit title and message.
Reword the description for 'sound-name-prefix'.]

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
---
 .../bindings/sound/microchip,sama7g5-i2smcc.yaml           | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
index fb630a184350..ad34df67c7c0 100644
--- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
@@ -52,6 +52,13 @@ properties:
       - const: gclk
     minItems: 1
 
+  sound-name-prefix:
+    pattern: "^I2SMCC[0-9]$"
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Unique prefixes for the sink/source names of the component, ensuring
+      distinct identification among multiple instances.
+
   dmas:
     items:
       - description: TX DMA Channel
-- 
2.34.1

