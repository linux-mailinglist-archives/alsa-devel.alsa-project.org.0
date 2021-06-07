Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF99539E987
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:25:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DEA41675;
	Tue,  8 Jun 2021 00:24:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DEA41675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623104736;
	bh=Vx2Yg2aTFSqcReHUtaMkQPlfUJeQuIomniTI5eSxlXo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RnzGPIsRu0grbIyhgIfK8nHxAQuGw0E4hP34HUYkHESL8bwgbJzEEecn+0rOBFLA0
	 EyINCYkk1Z/TVea+tnFfxdTpZ702+nAyZwNIfKSi9YBoqF/1S965LKzZNNDQSUdgSZ
	 TgMgDgJgzL825APfPU5v2J1r/DRIG6ICsZkWBhQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 507D4F804E1;
	Tue,  8 Jun 2021 00:23:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FC81F804CA; Tue,  8 Jun 2021 00:23:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 083CBF8020D
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 083CBF8020D
IronPort-SDR: BreQESDbz+phqe5R9ff3gHm71vED2tJ4WYcYM83Dgju3YYDl+Bt4A0f1NWvCZT47oMMRHfKAW0
 m2/z/W1Cdv9A==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="202867354"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="202867354"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:03 -0700
IronPort-SDR: 7cBkbwl6W1MEcxD7B3dRH4VNvDapqjZkG2bV9V3ONb1nKsWsXW2eoL/IEmZa3DD5YmeQH+b2zJ
 T9jrvOgnR41w==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="449270959"
Received: from ticela-or-160.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/15] ASoC: max98373-sdw: use first_hw_init flag on resume
Date: Mon,  7 Jun 2021 17:22:26 -0500
Message-Id: <20210607222239.582139-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
References: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Ryan Lee <ryans.lee@maximintegrated.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

The intent of the status check on resume was to verify if a SoundWire
peripheral reported ATTACHED before waiting for the initialization to
complete. This is required to avoid timeouts that will happen with
'ghost' devices that are exposed in the platform firmware but are not
populated in hardware.

Unfortunately we used 'hw_init' instead of 'first_hw_init'. Due to
another error, the resume operation never timed out, but the volume
settings were not properly restored.

This patch renames the status flag to 'first_hw_init' for consistency
with other drivers.

BugLink: https://github.com/thesofproject/linux/issues/2637
Fixes: 56a5b7910e96 ('ASoC: codecs: max98373: add SoundWire support')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 sound/soc/codecs/max98373-sdw.c | 12 ++++++------
 sound/soc/codecs/max98373.h     |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index c7a3506046db..dc520effc61c 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -271,7 +271,7 @@ static __maybe_unused int max98373_resume(struct device *dev)
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
 	unsigned long time;
 
-	if (!max98373->hw_init)
+	if (!max98373->first_hw_init)
 		return 0;
 
 	if (!slave->unattach_request)
@@ -362,7 +362,7 @@ static int max98373_io_init(struct sdw_slave *slave)
 	struct device *dev = &slave->dev;
 	struct max98373_priv *max98373 = dev_get_drvdata(dev);
 
-	if (max98373->pm_init_once) {
+	if (max98373->first_hw_init) {
 		regcache_cache_only(max98373->regmap, false);
 		regcache_cache_bypass(max98373->regmap, true);
 	}
@@ -370,7 +370,7 @@ static int max98373_io_init(struct sdw_slave *slave)
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
 	 */
-	if (!max98373->pm_init_once) {
+	if (!max98373->first_hw_init) {
 		/* set autosuspend parameters */
 		pm_runtime_set_autosuspend_delay(dev, 3000);
 		pm_runtime_use_autosuspend(dev);
@@ -462,12 +462,12 @@ static int max98373_io_init(struct sdw_slave *slave)
 	regmap_write(max98373->regmap, MAX98373_R20B5_BDE_EN, 1);
 	regmap_write(max98373->regmap, MAX98373_R20E2_LIMITER_EN, 1);
 
-	if (max98373->pm_init_once) {
+	if (max98373->first_hw_init) {
 		regcache_cache_bypass(max98373->regmap, false);
 		regcache_mark_dirty(max98373->regmap);
 	}
 
-	max98373->pm_init_once = true;
+	max98373->first_hw_init = true;
 	max98373->hw_init = true;
 
 	pm_runtime_mark_last_busy(dev);
@@ -797,7 +797,7 @@ static int max98373_init(struct sdw_slave *slave, struct regmap *regmap)
 	max98373_slot_config(dev, max98373);
 
 	max98373->hw_init = false;
-	max98373->pm_init_once = false;
+	max98373->first_hw_init = false;
 
 	/* codec registration  */
 	ret = devm_snd_soc_register_component(dev, &soc_codec_dev_max98373_sdw,
diff --git a/sound/soc/codecs/max98373.h b/sound/soc/codecs/max98373.h
index 73a2cf69d84a..e1810b3b1620 100644
--- a/sound/soc/codecs/max98373.h
+++ b/sound/soc/codecs/max98373.h
@@ -226,7 +226,7 @@ struct max98373_priv {
 	/* variables to support soundwire */
 	struct sdw_slave *slave;
 	bool hw_init;
-	bool pm_init_once;
+	bool first_hw_init;
 	int slot;
 	unsigned int rx_mask;
 };
-- 
2.25.1

