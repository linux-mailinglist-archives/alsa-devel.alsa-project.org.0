Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB542EACF3
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 15:07:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 545C316C0;
	Tue,  5 Jan 2021 15:06:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 545C316C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609855637;
	bh=r0Qilr1fO1c8B9zTPsP0Rbn5elkJYvEGa4TGOsJvrTY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LM8ghL19dfS2oh/x8ec24F2qq41nN6rbbp9TG4GVnOQ0d+J2BodHhpo1A0A0MtlnM
	 FG1kJVlEXOEJjXRgqn1pbpwVjpUsgHzEYGIUB0HE915SioPDCfwBDapLS0PiCowaNa
	 4M4z4Wpq9rtpWuMfWmd4CdF1eU8cEWwfGp7l5Yv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A0AF804E2;
	Tue,  5 Jan 2021 15:04:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEB83F804CC; Tue,  5 Jan 2021 15:03:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68430F80268
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 15:03:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68430F80268
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B248AEBB;
 Tue,  5 Jan 2021 14:03:43 +0000 (UTC)
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jakub Kicinski <kuba@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH 05/10] dma: tx49 removal
Date: Tue,  5 Jan 2021 15:02:50 +0100
Message-Id: <20210105140305.141401-6-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210105140305.141401-1-tsbogend@alpha.franken.de>
References: <20210105140305.141401-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/dma/Kconfig    |  2 +-
 drivers/dma/txx9dmac.h | 10 ----------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index d242c7632621..22fedfb6f5f9 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -601,7 +601,7 @@ config S3C24XX_DMAC
 
 config TXX9_DMAC
 	tristate "Toshiba TXx9 SoC DMA support"
-	depends on MACH_TX49XX || MACH_TX39XX
+	depends on MACH_TX39XX
 	select DMA_ENGINE
 	help
 	  Support the TXx9 SoC internal DMA controller.  This can be
diff --git a/drivers/dma/txx9dmac.h b/drivers/dma/txx9dmac.h
index aa53eafb1519..4acf29f50a29 100644
--- a/drivers/dma/txx9dmac.h
+++ b/drivers/dma/txx9dmac.h
@@ -26,11 +26,6 @@
  * DMA channel.
  */
 
-#ifdef CONFIG_MACH_TX49XX
-static inline bool txx9_dma_have_SMPCHN(void)
-{
-	return true;
-}
 #define TXX9_DMA_USE_SIMPLE_CHAIN
 #else
 static inline bool txx9_dma_have_SMPCHN(void)
@@ -40,13 +35,8 @@ static inline bool txx9_dma_have_SMPCHN(void)
 #endif
 
 #ifdef __LITTLE_ENDIAN
-#ifdef CONFIG_MACH_TX49XX
-#define CCR_LE	TXX9_DMA_CCR_LE
-#define MCR_LE	0
-#else
 #define CCR_LE	0
 #define MCR_LE	TXX9_DMA_MCR_LE
-#endif
 #else
 #define CCR_LE	0
 #define MCR_LE	0
-- 
2.29.2

