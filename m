Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE8374F0D7
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56B18EAD;
	Tue, 11 Jul 2023 15:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56B18EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083799;
	bh=8Fi7Z+SejqB8FmLnWihYsJBZfmhjua3hB69p3/WVjRY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BhPNcYjnik8qhoRARVphvZzLslp+Gr56LY2WjqqSDITQgCpvAxJ3eiR4G1w3qn1l1
	 qj6IhVv1UG3Y/XdBN4XwyRDB/MhsL+6tiGBR+ioOISB4GJB1Pk3O38wIChMOUoik0V
	 CtR2XDXnuwIIWxRonOn9+1VDtvSXbcpNKPZ99YLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 049EEF80619; Tue, 11 Jul 2023 15:52:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C17EF80236;
	Tue, 11 Jul 2023 15:52:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32567F8053B; Mon, 10 Jul 2023 17:50:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 723FCF8047D
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 17:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 723FCF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T/q2tMyf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689004196; x=1720540196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Fi7Z+SejqB8FmLnWihYsJBZfmhjua3hB69p3/WVjRY=;
  b=T/q2tMyf5dvVTbUAv5VojIjirpzEPe52CPtefPOWRj2ExqDJ65lDFqDd
   zSsk8vKmPGzVFJV5oBq/x6Trz3Mybb+uXwxhB5qLgUQJe9oZfKYGPjo2i
   cYCz1JP4iQkES5CBfNi3FjKqTJny3Qa5aJAfx7k49hHIf3sTPbj+hQI6z
   8CnLdHtXaqfX0apksAltxhU4oESGBvBP5kXePjCT/V6Yg9IxaH5ROo8C9
   bw0dnw09hRn8z07/tCWPO+HIkvQV0p2EE4GaDGX5FJ8iLGEEbrgvaiTBc
   vgOg7Z42xVWu9qSVbR5a6DA1LUF+x/dikp9arPNQ07VuUr1pD34bPIjLP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="349185524"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="349185524"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 08:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="844921926"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="844921926"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 10 Jul 2023 08:49:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E9B59854; Mon, 10 Jul 2023 18:49:34 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH v2 14/15] spi: Convert to SPI_CONTROLLER_HALF_DUPLEX
Date: Mon, 10 Jul 2023 18:49:31 +0300
Message-Id: <20230710154932.68377-15-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 6I677TUI4AAW4AORBAWWEFHYRQQFVEI5
X-Message-ID-Hash: 6I677TUI4AAW4AORBAWWEFHYRQQFVEI5
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:52:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6I677TUI4AAW4AORBAWWEFHYRQQFVEI5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the users under SPI subsystem to SPI_CONTROLLER_HALF_DUPLEX.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-amd.c             | 2 +-
 drivers/spi/spi-cavium-thunderx.c | 2 +-
 drivers/spi/spi-falcon.c          | 2 +-
 drivers/spi/spi-lp8841-rtc.c      | 2 +-
 drivers/spi/spi-mxs.c             | 2 +-
 drivers/spi/spi-omap-uwire.c      | 2 +-
 drivers/spi/spi-pic32-sqi.c       | 2 +-
 drivers/spi/spi-qcom-qspi.c       | 2 +-
 drivers/spi/spi-rockchip-sfc.c    | 2 +-
 drivers/spi/spi-sprd-adi.c        | 2 +-
 drivers/spi/spi-ti-qspi.c         | 2 +-
 drivers/spi/spi-xcomm.c           | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-amd.c b/drivers/spi/spi-amd.c
index fecead757a3c..b19766571f28 100644
--- a/drivers/spi/spi-amd.c
+++ b/drivers/spi/spi-amd.c
@@ -404,7 +404,7 @@ static int amd_spi_probe(struct platform_device *pdev)
 	master->bus_num = 0;
 	master->num_chipselect = 4;
 	master->mode_bits = 0;
