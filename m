Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02E48FD9B1
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 00:15:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A396839;
	Thu,  6 Jun 2024 00:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A396839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717625756;
	bh=j//q7PxjjHf16S9qzs6ZEZBUjOL4lL+BxQBw8TkTaeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OPs7BXKqMG4sXw24gS8d4RhIQvIn9PGBCbYgR5sXkQGmUkyxKNE8jLpa//YsHwQPS
	 5nuECe9pzSnwFkRXz68G0vwYtMywR0lZL+WRy+mMvpzoVeNsxiEmS2TmjKaBz6jBbk
	 sfK4Xqo0AmY4k90t3pQ6HB00uVnAdoyA8+YPCfOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07D49F80589; Thu,  6 Jun 2024 00:15:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A8D6F8051D;
	Thu,  6 Jun 2024 00:15:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AEC2F8051D; Thu,  6 Jun 2024 00:15:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94EE0F800FA
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 00:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94EE0F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z63rTiMi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717625704; x=1749161704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j//q7PxjjHf16S9qzs6ZEZBUjOL4lL+BxQBw8TkTaeo=;
  b=Z63rTiMiFhQDVxV+HUD1AlzjL6agrVcr108A5Pj3tQ4ll64Nf+n/TYj1
   WLth4eJif2NTwYrzUTX7MR/PGr3gLLU3aXoE90jBALy2Deni0e+zuDxdL
   GHNbKSQBUjMpDr6be3DAp/sKk/VprYKGU2ijMA3ex7CeBhRZKO8jikA6t
   xEECurOqWa2bZ5TlLNb4/RIeJMN+nlxCswrrJ6kx6d13jleXlSO9rbpeW
   L/D7DxTZ/sgW9DbDrCkj/4HB1nWSmsq90MFj7q3UtiOQiC5CouxZ3lCGQ
   rB1psp2i2cflukUL/Fe57PYQNrczssBIDZycjvaS+OWi2lxP/h6BCuzhz
   w==;
X-CSE-ConnectionGUID: rHiGnI/tTuqqQFneRzf4BQ==
X-CSE-MsgGUID: /sQg0w3WSl28OIU0FX7/bw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24895454"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000";
   d="scan'208";a="24895454"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 15:14:58 -0700
X-CSE-ConnectionGUID: HzH0miWtQ1OXdvC2WG594w==
X-CSE-MsgGUID: 8j0hPRi+QvK0cEgtvL2Q3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000";
   d="scan'208";a="38168540"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 05 Jun 2024 15:14:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id B9E0434B; Thu, 06 Jun 2024 01:14:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 2/6] ASoC: fsl: Remove unused of_gpio.h
Date: Thu,  6 Jun 2024 00:27:25 +0300
Message-ID: <20240605221446.2624964-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
References: <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ITOFBKGR2XWGBKD6ISLOQF3FFCDAQAJZ
X-Message-ID-Hash: ITOFBKGR2XWGBKD6ISLOQF3FFCDAQAJZ
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ITOFBKGR2XWGBKD6ISLOQF3FFCDAQAJZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

of_gpio.h is deprecated and subject to remove. The drivers in question
don't use it, simply remove the unused header.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/fsl/imx-es8328.c | 1 -
 sound/soc/fsl/imx-rpmsg.c  | 2 --
 2 files changed, 3 deletions(-)

diff --git a/sound/soc/fsl/imx-es8328.c b/sound/soc/fsl/imx-es8328.c
index 5b9648f3b087..3ef92f6dfc6b 100644
--- a/sound/soc/fsl/imx-es8328.c
+++ b/sound/soc/fsl/imx-es8328.c
@@ -8,7 +8,6 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/i2c.h>
-#include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
 
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 0f1ad7ad7d27..ce98d2288193 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -5,9 +5,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/i2c.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/clk.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac

