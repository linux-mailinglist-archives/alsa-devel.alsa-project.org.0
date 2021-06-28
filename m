Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B083B6A08
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 23:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B5BB167D;
	Mon, 28 Jun 2021 23:12:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B5BB167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624914821;
	bh=AF5ZUhBIOXP4KA2fM4AqKJW6NWnPJsTC0m1vdrAyS5A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YxitAG9T9eu0W0JC6HewY2l3U4DerbjsVyf9tvUEm4K/0GvLzjl6XLGqAH/blySNG
	 TSxwXuTaO8/hF5cHWr95QT5BYCJrbvsRNdbSW6SKwZ7EBEO7RnYTZJJks3PqctxnIy
	 qeeiEprOiSZ1OhFyWnCfl9LFJWuhWwo+U54ypzJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33A22F80217;
	Mon, 28 Jun 2021 23:12:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCE93F80229; Mon, 28 Jun 2021 23:12:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22922F8012A
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 23:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22922F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="BGDYXRqi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=mTjSPzZG9+K/4jkT2IaNNnrtPpIfy0RNExLT/c4RwLY=; b=BGDYXRqiLf6JHU3uKfkeLeuhde
 E8il+lkcZ5dOf9R8Bnd9EpKjLgaUXp9shQbX01J1RySanAx6mAIsyBFz8X7MEsf6OuycLBxm5UTfd
 vk5nXPCgy2WRGo+j4MHRNE/z/uXYdHM/OFiuLJ6pzctxqcGoIIydEviXB3v9V83Jlu0rSJwnFGFdI
 nxgkMZNQu+a67F4IYUmKchMOGzA2v4zkt98msNBGJoeEEGhm5BgCluXy6yRAY5QYSluJxttuH4GMc
 XNxU2Fm9NTQPgXubne6fdfOsj5sqnNsknZvppKa/e8R4gwhLYjbipps2c5tSy4FL++VFnCcECE0HH
 jnFEenRw==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxyXu-009CEy-OV; Mon, 28 Jun 2021 21:11:58 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: atmel: ATMEL drivers depend on HAS_DMA
Date: Mon, 28 Jun 2021 14:11:58 -0700
Message-Id: <20210628211158.30273-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
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
Cc: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
v2: rebase & resend;
    drop Cc: to Bo Shen <voice.shen@atmel.com> # bounced

 sound/soc/atmel/Kconfig |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-next-20210628.orig/sound/soc/atmel/Kconfig
+++ linux-next-20210628/sound/soc/atmel/Kconfig
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
