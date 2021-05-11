Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF0837A8F7
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:20:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0F0617E4;
	Tue, 11 May 2021 16:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0F0617E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620742819;
	bh=X/521WVoVX/AVAu9wYUR1iQmS47JSF+INK4Ltr9nKKM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jhZ2i9aOL8cR74xlSyfc3OSM1SZNPtcz13rLwVlZK6ok+8Bdq4GdxtVOvVBJrpDg/
	 g330W3HiRCDLmY4SHki6oSw+oXoD2EoE8ekDF3pM5/2+8frlDFEvaf3kIeoLcDf0p8
	 A8gSxbhY19oavJjwWZdijqa8PR/xJR2LA2aw7kPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF815F804AD;
	Tue, 11 May 2021 16:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DDC4F800E9; Tue, 11 May 2021 16:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DD36F80163
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DD36F80163
IronPort-SDR: WvCTg3Z8rECc/32nK38PtdO9bX35954+ClRUiB8qkucfp/tUSyUAUNCBctJQDejYorjsLf6jD6
 2w9bYyN0qdxQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="186892249"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="186892249"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 07:17:14 -0700
IronPort-SDR: VyT/2y6qXkkJZi0XmfugZaBYQh1RuvWOKYyLo2yIbq4v7qYat3PQxf6f2epjveWEOfaQpmFbuf
 pmOsVCIKIjfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="541661836"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 11 May 2021 07:17:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9F61450E; Tue, 11 May 2021 17:17:27 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH v3 8/8] spi: Convert to use predefined time multipliers
Date: Tue, 11 May 2021 17:17:25 +0300
Message-Id: <20210511141725.32097-9-andriy.shevchenko@linux.intel.com>
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

We have a lot of hard coded values in nanoseconds or other units.
Use predefined constants to make it more clear.

While at it, add or amend comments in the corresponding functions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 41 ++++++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 2350d131871b..9160e9e52aae 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1118,10 +1118,20 @@ static int spi_transfer_wait(struct spi_controller *ctlr,
 		if (!speed_hz)
 			speed_hz = 100000;
 
-		ms = 8LL * 1000LL * xfer->len;
+		/*
+		 * For each byte we wait for 8 cycles of the SPI clock.
+		 * Since speed is defined in Hz and we want milliseconds,
+		 * use respective multiplier, but before the division,
+		 * otherwise we may get 0 for short transfers.
+		 */
+		ms = 8LL * MSEC_PER_SEC * xfer->len;
 		do_div(ms, speed_hz);
-		ms += ms + 200; /* some tolerance */
 
+		/*
+		 * Increase it twice and add 200 ms tolerance, use
+		 * predefined maximum in case of overflow.
+		 */
+		ms += ms + 200;
 		if (ms > UINT_MAX)
 			ms = UINT_MAX;
 
@@ -1144,10 +1154,10 @@ static void _spi_transfer_delay_ns(u32 ns)
 {
 	if (!ns)
 		return;
-	if (ns <= 1000) {
+	if (ns <= NSEC_PER_USEC) {
 		ndelay(ns);
 	} else {
-		u32 us = DIV_ROUND_UP(ns, 1000);
+		u32 us = DIV_ROUND_UP(ns, NSEC_PER_USEC);
 
 		if (us <= 10)
 			udelay(us);
@@ -1167,21 +1177,25 @@ int spi_delay_to_ns(struct spi_delay *_delay, struct spi_transfer *xfer)
 
 	switch (unit) {
 	case SPI_DELAY_UNIT_USECS:
-		delay *= 1000;
+		delay *= NSEC_PER_USEC;
 		break;
-	case SPI_DELAY_UNIT_NSECS: /* nothing to do here */
+	case SPI_DELAY_UNIT_NSECS:
+		/* Nothing to do here */
 		break;
 	case SPI_DELAY_UNIT_SCK:
 		/* clock cycles need to be obtained from spi_transfer */
 		if (!xfer)
 			return -EINVAL;
-		/* if there is no effective speed know, then approximate
-		 * by underestimating with half the requested hz
+		/*
+		 * If there is unknown effective speed, approximate it
+		 * by underestimating with half of the requested hz.
 		 */
 		hz = xfer->effective_speed_hz ?: xfer->speed_hz / 2;
 		if (!hz)
 			return -EINVAL;
-		delay *= DIV_ROUND_UP(1000000000, hz);
+
+		/* Convert delay to nanoseconds */
+		delay *= DIV_ROUND_UP(NSEC_PER_SEC, hz);
 		break;
 	default:
 		return -EINVAL;
@@ -1213,6 +1227,7 @@ EXPORT_SYMBOL_GPL(spi_delay_exec);
 static void _spi_transfer_cs_change_delay(struct spi_message *msg,
 					  struct spi_transfer *xfer)
 {
+	u32 default_delay_ns = 10 * NSEC_PER_USEC;
 	u32 delay = xfer->cs_change_delay.value;
 	u32 unit = xfer->cs_change_delay.unit;
 	int ret;
@@ -1220,16 +1235,16 @@ static void _spi_transfer_cs_change_delay(struct spi_message *msg,
 	/* return early on "fast" mode - for everything but USECS */
 	if (!delay) {
 		if (unit == SPI_DELAY_UNIT_USECS)
-			_spi_transfer_delay_ns(10000);
+			_spi_transfer_delay_ns(default_delay_ns);
 		return;
 	}
 
 	ret = spi_delay_exec(&xfer->cs_change_delay, xfer);
 	if (ret) {
 		dev_err_once(&msg->spi->dev,
-			     "Use of unsupported delay unit %i, using default of 10us\n",
-			     unit);
-		_spi_transfer_delay_ns(10000);
+			     "Use of unsupported delay unit %i, using default of %luus\n",
+			     unit, default_delay_ns / NSEC_PER_USEC);
+		_spi_transfer_delay_ns(default_delay_ns);
 	}
 }
 
-- 
2.30.2

