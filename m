Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE59F7D00BD
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 19:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8007DEE;
	Thu, 19 Oct 2023 19:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8007DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697737012;
	bh=RdD+F+x24vXfLV6mR5hwiNCO9FTu9ZbSLJaLVxMYXBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZGv/Qhd2BJDvcm/7EUceX4UJcRf2XljUElmkQ2HP7LOhb80g9NhVKem+F/ZxmX9dc
	 4Mdk1oBTEkNJaaCl8apu3gDJySAIpc6cTGSu1BIAmMPtl+dyZTyjE+hSnaNgZyt+a5
	 /nOpx+3WuHRe00MLV+PrAJhOfHiaZ+Uhp3yads1o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52ED0F805B3; Thu, 19 Oct 2023 19:34:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93724F8057C;
	Thu, 19 Oct 2023 19:34:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A2FAF8057D; Thu, 19 Oct 2023 19:34:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2AA5F8032D
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2AA5F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ecAjkfeS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697736873; x=1729272873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RdD+F+x24vXfLV6mR5hwiNCO9FTu9ZbSLJaLVxMYXBI=;
  b=ecAjkfeSf3j8mNhRDcSeGPWjB+/dIny6f1+lNuhkL+EVHQ5NKD4ZwfFB
   zgrsxvmm//Z28wKJ724dOzz8o95D3dnD1n4PiqeVqPmlO7awmmxnOOEPX
   vObUsuju9f8SdtxgtgdR+9kzjqJnfQfV51Qxp4OKzov902wxDPT0+99Ny
   DvpXyAaqm2hH5qucrDKArgt9jyQzOpCNtsWG0QnbnhoLuNiCEqVDHofGJ
   rpDs4HTDyxyBaQ03pI8YLpz+9CkFSKr8OOKUOEnzi6g9QKG8oT51xfrYk
   YaC+VnGtUDzascpJ8Eysop/HQqMzMOPacq+yN9FyAG/+4kgFIUPgOYPnB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7884336"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="7884336"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792090646"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="792090646"
Received: from jihao1-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.163.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/10] ASoC: intel: sof_sdw: Move the builtin microphones to
 dataport 1
Date: Thu, 19 Oct 2023 12:34:05 -0500
Message-Id: <20231019173411.166759-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
References: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VJKLME332VR6ZGTXP7NZCHIXC44Q3NRA
X-Message-ID-Hash: VJKLME332VR6ZGTXP7NZCHIXC44Q3NRA
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJKLME332VR6ZGTXP7NZCHIXC44Q3NRA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

cs42l43 supports 4 hardwired microphones, but only supports up to 2
microphone headsets. Only dataport 1 can support 4 channel capture,
but that is currently used for the headset microphone. Switch things
around such that DP1 is used for the builtin mics and DP2 is used for
the headset microphones.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index ad1d01ebbcd9..3312ad8a563b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -939,16 +939,16 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			{
 				.direction = {false, true},
 				.dai_name = "cs42l43-dp1",
-				.dai_type = SOF_SDW_DAI_TYPE_JACK,
-				.dailink = {SDW_UNUSED_DAI_ID, SDW_JACK_IN_DAI_ID},
-			},
-			{
-				.direction = {false, true},
-				.dai_name = "cs42l43-dp2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
 				.init = sof_sdw_cs42l43_dmic_init,
-			}
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "cs42l43-dp2",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_UNUSED_DAI_ID, SDW_JACK_IN_DAI_ID},
+			},
 		},
 		.dai_num = 3,
 	},
-- 
2.39.2

