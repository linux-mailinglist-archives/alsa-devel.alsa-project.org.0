Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF125740D8
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 03:12:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A1F2174A;
	Thu, 14 Jul 2022 03:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A1F2174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657761179;
	bh=8SMHRnXoeT6L4p7RodtZBZZihIj9AUSv6QZ/I0bJEq0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SlPxo9CMx0ZLWXvlu7aMSUh48d14222OxFhQSODhA3u80lOygdK/QMcpUv//+zlFR
	 IVvrcX5uySaR8fRSzwtiECAQkATJiawXlmvL0lyYj1gdt41H0CxF1n9j8LnNry954o
	 oVDWunVI+aMVezjJuQV7rzOyX8YomVSfVBQtL6n0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F42FF80544;
	Thu, 14 Jul 2022 03:11:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A89F80543; Thu, 14 Jul 2022 03:11:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8477BF8047B
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 03:11:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8477BF8047B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YWimnMfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657761061; x=1689297061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8SMHRnXoeT6L4p7RodtZBZZihIj9AUSv6QZ/I0bJEq0=;
 b=YWimnMfE8I7ObU1n1jUyElf9hpc+GO3AGhOltx0w6yqlNPlITvUCY3od
 RRweWuz3l6orlTXfAMoIpUS3wi7obl9bgKK+Co6b5EZcUkiRQARAv10/V
 nGEpMY11F+BgoNz9R/5kULePAWvq73gdlMm5AmEoMmbMHj5oeiSH06zv3
 UchANCs3L6LgiUz3WJYRr5RHOc7Ancar/QTLad+OAudmAge5/FmRBS0NG
 BKq8VlloLHU8ZPWQ1kd2QYeo95r0M9auLuLnLGcnOdWMHBt2+zj7OE/B5
 2ADPZFpNVVZUoQCGyCIotgkS70vUtuNKRVSBMIFVjuT2mUJUBoaSq8YSM Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="347066143"
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="347066143"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:10:59 -0700
X-IronPort-AV: E=Sophos;i="5.92,269,1650956400"; d="scan'208";a="593192539"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 18:10:57 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 4/4] ASoC: codecs: show PING status on resume failures
Date: Thu, 14 Jul 2022 09:10:43 +0800
Message-Id: <20220714011043.46059-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
References: <20220714011043.46059-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, bard.liao@intel.com
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

This helper should help identify cases where devices fall off the bus
and don't resync.

BugLink: https://github.com/thesofproject/linux/issues/3638
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/max98373-sdw.c   | 2 ++
 sound/soc/codecs/rt1308-sdw.c     | 2 ++
 sound/soc/codecs/rt1316-sdw.c     | 2 ++
 sound/soc/codecs/rt5682-sdw.c     | 2 ++
 sound/soc/codecs/rt700-sdw.c      | 2 ++
 sound/soc/codecs/rt711-sdca-sdw.c | 2 ++
 sound/soc/codecs/rt715-sdca-sdw.c | 2 ++
 sound/soc/codecs/rt715-sdw.c      | 2 ++
 8 files changed, 16 insertions(+)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index f47e956d4f55..7bed8e146b78 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -281,6 +281,8 @@ static __maybe_unused int max98373_resume(struct device *dev)
 					   msecs_to_jiffies(MAX98373_PROBE_TIMEOUT));
 	if (!time) {
 		dev_err(dev, "Initialization not complete, timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+
 		return -ETIMEDOUT;
 	}
 
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 1c11b42dd76e..0049c6c66855 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -727,6 +727,8 @@ static int __maybe_unused rt1308_dev_resume(struct device *dev)
 				msecs_to_jiffies(RT1308_PROBE_TIMEOUT));
 	if (!time) {
 		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+
 		return -ETIMEDOUT;
 	}
 
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 60baa9ff1907..34ca2b77ee4f 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -712,6 +712,8 @@ static int __maybe_unused rt1316_dev_resume(struct device *dev)
 				msecs_to_jiffies(RT1316_PROBE_TIMEOUT));
 	if (!time) {
 		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+
 		return -ETIMEDOUT;
 	}
 
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 248257a2e4e0..b4e722bb7e25 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -790,6 +790,8 @@ static int __maybe_unused rt5682_dev_resume(struct device *dev)
 				msecs_to_jiffies(RT5682_PROBE_TIMEOUT));
 	if (!time) {
 		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+
 		return -ETIMEDOUT;
 	}
 
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index bda594899664..132e60f72c03 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -538,6 +538,8 @@ static int __maybe_unused rt700_dev_resume(struct device *dev)
 				msecs_to_jiffies(RT700_PROBE_TIMEOUT));
 	if (!time) {
 		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+
 		return -ETIMEDOUT;
 	}
 
diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index aaf5af153d3f..d1d8327cf72f 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -442,6 +442,8 @@ static int __maybe_unused rt711_sdca_dev_resume(struct device *dev)
 				msecs_to_jiffies(RT711_PROBE_TIMEOUT));
 	if (!time) {
 		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+
 		return -ETIMEDOUT;
 	}
 
diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 0ecd2948f7aa..796b5e982b8a 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -233,6 +233,8 @@ static int __maybe_unused rt715_dev_resume(struct device *dev)
 					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
 	if (!time) {
 		dev_err(&slave->dev, "Enumeration not complete, timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+
 		return -ETIMEDOUT;
 	}
 
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index a7b21b03c08b..42b8c176b821 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -551,6 +551,8 @@ static int __maybe_unused rt715_dev_resume(struct device *dev)
 					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
 	if (!time) {
 		dev_err(&slave->dev, "Initialization not complete, timed out\n");
+		sdw_show_ping_status(slave->bus, true);
+
 		return -ETIMEDOUT;
 	}
 
-- 
2.25.1

