Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2A6750954
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:14:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85A4983A;
	Wed, 12 Jul 2023 15:14:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85A4983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689167698;
	bh=OBpaMXqlKhCkVOJrLtrCAoKDX6xSv6wtt6ulz1eFwn0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bLuLsHge6uLbATGqIFdKqIJlLg0IHLafJ3KwuNBTRru0QQvfKWOU5ecz8aPo16puT
	 ACA8yTLouLzzQtpMMC5S5322Ao9RiZQeaOprLLPOjiJtGZ+eCzRWSfhbS0Q59AnLUF
	 Ws3VPV4hRudkBzArLhITjgaOJ8a1Dq9AaxhCiItA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EADAF80153; Wed, 12 Jul 2023 15:13:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C016F8024E;
	Wed, 12 Jul 2023 15:13:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD927F8047D; Tue, 11 Jul 2023 19:19:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA64CF800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 19:19:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA64CF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O7cPhWqI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689095965; x=1720631965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OBpaMXqlKhCkVOJrLtrCAoKDX6xSv6wtt6ulz1eFwn0=;
  b=O7cPhWqIYYRTuNCIrw1g292jS5kU+doxMrHEqP/754Wj9dTFt8SVRGdm
   wJVQGdx+0+G30RXsUGRsWVdy3Bu+p+rcNi8t+dW4XzP7Qfh4vF8u5hFbZ
   zIHHEf7okOgXIe+wOAsiWoxFtvVx+/7fv3qcs4TmtXqqw8IN90Nxzs6wZ
   +iurH2LV6c+PgMe4NjmPO4uk0xKM1NwyL+xVlN8GkKIC2n6pSyTzyUUzb
   dcKO3Ym7e6neOhsvj5gdBplodwesFfeWFHIkMpoEFIN5QXhMdQ5zRYsPL
   4iZM3hnukvSNHJFWQONEzKw5Y03pSH8VS2ob680rVWxO/U1CrM0PuYyi+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362148779"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200";
   d="scan'208";a="362148779"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 10:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715240817"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200";
   d="scan'208";a="715240817"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 10:17:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 22CCB385; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
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
Subject: [PATCH v3 02/14] spi: Deduplicate IDR allocation code in
 spi_register_controller()
Date: Tue, 11 Jul 2023 20:17:44 +0300
Message-Id: <20230711171756.86736-3-andriy.shevchenko@linux.intel.com>
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
Message-ID-Hash: LQDXSSIVMSUIOUDTH4AVAAJARUZDFWVI
X-Message-ID-Hash: LQDXSSIVMSUIOUDTH4AVAAJARUZDFWVI
X-Mailman-Approved-At: Wed, 12 Jul 2023 13:13:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQDXSSIVMSUIOUDTH4AVAAJARUZDFWVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor spi_register_controller() to deduplicate IDR allocation
by introducing a new spi_controller_id_alloc() helper and using it.

For the dynamic ID allocation for the highest OF aliases, this will
shadow the ENOSPC error code as it's done for the other two cases.
It shouldn't be a problem as the result will be the same, we may
not get device ID allocated and flow will fail.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 8f3282a71c63..d8064998aa27 100644
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
@@ -3124,24 +3138,16 @@ int spi_register_controller(struct spi_controller *ctlr)
 
 	if (ctlr->bus_num >= 0) {
 		/* Devices with a fixed bus num must check-in with the num */
-		mutex_lock(&board_lock);
-		id = idr_alloc(&spi_master_idr, ctlr, ctlr->bus_num,
-			ctlr->bus_num + 1, GFP_KERNEL);
-		mutex_unlock(&board_lock);
-		if (WARN(id < 0, "couldn't get idr"))
-			return id == -ENOSPC ? -EBUSY : id;
-		ctlr->bus_num = id;
+		status = spi_controller_id_alloc(ctlr, ctlr->bus_num, ctlr->bus_num + 1);
+		if (status)
+			return status;
 	} else {
 		/* Allocate dynamic bus number using Linux idr */
 		id = of_alias_get_id(ctlr->dev.of_node, "spi");
 		if (id >= 0) {
-			ctlr->bus_num = id;
-			mutex_lock(&board_lock);
-			id = idr_alloc(&spi_master_idr, ctlr, ctlr->bus_num,
-				       ctlr->bus_num + 1, GFP_KERNEL);
-			mutex_unlock(&board_lock);
-			if (WARN(id < 0, "couldn't get idr"))
-				return id == -ENOSPC ? -EBUSY : id;
+			status = spi_controller_id_alloc(ctlr, id, id + 1);
+			if (status)
+				return status;
 		}
 	}
 	if (ctlr->bus_num < 0) {
@@ -3151,13 +3157,9 @@ int spi_register_controller(struct spi_controller *ctlr)
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

