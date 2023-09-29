Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6F07B315C
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 13:27:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26856A4B;
	Fri, 29 Sep 2023 13:26:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26856A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695986869;
	bh=wY+MFQfxwOFJRbRs7VbXqiXr5EOF2bJnom5UQoo7m5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hU0Xy3qK8znHgrVPX4O8XnNKVWZBkKBcvp1vDRrImZyLM9zdGImI0ed9KdnUgVTRz
	 Fpdx0DndMybUMxrepSYe/ntnMIwyp3rhmpeqrQ52OjKBj/1n2mnPtaoN6uY3pSqnsO
	 p1JJA3VUz1j77CR43+Culs2mn4Q4noDUc6ZukHeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4F5BF805C3; Fri, 29 Sep 2023 13:25:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15D24F805BF;
	Fri, 29 Sep 2023 13:25:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F41B7F80579; Fri, 29 Sep 2023 13:25:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27F8CF8016A
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 13:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27F8CF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZNzrOWT1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695986680; x=1727522680;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wY+MFQfxwOFJRbRs7VbXqiXr5EOF2bJnom5UQoo7m5I=;
  b=ZNzrOWT1ZXnL1o2IqI2WqZhIWcPHdLvLOWrs5j0YjYAYUTyyJWEuXJTN
   XM+xm5J65a71cM+eYCIOE+XNK6TJ9KSGmuz3GOrsj7mrQ9GrMc650R4Bw
   EAVSfH+tkBBzLDaaOCeRagYzJSHj81aK3ot9kFbEEdHMVaSFOK2KJ2Li1
   6geDeugTUiQUqaOI1xHlPIecfSceJvKgnTxzWevbAgQ9mIffbJ0cdOIL8
   IyDxeXUALbmnjNtrugdSJJgabXJrGEOFVQT+7VkAgKjg82q+fuOFIMqih
   4IU/GXJbssSgeFZ3WgH19Qa9xZJB6EwwH+KisPJJTHWhWR+IYigRrHRrm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="880250"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="880250"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753353700"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="753353700"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga007.fm.intel.com with ESMTP; 29 Sep 2023 04:24:32 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 3/6] ASoC: Intel: avs: Preallocate memory for module
 configuration
Date: Fri, 29 Sep 2023 13:24:33 +0200
Message-Id: <20230929112436.787058-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
References: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LC6ESYBMXQFLML3WRWPBFWNRUBEL2DN6
X-Message-ID-Hash: LC6ESYBMXQFLML3WRWPBFWNRUBEL2DN6
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LC6ESYBMXQFLML3WRWPBFWNRUBEL2DN6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to instantiate modules on the firmware side, the driver sends
payload with module configuration. In some case size of this information
is not known before hand, so driver allocates temporary memory during
module creation and frees it after use. Optimize the flow a bit, by
preallocating maximum buffer. This removes the time spend on allocating
memory, as well as potential OOM errors during module initialization.

