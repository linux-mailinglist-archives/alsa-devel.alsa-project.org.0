Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFD1339662
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:26:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE886175E;
	Fri, 12 Mar 2021 19:25:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE886175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573599;
	bh=upp5ZUZRtSKsNId2Ok+46MZfd3t9gkUW/5OzQ+LosDw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ulTrkqV+refIneexLKl4WdLtoTAAHdT/VNM3kxnh3Ssl4/VD2UPC/Pp7Mehocvxa0
	 bSvgacDY8XqbuPdZ/SPE+HROMzpJnbRs6CAiLipVvRut6TiVjWiS6ce7FTuGIujdrV
	 iynsyzcXsR1z9uOfFTKv9BhPWeqB6030nra7GvRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 558FBF804AE;
	Fri, 12 Mar 2021 19:23:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DBD7F80430; Fri, 12 Mar 2021 19:23:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72100F802E0
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72100F802E0
IronPort-SDR: UY22DYptdEbtH+M8ualT/YBj83fNUmmz97aI9TH5/naNkFF1k6EGTQK/72gVwYQmDa8aAuBq5H
 tjRnZA1EtWzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="185515188"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="185515188"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:19 -0800
IronPort-SDR: lzN1KljaGYYjbG1Oo2IpFujU1ijS7jTgsFBUG2pNEQ3BVCmRNUXpt2cdgFd+LdC8sbakb1d0jH
 u+jq1nOudkmg==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377791933"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:18 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/23] ASoC: da7219-aad: remove useless initialization
Date: Fri, 12 Mar 2021 12:22:30 -0600
Message-Id: <20210312182246.5153-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>, tiwai@suse.de,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, broonie@kernel.org
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

cppcheck warning:

sound/soc/codecs/da7219-aad.c:118:22: style: Variable 'ret' is
assigned a value that is never used. [unreadVariable]
 int report = 0, ret = 0;
                     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/da7219-aad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 48081d71c22c..7998fdd3b378 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -115,7 +115,7 @@ static void da7219_aad_hptest_work(struct work_struct *work)
 
 	__le16 tonegen_freq_hptest;
 	u8 pll_srm_sts, pll_ctrl, gain_ramp_ctrl, accdet_cfg8;
-	int report = 0, ret = 0;
+	int report = 0, ret;
 
 	/* Lock DAPM, Kcontrols affected by this test and the PLL */
 	snd_soc_dapm_mutex_lock(dapm);
-- 
2.25.1

