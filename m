Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38231459E01
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:29:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C569716BF;
	Tue, 23 Nov 2021 09:28:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C569716BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656167;
	bh=zgLZXkTyZeT2yxDxiCRe3tFY2/P5W/tmmoA+2l/FQdQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qh3InG2oh+w+BxCzUyi8F7TG+luTatVTySwD2cXaT5WYNnT4Xvo0k67ysrRxzcVEa
	 dY5+UEzxwJ2GBEe+/ii5c4p4B67WE5Xb+BaiBeFXLP0ksrb62e4lht12S1JyxpeWFv
	 ZpajvIpsk6lWnnXnO2SJUHfPa8k0sCpQS6pBxA+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89939F805B0;
	Tue, 23 Nov 2021 09:22:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14425F80141; Mon, 22 Nov 2021 23:22:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90E87F80141
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 23:22:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90E87F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Vu62Qhxe"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26DA261037;
 Mon, 22 Nov 2021 22:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619772;
 bh=zgLZXkTyZeT2yxDxiCRe3tFY2/P5W/tmmoA+2l/FQdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vu62QhxeOG1cTVOI1XJg/cEM/6feijvDUEtMYFy8XGtjFmu3J1wivNmJYFrS1UcOV
 D+7e8/dcFQJTEA2AuE8XH0Mo5hqIkvIU7jr7CXg/xJJcBc/3gkswZgRMRHG8yZS0C6
 A3RlkUSxzEV8XzxTLRQEg6uwnlfUqY5RyXCBxp+xRMO+dd1lHyAqALGLeMHvmaTpcw
 I7KwaDzzGuTLRIA8G7Pjt3vR4BnO8qW8/WDSQVat4v/Pe4kmO2BGzBrfFp32eScXMa
 WlyfUsLnnvlA2nG0tzpq6/XyXcfBH7wJwB0PO2DRQHs2fGLdesV9Gr4tLV3qGoyVAl
 oM4+hQ4U+pU9g==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 03/11] spi: pic32: stop setting dma_config->slave_id
Date: Mon, 22 Nov 2021 23:21:55 +0100
Message-Id: <20211122222203.4103644-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:20:57 +0100
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-staging@lists.linux.dev, Michal Simek <michal.simek@xilinx.com>,
 Jon Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>, Baolin Wang <baolin.wang7@gmail.com>
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

Setting slave_id makes no sense with DT based probing, and
should eventually get removed entirely. Address this driver
by no longer setting the field here.

I could not find which DMA driver is used on PIC32, if it's
in the tree at all, but none of the obvious ones even care
about slave_id any more.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/spi/spi-pic32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index 5eb7b61bbb4d..f86433b29260 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -370,7 +370,6 @@ static int pic32_spi_dma_config(struct pic32_spi *pic32s, u32 dma_width)
 	cfg.src_addr_width = dma_width;
 	cfg.dst_addr_width = dma_width;
 	/* tx channel */
-	cfg.slave_id = pic32s->tx_irq;
 	cfg.direction = DMA_MEM_TO_DEV;
 	ret = dmaengine_slave_config(master->dma_tx, &cfg);
 	if (ret) {
@@ -378,7 +377,6 @@ static int pic32_spi_dma_config(struct pic32_spi *pic32s, u32 dma_width)
 		return ret;
 	}
 	/* rx channel */
-	cfg.slave_id = pic32s->rx_irq;
 	cfg.direction = DMA_DEV_TO_MEM;
 	ret = dmaengine_slave_config(master->dma_rx, &cfg);
 	if (ret)
-- 
2.29.2

