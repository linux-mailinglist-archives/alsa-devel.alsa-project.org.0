Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF268D65D3
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 17:33:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7547BFAA;
	Fri, 31 May 2024 17:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7547BFAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717169589;
	bh=SGwfez3lrOf2K/YTWirwKNhphy+WK2Ug6UhveRqerj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OqOCMwaCDzWj7sy8pM/8g1gsRDiseaA7Hwcvno5JHBpA0cXgJIPc0+peB702GrleS
	 n5aXKapGXLBnjmcdYcyf2FgLzAq+H0xbWDNHdVUV2hLLEh1tSaubmpQkKH88YvxCqs
	 mMdwrXwgMXjHNWS+k32lJgStTofKgqTw8JJUTVsU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04709F80685; Fri, 31 May 2024 17:31:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7340F8065A;
	Fri, 31 May 2024 17:31:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 295CEF8026D; Fri, 31 May 2024 17:31:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C00DF80496
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 17:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C00DF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O3pySoyb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717169459; x=1748705459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SGwfez3lrOf2K/YTWirwKNhphy+WK2Ug6UhveRqerj0=;
  b=O3pySoyb9oe47XYuT+6md8i3Wzt1JXfwqxKLTan1Q4iThA5EcR6uSRf7
   9MxEq7RvCAYv6FLDC1ocPTZJe7toDHSK8bN9cdV1lVdKhMvUrxhTcqW/J
   5UNfIkWIRg4y39x1DRuYRQ8cz9oZRfmf3prdtfFDZNkvhmzAF5gneksIN
   +D+PlXRLGkxbS5DBWp1br4/mZZ2AwblrLLkNQBThicS628H7wb0onjLYv
   RdZ6OBrto5ENlHflZW+DS9H78H8inpA2ghSwP5k0oSWMWQM+1MFanP0Va
   8FaoEyG8P5VZuL4mR1iOBWsXilhbIy+A0yDNI7qfOrZq9zvoohphiGFQR
   Q==;
X-CSE-ConnectionGUID: wTEDQ1/4T6KiW8zTb7RdQQ==
X-CSE-MsgGUID: 61aWrccRQoOoF2m2D1ef5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24348173"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000";
   d="scan'208";a="24348173"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 08:30:57 -0700
X-CSE-ConnectionGUID: R+7+mf/zRxCcV6DbRi4D6A==
X-CSE-MsgGUID: +8jCcKrWQP6iKzrYNSNOUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000";
   d="scan'208";a="73678789"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 31 May 2024 08:30:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EA704679; Fri, 31 May 2024 18:30:39 +0300 (EEST)
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
Subject: [PATCH v2 5/6] ASoC: generic: Replace of_gpio.h by proper one
Date: Fri, 31 May 2024 18:29:32 +0300
Message-ID: <20240531153038.1590171-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240531153038.1590171-1-andriy.shevchenko@linux.intel.com>
References: <20240531153038.1590171-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PO4HIS2XYTVXEOF5PE6AIPIBD2VBRUFM
X-Message-ID-Hash: PO4HIS2XYTVXEOF5PE6AIPIBD2VBRUFM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PO4HIS2XYTVXEOF5PE6AIPIBD2VBRUFM/>
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

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/generic/audio-graph-card2-custom-sample.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.c b/sound/soc/generic/audio-graph-card2-custom-sample.c
index 1b6ccd2de964..8e5a51098490 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.c
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.c
@@ -5,8 +5,9 @@
 // Copyright (C) 2020 Renesas Electronics Corp.
 // Copyright (C) 2020 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 //
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <sound/graph_card.h>
 
-- 
2.43.0.rc1.1336.g36b5255a03ac