-	master->flags = SPI_MASTER_HALF_DUPLEX;
+	master->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	master->max_speed_hz = AMD_SPI_MAX_HZ;
 	master->min_speed_hz = AMD_SPI_MIN_HZ;
 	master->setup = amd_spi_master_setup;
diff --git a/drivers/spi/spi-cavium-thunderx.c b/drivers/spi/spi-cavium-thunderx.c
index 60c0d6934654..535f7eb9fa69 100644
--- a/drivers/spi/spi-cavium-thunderx.c
+++ b/drivers/spi/spi-cavium-thunderx.c
@@ -64,7 +64,7 @@ static int thunderx_spi_probe(struct pci_dev *pdev,
 		p->sys_freq = SYS_FREQ_DEFAULT;
 	dev_info(dev, "Set system clock to %u\n", p->sys_freq);
 
-	master->flags = SPI_MASTER_HALF_DUPLEX;
+	master->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	master->num_chipselect = 4;
 	master->mode_bits = SPI_CPHA | SPI_CPOL | SPI_CS_HIGH |
 			    SPI_LSB_FIRST | SPI_3WIRE;
diff --git a/drivers/spi/spi-falcon.c b/drivers/spi/spi-falcon.c
index 4c103dff0d44..8a8414cbb400 100644
--- a/drivers/spi/spi-falcon.c
+++ b/drivers/spi/spi-falcon.c
@@ -401,7 +401,7 @@ static int falcon_sflash_probe(struct platform_device *pdev)
 	priv->master = master;
 
 	master->mode_bits = SPI_MODE_3;
-	master->flags = SPI_MASTER_HALF_DUPLEX;
+	master->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	master->setup = falcon_sflash_setup;
 	master->transfer_one_message = falcon_sflash_xfer_one;
 	master->dev.of_node = pdev->dev.of_node;
diff --git a/drivers/spi/spi-lp8841-rtc.c b/drivers/spi/spi-lp8841-rtc.c
index ccaa7a946359..c6810720b3b5 100644
--- a/drivers/spi/spi-lp8841-rtc.c
+++ b/drivers/spi/spi-lp8841-rtc.c
@@ -191,7 +191,7 @@ spi_lp8841_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, master);
 
-	master->flags = SPI_MASTER_HALF_DUPLEX;
+	master->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	master->mode_bits = SPI_CS_HIGH | SPI_3WIRE | SPI_LSB_FIRST;
 
 	master->bus_num = pdev->id;
diff --git a/drivers/spi/spi-mxs.c b/drivers/spi/spi-mxs.c
index 963a53dd680b..cd0e7ae07162 100644
--- a/drivers/spi/spi-mxs.c
+++ b/drivers/spi/spi-mxs.c
@@ -572,7 +572,7 @@ static int mxs_spi_probe(struct platform_device *pdev)
 	master->mode_bits = SPI_CPOL | SPI_CPHA;
 	master->num_chipselect = 3;
 	master->dev.of_node = np;
-	master->flags = SPI_MASTER_HALF_DUPLEX;
+	master->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	master->auto_runtime_pm = true;
 
 	spi = spi_master_get_devdata(master);
diff --git a/drivers/spi/spi-omap-uwire.c b/drivers/spi/spi-omap-uwire.c
index 902d2e0c1f2f..f89aa9e52c23 100644
--- a/drivers/spi/spi-omap-uwire.c
+++ b/drivers/spi/spi-omap-uwire.c
@@ -486,7 +486,7 @@ static int uwire_probe(struct platform_device *pdev)
 	/* the spi->mode bits understood by this driver: */
 	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
 	master->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 16);
-	master->flags = SPI_MASTER_HALF_DUPLEX;
+	master->flags = SPI_CONTROLLER_HALF_DUPLEX;
 
 	master->bus_num = 2;	/* "official" */
 	master->num_chipselect = 4;
