Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95040459E0B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:30:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2325616CC;
	Tue, 23 Nov 2021 09:29:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2325616CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656245;
	bh=McpWp/4AcEZeBd39ynQN6eTYVALGVNvs8cD8tBGVm+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lWRECwA5G6b8UXjDB/eAsr1fSwq0eRZfNTDTcvwinrlkg6UNEoxYFXtMAA6koSW4Y
	 mtSwErJOidPZb9+z++KcTqhQsXjy51C68E8E4ITQO/FkLMv8rcE77SXvGYb0A7kqMB
	 jOfwqFOZ6NCpHec0qfUKqgGFRS/dye0qrHEH5QT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E59F805C6;
	Tue, 23 Nov 2021 09:22:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 398F2F80245; Mon, 22 Nov 2021 23:23:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBAAEF80141
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 23:23:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBAAEF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rpP6eKOr"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1651060FE6;
 Mon, 22 Nov 2021 22:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619798;
 bh=McpWp/4AcEZeBd39ynQN6eTYVALGVNvs8cD8tBGVm+Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rpP6eKOrl9dj0+CGG0X5A92xrHnDtIWKLHyPyGZsCeDj6+Y3LlX4ce9t+tYu5Utwc
 GAD/Dm5Ge6oMPjFnQSe7UC4zsOfp19LJfRk9htLP7pl58RZUdw4odqBlhALUfyEkPP
 qLyhySmSJtoWdnOXs2KUJIGAxo1Y++knYawaZrSKgfizR+WGB/R0Co73Hc2RCgB+E0
 SnKiJkIj+uf0eSIppmJ/1Qu+fX8RKmW186XR2XxbrB1rlTFDwIKlQBRQYQBOkHt4mL
 PvQ4jmOgipvUVh2E0J+xZnDuaSHyDWJVEg2FeTDb2h+g2D3rOu3i4dwNJrZUZKWxqT
 E58/3dIDp/niw==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 07/11] dmaengine: sprd: stop referencing config->slave_id
Date: Mon, 22 Nov 2021 23:21:59 +0100
Message-Id: <20211122222203.4103644-8-arnd@kernel.org>
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

It appears that the code that reads the slave_id from the channel config
was copied incorrectly from other drivers. Nothing ever sets this field
on platforms that use this driver, so remove the reference.

Reviewed-by: Baolin Wang <baolin.wang7@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/sprd-dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 4357d2395e6b..7f158ef5672d 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -795,9 +795,6 @@ static int sprd_dma_fill_desc(struct dma_chan *chan,
 		return dst_datawidth;
 	}
 
-	if (slave_cfg->slave_id)
-		schan->dev_id = slave_cfg->slave_id;
-
 	hw->cfg = SPRD_DMA_DONOT_WAIT_BDONE << SPRD_DMA_WAIT_BDONE_OFFSET;
 
 	/*
-- 
2.29.2

