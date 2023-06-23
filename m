Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 782C173DD87
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:31:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54592E7D;
	Mon, 26 Jun 2023 13:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54592E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779089;
	bh=blhyJaBG9pAvmN8wTYuGwuXwRrYHv3oqHCwBY9ZWXns=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HlEVMSBojTeekVmFcBOx/M9HqaLbiE6sn0DPbBuxl89BQvcdW7v/WRxr+gN+oni04
	 EYgVSjtDIvofV0rxVFN0fv9VwT7AWElybTLSTEc+Dy/BblFTQPeCYjf1GH6977GAAN
	 MkcUECEBshPmuyHM3F8J3ThnOimdpyqu9PTBJo44=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C643CF80609; Mon, 26 Jun 2023 13:27:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC686F80607;
	Mon, 26 Jun 2023 13:27:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDEB3F80141; Fri, 23 Jun 2023 22:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16F64F80130
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 22:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16F64F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=CtxBHw7l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687553258; x=1719089258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=blhyJaBG9pAvmN8wTYuGwuXwRrYHv3oqHCwBY9ZWXns=;
  b=CtxBHw7lMfMNe9i8iJeaNUG7klTSuz5OjhbT4NP6n1cpIGX7GYLlKyoK
   T+qfDYXchuHh8aRTF0D0vOqfG/TE+AbcGMQR/28QvxN+Xf2XDzOwRbGKu
   0xMBkJIDY/6hZWno7JwyNiEZMEgusnjdl9gbqogKh8zK9TtNM5qSWI+zY
   xEe2evrEUX0I7r/k9DYl1K0EFKz13zqCsj8+tydlQNvDF9d82/Na0gDjM
   DUPbkKPtbd45JQGQpqw5ZYIXyku4dwgsYiI9mmXv7bCmz2zVI37A9WR6m
   eTuAyZXf7nElAvq/Fk9fQtbkmigYcZZBRKWr/R9tMr3oHqA/tixxDHOJR
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200";
   d="scan'208";a="219552217"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Jun 2023 13:47:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:47:31 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:47:04 -0700
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
Subject: [PATCH v2 33/45] dt-bindings: usb: atmel: Update DT bindings
 documentation for sam9x7
Date: Sat, 24 Jun 2023 02:00:44 +0530
Message-ID: <20230623203056.689705-34-varshini.rajendran@microchip.com>
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
Message-ID-Hash: H7C4L6ZD2ATUV5BYBMOCC2UDBXILWLYL
X-Message-ID-Hash: H7C4L6ZD2ATUV5BYBMOCC2UDBXILWLYL
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:27:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7C4L6ZD2ATUV5BYBMOCC2UDBXILWLYL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sam9x7 bindings.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/usb/atmel-usb.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
index 12183ef47ee4..6359af0123bf 100644
--- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
+++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
@@ -3,8 +3,8 @@ Atmel SOC USB controllers
 OHCI
 
 Required properties:
- - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
-   used in host mode.
+ - compatible: Should be "atmel,at91rm9200-ohci" or "microchip,sam9x7-ohci"
+   for USB controllers used in host mode.
  - reg: Address and length of the register set for the device
  - interrupts: Should contain ohci interrupt
  - clocks: Should reference the peripheral, host and system clocks
@@ -30,8 +30,8 @@ usb0: ohci@500000 {
 EHCI
 
 Required properties:
- - compatible: Should be "atmel,at91sam9g45-ehci" for USB controllers
-   used in host mode.
+ - compatible: Should be "atmel,at91sam9g45-ehci" or "microchip,sam9x7-ehci"
+   for USB controllers used in host mode.
  - reg: Address and length of the register set for the device
  - interrupts: Should contain ehci interrupt
  - clocks: Should reference the peripheral and the UTMI clocks
@@ -87,6 +87,7 @@ Required properties:
 	       "atmel,at91sam9g45-udc"
 	       "atmel,sama5d3-udc"
 	       "microchip,sam9x60-udc"
+	       "microchip,sam9x7-udc"
 	       "microchip,lan9662-udc"
 	       For "microchip,lan9662-udc" the fallback "atmel,sama5d3-udc"
 	       is required.
-- 
2.25.1

