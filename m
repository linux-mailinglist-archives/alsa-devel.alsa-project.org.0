Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D948673DD59
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:22:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B4DF843;
	Mon, 26 Jun 2023 13:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B4DF843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687778560;
	bh=+NDzjzg+Ni//gNmFZKyOgL7uxanPfC14OsbzNCq8wzw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oXXzsWv/G4lq4dVyRDNL/kI51AM/pxD/Jl+zTNWVMXNKA+MMTbIRREClhh5/RPAK1
	 vF3feb3g6PUkOm6sWmVnHTPIOQOmi6Oz7p/7xLUDLXHTCTKNlws8qCudu2taahJczB
	 xzgF5mw8YpOc9uq4xagURTF94pu5lk8GWuynhnwg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8A10F8057D; Mon, 26 Jun 2023 13:20:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 279E3F80579;
	Mon, 26 Jun 2023 13:20:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5866BF80141; Fri, 23 Jun 2023 22:36:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7B5FF8003A
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 22:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7B5FF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=HH3trU7X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687552590; x=1719088590;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+NDzjzg+Ni//gNmFZKyOgL7uxanPfC14OsbzNCq8wzw=;
  b=HH3trU7X+T6FYB93NWVI1mdPfvHXUs3hd1iKDj/WCHumVg8BSOoQy2dL
   r5hrM1FED0+OsSODxfwC8HQ0ZgFgzo6RIdO124bRt69ObfuYabCS/TCPf
   5LgqEL6t1l8fzH+qMs0+vsGwYo340QtSYgmHT/+ClT9YQQDDBWoj/Ut6r
   Gwspwb0/Dhn3RfdbTG8LBLqhg8S3FxcMa/NNer9z7/fawNO8xd2wG3n1o
   I7Vv8a3xdeMt7G6cS/MhCkzBfc34Jv+jJBfp6h1P14uj1El4DNKcqDvyQ
   Qv1W0v4bx417csEDKXghQilO7SM5Z7w/b/peCjKlS65/u/x3m7gtZjRpq
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200";
   d="scan'208";a="158362094"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Jun 2023 13:36:26 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 13:36:21 -0700
Received: from che-lt-i67070.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Fri, 23 Jun 2023 13:35:53 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@microchip.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <vkoul@kernel.org>, <tglx@linutronix.de>,
	<maz@kernel.org>, <lee@kernel.org>, <ulf.hansson@linaro.org>,
	<tudor.ambarus@linaro.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<olivia@selenic.com>, <a.zummo@towertech.it>, <radu_nicolae.pirea@upb.ro>,
	<richard.genoud@gmail.com>, <gregkh@linuxfoundation.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>, <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<linux@armlinux.org.uk>, <sre@kernel.org>, <jerry.ray@microchip.com>,
	<horatiu.vultur@microchip.com>, <durai.manickamkr@microchip.com>,
	<varshini.rajendran@microchip.com>, <andrew@lunn.ch>,
	<alain.volmat@foss.st.com>, <neil.armstrong@linaro.org>,
	<mihai.sain@microchip.com>, <eugen.hristev@collabora.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-pm@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <cristian.birsan@microchip.com>,
	<balamanikandan.gunasundar@microchip.com>, <manikandan.m@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>
Subject: [PATCH v2 10/45] clk: at91: sama7g5: move mux table macros to header
 file
