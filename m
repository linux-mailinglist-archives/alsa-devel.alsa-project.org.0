Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5D74D386
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 12:31:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17F3EA4B;
	Mon, 10 Jul 2023 12:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17F3EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688985074;
	bh=UcwkOydYrSjyDo6SStNIT6kPqq10Rd6pUpZ9iNE8Ekk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZtspP41nw6h0lxE5WFalKI7Hci9nppJKilF3Ro6P898S359WbNLIUFsg45ibeAidY
	 ZIV8HCYP5UDHQEjTleSr5UTReKcnS6wFHVY5tgs6N4GT3qrA7jOO/fGu9O6ZB9hIoP
	 MucYExvm6kzP7Fy3DI5ff139z9jPUzu87CEWmDNA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 202FFF80553; Mon, 10 Jul 2023 12:30:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98859F8053B;
	Mon, 10 Jul 2023 12:30:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9F44F80557; Mon, 10 Jul 2023 12:30:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 243B8F80249
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 12:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 243B8F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X/VU2PO6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688984884; x=1720520884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UcwkOydYrSjyDo6SStNIT6kPqq10Rd6pUpZ9iNE8Ekk=;
  b=X/VU2PO6vd6HxKnbrsNN0/BvjrRXa46R1jen/vPcLE+JR67dEe3D8oa/
   h2Eoxrv/3tvOVOyZvg/exv+wmLqB+5AEHoyUJmxMkEExCr+nVZDSQqccR
   5VkXoIGSgLdcOAmJrIEhi2dMXhWqQPV1OaVyjCeIRZew39MwAMjSPdVab
   QAklA/kQBPNj4vnU6Es7OI6VNYk5j7eoMLyew9vf3q4y0PRem8+Gzstfj
   099GYCU+eaZPXw7c4DdCH+WTR3LFwVgSbhDge+yiqHqPf00jc4hqAgPj5
   MTz/PZwFvSHcVR2heMZHmkMeNcWm5YANk317ZIUVk0BXz469IWxuS29fO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="364345471"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="364345471"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:28:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865297556"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="865297556"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 03:27:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4C598604; Mon, 10 Jul 2023 13:27:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedTS.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org
Cc: Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH v1 6/8] spi: Clean up headers
Date: Mon, 10 Jul 2023 13:27:49 +0300
Message-Id: <20230710102751.83314-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PEFBKP467JLEW4YSP5GNIOSWK3WR6OH4
X-Message-ID-Hash: PEFBKP467JLEW4YSP5GNIOSWK3WR6OH4
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEFBKP467JLEW4YSP5GNIOSWK3WR6OH4/>
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
index becad31aeea2..8e7fc0f21714 100644
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

