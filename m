Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6760A1573CC
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 13:02:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF7171677;
	Mon, 10 Feb 2020 13:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF7171677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581336142;
	bh=fe4XfTFmiW0wZLtUjpIKhXA3roFrkisa331KgYUwMw4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=R8xZCqqfo8320a2GRif2Ob4GdSHOkp6ffpH6GjdSN2886IN0NAHOaoLBtwhbucBtq
	 5h/BsHoH7uael+8B+fJKj5hAZpeex/32H4eghhrZL+lvv5T75g7Y4KOFVTlqLiELer
	 +7HIIEsGGzd5OHsMXGPRkA0JjzE1mwsUlSvDaTqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D15AEF80158;
	Mon, 10 Feb 2020 13:00:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60627F80157; Mon, 10 Feb 2020 13:00:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 99B51F80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 13:00:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99B51F80118
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE92F1FB;
 Mon, 10 Feb 2020 04:00:33 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 315A73F6CF;
 Mon, 10 Feb 2020 04:00:33 -0800 (PST)
Date: Mon, 10 Feb 2020 12:00:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20200130130545.31148-1-codrin.ciubotariu@microchip.com>
Message-Id: <applied-20200130130545.31148-1-codrin.ciubotariu@microchip.com>
X-Patchwork-Hint: ignore
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 ludovic.desroches@microchip.com, Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, mirq-linux@rere.qmqm.pl,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: atmel: fix atmel_ssc_set_audio link
	failure" to the asoc tree
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3156664215913131712=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============3156664215913131712==
Content-Type: text/plain

The patch

   ASoC: atmel: fix atmel_ssc_set_audio link failure

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9437bfda00f3b26eb5f475737ddaaf4dc07fee4f Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Jan 2020 15:05:45 +0200
Subject: [PATCH] ASoC: atmel: fix atmel_ssc_set_audio link failure
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ssc audio driver can call into both pdc and dma backends.  With the
latest rework, the logic to do this in a safe way avoiding link errors
was removed, bringing back link errors that were fixed long ago in commit
061981ff8cc8 ("ASoC: atmel: properly select dma driver state") such as

sound/soc/atmel/atmel_ssc_dai.o: In function `atmel_ssc_set_audio':
atmel_ssc_dai.c:(.text+0xac): undefined reference to `atmel_pcm_pdc_platform_register'

Fix it this time using Makefile hacks and a comment to prevent this
from accidentally getting removed again rather than Kconfig hacks.

Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Link: https://lore.kernel.org/r/20200130130545.31148-1-codrin.ciubotariu@microchip.com
Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/Kconfig  |  4 ++--
 sound/soc/atmel/Makefile | 10 ++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index d1dc8e6366dc..71f2d42188c4 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -10,11 +10,11 @@ config SND_ATMEL_SOC
 if SND_ATMEL_SOC
 
 config SND_ATMEL_SOC_PDC
-	tristate
+	bool
 	depends on HAS_DMA
 
 config SND_ATMEL_SOC_DMA
-	tristate
+	bool
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 
 config SND_ATMEL_SOC_SSC
diff --git a/sound/soc/atmel/Makefile b/sound/soc/atmel/Makefile
index 1f6890ed3738..c7d2989791be 100644
--- a/sound/soc/atmel/Makefile
+++ b/sound/soc/atmel/Makefile
@@ -6,8 +6,14 @@ snd-soc-atmel_ssc_dai-objs := atmel_ssc_dai.o
 snd-soc-atmel-i2s-objs := atmel-i2s.o
 snd-soc-mchp-i2s-mcc-objs := mchp-i2s-mcc.o
 
-obj-$(CONFIG_SND_ATMEL_SOC_PDC) += snd-soc-atmel-pcm-pdc.o
-obj-$(CONFIG_SND_ATMEL_SOC_DMA) += snd-soc-atmel-pcm-dma.o
+# pdc and dma need to both be built-in if any user of
+# ssc is built-in.
+ifdef CONFIG_SND_ATMEL_SOC_PDC
+obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel-pcm-pdc.o
+endif
+ifdef CONFIG_SND_ATMEL_SOC_DMA
+obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel-pcm-dma.o
+endif
 obj-$(CONFIG_SND_ATMEL_SOC_SSC) += snd-soc-atmel_ssc_dai.o
 obj-$(CONFIG_SND_ATMEL_SOC_I2S) += snd-soc-atmel-i2s.o
 obj-$(CONFIG_SND_MCHP_SOC_I2S_MCC) += snd-soc-mchp-i2s-mcc.o
-- 
2.20.1


--===============3156664215913131712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3156664215913131712==--
