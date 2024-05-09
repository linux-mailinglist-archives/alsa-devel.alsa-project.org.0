Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D68C1328
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:40:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBD47E67;
	Thu,  9 May 2024 18:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBD47E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272839;
	bh=SCXYAb7vitxLxtkFLM0yIYJIUoO70iWPghwmtNzSrLY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aFwyRGaqhOkO4R6znCGW53lY5aZRvN9AI/njwJzSq/574/aC+2ykPQtf7udBbVKwp
	 XHGBYW5eZOKr+0f08d8VH15nEPV8SwUH+ozehyEkl9LLzcYnKW35JsjdSiqE5RrcvU
	 Dijh0TryPJ6uv+Pu5DLm6IS07m46IvHbyTQiXnzw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09ABBF8061B; Thu,  9 May 2024 18:37:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 76C22F80620;
	Thu,  9 May 2024 18:37:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B4B1F80614; Thu,  9 May 2024 18:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A9EFF80610
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A9EFF80610
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZkpdwK6M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272637; x=1746808637;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SCXYAb7vitxLxtkFLM0yIYJIUoO70iWPghwmtNzSrLY=;
  b=ZkpdwK6Mk2NmNtoPLK41s9OdxG+LYtnii7Ai82wpUzEV24r0NrBGuiJP
   hlYtk0yNf2Vy9caHctGjWBK9uiYZuICZfxHxV4B2F3+MM+B4+xorSEC7f
   ZhFkaih472S9h+s5/V0GHM1+VFhEQM1Oarzm3G4YvzfyYEGLqN5RMDgKW
   K2Ch9dRO4WE0/WgFB00R7/lO0tEom93iGdOdV/NxsfYUUBc8Sh9pgn7VQ
   W/LdwGy1TRw+PdSQqLbhVqwoHGGYf2EAL8mI1wOhx4WNYiCeHScYZxxqT
   Z3UUsJHXhxjY2aDMarSBAPLFD0PSsx9Z7A49OLt9kVkYM5moTXLFYiVyD
   w==;
X-CSE-ConnectionGUID: lqUCW7pjR8eCFJC/mRCiGg==
X-CSE-MsgGUID: O4bn7/r+SC231XEn2D6bEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11362564"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="11362564"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:37:13 -0700
X-CSE-ConnectionGUID: yMhnPOwlQvOsdP6pTnYPsw==
X-CSE-MsgGUID: J9lXMQAnTt6SeDyVPBZGxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="29344989"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:37:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: rt715-sdca-sdw: Fix wrong complete waiting in
 rt715_dev_resume()
Date: Thu,  9 May 2024 11:36:58 -0500
Message-Id: <20240509163658.68062-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E67JYOG6Z5LUID5TI5QZVCHIEUREXSS4
X-Message-ID-Hash: E67JYOG6Z5LUID5TI5QZVCHIEUREXSS4
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E67JYOG6Z5LUID5TI5QZVCHIEUREXSS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

enumeration_complete will be completed when a peripheral is attached.
And initialization_complete will be completed when a peripheral is
initialized. rt715_dev_resume() should wait for initialization_complete
instead of enumeration_complete.

the issue exists since commit 20d17057f0a8 ("ASoC: rt715-sdca: Add RT715
sdca vendor-specific driver"), but the commit can only apply to
commit f892e66fcabc ("ASoC: rt-sdw*: add __func__ to all error logs").

Fixes: f892e66fcabc ("ASoC: rt-sdw*: add __func__ to all error logs")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt715-sdca-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index d3fb02e8f31a..c8dabb9b16b5 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -234,10 +234,10 @@ static int __maybe_unused rt715_dev_resume(struct device *dev)
 	if (!slave->unattach_request)
 		goto regmap_sync;
 
-	time = wait_for_completion_timeout(&slave->enumeration_complete,
+	time = wait_for_completion_timeout(&slave->initialization_complete,
 					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
 	if (!time) {
-		dev_err(&slave->dev, "%s: Enumeration not complete, timed out\n", __func__);
+		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
 		sdw_show_ping_status(slave->bus, true);
 
 		return -ETIMEDOUT;
-- 
2.40.1

