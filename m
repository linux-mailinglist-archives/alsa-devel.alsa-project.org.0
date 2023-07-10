Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D563174D36D
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 12:29:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E66A5206;
	Mon, 10 Jul 2023 12:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E66A5206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688984947;
	bh=REWyC/nAC6Z96ggpA1NLsyDE3cGETw1DuCTFixDA/T8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d4arTeXQTJTvsBvW+8M21YQveVtJK/wNlvf0XGxDk08B7Bj36TW5Piq7jZbRKTgv7
	 NGsEmwnYofC4RhNPawlrl0lkXBTLTB2NBpngGqN4wi/ELmuaXFeGXG7Fv8xRf7eNhe
	 FrQx/vA/SAk8qezrR67tvzzc4E3xoTr8Kpd1VCfo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8ECEF80548; Mon, 10 Jul 2023 12:28:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 279EDF80535;
	Mon, 10 Jul 2023 12:28:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0552BF80535; Mon, 10 Jul 2023 12:28:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17465F800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 12:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17465F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Uua5wXKX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688984879; x=1720520879;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=REWyC/nAC6Z96ggpA1NLsyDE3cGETw1DuCTFixDA/T8=;
  b=Uua5wXKXQiJGupqxRTclm303oaos49MT1ZHeVQ0vdsOvb8hC4pd+XIrS
   bdwFEmoVgfZXt04X9rmcFH6fybrDn/tRyOOzbimIIwD1dLn74RJ3GUUSx
   Nt6M+5aOQDBWard0jYGlx4qjapF6ou+gaRfFwPjtvDDgt8XgTBNi5fp0i
   CcQ2LAIyxiLkKf8w9qWBhW3kiN2UPD1FDuqaYoq/UM/6tfEy+u1wCBPRt
   KgHXKCWx8TX7KB4yIa/a8gaHFA5nJP6LxoJl7qHl9TuT3x1o9HFITC62Z
   dwyaFUimkTtLkfJD0CZ6eJ2uIaGiHahXy/0prqkA/oJsRbCz7zT6kjSaJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="364345397"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="364345397"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 03:27:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="865297523"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="865297523"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2023 03:27:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0244B379; Mon, 10 Jul 2023 13:27:52 +0300 (EEST)
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
Subject: [PATCH v1 2/8] spi: Drop duplicate IDR allocation code in
 spi_register_controller()
Date: Mon, 10 Jul 2023 13:27:45 +0300
Message-Id: <20230710102751.83314-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XMEP6I7FBO37ARFF44O5J7DFZGZFYB5Q
X-Message-ID-Hash: XMEP6I7FBO37ARFF44O5J7DFZGZFYB5Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XMEP6I7FBO37ARFF44O5J7DFZGZFYB5Q/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor spi_register_controller() to drop duplicate IDR allocation.
Instead of if-else-if branching use two sequential if:s, which allows
to re-use the logic of IDR allocation in all cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 50 ++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 8f3282a71c63..6d74218cf38e 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3081,6 +3081,20 @@ static int spi_controller_check_ops(struct spi_controller *ctlr)
 	return 0;
 }
 
+/* Allocate dynamic bus number using Linux idr */
+static int spi_controller_id_alloc(struct spi_controller *ctlr, int start, int end)
+{
+	int id;
+
+	mutex_lock(&board_lock);
+	id = idr_alloc(&spi_master_idr, ctlr, start, end, GFP_KERNEL);
+	mutex_unlock(&board_lock);
+	if (WARN(id < 0, "couldn't get idr"))
+		return id == -ENOSPC ? -EBUSY : id;
+	ctlr->bus_num = id;
+	return 0;
+}
+
 /**
  * spi_register_controller - register SPI master or slave controller
  * @ctlr: initialized master, originally from spi_alloc_master() or
@@ -3108,8 +3122,8 @@ int spi_register_controller(struct spi_controller *ctlr)
 {
 	struct device		*dev = ctlr->dev.parent;
 	struct boardinfo	*bi;
+	int			first_dynamic;
 	int			status;
-	int			id, first_dynamic;
 
 	if (!dev)
 		return -ENODEV;
@@ -3122,27 +3136,13 @@ int spi_register_controller(struct spi_controller *ctlr)
 	if (status)
 		return status;
 
+	if (ctlr->bus_num < 0)
+		ctlr->bus_num = of_alias_get_id(ctlr->dev.of_node, "spi");
 	if (ctlr->bus_num >= 0) {
 		/* Devices with a fixed bus num must check-in with the num */
-		mutex_lock(&board_lock);
-		id = idr_alloc(&spi_master_idr, ctlr, ctlr->bus_num,
-			ctlr->bus_num + 1, GFP_KERNEL);
-		mutex_unlock(&board_lock);
-		if (WARN(id < 0, "couldn't get idr"))
-			return id == -ENOSPC ? -EBUSY : id;
-		ctlr->bus_num = id;
-	} else {
-		/* Allocate dynamic bus number using Linux idr */
-		id = of_alias_get_id(ctlr->dev.of_node, "spi");
-		if (id >= 0) {
-			ctlr->bus_num = id;
-			mutex_lock(&board_lock);
-			id = idr_alloc(&spi_master_idr, ctlr, ctlr->bus_num,
-				       ctlr->bus_num + 1, GFP_KERNEL);
-			mutex_unlock(&board_lock);
-			if (WARN(id < 0, "couldn't get idr"))
-				return id == -ENOSPC ? -EBUSY : id;
-		}
+		status = spi_controller_id_alloc(ctlr, ctlr->bus_num, ctlr->bus_num + 1);
+		if (status)
+			return status;
 	}
 	if (ctlr->bus_num < 0) {
 		first_dynamic = of_alias_get_highest_id("spi");
@@ -3151,13 +3151,9 @@ int spi_register_controller(struct spi_controller *ctlr)
 		else
 			first_dynamic++;
 
-		mutex_lock(&board_lock);
-		id = idr_alloc(&spi_master_idr, ctlr, first_dynamic,
-			       0, GFP_KERNEL);
-		mutex_unlock(&board_lock);
-		if (WARN(id < 0, "couldn't get idr"))
-			return id;
-		ctlr->bus_num = id;
+		status = spi_controller_id_alloc(ctlr, first_dynamic, 0);
+		if (status)
+			return status;
 	}
 	ctlr->bus_lock_flag = 0;
 	init_completion(&ctlr->xfer_completion);
-- 
2.40.0.1.gaa8946217a0b

