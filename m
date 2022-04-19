Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C937506EEF
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:50:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B24251AE8;
	Tue, 19 Apr 2022 15:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B24251AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376230;
	bh=LP9bbU3MqE1mo0qlsHP17AGtQ9utDR1mCwd3GRyFRr4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=amEbU2UEtQ3SptdXChSYMCoaH2liG9fjHRxTx0Hs77PYKQositMQn1ikg1bN/Kej+
	 0KZihH0iVu6MMngD+YJhqKY2LerZHq9v0zeyQ218ZMqAkWBlio49P0d4W24tzpGn1O
	 i18/N0Tl+pVp1yVqHz923HiCyIRyZgCvebphHCbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 044DAF805C2;
	Tue, 19 Apr 2022 15:43:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5533DF8025D; Tue, 19 Apr 2022 15:40:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D6D3F80121
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:40:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D6D3F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M/YHCSpe"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 13737616C9;
 Tue, 19 Apr 2022 13:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F781C385AF;
 Tue, 19 Apr 2022 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375645;
 bh=LP9bbU3MqE1mo0qlsHP17AGtQ9utDR1mCwd3GRyFRr4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M/YHCSpeMYgwnnRYACPWzb5HEoTcv0Uo+NjAgUJua+1h56xSW2dsYBRjZfK1E2BdW
 ufGtCxWaK9OFsPZeVaEUcov5M3hta5Q+TJb3cdQu3RTCCHtk2DsusHYPyQF7LJHnTI
 IL8FxI+oDR/0/IzsSioLFjIlnMk2NFJMoFJ3B6APAiFOTW85BTHE0LXGnXdGVfGd13
 wCsvqkLvGaTKrsfN+TZgA0RrRTWoDmZBdsDJObGLaggZ6D5MCMY5yAp86WDvGn4KIc
 1iB23i3dMqJKuazzVP/9pqxdegdyW0H0DLYhyKg4JgYtwpC2ocseM+UbPIVSebgCgU
 9Edk9oMYpOBkA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 25/41] ARM: omap: remove empty plat-omap directory
Date: Tue, 19 Apr 2022 15:37:07 +0200
Message-Id: <20220419133723.1394715-26-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419133723.1394715-1-arnd@kernel.org>
References: <20220419133723.1394715-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 15:43:16 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-fbdev@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, Paul Walmsley <paul@pwsan.com>,
 Jingoo Han <jingoohan1@gmail.com>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The last file in this directory is gone, and it can be removed as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Makefile           | 1 -
 arch/arm/plat-omap/Makefile | 9 ---------
 2 files changed, 10 deletions(-)
 delete mode 100644 arch/arm/plat-omap/Makefile

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index a2391b8de5a5..7bcf59d0d315 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -228,7 +228,6 @@ machine-$(CONFIG_PLAT_SPEAR)		+= spear
 
 # Platform directory name.  This list is sorted alphanumerically
 # by CONFIG_* macro name.
-plat-$(CONFIG_ARCH_OMAP)	+= omap
 plat-$(CONFIG_PLAT_ORION)	+= orion
 plat-$(CONFIG_PLAT_PXA)		+= pxa
 plat-$(CONFIG_PLAT_VERSATILE)	+= versatile
diff --git a/arch/arm/plat-omap/Makefile b/arch/arm/plat-omap/Makefile
deleted file mode 100644
index fefce2e1eaf3..000000000000
--- a/arch/arm/plat-omap/Makefile
+++ /dev/null
@@ -1,9 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Makefile for the linux kernel.
-#
-
-ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/arch/arm/plat-omap/include
-
-# Common support
-obj-y :=
-- 
2.29.2

