Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A42273DD5C
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:23:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1C4384D;
	Mon, 26 Jun 2023 13:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1C4384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687778600;
	bh=gvnR65uyKMk5CUoToEoiuPKzluNwCII060FV6LYqd6M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cqoK/So4GudkSvlpF0/J0/+8Dc2G0RYdOkZ6BXfRy69j9fq9Z+B4apU/f4qZoxQjQ
	 a8D2tXAphrBA/0KwGb1K/OQg1v8Zw3+PfsjrUj77MNSBuM35RLKe4kmwiZj2+E/l2D
	 cxoSL6gC0EbUqp2HUGUb7zQXFaZJTv/U85uawXUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9BADF805EB; Mon, 26 Jun 2023 13:20:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2996FF805E9;
	Mon, 26 Jun 2023 13:20:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FB15F80141; Fri, 23 Jun 2023 22:37:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16B47F8003A
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 22:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B47F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=w+Llz4s6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687552673; x=1719088673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gvnR65uyKMk5CUoToEoiuPKzluNwCII060FV6LYqd6M=;
  b=w+Llz4s6x17IzkS3/39iEQWJsWDqO8b6IeSGqKhgEgJMGeOpAGIhpuNt
   r5UHXnh3F2wYt3BcMPVGEci7xfy3r+NihHAXElwoWjC8DOZPRwylxcti4
   alDDxJSImEkCqM3ZMD0op66ulqC+4YN2BwBq556M3ZizbThtL+J/r0xKw
   KlTpAT1I7DjbVYngZJwpfk5zi2GaDWF3A3YqA9JqPoKlntemPkQXW81sJ
   jhBFkGP8TzbyhWcHEPwuqGyuyJFkkXLtkLfc/Yg6ZrQF0vev2KmsV52mH
   e1KhbkEJuuP6prLCTLME8x/JIruTZErz3Sh3H2RWuyjTxBB0uenf1KwZ8
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200";
   d="scan'208";a="158362329"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Jun 2023 13:37:49 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:37:48 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:37:21 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <vkoul@kernel.org>, <tglx@linutronix.de>,
	<maz@kernel.org>, <lee@kernel.org>, <ulf.hansson@linaro.org>,
	<tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<olivia@selenic.com>, <a.zummo@towertech.it>, <radu_nicolae.pirea@upb.ro>,
	<richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>, <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<linux@armlinux.org.uk>, <sre@kernel.org>, <jerry.ray@microchip.com>,
	<horatiu.vultur@microchip.com>, <durai.manickamkr@microchip.com>,
	<varshini.rajendran@microchip.com>, <andrew@lunn.ch>,
	<alain.volmat@foss.st.com>, <neil.armstrong@linaro.org>,
	<mihai.sain@microchip.com>, <eugen.hristev@collabora.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <manikandan.m@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>
Subject: [PATCH v2 13/45] dt-bindings: atmel-sysreg: add bindings for sam9x7
Date: Sat, 24 Jun 2023 02:00:24 +0530
Message-ID: <20230623203056.689705-14-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: Varshini.Rajendran@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7B26DMJD72QZ26WDHCQ5IG7MTGVA35FJ
X-Message-ID-Hash: 7B26DMJD72QZ26WDHCQ5IG7MTGVA35FJ
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:20:29 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7B26DMJD72QZ26WDHCQ5IG7MTGVA35FJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add RAM controller, shutdown controller & SFR DT bindings.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/arm/atmel-sysregs.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
index ab1b352344ae..1e7349987d77 100644
--- a/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
+++ b/Documentation/devicetree/bindings/arm/atmel-sysregs.txt
@@ -11,7 +11,7 @@ PIT Timer required properties:
   shared across all System Controller members.
 
 PIT64B Timer required properties:
-- compatible: Should be "microchip,sam9x60-pit64b"
+- compatible: Should be "microchip,sam9x60-pit64b" or "microchip,sam9x7-pit64b"
 - reg: Should contain registers location and length
 - interrupts: Should contain interrupt for PIT64B timer
 - clocks: Should contain the available clock sources for PIT64B timer.
@@ -31,6 +31,7 @@ RAMC SDRAM/DDR Controller required properties:
 			"atmel,at91sam9g45-ddramc",
 			"atmel,sama5d3-ddramc",
 			"microchip,sam9x60-ddramc",
+			"microchip,sam9x7-ddramc",
 			"microchip,sama7g5-uddrc"
 - reg: Should contain registers location and length
 
@@ -89,7 +90,7 @@ SHDWC SAMA5D2-Compatible Shutdown Controller
 
 required properties:
 - compatible: should be "atmel,sama5d2-shdwc", "microchip,sam9x60-shdwc" or
-  "microchip,sama7g5-shdwc"
+  "microchip,sama7g5-shdwc" or "microchip,sam9x7-shdwc"
 - reg: should contain registers location and length
 - clocks: phandle to input clock.
 - #address-cells: should be one. The cell is the wake-up input index.
@@ -156,7 +157,7 @@ required properties:
 - compatible: Should be "atmel,<chip>-sfr", "syscon" or
 	"atmel,<chip>-sfrbu", "syscon"
   <chip> can be "sama5d3", "sama5d4" or "sama5d2".
-  It also can be "microchip,sam9x60-sfr", "syscon".
+  It also can be "microchip,sam9x60-sfr" or "microchip,sam9x7-sfr", "syscon".
 - reg: Should contain registers location and length
 
 	sfr@f0038000 {
-- 
2.25.1

