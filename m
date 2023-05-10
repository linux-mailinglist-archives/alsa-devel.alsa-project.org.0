Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D656FDAB2
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 11:26:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F8B41086;
	Wed, 10 May 2023 11:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F8B41086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683710811;
	bh=PpCLyPPCFpLGMRu5ntFX7k1vMw5XbEx/7uBCbcrNbso=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DSQgYiAaFY/FEbrGCGVGNJZwC0M0rJGlwOYZGit5VaF/y2+tuz8FDFh0hM8VES7wc
	 FBGxvN+AfqVGu4/PBHCUj0aJPxnGt1CjwM0iJhBeohfUqWgPEwgRtz1jWO1vjnsaNe
	 Hx5JbW5CkRhRfFVhfgJoz+pnv6HXweJZcq700GiU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10285F80310;
	Wed, 10 May 2023 11:26:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47686F8032D; Wed, 10 May 2023 11:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9843BF8014C
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 11:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9843BF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Auf2slYL
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34A8pG05020846;
	Wed, 10 May 2023 04:25:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=woKhXQBza0TN1iZnLj8N6KgZOjGWIlrj3vczp6OnFsw=;
 b=Auf2slYLzSpKhlCHPyR3jntILLuKzQirZ+GfFX+ZoH2jFxubiJssudOA6zr8GWpe5Uf1
 MBGJJDdtV5WfYnA6Yh6TWvJvNb/xX0CMYbwjCZKD/mvu/ZQHnZeglMkbz8ttG10dpMgp
 pe8VtUb2aVXSr/SFZFY+qFIMLraAFbVKJm9svBiQlSoQMANlHvkxyyTo99Px/iv9K9ZL
 8TQSicPLHPyHHm2zzNWJlYTFir70bzDVzDOeXnsQn0BQq7QnBmo9ePYWBjohvETdZGX2
 /Dad64p+GZ3wVZDptT0V33QxzDz+nJs/AWqkxDeJI/Q8FvT2V0P3p3db/HbD/WFGhhkT pQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7nb1tch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 04:25:48 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 10 May
 2023 04:25:34 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 May 2023 04:25:34 -0500
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7278B11D4;
	Wed, 10 May 2023 09:25:34 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: cs35l45: Relicense to GPL only
Date: Wed, 10 May 2023 10:25:34 +0100
Message-ID: <20230510092534.3919120-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: hxOxoAJgEXsMMrj34A7jDzr-G6w1Yz3F
X-Proofpoint-GUID: hxOxoAJgEXsMMrj34A7jDzr-G6w1Yz3F
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GIK2TKW2NW6XMF4WX5BJI6WPOPORUNCR
X-Message-ID-Hash: GIK2TKW2NW6XMF4WX5BJI6WPOPORUNCR
X-MailFrom: prvs=0494d87e62=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: pierre-louis.bossart@linux.intel.com, u.kleine-koenig@pengutronix.de,
 james.schulman@cirrus.com, rf@opensource.cirrus.com,
 vkarpovi@opensource.cirrus.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIK2TKW2NW6XMF4WX5BJI6WPOPORUNCR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Cirrus never intended to upstream dual licensed code, convert to
GPL only.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Apologies for this but this was never our intention and I believe that
it can be a little legally involved maintaining dual licensed kernel code.
Fortunately not that many people outside of Cirrus have contributed to
the files in question. I have CCed everyone who has contributed both
internally and externally.

Thanks,
Charles

 sound/soc/codecs/cs35l45-i2c.c    | 4 ++--
 sound/soc/codecs/cs35l45-spi.c    | 4 ++--
 sound/soc/codecs/cs35l45-tables.c | 2 +-
 sound/soc/codecs/cs35l45.c        | 4 ++--
 sound/soc/codecs/cs35l45.h        | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cs35l45-i2c.c b/sound/soc/codecs/cs35l45-i2c.c
index 5832ebb90c2b9..77e0f8750f375 100644
--- a/sound/soc/codecs/cs35l45-i2c.c
+++ b/sound/soc/codecs/cs35l45-i2c.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+// SPDX-License-Identifier: GPL-2.0
 //
 // cs35l45-i2c.c -- CS35L45 I2C driver
 //
@@ -72,5 +72,5 @@ module_i2c_driver(cs35l45_i2c_driver);
 
 MODULE_DESCRIPTION("I2C CS35L45 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
-MODULE_LICENSE("Dual BSD/GPL");
+MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_CS35L45);
diff --git a/sound/soc/codecs/cs35l45-spi.c b/sound/soc/codecs/cs35l45-spi.c
index a00b23b4180c5..5efb77530cc33 100644
--- a/sound/soc/codecs/cs35l45-spi.c
+++ b/sound/soc/codecs/cs35l45-spi.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+// SPDX-License-Identifier: GPL-2.0
 //
 // cs35l45-spi.c -- CS35L45 SPI driver
 //
@@ -74,5 +74,5 @@ module_spi_driver(cs35l45_spi_driver);
 
 MODULE_DESCRIPTION("SPI CS35L45 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
-MODULE_LICENSE("Dual BSD/GPL");
+MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS(SND_SOC_CS35L45);
diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index 46610e64e8188..066f83c0c7ac2 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+// SPDX-License-Identifier: GPL-2.0
 //
 // cs35l45-tables.c -- CS35L45 ALSA SoC audio driver
 //
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index c31597f6bfae1..d1edb9876c10f 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+// SPDX-License-Identifier: GPL-2.0
 //
 // cs35l45.c - CS35L45 ALSA SoC audio driver
 //
@@ -1296,4 +1296,4 @@ EXPORT_SYMBOL_NS_GPL(cs35l45_pm_ops, SND_SOC_CS35L45);
 MODULE_DESCRIPTION("ASoC CS35L45 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
-MODULE_LICENSE("Dual BSD/GPL");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index 0da28439f628b..61135a316df33 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * cs35l45.h - CS35L45 ALSA SoC audio driver
  *
-- 
2.30.2

