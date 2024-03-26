Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A04588C8C6
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:15:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4D662C22;
	Tue, 26 Mar 2024 17:15:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4D662C22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469712;
	bh=n0IrftS1xYbcXY1GHXbLYZmk8QtdkWZ1bDvJPlTyUtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KfKc0CtzyzPIqiRaweb9We5uUhPpGo85rTf2dD1ZOhM9iv+xuwKmx7rR03aFzvSno
	 Vt9APyJt7CXvHCjaweShHaPFYVcbVMwx9/h3piZr/PxDpq1Gdq4tb0S6fQsf+a+GJP
	 JNFzkVJ53XJMeBKkl7O/N3przE/+KgwBAFZPS6YM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A031F8981F; Tue, 26 Mar 2024 17:07:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 361C4F89830;
	Tue, 26 Mar 2024 17:07:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8E33F80C6D; Tue, 26 Mar 2024 17:06:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0740F80616
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0740F80616
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mAg9I/qy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469161; x=1743005161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n0IrftS1xYbcXY1GHXbLYZmk8QtdkWZ1bDvJPlTyUtw=;
  b=mAg9I/qymGYw92Do4wvxiE2AsX9leppgS0neZhABixXMr7UYYvk+QZH9
   XsnY3gM3/DmQUleafzl8xvYSMaufghZn9ImX95+g1RaPKhn+xU93yKOam
   aJ/tLB6ZXmjl48X9Tjg5eGZdo9r4qaLt+OBfIXy+A63zBq14dWRPLHFLz
   2X/Po+g2j+culmmkyx6tabReLdvuOqzwH2AapKh3ZLf1NMrHTiTCxuGau
   Ir7mG2NwwTcRHn2ZVYaXYKHFpzbwJWc4t4wDaf66k+92zxol79uxun4T3
   VHdcOzh1X6tCPYmCzUCJGgAhXsVkOA2bDBMUi/OxnGwR/LWc7EcuVuzDj
   A==;
X-CSE-ConnectionGUID: 9Z4wFLZHTEucIDzSQzbLEA==
X-CSE-MsgGUID: YTaP1+gNSu2rd3qZ+aZqFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260569"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482498"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 32/34] ASoC: Intel: sof_sdw: Remove redundant initialisations
Date: Tue, 26 Mar 2024 11:04:27 -0500
Message-Id: <20240326160429.13560-33-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DWIUZW4AC3RVSRHKGODYQOGHGQGCDYBT
X-Message-ID-Hash: DWIUZW4AC3RVSRHKGODYQOGHGQGCDYBT
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Unspecified fields are by default initialised to zero, remove redundant
init pointer initialisations.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f3167e3498e0..5a7014d82d6c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1026,7 +1026,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "sdw-mockup-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
-				.init = NULL,
 			},
 		},
 		.dai_num = 1,
@@ -1040,7 +1039,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "sdw-mockup-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
-				.init = NULL,
 			},
 		},
 		.dai_num = 1,
@@ -1054,7 +1052,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "sdw-mockup-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
-				.init = NULL,
 			},
 		},
 		.dai_num = 1,
@@ -1068,7 +1065,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.direction = {false, true},
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.init = NULL,
 			},
 		},
 		.dai_num = 1,
-- 
2.40.1

