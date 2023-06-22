Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C47739E1B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 12:14:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76CAD846;
	Thu, 22 Jun 2023 12:13:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76CAD846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687428848;
	bh=xfE+SfdZbVenJR/6vTIRquflwQen9M2hQvN+u8qWUMU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=maaiMax9qfYJtWNOk1a+ala/Qadh3COFFFmD++w7AHuaJOrPJI19ufB3XuvLncVUx
	 jNg88xJJSnqXwH2lqnuDYf2zKyke9lRkOXAVbmMjA08imLMwnBrezMmTaav4TFk5u4
	 yj8mgtHV43it0Mrg44GYLUbbUtVbjWGAowWZ3uSI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AF0AF80558; Thu, 22 Jun 2023 12:12:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA2EDF80544;
	Thu, 22 Jun 2023 12:12:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5383F80549; Thu, 22 Jun 2023 12:12:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB8C1F80535
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 12:12:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB8C1F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aAFUIIEI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 19F7B61737;
	Thu, 22 Jun 2023 10:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8630C433C8;
	Thu, 22 Jun 2023 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687428760;
	bh=xfE+SfdZbVenJR/6vTIRquflwQen9M2hQvN+u8qWUMU=;
	h=From:To:Cc:Subject:Date:From;
	b=aAFUIIEIxnNtlXlzMa5qj5LivneC/3DsagG3gKQvdrLByGh+pLn65NP6NqL1sd09q
	 Xwbxw5hJOHt/ZPc/mN2q8fz52Z7j3xDSaYvptczL5PQZ6BYYeo1LsvF+p2+99x4ldK
	 Au9G6Z8UWRGtKHP5lIE8CZqg2xbaC7MkZcHOmfKrYOWvCRKQa6L2ctbNqQg1Kk+4NU
	 Ettls9pSe+NKL1hLa1FRjsUZfAtpDw+T0e5tU0pYGhEZegWl20K7IgY6r+lFnl7RBA
	 TMZAhxjjz1UHI03Sy2ZHAfx+w85+7CwiyTDxD6NXAKGK5v+m9GTtk1ku3X5ZLtjgqz
	 +PYKcUp3+shAg==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Yingkun Meng <mengyingkun@loongson.cn>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: loongson: fix address space confusion
Date: Thu, 22 Jun 2023 12:12:22 +0200
Message-Id: <20230622101235.3230941-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RJV5JSB7E6BN3VSXHBB2KTYD7PQSTTW2
X-Message-ID-Hash: RJV5JSB7E6BN3VSXHBB2KTYD7PQSTTW2
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJV5JSB7E6BN3VSXHBB2KTYD7PQSTTW2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arnd Bergmann <arnd@arndb.de>

The i2s driver uses the mapped __iomem address of the FIFO as the DMA
address for the device. This apparently works on loongarch because of
the way it handles __iomem pointers as aliases of physical addresses,
but this is not portable to other architectures and causes a compiler
warning when dma addresses are not the same size as pointers:

sound/soc/loongson/loongson_i2s_pci.c: In function 'loongson_i2s_pci_probe':
sound/soc/loongson/loongson_i2s_pci.c:110:29: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  110 |         tx_data->dev_addr = (dma_addr_t)i2s->reg_base + LS_I2S_TX_DATA;
      |                             ^
sound/soc/loongson/loongson_i2s_pci.c:113:29: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  113 |         rx_data->dev_addr = (dma_addr_t)i2s->reg_base + LS_I2S_RX_DATA;
      |                             ^

Change the driver to instead use the physical address as stored in the
PCI BAR resource directly. Since 'dev_addr' is a 32-bit address, I think
this results in the same truncated address on loongarch but is otherwise
closer to portable code and avoids the warning.

Fixes: d84881e06836d ("ASoC: Add support for Loongson I2S controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This is only build tested and I don't understand the loongarch specifics
that well, please review or test for actual hardware requirements.
---
 sound/soc/loongson/loongson_i2s_pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
index 6dcfb17d3276d..fa90361865c6c 100644
--- a/sound/soc/loongson/loongson_i2s_pci.c
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -107,10 +107,10 @@ static int loongson_i2s_pci_probe(struct pci_dev *pdev,
 	tx_data = &i2s->tx_dma_data;
 	rx_data = &i2s->rx_dma_data;
 
-	tx_data->dev_addr = (dma_addr_t)i2s->reg_base + LS_I2S_TX_DATA;
+	tx_data->dev_addr = pci_resource_start(pdev, 0) + LS_I2S_TX_DATA;
 	tx_data->order_addr = i2s->reg_base + LS_I2S_TX_ORDER;
 
-	rx_data->dev_addr = (dma_addr_t)i2s->reg_base + LS_I2S_RX_DATA;
+	rx_data->dev_addr = pci_resource_start(pdev, 0) + LS_I2S_RX_DATA;
 	rx_data->order_addr = i2s->reg_base + LS_I2S_RX_ORDER;
 
 	tx_data->irq = fwnode_irq_get_byname(fwnode, "tx");
-- 
2.39.2

