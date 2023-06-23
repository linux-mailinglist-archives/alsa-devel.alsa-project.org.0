Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D59C73DD7F
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:30:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5484093A;
	Mon, 26 Jun 2023 13:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5484093A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779003;
	bh=LDWBjvnTTsLcekUwxDRyJLu3Qkm1EGGjQgrSvTcjXhI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=owIaKlEkUEX0ci4Cv1avBT6oWOWP0ttaNNqvhGq0NVR4UUF6eRj6hni77pwNMvltw
	 htQQrzAQGbitoWcfAQ6Ia3KJyq7l0O6V4niALEPLp4BG/mjun0zY9D0A9XAuLT44jO
	 IM7+Dg74/xsL+9gNIaz6dhvYAQyWrQXoyjePt5o8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DF34F805D9; Mon, 26 Jun 2023 13:27:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B1A8F805C8;
	Mon, 26 Jun 2023 13:27:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 391CAF80141; Fri, 23 Jun 2023 22:44:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A2FF5F8003A
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 22:44:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2FF5F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=oG89r2d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687553065; x=1719089065;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LDWBjvnTTsLcekUwxDRyJLu3Qkm1EGGjQgrSvTcjXhI=;
  b=oG89r2d6QOLtaGU0J6fGcLuLRRBe+t1kHmDUTEX/U11uNWJpmRj6/8HY
   BYJsL6dYS1tlhgbm6NrEpGKHJqGmK9eqNGE10cQfxFQ8wHEhDzziuw/C1
   GshiJN1VlyO3RNq9pkwfsiSrSiGTASfP4j7LkLl00PeuKttl9vDhpmcxf
   /cPaEvwTS+P/dgZWXpvVCV5Bvy0SUgTSxuSYwpfOTm18R4Qk4SWiRsC4l
   U+Gfxx5/gXa7nnIxftHskYMI1EglNHpWkEOlflEHKcgdOlLjvj4lWL3AE
   438S1WIhJ2+kHjwS/VwCEO5PnKjhxV2Z/olczNwy5116ww8bAuZosAK/K
   A==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200";
   d="scan'208";a="217419517"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Jun 2023 13:44:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:44:07 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:43:38 -0700
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
Subject: [PATCH v2 26/45] dt-bindings: pinctrl: at91: add bindings for SAM9X7
Date: Sat, 24 Jun 2023 02:00:37 +0530
Message-ID: <20230623203056.689705-27-varshini.rajendran@microchip.com>
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
Message-ID-Hash: MGDB5ENK5NUAPVBIBLA64ROQPT3PBT5O
X-Message-ID-Hash: MGDB5ENK5NUAPVBIBLA64ROQPT3PBT5O
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:26:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGDB5ENK5NUAPVBIBLA64ROQPT3PBT5O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add device tree binding for SAM9X7 pin controller.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 .../devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
index e8abbdad7b5d..5a3be10dcbfb 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
@@ -20,6 +20,7 @@ such as pull-up, multi drive, etc.
 Required properties for iomux controller:
 - compatible: "atmel,at91rm9200-pinctrl" or "atmel,at91sam9x5-pinctrl"
 		or "atmel,sama5d3-pinctrl" or "microchip,sam9x60-pinctrl"
+		or "microchip,sam9x7-pinctrl"
 - atmel,mux-mask: array of mask (periph per bank) to describe if a pin can be
   configured in this periph mode. All the periph and bank need to be describe.
 
@@ -119,7 +120,7 @@ Some requirements for using atmel,at91rm9200-pinctrl binding:
 
 For each bank the required properties are:
 - compatible: "atmel,at91sam9x5-gpio" or "atmel,at91rm9200-gpio" or
-  "microchip,sam9x60-gpio"
+  "microchip,sam9x60-gpio" or "microchip,sam9x7-gpio"
 - reg: physical base address and length of the controller's registers
 - interrupts: interrupt outputs from the controller
 - interrupt-controller: marks the device node as an interrupt controller
-- 
2.25.1