Date: Sat, 24 Jun 2023 02:00:21 +0530
Message-ID: <20230623203056.689705-11-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: Varshini.Rajendran@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4XNOBXAEXQ6TRQQYHPPIOFHBGSEVAKW2
X-Message-ID-Hash: 4XNOBXAEXQ6TRQQYHPPIOFHBGSEVAKW2
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:20:27 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XNOBXAEXQ6TRQQYHPPIOFHBGSEVAKW2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the mux table init and fill macro function definitions from the
sama7g5 pmc driver to the pmc.h header file since they will be used
by other SoC's pmc drivers as well like sam9x7.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/clk/at91/pmc.h     | 16 ++++++++++++++++
 drivers/clk/at91/sama7g5.c | 35 ++++++++++-------------------------
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
index 1dd01f30bdee..f3c23ff0da02 100644
--- a/drivers/clk/at91/pmc.h
+++ b/drivers/clk/at91/pmc.h
@@ -121,6 +121,22 @@ struct at91_clk_pms {
 
 #define ndck(a, s) (a[s - 1].id + 1)
 #define nck(a) (a[ARRAY_SIZE(a) - 1].id + 1)
+
+#define PMC_INIT_TABLE(_table, _count)		\
+	do {						\
+		u8 _i;					\
+		for (_i = 0; _i < (_count); _i++)	\
+			(_table)[_i] = _i;		\
+	} while (0)
+
+#define PMC_FILL_TABLE(_to, _from, _count)		\
+	do {						\
+		u8 _i;					\
+		for (_i = 0; _i < (_count); _i++) {	\
+			(_to)[_i] = (_from)[_i];	\
+		}					\
+	} while (0)
+
 struct pmc_data *pmc_data_allocate(unsigned int ncore, unsigned int nsystem,
 				   unsigned int nperiph, unsigned int ngck,
 				   unsigned int npck);
diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
index 468a3c5449b5..75011df708cc 100644
--- a/drivers/clk/at91/sama7g5.c
+++ b/drivers/clk/at91/sama7g5.c
@@ -16,21 +16,6 @@
 
 #include "pmc.h"
 
-#define SAMA7G5_INIT_TABLE(_table, _count)		\
-	do {						\
-		u8 _i;					\
-		for (_i = 0; _i < (_count); _i++)	\
-			(_table)[_i] = _i;		\
-	} while (0)
-
-#define SAMA7G5_FILL_TABLE(_to, _from, _count)		\
-	do {						\
-		u8 _i;					\
-		for (_i = 0; _i < (_count); _i++) {	\
-			(_to)[_i] = (_from)[_i];	\
-		}					\
-	} while (0)
-
 static DEFINE_SPINLOCK(pmc_pll_lock);
 static DEFINE_SPINLOCK(pmc_mck0_lock);
 static DEFINE_SPINLOCK(pmc_mckX_lock);
@@ -1022,11 +1007,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 		if (!mux_table)
 			goto err_free;
 
-		SAMA7G5_INIT_TABLE(mux_table, 3);
-		SAMA7G5_FILL_TABLE(&mux_table[3], sama7g5_mckx[i].ep_mux_table,
-				   sama7g5_mckx[i].ep_count);
-		SAMA7G5_FILL_TABLE(&parent_names[3], sama7g5_mckx[i].ep,
-				   sama7g5_mckx[i].ep_count);
+		PMC_INIT_TABLE(mux_table, 3);
+		PMC_FILL_TABLE(&mux_table[3], sama7g5_mckx[i].ep_mux_table,
+			       sama7g5_mckx[i].ep_count);
+		PMC_FILL_TABLE(&parent_names[3], sama7g5_mckx[i].ep,
+			       sama7g5_mckx[i].ep_count);
 
 		hw = at91_clk_sama7g5_register_master(regmap, sama7g5_mckx[i].n,
 				   num_parents, parent_names, mux_table,
@@ -1109,11 +1094,11 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
 		if (!mux_table)
 			goto err_free;
 
-		SAMA7G5_INIT_TABLE(mux_table, 3);
-		SAMA7G5_FILL_TABLE(&mux_table[3], sama7g5_gck[i].pp_mux_table,
-				   sama7g5_gck[i].pp_count);
-		SAMA7G5_FILL_TABLE(&parent_names[3], sama7g5_gck[i].pp,
-				   sama7g5_gck[i].pp_count);
+		PMC_INIT_TABLE(mux_table, 3);
+		PMC_FILL_TABLE(&mux_table[3], sama7g5_gck[i].pp_mux_table,
+			       sama7g5_gck[i].pp_count);
+		PMC_FILL_TABLE(&parent_names[3], sama7g5_gck[i].pp,
+			       sama7g5_gck[i].pp_count);
 
 		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
 						 &sama7g5_pcr_layout,
-- 
2.25.1

