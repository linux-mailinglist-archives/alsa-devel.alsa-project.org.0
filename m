Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9835AD66E1
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jun 2025 06:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05DDD601F7;
	Thu, 12 Jun 2025 06:43:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05DDD601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749703429;
	bh=Fe5W4OL7Zyzyt578SKJaKyvyQ2WccI6UGSeC6I6l/sc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k345hghojVjwaJAZ3nQpY9Nf00pqMvTE7jGc2wFSkHT44JwMDeboXiVJ7gEGGSGhs
	 cDvwUxVOVSOJovjkYxnqcTlBOwvlRMhw+2h0m4G7MIqK/KITFvOVvk4Bsg+gSJbWMa
	 A9MSd40WwAgJaXM7n7+LpGsVTXbrsKXv6H2a4piw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D391F805C7; Thu, 12 Jun 2025 06:43:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA16AF805BB;
	Thu, 12 Jun 2025 06:43:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CD73F804D6; Thu, 12 Jun 2025 06:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1524F80075
	for <alsa-devel@alsa-project.org>; Thu, 12 Jun 2025 06:43:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1524F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=hOaxYQXM
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55C4h0Mx2805892;
	Wed, 11 Jun 2025 23:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749703380;
	bh=Z39F7PON78rc+7V9kItNq2nj713mvhpJ8ZX08P9jYq0=;
	h=From:To:CC:Subject:Date;
	b=hOaxYQXMsWAeyZk5siOYrVprXC8zfutvPZagZeZ3otw8kbhqQJ4Os0A4UMWMpctay
	 AXmR60xxwbQHBwEjsJZ170BRdsUDVJLJsSN5t5fsRQ6Wb1P7/dMXZmh0f9HYku0Vnn
	 SthycuoRU13cohKF1t9FDEtg9WTdWANmknMoFpq0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55C4gxv03358830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 11 Jun 2025 23:42:59 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 11
 Jun 2025 23:42:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 11 Jun 2025 23:42:59 -0500
Received: from LT5CG31242FY.dhcp.ti.com (lt5cg31242fy.dhcp.ti.com
 [10.85.15.32])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55C4gun21580472;
	Wed, 11 Jun 2025 23:42:56 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <13916275206@139.com>, <13564923607@139.com>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v1] ASoC: tas2781: Move the "include linux/debugfs.h" into
 tas2781.h
Date: Thu, 12 Jun 2025 12:42:52 +0800
Message-ID: <20250612044252.1025-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Message-ID-Hash: R7JY6XBTVGVFXXBJGJFAT6NUCPT2C657
X-Message-ID-Hash: R7JY6XBTVGVFXXBJGJFAT6NUCPT2C657
X-MailFrom: shenghao-ding@ti.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7JY6XBTVGVFXXBJGJFAT6NUCPT2C657/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Move the include linux/debugfs.h into tas2781.h for code clean.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
---
 include/sound/tas2781.h        | 4 ++++
 sound/soc/codecs/tas2781-i2c.c | 3 ---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 40cd3bd079b5..3875e92f1ec5 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -17,6 +17,10 @@
 #ifndef __TAS2781_H__
 #define __TAS2781_H__
 
+#ifdef CONFIG_SND_SOC_TAS2781_ACOUST_I2C
+#include <linux/debugfs.h>
+#endif
+
 #include "tas2781-dsp.h"
 
 /* version number */
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index c40d8f754d89..9f4d965a1335 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -14,9 +14,6 @@
 //
 
 #include <linux/crc8.h>
-#ifdef CONFIG_SND_SOC_TAS2781_ACOUST_I2C
-#include <linux/debugfs.h>
-#endif
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
-- 
2.43.0

