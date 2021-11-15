Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35A24500A6
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 09:58:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 328741676;
	Mon, 15 Nov 2021 09:57:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 328741676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636966726;
	bh=1h0g2AYqXFphX4dDyELLl2t7YQIUXZ6UIHT7JYg2iMs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eM4B98k6QOWtcIrlB+k6gU1Y1xLLVF7mA1VoKAhBTrsaLpCMJByzRaCZR4Al/lGwC
	 ZIPNv9ydmpSHafPD6HT/BpvFVAFaRU5J5+6PRahzv6zkAfI0WdaKHn0pMitjREy2ux
	 EtLtu+HtBFsu/pBVZRe+cSf6X+YqHuwdnLfdwkC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F38F804BD;
	Mon, 15 Nov 2021 09:57:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DAC3F8028B; Mon, 15 Nov 2021 09:55:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32370F80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 09:54:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32370F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kv+C8zB0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9880061BE2;
 Mon, 15 Nov 2021 08:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636966486;
 bh=1h0g2AYqXFphX4dDyELLl2t7YQIUXZ6UIHT7JYg2iMs=;
 h=From:To:Cc:Subject:Date:From;
 b=kv+C8zB0tbPMdXf3ORNkXrRH4MrGq92/hxOUWQ7rrNLjPwyN92rkebIKY8icgiOfU
 pMdG65xZlUKOnr8NUOP6pmXxc3gZzuCmcsiwcDOb6St8hs6LkWB6n1ZZo98RlrnVvp
 FkqOBIn33Yi9JZOuQ6miAmszWpYRosGKoEiu9hmpXWXS0VgUXakje0NXKySH0Rz+mZ
 5B6hNND+tRm0kn91fmSGmzeWYTduFgTH0JLa1xNb8xKQOI2gwIYz/OsIEp39PngVMt
 ez7HK1j37N1+6Gl5sR4/i/hvvdNCZ5Sdb+Rvh2P8BC4uYTPFd5lIc2Ou5i9m3hH8E0
 48X4U7Q98MS4A==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 00/11] dmaengine: kill off dma_slave_config->slave_id
Date: Mon, 15 Nov 2021 09:53:52 +0100
Message-Id: <20211115085403.360194-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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

I recently came across some new uses of the 'slave_id' field that
I had (almost) removed a few years ago. There are no legitimate
uses of this field in the kernel, only a few stale references and
two drivers that abuse the field as a side-channel between the
dmaengine driver and its client.

Let's change the xilinx and qualcomm drivers to use the documented
side-channel (peripheral_data) instead, and remove the remnants of
it to prevent new users from coming in.

As the last patch in the series depends on all the others, it would
be nice have everything merged into the dmaengine tree for v5.17.

       Arnd

Arnd Bergmann (11):
  ASoC: dai_dma: remove slave_id field
  spi: pic32: stop setting dma_config->slave_id
  mmc: bcm2835: stop setting chan_config->slave_id
  dmaengine: shdma: remove legacy slave_id parsing
  dmaengine: pxa/mmp: stop referencing config->slave_id
  dmaengine: sprd: stop referencing config->slave_id
  dmaengine: qcom-adm: stop abusing slave_id config
  dmaengine: xilinx_dpdma: stop using slave_id field
  dmaengine: tegra20-apb: stop checking config->slave_id
  staging: ralink-gdma: stop using slave_id config
  dmaengine: remove slave_id config field

 drivers/dma/mmp_pdma.c                    |  6 ---
 drivers/dma/pxa_dma.c                     |  7 ---
 drivers/dma/qcom/qcom_adm.c               | 56 ++++++++++++++++++++---
 drivers/dma/sh/shdma-base.c               |  8 ----
 drivers/dma/sprd-dma.c                    |  3 --
 drivers/dma/tegra20-apb-dma.c             |  6 ---
 drivers/dma/xilinx/xilinx_dpdma.c         | 12 +++--
 drivers/gpu/drm/xlnx/zynqmp_disp.c        |  9 +++-
 drivers/mmc/host/bcm2835.c                |  2 -
 drivers/mtd/nand/raw/qcom_nandc.c         | 14 +++++-
 drivers/spi/spi-pic32.c                   |  2 -
 drivers/staging/ralink-gdma/ralink-gdma.c | 12 ++---
 drivers/tty/serial/msm_serial.c           | 15 +++++-
 include/linux/dma/qcom_adm.h              | 12 +++++
 include/linux/dma/xilinx_dpdma.h          | 11 +++++
 include/linux/dmaengine.h                 |  4 --
 include/sound/dmaengine_pcm.h             |  2 -
 sound/core/pcm_dmaengine.c                |  5 +-
 sound/soc/tegra/tegra20_spdif.c           |  1 -
 19 files changed, 119 insertions(+), 68 deletions(-)
 create mode 100644 include/linux/dma/qcom_adm.h
 create mode 100644 include/linux/dma/xilinx_dpdma.h

-- 
2.30.2

Cc: Andy Gross <agross@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Jon Hunter <jonathanh@nvidia.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: alsa-devel@alsa-project.org
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: dmaengine@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-serial@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
