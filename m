Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BAF4258AF
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 18:59:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 875BF166F;
	Thu,  7 Oct 2021 18:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 875BF166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633625964;
	bh=6ZP1T0zi4GEHhyezhGrZm9yRl7Ne+meNJIYPNXlFoQg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VK2h4p/gnH/YcPkuIC9TMleYmhYyk8lNJJyEk9qfsdNsE1oS7R0BYEsvkM7QN8sQl
	 jFfh3UOHVVeiV6LZBbRqBeW40ZZueouKKybFaDnkGkLCKTuKN4dVMbmUKKsuyKsxOn
	 UU+/hacuRqAyZUoA1isfknuZ7sd4vmJClGNqNKBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31B72F804E6;
	Thu,  7 Oct 2021 18:57:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7979F804CF; Thu,  7 Oct 2021 18:57:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0391F800FE
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 18:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0391F800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="226260929"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="226260929"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="458862079"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Oct 2021 09:57:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A78E8B7; Thu,  7 Oct 2021 19:57:19 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] ASoC: Intel: bytcr_rt5640: Get platform data via
 dev_get_platdata()
Date: Thu,  7 Oct 2021 19:57:12 +0300
Message-Id: <20211007165715.27463-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007165715.27463-1-andriy.shevchenko@linux.intel.com>
References: <20211007165715.27463-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Access to platform data via dev_get_platdata() getter to make code cleaner.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index c28abe74816f..43997048a825 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1495,12 +1495,12 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	static const char * const map_name[] = { "dmic1", "dmic2", "in1", "in3", "none" };
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	__maybe_unused const char *spk_type;
 	const struct dmi_system_id *dmi_id;
 	const char *headset2_string = "";
 	const char *lineout_string = "";
 	struct byt_rt5640_private *priv;
-	struct snd_soc_acpi_mach *mach;
 	const char *platform_name;
 	struct acpi_device *adev;
 	struct device *codec_dev;
@@ -1517,7 +1517,6 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 
 	/* register the soc card */
 	byt_rt5640_card.dev = &pdev->dev;
-	mach = byt_rt5640_card.dev->platform_data;
 	snd_soc_card_set_drvdata(&byt_rt5640_card, priv);
 
 	/* fix index of codec dai */
-- 
2.33.0

