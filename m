Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB0374F0B5
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:53:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 947D9DF0;
	Tue, 11 Jul 2023 15:52:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 947D9DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083596;
	bh=eCA4jmpHdK4tCQy+WYVaMHkZ61alyGNaPi2evxW0e9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IMNo9+FwBu/cgAhzMSqh0QlBTZiNpF9DlR+F/PSiuv7jr+JDQmdZO6MYBqzX1NmIS
	 qWyYE7F0I6XnggpMHcowahLkfwKXY/i2xoHSAtNA2GXhA04OQkhMduoTveTtJH9dpP
	 KFWstKlGtERwyyE3OLTmW/QdFshS2CFHmRSwM/Hw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ABBEF80564; Tue, 11 Jul 2023 15:51:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59155F8055C;
	Tue, 11 Jul 2023 15:51:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAC34F80552; Mon, 10 Jul 2023 17:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9DD4F8047D
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 17:49:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9DD4F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i1AFQEtE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689004190; x=1720540190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eCA4jmpHdK4tCQy+WYVaMHkZ61alyGNaPi2evxW0e9A=;
  b=i1AFQEtErj/pA12X39r28TgkusX5J9Pqm1nSYM+DQeuWMt240jfYKN+c
   6URBn7kM/hwQPd9QwI44a4VTYpt34Lqd/Vb7EESvFjHsje5f4tWawdOMP
   WCKGwOzc53emvIjvFUPCi1vN0Vm5evA2q2BBHMDRp8Uk4BWKo7tQ3oGt/
   TH9rvnsbEAB5o0GkCdsnUMmdkgSSA3gaDkMkAQZh9CxsGt8dl77e5aD/6
   Azo0ddQ6vAF/PD0W0E/8wivZvhi7qNzxGLO4WWpzynxsukdQf3gtq6+9y
   wr3mltTYuudIteT1yrt0koQYBnn2VytsnOv/LSv9ez68+fmskUZKpkVqC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="361842498"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="361842498"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 08:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="720743959"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="720743959"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 Jul 2023 08:49:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9C17069F; Mon, 10 Jul 2023 18:49:34 +0300 (EEST)
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
Subject: [PATCH v2 08/15] spi: Clean up headers
Date: Mon, 10 Jul 2023 18:49:25 +0300
Message-Id: <20230710154932.68377-9-andriy.shevchenko@linux.intel.com>
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
Message-ID-Hash: 4CDK74GZ2YN5KMRD3YUJXGF5XFSUL4AT
X-Message-ID-Hash: 4CDK74GZ2YN5KMRD3YUJXGF5XFSUL4AT
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:51:32 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CDK74GZ2YN5KMRD3YUJXGF5XFSUL4AT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There is a few things done:
- include only the headers we are direct user of
- when pointer is in use, provide a forward declaration
- add missing headers
- group generic headers and subsystem headers
- sort each group alphabetically

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/spi/spi.h | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 2026eae97329..c9479badf38c 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -6,27 +6,41 @@
 #ifndef __LINUX_SPI_H
 #define __LINUX_SPI_H
 
-#include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/completion.h>
+#include <linux/container_of.h>
 #include <linux/device.h>
-#include <linux/gpio/consumer.h>
+#include <linux/export.h>
 #include <linux/kthread.h>
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/smp.h>
+#include <linux/spinlock_types.h>
+#include <linux/string.h>
+#include <linux/types.h>
 #include <linux/u64_stats_sync.h>
 
+#include <asm/byteorder.h>
+
 #include <uapi/linux/spi/spi.h>
 
+struct acpi_device;
 struct dma_chan;
-struct software_node;
+struct gpio_desc;
 struct ptp_system_timestamp;
+struct software_node;
+
 struct spi_controller;
-struct spi_transfer;
 struct spi_controller_mem_ops;
 struct spi_controller_mem_caps;
+struct spi_device_id;
 struct spi_message;
+struct spi_transfer;
 
 /*
  * INTERFACES between SPI master-side drivers and SPI slave protocol handlers,
-- 
2.40.0.1.gaa8946217a0b

