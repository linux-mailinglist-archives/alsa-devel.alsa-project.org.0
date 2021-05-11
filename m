Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C07337A94D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D701117DD;
	Tue, 11 May 2021 16:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D701117DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620743415;
	bh=ohc8cboGqVkjbGl0AeQePqh/S6Qv5BQqUh3MUn92rJ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sM0SidKcXY/v4a2U2HiOa4gUQbU+i4xVH/g3DbLvEp4Qe1C1U98382ktNhGcJHMWx
	 bJbVUHCMnaSWHKLiQVxVeAldCfotaQFH/ckJeNFUP80cxc0rwOchm9frt2fushFO/V
	 fC2AhU3esC11BGudWDbQof9gk1+IxfUbBnKnreFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 403B0F804AE;
	Tue, 11 May 2021 16:27:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC0C7F80475; Tue, 11 May 2021 16:27:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81531F80279
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81531F80279
IronPort-SDR: Khu8ko3QZXd/CDzFtf3+Vmjb/RAS46OA6XmAsLCcZcpBBp6lcs3J8W4Y3alTQDq9xn/pb3X/oM
 WL5cmDgSII2w==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="220414699"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="220414699"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:26:59 -0700
IronPort-SDR: ImYXYNLzB6X5YiJDYYK2F4tubeNJXhm3632OCbX4A3/dKYBWlm0M/Tx+k3qALVWAFFGpAPdOWm
 Qp4JM3gdqdHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="399334109"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 11 May 2021 07:26:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 370C450E; Tue, 11 May 2021 17:27:13 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v4 7/8] spi: pxa2xx: Constify struct driver_data parameter
Date: Tue, 11 May 2021 17:27:10 +0300
Message-Id: <20210511142711.23244-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511142711.23244-1-andriy.shevchenko@linux.intel.com>
References: <20210511142711.23244-1-andriy.shevchenko@linux.intel.com>
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

