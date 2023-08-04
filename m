Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D305F76FDC4
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 11:48:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 358BD846;
	Fri,  4 Aug 2023 11:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 358BD846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691142480;
	bh=a8y8XwCgHW6WQej0DHKSTyEVeQg/bb8FoblppmZFTyQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VvoQQ5HlSrfgBCdR2TJQ6679/5Xb4ECpxz3tvx3d0diDDkEDYc/wivY5r0CGCph2V
	 2HoOfE2QBJvfFvo6YqPEn9OgDPLZ0wnb1/RMQ2hhPCGYQETssntUzawpHAjXoQfVn9
	 w/d58asLVia0921Ax9KoZz2in/AjskmQxWoNCqIw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7722DF805AB; Fri,  4 Aug 2023 11:44:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E549F805AB;
	Fri,  4 Aug 2023 11:44:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5B6AF8025A; Fri,  4 Aug 2023 07:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_FMBLA_NEWDOM28,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE985F8016D
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 07:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE985F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=KnSGNk6Z
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99c4923195dso225813066b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 03 Aug 2023 22:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1691125219; x=1691730019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IX2gVzlYc0IbH9Z7O7YhUyubEeByOYaVbMRDVDTozoA=;
        b=KnSGNk6Z82yrDmK03jM+I9bXhjU13Pk9eDIzJDCs/BYwlVxGdZc+Rwm7Sdb9+6mtg7
         SMGGFUfGkD/ErYSUGSRIlRW+k9eyJGFvRBadQsI08T5TuzUhdmCkp8pLs4AE0T9qG557
         JzuuDOWdmK9LIGsSLDQhFe0B9OlZ/oefx2a4kMPKyHNsEovwjJoVAPN667dygI2ol8xp
         ZLnXFV7N16b4o0+p1cv+tiV8Z2m94grJLvPlyxwC4+2T8rNAXlNyAbnyMAUzArqTVCeH
         dRBQcIOj5jAhJ56o3GkCVFRDpBM67zYrQMRiAWleEHR7x/dWNTPLHP5IB2xMbPGHKsyq
         HofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691125219; x=1691730019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IX2gVzlYc0IbH9Z7O7YhUyubEeByOYaVbMRDVDTozoA=;
        b=aH8ZL2Fczp5BnGFb0Qg27U1ZuiJZuTmebKF5xD/81DNsbf/7JKgZmY2p7jAvO3jceq
         KV05F7wmzQjgT7xI9xH3JR2GpNGjMWJsM5H7eTPgb0J1LMKbBzPsjwDPPZ6JGTYmlyYJ
         EXxWTGHTq0Nt7PPJ5ZRHS8/arbkgRd3mJ1ia23Zj5WQhHdT4XRCpiBpwrKMrQeThlNaq
         GN0VCBF+IjUblOM/ldLU4gFEK9h3vnKWrUGnNS5uVPoyqsVRlRFDGRQnhcESN7c+Tede
         CBY7SzZyrJo239Z0GLCmRIPGD8Pi3ofzPqIsNiQA+Pd64G27Q/IQlvW8HnYsVu4M+Out
         2EqA==
X-Gm-Message-State: AOJu0YwWh15+rfzhcSfefnJ6rKbKNswmz3zt8n7wHaqc6qGTfE7Nz7so
	X44y95HNiOs40Iz4ovRoMBeWZA==
X-Google-Smtp-Source: 
 AGHT+IFCUZU9a4TKGl8P9srlXXK67nKOj0/XpD0wzNap0FS0y6wrAkbSOoO8HEMn1dV4NkwEfAHfpQ==
X-Received: by 2002:a17:906:290:b0:99b:c7dc:b02 with SMTP id
 16-20020a170906029000b0099bc7dc0b02mr609013ejf.57.1691125218978;
        Thu, 03 Aug 2023 22:00:18 -0700 (PDT)
Received: from localhost.localdomain ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id
 x14-20020a1709064bce00b0098f33157e7dsm739999ejv.82.2023.08.03.22.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 22:00:18 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: nicolas.ferre@microchip.com,
	conor.dooley@microchip.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	maz@kernel.org,
	srinivas.kandagatla@linaro.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	sre@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH] MAINTAINERS: update Claudiu Beznea's email address
