Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C245339E999
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:28:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61ACC16A0;
	Tue,  8 Jun 2021 00:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61ACC16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623104908;
	bh=bKk6zg4vss6/FdhyyfMO4760ms5SyvgHudz/DsP6KVo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mSkDc+CbtDy2fMGsBxa5W70chUZaewFaRK5MysAN7l6tfjl4GvSMWmeK6DYblAImc
	 uLk8Rs0AxDii7bZ0wH5lses6LIvij3BhXDFX66lEjwJ1gEzFMkIqS8DyQswnigcTaM
	 e860ekWDWvQGBo+6rDEbNcTp0oND29Ra9fyMo7XE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E5AEF80518;
	Tue,  8 Jun 2021 00:23:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 948F6F804FF; Tue,  8 Jun 2021 00:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B79CBF804DA
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B79CBF804DA
IronPort-SDR: 3bfYrBZIrk8H2o9buE6P8B6js5Iy6y4YKy6mGMQ8GUjzFwswP1hWOtwU6ZLmPBfJ/NE7IrQVCA
 fQZAbUJemYqA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268581954"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="268581954"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:13 -0700
IronPort-SDR: Q7TZY9+Y7Hg5KqQ3SOsJ6jQ2On3idUQQdV8A5VJq07OfeVkl4eDKJfjc6DU0IWjEoUg5ZHAqWz
 /KjN9uMrMysg==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="449271016"
Received: from ticela-or-160.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/15] ASoC: rt5682: Fix a problem with error handling in the
 io init function of the soundwire
Date: Mon,  7 Jun 2021 17:22:36 -0500
Message-Id: <20210607222239.582139-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
References: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Ryan Lee <ryans.lee@maximintegrated.com>, tiwai@suse.de,
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

From: Oder Chiou <oder_chiou@realtek.com>

The device checking error should be a jump to pm_runtime_put_autosuspend()
as done before returning value.

Fixes: 867f8d18df4f ('ASoC: rt5682: fix getting the wrong device id when the suspend_stress_test')
Reviewed-by: Bard Liao <bard.liao@intel.com>
Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5682-sdw.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 8e4bb9dd194e..529a85fd0a00 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -408,9 +408,11 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 		usleep_range(30000, 30005);
 		loop--;
 	}
+
 	if (val != DEVICE_ID) {
 		dev_err(dev, "Device with ID register %x is not rt5682\n", val);
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_nodev;
 	}
 
 	if (rt5682->first_hw_init) {
@@ -486,10 +488,11 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 	rt5682->hw_init = true;
 	rt5682->first_hw_init = true;
 
+err_nodev:
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put_autosuspend(&slave->dev);
 
-	dev_dbg(&slave->dev, "%s hw_init complete\n", __func__);
+	dev_dbg(&slave->dev, "%s hw_init complete: %d\n", __func__, ret);
 
 	return ret;
 }
-- 
2.25.1

