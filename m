Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC25C742430
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 12:48:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CDA1826;
	Thu, 29 Jun 2023 12:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CDA1826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688035722;
	bh=zhLC9JAzQNOB8jyzT8cMCfKVD3PidLJzPIIHOo/ep4E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=f2IYXD73TWuzLl3TELtnLauz/bPHgM0cjrySLOXb9cXYajwHkl7socEsPGSQeMN6X
	 JRqB+FfJz576rRL5FVo760YTUiCYbyjwdodJXh81Q7josfB0kzepI52ik5iHx/9uJZ
	 hNhwu4vAEnr3O1xXUB+LSEtIM5HIFA9YJKZ6GuvA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05CABF80212; Thu, 29 Jun 2023 12:47:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AD81F80212;
	Thu, 29 Jun 2023 12:47:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79DC1F80212; Thu, 29 Jun 2023 12:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF22AF80431
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 12:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF22AF80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OrbXaQQT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688035574; x=1719571574;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zhLC9JAzQNOB8jyzT8cMCfKVD3PidLJzPIIHOo/ep4E=;
  b=OrbXaQQTZYp7bv+l8Ox96JF3lduH+QNsz8yPaMvK1M4kAtunrH1Gx9HC
   kFfaj/P7AstN4wQykkHkoC4qhOxPxa+x+MPlv3OkX1SjbUoHbHqYL9xoX
   CMRsjdQvtwF6cRoggV8H+A/YI9HvjNucFOkWOAJKcV3CPgB2Z3SHXfwCx
   BuyFapfClK5s0PE+6ZAa3U5KvXtyow8zD8AZZEqBo4l7uGCGA93otqeg8
   aCai6cTKDMyvf9oD4jYUFflhkJF/HuWJg4plE6x+odS0HlZGRx6xgliXo
   lNz2bz7c2x2RpJr4KefuNPlEXBSoW3y6V8phMKvKI6iaHFCqhXlacu7I1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="362115085"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="362115085"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 03:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963948379"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="963948379"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2023 03:46:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AB1AA358; Thu, 29 Jun 2023 13:46:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 0/3] ASoC: rt5677: Refactor to use device_get_match_data()
Date: Thu, 29 Jun 2023 13:46:00 +0300
Message-Id: <20230629104603.88612-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BXJORMWIM6PW6WQCOMXRSGL67P5FI7ZN
X-Message-ID-Hash: BXJORMWIM6PW6WQCOMXRSGL67P5FI7ZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BXJORMWIM6PW6WQCOMXRSGL67P5FI7ZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The code can be simplified with device_get_match_data().
Besides that couple of additional changes, one for maintenance (patch 3)
and one for making IRQ domain agnostic (not pinned to OF).

Andy Shevchenko (3):
  ASoC: rt5677: Use agnostic irq_domain_create_linear()
  ASoC: rt5677: Use device_get_match_data()
  ASoC: rt5677: Sort headers alphabetically

 sound/soc/codecs/rt5677.c | 41 +++++++++++++--------------------------
 sound/soc/codecs/rt5677.h |  4 ++--
 2 files changed, 16 insertions(+), 29 deletions(-)

-- 
2.40.0.1.gaa8946217a0b