Handlers for modules, where configuration data fits on stack, are left
as is.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/avs.h  |  1 +
 sound/soc/intel/avs/core.c |  5 +++++
 sound/soc/intel/avs/path.c | 31 +++++++++++++++----------------
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 0012f989b24f..d694e08e44e1 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -121,6 +121,7 @@ struct avs_dev {
 	struct avs_mods_info *mods_info;
 	struct ida **mod_idas;
 	struct mutex modres_mutex;
+	void *modcfg_buf;		/* module configuration buffer */
 	struct ida ppl_ida;
 	struct list_head fw_list;
 	int *core_refs;		/* reference count per core */
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 859b217fc761..62fd60d5b660 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -26,6 +26,7 @@
 #include "../../codecs/hda.h"
 #include "avs.h"
 #include "cldma.h"
+#include "messages.h"
 
 static u32 pgctl_mask = AZX_PGCTL_LSRMD_MASK;
 module_param(pgctl_mask, uint, 0444);
@@ -380,6 +381,10 @@ static int avs_bus_init(struct avs_dev *adev, struct pci_dev *pci, const struct
 	if (ret < 0)
 		return ret;
 
+	adev->modcfg_buf = devm_kzalloc(dev, AVS_MAILBOX_SIZE, GFP_KERNEL);
+	if (!adev->modcfg_buf)
+		return -ENOMEM;
+
 	adev->dev = dev;
 	adev->spec = (const struct avs_spec *)id->driver_data;
 	adev->ipc = ipc;
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index adbe23a47847..aa8b50b931c3 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -237,11 +237,11 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 	/* Every config-BLOB contains gateway attributes. */
 	if (data_size)
 		cfg_size -= sizeof(cfg->gtw_cfg.config.attrs);
+	if (cfg_size > AVS_MAILBOX_SIZE)
+		return -EINVAL;
 
-	cfg = kzalloc(cfg_size, GFP_KERNEL);
-	if (!cfg)
-		return -ENOMEM;
-
+	cfg = adev->modcfg_buf;
+	memset(cfg, 0, cfg_size);
 	cfg->base.cpc = t->cfg_base->cpc;
 	cfg->base.ibs = t->cfg_base->ibs;
 	cfg->base.obs = t->cfg_base->obs;
@@ -261,7 +261,6 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
 				  t->core_id, t->domain, cfg, cfg_size,
 				  &mod->instance_id);
-	kfree(cfg);
 	return ret;
 }
 
@@ -294,7 +293,7 @@ static int avs_peakvol_create(struct avs_dev *adev, struct avs_path_module *mod)
 	struct avs_control_data *ctl_data;
 	struct avs_peakvol_cfg *cfg;
 	int volume = S32_MAX;
-	size_t size;
+	size_t cfg_size;
 	int ret;
 
 	ctl_data = avs_get_module_control(mod);
@@ -302,11 +301,12 @@ static int avs_peakvol_create(struct avs_dev *adev, struct avs_path_module *mod)
 		volume = ctl_data->volume;
 
 	/* As 2+ channels controls are unsupported, have a single block for all channels. */
-	size = struct_size(cfg, vols, 1);
-	cfg = kzalloc(size, GFP_KERNEL);
-	if (!cfg)
-		return -ENOMEM;
+	cfg_size = struct_size(cfg, vols, 1);
+	if (cfg_size > AVS_MAILBOX_SIZE)
+		return -EINVAL;
 
+	cfg = adev->modcfg_buf;
+	memset(cfg, 0, cfg_size);
 	cfg->base.cpc = t->cfg_base->cpc;
 	cfg->base.ibs = t->cfg_base->ibs;
 	cfg->base.obs = t->cfg_base->obs;
@@ -318,9 +318,8 @@ static int avs_peakvol_create(struct avs_dev *adev, struct avs_path_module *mod)
 	cfg->vols[0].curve_duration = 0;
 
 	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id, t->core_id,
-				  t->domain, cfg, size, &mod->instance_id);
+				  t->domain, cfg, cfg_size, &mod->instance_id);
 
-	kfree(cfg);
 	return ret;
 }
 
@@ -480,10 +479,11 @@ static int avs_modext_create(struct avs_dev *adev, struct avs_path_module *mod)
 	num_pins = tcfg->generic.num_input_pins + tcfg->generic.num_output_pins;
 	cfg_size = struct_size(cfg, pin_fmts, num_pins);
 
-	cfg = kzalloc(cfg_size, GFP_KERNEL);
-	if (!cfg)
-		return -ENOMEM;
+	if (cfg_size > AVS_MAILBOX_SIZE)
+		return -EINVAL;
 
+	cfg = adev->modcfg_buf;
+	memset(cfg, 0, cfg_size);
 	cfg->base.cpc = t->cfg_base->cpc;
 	cfg->base.ibs = t->cfg_base->ibs;
 	cfg->base.obs = t->cfg_base->obs;
@@ -505,7 +505,6 @@ static int avs_modext_create(struct avs_dev *adev, struct avs_path_module *mod)
 	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id,
 				  t->core_id, t->domain, cfg, cfg_size,
 				  &mod->instance_id);
-	kfree(cfg);
 	return ret;
 }
 
-- 
2.34.1

