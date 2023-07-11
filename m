Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B209B75096C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:17:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87F25A4B;
	Wed, 12 Jul 2023 15:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87F25A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689167831;
	bh=o/4VXNjwZTK0uzfbC0etPekf1RU0/kTIzMnJkGS3e1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bv1dX8zt/XYGoMxkrnUWkxWp9mde+337lGEWP5Ud3pX+7yC8qAsXKLtwz/8pGM3sQ
	 V3fEJ5wICuc2wcejpNm1C5GjTRP9R9VhI6s+0abOpU4qqPPt3G1oCSIGRsDmqiChX+
	 J9gG7PAaGZoX9BT3c7agrXgYqcE5ArAo1KwbKuYw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3575DF805D8; Wed, 12 Jul 2023 15:14:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C05BF805D8;
	Wed, 12 Jul 2023 15:14:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DDF1F8024E; Tue, 11 Jul 2023 19:20:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06B1BF80236
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 19:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B1BF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=afAmHREQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689095969; x=1720631969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o/4VXNjwZTK0uzfbC0etPekf1RU0/kTIzMnJkGS3e1w=;
  b=afAmHREQpVxeEt38awi8B4DYgw2H8f5o8fhJi43lZVnzQYrwzmpAxNNd
   P0T3P9Zr6IHCDrakTsP9Sw4EPAM993mufQ6LO7aBpcTrnPd5mNYVdLZWz
   lpO5iO8EDf0P5O8lnWqxAnAYzvqVVednizXkteRoSucOxF748qS/Qz3BP
   2N2ioMu6nDViGUSOhtU9HlsQuMFpdczguPBzwE53kD/UoMpd3n/DOlSLi
   jS/CLJGrV2C/UTsXCdvaWLxCGXWE9wu88ktVFHlQPvYqywK17Tgf7rcZA
   avHEYTdYmaVzeQD2QlAuqD1iaa4/Mun8NscH3OGxRJcu9IW7jbJydekFH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362148898"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200";
   d="scan'208";a="362148898"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 10:19:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715240868"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200";
   d="scan'208";a="715240868"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 10:17:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6B702604; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
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
Subject: [PATCH v3 06/14] spi: Use sysfs_emit() to instead of s*printf()
Date: Tue, 11 Jul 2023 20:17:48 +0300
Message-Id: <20230711171756.86736-7-andriy.shevchenko@linux.intel.com>
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
Message-ID-Hash: JBAXVUID4Y2IEF5WJEXNHTB476I4UUCV
X-Message-ID-Hash: JBAXVUID4Y2IEF5WJEXNHTB476I4UUCV
X-Mailman-Approved-At: Wed, 12 Jul 2023 13:13:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Follow the advice of the Documentation/filesystems/sysfs.rst and show()
should only use sysfs_emit() or sysfs_emit_at() when formatting the
value to be returned to user space.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 57b5e4488416..19846fe4c4d5 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -64,7 +64,7 @@ modalias_show(struct device *dev, struct device_attribute *a, char *buf)
 	if (len != -ENODEV)
 		return len;
 
-	return sprintf(buf, "%s%s\n", SPI_MODULE_PREFIX, spi->modalias);
+	return sysfs_emit(buf, "%s%s\n", SPI_MODULE_PREFIX, spi->modalias);
 }
 static DEVICE_ATTR_RO(modalias);
 
@@ -89,7 +89,7 @@ static ssize_t driver_override_show(struct device *dev,
 	ssize_t len;
 
 	device_lock(dev);
-	len = snprintf(buf, PAGE_SIZE, "%s\n", spi->driver_override ? : "");
+	len = sysfs_emit(buf, "%s\n", spi->driver_override ? : "");
 	device_unlock(dev);
 	return len;
 }
@@ -2797,8 +2797,7 @@ static ssize_t slave_show(struct device *dev, struct device_attribute *attr,
 	struct device *child;
 
 	child = device_find_any_child(&ctlr->dev);
-	return sprintf(buf, "%s\n",
-		       child ? to_spi_device(child)->modalias : NULL);
+	return sysfs_emit(buf, "%s\n", child ? to_spi_device(child)->modalias : NULL);
 }
 
 static ssize_t slave_store(struct device *dev, struct device_attribute *attr,
-- 
2.40.0.1.gaa8946217a0b

