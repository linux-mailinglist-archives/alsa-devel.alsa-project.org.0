Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D4A60F1E6
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 10:10:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F55032DD;
	Thu, 27 Oct 2022 10:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F55032DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666858224;
	bh=GyhN74WLqRKZuWlouvPzDAC75xmeQ8tROgAKJv9VemA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nRNvGq4YhgSfEZmTBarc8YdUE0kcDhZXYcFnGFJUvw9chHyS15n8uExal8tbTwgRa
	 FIueQrtCzoTTHInLNbRQs650evw8EEFLyPc2INQXF4jL5ZbdAtNluFaxloH9Uj8g4w
	 PIloQ5c4M43KK08Ka6mItzE44gQeq6AChrZLhPwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13E3EF8059F;
	Thu, 27 Oct 2022 10:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1DC8F8055B; Thu, 27 Oct 2022 10:07:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF5C7F8055B
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 10:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF5C7F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jXWS5emR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666858047; x=1698394047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GyhN74WLqRKZuWlouvPzDAC75xmeQ8tROgAKJv9VemA=;
 b=jXWS5emRFaNicjYw/w0Wbj0aAZT+bZ8O6AaQ2+MR7rMBBB5tnvd0GLqd
 +ZDXb6aBmZ7GI86gZrK21YaQA7vxxjiWWSGrW5FiCUmaTkgBozofpgI37
 TwhpDlD4DUIPLckHuyQasWJwKJF9f3ZoKR8aK5PiprFx1L8W4S56NcC0f
 tx3gHDUF+eUlRy8z4ktnC+k1BRpjmPNTXPUcmsC1uOyfpy7iQBPEore+9
 njEmB4PC1frxuuwuspC+lXcNrrR/IAW6x3Jr4Bm5zIYL3Dx3bG+ghuFxq
 ZAUOdgWeikAEVIMUb/bJC0ywR3buOMw0NS1IGMcn2zU0L7Dt398Pi6j/y w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="291462745"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="291462745"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 01:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="961534896"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="961534896"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 27 Oct 2022 01:07:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 9/9] ASoC: Intel: avs: Enact power gating policy
Date: Thu, 27 Oct 2022 10:23:31 +0200
Message-Id: <20221027082331.1561740-10-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027082331.1561740-1-cezary.rojewski@intel.com>
References: <20221027082331.1561740-1-cezary.rojewski@intel.com>
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

