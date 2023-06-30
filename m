Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DCD744121
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 19:24:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68B9A1F1;
	Fri, 30 Jun 2023 19:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68B9A1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688145844;
	bh=A3IUtCLuB4ClrnmeXN1FNAH3rmScz4Se3y8ZAbWmBgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=roww17STta9c1cbFSTqrW6C2mHdhu5a5hEjM4s0/DTj4DxrIoumOVT+LUhX9oXBlI
	 dWp4IL8UpWhm8VDsiw9TWWPOUWoK1Oj3qzGuJO/jJTmBkpb/b5Gfd7br1njdFFL4BM
	 tm7IRnFNv3k5ZuWJVdfCIvtKnGYj6lmpziA+jQ/4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7AE55F80588; Fri, 30 Jun 2023 19:22:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4565F8057D;
	Fri, 30 Jun 2023 19:22:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48E34F80431; Fri, 30 Jun 2023 19:22:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F70FF80246
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 19:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F70FF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mb6jOKp7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688145728; x=1719681728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A3IUtCLuB4ClrnmeXN1FNAH3rmScz4Se3y8ZAbWmBgs=;
  b=mb6jOKp7NEHcuUjlDzdIKgnKLOaaWl0E6nuvGGN3pxsR1JHI4JSGq+sj
   2+ByOljf0gXMe7vjKUj8wZCuoemJRjKgQ7Eax6BljNfDKXZIIDErYRVFB
   jfsabnw4MNqHX8NHHSSF9g2wLVIX8csEF8s+ZwLttBba1UgHeXHlBYZxs
   uMeRIIKvACkDYqfJ51kwGmCV3WieSuHSx89qX6rrOzk5E5C4DHgsA6w2g
   sa7wOqhWUigoJcKvc9a846ycfkVL5tBVNHLk1dr+rD4JMXN2UWApyldbv
   Szy4UIEoqCcqdDHULV/rzkNkTwQtNUA1WPGJsD8z2FzxB3dRGbCtoiOSY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="361298321"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="361298321"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="747486145"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="747486145"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 30 Jun 2023 10:21:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E16474DA; Fri, 30 Jun 2023 20:21:57 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 2/4] ASoC: rt5677: Use agnostic irq_domain_create_linear()
Date: Fri, 30 Jun 2023 20:21:53 +0300
Message-Id: <20230630172155.83754-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
References: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FDN2PGANYZHVJIP5YW5GWJWYYIBW676R
X-Message-ID-Hash: FDN2PGANYZHVJIP5YW5GWJWYYIBW676R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FDN2PGANYZHVJIP5YW5GWJWYYIBW676R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of irq_domain_add_linear() that requires of_node,
use irq_domain_create_linear() that works outside of OF world.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/rt5677.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 3a2a6b150cda..17d5dd5d2974 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5511,7 +5511,7 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
 
 	/* Ready to listen for interrupts */
-	rt5677->domain = irq_domain_add_linear(i2c->dev.of_node,
+	rt5677->domain = irq_domain_create_linear(dev_fwnode(&i2c->dev),
 			RT5677_IRQ_NUM, &rt5677_domain_ops, rt5677);
 	if (!rt5677->domain) {
 		dev_err(&i2c->dev, "Failed to create IRQ domain\n");
-- 
2.40.0.1.gaa8946217a0b

