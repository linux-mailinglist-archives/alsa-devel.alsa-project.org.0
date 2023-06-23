Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9E373DD5A
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:22:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29C679F6;
	Mon, 26 Jun 2023 13:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29C679F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687778575;
	bh=pO0SddiNRb5mLg5JiH+I1hubEytCoBnQJ1wPhnv+mrQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q5JiXHPaP8INZzukimdx7iHjhYc7f38oS5dnG2m2JWoLQlUw6se0ajiHwooOw6+4d
	 IRanMUIMzl0k3f1xJSO05By81LfcvDaCGj4xIaWKm0f22I4Avq8iTezbUS/3IS8/iB
	 mSkDm3fHevjdl1e+yP8hmswxqHfeKrr/vGD2D6tY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCAEAF805A8; Mon, 26 Jun 2023 13:20:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F30A0F8055B;
	Mon, 26 Jun 2023 13:20:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2112FF80141; Fri, 23 Jun 2023 22:37:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 496C9F8003A
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 22:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 496C9F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=FWt6hzHN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687552642; x=1719088642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pO0SddiNRb5mLg5JiH+I1hubEytCoBnQJ1wPhnv+mrQ=;
  b=FWt6hzHNmYzeJEkwNVsO4JD1cyhypvmPV2goh9fydfmiSg9R0Jx+SEW3
   2+YadrH86smHPMXprGrVNcuPR/Qys3us5kN9DYtrzfOMg5p1541pTMayt
   JjaPxepRguPe7roOny6OL8Q+U7f2v4Jgyd7VvzBZB/yuTgeuRl5veDPKo
   v42ZlN20dVz++athGJhl7gXXX4dnPlZv1AzOkicjJmJB8NCqnR6ZriWs+
   1PS91xeLAD5xrf62UvG1LQIIEHQbL4wCtId25vVb12a+c/uqwhke2cOD2
   r+Ys89ov1DEoJ93Fgb5HgH4Fatu+yGA4xs6TUQqh1X3deSkhxDh/s1V59
   g==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200";
   d="scan'208";a="221702264"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Jun 2023 13:37:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:36:51 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:36:21 -0700
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
Subject: [PATCH v2 11/45] dt-bindings: clk: at91: add bindings for SAM9X7's
 clock controller
Date: Sat, 24 Jun 2023 02:00:22 +0530
Message-ID: <20230623203056.689705-12-varshini.rajendran@microchip.com>
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
Message-ID-Hash: UTFAJ7DPSJOG55KX7EPVVUEYXX3KUSVR
X-Message-ID-Hash: UTFAJ7DPSJOG55KX7EPVVUEYXX3KUSVR
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:20:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UTFAJ7DPSJOG55KX7EPVVUEYXX3KUSVR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add bindings for SAM9X7's slow clock controller and pmc.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 Documentation/devicetree/bindings/clock/at91-clock.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/at91-clock.txt b/Documentation/devicetree/bindings/clock/at91-clock.txt
index 13f45db3b66d..446937fab950 100644
--- a/Documentation/devicetree/bindings/clock/at91-clock.txt
+++ b/Documentation/devicetree/bindings/clock/at91-clock.txt
@@ -10,8 +10,9 @@ Required properties:
 - compatible : shall be one of the following:
 	"atmel,at91sam9x5-sckc",
 	"atmel,sama5d3-sckc",
-	"atmel,sama5d4-sckc" or
-	"microchip,sam9x60-sckc":
+	"atmel,sama5d4-sckc",
+	"microchip,sam9x60-sckc" or
+	"microchip,sam9x7-sckc":
 		at91 SCKC (Slow Clock Controller)
 - #clock-cells : shall be 1 for "microchip,sam9x60-sckc" otherwise shall be 0.
 - clocks : shall be the input parent clock phandle for the clock.
@@ -32,7 +33,7 @@ Power Management Controller (PMC):
 
 Required properties:
 - compatible : shall be "atmel,<chip>-pmc", "syscon" or
-	"microchip,sam9x60-pmc"
+	"microchip,sam9x60-pmc" or "microchip,sam9x7-pmc"
 	<chip> can be: at91rm9200, at91sam9260, at91sam9261,
 	at91sam9263, at91sam9g45, at91sam9n12, at91sam9rl, at91sam9g15,
 	at91sam9g25, at91sam9g35, at91sam9x25, at91sam9x35, at91sam9x5,
-- 
2.25.1

