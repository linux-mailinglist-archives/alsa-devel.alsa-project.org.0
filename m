Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3934A2792F6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 23:07:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 086A51A16;
	Fri, 25 Sep 2020 23:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 086A51A16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601068044;
	bh=czGs0+/IdjENM3BQ4Zwavo+DcpTmtbzn0tvcA1WWVeI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LhI4h85u9zvr2uXhotFK9kEu6NBoFh+ZRyoMzXEiqO9TmrK+z60FKFBv+DarwdkBS
	 PmuW2IK14o/6kNBYs9YSFvyhhQqiwioymPSWJlZi8Ea5ErjzShVGkqRUnVCceJNQN9
	 FeIlb0MyH/FB85D50oO9q5QYF8o29XwzbWKzjFB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A80CF800DA;
	Fri, 25 Sep 2020 23:05:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EE48F801EB; Fri, 25 Sep 2020 23:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35249F800DA
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 23:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35249F800DA
IronPort-SDR: kZvf+hZo8QJyVWB4/lWyn76GwSOHts6x7oO5KhZ2QxaaHrsEQtAQjTZIixruGfV8sLB+86ovIN
 +BFJt4NgUvmg==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="141046242"
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; d="scan'208";a="141046242"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 14:05:29 -0700
IronPort-SDR: Lwhwm+68rpeEzv3EqJRDqztObK9dY66Rr3cmo8Z90EuUFx1NlU3/lI7E/ltIrTjqKI8XW4UmzZ
 Zk4XiFoeWHew==
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; d="scan'208";a="414005060"
Received: from teclark-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.183.29])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2020 14:05:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: rt715: Add power-up delay to fix dmic pop sound
 issue.
Date: Fri, 25 Sep 2020 16:05:09 -0500
Message-Id: <20200925210509.83353-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jack Yu <jack.yu@realtek.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Jack Yu <jack.yu@realtek.com>

Add 400ms power-up delay recommended to fix pop noise on capture.

BugLink: https://github.com/thesofproject/linux/issues/1969
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Jack Yu <jack.yu@realtek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---

v2: remove module parameter as suggested by Mark Brown.

 sound/soc/codecs/rt715.c | 2 +-
 sound/soc/codecs/rt715.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 099c8bd20006..532c5303e7ab 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -9,7 +9,6 @@
  */
 
 #include <linux/module.h>
-#include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
@@ -498,6 +497,7 @@ static int rt715_set_bias_level(struct snd_soc_component *component,
 			regmap_write(rt715->regmap,
 						RT715_SET_AUDIO_POWER_STATE,
 						AC_PWRST_D0);
+			msleep(RT715_POWER_UP_DELAY_MS);
 		}
 		break;
 
diff --git a/sound/soc/codecs/rt715.h b/sound/soc/codecs/rt715.h
index df0f24f9bc0c..d0d0fd2a6fdb 100644
--- a/sound/soc/codecs/rt715.h
+++ b/sound/soc/codecs/rt715.h
@@ -210,6 +210,8 @@ enum {
 	RT715_AIFS,
 };
 
+#define RT715_POWER_UP_DELAY_MS 400
+
 int rt715_io_init(struct device *dev, struct sdw_slave *slave);
 int rt715_init(struct device *dev, struct regmap *sdw_regmap,
 	struct regmap *regmap, struct sdw_slave *slave);
-- 
2.25.1

