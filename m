Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 615B583AD5E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 16:31:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13C40B60;
	Wed, 24 Jan 2024 16:31:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13C40B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706110298;
	bh=wYSLCOGRNXXv1Vi8jzuH0RFFj80iLBVjvc3k9ghGQDo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JmGEXrqh2hDwugD2rn85yiMj99hjHR8/4FVY7nbtb4QhK1sjL7RvzoyycBN2jUfBu
	 lCwLZb2EnwSw7RmunSPBlUSAJ//HMVquNQ85IGQhqjFJNie7/AYOVsnYrll7Nva/N0
	 LTSIaTqKp4ZWYUS3EdX01a2fj6Y1tfy4lrQp/Sbk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FE9FF805E4; Wed, 24 Jan 2024 16:30:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A448EF805E7;
	Wed, 24 Jan 2024 16:30:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97AC4F802E8; Wed, 24 Jan 2024 16:30:33 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EC0CF802E8
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 16:30:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EC0CF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=aH65Nxxk
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40O5ABcJ018377;
	Wed, 24 Jan 2024 09:30:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=E2XWBHwq6ltlZasJbVG3NX2UFpIfLf7u9nZRl21LhxE=; b=
	aH65NxxknFPzb6+Mg4oTB/tdjPkpk8lRRnacmPCJcfp1hhuGVjk6d4kIn/OmnbjZ
	Wg9y6n4YYSne60qFsKqCaIdcLMWLNxQnkC5U1vhsx0aZ6/18ca1FXSoqStqi5tVS
	OncF9gUGZl4KElLuMnYlS+eweDKb0onBdIDkulUi9vuiUqE163vikRTnW1XBxIZ2
	p/JW/hVxFiYip95AfH6mV3bBq1qQfFg9y8oz3PYY3Tycum7dFNfTXQcLwqIN/EBa
	BR5Oij1WSzS5/E8bkFzUITwvWpns7b1Dvr28W8cVYCFs3Z+2oxGpm+PIfiWzgW3D
	j5Z44c1mzAb9wXpaM+AdJg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhgyrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 09:30:18 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 15:30:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 15:30:16 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com
 [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id ABAF5820247;
	Wed, 24 Jan 2024 15:30:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <lee@kernel.org>, <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
Subject: [PATCH v2 2/6] mfd: cs42l43: Tidy up header includes
Date: Wed, 24 Jan 2024 15:30:12 +0000
Message-ID: <20240124153016.1541616-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
References: <20240124153016.1541616-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UpLMu7Puv_9W5cJe5TyYpu1GUr74z5EA
X-Proofpoint-GUID: UpLMu7Puv_9W5cJe5TyYpu1GUr74z5EA
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: VBYVSE4UUCE3HXUVVPCRQLCTMXUHNX2S
X-Message-ID-Hash: VBYVSE4UUCE3HXUVVPCRQLCTMXUHNX2S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBYVSE4UUCE3HXUVVPCRQLCTMXUHNX2S/>
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

No changes since v1.

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

