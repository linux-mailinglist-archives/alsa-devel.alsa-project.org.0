Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0139A750965
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:16:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 160151F1;
	Wed, 12 Jul 2023 15:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 160151F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689167800;
	bh=dEFDFR9Zjzcis3/WsD8642CwaquIx3KoLxGVFvTwtnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MqtzJTUg79pxykSQvGbMyAsKow56/mrdS3DBhrH9hUY+W+irMKgNhValJbZdF8KG/
	 zyc1UEhviw2pP9gSc68hVWZHPwE9hv+2zdXymQNno59ODssEleW2CqU20sSrtLqScC
	 mWF8em9byaFw44iZ9XcNF9la8DLP/7E1W6rx6qqc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34516F805C4; Wed, 12 Jul 2023 15:14:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E685F805C4;
	Wed, 12 Jul 2023 15:14:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FD69F80290; Tue, 11 Jul 2023 19:19:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 222E4F8053B
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 19:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 222E4F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nD9dG3IX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689095971; x=1720631971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dEFDFR9Zjzcis3/WsD8642CwaquIx3KoLxGVFvTwtnY=;
  b=nD9dG3IXIQxs8mi08ptIMnEnKMoHj16px2IrsyeSycKgGvgF7BHWEi8D
   ah9lYaPFjjqZrM1N8WyYNVqtx8ebXXpPmTyIZGyTFW8STTeIXJIsNibSu
   8vrPXdmtoAKqmCDbzQYq3tlbnW8ZWnmHIvmmWgy81cUMssb7EnnP+ouZI
   6ZElHbkPKFhUxbWbHTNMiGEXxQKEw8xgxW4ghbn1x/Sde0dAhlkPYtRp7
   VQV287ojCgn73YgJ6gKVMsSF53CHSzCU/kId5QI6YXu5wWvC6xvp5P77y
   KBxvyKEnjJ/vxWMX2wmFoT+mltWRuN8/2zgdAIlc72sflynbE5dcVRQ/N
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362148979"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200";
   d="scan'208";a="362148979"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 10:19:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715240953"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200";
   d="scan'208";a="715240953"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 10:18:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id BEBD9748; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Serge Semin <fancer.lancer@gmail.com>,
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
	Richard Cochran <richardcochran@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 11/14] spi: Get rid of old SPI_MASTER_MUST_TX &
 SPI_MASTER_MUST_RX
Date: Tue, 11 Jul 2023 20:17:53 +0300
Message-Id: <20230711171756.86736-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
References: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
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
Message-ID-Hash: XJXIHJA5YQNRPGPLEP335IBVG2AR3ADS
X-Message-ID-Hash: XJXIHJA5YQNRPGPLEP335IBVG2AR3ADS
X-Mailman-Approved-At: Wed, 12 Jul 2023 13:13:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XJXIHJA5YQNRPGPLEP335IBVG2AR3ADS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the users from SPI_MASTER_MUST_TX and/or SPI_MASTER_MUST_RX
to SPI_CONTROLLER_MUST_TX and/or SPI_CONTROLLER_MUST_RX respectively
and kill the not used anymore definitions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-at91-usart.c   | 2 +-
 drivers/spi/spi-atmel.c        | 2 +-
 drivers/spi/spi-davinci.c      | 2 +-
 drivers/spi/spi-fsl-lpspi.c    | 2 +-
 drivers/spi/spi-meson-spicc.c  | 2 +-
 drivers/spi/spi-mt65xx.c       | 2 +-
 drivers/spi/spi-pci1xxxx.c     | 2 +-
 drivers/spi/spi-pic32.c        | 2 +-
 drivers/spi/spi-rb4xx.c        | 2 +-
 drivers/spi/spi-slave-mt27xx.c | 2 +-
 drivers/spi/spi-stm32.c        | 2 +-
 include/linux/spi/spi.h        | 2 --
 12 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-at91-usart.c b/drivers/spi/spi-at91-usart.c
index 7854d9790fe9..7dfe2b6c2990 100644
--- a/drivers/spi/spi-at91-usart.c
+++ b/drivers/spi/spi-at91-usart.c
@@ -527,7 +527,7 @@ static int at91_usart_spi_probe(struct platform_device *pdev)
 	controller->dev.of_node = pdev->dev.parent->of_node;
 	controller->bits_per_word_mask = SPI_BPW_MASK(8);
 	controller->setup = at91_usart_spi_setup;
