Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3A936117B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 19:53:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A0201681;
	Thu, 15 Apr 2021 19:52:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A0201681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618509229;
	bh=m/Fp6tDvoDqCUa6Grb46hosJEw3HTwLvF4vec1ZBUNg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Aki/UuKpQYLsYAEwNmw/KmEcTg4x3Og9iHUs36//oAaJCeJGEYytf/bLSfLhTdyhq
	 LQp1jsc4O1MD7KYMdrvhk3E45XJ4Aa6nmPs+Mw54oDSO82U7xSbrOLhBEXFIrzv0p+
	 2LbZDCluQLQsM+oqJGIXTPMmFtxHjG4zKTFZcRQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01864F804A9;
	Thu, 15 Apr 2021 19:50:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50292F8042F; Thu, 15 Apr 2021 19:50:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 225F6F80260
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 19:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 225F6F80260
IronPort-SDR: /eQTZgHb0pnAN/dJCT+KJVViiDPUw6Y4hmLHQ9wVYIGMHY25A/Tjg7HwTbLgKMLH+wd8Wr3wDQ
 EJa2HRlUDTdQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="174400810"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="174400810"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:41 -0700
IronPort-SDR: vUqpxSJhEPVfurnfhNWyNr0ZSaXNuAlaQSkptSGdzsHwqemWW01CLxhwDaInM08EE7ASPPybIm
 vqXPBoIEur8w==
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="382804680"
Received: from lesterhu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.33.4])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 10:50:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/9] ASoC: Intel: boards: add support for adl boards in
 sof-rt5682
Date: Thu, 15 Apr 2021 12:50:10 -0500
Message-Id: <20210415175013.192862-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
References: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Bard Liao <bard.liao@intel.com>
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

From: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>

ADL customer boards are with below 2 configurations

Board 1: RT5682 on SSP0 and MAX98373 on SSP1
Board 2: RT5682 on SSP0 and MAX98357A on SSP2

Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 5e8f1022a21a..358a19d62458 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1008,6 +1008,23 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT1015P_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1)),
 	},
+	{
+		.name = "adl_max98373_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98373_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4)),
+	},
+	{
+		.name = "adl_max98357a_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(2) |
+					SOF_RT5682_NUM_HDMIDEV(4)),
+	},
 	{ }
 };
 
@@ -1035,3 +1052,5 @@ MODULE_ALIAS("platform:jsl_rt5682_max98360a");
 MODULE_ALIAS("platform:cml_rt1015_rt5682");
 MODULE_ALIAS("platform:tgl_rt1011_rt5682");
 MODULE_ALIAS("platform:jsl_rt5682_rt1015p");
+MODULE_ALIAS("platform:adl_max98373_rt5682");
+MODULE_ALIAS("platform:adl_max98357a_rt5682");
-- 
2.25.1

