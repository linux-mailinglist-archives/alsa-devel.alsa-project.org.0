Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C05014500C5
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 10:02:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30DBF16BA;
	Mon, 15 Nov 2021 10:01:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30DBF16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636966938;
	bh=KymEuSb1ZBu9d4ip60ZapuAOc2fPUmm65BckI1F9t+0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oLYXNu9ZKOLupwq4kITKcu1RLpWNEnye0ySM3C+K6979hPYm8OcVatP1bmBJLr436
	 jfeKJwWBpEpMOVFEcSE6w0SMZcB5DV/R1ni8lk3X1L+s/lBxb6he2OInqrcpFXjOar
	 bno9bahDuWKR/lkTXbvMATbbHXkWp6FsM6Mm5/rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E852F80535;
	Mon, 15 Nov 2021 09:57:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B79B5F8027D; Mon, 15 Nov 2021 09:56:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26DB1F800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 09:56:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26DB1F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LdZ6xF0x"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D85961BF5;
 Mon, 15 Nov 2021 08:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636966558;
 bh=KymEuSb1ZBu9d4ip60ZapuAOc2fPUmm65BckI1F9t+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LdZ6xF0xp+O72e2bWrz1JbVB8H175gzm3ebqcgB4b1TFRnEbOtg/Co/2UVmy2RSYO
 K4PGopsAL2+EPUBQXn3pIZuRLnOiV7Z4ZHRzhRaGpOOilkyT8qB7djWEyRGQxY+o07
 0pURtU5ha6Bqhqi3VRo20hpuTebBqhRUMgKKcND/ItqTEUbbBG6gtFAFRdgoUlbWQv
 nllnKfHGybN+48IS6aBEK9XM+8ihm/vdNwSp8OLBPdHs4lV1MKpoIy38LN4jK4yIhT
 e7DvDqpq2WV2gb8/H5hLIdnkM9Qc2HOyUeSrulI8xZE0lHPXJ5SUm3GD7JPkNCpR/k
 kEJCWgx/yAgzA==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 11/11] dmaengine: remove slave_id config field
Date: Mon, 15 Nov 2021 09:54:03 +0100
Message-Id: <20211115085403.360194-12-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211115085403.360194-1-arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Nov 2021 09:57:03 +0100
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

All references to the slave_id field have been removed, so
remove the field as well to prevent new references from
creeping in again.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/dmaengine.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 9000f3ffce8b..0349b35235e6 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -418,9 +418,6 @@ enum dma_slave_buswidth {
  * @device_fc: Flow Controller Settings. Only valid for slave channels. Fill
  * with 'true' if peripheral should be flow controller. Direction will be
  * selected at Runtime.
- * @slave_id: Slave requester id. Only valid for slave channels. The dma
- * slave peripheral will have unique id as dma requester which need to be
- * pass as slave config.
  * @peripheral_config: peripheral configuration for programming peripheral
  * for dmaengine transfer
  * @peripheral_size: peripheral configuration buffer size
@@ -448,7 +445,6 @@ struct dma_slave_config {
 	u32 src_port_window_size;
 	u32 dst_port_window_size;
 	bool device_fc;
-	unsigned int slave_id;
 	void *peripheral_config;
 	size_t peripheral_size;
 };
-- 
2.30.2

