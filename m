Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1CC60E23E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 15:36:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C51543C4C;
	Wed, 26 Oct 2022 15:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C51543C4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666791418;
	bh=9SM82RmA6g6b0AsueaqfUAPG3jifFxpk/FBTsVNy+Ps=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Whvjotjt+UWw/w3wIusM4LBrorJJzZfrBusk3eisC1UO4BeS/iYa1EhMjUNeI99OH
	 V1tZQVL0iywyY69dgVaU6RAGdxCwYpAm2H5jwESGgirFUSme7/4ePA4mukBLLp8TTt
	 BfhkkviTv/pTe1kvAcPuW51VTjhXWxHbdAEtPUO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD5FF805A0;
	Wed, 26 Oct 2022 15:34:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DDDCF8059F; Wed, 26 Oct 2022 15:34:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C194DF80571
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 15:34:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C194DF80571
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FM6XDA4R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666791244; x=1698327244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9SM82RmA6g6b0AsueaqfUAPG3jifFxpk/FBTsVNy+Ps=;
 b=FM6XDA4RZjefma7LYGkFTe+ifuX8BpGoLsFaFqCT6ert9P8X1dJNUr4S
 V/L/cPxPW0NyplwgEYCWlze2sbjPfKENvRwkKH6SElo93caHXTKVynB3d
 pY4KWz5xrIZyZd7245BZSVPj0YejYtrdaqupv9lFsU0EKkZVau127eAZW
 GU+RtBrLr3+jW7SVJp8b1OgwuMbVK6fPWXz+qDfQrTkGaRNbaQGQbX/Zd
 l3KLu3CWYAi2/TRu4bcza2D04zobPYt49z8YEtlsmrVwmjcEg81RCc0U0
 4yLnLJzkClZDOR1fNDabFnfidtTlNBlRltaS2MCfzy94c6YVYwaHOf2jD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="288340774"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="288340774"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 06:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="609952745"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="609952745"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2022 06:33:51 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 9/9] ASoC: Intel: avs: Enact power gating policy
Date: Wed, 26 Oct 2022 15:50:14 +0200
Message-Id: <20221026135014.1403705-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026135014.1403705-1-cezary.rojewski@intel.com>
References: <20221026135014.1403705-1-cezary.rojewski@intel.com>
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

Update all firmware loading functions to also account for the power
gating policy. As module loading routine is missing the chicken bits
manipulation entirely, add the entire set there.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/loader.c | 10 ++++++++++
 sound/soc/intel/avs/pcm.c    |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index eb10e45790e7..56bb0a59249d 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -224,11 +224,19 @@ static int avs_cldma_load_module(struct avs_dev *adev, struct avs_module_entry *
 	if (ret < 0)
 		return ret;
 
+	avs_hda_power_gating_enable(adev, false);
+	avs_hda_clock_gating_enable(adev, false);
+	avs_hda_l1sen_enable(adev, false);
+
 	hda_cldma_set_data(cl, (void *)mod->data, mod->size);
 	hda_cldma_transfer(cl, msecs_to_jiffies(AVS_CLDMA_START_DELAY_MS));
 	ret = avs_ipc_load_modules(adev, &mentry->module_id, 1);
 	hda_cldma_stop(cl);
 
+	avs_hda_l1sen_enable(adev, true);
+	avs_hda_clock_gating_enable(adev, true);
+	avs_hda_power_gating_enable(adev, true);
+
 	if (ret) {
 		dev_err(adev->dev, "load module %d failed: %d\n", mentry->module_id, ret);
 		avs_release_last_firmware(adev);
@@ -605,6 +613,7 @@ int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
 	for (i = 1; i < adev->fw_cfg.max_libs_count; i++)
 		memset(adev->lib_names[i], 0, AVS_LIB_NAME_SIZE);
 
+	avs_hda_power_gating_enable(adev, false);
 	avs_hda_clock_gating_enable(adev, false);
 	avs_hda_l1sen_enable(adev, false);
 
@@ -625,6 +634,7 @@ int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
 reenable_gating:
 	avs_hda_l1sen_enable(adev, true);
 	avs_hda_clock_gating_enable(adev, true);
+	avs_hda_power_gating_enable(adev, true);
 
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 2fd53d597cd9..7832e76ee5ae 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -737,6 +737,7 @@ static int avs_component_load_libraries(struct avs_soc_component *acomp)
 	if (ret < 0)
 		return ret;
 
+	avs_hda_power_gating_enable(adev, false);
 	avs_hda_clock_gating_enable(adev, false);
 	avs_hda_l1sen_enable(adev, false);
 
@@ -744,6 +745,7 @@ static int avs_component_load_libraries(struct avs_soc_component *acomp)
 
 	avs_hda_l1sen_enable(adev, true);
 	avs_hda_clock_gating_enable(adev, true);
+	avs_hda_power_gating_enable(adev, true);
 
 	if (!ret)
 		ret = avs_module_info_init(adev, false);
-- 
2.25.1

