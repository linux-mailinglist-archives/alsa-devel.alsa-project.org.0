Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E03C750963
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:16:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEA8193A;
	Wed, 12 Jul 2023 15:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEA8193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689167781;
	bh=30sabh/p1/O/QZ5qTRNNcuYMznetHRhsRBrUeoewA/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=voR7WFp2+2OQ6jpoSga0hq+91Y+5U6xIso+VRwqZ/7DK3mXrGb8DcbfVk/0R66TOJ
	 1ke0K6QaH51OSNwn7RWX5pNXHsg4fkI0sF/YH0uLEPQlEbLIJu0TrC/jJl5KX5aJz8
	 ngnUfIvbX0CaZxBBvtqbYYB+tm/FRkND8ZHCHt/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86555F805BB; Wed, 12 Jul 2023 15:14:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00CD0F805B2;
	Wed, 12 Jul 2023 15:14:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06F00F8047D; Tue, 11 Jul 2023 19:19:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31BBDF80249
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 19:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31BBDF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cQ0HKQzW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689095965; x=1720631965;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=30sabh/p1/O/QZ5qTRNNcuYMznetHRhsRBrUeoewA/U=;
  b=cQ0HKQzWzFXM114IA++ki3EMQY3A3fJKfufucZ0/3UDDSGwxwFjBdRI8
   EE8nHfbzSeewA4DleCHMrUXxmyF7LyGy0K9h1YWVNBtc9t7KClenLzbaW
   TyaxR0qLpNMv4pkoFaOxG4j8MPmVY2ZJ9ZxclnX5bejOzM3bmsnVNOMCP
   eNWWyQfO9JDqODVDd3zUgdLExHFnzIhU/82uGBJK/1FrdwsPTHzqsqhU+
   FErURbAGK/LRzf41Cq3bS2kSvwRuJJtizQiaDAe+j2UHGuMUG5Wi2BxcF
   86+FvmHJfmO/dHX6OAQwJuxLStkcjjb/GyJeu1O2UfeVzos3L+ChXWHHG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362148806"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200";
   d="scan'208";a="362148806"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 10:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715240816"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200";
   d="scan'208";a="715240816"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 10:17:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0ED90F7; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
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
Subject: [PATCH v3 01/14] spi: Remove unneeded OF node NULL checks
Date: Tue, 11 Jul 2023 20:17:43 +0300
Message-Id: <20230711171756.86736-2-andriy.shevchenko@linux.intel.com>
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
Message-ID-Hash: 7FVGMGZWLHES7TRQYBVDAWQRRIGOUW3F
X-Message-ID-Hash: 7FVGMGZWLHES7TRQYBVDAWQRRIGOUW3F
X-Mailman-Approved-At: Wed, 12 Jul 2023 13:13:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FVGMGZWLHES7TRQYBVDAWQRRIGOUW3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In the couple of places the NULL check of OF node is implied by the call
that takes it as a parameter. Drop the respective duplicate checks.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # MediaTek
---
 drivers/spi/spi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 9291b2a0e887..8f3282a71c63 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2399,9 +2399,6 @@ static void of_register_spi_devices(struct spi_controller *ctlr)
 	struct spi_device *spi;
 	struct device_node *nc;
 
-	if (!ctlr->dev.of_node)
-		return;
-
 	for_each_available_child_of_node(ctlr->dev.of_node, nc) {
 		if (of_node_test_and_set_flag(nc, OF_POPULATED))
 			continue;
@@ -3134,7 +3131,7 @@ int spi_register_controller(struct spi_controller *ctlr)
 		if (WARN(id < 0, "couldn't get idr"))
 			return id == -ENOSPC ? -EBUSY : id;
 		ctlr->bus_num = id;
-	} else if (ctlr->dev.of_node) {
+	} else {
 		/* Allocate dynamic bus number using Linux idr */
 		id = of_alias_get_id(ctlr->dev.of_node, "spi");
 		if (id >= 0) {
-- 
2.40.0.1.gaa8946217a0b

