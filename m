Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BE58D55E4
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 01:02:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5C6CE7F;
	Fri, 31 May 2024 01:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5C6CE7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717110125;
	bh=j//q7PxjjHf16S9qzs6ZEZBUjOL4lL+BxQBw8TkTaeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fV2D0OB8ZMdhgdoSjvYPaysz3j9DjIlEaOWAbvad9n2Cm15qP0laeOSIOT9TFD0iJ
	 HH/lTlb6k8rznyR64UJpZMCguBXn52cbK9zAKYJg9uHsQvosErEGyRsyzb+8hwtV1n
	 CQ6g6DOvWrDCxXf2xUPp1FeySRPQPAYnEN97urqU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CD0EF805E9; Fri, 31 May 2024 01:01:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F44F805E2;
	Fri, 31 May 2024 01:01:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1277F80587; Fri, 31 May 2024 01:01:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6355F8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 01:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6355F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Qh9MzQWR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717110059; x=1748646059;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j//q7PxjjHf16S9qzs6ZEZBUjOL4lL+BxQBw8TkTaeo=;
  b=Qh9MzQWRyo1YoYuXIi+RL3nXKASzR0DVqcp5Gt+gTI63CDHef6tSutY9
   ul4V8sK4FLaf6n2/lBAgHhwcxOecAoaPRYhdlz9jVW3O/EpB2DZWSGMIs
   njF/0UsyVtnUt7mQY1fAA4kTJpBcQv889eF0jIvYO33TI3IZ6ubrz1g6t
   3Z5IkQBwmMvC04CUnRHNruUjwfyY90m0ydvYirAC1X6fZNxkA3kp2i8LZ
   UguiLxH2o8om97g9gfeXK1CWPI/lRpCDtsDod52TyyMl0sUmGmnXcbI1s
   mI9SwHiFELNSADAoXfyFuvrsyAwOptz11RwRjEZtPLd38vCBHvaSlvLXE
   w==;
X-CSE-ConnectionGUID: Y4CRpDW8SbaZlqCnG6QC/w==
X-CSE-MsgGUID: 4E5yPiYbQemtyq7b9aQgIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24195271"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000";
   d="scan'208";a="24195271"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 16:00:51 -0700
X-CSE-ConnectionGUID: cGbSoxG4TkOhjSI0HA6DRA==
X-CSE-MsgGUID: VAH1aJ7mQbC9k70Lz6+POQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000";
   d="scan'208";a="40895195"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2024 16:00:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3BB072DC; Fri, 31 May 2024 02:00:40 +0300 (EEST)
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
Subject: [PATCH v1 2/6] ASoC: fsl: Remove unused of_gpio.h
Date: Fri, 31 May 2024 01:58:48 +0300
Message-ID: <20240530230037.1156253-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
References: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2YOBGU4SBB2ZQEIQOIU3ACSTBECQRDF2
X-Message-ID-Hash: 2YOBGU4SBB2ZQEIQOIU3ACSTBECQRDF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YOBGU4SBB2ZQEIQOIU3ACSTBECQRDF2/>
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

