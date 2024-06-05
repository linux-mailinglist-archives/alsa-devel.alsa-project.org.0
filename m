Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 896128FD9B6
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 00:16:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2717CB60;
	Thu,  6 Jun 2024 00:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2717CB60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717625788;
	bh=wn+WM6bIVhW767mtc2MZ19cATq9dvFlmfYEDJLezjxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VWZLwz+toOOWvD1p0NDqm00/joYjHKp3zWT3OkrkWRpZu2+EeX/p8Fl0tI8JskDbH
	 Tg3AWwdpWaYkRcxdhnYEYuFp0GOJ8hIzXsRpNOGsOWec+A1REHF2q3pOHKQa4ojqmp
	 Xmn0Hg3OTxEhhG4pF+IgNNQFdZ1JSSZEx14Tf3+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4420F805F6; Thu,  6 Jun 2024 00:15:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01A89F805F4;
	Thu,  6 Jun 2024 00:15:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 239BBF804E5; Thu,  6 Jun 2024 00:15:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A9E19F8025A
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 00:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9E19F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q3LQNlh7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717625706; x=1749161706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wn+WM6bIVhW767mtc2MZ19cATq9dvFlmfYEDJLezjxw=;
  b=Q3LQNlh7bNDkgpviR+vATQDPHWoFZ/kR6WF33BzQKHc/OF/3Z6qEvnJk
   xCT6NWW3/hFyRNO7Ij2uitO9H9lhLaCtw7pFhjRpJxoKNsCilpc5j1NOz
   ZD3G2q6EPPAWvRX8zXeVHiYjz0+6mjHvVASyd2ECmC5SLwWz9vasuvZIK
   0Ep818p1Ph+Klrq7lQxG78gbvaW5sfsUpJVSsZCqYm0m/oFR+Ub7OBOur
   K3V6jJkAq0cM/DGccbvMkK41TpEGRHN+8mD7HCQ08AaGhTrGF7GDONSoo
   AtNMh0izH2zEdJyFrF7JJrQEGlF/WzTeYc2uyl/lBg3sK5AIZMu0WoSrF
   Q==;
X-CSE-ConnectionGUID: 657yJrVYSd6e/W5+ykvpeg==
X-CSE-MsgGUID: GoURtIxCTGON9nnru1Itvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24895491"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000";
   d="scan'208";a="24895491"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 15:15:01 -0700
X-CSE-ConnectionGUID: vDuyce6qQEmb/WWiwbWzNg==
X-CSE-MsgGUID: D4oVJiRMQfCTDAoI5HxSPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000";
   d="scan'208";a="38168542"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 05 Jun 2024 15:14:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DB91D56E; Thu, 06 Jun 2024 01:14:47 +0300 (EEST)
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
Subject: [PATCH v2 4/6] ASoC: codecs: Replace of_gpio.h by proper one
Date: Thu,  6 Jun 2024 00:27:27 +0300
Message-ID: <20240605221446.2624964-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
References: <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6MWYEPQNGGQXPHQL34EW4AMRDC7K7G5A
X-Message-ID-Hash: 6MWYEPQNGGQXPHQL34EW4AMRDC7K7G5A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MWYEPQNGGQXPHQL34EW4AMRDC7K7G5A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

of_gpio.h is deprecated and subject to remove.
The driver doesn't use it directly, replace it
with what is really being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/aw88395/aw88395.c | 2 +-
 sound/soc/codecs/aw88399.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index 3c459a67ad0c..be6ebcb51cca 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -8,9 +8,9 @@
 // Author: Weidong Wang <wangweidong.a@awinic.com>
 //
 
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "aw88395.h"
diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index df6d52a1cfef..5d8481612eab 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -8,9 +8,9 @@
 //
 
 #include <linux/crc32.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
-#include <linux/of_gpio.h> 
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "aw88399.h"
-- 
2.43.0.rc1.1336.g36b5255a03ac

