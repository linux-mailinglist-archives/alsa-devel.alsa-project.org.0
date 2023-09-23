Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D7C7AC434
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Sep 2023 19:51:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9710FDEB;
	Sat, 23 Sep 2023 19:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9710FDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695491486;
	bh=iHDDzrPtoSgR65AwTOW77zI3+f3JFLYNcown1LjcxWo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hPt1M4IQL/jF7SZtntbrAOk+ltc34+xWixA1GN6XXc0y22xupsCSIpz+UYn8xo2ar
	 A5Pm4n3eyaROJdwi+5fCk7iy0YUvxSkV8THhlCb5+wJ443peva89XAZv3NgpCNwvNK
	 QP8jGCbq6bLboM41BPz4zlrH6JoZKrPCu8nhNw6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DA43F80552; Sat, 23 Sep 2023 19:49:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24265F8055B;
	Sat, 23 Sep 2023 19:49:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5691F801F5; Sat, 23 Sep 2023 19:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id B964AF80124
	for <alsa-devel@alsa-project.org>; Sat, 23 Sep 2023 19:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B964AF80124
X-IronPort-AV: E=Sophos;i="6.03,171,1694703600";
   d="scan'208";a="176997671"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Sep 2023 02:49:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.12])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 33C794005B3D;
	Sun, 24 Sep 2023 02:49:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Lee Jones <lee@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 2/4] mfd: madera-i2c: Simplify obtaining I2C match data
Date: Sat, 23 Sep 2023 18:49:26 +0100
Message-Id: <20230923174928.56824-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230923174928.56824-1-biju.das.jz@bp.renesas.com>
References: <20230923174928.56824-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZXFNKTWRB65DACHT73B4KGEC4VBFO6YN
X-Message-ID-Hash: ZXFNKTWRB65DACHT73B4KGEC4VBFO6YN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXFNKTWRB65DACHT73B4KGEC4VBFO6YN/>
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

v3->v4:
 * Updated commit header.
v2->v3:
 * Used uintptr_t for enum casting.
v1->v2:
 * Added Ack tag from Charles Keepax.
 * Dropped blank line before switch statement.
---
 drivers/mfd/madera-i2c.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/mfd/madera-i2c.c b/drivers/mfd/madera-i2c.c
index a404ea26bc79..0986e4a99f4a 100644
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
+	type = (uintptr_t)i2c_get_match_data(i2c);
 	switch (type) {
 	case CS47L15:
 		if (IS_ENABLED(CONFIG_MFD_CS47L15)) {
-- 
2.25.1

