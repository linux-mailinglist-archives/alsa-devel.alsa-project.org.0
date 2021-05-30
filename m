Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 630CB3952E8
	for <lists+alsa-devel@lfdr.de>; Sun, 30 May 2021 22:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCE65828;
	Sun, 30 May 2021 22:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCE65828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622407844;
	bh=3A+YBdSpx1f5mp4JPvOk3nVJxBR5Jsm1Y29RxizWuXE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lFkk964qn2I6DXeoi8SX2bfDJSYHcCMEuFSMEH79k/IawCwcQ49IA2nRdF1tV+I6B
	 oXGXb4Psdup/IIbOooeZke8z96rCsGPAqVExajrQlV+DJKpWxX8JsMUCI6753VE3sQ
	 058lPNvBwZRgxTXqbyLT93jC7kkvvHTbd0jtR+gQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 535CAF8025B;
	Sun, 30 May 2021 22:49:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4571FF80254; Sun, 30 May 2021 22:49:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C57ACF80161
 for <alsa-devel@alsa-project.org>; Sun, 30 May 2021 22:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C57ACF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="4+YH8qHU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=5HHRa0zEZqqmLkORk3pUfwOKZE7CeQ0q3WK0b0EZ6LY=; b=4+YH8qHUQWojV8Qrjou/2kNj3H
 Ak+QtYK7uEKnesngzzN1/xdEh4c9hMoXhBeGddjsAzOBkYNdXqSiWRKFCDT878uDjwvlXayy/KmU5
 dY9TYiWYlwM7XtsOfcdW3e4add+vAg3IyAsOTpCCTG9TtmkN5ANk41Het45ZLT+u+HdF79JdgZbMo
 rXVlTnd85+x/NExEvu2cVGxdq/10huXhnRytQrf2c+A86p5U3dQGlVOZVKooqsC0U0D36IecBhig/
 Z+w4umpaPgBoNR5jBOb/eYVWHG9+D37w33MZSYq7U2cFjTu+Z1V/dX4Abe4sFYCB746OH2oLme9TI
 gMauu7PA==;
Received: from [2601:1c0:6280:3f0::ce7d] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnSMf-00A7Tt-6m; Sun, 30 May 2021 20:48:53 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: 
Subject: [PATCH] ASoC: atmel: ATMEL drivers depend on HAS_DMA
Date: Sun, 30 May 2021 13:48:51 -0700
Message-Id: <20210530204851.3372-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Bo Shen <voice.shen@atmel.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

On a config (such as arch/sh/) which does not set HAS_DMA when MMU
is not set, several ATMEL ASoC drivers select symbols that cause
kconfig warnings. There is one "depends on HAS_DMA" here but several
more are needed to prevent kconfig warnings since 'select' does not
recognize any dependencies.

Fix the following kconfig warnings:

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_ATMEL_SOC_SSC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m]
  - SND_ATMEL_SOC_SSC_PDC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_PDC
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_AT91_SOC_SAM9G20_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_ATMEL_SOC_SSC_DMA [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]

WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_DMA
  Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
  Selected by [m]:
  - SND_ATMEL_SOC_WM8904 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && I2C [=m]
  - SND_AT91_SOC_SAM9X5_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]

Fixes: 3951e4aae2ce ("ASoC: atmel-pcm: dma support based on pcm dmaengine")
Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
Fixes: 061981ff8cc8 ("ASoC: atmel: properly select dma driver state")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Bo Shen <voice.shen@atmel.com>
Cc: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 sound/soc/atmel/Kconfig |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-next-20210528.orig/sound/soc/atmel/Kconfig
+++ linux-next-20210528/sound/soc/atmel/Kconfig
@@ -19,12 +19,14 @@ config SND_ATMEL_SOC_DMA
 
 config SND_ATMEL_SOC_SSC
 	tristate
+	depends on HAS_DMA
 	select SND_ATMEL_SOC_DMA
 	select SND_ATMEL_SOC_PDC
 
 config SND_ATMEL_SOC_SSC_PDC
 	tristate "SoC PCM DAI support for AT91 SSC controller using PDC"
 	depends on ATMEL_SSC
+	depends on HAS_DMA
 	select SND_ATMEL_SOC_PDC
 	select SND_ATMEL_SOC_SSC
 	help
@@ -34,6 +36,7 @@ config SND_ATMEL_SOC_SSC_PDC
 config SND_ATMEL_SOC_SSC_DMA
 	tristate "SoC PCM DAI support for AT91 SSC controller using DMA"
 	depends on ATMEL_SSC
+	depends on HAS_DMA
 	select SND_ATMEL_SOC_DMA
 	select SND_ATMEL_SOC_SSC
 	help
@@ -44,6 +47,7 @@ config SND_AT91_SOC_SAM9G20_WM8731
 	tristate "SoC Audio support for WM8731-based At91sam9g20 evaluation board"
 	depends on ARCH_AT91 || COMPILE_TEST
 	depends on ATMEL_SSC && SND_SOC_I2C_AND_SPI
+	depends on HAS_DMA
 	select SND_ATMEL_SOC_SSC_PDC
 	select SND_SOC_WM8731
 	help
@@ -54,6 +58,7 @@ config SND_ATMEL_SOC_WM8904
 	tristate "Atmel ASoC driver for boards using WM8904 codec"
 	depends on ARCH_AT91 || COMPILE_TEST
 	depends on ATMEL_SSC && I2C
+	depends on HAS_DMA
 	select SND_ATMEL_SOC_SSC_DMA
 	select SND_SOC_WM8904
 	help
@@ -64,6 +69,7 @@ config SND_AT91_SOC_SAM9X5_WM8731
 	tristate "SoC Audio support for WM8731-based at91sam9x5 board"
 	depends on ARCH_AT91 || COMPILE_TEST
 	depends on ATMEL_SSC && SND_SOC_I2C_AND_SPI
+	depends on HAS_DMA
 	select SND_ATMEL_SOC_SSC_DMA
 	select SND_SOC_WM8731
 	help
