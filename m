Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDA62EACEF
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 15:06:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8F3A16A2;
	Tue,  5 Jan 2021 15:05:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8F3A16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609855578;
	bh=oGVXCPcIho8pcupNDjiUNzoUmHfjBbCk9tN0qQ40qXg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pjMK/M9ZfoYYw429LV+c1WActPj8ui2WYa4Yml9/lYsphnwypXNMdy0RaNZTe/y1B
	 tgWfkr2Ryuc+eSGaAwOuWYO8rWBKAECOrOoz8Q0t4D1BmULwysn5S67rtHJaJH7zcP
	 KRDldIalDbg2+1TC+Ad01jfOHO79jhs8vKzj7nfc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2736F8027D;
	Tue,  5 Jan 2021 15:04:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4ED18F804C3; Tue,  5 Jan 2021 15:03:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2437F80258
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 15:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2437F80258
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7FB2ADD6;
 Tue,  5 Jan 2021 14:03:41 +0000 (UTC)
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
Subject: [PATCH 03/10] net: 8390: Drop support for TX49XX boards
Date: Tue,  5 Jan 2021 15:02:48 +0100
Message-Id: <20210105140305.141401-4-tsbogend@alpha.franken.de>
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

CPU support for TX49xx is getting removed, so remove support in network
drivers for it.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/net/ethernet/8390/Kconfig | 2 +-
 drivers/net/ethernet/8390/ne.c    | 7 +------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/8390/Kconfig b/drivers/net/ethernet/8390/Kconfig
index 9f4b302fd2ce..6aecc4c199d0 100644
--- a/drivers/net/ethernet/8390/Kconfig
+++ b/drivers/net/ethernet/8390/Kconfig
@@ -101,7 +101,7 @@ config MCF8390
 
 config NE2000
 	tristate "NE2000/NE1000 support"
-	depends on (ISA || (Q40 && m) || MACH_TX49XX || ATARI_ETHERNEC)
+	depends on (ISA || (Q40 && m) || ATARI_ETHERNEC)
 	select CRC32
 	help
 	  If you have a network (Ethernet) card of this type, say Y here.
diff --git a/drivers/net/ethernet/8390/ne.c b/drivers/net/ethernet/8390/ne.c
index e9756d0ea5b8..69110306badf 100644
--- a/drivers/net/ethernet/8390/ne.c
+++ b/drivers/net/ethernet/8390/ne.c
@@ -143,9 +143,6 @@ bad_clone_list[] __initdata = {
     {"E-LAN100", "E-LAN200", {0x00, 0x00, 0x5d}}, /* Broken ne1000 clones */
     {"PCM-4823", "PCM-4823", {0x00, 0xc0, 0x6c}}, /* Broken Advantech MoBo */
     {"REALTEK", "RTL8019", {0x00, 0x00, 0xe8}}, /* no-name with Realtek chip */
-#ifdef CONFIG_MACH_TX49XX
-    {"RBHMA4X00-RTL8019", "RBHMA4X00-RTL8019", {0x00, 0x60, 0x0a}},  /* Toshiba built-in */
-#endif
     {"LCS-8834", "LCS-8836", {0x04, 0x04, 0x37}}, /* ShinyNet (SET) */
     {NULL,}
 };
@@ -164,9 +161,7 @@ bad_clone_list[] __initdata = {
 #define NESM_START_PG	0x40	/* First page of TX buffer */
 #define NESM_STOP_PG	0x80	/* Last page +1 of RX ring */
 
-#if defined(CONFIG_MACH_TX49XX)
-#  define DCR_VAL 0x48		/* 8-bit mode */
-#elif defined(CONFIG_ATARI)	/* 8-bit mode on Atari, normal on Q40 */
+#if defined(CONFIG_ATARI)	/* 8-bit mode on Atari, normal on Q40 */
 #  define DCR_VAL (MACH_IS_ATARI ? 0x48 : 0x49)
 #else
 #  define DCR_VAL 0x49
-- 
2.29.2

