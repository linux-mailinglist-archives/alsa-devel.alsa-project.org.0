Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D9F2EACDC
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 15:05:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DBAD16AC;
	Tue,  5 Jan 2021 15:04:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DBAD16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609855542;
	bh=ekQTOyDg8nBybU86OrMjPAMvRQajc0nWBEhgt2xLLRA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ff/LRNlLOQ5+LDcghYKopatoSmV5UM0Thb/EzirkmZMXcZt5X1cNG6GUrXAGTLo/T
	 7mZYKyTUeP+GvPyFp+Kk4TJn9TEWam3uK1c/AS6H1aDLbXAA9t0Eu8qEUZJSiGcfg+
	 ciwpgHITZOuvcXbr5rc8rNHqNtMsnTT/W83nccag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C737FF804D2;
	Tue,  5 Jan 2021 15:03:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84DB1F804C3; Tue,  5 Jan 2021 15:03:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9570BF8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 15:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9570BF8015B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34C54AD57;
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
Subject: [PATCH 02/10] net: tc35815: Drop support for TX49XX boards
Date: Tue,  5 Jan 2021 15:02:47 +0100
Message-Id: <20210105140305.141401-3-tsbogend@alpha.franken.de>
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
 drivers/net/ethernet/toshiba/tc35815.c | 29 --------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
index 7a6e5ff8e5d4..d4712cd2e28c 100644
--- a/drivers/net/ethernet/toshiba/tc35815.c
+++ b/drivers/net/ethernet/toshiba/tc35815.c
@@ -687,39 +687,10 @@ static int tc_mii_init(struct net_device *dev)
 	return err;
 }
 
-#ifdef CONFIG_CPU_TX49XX
-/*
- * Find a platform_device providing a MAC address.  The platform code
- * should provide a "tc35815-mac" device with a MAC address in its
- * platform_data.
- */
-static int tc35815_mac_match(struct device *dev, const void *data)
-{
-	struct platform_device *plat_dev = to_platform_device(dev);
-	const struct pci_dev *pci_dev = data;
-	unsigned int id = pci_dev->irq;
-	return !strcmp(plat_dev->name, "tc35815-mac") && plat_dev->id == id;
-}
-
 static int tc35815_read_plat_dev_addr(struct net_device *dev)
 {
-	struct tc35815_local *lp = netdev_priv(dev);
-	struct device *pd = bus_find_device(&platform_bus_type, NULL,
-					    lp->pci_dev, tc35815_mac_match);
-	if (pd) {
-		if (pd->platform_data)
-			memcpy(dev->dev_addr, pd->platform_data, ETH_ALEN);
-		put_device(pd);
-		return is_valid_ether_addr(dev->dev_addr) ? 0 : -ENODEV;
-	}
 	return -ENODEV;
 }
-#else
-static int tc35815_read_plat_dev_addr(struct net_device *dev)
-{
-	return -ENODEV;
-}
-#endif
 
 static int tc35815_init_dev_addr(struct net_device *dev)
 {
-- 
2.29.2

