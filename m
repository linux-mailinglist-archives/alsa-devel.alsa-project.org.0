Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ABE3699B5
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 20:31:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06F711741;
	Fri, 23 Apr 2021 20:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06F711741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619202675;
	bh=Eow7T4182eUiR0GIBEOlqKwtSncKX3IE56AMTup06VU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M0uBLZPc25kS6UrjISbQogIouCWHCTVVw2/LJoNcfAAY1ybh/gs2CcqTEOgVAAdti
	 XPAcehilK6J9XswDCR8vJNSr/4xZs3xNC9WrwmnFIfmA+VOGy+YFPtFI56mD9Ro39O
	 E7ZXOu4n/zQf7bndMiLlM3vnXO8t2PvG+kBGWulo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CEBDF8051A;
	Fri, 23 Apr 2021 20:25:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6688AF804D8; Fri, 23 Apr 2021 20:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34FF8F80482
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 20:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34FF8F80482
IronPort-SDR: eW5im7XdbuNtFRXgKcv6DAtg3UJX4HUylA9Dprl6jdNB52FLw5U8fCSHk6qW/AzXmSEB4g/zEH
 LqDfAtAWYNwA==
X-IronPort-AV: E=McAfee;i="6200,9189,9963"; a="175599636"
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="175599636"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2021 11:24:35 -0700
IronPort-SDR: BiUAX/woJ2CsWWo5xQ1NpwsTDZLeRZGuwQzgL0rcgUuF9Lszhl+CE5Uk1cPKrHoZTMf9Dj1hQe
 L4zSuoDDIlOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,246,1613462400"; d="scan'208";a="402266298"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 23 Apr 2021 11:24:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 1EC921FC; Fri, 23 Apr 2021 21:24:45 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 05/14] spi: pxa2xx: Unify ifdeffery used in the headers
Date: Fri, 23 Apr 2021 21:24:32 +0300
Message-Id: <20210423182441.50272-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

The two headers have quite different ifdeffery to prevent multiple inclusion.
Unify them with the pattern that in particular reflects their location.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/pxa2xx_ssp.h     | 6 +++---
 include/linux/spi/pxa2xx_spi.h | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/pxa2xx_ssp.h b/include/linux/pxa2xx_ssp.h
index 7f73b26ed22e..14b049840faf 100644
--- a/include/linux/pxa2xx_ssp.h
+++ b/include/linux/pxa2xx_ssp.h
@@ -11,8 +11,8 @@
  *       PXA3xx     SSP1, SSP2, SSP3, SSP4
  */
 
-#ifndef __LINUX_SSP_H
-#define __LINUX_SSP_H
+#ifndef __LINUX_PXA2XX_SSP_H
+#define __LINUX_PXA2XX_SSP_H
 
 #include <linux/bits.h>
 #include <linux/compiler_types.h>
@@ -270,4 +270,4 @@ static inline struct ssp_device *pxa_ssp_request_of(const struct device_node *n,
 static inline void pxa_ssp_free(struct ssp_device *ssp) {}
 #endif
 
-#endif
+#endif	/* __LINUX_PXA2XX_SSP_H */
diff --git a/include/linux/spi/pxa2xx_spi.h b/include/linux/spi/pxa2xx_spi.h
index 1e0e2f136319..12ef04d0896d 100644
--- a/include/linux/spi/pxa2xx_spi.h
+++ b/include/linux/spi/pxa2xx_spi.h
@@ -2,8 +2,8 @@
 /*
  * Copyright (C) 2005 Stephen Street / StreetFire Sound Labs
  */
-#ifndef __linux_pxa2xx_spi_h
-#define __linux_pxa2xx_spi_h
+#ifndef __LINUX_SPI_PXA2XX_SPI_H
+#define __LINUX_SPI_PXA2XX_SPI_H
 
 #include <linux/types.h>
 
@@ -51,4 +51,5 @@ struct pxa2xx_spi_chip {
 extern void pxa2xx_set_spi_info(unsigned id, struct pxa2xx_spi_controller *info);
 
 #endif
-#endif
+
+#endif	/* __LINUX_SPI_PXA2XX_SPI_H */
-- 
2.30.2

