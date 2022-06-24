Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F285559A66
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 15:35:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF8831898;
	Fri, 24 Jun 2022 15:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF8831898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656077722;
	bh=KlzZPfY8PUa0Hp1wpJb0PFd6Kp5TaDCX+6Sxy1beko0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VxSLqnXP4vOaNZQ22B5lkU+kruEKE7fv7YU6fwkDR51yj5SOrthS1glIV1ugpseUI
	 dVRXAxr5u5cpkA+wyLUrhgHyGFFUjiDusLhsdGl19eyk/STbuiWwnkPz/bSmjwwGkd
	 MX+cKVzqKWXEAOze8VM/ujCbneVcgVb1U4/Yr544=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AECCF80539;
	Fri, 24 Jun 2022 15:33:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CEE1F80165; Fri, 24 Jun 2022 15:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60A63F800CB
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 15:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60A63F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ACbzffb+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656077598; x=1687613598;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KlzZPfY8PUa0Hp1wpJb0PFd6Kp5TaDCX+6Sxy1beko0=;
 b=ACbzffb+vgYG3hTn9finwtkudLKM9t8gyPXsXhy9FiQU8RM4aV6G0w3Z
 F3bN0QMbRmVhCROLfnlU3QaAYKCKmPBd2//r6l8P/nU/sinTiSqLWPyOU
 Isu1/h3Xrk/BihFjkqbjWntprWAkmGcd2jAvQd/YZhzYyOct4Z3gHjWd0
 qA45AB7pGiPt2zacUHozPKFweYZ5DvTz5BYAd8n5IV9RgPG5aDBDhPCHd
 BmaUZ1q/QSdadtzqYEo0J9fzereCNiYK5wBBizv9VukrK2q4AjRC3MRk6
 ZHz2S2KzsWJ12GD8OCVs1bN3t1LdTvk1GuhxFhBMPBTvySK1+Ez27bRZA Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="344996191"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="344996191"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 06:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="835123907"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jun 2022 06:33:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 4/4] ASoC: Intel: bdw_rt5677: Mark BE DAI as nonatomic
Date: Fri, 24 Jun 2022 15:43:17 +0200
Message-Id: <20220624134317.3656128-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624134317.3656128-1-cezary.rojewski@intel.com>
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Address the warning: "Codec: dpcm_be_connect: FE is nonatomic but BE is
not, forcing BE as nonatomic" by marking BE DAI as nonatomic. Aligns
with what is already done for FE ones.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/bdw-rt5677.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index d0ecbba2febe..31488702768e 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -349,6 +349,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		/* SSP0 - Codec */
 		.name = "Codec",
 		.id = 0,
+		.nonatomic = 1,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBC_CFC,
-- 
2.25.1

