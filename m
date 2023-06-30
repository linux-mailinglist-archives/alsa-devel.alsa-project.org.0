Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60B4744120
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 19:23:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 105AD850;
	Fri, 30 Jun 2023 19:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 105AD850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688145833;
	bh=o4v52pbTbPKjL7/CqY3UgPjebMqu/2BTGtwSA/m6eKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W/LqSSWub4MtTd8THxuEbTNUxdBMw12aKJSYqduRYTdi4GlRpmtqiCRbq6uqtG/JF
	 AtlYttpoSrZ5Ql69C9MciaCriRX0bXdeN4gDHBrmA3FCxYaqPkk9JxELPCkfhK/HP3
	 6WkNHu6bPPryeK+0YFdP11ITxyVU2nQA7Ag6N+6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 061A2F8056F; Fri, 30 Jun 2023 19:22:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40AE2F8055C;
	Fri, 30 Jun 2023 19:22:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D019F8027B; Fri, 30 Jun 2023 19:22:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A952F80169
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 19:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A952F80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SzVexxdU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688145727; x=1719681727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o4v52pbTbPKjL7/CqY3UgPjebMqu/2BTGtwSA/m6eKM=;
  b=SzVexxdUpKtPex7/zdNqjEPy3HuHVcHfKT2UpLVY1/XalQsx2RDWdC7e
   HDX42w1k6ETc7G0KwBuL7CDHj+52OcudhvAZyQm2qTH+pWkKa2GuARwRv
   JIZ1FkCEAQK47gbBh76P20kWPCIzC4WqPG3puwY108axlC07UOZGefdeh
   XLIN8onmQdbS4D8OTjXe4SXDrpDOkXe9p6C/wmT1lQK6q8ELoPj7zYEQ0
   37s/ieQX3esVwEtmr3p0EZoAMRFbRDjweDGiA0za6R4Is2BoiWrfaaWC7
   9X+Jc9ASfOiUMcOxiI2P8GLPfX70lyiTU7IYDS679DnNQOpxKbqXpFAAD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342032354"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="342032354"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="711879225"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="711879225"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 10:21:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 01F2A51E; Fri, 30 Jun 2023 20:21:57 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 4/4] ASoC: rt5677: Sort headers alphabetically
Date: Fri, 30 Jun 2023 20:21:55 +0300
Message-Id: <20230630172155.83754-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
References: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OAL6DGQR33MTK2H57VVRWK4EW2576V2U
X-Message-ID-Hash: OAL6DGQR33MTK2H57VVRWK4EW2576V2U
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OAL6DGQR33MTK2H57VVRWK4EW2576V2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It's hard to see what's included and what's not on the glance.
Sort headers alphabetically to improve maintenance.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/rt5677.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index b0c15e27c763..0e70a3ab42b5 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -6,21 +6,21 @@
  * Author: Oder Chiou <oder_chiou@realtek.com>
  */
 
+#include <linux/delay.h>
+#include <linux/firmware.h>
 #include <linux/fs.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
+#include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/init.h>
-#include <linux/delay.h>
+#include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
-#include <linux/i2c.h>
-#include <linux/platform_device.h>
 #include <linux/spi/spi.h>
-#include <linux/firmware.h>
-#include <linux/property.h>
-#include <linux/irq.h>
-#include <linux/interrupt.h>
-#include <linux/irqdomain.h>
 #include <linux/workqueue.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
-- 
2.40.0.1.gaa8946217a0b