Date: Fri,  4 Aug 2023 08:00:07 +0300
Message-Id: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TMY3RMSOKOGAHBQQ67FVUCCIWBP2CKUK
X-Message-ID-Hash: TMY3RMSOKOGAHBQQ67FVUCCIWBP2CKUK
X-Mailman-Approved-At: Fri, 04 Aug 2023 09:44:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TMY3RMSOKOGAHBQQ67FVUCCIWBP2CKUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update MAINTAINERS entries with a valid email address as the Microchip
one is no longer valid.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---

Changes in v2:
- collected tags
- extended the recipients list to include individual subsystem
  maintainers and lists instead using only linux-kernel@vger.kernel.org
  as suggested initially by get_maintainers.pl

 MAINTAINERS | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 128fd295f86f..d48d8e857f57 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2351,7 +2351,7 @@ F:	drivers/phy/mediatek/
 ARM/MICROCHIP (ARM64) SoC support
 M:	Conor Dooley <conor@kernel.org>
 M:	Nicolas Ferre <nicolas.ferre@microchip.com>
-M:	Claudiu Beznea <claudiu.beznea@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git
@@ -2360,7 +2360,7 @@ F:	arch/arm64/boot/dts/microchip/
 ARM/Microchip (AT91) SoC support
 M:	Nicolas Ferre <nicolas.ferre@microchip.com>
 M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
-M:	Claudiu Beznea <claudiu.beznea@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 W:	http://www.linux4sam.org
@@ -3265,7 +3265,7 @@ F:	include/uapi/linux/atm*
 
 ATMEL MACB ETHERNET DRIVER
 M:	Nicolas Ferre <nicolas.ferre@microchip.com>
-M:	Claudiu Beznea <claudiu.beznea@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 S:	Supported
 F:	drivers/net/ethernet/cadence/
 
@@ -13880,7 +13880,7 @@ F:	Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
 F:	drivers/spi/spi-at91-usart.c
 
 MICROCHIP AUDIO ASOC DRIVERS
-M:	Claudiu Beznea <claudiu.beznea@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/sound/atmel*
@@ -13903,7 +13903,7 @@ S:	Maintained
 F:	drivers/crypto/atmel-ecc.*
 
 MICROCHIP EIC DRIVER
-M:	Claudiu Beznea <claudiu.beznea@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/microchip,sama7g5-eic.yaml
@@ -13976,7 +13976,7 @@ F:	drivers/video/fbdev/atmel_lcdfb.c
 F:	include/video/atmel_lcdc.h
 
 MICROCHIP MCP16502 PMIC DRIVER
-M:	Claudiu Beznea <claudiu.beznea@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/regulator/mcp16502-regulator.txt
@@ -14003,7 +14003,7 @@ F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
 F:	drivers/mtd/nand/raw/atmel/*
 
 MICROCHIP OTPC DRIVER
-M:	Claudiu Beznea <claudiu.beznea@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -14042,7 +14042,7 @@ F:	Documentation/devicetree/bindings/fpga/microchip,mpf-spi-fpga-mgr.yaml
 F:	drivers/fpga/microchip-spi.c
 
 MICROCHIP PWM DRIVER
-M:	Claudiu Beznea <claudiu.beznea@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-pwm@vger.kernel.org
 S:	Supported
@@ -14058,7 +14058,7 @@ F:	drivers/iio/adc/at91-sama5d2_adc.c
 F:	include/dt-bindings/iio/adc/at91-sama5d2_adc.h
 
 MICROCHIP SAMA5D2-COMPATIBLE SHUTDOWN CONTROLLER
-M:	Claudiu Beznea <claudiu.beznea@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 S:	Supported
 F:	Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
 F:	drivers/power/reset/at91-sama5d2_shdwc.c
@@ -14075,7 +14075,7 @@ S:	Supported
 F:	drivers/spi/spi-atmel.*
 
 MICROCHIP SSC DRIVER
-M:	Claudiu Beznea <claudiu.beznea@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/misc/atmel-ssc.txt
@@ -14104,7 +14104,7 @@ F:	drivers/usb/gadget/udc/atmel_usba_udc.*
 
 MICROCHIP WILC1000 WIFI DRIVER
 M:	Ajay Singh <ajay.kathat@microchip.com>
-M:	Claudiu Beznea <claudiu.beznea@microchip.com>
+M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
 L:	linux-wireless@vger.kernel.org
 S:	Supported
 F:	drivers/net/wireless/microchip/wilc1000/
-- 
2.39.2

