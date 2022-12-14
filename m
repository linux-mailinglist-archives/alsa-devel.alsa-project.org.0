Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E78BE64C77E
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 11:56:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A34E29E4;
	Wed, 14 Dec 2022 11:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A34E29E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671015389;
	bh=6JEYjmlO8GpFQU6HVFpOchv0XxLl56GvpklqDYSp7zE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CPDOBRKMXs+BETwZr69oaXi+NY9c4XrDxqUmN7h/nMbrQvXzDnlDybUAlto7QPEik
	 p8RySIZCWpafqnHS+/jxkuIqyl38QmhonXCPOJbqQw6kG1bGYQDvrckhcusZevVA8d
	 k4NDDCvtaDCZNyekq1YouyF+8ssFFOwG6HJbmvRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B434F80539;
	Wed, 14 Dec 2022 11:54:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A484EF80544; Wed, 14 Dec 2022 11:54:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEC87F80535
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 11:54:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEC87F80535
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fmwqoV74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671015262; x=1702551262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6JEYjmlO8GpFQU6HVFpOchv0XxLl56GvpklqDYSp7zE=;
 b=fmwqoV74G0PZIW8JMPDcf3T2EA8Bw/EVAgN75Ra/IzQF7c3OKWiue2cy
 +o1uEs0TTnsVJ6hGKwekFwKH0MQtTPhmIcqOWx9t/YVdTjp+yYf1nyn70
 MowjqZRJRMCJHy4jr5OMW8g+2Ye0fa1REdLX/5yrZJaxjYAJtRLNFuix1
 Kw1m5uU+KmVW96yOFXXoFPcgxxIYruf3HiamVMUtE9lL7Sf8QRISJEHvz
 sqrgayAUtX8/bvwSPPbjLENb7CGAStfnWF+rf7TQEvbO2mUjs988g/Q7a
 wLLVVmXDfRWVsrKvAYGgqO+SempZ/+Y6Rf4vx/18A4FWQxIXjWkNqi2in g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="318412930"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="318412930"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 02:54:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="679653335"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="679653335"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 14 Dec 2022 02:54:17 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/4] ASoC: Intel: avs: Peakvol module configuration
Date: Wed, 14 Dec 2022 19:55:00 +0100
Message-Id: <20221214185500.3896902-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214185500.3896902-1-amadeuszx.slawinski@linux.intel.com>
References: <20221214185500.3896902-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Handle creation of peakvol module in FW. When peakvol module is created
it retrieves actual value from kcontrol and sends it to FW as part of
configuration data.

Co-authored-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/path.c | 62 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index ce157a8d6552..05302ab705ae 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -10,6 +10,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "avs.h"
+#include "control.h"
 #include "path.h"
 #include "topology.h"
 
@@ -264,6 +265,65 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 	return ret;
 }
 
+static struct avs_control_data *avs_get_module_control(struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_tplg_path_template *path_tmpl;
+	struct snd_soc_dapm_widget *w;
+	int i;
+
+	path_tmpl = t->owner->owner->owner;
+	w = path_tmpl->w;
+
+	for (i = 0; i < w->num_kcontrols; i++) {
+		struct avs_control_data *ctl_data;
+		struct soc_mixer_control *mc;
+
+		mc = (struct soc_mixer_control *)w->kcontrols[i]->private_value;
+		ctl_data = (struct avs_control_data *)mc->dobj.private;
+		if (ctl_data->id == t->ctl_id)
+			return ctl_data;
+	}
+
+	return NULL;
+}
+
+static int avs_peakvol_create(struct avs_dev *adev, struct avs_path_module *mod)
+{
+	struct avs_tplg_module *t = mod->template;
+	struct avs_control_data *ctl_data;
+	struct avs_peakvol_cfg *cfg;
+	int volume = S32_MAX;
+	size_t size;
+	int ret;
+
+	ctl_data = avs_get_module_control(mod);
+	if (ctl_data)
+		volume = ctl_data->volume;
+
+	/* As 2+ channels controls are unsupported, have a single block for all channels. */
+	size = struct_size(cfg, vols, 1);
+	cfg = kzalloc(size, GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+
+	cfg->base.cpc = t->cfg_base->cpc;
+	cfg->base.ibs = t->cfg_base->ibs;
+	cfg->base.obs = t->cfg_base->obs;
+	cfg->base.is_pages = t->cfg_base->is_pages;
+	cfg->base.audio_fmt = *t->in_fmt;
+	cfg->vols[0].target_volume = volume;
+	cfg->vols[0].channel_id = AVS_ALL_CHANNELS_MASK;
+	cfg->vols[0].curve_type = AVS_AUDIO_CURVE_NONE;
+	cfg->vols[0].curve_duration = 0;
+
+	ret = avs_dsp_init_module(adev, mod->module_id, mod->owner->instance_id, t->core_id,
+				  t->domain, cfg, size, &mod->instance_id);
+
+	kfree(cfg);
+	return ret;
+}
+
 static int avs_updown_mix_create(struct avs_dev *adev, struct avs_path_module *mod)
 {
 	struct avs_tplg_module *t = mod->template;
@@ -465,6 +525,8 @@ static struct avs_module_create avs_module_create[] = {
 	{ &AVS_MIXOUT_MOD_UUID, avs_modbase_create },
 	{ &AVS_KPBUFF_MOD_UUID, avs_modbase_create },
 	{ &AVS_COPIER_MOD_UUID, avs_copier_create },
+	{ &AVS_PEAKVOL_MOD_UUID, avs_peakvol_create },
+	{ &AVS_GAIN_MOD_UUID, avs_peakvol_create },
 	{ &AVS_MICSEL_MOD_UUID, avs_micsel_create },
 	{ &AVS_MUX_MOD_UUID, avs_mux_create },
 	{ &AVS_UPDWMIX_MOD_UUID, avs_updown_mix_create },
-- 
2.25.1

