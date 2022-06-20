Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC8C551557
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:08:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A02E418D8;
	Mon, 20 Jun 2022 12:07:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A02E418D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719719;
	bh=4Os6VcoByF729ZusiIDeFEgM/pmPMoUZHR6pZnSEW+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U2xU/3jR9oLw6VYX30zOa8lmb5YJHjvRfsd1Nm//kmeaBBvrMIDip2AwHrt/caOu+
	 2SZw9hr11yj62rtaqcW81hf4Cr5wG2C00iJkdZT7TI/kw16ska+4KJSuQll8INFiDy
	 kQZipQcVhDb76ghDtxKHC5lnnRYiCPtzH1R+XKKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2BA2F805AE;
	Mon, 20 Jun 2022 12:04:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30132F80589; Mon, 20 Jun 2022 12:04:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0605F80548
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0605F80548
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BK5X9KTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719456; x=1687255456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4Os6VcoByF729ZusiIDeFEgM/pmPMoUZHR6pZnSEW+Y=;
 b=BK5X9KTWcXMIBOw2t/H+v8bPU76w3zmbbsJ8pSMovNu0k5cDasAOizqI
 CEWtu/4o7f5s0ZwAzDfzWky541fvKmZZY5+r4T+SrtPAtKTdr9JN902nO
 uJ33wAq8T8pkePiT0Eq6NXrY20CBRQi1mqtvSfC8nwzVs1aqVC2ENLG8d
 9QykyKhuEoQ9g45cUG2G+GKvL2LIGsSKxaaUO0gIyHAPlN4XsYzBUfU4C
 puHRU2IxCTh3z90pzdBH3bhej5hu1GzLcV3T/DygbSk2CADV/Jz5ke51j
 I7V7+McA3dlJNVGEvf7QWT/25T/6mK84YFpYNiYEV0s3tdEFLx2k7OrEw w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366180722"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366180722"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046396"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:04:13 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 13/17] ASoC: Intel: bdw_rt286: Improve probe() function
 quality
Date: Mon, 20 Jun 2022 12:13:58 +0200
Message-Id: <20220620101402.2684366-14-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620101402.2684366-1-cezary.rojewski@intel.com>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Declare local 'dev' and make use of it plus dev_get_platdata() to
improve code readability. Relocate few relevant to the function macros
for the exact same read too.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 9d815c31e1f4..c5737f548bef 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -235,13 +235,6 @@ static int bdw_rt286_resume(struct snd_soc_card *card)
 	return 0;
 }
 
-/* Use space before codec name to simplify card ID, and simplify driver name. */
-#define SOF_CARD_NAME "bdw rt286" /* card name will be 'sof-bdw rt286' */
-#define SOF_DRIVER_NAME "SOF"
-
-#define CARD_NAME "broadwell-rt286"
-#define DRIVER_NAME NULL /* card name will be used for driver name */
-
 static struct snd_soc_card bdw_rt286_card = {
 	.owner = THIS_MODULE,
 	.dai_link = card_dai_links,
@@ -257,27 +250,33 @@ static struct snd_soc_card bdw_rt286_card = {
 	.resume_post = bdw_rt286_resume,
 };
 
+/* Use space before codec name to simplify card ID, and simplify driver name. */
+#define SOF_CARD_NAME "bdw rt286" /* card name will be 'sof-bdw rt286' */
+#define SOF_DRIVER_NAME "SOF"
+
+#define CARD_NAME "broadwell-rt286"
+
 static int bdw_rt286_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach;
+	struct device *dev = &pdev->dev;
 	int ret;
 
-	bdw_rt286_card.dev = &pdev->dev;
-	mach = pdev->dev.platform_data;
+	bdw_rt286_card.dev = dev;
+	mach = dev_get_platdata(dev);
 
 	ret = snd_soc_fixup_dai_links_platform_name(&bdw_rt286_card, mach->mach_params.platform);
 	if (ret)
 		return ret;
 
-	if (snd_soc_acpi_sof_parent(&pdev->dev)) {
+	if (snd_soc_acpi_sof_parent(dev)) {
 		bdw_rt286_card.name = SOF_CARD_NAME;
 		bdw_rt286_card.driver_name = SOF_DRIVER_NAME;
 	} else {
 		bdw_rt286_card.name = CARD_NAME;
-		bdw_rt286_card.driver_name = DRIVER_NAME;
 	}
 
-	return devm_snd_soc_register_card(&pdev->dev, &bdw_rt286_card);
+	return devm_snd_soc_register_card(dev, &bdw_rt286_card);
 }
 
 static int bdw_rt286_remove(struct platform_device *pdev)
-- 
2.25.1

