Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEF4424102
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 17:13:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5E401664;
	Wed,  6 Oct 2021 17:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5E401664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633533196;
	bh=6ZP1T0zi4GEHhyezhGrZm9yRl7Ne+meNJIYPNXlFoQg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hQxKKBfQD0WqI8toHKwKui/PmDeHcFuUjyh0xNeVYfcAetIPKNzgWbx3Cafqu4WrE
	 6CTrtZwPXBfLsSJ1P/uMmeH5cjDyEvyXb8JFaOAQVBxw5m4nFo0MJBT7TBXkw/rVLD
	 il3Jjvy9aYtET29h/Qx0HLBcmPQGlxjdpWmCC0xk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 613ACF80302;
	Wed,  6 Oct 2021 17:11:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 887E3F800FE; Wed,  6 Oct 2021 17:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9039CF800FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 17:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9039CF800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="223411113"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="223411113"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 08:04:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439923809"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 06 Oct 2021 08:04:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id BD6F9159; Wed,  6 Oct 2021 18:04:44 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] ASoC: Intel: bytcr_rt5640: Get platform data via
 dev_get_platdata()
Date: Wed,  6 Oct 2021 18:04:39 +0300
Message-Id: <20211006150442.16503-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
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

