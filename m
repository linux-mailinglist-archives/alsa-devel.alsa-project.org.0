Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCBF83ACE4
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 16:13:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84A8A82C;
	Wed, 24 Jan 2024 16:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84A8A82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706109198;
	bh=pk9SStOkm9HtYlm53RC4FWe7ynG+SM2C/0oSSEXRu/A=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bwkh2GQOSJtfEXiwSNqnrDam/mcGk8Q4NdXE48uptvjnHMBbyUvQQVMQfZ1Rkp1o9
	 veTXrcIhOOxe778A2sFZF5GawTCXJGzlte9a9e6mxzPgtzxrA1/qDj4+K0OTRQqjAP
	 iBTZFAvnUVae1Q/Bgc6kf8yegmEuzSf7+C6sVfGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21C63F805B0; Wed, 24 Jan 2024 16:12:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 318D8F8055B;
	Wed, 24 Jan 2024 16:12:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55A6DF804F1; Wed, 24 Jan 2024 16:12:39 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 10927F80149
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 16:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10927F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=R3u9vIWX
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O7L4cv000450;
	Wed, 24 Jan 2024 09:12:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=s
	34WAcFS7YmLudj+Nc5iYgo1xcAFqjeqgfAxqyK01rU=; b=R3u9vIWXl/AMzsBrx
	F+g39TK/Htc+WQkKqRk0mH93zMTxvFff082Gk7JFsmT2Kw5a8gCPQ6qqH88Qt32j
	0qCN6wo/o2xSPUZN7wz1nsQjBr9BgimjdvV72q3QHaiWa7jsle1Qbq8Uty8kRoyN
	cuwLuVVNJTtjVBA9QqQNAcNO97ofR0OXcPjOA7DzLk5bsJwTXQ1XOd9CxntFwOcm
	AEfkLr0nQ7Ipl4jp/p6Q4xh0uxuuceHsKAwRENkkpnsNnT+QHP9u1vBEzesH8jWq
	otFK9nQswhUSjyhuAGYw46LRT/BzXUveaozihSen1gP93KqWHxRDZmpAAfTJdTLE
	b8qFQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhgxx7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 09:12:25 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 15:12:22 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 15:12:22 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 29F52820246;
	Wed, 24 Jan 2024 15:12:22 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <lee@kernel.org>, <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
Subject: [PATCH 1/6] mfd: cs42l43: Tidy up header includes
Date: Wed, 24 Jan 2024 15:12:17 +0000
Message-ID: <20240124151222.1448570-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: AozGL7WfIKeRKsB6yIVyXAejrXDCfbYL
X-Proofpoint-GUID: AozGL7WfIKeRKsB6yIVyXAejrXDCfbYL
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KRXFFTAQNY2LWKNF4ZTY2KLCAHIS5TOY
X-Message-ID-Hash: KRXFFTAQNY2LWKNF4ZTY2KLCAHIS5TOY
X-MailFrom: prvs=8753590469=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRXFFTAQNY2LWKNF4ZTY2KLCAHIS5TOY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use more forward declarations, move header guards to cover other
includes, and rely less on including headers through other headers.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43-i2c.c   |  6 +++++-
 drivers/mfd/cs42l43-sdw.c   |  6 +++++-
 drivers/mfd/cs42l43.c       |  8 +++++++-
 drivers/mfd/cs42l43.h       |  9 +++++----
 include/linux/mfd/cs42l43.h | 13 +++++++------
 5 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index 4922211680c96..7162274a0b551 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -6,11 +6,15 @@
  *                         Cirrus Logic International Semiconductor Ltd.
  */
 
+#include <linux/array_size.h>
 #include <linux/err.h>
-#include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
 
 #include "cs42l43.h"
 
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 1d85bbf8cdd5d..d6962a5a35f65 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -6,11 +6,15 @@
  *                         Cirrus Logic International Semiconductor Ltd.
  */
 
+#include <linux/array_size.h>
 #include <linux/device.h>
 #include <linux/err.h>
-#include <linux/errno.h>
+#include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/pm.h>
+#include <linux/regmap.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw_type.h>
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 7b6d07cbe6fc6..4e2bc5ad244a5 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -6,18 +6,24 @@
  *                         Cirrus Logic International Semiconductor Ltd.
  */
 
+#include <linux/array_size.h>
 #include <linux/bitops.h>
 #include <linux/build_bug.h>
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/err.h>
-#include <linux/errno.h>
 #include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
 #include <linux/jiffies.h>
 #include <linux/mfd/core.h>
+#include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
 #include <linux/module.h>
+#include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/types.h>
 
 #include "cs42l43.h"
 
diff --git a/drivers/mfd/cs42l43.h b/drivers/mfd/cs42l43.h
index eb4caf3938332..70129db9f916e 100644
--- a/drivers/mfd/cs42l43.h
+++ b/drivers/mfd/cs42l43.h
@@ -6,15 +6,16 @@
  *                         Cirrus Logic International Semiconductor Ltd.
  */
 
-#include <linux/mfd/cs42l43.h>
-#include <linux/pm.h>
-#include <linux/regmap.h>
-
 #ifndef CS42L43_CORE_INT_H
 #define CS42L43_CORE_INT_H
 
 #define CS42L43_N_DEFAULTS 176
 
+struct cs42l43;
+struct dev_pm_ops;
+struct device;
+struct reg_default;
+
 extern const struct dev_pm_ops cs42l43_pm_ops;
 extern const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS];
 
diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
index cf8263aab41bd..2239d8585e785 100644
--- a/include/linux/mfd/cs42l43.h
+++ b/include/linux/mfd/cs42l43.h
@@ -6,20 +6,21 @@
  *                         Cirrus Logic International Semiconductor Ltd.
  */
 
+#ifndef CS42L43_CORE_EXT_H
+#define CS42L43_CORE_EXT_H
+
 #include <linux/completion.h>
-#include <linux/device.h>
-#include <linux/gpio/consumer.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
-#include <linux/soundwire/sdw.h>
 #include <linux/workqueue.h>
 
-#ifndef CS42L43_CORE_EXT_H
-#define CS42L43_CORE_EXT_H
-
 #define CS42L43_N_SUPPLIES		3
 
+struct device;
+struct gpio_desc;
+struct sdw_slave;
+
 enum cs42l43_irq_numbers {
 	CS42L43_PLL_LOST_LOCK,
 	CS42L43_PLL_READY,
-- 
2.30.2