diff --git a/drivers/spi/spi-pic32-sqi.c b/drivers/spi/spi-pic32-sqi.c
index 51dfb49523f3..5cbebcf26a2a 100644
--- a/drivers/spi/spi-pic32-sqi.c
+++ b/drivers/spi/spi-pic32-sqi.c
@@ -648,7 +648,7 @@ static int pic32_sqi_probe(struct platform_device *pdev)
 	master->dev.of_node	= pdev->dev.of_node;
 	master->mode_bits	= SPI_MODE_3 | SPI_MODE_0 | SPI_TX_DUAL |
 				  SPI_RX_DUAL | SPI_TX_QUAD | SPI_RX_QUAD;
-	master->flags		= SPI_MASTER_HALF_DUPLEX;
+	master->flags		= SPI_CONTROLLER_HALF_DUPLEX;
 	master->can_dma		= pic32_sqi_can_dma;
 	master->bits_per_word_mask	= SPI_BPW_RANGE_MASK(8, 32);
 	master->transfer_one_message	= pic32_sqi_one_message;
diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index a8a683d6145c..5a98c52bad32 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -724,7 +724,7 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 	master->mode_bits = SPI_MODE_0 |
 			    SPI_TX_DUAL | SPI_RX_DUAL |
 			    SPI_TX_QUAD | SPI_RX_QUAD;
-	master->flags = SPI_MASTER_HALF_DUPLEX;
+	master->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	master->prepare_message = qcom_qspi_prepare_message;
 	master->transfer_one = qcom_qspi_transfer_one;
 	master->handle_err = qcom_qspi_handle_err;
diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 583f4187f030..bd550e76ab3d 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -565,7 +565,7 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 	if (!master)
 		return -ENOMEM;
 
-	master->flags = SPI_MASTER_HALF_DUPLEX;
+	master->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	master->mem_ops = &rockchip_sfc_mem_ops;
 	master->dev.of_node = pdev->dev.of_node;
 	master->mode_bits = SPI_TX_QUAD | SPI_TX_DUAL | SPI_RX_QUAD | SPI_RX_DUAL;
diff --git a/drivers/spi/spi-sprd-adi.c b/drivers/spi/spi-sprd-adi.c
index 22e39c4c12c4..94d16aadfa44 100644
--- a/drivers/spi/spi-sprd-adi.c
+++ b/drivers/spi/spi-sprd-adi.c
@@ -580,7 +580,7 @@ static int sprd_adi_probe(struct platform_device *pdev)
 	ctlr->dev.of_node = pdev->dev.of_node;
 	ctlr->bus_num = pdev->id;
 	ctlr->num_chipselect = num_chipselect;
-	ctlr->flags = SPI_MASTER_HALF_DUPLEX;
+	ctlr->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	ctlr->bits_per_word_mask = 0;
 	ctlr->transfer_one = sprd_adi_transfer_one;
 
diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 5914335ff63d..bf4b40289bee 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -770,7 +770,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
 
 	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_RX_DUAL | SPI_RX_QUAD;
 
-	master->flags = SPI_MASTER_HALF_DUPLEX;
+	master->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	master->setup = ti_qspi_setup;
 	master->auto_runtime_pm = true;
 	master->transfer_one_message = ti_qspi_start_transfer_one;
diff --git a/drivers/spi/spi-xcomm.c b/drivers/spi/spi-xcomm.c
index ae6218bcd02a..a3d57554f5ba 100644
--- a/drivers/spi/spi-xcomm.c
+++ b/drivers/spi/spi-xcomm.c
@@ -218,7 +218,7 @@ static int spi_xcomm_probe(struct i2c_client *i2c)
 	master->num_chipselect = 16;
 	master->mode_bits = SPI_CPHA | SPI_CPOL | SPI_3WIRE;
 	master->bits_per_word_mask = SPI_BPW_MASK(8);
-	master->flags = SPI_MASTER_HALF_DUPLEX;
+	master->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	master->transfer_one_message = spi_xcomm_transfer_one;
 	master->dev.of_node = i2c->dev.of_node;
 	i2c_set_clientdata(i2c, master);
-- 
2.40.0.1.gaa8946217a0b

