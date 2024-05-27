Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF38D0E4A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:39:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 135A3832;
	Mon, 27 May 2024 21:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 135A3832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838767;
	bh=pT8b6UcO81biTjXtBIqTvq5DBJ9GY2SYfo6YadyiA1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KAdcpxY1xa3CK/2jvRh+u/U1t1T4DpXzfwVq6+jVu8kMjvw79g/S8tXS6JY5H/wOp
	 puIkQ5IBhIz7R3faEYoJoKeT/UaRvI13KGvWGdcnUHmg9Yb8GVdsJhjAKuTwpOQ2/U
	 JpORSFc+M0FRzDOii51NCKg9vwcp4/N7USbW2psQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C6AAF806FC; Mon, 27 May 2024 21:37:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80842F806F7;
	Mon, 27 May 2024 21:36:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72043F806B4; Mon, 27 May 2024 21:36:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3D944F8051F
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D944F8051F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RpaMUaiv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838584; x=1748374584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pT8b6UcO81biTjXtBIqTvq5DBJ9GY2SYfo6YadyiA1k=;
  b=RpaMUaivwC+wm5vRa2fF9Y33ylkXZ+pLvbNBOIBjCW5sRDUwGGbu0ufy
   iMCSDg2z+H1IzXi2wn9kZadzkj2KgfyJSKyLvv8bTaJmaqw6Qff06Au6b
   t+cSzbvAxls5rmazV2iK35V5/i5MfoZDm3WEcvUO919J/NF3wwPRxxee9
   rbIr9L66PTEML6WKQaaKh5P/fgNUBfZwICZphYSLNQbGsZdjrZ2UMv/et
   my0HQGzK2iBDhAwvGWQmTStuXJd2VDCHSiijLs8Nh66hjRpv0kZw7Xq3p
   1PQOzApOgpzCytAxzW99/+MuaqAN9SWnbCNWrRaSlPsOgOmQls6r/DP9A
   g==;
X-CSE-ConnectionGUID: /+vPTS64SOCWphTdnQNqaw==
X-CSE-MsgGUID: qvGZmXSMQiuGjXJ9UDrNuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339387"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339387"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:20 -0700
X-CSE-ConnectionGUID: ybOwgpdeRLafsIn1uiQ2dg==
X-CSE-MsgGUID: ceLCfibgSMaTf2xd0s1rYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029785"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/18] ASoC: SOF: ipc3-topology: support tdm slot number query
Date: Mon, 27 May 2024 14:35:48 -0500
Message-ID: <20240527193552.165567-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P7SFMCSFLTVB45UEQDOFCZQJXUB34HXN
X-Message-ID-Hash: P7SFMCSFLTVB45UEQDOFCZQJXUB34HXN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7SFMCSFLTVB45UEQDOFCZQJXUB34HXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Support the new parameter type SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS in
sof_ipc3_dai_get_param() function to get the tdm slot number of
specific SSP port.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index b68dea41cd95..be61e377e59e 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2514,6 +2514,8 @@ static int sof_ipc3_dai_get_param(struct snd_sof_dev *sdev, struct snd_sof_dai *
 			return private->dai_config->ssp.mclk_rate;
 		case SOF_DAI_PARAM_INTEL_SSP_BCLK:
 			return private->dai_config->ssp.bclk_rate;
+		case SOF_DAI_PARAM_INTEL_SSP_TDM_SLOTS:
+			return private->dai_config->ssp.tdm_slots;
 		default:
 			dev_err(sdev->dev, "invalid SSP param %d\n", param_type);
 			break;
-- 
2.43.0

