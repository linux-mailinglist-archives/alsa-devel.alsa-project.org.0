Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BE847E279
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 12:41:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C9EA18BE;
	Thu, 23 Dec 2021 12:40:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C9EA18BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640259684;
	bh=HShJrXsbLp0kuHZbs+e353ICjxLN9fW0gvEy9WP3bFM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ixhEUCyCtVJBrQ0Z4TAorJBBhBFklHjB4+Z/0QwV6QuUg4wG1xyBn1hMMo7AaMgeb
	 SLgLTsEmdNTPTmFWwwl5ypvlrmvHBAhvOWBvxTDVJBfEV3IHaV7wBqQUghIchFOZO7
	 pLUI3L0XQCISKk2elaDXHfe8XWrvkgAuacAXIdBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB3C2F80566;
	Thu, 23 Dec 2021 12:37:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA0FEF80564; Thu, 23 Dec 2021 12:36:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 629B2F80549
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 12:36:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 629B2F80549
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DPRTZwpc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640259411; x=1671795411;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HShJrXsbLp0kuHZbs+e353ICjxLN9fW0gvEy9WP3bFM=;
 b=DPRTZwpc6YBz6igy6DxsqjXQnhy9eO+X4JcvNa8nWZhfHeubYfjMAM9E
 GekXsxFKZlY72UB+zx6AJ/vxWgUdFO6smkaUkxVbt6bNqTfZAS6Ars55K
 +jjgTRQvp74IxBpB27q32U8+8i4j+k4JFiyZ6RkbttK3At/nI3/Yffb5+
 7Zghxig8IKrL06f/IQ/JchGxHXn+sSjud8QZNEk+HlZOTzredk2jhdjqz
 3x3nKrPc6Ctm6rsWpagchGX3gxx9dxy9L5UNC9Bd+1bKvxvKnynA00kCv
 ePy/DvPmPCRp00e9jfMDhRrjS8RO1JxtSZj6MW1Lv2duOILWAHbWxq7aJ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="304180840"
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="304180840"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,229,1635231600"; d="scan'208";a="522065189"
Received: from gcatala-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.214.126])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 03:36:39 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 13/20] ASoC: SOF: pm: Force DSP off on suspend in BOOT_FAILED
 state also
Date: Thu, 23 Dec 2021 13:36:21 +0200
Message-Id: <20211223113628.18582-14-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
References: <20211223113628.18582-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 chao.song@intel.com, daniel.baluta@nxp.com
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

Try to force the DSP to be turned off next time if the fw_state is either
CRASHED or BOOT_FAILED when a suspend happens in order to attempt a clean
boot to recover.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 022b19669735..197a88695fef 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -315,10 +315,11 @@ int snd_sof_prepare(struct device *dev)
 	sdev->system_suspend_target = SOF_SUSPEND_S3;
 
 	/*
-	 * if the firmware is crashed then we try to aim for S3 to reboot the
-	 * firmware
+	 * if the firmware is crashed or boot failed then we try to aim for S3
+	 * to reboot the firmware
 	 */
-	if (sdev->fw_state == SOF_FW_CRASHED)
+	if (sdev->fw_state == SOF_FW_CRASHED ||
+	    sdev->fw_state == SOF_FW_BOOT_FAILED)
 		return 0;
 
 	if (!desc->use_acpi_target_states)
-- 
2.34.1

