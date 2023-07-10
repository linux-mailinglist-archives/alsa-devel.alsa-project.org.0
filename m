Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EF874F0D5
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60EB6E0F;
	Tue, 11 Jul 2023 15:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60EB6E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083781;
	bh=IeVSPWVD107VIF34v9BU3Oj6m3Q5DOG73amK5fjo1Vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J1WFoIaZHxnGes/dcC/IR4C5u6Kv3F46NVvkVc55MIx/uyPTfN3Keyfu/0yA6lwRf
	 9DW6KSWnHPcSaGGMhvsz9xGeh9c6XyTTmQwTBzyo90XHkU4f/vqQulFdqKT8bFTcy4
	 syHC4pzY3/lgB3eheQljYLaygUltEnIr1PPJjNgY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AE3EF8060C; Tue, 11 Jul 2023 15:52:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 803B2F8060C;
	Tue, 11 Jul 2023 15:52:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18F22F80153; Mon, 10 Jul 2023 17:50:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B57EF80551
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 17:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B57EF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TdoYQlsG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689004197; x=1720540197;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IeVSPWVD107VIF34v9BU3Oj6m3Q5DOG73amK5fjo1Vs=;
  b=TdoYQlsGDXsYZA6T2j+2KQZvx9aGeu6WjJmJyQOgAb6A5oGdaSdfDK+C
   +pClL+xvVdQ9uWeWTrXsN6vGJ7PiDQXtwzQMy+lXT0XpkzXqDTkcJWLJ+
   rSqTwwx4xWvZtjoMgwgYWusTQjRfVGVnxSbIkQM7ZiOtrmbY1pVusMh50
   qCitk7pjQkgPn6O46Z01g/UvxkJdpxxL351hc5ajAqsJ9M0OTWyAn6ow9
   mTzO0OIafQE9A9iwlh7VwS4jooK5s9ovpdtd4eu8yeLwJRBXfK3YdqafJ
   7emU7RQOmfTsWu2UcE8lfmr7KAcHMYF8NhVsiuMqLKE57GvW7IgFvwv8Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="361842606"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="361842606"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 08:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="720743965"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="720743965"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 Jul 2023 08:49:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DE5C17AB; Mon, 10 Jul 2023 18:49:34 +0300 (EEST)
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
Subject: [PATCH v2 13/15] spi: Rename SPI_MASTER_GPIO_SS to
 SPI_CONTROLLER_GPIO_SS
Date: Mon, 10 Jul 2023 18:49:30 +0300
Message-Id: <20230710154932.68377-14-andriy.shevchenko@linux.intel.com>
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
Message-ID-Hash: 3UMZZTHI3IT7ZUAUCMNN3FOBF7ZKFJBQ
X-Message-ID-Hash: 3UMZZTHI3IT7ZUAUCMNN3FOBF7ZKFJBQ
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:52:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UMZZTHI3IT7ZUAUCMNN3FOBF7ZKFJBQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename SPI_MASTER_GPIO_SS to SPI_CONTROLLER_GPIO_SS and
convert the users to SPI_CONTROLLER_GPIO_SS to follow
the new naming shema.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-ath79.c    | 2 +-
 drivers/spi/spi-atmel.c    | 2 +-
 drivers/spi/spi-bitbang.c  | 6 +++---
 drivers/spi/spi-davinci.c  | 2 +-
 drivers/spi/spi-dw-core.c  | 2 +-
 drivers/spi/spi-gpio.c     | 2 +-
 drivers/spi/spi-imx.c      | 2 +-
 drivers/spi/spi-orion.c    | 2 +-
 drivers/spi/spi-rockchip.c | 2 +-
 drivers/spi/spi-sifive.c   | 2 +-
 drivers/spi/spi.c          | 4 ++--
 include/linux/spi/spi.h    | 3 +--
 12 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/spi/spi-ath79.c b/drivers/spi/spi-ath79.c
index d3dd21386f12..1b6d977d111c 100644
--- a/drivers/spi/spi-ath79.c
+++ b/drivers/spi/spi-ath79.c
@@ -185,7 +185,7 @@ static int ath79_spi_probe(struct platform_device *pdev)
 
 	host->use_gpio_descriptors = true;
 	host->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 32);
-	host->flags = SPI_MASTER_GPIO_SS;
+	host->flags = SPI_CONTROLLER_GPIO_SS;
 	host->num_chipselect = 3;
 	host->mem_ops = &ath79_mem_ops;
 
diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
index 0865993005b2..9674499ed0a6 100644
--- a/drivers/spi/spi-atmel.c
+++ b/drivers/spi/spi-atmel.c
@@ -1476,7 +1476,7 @@ static int atmel_spi_probe(struct platform_device *pdev)
 	host->num_chipselect = 4;
 	host->setup = atmel_spi_setup;
 	host->flags = (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX |
-			SPI_MASTER_GPIO_SS);
+			SPI_CONTROLLER_GPIO_SS);
 	host->transfer_one = atmel_spi_one_transfer;
 	host->set_cs = atmel_spi_set_cs;
 	host->cleanup = atmel_spi_cleanup;
diff --git a/drivers/spi/spi-bitbang.c b/drivers/spi/spi-bitbang.c
index 862f209cada1..ecd44016c197 100644
--- a/drivers/spi/spi-bitbang.c
+++ b/drivers/spi/spi-bitbang.c
@@ -349,11 +349,11 @@ int spi_bitbang_init(struct spi_bitbang *bitbang)
 	/*
 	 * We only need the chipselect callback if we are actually using it.
 	 * If we just use GPIO descriptors, it is surplus. If the
-	 * SPI_MASTER_GPIO_SS flag is set, we always need to call the
+	 * SPI_CONTROLLER_GPIO_SS flag is set, we always need to call the
 	 * driver-specific chipselect routine.
 	 */
 	custom_cs = (!master->use_gpio_descriptors ||
-		     (master->flags & SPI_MASTER_GPIO_SS));
+		     (master->flags & SPI_CONTROLLER_GPIO_SS));
 
 	if (custom_cs && !bitbang->chipselect)
 		return -EINVAL;
@@ -371,7 +371,7 @@ int spi_bitbang_init(struct spi_bitbang *bitbang)
 	master->transfer_one = spi_bitbang_transfer_one;
 	/*
 	 * When using GPIO descriptors, the ->set_cs() callback doesn't even
-	 * get called unless SPI_MASTER_GPIO_SS is set.
+	 * get called unless SPI_CONTROLLER_GPIO_SS is set.
 	 */
 	if (custom_cs)
 		master->set_cs = spi_bitbang_set_cs;
diff --git a/drivers/spi/spi-davinci.c b/drivers/spi/spi-davinci.c
index 014392459d5e..7ea2ac053052 100644
--- a/drivers/spi/spi-davinci.c
+++ b/drivers/spi/spi-davinci.c
@@ -939,7 +939,7 @@ static int davinci_spi_probe(struct platform_device *pdev)
 	master->bus_num = pdev->id;
 	master->num_chipselect = pdata->num_chipselect;
 	master->bits_per_word_mask = SPI_BPW_RANGE_MASK(2, 16);
-	master->flags = SPI_CONTROLLER_MUST_RX | SPI_MASTER_GPIO_SS;
+	master->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_GPIO_SS;
 	master->setup = davinci_spi_setup;
 	master->cleanup = davinci_spi_cleanup;
 	master->can_dma = davinci_spi_can_dma;
diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index a8ba41ad4541..45f5acc26b1d 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
@@ -932,7 +932,7 @@ int dw_spi_add_host(struct device *dev, struct dw_spi *dws)
 	if (dws->mem_ops.exec_op)
 		master->mem_ops = &dws->mem_ops;
 	master->max_speed_hz = dws->max_freq;
-	master->flags = SPI_MASTER_GPIO_SS;
+	master->flags = SPI_CONTROLLER_GPIO_SS;
 	master->auto_runtime_pm = true;
 
 	/* Get default rx sample delay */
diff --git a/drivers/spi/spi-gpio.c b/drivers/spi/spi-gpio.c
index 85e149ec2910..612db477ad12 100644
--- a/drivers/spi/spi-gpio.c
+++ b/drivers/spi/spi-gpio.c
@@ -434,7 +434,7 @@ static int spi_gpio_probe(struct platform_device *pdev)
 	 * line, that we need to do on selection. This makes the local
 	 * callback for chipselect always get called.
 	 */
-	master->flags |= SPI_MASTER_GPIO_SS;
+	master->flags |= SPI_CONTROLLER_GPIO_SS;
 	bb->chipselect = spi_gpio_chipselect;
 	bb->set_line_direction = spi_gpio_set_direction;
 
diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 528ae46c087f..8d97f2b32c2b 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1779,7 +1779,7 @@ static int spi_imx_probe(struct platform_device *pdev)
 
 	if (is_imx51_ecspi(spi_imx) || is_imx53_ecspi(spi_imx)) {
 		controller->max_native_cs = 4;
-		controller->flags |= SPI_MASTER_GPIO_SS;
+		controller->flags |= SPI_CONTROLLER_GPIO_SS;
 	}
 
 	spi_imx->spi_drctl = spi_drctl;
diff --git a/drivers/spi/spi-orion.c b/drivers/spi/spi-orion.c
index ad9e83e34297..4882aafd0505 100644
--- a/drivers/spi/spi-orion.c
+++ b/drivers/spi/spi-orion.c
@@ -677,7 +677,7 @@ static int orion_spi_probe(struct platform_device *pdev)
 	master->bits_per_word_mask = SPI_BPW_MASK(8) | SPI_BPW_MASK(16);
 	master->auto_runtime_pm = true;
 	master->use_gpio_descriptors = true;
-	master->flags = SPI_MASTER_GPIO_SS;
+	master->flags = SPI_CONTROLLER_GPIO_SS;
 
 	platform_set_drvdata(pdev, master);
 
diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
index 143ede958ac1..a37943847e81 100644
--- a/drivers/spi/spi-rockchip.c
+++ b/drivers/spi/spi-rockchip.c
@@ -858,7 +858,7 @@ static int rockchip_spi_probe(struct platform_device *pdev)
 		ctlr->mode_bits |= SPI_NO_CS;
 		ctlr->slave_abort = rockchip_spi_slave_abort;
 	} else {
-		ctlr->flags = SPI_MASTER_GPIO_SS;
+		ctlr->flags = SPI_CONTROLLER_GPIO_SS;
 		ctlr->max_native_cs = ROCKCHIP_SPI_MAX_CS_NUM;
 		/*
 		 * rk spi0 has two native cs, spi1..5 one cs only
diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index dae9e097c333..2f77dae85386 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -379,7 +379,7 @@ static int sifive_spi_probe(struct platform_device *pdev)
 	 * we need to "left-align" the bits (unless SPI_LSB_FIRST)
 	 */
 	master->bits_per_word_mask = SPI_BPW_MASK(8);
-	master->flags = SPI_CONTROLLER_MUST_TX | SPI_MASTER_GPIO_SS;
+	master->flags = SPI_CONTROLLER_MUST_TX | SPI_CONTROLLER_GPIO_SS;
 	master->prepare_message = sifive_spi_prepare_message;
 	master->set_cs = sifive_spi_set_cs;
 	master->transfer_one = sifive_spi_transfer_one;
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 06a92a3a5746..bcabae98cb7c 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -995,7 +995,7 @@ static void spi_set_cs(struct spi_device *spi, bool enable, bool force)
 				gpiod_set_value_cansleep(spi_get_csgpiod(spi, 0), activate);
 		}
 		/* Some SPI masters need both GPIO CS & slave_select */
-		if ((spi->controller->flags & SPI_MASTER_GPIO_SS) &&
+		if ((spi->controller->flags & SPI_CONTROLLER_GPIO_SS) &&
 		    spi->controller->set_cs)
 			spi->controller->set_cs(spi, !enable);
 	} else if (spi->controller->set_cs) {
@@ -3020,7 +3020,7 @@ static int spi_get_gpio_descs(struct spi_controller *ctlr)
 
 	ctlr->unused_native_cs = ffs(~native_cs_mask) - 1;
 
-	if ((ctlr->flags & SPI_MASTER_GPIO_SS) && num_cs_gpios &&
+	if ((ctlr->flags & SPI_CONTROLLER_GPIO_SS) && num_cs_gpios &&
 	    ctlr->max_native_cs && ctlr->unused_native_cs >= ctlr->max_native_cs) {
 		dev_err(dev, "No unused native chip select available\n");
 		return -EINVAL;
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index cdc3addfe117..43f6c3f71a76 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -578,8 +578,7 @@ struct spi_controller {
 #define SPI_CONTROLLER_NO_TX		BIT(2)	/* Can't do buffer write */
 #define SPI_CONTROLLER_MUST_RX		BIT(3)	/* Requires rx */
 #define SPI_CONTROLLER_MUST_TX		BIT(4)	/* Requires tx */
-
-#define SPI_MASTER_GPIO_SS		BIT(5)	/* GPIO CS must select slave */
+#define SPI_CONTROLLER_GPIO_SS		BIT(5)	/* GPIO CS must select slave */
 
 	/* Flag indicating if the allocation of this struct is devres-managed */
 	bool			devm_allocated;
-- 
2.40.0.1.gaa8946217a0b

