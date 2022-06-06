Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE1E53F00C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:40:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62EDD1B55;
	Mon,  6 Jun 2022 22:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62EDD1B55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654548042;
	bh=Qi8Tnz14spmlT3/ARHwPvm8Eq4UxjpOfELypSQjvn1s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l5kubv5g20+FojSMxpR6NKR8EzmklnEUMDUbsu/RuK4dzwz1jhJ4+zBJ8X//dNrLg
	 iUsmj++4mCTLBHm7+JimqLt9ylyUVjvgHIqghYah5WSfu1d301yf9YqgRXOW81SimC
	 fJ//wnxsLKg1rXoEj58POy6o+WoxGr5aQ/fZKxjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2467DF8053B;
	Mon,  6 Jun 2022 22:38:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F172CF80089; Mon,  6 Jun 2022 22:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C390CF80089
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C390CF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aeeCEFU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654547891; x=1686083891;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qi8Tnz14spmlT3/ARHwPvm8Eq4UxjpOfELypSQjvn1s=;
 b=aeeCEFU6VFUCVUG5XqYOrbY0W/BHvgbMzMprVP0DEweNxJK3efB8X6HS
 WdcZGAgZ6U2IiqH5TlfrlSRQ7fD7yGy6EwiH2+6h+gmIGOaNHIXeMst36
 o4tE0nJPAdPylE3lMnAzLIMBd4IMOmC07ft1yXg++wK+/4OZ+u5tad0VV
 daonJtkQFF0G2YR9BPQKJTvCC2gNdBB7kHTzQ/wM9ti7X3TQHIFuHkaog
 Eb7HPt1LsSxyx2zkl0vo6neOcT6MOH5qjn9bIs+kmCyAOa59rNPFN5x4O
 NmS2RwYjMR9jjS5zhyjeNMsJoIBg9C5Hb/cLOQ1yJvXfy7apUpOvq4pMi w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276730868"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="276730868"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:38:03 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="647728097"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:38:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ASoC: codecs: rt700/rt711/rt711-sdca: initialize
 workqueues in probe
Date: Mon,  6 Jun 2022 15:37:51 -0500
Message-Id: <20220606203752.144159-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606203752.144159-1-pierre-louis.bossart@linux.intel.com>
References: <20220606203752.144159-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The workqueues are initialized in the io_init functions, which isn't
quite right. In some tests, this leads to warnings throw from
__queue_delayed_work()

WARN_ON_FUNCTION_MISMATCH(timer->function, delayed_work_timer_fn);

Move all the initializations to the probe functions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt700.c      | 12 +++++-------
 sound/soc/codecs/rt711-sdca.c | 10 +++-------
 sound/soc/codecs/rt711.c      | 12 +++++-------
 3 files changed, 13 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 4a99d5f4706fd..7a6cf3434591a 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -1115,6 +1115,11 @@ int rt700_init(struct device *dev, struct regmap *sdw_regmap,
 
 	mutex_init(&rt700->disable_irq_lock);
 
+	INIT_DELAYED_WORK(&rt700->jack_detect_work,
+			  rt700_jack_detect_handler);
+	INIT_DELAYED_WORK(&rt700->jack_btn_check_work,
+			  rt700_btn_check_handler);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
@@ -1209,13 +1214,6 @@ int rt700_io_init(struct device *dev, struct sdw_slave *slave)
 	/* Finish Initial Settings, set power to D3 */
 	regmap_write(rt700->regmap, RT700_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
-	if (!rt700->first_hw_init) {
-		INIT_DELAYED_WORK(&rt700->jack_detect_work,
-			rt700_jack_detect_handler);
-		INIT_DELAYED_WORK(&rt700->jack_btn_check_work,
-			rt700_btn_check_handler);
-	}
-
 	/*
 	 * if set_jack callback occurred early than io_init,
 	 * we set up the jack detection function now
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 93b36f05cb567..2b3b77577d1fd 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -1415,6 +1415,9 @@ int rt711_sdca_init(struct device *dev, struct regmap *regmap,
 	mutex_init(&rt711->calibrate_mutex);
 	mutex_init(&rt711->disable_irq_lock);
 
+	INIT_DELAYED_WORK(&rt711->jack_detect_work, rt711_sdca_jack_detect_handler);
+	INIT_DELAYED_WORK(&rt711->jack_btn_check_work, rt711_sdca_btn_check_handler);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
@@ -1546,13 +1549,6 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	rt711_sdca_index_update_bits(rt711, RT711_VENDOR_HDA_CTL,
 		RT711_PUSH_BTN_INT_CTL0, 0x20, 0x00);
 
-	if (!rt711->first_hw_init) {
-		INIT_DELAYED_WORK(&rt711->jack_detect_work,
-			rt711_sdca_jack_detect_handler);
-		INIT_DELAYED_WORK(&rt711->jack_btn_check_work,
-			rt711_sdca_btn_check_handler);
-	}
-
 	/* calibration */
 	ret = rt711_sdca_calibration(rt711);
 	if (ret < 0)
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 2f445b27305a4..5709a6bbe8fc5 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -1207,6 +1207,10 @@ int rt711_init(struct device *dev, struct regmap *sdw_regmap,
 	mutex_init(&rt711->calibrate_mutex);
 	mutex_init(&rt711->disable_irq_lock);
 
+	INIT_DELAYED_WORK(&rt711->jack_detect_work, rt711_jack_detect_handler);
+	INIT_DELAYED_WORK(&rt711->jack_btn_check_work, rt711_btn_check_handler);
+	INIT_WORK(&rt711->calibration_work, rt711_calibration_work);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
@@ -1314,14 +1318,8 @@ int rt711_io_init(struct device *dev, struct sdw_slave *slave)
 
 	if (rt711->first_hw_init)
 		rt711_calibration(rt711);
-	else {
-		INIT_DELAYED_WORK(&rt711->jack_detect_work,
-			rt711_jack_detect_handler);
-		INIT_DELAYED_WORK(&rt711->jack_btn_check_work,
-			rt711_btn_check_handler);
-		INIT_WORK(&rt711->calibration_work, rt711_calibration_work);
+	else
 		schedule_work(&rt711->calibration_work);
-	}
 
 	/*
 	 * if set_jack callback occurred early than io_init,
-- 
2.34.1

