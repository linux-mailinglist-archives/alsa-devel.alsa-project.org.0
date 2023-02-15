Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21864697D16
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 14:24:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22D2D82A;
	Wed, 15 Feb 2023 14:23:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22D2D82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676467452;
	bh=WUgNwUhbHaN9HZCnYj8+XtWA1iYsv49O9uBI9FvhwpY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pOl0kcKKpN7EgrFMTh/DM4J8buQ4m7bW3GO2uXk+D1q1tvjEIu5onG9QcLUIIpGPU
	 bNSykF45HlwG4keUQxs0TL81V5Sz6H1UtPYJEJA/RcBAvClnj2MgLvWwE/LDmmiL97
	 0wNpHoZq7ue8TCZ7eWF5dwtisDGN8Sc3AzFtc2jE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BAB1F801C0;
	Wed, 15 Feb 2023 14:23:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BF43F800E4; Wed, 15 Feb 2023 14:23:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4951F800E4
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 14:23:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4951F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IYuEuJgu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676467392; x=1708003392;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WUgNwUhbHaN9HZCnYj8+XtWA1iYsv49O9uBI9FvhwpY=;
  b=IYuEuJgu15WKXhurMBeZCF/Zxd/lLN2UYvSBFnOIX8pVqN9wZui97oqC
   b5+5fo80zwxI4LER6g9FdzlmLzAhEuuY7aZTUj7bkj7R0j09PU3hHllA1
   HSW6s9IT8gi7Z8RASGXA91Kk7S9d8AVjyvxgGkW0b32taNxUwDj3v1vOE
   Kodph3cgYqch54Rg+qaGaSpvqiaQtY/RywQKo5w1sZRJxBanhJO8UyE+i
   gtDfZ5TC35VfWZX+f6wEx/CFRl3zCXBdrOW+CHWIMc9c2CRuimE+NU/LU
   dhGquU6Bs2xKUrLMg+Edj43iZyzcqQ8Xw9tMxJKlGXIjtQ5gYSErDOg57
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="333563902"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000";
   d="scan'208";a="333563902"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 05:23:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="733281649"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000";
   d="scan'208";a="733281649"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 15 Feb 2023 05:23:05 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 56FC51A6; Wed, 15 Feb 2023 15:23:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] ASoC: soc-ac97: Return correct error codes
Date: Wed, 15 Feb 2023 15:23:43 +0200
Message-Id: <20230215132343.35547-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EUWLNQLOTDXFK2VHORHOF6ROBQNN7XHD
X-Message-ID-Hash: EUWLNQLOTDXFK2VHORHOF6ROBQNN7XHD
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, kernel test robot <lkp@intel.com>,
 Dan Carpenter <error27@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUWLNQLOTDXFK2VHORHOF6ROBQNN7XHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With the switching to dev_err_probe(), during the conversion
of GPIO calls, the return code is passed is a paratemer to it.
At the same time a copy'n'paste mistake was made, so the wrong
variable has been taken for the error reporting. Fix this.

Fixes: 3ee0d39c50dc ("ASoC: soc-ac97: Convert to agnostic GPIO API")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/soc-ac97.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-ac97.c b/sound/soc/soc-ac97.c
index 40051f513c6a..4e4fe29ade50 100644
--- a/sound/soc/soc-ac97.c
+++ b/sound/soc/soc-ac97.c
@@ -336,12 +336,12 @@ static int snd_soc_ac97_parse_pinctl(struct device *dev,
 
 	cfg->sdata_gpio = devm_gpiod_get_index(dev, "ac97", 1, GPIOD_ASIS);
 	if (IS_ERR(cfg->sdata_gpio))
-		return dev_err_probe(dev, PTR_ERR(cfg->sync_gpio), "Can't find ac97-sdata gpio\n");
+		return dev_err_probe(dev, PTR_ERR(cfg->sdata_gpio), "Can't find ac97-sdata gpio\n");
 	gpiod_set_consumer_name(cfg->sdata_gpio, "AC97 link sdata");
 
 	cfg->reset_gpio = devm_gpiod_get_index(dev, "ac97", 2, GPIOD_ASIS);
 	if (IS_ERR(cfg->reset_gpio))
-		return dev_err_probe(dev, PTR_ERR(cfg->sync_gpio), "Can't find ac97-reset gpio\n");
+		return dev_err_probe(dev, PTR_ERR(cfg->reset_gpio), "Can't find ac97-reset gpio\n");
 	gpiod_set_consumer_name(cfg->reset_gpio, "AC97 link reset");
 
 	return 0;
-- 
2.39.1

