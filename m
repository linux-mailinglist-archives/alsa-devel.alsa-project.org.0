Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EE92F72CB
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 07:18:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9FEF17B3;
	Fri, 15 Jan 2021 07:17:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9FEF17B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610691522;
	bh=UENQwhs/kM78HJ9dgUT2N+q/LhCEdP5LfAYtFMvoegU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y+Z8PZLO4WPbkilu4gzWRCuG/FbiVe/0JYWCDVVJ2+68XAf0x6hmqrNdop8rsz+cM
	 5BzgS5/wJgs7rRLboXfwf371mjobGNGorOgm/NAFq0bAe23bL/ge+1TCw289Ugvgt0
	 aIr7o2SDxpqSVReB5JQxzYQGVzQ5w05aQg7JCumI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEFB7F8029B;
	Fri, 15 Jan 2021 07:17:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C187F8026D; Fri, 15 Jan 2021 07:17:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E59CF8016D
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 07:16:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E59CF8016D
IronPort-SDR: Kdng59leCSZGSxxMf3sjkCDNMpfXJ1cuitisILbWGmK0iMi6iUto+D0pnSZj069QRrB8PjOgI3
 mF3ODSa1SGjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166174458"
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="166174458"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 22:16:52 -0800
IronPort-SDR: 0YFkTGPHWc0u2EqSh/t/3eWphL2MJQYu4ZjLTZ5HY1OuZ03DuNIetorT2HKaWM5rUqvHDij89A
 halSoNGljpmQ==
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="382551872"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 22:16:48 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/2] ASoC: codecs: soundwire: increase resume timeout
Date: Fri, 15 Jan 2021 14:16:50 +0800
Message-Id: <20210115061651.9740-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115061651.9740-1-yung-chuan.liao@linux.intel.com>
References: <20210115061651.9740-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The resume operation relies on multiple transactions to synchronize
the regmap state, make sure the timeout is one order of magnitude
larger than an individual transaction, so that timeouts of failed
transactions are detected first.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/max98373-sdw.c | 4 +++-
 sound/soc/codecs/rt1308-sdw.c   | 2 +-
 sound/soc/codecs/rt5682.h       | 2 +-
 sound/soc/codecs/rt700-sdw.c    | 2 +-
 sound/soc/codecs/rt711-sdw.c    | 2 +-
 sound/soc/codecs/rt715-sdw.c    | 2 +-
 6 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index ec2e79c57357..ad2d5d6a2fe4 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -251,6 +251,8 @@ static __maybe_unused int max98373_suspend(struct device *dev)
 	return 0;
 }
 
+#define MAX98373_PROBE_TIMEOUT 5000
+
 static __maybe_unused int max98373_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -264,7 +266,7 @@ static __maybe_unused int max98373_resume(struct device *dev)
 		goto regmap_sync;
 
 	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(2000));
+					   msecs_to_jiffies(MAX98373_PROBE_TIMEOUT));
 	if (!time) {
 		dev_err(dev, "Initialization not complete, timed out\n");
 		return -ETIMEDOUT;
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index ec5564f780e8..afd2c3b687cc 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -701,7 +701,7 @@ static int __maybe_unused rt1308_dev_suspend(struct device *dev)
 	return 0;
 }
 
-#define RT1308_PROBE_TIMEOUT 2000
+#define RT1308_PROBE_TIMEOUT 5000
 
 static int __maybe_unused rt1308_dev_resume(struct device *dev)
 {
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 99b85cfe6248..1f9c51a5b9bf 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1356,7 +1356,7 @@
 #define RT5682_SAR_SOUR_TYPE			(0x0)
 
 /* soundwire timeout */
-#define RT5682_PROBE_TIMEOUT			2000
+#define RT5682_PROBE_TIMEOUT			5000
 
 
 #define RT5682_STEREO_RATES SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index fb77e77a4ebd..ce9255b881d4 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -490,7 +490,7 @@ static int __maybe_unused rt700_dev_suspend(struct device *dev)
 	return 0;
 }
 
-#define RT700_PROBE_TIMEOUT 2000
+#define RT700_PROBE_TIMEOUT 5000
 
 static int __maybe_unused rt700_dev_resume(struct device *dev)
 {
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index fc7df79c3b91..756c0ada3b31 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -493,7 +493,7 @@ static int __maybe_unused rt711_dev_suspend(struct device *dev)
 	return 0;
 }
 
-#define RT711_PROBE_TIMEOUT 2000
+#define RT711_PROBE_TIMEOUT 5000
 
 static int __maybe_unused rt711_dev_resume(struct device *dev)
 {
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index 8f0aa1e8a273..71dd3b97a459 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -533,7 +533,7 @@ static int __maybe_unused rt715_dev_suspend(struct device *dev)
 	return 0;
 }
 
-#define RT715_PROBE_TIMEOUT 2000
+#define RT715_PROBE_TIMEOUT 5000
 
 static int __maybe_unused rt715_dev_resume(struct device *dev)
 {
-- 
2.17.1

