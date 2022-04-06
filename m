Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A60E4F69B9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:21:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D99C16CE;
	Wed,  6 Apr 2022 21:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D99C16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649272889;
	bh=sgtcGW7iBQrFBuMvlUOAyGFnEMujK35SSEdpO4J+IAM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=V2licQDBra3e0rH0DiahASeMrfD8Et+69KRN0kP69rOT1SCDPw5bUetuyEyfc8x4M
	 aXsI1W4/OWHaRlBg9vIDKB86ngBtNmxFv/o4OqWOr9nkL7VWNuz4aqYcZvK3fpQzzE
	 pv3hyO+oO3mgPxZ0Htf8UWcS6dcZ6JfgGRZKuUVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3412F80054;
	Wed,  6 Apr 2022 21:20:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0546AF80161; Wed,  6 Apr 2022 21:20:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 268F3F800D1
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 268F3F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KZrzwssY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649272824; x=1680808824;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sgtcGW7iBQrFBuMvlUOAyGFnEMujK35SSEdpO4J+IAM=;
 b=KZrzwssYrYmVxvgOn1G51ziw6iC9NpzzuO8UiUwkCWzAbYU3ZOSoxPSh
 3iP46oMT3jmZA/izEqU2OG6J2Ckb8AQ6CqO8R3hBqU7t7ffXxxki31lxf
 GyYn+Od2FJb16pymuuGAKiS0LypUAXlZ3K7Zx1ZEbq2WoRKn3pxFK/iaY
 rtQuonAHWZVzrvUuIYARuIwoRUte0wRBbg4UwAIfncae8GX5k2+zX2Rcp
 3fM2t5kWiozvoAgJahtOmfGxTCgBehgNGtQ+nQIQxpfCuXTvBJc1vcncO
 9p8IGUYYeIxXe3BvhN5yhfApaCkixL7fpFuWm8PQyPT60QTG4hiPII1eo g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="241724549"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="241724549"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:20:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="570707825"
Received: from cbok-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.137.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:20:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: rt711/5682: check if bus is active before deferred jack
 detection
Date: Wed,  6 Apr 2022 14:20:05 -0500
Message-Id: <20220406192005.262996-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

This patch takes a defensive programming and paranoid approach in case
the parent device (SoundWire) is pm_runtime resumed but the rt711
device is not. In that case, during the attachment and initialization,
a jack detection workqueue can be scheduled. Since the pm_runtime
suspend routines will not be invoked, the sequence to cancel all
deferred work is not executed, and the jack detection could happen
after the bus stops operating, leading to a timeout.

This patch applies the same solution to rt5682, based on the
similarities between codec drivers. The race condition with rt5682 was
not detected experimentally though.

BugLink: https://github.com/thesofproject/linux/issues/3459
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/rt5682.c | 9 +++++++++
 sound/soc/codecs/rt711.c  | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index c9ff9c89adf7..2b6c6d6b9771 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1100,6 +1100,15 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
+	if (rt5682->is_sdw) {
+		if (pm_runtime_status_suspended(rt5682->slave->dev.parent)) {
+			dev_dbg(&rt5682->slave->dev,
+				"%s: parent device is pm_runtime_status_suspended, skipping jack detection\n",
+				__func__);
+			return;
+		}
+	}
+
 	dapm = snd_soc_component_get_dapm(rt5682->component);
 
 	snd_soc_dapm_mutex_lock(dapm);
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 6770825d037a..ea25fd58d43a 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -245,6 +245,13 @@ static void rt711_jack_detect_handler(struct work_struct *work)
 	if (!rt711->component->card->instantiated)
 		return;
 
+	if (pm_runtime_status_suspended(rt711->slave->dev.parent)) {
+		dev_dbg(&rt711->slave->dev,
+			"%s: parent device is pm_runtime_status_suspended, skipping jack detection\n",
+			__func__);
+		return;
+	}
+
 	reg = RT711_VERB_GET_PIN_SENSE | RT711_HP_OUT;
 	ret = regmap_read(rt711->regmap, reg, &jack_status);
 	if (ret < 0)
-- 
2.30.2

