Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B90F56A21E
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:36:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0934B1689;
	Thu,  7 Jul 2022 14:35:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0934B1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197385;
	bh=n846Hs3c9MgbTP/DPAz9yuXRlEggHqNa7XZGEypGi/s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G4tAXCQtbh3HgL2bUbqODHPqiOBXQiY9GrpM7mC8PdtVdQv9TQPGiEWwew10FphTO
	 S/HEAaesO2l2ZPxf8KobOH9Nyclbu9HU5nAp5g3+gXzmLHH9VUnbpimvM/58+26+e+
	 mNIkPLOkH/yMGLHQGCVCAwZyvDN+eEN/su3lTAj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2777EF8059F;
	Thu,  7 Jul 2022 14:33:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28067F804F1; Thu,  7 Jul 2022 14:32:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30D28F8028D
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D28F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hvgAwjhh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657197119; x=1688733119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n846Hs3c9MgbTP/DPAz9yuXRlEggHqNa7XZGEypGi/s=;
 b=hvgAwjhhD2TCgVbnEKtoxpzVdhXVOtfsiYpIGlknxpKnkcipkmkJag2Z
 NY1ap4kpD57z8EGVgbtYHSBz2YdvneTbIMGWIv1W7U9xa0f5/YT6VZvxH
 iogkFbWsoOrWppBz+pWQ5lsgSuVJWYMxhmzfBfgJLh+FbPMFNEK1/MVaB
 ArYXgAutIjFzPi1qwTZdYpcgewVztk7GpPRvSMTx6uwGV6Md53mQqger8
 wcrsM/0GD9t8tjXedaIvi9lyYslwV0+DI4HPZ1pEmNj26sIqe6Wi2Bkkx
 NN8dR1CoA5ekJIiG8+4uFvk1X9vGakrafIWG+RHQhsdU8qUO4xhsr/ur2 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272805898"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272805898"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="593720567"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 05:31:52 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 03/12] ASoC: Intel: avs: Relax DSP core transition timings
Date: Thu,  7 Jul 2022 14:41:44 +0200
Message-Id: <20220707124153.1858249-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707124153.1858249-1-cezary.rojewski@intel.com>
References: <20220707124153.1858249-1-cezary.rojewski@intel.com>
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

To avoid any false positives when checking CPA after setting SPA, do a
short wait. For stall operation, give HW more time to propagate the
change before moving on.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/dsp.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
index 06d2f7af520f..b881100d3e02 100644
--- a/sound/soc/intel/avs/dsp.c
+++ b/sound/soc/intel/avs/dsp.c
@@ -13,6 +13,7 @@
 
 #define AVS_ADSPCS_INTERVAL_US		500
 #define AVS_ADSPCS_TIMEOUT_US		50000
+#define AVS_ADSPCS_DELAY_US		1000
 
 int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool power)
 {
@@ -26,6 +27,8 @@ int avs_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool power)
 	value = power ? mask : 0;
 
 	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPCS, mask, value);
+	/* Delay the polling to avoid false positives. */
+	usleep_range(AVS_ADSPCS_DELAY_US, 2 * AVS_ADSPCS_DELAY_US);
 
 	mask = AVS_ADSPCS_CPA_MASK(core_mask);
 	value = power ? mask : 0;
@@ -82,11 +85,15 @@ int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall)
 				       reg, (reg & mask) == value,
 				       AVS_ADSPCS_INTERVAL_US,
 				       AVS_ADSPCS_TIMEOUT_US);
-	if (ret)
+	if (ret) {
 		dev_err(adev->dev, "core_mask %d %sstall failed: %d\n",
 			core_mask, stall ? "" : "un", ret);
+		return ret;
+	}
 
-	return ret;
+	/* Give HW time to propagate the change. */
+	usleep_range(AVS_ADSPCS_DELAY_US, 2 * AVS_ADSPCS_DELAY_US);
+	return 0;
 }
 
 int avs_dsp_core_enable(struct avs_dev *adev, u32 core_mask)
-- 
2.25.1

