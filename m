Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 867E25804CE
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Jul 2022 21:52:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24BF8857;
	Mon, 25 Jul 2022 21:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24BF8857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658778733;
	bh=Cyz1Gq/bBHP6OKTSrOGJ7+S7n//6X2IakzhawUS+PCI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QXpiVW8qwi+lctePfuV7ILCPUr+8JWNkI2iORJQvDfc5yKTMJCZETxnRETtT7Oc3w
	 kj4OnAwYg/n5m/lFjh2exXpAQH3HK9qbG1KP0f6wKYbyjpOH5UAdBfa6G4U+4XwV7y
	 A/lgflurYiRbdkBB5aTbv+WUCDAoEP6+Inq4NIDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DC2AF804B2;
	Mon, 25 Jul 2022 21:49:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32B7DF80553; Mon, 25 Jul 2022 21:49:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C1C2F804FD
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 21:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C1C2F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Q4f+zPxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778575; x=1690314575;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cyz1Gq/bBHP6OKTSrOGJ7+S7n//6X2IakzhawUS+PCI=;
 b=Q4f+zPxvLRV1OAPsYs8DjV5KpLplbj+f1k1uYV1P7cVIGw3pwgMIRgQ2
 AjhO5XoLiYmcYNwQtEm634cBDt3/fgshWgSxi50sGKVew25pEfYQeL/O8
 DRvCgDl/WOpWFYEzgGmO5mqRWk9EVvVyLHsHIyowsdKAybW2bwVqAXYYB
 rVp7tjjl/UT6et4/FgeC9tjK07R9ToHAuzVGGObUltizOfgP70a3HzEd7
 hJo5LPM8rnknhLGaTmwalM+kTEFlmukfs0By8Z1fG/Df9lXhBUJang0J1
 feJvIk0OoU+mhLtmi4Ibynklc0dwYCjyVh6F5hxHVvW19NMUjAtOFJBUW Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="267553915"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="267553915"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="632479469"
Received: from mbianco-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.71.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:49:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/10] ASoC: Intel: sof_es8336: remove hard-coded SSP selection
Date: Mon, 25 Jul 2022 14:49:06 -0500
Message-Id: <20220725194909.145418-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
References: <20220725194909.145418-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

For some reason we open-coded the SSP selection and only supported
SSP0, 1 and 2. On ApolloLake platforms, the SSP5 can be used as well
for the ES8336 hardware link.

Remove hard-coded if/else code and align with same code already used
in the SOF driver.

BugLink: https://github.com/thesofproject/sof/issues/6015
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_es8336.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index b616d22bc0fa..c7f33c89588e 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -604,18 +604,14 @@ static int sof_es8336_probe(struct platform_device *pdev)
 			/*
 			 * Set configuration based on platform NHLT.
 			 * In this machine driver, we can only support one SSP for the
-			 * ES8336 link, the else-if below are intentional.
+			 * ES8336 link.
 			 * In some cases multiple SSPs can be reported by NHLT, starting MSB-first
 			 * seems to pick the right connection.
 			 */
-			unsigned long ssp = 0;
-
-			if (mach->mach_params.i2s_link_mask & BIT(2))
-				ssp = SOF_ES8336_SSP_CODEC(2);
-			else if (mach->mach_params.i2s_link_mask & BIT(1))
-				ssp = SOF_ES8336_SSP_CODEC(1);
-			else  if (mach->mach_params.i2s_link_mask & BIT(0))
-				ssp = SOF_ES8336_SSP_CODEC(0);
+			unsigned long ssp;
+
+			/* fls returns 1-based results, SSPs indices are 0-based */
+			ssp = fls(mach->mach_params.i2s_link_mask) - 1;
 
 			quirk |= ssp;
 		}
-- 
2.34.1

