Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF1674242B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 12:47:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 664A420C;
	Thu, 29 Jun 2023 12:46:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 664A420C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688035641;
	bh=9Y1oNOI6Iu45KvslBrhl/Teb6DyPllgKYWJpWorjH0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lNGgzc91elCCG00Qzc+2WKiS0ny86U78RXvGiJHg1U1uMUXuh1/MPwhom6MbKkuNV
	 t2uqtJPhS4Fms/yI5UOtAiq1JPTCA5AiPZ8Eic55uqzVy91QYwucdHgqP5wp0EvZ7I
	 xCxgRg1A4+RzxE96qmPr/hnT39B9HTJfJm9xqmbs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F7D8F80544; Thu, 29 Jun 2023 12:46:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 982B1F80212;
	Thu, 29 Jun 2023 12:46:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 755E5F8051E; Thu, 29 Jun 2023 12:46:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3DD5F80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 12:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3DD5F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Lp434YNw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688035571; x=1719571571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9Y1oNOI6Iu45KvslBrhl/Teb6DyPllgKYWJpWorjH0M=;
  b=Lp434YNwS4fZrmDt24nU55NJMAb1QADS/PFLfk1SJHqMeGm+Ub1eLC/T
   7nNmzNUwM9yoeRAmH/kpYoGaPOEuz1Kcm895cy5PXRJEWKPOidKoHcHIY
   xljNFxul09ykIk03rciNS1IuWkgdxwqwZRCh4mKTSc7WE5NHMKW1irKwI
   XxsgumRLBQQ4xNFGkZ0Aww8QYBBi34vqcpmEBMCsZRt1m4UdTokEOlAdu
   VMScUhOLC7HsOLH3QQp4bGhsHRyN3HhcMwBjiRSBcgzK+zcxZ/1d4nqoC
   1jedPsQXvSbKnhaYpIhUE5XRwTn5RDHD4dL3O4VIu44/VjMC6DQFJdXU+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="362115064"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="362115064"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 03:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963948378"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="963948378"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2023 03:46:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CEC003DA; Thu, 29 Jun 2023 13:46:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 3/3] ASoC: rt5677: Sort headers alphabetically
Date: Thu, 29 Jun 2023 13:46:03 +0300
Message-Id: <20230629104603.88612-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230629104603.88612-1-andriy.shevchenko@linux.intel.com>
References: <20230629104603.88612-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XAFZHAS75NFD45IVE6YFBE3SFOZISC5O
X-Message-ID-Hash: XAFZHAS75NFD45IVE6YFBE3SFOZISC5O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XAFZHAS75NFD45IVE6YFBE3SFOZISC5O/>
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
index 4d09eb2a0755..01595205c1d9 100644
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

