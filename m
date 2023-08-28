Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 564F678B4C7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 17:51:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF0C0846;
	Mon, 28 Aug 2023 17:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF0C0846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693237859;
	bh=BOzEnA/F9aiwZbS9ep9YdSAUujjcXip5kPhnhQiNHF8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TA0NAtmwTYTR5rhuIlW+NeXpLRL81Wa0w/KJBeuDTiHJilGjIchwtHSefNCmHopkb
	 hx12oB17+bQUsgTjcAxtDq2fvmrkuy2ewkwpKBYM6YJNVD+eCa1mZtXKUTtMNE/Uxe
	 dh3BznloVn10aVPz1TzY0A8yOh57eXDnkF6I6F3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA05CF80249; Mon, 28 Aug 2023 17:50:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 666EFF80155;
	Mon, 28 Aug 2023 17:50:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ADB6F80158; Mon, 28 Aug 2023 17:50:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=AC_FROM_MANY_DOTS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id AE2A4F80074
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 17:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE2A4F80074
X-IronPort-AV: E=Sophos;i="6.02,207,1688396400";
   d="scan'208";a="174229477"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2023 00:49:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7D41D400D4B8;
	Tue, 29 Aug 2023 00:49:43 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2] mfd: madera-i2c: Simplify probe()
Date: Mon, 28 Aug 2023 16:49:41 +0100
Message-Id: <20230828154941.79780-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O4AFS2CF24AIMJDFL2CN7B3RTUEZWATX
X-Message-ID-Hash: O4AFS2CF24AIMJDFL2CN7B3RTUEZWATX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O4AFS2CF24AIMJDFL2CN7B3RTUEZWATX/>
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
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
Note:
 This patch is only compile tested.

v1->v2:
 * Added Ack tag from Charles Keepax.
 * Dropped blank line before switch statement.
---
 drivers/mfd/madera-i2c.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mfd/madera-i2c.c b/drivers/mfd/madera-i2c.c
index a404ea26bc79..33781c631345 100644
--- a/drivers/mfd/madera-i2c.c
+++ b/drivers/mfd/madera-i2c.c
@@ -18,21 +18,14 @@
 
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
-
+	type = (unsigned long)i2c_get_match_data(i2c);
 	switch (type) {
 	case CS47L15:
 		if (IS_ENABLED(CONFIG_MFD_CS47L15)) {
-- 
2.25.1

