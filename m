Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C41732CD1
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:04:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E0C826;
	Fri, 16 Jun 2023 12:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E0C826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686909858;
	bh=18Cg1qLjEkAqV2l06dhUWufeg8cv1oqaR23A772yCjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EgA40IQUtbDPSDSLpzPq21eturFMv8xLTCWyxqUl8glJ2/Y/efTzBeoAj56pweLMt
	 Qqg8d0aVv31voFqHUzlcO9tB/YMuSd3ryRKRiX1I4/+4bg8nKGTIfIbd5rbV9WVYB9
	 yoabDUBKhZ/S7BAAR3WvjLfbpwGZHKDjF5Wx2n0U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98F26F805D6; Fri, 16 Jun 2023 12:01:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80275F805C7;
	Fri, 16 Jun 2023 12:01:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C0E1F805BE; Fri, 16 Jun 2023 12:01:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15762F805AF
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15762F805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WX/HTuJl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686909685; x=1718445685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=18Cg1qLjEkAqV2l06dhUWufeg8cv1oqaR23A772yCjI=;
  b=WX/HTuJlYxvFF6jCmobHywbWb0eBnZKuvGHrvZmnTn961bLrY0lpOnXi
   6bgdgX4pCVGb+FwhmU3I/bSnej/25sW48EARP3OLzvFwgfTc024w6834J
   rCn+fv2V3wrsatG+9f30A/xMIhPERT8LmWrm1nbyqaaRrWGGNDUEDTgpV
   NYd90Q5oytlLl9eyxpW570lfaASkA51fg48WxrfhR1AAXnUQ7+dXtbX8V
   5yHaxPw7D32q5uN0PF/CPRuVQBzzx8AmQx71X7Eo7KRewQexDVYJF95Ov
   uqI6H+/fn8ajOwkSGBtZHDdmdYzKcVJ6pNVBp2vTEfH1+LDwb8QPq+wEE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362591719"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="362591719"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825689490"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400";
   d="scan'208";a="825689490"
Received: from kjaffe-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.114.132])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 03:01:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Rander Wang <rander.wang@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 8/8] ASoC: SOF: Intel: mtl: setup primary core info on
 MeteorLake platform
Date: Fri, 16 Jun 2023 12:00:39 +0200
Message-Id: <20230616100039.378150-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
References: <20230616100039.378150-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DGTPCRYU2NVBZLMXNDBQL4BQT7YSCWKW
X-Message-ID-Hash: DGTPCRYU2NVBZLMXNDBQL4BQT7YSCWKW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DGTPCRYU2NVBZLMXNDBQL4BQT7YSCWKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Set primary core mask and refcount.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 8ae331faca4e..30fe77fd87bf 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -361,11 +361,17 @@ static int mtl_dsp_core_power_up(struct snd_sof_dev *sdev, int core)
 	ret = snd_sof_dsp_read_poll_timeout(sdev, HDA_DSP_BAR, MTL_DSP2CXCTL_PRIMARY_CORE, dspcxctl,
 					    (dspcxctl & cpa) == cpa, HDA_DSP_REG_POLL_INTERVAL_US,
 					    HDA_DSP_RESET_TIMEOUT_US);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "%s: timeout on MTL_DSP2CXCTL_PRIMARY_CORE read\n",
 			__func__);
+		return ret;
+	}
 
-	return ret;
+	/* set primary core mask and refcount to 1 */
+	sdev->enabled_cores_mask = BIT(SOF_DSP_PRIMARY_CORE);
+	sdev->dsp_core_ref_count[SOF_DSP_PRIMARY_CORE] = 1;
+
+	return 0;
 }
 
 static int mtl_dsp_core_power_down(struct snd_sof_dev *sdev, int core)
@@ -388,10 +394,15 @@ static int mtl_dsp_core_power_down(struct snd_sof_dev *sdev, int core)
 					    !(dspcxctl & MTL_DSP2CXCTL_PRIMARY_CORE_CPA_MASK),
 					    HDA_DSP_REG_POLL_INTERVAL_US,
 					    HDA_DSP_PD_TIMEOUT * USEC_PER_MSEC);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "failed to power down primary core\n");
+		return ret;
+	}
 
-	return ret;
+	sdev->enabled_cores_mask = 0;
+	sdev->dsp_core_ref_count[SOF_DSP_PRIMARY_CORE] = 0;
+
+	return 0;
 }
 
 int mtl_power_down_dsp(struct snd_sof_dev *sdev)
-- 
2.37.2

