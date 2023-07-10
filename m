Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F133974F0C4
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:54:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32E2AE89;
	Tue, 11 Jul 2023 15:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32E2AE89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083698;
	bh=0v8XTkg22X4+SjZKJZYJseJJcu9T6jyLmPuYe7Mrmmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NjwqYA/R+aVTqKf1v0sSGkul7xoAg80rxknzGeOFkf1kgr/5GPJ5JNW6QxWdLNdzC
	 zEUnEh6OKys6/WIOXKOJOYGkF+AzBT+O/8EDzBFPs03S1t1a9gxGXmxr4TBPBuDNg6
	 t3P5H3pYdkCchgJczpA+zpgs2bkNqlX6Lc2jKfyY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36481F80290; Tue, 11 Jul 2023 15:52:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8576F80290;
	Tue, 11 Jul 2023 15:52:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE391F80290; Mon, 10 Jul 2023 17:50:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9068F8027B
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 17:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9068F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EvyITdKo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689004190; x=1720540190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0v8XTkg22X4+SjZKJZYJseJJcu9T6jyLmPuYe7Mrmmg=;
  b=EvyITdKoQJ8DEP0YPHep+1rHQ1WvdGOFL0kHv5mpRQHIZi5cSiAq71ZC
   tcmtVWwmCWrmopDefn530WPkqPNohHi5tbsnk/5C808tGh4mHFT43NXg4
   Vg8wUEOj9oGiDfH6d6NqYPqlWNFQGIyZ5ypIUjgQ2xuwjkR+0qg6kmt0F
   HbGbXd249SG5+yGSQ7XHe6N/zdQ9K4eEDO2zZBgcyUs44SreLpVxltXZJ
   af/FJycutu4hRnPJreAmzv8cuEsbCsFeLmZVNJf9aRW0HzioP0cs5+1T0
   PRhhd2mei4p80iEHSXQ1qikdvvWQxeia8/tSIQ1dJ3i151w/9vmnmReqN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="349185397"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="349185397"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 08:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="844921854"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="844921854"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 10 Jul 2023 08:49:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6932A5FC; Mon, 10 Jul 2023 18:49:34 +0300 (EEST)
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
Subject: [PATCH v2 05/15] spi: Remove code duplication in
 spi_add_device_locked()
Date: Mon, 10 Jul 2023 18:49:22 +0300
Message-Id: <20230710154932.68377-6-andriy.shevchenko@linux.intel.com>
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
Message-ID-Hash: YP7DVBYZKE4FRGEJK43I4BOM7NZILJFH
X-Message-ID-Hash: YP7DVBYZKE4FRGEJK43I4BOM7NZILJFH
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:52:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YP7DVBYZKE4FRGEJK43I4BOM7NZILJFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Seems by unknown reason, probably some kind of mis-rebase,
the commit 0c79378c0199 ("spi: add ancillary device support")
adds a dozen of duplicating lines of code. Drop them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index c99ee4164f11..46cbda383228 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -712,17 +712,6 @@ EXPORT_SYMBOL_GPL(spi_add_device);
 static int spi_add_device_locked(struct spi_device *spi)
 {
 	struct spi_controller *ctlr = spi->controller;
-	struct device *dev = ctlr->dev.parent;
-
-	/* Chipselects are numbered 0..max; validate. */
-	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
-		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
-			ctlr->num_chipselect);
-		return -EINVAL;
-	}
-
-	/* Set the bus ID string */
-	spi_dev_set_name(spi);
 
 	WARN_ON(!mutex_is_locked(&ctlr->add_lock));
 	return __spi_add_device(spi);
-- 
2.40.0.1.gaa8946217a0b

