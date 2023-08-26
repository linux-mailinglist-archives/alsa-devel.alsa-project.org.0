Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B20789511
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Aug 2023 11:19:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B18783E;
	Sat, 26 Aug 2023 11:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B18783E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693041554;
	bh=zkV5HXe/Zs+YyvpNmzDc2SV7p/2VCE1A5pp4dVak6Bs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AYYHCFbp1HdBZORip25RtsIad1Qp8EjBv86WaSRim8SLjy7qAcLodb4zdcy6ZOaaq
	 y2VB4Qz+V+uwvk0YqE/2K1f9YHdUlxFHecw0omYYQr12hY1ZARORnZHKAK2YmEUluI
	 iuUg62wkJXteSbjZuaElsxGSKa64ZrROy7ToXlLQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AE00F8025F; Sat, 26 Aug 2023 11:18:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F4BCF800F5;
	Sat, 26 Aug 2023 11:18:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91057F80158; Sat, 26 Aug 2023 11:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id 646B9F800AE
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 11:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 646B9F800AE
X-IronPort-AV: E=Sophos;i="6.02,203,1688396400";
   d="scan'208";a="174030029"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 26 Aug 2023 18:17:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 55BB840F31C8;
	Sat, 26 Aug 2023 18:17:54 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mfd: madera-i2c: Simplify probe()
Date: Sat, 26 Aug 2023 10:17:51 +0100
Message-Id: <20230826091751.51634-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WXIT3DFXKBYSH2Q3WSN367PMRUOAPIN4
X-Message-ID-Hash: WXIT3DFXKBYSH2Q3WSN367PMRUOAPIN4
X-MailFrom: biju.das.jz@bp.renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXIT3DFXKBYSH2Q3WSN367PMRUOAPIN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Simplify probe() by replacing of_device_get_match_data() and ID lookup for
retrieving match data by i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 drivers/mfd/madera-i2c.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/mfd/madera-i2c.c b/drivers/mfd/madera-i2c.c
index a404ea26bc79..b705fd5b90d8 100644
--- a/drivers/mfd/madera-i2c.c
+++ b/drivers/mfd/madera-i2c.c
@@ -18,20 +18,14 @@
 
 static int madera_i2c_probe(struct i2c_client *i2c)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
 	struct madera *madera;
 	const struct regmap_config *regmap_16bit_config = NULL;
 	const struct regmap_config *regmap_32bit_config = NULL;
-	const void *of_data;
 	unsigned long type;
 	const char *name;
 	int ret;
 
-	of_data = of_device_get_match_data(&i2c->dev);
-	if (of_data)
-		type = (unsigned long)of_data;
-	else
-		type = id->driver_data;
+	type = (unsigned long)i2c_get_match_data(i2c);
 
 	switch (type) {
 	case CS47L15:
-- 
2.25.1

