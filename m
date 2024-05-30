Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE88E8D55E1
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 01:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0619693A;
	Fri, 31 May 2024 01:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0619693A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717110093;
	bh=81hqptQlE/LEM/MdYuEb48YnMieQd2hcNEosrso0DUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pD+AoVArYXqcmOdYEFlD+tZhECYAVfzGmYAz/GJ8OrMQDJB0CbDvbqbjw2rD93sub
	 MbzJocuPpts5FPepJIz7bPbm1tvOiEy+P5hjrzaflcIoFEgc6Rl2GpouDUDYChTYJd
	 2OfIBexbSDfxx/C9TdYnxzkWUQbUl/U+17qhw5t4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC1BBF8051E; Fri, 31 May 2024 01:01:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23556F8057A;
	Fri, 31 May 2024 01:01:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3B5DF8026D; Fri, 31 May 2024 01:00:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD1EEF8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 01:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD1EEF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GdemwnrD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717110053; x=1748646053;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=81hqptQlE/LEM/MdYuEb48YnMieQd2hcNEosrso0DUw=;
  b=GdemwnrDoYYk1i8evrJJwTIpFy9OfgGQFxWIncoLjnffC4oLtgmt+OnE
   o0dRseAdW7h+Rd/bwLLff/FhR9LjFs1dHNlXAggK4MLJOjT/jypXG3bOu
   j1zH90gtPe1grz2Y+5/F/m/ftm1eY+5nlvwQFsa/K/8CKrhWykYmAkYMC
   y/Qwmf8zYAvAqVVk8bXKDMQouayU5YuMBUlVcaYWdDRSbSKhIXzAZkZvu
   +undX+5sos7RdPslGa1ACYhNuV1gZhp/5GJUJo4eJILCagsEKn9MZ23ti
   yXwEzeRUDuSsPkMKcsjhvNprZS9BqNcKR3ooCyeRbqSggLQ/hTPmEUCU3
   w==;
X-CSE-ConnectionGUID: YtDCWveDTRmV5ckQSw/ThA==
X-CSE-MsgGUID: ujgkKHpwTwilyHqO4vZx8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24299017"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000";
   d="scan'208";a="24299017"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 16:00:49 -0700
X-CSE-ConnectionGUID: ppAMvIboShW3rdupJXGmfw==
X-CSE-MsgGUID: YE22diODSCqeXIU3YdF4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000";
   d="scan'208";a="59152829"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 30 May 2024 16:00:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 49EA837D; Fri, 31 May 2024 02:00:40 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	James Schulman <james.schulman@cirrus.com>,
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
Subject: [PATCH v1 3/6] ASoC: rockchip: Remove unused of_gpio.h
Date: Fri, 31 May 2024 01:58:49 +0300
Message-ID: <20240530230037.1156253-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
References: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TDCHYOGX2BN4JROIOZ5SP3RUHNJP2ZE2
X-Message-ID-Hash: TDCHYOGX2BN4JROIOZ5SP3RUHNJP2ZE2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDCHYOGX2BN4JROIOZ5SP3RUHNJP2ZE2/>
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
 sound/soc/rockchip/rockchip_i2s.c   | 1 -
 sound/soc/rockchip/rockchip_spdif.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index b0c3ef030e06..b378f870b3ad 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -11,7 +11,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/delay.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/clk.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 1a24b78e9e02..eb9d5dee196e 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -11,7 +11,6 @@
 
 #include <linux/module.h>
 #include <linux/delay.h>
-#include <linux/of_gpio.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
 #include <linux/mfd/syscon.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac

