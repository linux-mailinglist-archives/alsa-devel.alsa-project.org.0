Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE41353F000
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:39:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 830D11B40;
	Mon,  6 Jun 2022 22:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 830D11B40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654547980;
	bh=FJml6Co9p0cBpNQyBpViSHlJmowpg0qGsTm1UcMkgno=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mp7kJStw2NbXD0kjKXjDqIkiQDaSyYJ2eij2PA6XZ/hNFj0X80tceWE41iCp2NWm6
	 7ynrPoakNlC5XRjSxO5ZUQQDZF9nsNI5nEdnvqVaSZYMgc7YkJC0MC1FflNOWurQiY
	 TQw9/cLpF+BpD92j6KMpfJxYXCL0Qk8GTbWaQYbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38721F80527;
	Mon,  6 Jun 2022 22:38:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CF6CF80528; Mon,  6 Jun 2022 22:38:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82C2BF80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82C2BF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Xfo3hquI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654547887; x=1686083887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FJml6Co9p0cBpNQyBpViSHlJmowpg0qGsTm1UcMkgno=;
 b=Xfo3hquI9q/N7WcyuSO39Vf1+3UTmGEisLWa2Sm4BmlDDL3idEldlVhz
 nm7By4o7KWQpnlewGQpdu2deTFB4H+pIyYkbrjgISrYyGvyVfuxkkFplj
 xKCAwIHzukdf3b46AW6uXaOlphieZljLuARcnkQnO6Ha+k3mRJQEtrVQx
 eB18MPyDB8JDf/x7i6wrXsSPH+ezw7qDuRrjwqLDIdEMUYG5hDomcCVcy
 ATt5P7xjyUHjZfpSRozM0vaxIkBj2ghkAT23voUWzKgqc8MDwfQH8YPED
 tqu9ls29EY7jTgdGqEbqf5l5gORh5TnDc6ZtHQ2rI8W+gkvQ3dnwa85mt Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276730863"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="276730863"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:38:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="647728075"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:38:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ASoC: rt711-sdca-sdw: fix calibrate mutex initialization
Date: Mon,  6 Jun 2022 15:37:47 -0500
Message-Id: <20220606203752.144159-3-pierre-louis.bossart@linux.intel.com>
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

In codec driver bind/unbind test, the following warning is thrown:

DEBUG_LOCKS_WARN_ON(lock->magic != lock)
...
[  699.182495]  rt711_sdca_jack_init+0x1b/0x1d0 [snd_soc_rt711_sdca]
[  699.182498]  rt711_sdca_set_jack_detect+0x3b/0x90 [snd_soc_rt711_sdca]
[  699.182500]  snd_soc_component_set_jack+0x24/0x50 [snd_soc_core]

A quick check in the code shows that the 'calibrate_mutex' used by
this driver are not initialized at probe time. Moving the
initialization to the probe removes the issue.

BugLink: https://github.com/thesofproject/linux/issues/3644
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 3 +++
 sound/soc/codecs/rt711-sdca.c     | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index c722a2b0041f7..a085b2f530aa1 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -373,6 +373,9 @@ static int rt711_sdca_sdw_remove(struct sdw_slave *slave)
 	if (rt711->first_hw_init)
 		pm_runtime_disable(&slave->dev);
 
+	mutex_destroy(&rt711->calibrate_mutex);
+	mutex_destroy(&rt711->disable_irq_lock);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 57629c18db384..af73bcb4560a3 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -1412,6 +1412,7 @@ int rt711_sdca_init(struct device *dev, struct regmap *regmap,
 	rt711->regmap = regmap;
 	rt711->mbq_regmap = mbq_regmap;
 
+	mutex_init(&rt711->calibrate_mutex);
 	mutex_init(&rt711->disable_irq_lock);
 
 	/*
@@ -1550,7 +1551,6 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 			rt711_sdca_jack_detect_handler);
 		INIT_DELAYED_WORK(&rt711->jack_btn_check_work,
 			rt711_sdca_btn_check_handler);
-		mutex_init(&rt711->calibrate_mutex);
 	}
 
 	/* calibration */
-- 
2.34.1

