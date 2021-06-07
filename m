Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A739E99A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:28:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 590E116AC;
	Tue,  8 Jun 2021 00:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 590E116AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623104931;
	bh=CyHQxDnyFXgGaydVKuhUgOS3fxNTJ+VMRuFRq2CTmnc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UOHxYa+GzvSKlFB3kF9282ufTaLlcoXeuYVy+tHmLobF9HEbot0By2SctIdzYapg1
	 26UEUwT2MeUlSRAoOoKOcElavtIBZ+1qEpqbsO9EQHd+Vo3TiKP0F4R5FS4k2/BKVY
	 5umCuS7+3Axe7IZeSVt3yNmR0RtiZFZtLdeTKNpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2863F8051C;
	Tue,  8 Jun 2021 00:23:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70FB7F80507; Tue,  8 Jun 2021 00:23:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9D96F800AF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D96F800AF
IronPort-SDR: Zb2JGcwX7/hV1EhES346PXGUDhiAPn1Rab3JAwoAn/8CcMjSTYIZ6gMQ+jsLQ1wQck+PKxM8yX
 +bluwKLqawVw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="226065338"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="226065338"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:11 -0700
IronPort-SDR: K0tiv+mOLHMLbWrGpWrGQqTeZQF5AQsAOW8cbixkW1F/osrrQM9Ro0d+ysLbi7pl5PoR7gKNIP
 UHap6xqj7lEA==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="449271000"
Received: from ticela-or-160.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/15] ASoC: rt715-sdca-sdw: use first_hw_init flag on resume
Date: Mon,  7 Jun 2021 17:22:33 -0500
Message-Id: <20210607222239.582139-10-pierre-louis.bossart@linux.intel.com>
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
with other drivers (was 'first_init')

BugLink: https://github.com/thesofproject/linux/issues/2908
BugLink: https://github.com/thesofproject/linux/issues/2637
Fixes: 20d17057f0a8c ('ASoC: rt715-sdca: Add RT715 sdca vendor-specific driver')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 sound/soc/codecs/rt715-sdca-sdw.c | 2 +-
 sound/soc/codecs/rt715-sdca.c     | 6 +++---
 sound/soc/codecs/rt715-sdca.h     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 1350798406f0..7646bbe739f1 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -224,7 +224,7 @@ static int __maybe_unused rt715_dev_resume(struct device *dev)
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
 	unsigned long time;
 
-	if (!rt715->hw_init)
+	if (!rt715->first_hw_init)
 		return 0;
 
 	if (!slave->unattach_request)
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 7db76c19e048..d82166f1a378 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -997,7 +997,7 @@ int rt715_sdca_init(struct device *dev, struct regmap *mbq_regmap,
 	 * HW init will be performed when device reports present
 	 */
 	rt715->hw_init = false;
-	rt715->first_init = false;
+	rt715->first_hw_init = false;
 
 	ret = devm_snd_soc_register_component(dev,
 			&soc_codec_dev_rt715_sdca,
@@ -1018,7 +1018,7 @@ int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
 	 */
-	if (!rt715->first_init) {
+	if (!rt715->first_hw_init) {
 		/* set autosuspend parameters */
 		pm_runtime_set_autosuspend_delay(&slave->dev, 3000);
 		pm_runtime_use_autosuspend(&slave->dev);
@@ -1031,7 +1031,7 @@ int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 
 		pm_runtime_enable(&slave->dev);
 
-		rt715->first_init = true;
+		rt715->first_hw_init = true;
 	}
 
 	pm_runtime_get_noresume(&slave->dev);
diff --git a/sound/soc/codecs/rt715-sdca.h b/sound/soc/codecs/rt715-sdca.h
index 85ce4d95e5eb..0c1fdd5bc7ca 100644
--- a/sound/soc/codecs/rt715-sdca.h
+++ b/sound/soc/codecs/rt715-sdca.h
@@ -27,7 +27,7 @@ struct rt715_sdca_priv {
 	enum sdw_slave_status status;
 	struct sdw_bus_params params;
 	bool hw_init;
-	bool first_init;
+	bool first_hw_init;
 	int l_is_unmute;
 	int r_is_unmute;
 	int hw_sdw_ver;
-- 
2.25.1

