Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAA8506EF1
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 15:51:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35F61AF6;
	Tue, 19 Apr 2022 15:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35F61AF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650376262;
	bh=R5zRvKa0SoyT3N6cs+9ATf3vspiQLolbMLlEiLA/7fA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eb9HOQoThOUZLDNx5gIE1dlHziY2gSwb9TOVuODi5xMO3Vf/v3ZvwzZZmZpQp4Ob0
	 Y5JXAJXBwPd+hD9RlMm+S0QDz2zF01kRkmCYGEm9sukk0qB+xszH6v8QtJPki4LZoW
	 giMRwSrFvkXDscp78T5IC80uiBqailydGb1yo8Fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B421F805C8;
	Tue, 19 Apr 2022 15:43:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C27B0F8025D; Tue, 19 Apr 2022 15:41:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED09DF80269
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 15:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED09DF80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="h4qvsRlC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8302BB81986;
 Tue, 19 Apr 2022 13:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32FFC385A5;
 Tue, 19 Apr 2022 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650375623;
 bh=R5zRvKa0SoyT3N6cs+9ATf3vspiQLolbMLlEiLA/7fA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h4qvsRlCqc1+D/Un3T++kg9XOlylFj9tu57mNt8nm00hUNQ6OKBJwfaNIy8CUc5b/
 qlJ5Qll9E9CFFYZxtIhDJzmK+qDlqq4+ArAd2BBXudLqHYrCpKgbUoCnwsfLaR2pgk
 Q7EkW4bPFi3bk0l1eRnod+7F8TcxdVYbp1x3X1kd6GHmuGnsuLz3ITS24UVsnNzXdg
 x/K6BdB+SIi+C9NttQpeR53oMsrljIEQWrLP8CdiwfvAVwJt/CIv2ZT1IB0hwp9ZMU
 YhjJTR86Ah4hamcr5wDfPSVrUyclrlzsHDyDQ4lgL5SrWli+rzKao8UrzltowcxyNH
 vWiGzLOvfg/Eg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-omap@vger.kernel.org, tony@atomide.com, aaro.koskinen@iki.fi,
 jmkrzyszt@gmail.com
Subject: [PATCH 22/41] ARM: omap1: move plat/dma.c to mach/omap-dma.c
Date: Tue, 19 Apr 2022 15:37:04 +0200
Message-Id: <20220419133723.1394715-23-arnd@kernel.org>
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

Most of the interface functions in plat/dma.c are only used from the
USB driver, which is practically OMAP1 specific, except for compile
testing.

The omap_get_plat_info(), omap_request_dma() and omap_free_dma()
functions are never called on omap2 because of runtime checks.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/Makefile                        | 2 +-
 arch/arm/{plat-omap/dma.c => mach-omap1/omap-dma.c} | 0
 arch/arm/plat-omap/Makefile                         | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/arm/{plat-omap/dma.c => mach-omap1/omap-dma.c} (100%)

diff --git a/arch/arm/mach-omap1/Makefile b/arch/arm/mach-omap1/Makefile
index 450bbf552b57..0615cb0ba580 100644
--- a/arch/arm/mach-omap1/Makefile
+++ b/arch/arm/mach-omap1/Makefile
@@ -5,7 +5,7 @@
 
 # Common support
 obj-y := io.o id.o sram-init.o sram.o time.o irq.o mux.o flash.o \
-	 serial.o devices.o dma.o fb.o
+	 serial.o devices.o dma.o omap-dma.o fb.o
 obj-y += clock.o clock_data.o opp_data.o reset.o pm_bus.o timer.o
 
 ifneq ($(CONFIG_SND_SOC_OMAP_MCBSP),)
diff --git a/arch/arm/plat-omap/dma.c b/arch/arm/mach-omap1/omap-dma.c
similarity index 100%
rename from arch/arm/plat-omap/dma.c
rename to arch/arm/mach-omap1/omap-dma.c
diff --git a/arch/arm/plat-omap/Makefile b/arch/arm/plat-omap/Makefile
index 68ccec9de106..5d55295a14ee 100644
--- a/arch/arm/plat-omap/Makefile
+++ b/arch/arm/plat-omap/Makefile
@@ -6,4 +6,4 @@
 ccflags-$(CONFIG_ARCH_MULTIPLATFORM) := -I$(srctree)/arch/arm/plat-omap/include
 
 # Common support
-obj-y := sram.o dma.o
+obj-y := sram.o
-- 
2.29.2