-	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
+	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
 	controller->transfer_one = at91_usart_spi_transfer_one;
 	controller->prepare_message = at91_usart_spi_prepare_message;
 	controller->unprepare_message = at91_usart_spi_unprepare_message;
diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 152cd6773403..0865993005b2 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -1475,7 +1475,7 @@ static int atmel_spi_probe(struct platform_device *pdev)
 	host->bus_num = pdev->id;
 	host->num_chipselect = 4;
 	host->setup = atmel_spi_setup;
-	host->flags = (SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX |
+	host->flags = (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX |
 			SPI_MASTER_GPIO_SS);
 	host->transfer_one = atmel_spi_one_transfer;
 	host->set_cs = atmel_spi_set_cs;
diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
index b04811c911e2..014392459d5e 100644
--- a/drivers/spi/spi-davinci.c
+++ b/drivers/spi/spi-davinci.c
@@ -939,7 +939,7 @@ static int davinci_spi_probe(struct platform_device *pdev)
 	master->bus_num = pdev->id;
 	master->num_chipselect = pdata->num_chipselect;
 	master->bits_per_word_mask = SPI_BPW_RANGE_MASK(2, 16);
-	master->flags = SPI_MASTER_MUST_RX | SPI_MASTER_GPIO_SS;
+	master->flags = SPI_CONTROLLER_MUST_RX | SPI_MASTER_GPIO_SS;
 	master->setup = davinci_spi_setup;
 	master->cleanup = davinci_spi_cleanup;
 	master->can_dma = davinci_spi_can_dma;
diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index fb68c72df171..1c907d5d5bb3 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -856,7 +856,7 @@ static int fsl_lpspi_probe(struct platform_device *pdev)
 	controller->prepare_transfer_hardware = lpspi_prepare_xfer_hardware;
 	controller->unprepare_transfer_hardware = lpspi_unprepare_xfer_hardware;
 	controller->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
-	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
+	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
 	controller->dev.of_node = pdev->dev.of_node;
 	controller->bus_num = pdev->id;
 	controller->num_chipselect = fsl_lpspi->num_cs;
diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 141562c882f1..7a9eba35ac38 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -864,7 +864,7 @@ static int meson_spicc_probe(struct platform_device *pdev)
 				     SPI_BPW_MASK(24) |
 				     SPI_BPW_MASK(16) |
 				     SPI_BPW_MASK(8);
-	master->flags = (SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX);
+	master->flags = (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX);
 	master->min_speed_hz = spicc->data->min_speed_hz;
 	master->max_speed_hz = spicc->data->max_speed_hz;
 	master->setup = meson_spicc_setup;
diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
index 39272ad6641b..0757985947dd 100644
--- a/drivers/spi/spi-mt65xx.c
+++ b/drivers/spi/spi-mt65xx.c
@@ -1142,7 +1142,7 @@ static int mtk_spi_probe(struct platform_device *pdev)
 		master->mode_bits |= SPI_CS_HIGH;
 
 	if (mdata->dev_comp->must_tx)
-		master->flags = SPI_MASTER_MUST_TX;
+		master->flags = SPI_CONTROLLER_MUST_TX;
 	if (mdata->dev_comp->ipm_design)
 		master->mode_bits |= SPI_LOOP | SPI_RX_DUAL | SPI_TX_DUAL |
 				     SPI_RX_QUAD | SPI_TX_QUAD;
diff --git a/drivers/spi/spi-pci1xxxx.c b/drivers/spi/spi-pci1xxxx.c
index 4445d82409d6..d23c42839da1 100644
--- a/drivers/spi/spi-pci1xxxx.c
+++ b/drivers/spi/spi-pci1xxxx.c
@@ -365,7 +365,7 @@ static int pci1xxxx_spi_probe(struct pci_dev *pdev, const struct pci_device_id *
 		spi_host->bits_per_word_mask = SPI_BPW_MASK(8);
 		spi_host->max_speed_hz = PCI1XXXX_SPI_MAX_CLOCK_HZ;
 		spi_host->min_speed_hz = PCI1XXXX_SPI_MIN_CLOCK_HZ;
-		spi_host->flags = SPI_MASTER_MUST_TX;
+		spi_host->flags = SPI_CONTROLLER_MUST_TX;
 		spi_master_set_devdata(spi_host, spi_sub_ptr);
 		ret = devm_spi_register_master(dev, spi_host);
 		if (ret)
diff --git a/drivers/spi/spi-pic32.c b/drivers/spi/spi-pic32.c
index f2af5e653f3d..e9b4c9cb97fb 100644
--- a/drivers/spi/spi-pic32.c
+++ b/drivers/spi/spi-pic32.c
@@ -773,7 +773,7 @@ static int pic32_spi_probe(struct platform_device *pdev)
 	master->max_speed_hz	= clk_get_rate(pic32s->clk);
 	master->setup		= pic32_spi_setup;
 	master->cleanup		= pic32_spi_cleanup;
-	master->flags		= SPI_MASTER_MUST_TX | SPI_MASTER_MUST_RX;
+	master->flags		= SPI_CONTROLLER_MUST_TX | SPI_CONTROLLER_MUST_RX;
 	master->bits_per_word_mask	= SPI_BPW_MASK(8) | SPI_BPW_MASK(16) |
 					  SPI_BPW_MASK(32);
 	master->transfer_one		= pic32_spi_one_transfer;
diff --git a/drivers/spi/spi-rb4xx.c b/drivers/spi/spi-rb4xx.c
index 5073736d3d1f..c817889a7797 100644
--- a/drivers/spi/spi-rb4xx.c
+++ b/drivers/spi/spi-rb4xx.c
@@ -156,7 +156,7 @@ static int rb4xx_spi_probe(struct platform_device *pdev)
 	master->num_chipselect = 3;
 	master->mode_bits = SPI_TX_DUAL;
 	master->bits_per_word_mask = SPI_BPW_MASK(8);
-	master->flags = SPI_MASTER_MUST_TX;
+	master->flags = SPI_CONTROLLER_MUST_TX;
 	master->transfer_one = rb4xx_transfer_one;
 	master->set_cs = rb4xx_set_cs;
 
diff --git a/drivers/spi/spi-slave-mt27xx.c b/drivers/spi/spi-slave-mt27xx.c
index 4e4d426bfb43..6d6772974783 100644
--- a/drivers/spi/spi-slave-mt27xx.c
+++ b/drivers/spi/spi-slave-mt27xx.c
@@ -414,7 +414,7 @@ static int mtk_spi_slave_probe(struct platform_device *pdev)
 	mdata->dev_comp = of_id->data;
 
 	if (mdata->dev_comp->must_rx)
-		ctlr->flags = SPI_MASTER_MUST_RX;
+		ctlr->flags = SPI_CONTROLLER_MUST_RX;
 
 	platform_set_drvdata(pdev, ctlr);
 
diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 6d10fa4ab783..423212bd0675 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1750,7 +1750,7 @@ static const struct stm32_spi_cfg stm32f4_spi_cfg = {
 	.baud_rate_div_min = STM32F4_SPI_BR_DIV_MIN,
 	.baud_rate_div_max = STM32F4_SPI_BR_DIV_MAX,
 	.has_fifo = false,
-	.flags = SPI_MASTER_MUST_TX,
+	.flags = SPI_CONTROLLER_MUST_TX,
 };
 
 static const struct stm32_spi_cfg stm32h7_spi_cfg = {
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 39e6271b5003..b90c53332909 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1626,8 +1626,6 @@ spi_transfer_is_last(struct spi_controller *ctlr, struct spi_transfer *xfer)
 #define spi_master			spi_controller
 
 #define SPI_MASTER_HALF_DUPLEX		SPI_CONTROLLER_HALF_DUPLEX
-#define SPI_MASTER_MUST_RX		SPI_CONTROLLER_MUST_RX
-#define SPI_MASTER_MUST_TX		SPI_CONTROLLER_MUST_TX
 
 #define spi_master_get_devdata(_ctlr)	spi_controller_get_devdata(_ctlr)
 #define spi_master_set_devdata(_ctlr, _data)	\
-- 
2.40.0.1.gaa8946217a0b

