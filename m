Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E4C6670D0
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 12:24:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFDDF8AEE;
	Thu, 12 Jan 2023 12:23:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFDDF8AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673522685;
	bh=9KAbnHL0UiVDA9+ZptE4cD++4OwAL8HyjhzOIXTCDOc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=F90ao6MPyPf7IfEIZF32/E4KcD1ydaipKJsfPdhOGiKOShCrYu2ahW6PzSYxBuEh8
	 0o5Ozx/QiNi5q/FEqrKdsjuPwk/KAdYi0el6AzNh12FrqgQ4NUZBcthiLhvn1clIjX
	 THRmrQvMijHmdiLpSYvGPeVbOpa9Ko7L3QawU1EU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 677D5F8016E;
	Thu, 12 Jan 2023 12:23:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66817F8016E; Thu, 12 Jan 2023 12:23:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1092F8016E
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 12:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1092F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IGQCUpcK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673522624; x=1705058624;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9KAbnHL0UiVDA9+ZptE4cD++4OwAL8HyjhzOIXTCDOc=;
 b=IGQCUpcKBf9Izef+7f45MXpO3pGJRY+unJZR6o8kIXfSvK2ZDQWRZlfw
 Q4e6ZulYmZqP4qM31brosCW0nJISneF7eJB41yTjNqAouJVWW59zfAol5
 Hd805XWSzWlxdb4GHiAA8SCpeBaJjFmXO4SkDe/jSgIznIuPCQQzS4uiv
 IL8fVlJACnDCFh7SX6uv+e6UYTfCOPBHhH6FBibeDxLEk8CkETQ6WKNpr
 wCf2AF4oVZaCbLSgemrU7AjGTveGB+bKw+PIMOuvhvGTPHmgABGiaBvI3
 LorDqsfLJgnabtudTSrVBC4wm+zgRmc4R6AEeHoScdvSLTIk7bHsN1hQB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325704375"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="325704375"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 03:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607750221"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="607750221"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 12 Jan 2023 03:23:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 59258130; Thu, 12 Jan 2023 13:24:04 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] ASoC: amd: acp-es8336: Drop reference count of ACPI
 device after use
Date: Thu, 12 Jan 2023 13:23:56 +0200
Message-Id: <20230112112356.67643-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Theoretically the device might gone if its reference count drops to 0.
This might be the case when we try to find the first physical node of
the ACPI device. We need to keep reference to it until we get a result
of the above mentioned call. Refactor the code to drop the reference
count at the correct place.

While at it, move to acpi_dev_put() as symmetrical call to the
acpi_dev_get_first_match_dev().

Fixes: 02527c3f2300 ("ASoC: amd: add Machine driver for Jadeite platform")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v2: split from big series (Pierre), added tag (Vijendar)
 sound/soc/amd/acp-es8336.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 2fe8df86053a..89499542c803 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -198,9 +198,11 @@ static int st_es8336_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	adev = acpi_dev_get_first_match_dev("ESSX8336", NULL, -1);
-	if (adev)
-		put_device(&adev->dev);
+	if (!adev)
+		return -ENODEV;
+
 	codec_dev = acpi_get_first_physical_node(adev);
+	acpi_dev_put(adev);
 	if (!codec_dev)
 		dev_err(card->dev, "can not find codec dev\n");
 
-- 
2.39.0

