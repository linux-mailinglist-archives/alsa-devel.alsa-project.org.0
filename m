Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E66D60F755
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 14:33:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B28D3022;
	Thu, 27 Oct 2022 14:32:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B28D3022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666873979;
	bh=GyhN74WLqRKZuWlouvPzDAC75xmeQ8tROgAKJv9VemA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iERj4dlCR1jLOwGDisSlpkfw8Gko0omfG9chvG0k+U+9/+Anrf0Cg15UeIHmxS9tu
	 Tt9xswOdJaxFG4L6MdbxxMc7Iuecb3bqiP/Ed8t5A/dl4XHewMmKXNuxjCBf9rXEzt
	 H1Mvtjs7UHjMCVeC1yjRcmtntEo57PBBfuaTmpDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F87BF8057A;
	Thu, 27 Oct 2022 14:30:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B35C9F8056F; Thu, 27 Oct 2022 14:30:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F578F8055A
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 14:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F578F8055A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jpHg990I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666873830; x=1698409830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GyhN74WLqRKZuWlouvPzDAC75xmeQ8tROgAKJv9VemA=;
 b=jpHg990Ii7vdX29sRyk1hBkAPFGaO5ULD1jVB9SK+eWptNSXc12werXm
 VqSuMoshndGAmqIYz8UBZD0QXdmtrXXPJ64DdrC5eND8qsXRyGS3x/vpE
 cZfdFOjP9pDiIkNmRpaTxY+WpmYrQoIFWelM+/Ev+9jkQVdgOkGDXB0n7
 Es+E2PPUQDwvO6VplPin1CZElQVca1CyAyiqsjnTZH0zGVWzmMPjjrgrK
 VSWGVxy+XVSSPP8k6NQaDBnGHuc2RwKYIyeIlC5k+zyxQbDYiKEtb6p/Z
 MX7lxgv7g48ICJdKJ1yHhBLuMgrTNNcorqUbIVcCoqUK9paGIvruAQHy2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="334839976"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="334839976"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 05:30:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="807435782"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="807435782"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 27 Oct 2022 05:30:26 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 9/9] ASoC: Intel: avs: Enact power gating policy
Date: Thu, 27 Oct 2022 14:47:02 +0200
Message-Id: <20221027124702.1761002-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027124702.1761002-1-cezary.rojewski@intel.com>
References: <20221027124702.1761002-1-cezary.rojewski@intel.com>
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
index 157d25e32e16..ca624fbb5c0d 100644
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

