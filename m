Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2D18B3B93
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:32:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F27E8218D;
	Fri, 26 Apr 2024 17:32:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F27E8218D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145546;
	bh=j1ku1dWhFHuyquni9fCYrD3Jol58ijoJHLGyFSz6q/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e4QSQpPzYS+mecahZvpDDv/31vMY2tWm3xtyPSiI/6OAt+wy4l/M2Ms4urKSm645w
	 q+Zc7Zx+KAwtK/hf+OXRA+MDAQFz8mpSojl3b+DZClY+wD6qkuze9IZXsWlBgOz29j
	 wUyeiZm+2MY91JK9EF9+Bate6xl61sXjURw+uucI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83079F89720; Fri, 26 Apr 2024 17:27:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A2EBF8971C;
	Fri, 26 Apr 2024 17:27:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A88C4F806E8; Fri, 26 Apr 2024 17:26:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SPF_TEMPERROR,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1ED02F8060F
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ED02F8060F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iTXCruRw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145157; x=1745681157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j1ku1dWhFHuyquni9fCYrD3Jol58ijoJHLGyFSz6q/U=;
  b=iTXCruRw8iTa+BTVOVv00Brdqa1FYkv0asHuQj4hVJG9UpyDM3NiJcZW
   dy7/1jNzYkttv5PDeuG+U9U67mWnavAPTsZ7HcMlRoLNqWc21q5RkGvby
   u16Hv6vSAmvihX+D2KQfWAfkZt90ofGkhIwHJe+UIgiBEF9RCkkETUk3I
   ggfCWYccnSldkS9ArXZby04cxXJ3YKQQDtuWmMlTDUArxNLHvCCJRpKzD
   JggmN6/JUVEt7aF9yfMBiFSekSisGt92kESdbxhlSTFhfteVaI3nj/SAP
   81JG5PWOAyN9mM/fcNXaGy5teTu9MslBrgnbxHmrc0TnonTx8HKoMhVEC
   g==;
X-CSE-ConnectionGUID: laeidt6LQ0u39U8QQdWFBg==
X-CSE-MsgGUID: JDjhh/wkRsufA7aAUqDoxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291369"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291369"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:53 -0700
X-CSE-ConnectionGUID: aoh48tzYRTS2TkAHVn0Ceg==
X-CSE-MsgGUID: 66pXMnfUTg2eFAj5AZchZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259619"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 22/23] ASoC: Intel: sof-rt5682: get bclk frequency from
 topology
Date: Fri, 26 Apr 2024 10:25:28 -0500
Message-Id: <20240426152529.38345-23-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RH4MSOGCW4QNX5DFHHCXGZ2KO245RSLX
X-Message-ID-Hash: RH4MSOGCW4QNX5DFHHCXGZ2KO245RSLX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RH4MSOGCW4QNX5DFHHCXGZ2KO245RSLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

A different bclk frequency 3.072MHz was introduced to tgl platform and
is used in mtl topologies. Use SOF API to get frequency from topology
instead of hardcoding.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 6a79dd5271cc..c3b026868653 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -317,7 +317,12 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 
-		pll_in = params_rate(params) * 50;
+		/* get the tplg configured bclk. */
+		pll_in = sof_dai_get_bclk(rtd);
+		if (pll_in <= 0) {
+			dev_err(rtd->dev, "invalid bclk freq %d\n", pll_in);
+			return -EINVAL;
+		}
 	}
 
 	pll_out = params_rate(params) * 512;
-- 
2.40.1

