Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE974D375
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 12:29:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A580A845;
	Mon, 10 Jul 2023 12:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A580A845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688984976;
	bh=i+Jmb8Ni5ZNMBB74vGh9B4SucNYBPaQ0rpIJBqbWbw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fhEceK13fXvA+cZJOVfvR0o3ErDb+wZJ+oIcW/NEH6lCf4E8YF0AsMNowbzPuU1Z8
	 0pVOA51x5S/i4MMWgh3nb8D5/aXrX2NPnO0/Y4/NJr0oGeMs6O3U888Jxz9+MVsf/W
	 isG0JaTW7tpT0VgDwvfZkAk4AFKIU0NHJDs3hbOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6934F80568; Mon, 10 Jul 2023 12:28:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15C0CF80558;
	Mon, 10 Jul 2023 12:28:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0B9DF80535; Mon, 10 Jul 2023 12:28:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EFE0FF80153
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 12:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFE0FF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FDtKyoBi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688984883; x=1720520883;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i+Jmb8Ni5ZNMBB74vGh9B4SucNYBPaQ0rpIJBqbWbw0=;
  b=FDtKyoBi8QW4E+1n80ihnj5fLyiMXep4DiYiix8sJfwJcWwAeG7Ywq99
   9bYicsy+P1Q1Jk7KaL2P6qq+wc0A5ozG+GcAUfUAnbLjuMxX9Pw37LFPT
   /mWh7RTcszN37sUpWWP9B5NBqWqJnnsxfG/L7zzWgTktJGOWrsSffA4mQ
   XorL6MH77oPWUCRdbrlVH42txtWQKfQad8O07Z4CJbw2miYAWiUaNYpkY
   gWwaaD4ojPbB0iBvMLkodCRlFCXuLSYPNDhtrx3F1ASg2zNO9/lID4WMB
   xKz1nn/KQirjB8EsG575jwHdYOv5e1jZjy/r7IvfbUiq6Vm7MCYSF7ITH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="364345427"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="364345427"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865297524"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="865297524"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 03:27:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 18E8C3E3; Mon, 10 Jul 2023 13:27:53 +0300 (EEST)
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
Subject: [PATCH v1 3/8] spi: Use sysfs_emit() to instead of s*printf()
Date: Mon, 10 Jul 2023 13:27:46 +0300
Message-Id: <20230710102751.83314-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GCUBR5AESRBN5K5CYTTDPWC7OIEJKQYG
X-Message-ID-Hash: GCUBR5AESRBN5K5CYTTDPWC7OIEJKQYG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCUBR5AESRBN5K5CYTTDPWC7OIEJKQYG/>
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
index 6d74218cf38e..0f05773c277c 100644
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
@@ -2814,8 +2814,7 @@ static ssize_t slave_show(struct device *dev, struct device_attribute *attr,
 	struct device *child;
 
 	child = device_find_any_child(&ctlr->dev);
-	return sprintf(buf, "%s\n",
-		       child ? to_spi_device(child)->modalias : NULL);
+	return sysfs_emit(buf, "%s\n", child ? to_spi_device(child)->modalias : NULL);
 }
 
 static ssize_t slave_store(struct device *dev, struct device_attribute *attr,
-- 
2.40.0.1.gaa8946217a0b

