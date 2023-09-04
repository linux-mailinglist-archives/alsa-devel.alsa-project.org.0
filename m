Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A2791622
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 13:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACA653E8;
	Mon,  4 Sep 2023 13:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACA653E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693826195;
	bh=nnvwoGm/BJ54eCLN5Pwc7J++DCqfffic+2zXJ1vq+cc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=O92a7ymFhVJRw28HF+jO+Z18Ap7CSDaJZbt5X2n2CW8D/IAMA/9vPAJ+bavd5NgzN
	 yV5oD4IPQEdzEL//xDG/YJ2KuFOet3kpjcsFQTKYN9QXjSawwCw600Ne7awZbwOzN3
	 BMCPMuR5yaOTIFiqcQlhz1eKxee01Bdg4DxSaflI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 222A1F800AA; Mon,  4 Sep 2023 13:15:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6E47F80431;
	Mon,  4 Sep 2023 13:15:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A462F8047D; Mon,  4 Sep 2023 13:15:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60B45F80141
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 13:15:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60B45F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RlAeQLBH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693826137; x=1725362137;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nnvwoGm/BJ54eCLN5Pwc7J++DCqfffic+2zXJ1vq+cc=;
  b=RlAeQLBHT74SY34bG7PZ3/aVUv42niSAdVhY3yQZNq9m9/zNmAKFojvy
   T0kJ15TogqWNZGyV7hT2CjHoFeP6iP7dpmJpDIsxHXRC021+WtoGLJ+Xe
   N2vqU+wQ+qE+eJkKP4nvu9qNe1qnv4akQTpbmezUvjGrcMugwynW/CHET
   H7U/3tRHg/guhXHUVW29TGiAGvVtZsQIhV6NbQU6csL3X4fV36Q78B8rw
   e8iMKeiHKJHzBgwqXfnknnfXc8KdmsB1NyAJLLcqqJGqoEsjZdf8bmP7K
   9ClvbrFGxJp1nIaNJgo00cBznc3OdgwFvCopqSvJqknbelCYlBry7YGhO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="380376538"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000";
   d="scan'208";a="380376538"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 04:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="914477282"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000";
   d="scan'208";a="914477282"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 04 Sep 2023 04:15:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 79443919; Mon,  4 Sep 2023 14:15:26 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ASoC: soc.h: replace custom COUNT_ARGS() &
 CONCATENATE() implementations
Date: Mon,  4 Sep 2023 14:15:24 +0300
Message-Id: <20230904111524.1740930-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OH4O7B5PB4WAC4ZUNFE2HLTVHQ3PT72Y
X-Message-ID-Hash: OH4O7B5PB4WAC4ZUNFE2HLTVHQ3PT72Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OH4O7B5PB4WAC4ZUNFE2HLTVHQ3PT72Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace custom implementation of the macros from args.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/sound/soc.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index fa2337a3cf4c..509386ff5212 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -10,6 +10,7 @@
 #ifndef __LINUX_SND_SOC_H
 #define __LINUX_SND_SOC_H
 
+#include <linux/args.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
@@ -870,12 +871,8 @@ asoc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 	.platforms	= platform,			\
 	.num_platforms	= ARRAY_SIZE(platform)
 
-#define SND_SOC_DAILINK_REGx(_1, _2, _3, func, ...) func
 #define SND_SOC_DAILINK_REG(...) \
-	SND_SOC_DAILINK_REGx(__VA_ARGS__,		\
-			SND_SOC_DAILINK_REG3,	\
-			SND_SOC_DAILINK_REG2,	\
-			SND_SOC_DAILINK_REG1)(__VA_ARGS__)
+	CONCATENATE(SND_SOC_DAILINK_REG, COUNT_ARGS(__VA_ARGS__))(__VA_ARGS__)
 
 #define SND_SOC_DAILINK_DEF(name, def...)		\
 	static struct snd_soc_dai_link_component name[]	= { def }
-- 
2.40.0.1.gaa8946217a0b

