Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFFC37A8F4
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A1517E7;
	Tue, 11 May 2021 16:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A1517E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620742781;
	bh=ohc8cboGqVkjbGl0AeQePqh/S6Qv5BQqUh3MUn92rJ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rLYwMLcmE+hpMnDYAxLHIpXDX8UqVLzc/f4AmJquuVgYD9JChQz+BNQUxTXZK3m1F
	 c4IUR0xJngfEnugeToZpkyv71lYv6mqJmZA+bCoFnSspNAmoJPU76Gj56VXHj9c0Oa
	 i48VAk9OvmNzWDqnh3xmaVkg9TT/cWd5jArWTV5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3569F801D5;
	Tue, 11 May 2021 16:17:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF8D4F804AB; Tue, 11 May 2021 16:17:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0921F80245
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0921F80245
IronPort-SDR: S0aFTyV0YPJkvWKV3VjYfrfnGVwQMYI48iEKHYWR8PGGBexURWEsboqj1IejHybuEirTWOOG81
 gYcW9Eh1nURg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="196357530"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="196357530"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:17:14 -0700
IronPort-SDR: PnubEKBfAite/AY61Xjd81s74ay1vk8qVdTt6O69QGJiAFF6zcHk0Zq471QVSXYlxo+6LSfu2b
 +2H3peMnVqkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="468925143"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 11 May 2021 07:17:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 876D8436; Tue, 11 May 2021 17:17:27 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v3 6/8] spi: pxa2xx: Constify struct driver_data parameter
Date: Tue, 11 May 2021 17:17:23 +0300
Message-Id: <20210511141725.32097-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511141725.32097-1-andriy.shevchenko@linux.intel.com>
References: <20210511141725.32097-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
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

In a couple of functions the contents of struct driver_data are not altered,
hence we may constify the respective function parameter.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.h b/drivers/spi/spi-pxa2xx.h
index d2cb40f97c4b..5c6a5e0f249e 100644
--- a/drivers/spi/spi-pxa2xx.h
+++ b/drivers/spi/spi-pxa2xx.h
@@ -93,7 +93,7 @@ static inline void pxa2xx_spi_write(const struct driver_data *drv_data, u32 reg,
 
 #define DMA_ALIGNMENT		8
 
-static inline int pxa25x_ssp_comp(struct driver_data *drv_data)
+static inline int pxa25x_ssp_comp(const struct driver_data *drv_data)
 {
 	switch (drv_data->ssp_type) {
 	case PXA25x_SSP:
@@ -115,7 +115,7 @@ static inline u32 read_SSSR_bits(const struct driver_data *drv_data, u32 bits)
 	return pxa2xx_spi_read(drv_data, SSSR) & bits;
 }
 
-static inline void write_SSSR_CS(struct driver_data *drv_data, u32 val)
+static inline void write_SSSR_CS(const struct driver_data *drv_data, u32 val)
 {
 	if (drv_data->ssp_type == CE4100_SSP ||
 	    drv_data->ssp_type == QUARK_X1000_SSP)
-- 
2.30.2

