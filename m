Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C40007A1EF6
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:43:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85D81846;
	Fri, 15 Sep 2023 14:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85D81846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781821;
	bh=UZimd24515p6hrvMRb7ig1XNp+esKHxhgQUidKWvpoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uMloPIGOa337QcyIQtjEUWn0FxzYuyAn/JJmtnscw/iah7aHF8BAaLk1q25bP8r1W
	 SnnyotM/9FeJLAScgCTVXvRHuua0YZrFCviKrvPcWjQgcXv0JdbGeEPXyj3Z6ReK3K
	 IS90IGxiUefQLVjeYIlE++RE2/FsJqq9OhznEGyg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10213F805E3; Fri, 15 Sep 2023 14:40:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58EF6F805CA;
	Fri, 15 Sep 2023 14:40:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6488F8058C; Fri, 15 Sep 2023 14:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31C69F80579
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31C69F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mRU+gB+D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781633; x=1726317633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UZimd24515p6hrvMRb7ig1XNp+esKHxhgQUidKWvpoI=;
  b=mRU+gB+DJiJWRzUNN2vS2NrWwyBG7wpnjNYS2wUmtCLUE5jycJXZS/XT
   91E/debBBiQ9ad8UE7MtwL6WOSJ/OC96YcCqNoG/9BTk73lIIo/3A1eAm
   0rvAE5kcXPhZZq5iK9+qV+yG09Bki6adbi6UyARJBo2U3pNebjvW70tiv
   S4WwPH+GPvTJr0cr+QWBgfJW71nLu8GHayRavyVXAt6xS9x4+LGno56CW
   yMk9llLRljkw5ZqDTe67BhbPHX2ztmM4DYwgkrLjK2mP7y0Bv9NqvOcm7
   Mmh/9EdUBNh21c22HQYOhscl7Tq6rLBAs6z/MT4zcnzEqXyrvjZMm8Vdd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653185"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653185"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304591"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304591"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:29 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	brent.lu@intel.com,
	uday.m.bhat@intel.com,
	balamurugan.c@intel.com
Subject: [PATCH 09/19] ASoC: Intel: sof_rt5682: Modify number of HDMI to 3 for
 MTL/Rex devices
Date: Fri, 15 Sep 2023 20:48:42 +0800
Message-Id: <20230915124852.1696857-10-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MY3INCBTH7ELLRS5Z4ZCWWC2HG37ZG7E
X-Message-ID-Hash: MY3INCBTH7ELLRS5Z4ZCWWC2HG37ZG7E
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MY3INCBTH7ELLRS5Z4ZCWWC2HG37ZG7E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uday M Bhat <uday.m.bhat@intel.com>

For all MTL/Rex devices, number of HDMI supported is 3.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index c65eede071c2..bbe15c36b855 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -185,7 +185,7 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(2) |
 					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_RT5682_NUM_HDMIDEV(3) |
 					SOF_BT_OFFLOAD_SSP(1) |
 					SOF_SSP_BT_OFFLOAD_PRESENT
 					),
@@ -224,7 +224,7 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(2) |
 					SOF_RT5682_SSP_AMP(0) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_RT5682_NUM_HDMIDEV(3) |
 					SOF_BT_OFFLOAD_SSP(1) |
 					SOF_SSP_BT_OFFLOAD_PRESENT
 					),
@@ -1269,7 +1269,7 @@ static const struct platform_device_id board_ids[] = {
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_RT5682_NUM_HDMIDEV(3) |
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
@@ -1278,7 +1278,7 @@ static const struct platform_device_id board_ids[] = {
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
 					SOF_RT5682_SSP_CODEC(0) |
 					SOF_RT5682_SSP_AMP(1) |
-					SOF_RT5682_NUM_HDMIDEV(4)),
+					SOF_RT5682_NUM_HDMIDEV(3)),
 	},
 	{
 		.name = "mtl_rt1019_rt5682",
-- 
2.25.1

