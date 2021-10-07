Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCA342585D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 18:49:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84D151675;
	Thu,  7 Oct 2021 18:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84D151675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633625345;
	bh=9CL2uh2g4XoQEK8GSlKFYfNVeZ17fVJBas3j2rL5yZw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GTtI4wges+W9IlQmhPYyxUhKptl4rCUcQVGNPQzRQgrGYz45xnQIWyqe9NYm9AYEc
	 Tt+r2wCOvjB6OzF1paarCzYj2VKZiIT68uBZSd0gAUHyKL/EU4nK9b1/3iwLE1wirs
	 yZO7/TJEuXQB9k/M3T6OiXjZ4TgavLvmExJnB5zY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0774F804E2;
	Thu,  7 Oct 2021 18:47:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79CEDF804E0; Thu,  7 Oct 2021 18:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B2C6F80259
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 18:47:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B2C6F80259
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="206428463"
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="206428463"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2021 09:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,355,1624345200"; d="scan'208";a="560632587"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Oct 2021 09:45:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A991DB7; Thu,  7 Oct 2021 19:45:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] ASoC: Intel: bytcht_es8316: Get platform data via
 dev_get_platdata()
Date: Thu,  7 Oct 2021 19:45:20 +0300
Message-Id: <20211007164523.27094-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007164523.27094-1-andriy.shevchenko@linux.intel.com>
References: <20211007164523.27094-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
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
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bytcht_es8316.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 1bb9b8e7bcc7..4360519fbb0c 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -456,12 +456,12 @@ static const struct dmi_system_id byt_cht_es8316_quirk_table[] = {
 
 static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	static const char * const mic_name[] = { "in1", "in2" };
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(dev);
 	struct property_entry props[MAX_NO_PROPS] = {};
 	struct byt_cht_es8316_private *priv;
 	const struct dmi_system_id *dmi_id;
-	struct device *dev = &pdev->dev;
-	struct snd_soc_acpi_mach *mach;
 	struct fwnode_handle *fwnode;
 	const char *platform_name;
 	struct acpi_device *adev;
@@ -476,7 +476,6 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	mach = dev->platform_data;
 	/* fix index of codec dai */
 	for (i = 0; i < ARRAY_SIZE(byt_cht_es8316_dais); i++) {
 		if (!strcmp(byt_cht_es8316_dais[i].codecs->name,
-- 
2.33.0

