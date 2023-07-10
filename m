Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1137274F0BB
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:53:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 982FBE7E;
	Tue, 11 Jul 2023 15:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 982FBE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083623;
	bh=wJa3Jmu6iVXPZMGevJvu2fkKY/Gm2mVbHm4RgDFco0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N0GRSYDpALqhU10b2Hp60E2ACsPRpzj3CPryo93tDvqrjvzbk6nCLUTkCzqRT0dku
	 b0DmEY6kIbfdUxEfruNvJY4Zf7tn9eI9C4JPbxLO97+QHsmxpXZ8bVIRBwx8HZwZ5E
	 zCVUVfFn8lEaxWnL5NxgvFX/V/+Uj/QE07OuBeKM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DA5BF805AB; Tue, 11 Jul 2023 15:51:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD9E2F805A1;
	Tue, 11 Jul 2023 15:51:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64F45F80552; Mon, 10 Jul 2023 17:49:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EBB8F80093
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 17:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EBB8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WZWOhrai
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689004186; x=1720540186;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wJa3Jmu6iVXPZMGevJvu2fkKY/Gm2mVbHm4RgDFco0c=;
  b=WZWOhraiCucTKcs980iFImvTCeat+CP5EDoobssokgnBKUOpW1MmNIrA
   rtIEuDynE3kMnqrOLu1TncOkaZEtNq5jM5kHOH+KkBZSOQ/jV0GOXX05W
   gqGCAgb6dUp/HOgBVZ/tjHsdmCTnrD1ey1nJavYbuAY+ow5JPNHqgUIe3
   drr9paKf3OGjcoDhVTxJXZVGWIQltvHvohKJDqcRwg7BnED2t25EMeSD3
   0TYwE/uCjZmnYrFVsjVyNpFbcSacbpXxR3/j0s0iO6ae7En0BN8odD2rl
   atjOBPR4iWJGg7nfU4ddDcxBg/DDCy8f1gxsJ+Dz9FSe8ROPOXFsP/Y9Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="349185334"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="349185334"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 08:49:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="844921834"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="844921834"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 10 Jul 2023 08:49:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5A18C4BD; Mon, 10 Jul 2023 18:49:34 +0300 (EEST)
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
Subject: [PATCH v2 04/15] spi: Replace open coded
 spi_controller_xfer_timeout()
Date: Mon, 10 Jul 2023 18:49:21 +0300
Message-Id: <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
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
Message-ID-Hash: PFCTZZSPF7BHMQZ5A6FR37XMLDMF6BA5
X-Message-ID-Hash: PFCTZZSPF7BHMQZ5A6FR37XMLDMF6BA5
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:51:32 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PFCTZZSPF7BHMQZ5A6FR37XMLDMF6BA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Since the new spi_controller_xfer_timeout() helper appeared,
we may replace open coded variant in spi_transfer_wait().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c       | 25 ++-----------------------
 include/linux/spi/spi.h |  6 +++++-
 2 files changed, 7 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 125dea8fae00..c99ee4164f11 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1342,8 +1342,7 @@ static int spi_transfer_wait(struct spi_controller *ctlr,
 {
 	struct spi_statistics __percpu *statm = ctlr->pcpu_statistics;
 	struct spi_statistics __percpu *stats = msg->spi->pcpu_statistics;
-	u32 speed_hz = xfer->speed_hz;
-	unsigned long long ms;
+	unsigned long ms;
 
 	if (spi_controller_is_slave(ctlr)) {
 		if (wait_for_completion_interruptible(&ctlr->xfer_completion)) {
@@ -1351,29 +1350,9 @@ static int spi_transfer_wait(struct spi_controller *ctlr,
 			return -EINTR;
 		}
 	} else {
-		if (!speed_hz)
-			speed_hz = 100000;
-
-		/*
-		 * For each byte we wait for 8 cycles of the SPI clock.
-		 * Since speed is defined in Hz and we want milliseconds,
-		 * use respective multiplier, but before the division,
-		 * otherwise we may get 0 for short transfers.
-		 */
-		ms = 8LL * MSEC_PER_SEC * xfer->len;
-		do_div(ms, speed_hz);
-
-		/*
-		 * Increase it twice and add 200 ms tolerance, use
-		 * predefined maximum in case of overflow.
-		 */
-		ms += ms + 200;
-		if (ms > UINT_MAX)
-			ms = UINT_MAX;
-
+		ms = spi_controller_xfer_timeout(ctlr, xfer);
 		ms = wait_for_completion_timeout(&ctlr->xfer_completion,
 						 msecs_to_jiffies(ms));
-
 		if (ms == 0) {
 			SPI_STATISTICS_INCREMENT_FIELD(statm, timedout);
 			SPI_STATISTICS_INCREMENT_FIELD(stats, timedout);
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 32c94eae8926..0ce1cb18a076 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1270,12 +1270,16 @@ static inline bool spi_is_bpw_supported(struct spi_device *spi, u32 bpw)
  * that it would take on a single data line and take twice this amount of time
  * with a minimum of 500ms to avoid false positives on loaded systems.
  *
+ * Assume speed to be 100 kHz if it's not defined at the time of invocation.
+ *
  * Returns: Transfer timeout value in milliseconds.
  */
 static inline unsigned int spi_controller_xfer_timeout(struct spi_controller *ctlr,
 						       struct spi_transfer *xfer)
 {
-	return max(xfer->len * 8 * 2 / (xfer->speed_hz / 1000), 500U);
+	u32 speed_hz = xfer->speed_hz ?: 100000;
+
+	return max(xfer->len * 8 * 2 / (speed_hz / 1000), 500U);
 }
 
 /*---------------------------------------------------------------------------*/
-- 
2.40.0.1.gaa8946217a0b

