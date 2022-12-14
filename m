Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EA964C77B
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 11:56:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAE5029E3;
	Wed, 14 Dec 2022 11:55:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAE5029E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671015359;
	bh=0wVKU8uuvOU19AOoBiJh83abrnwnKYpxFSdlGj+Hezo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fZZzxpo/KEGGyGKt+1R5zHopSNJ60NKcDaTyeCvs2GVLDY5MrICFnKxzF2GvZPcXR
	 seoXSfjoL7LgKYU7Z0wBZ88vWS9CAEk6rjQLN+sr6T3GSFfTv1L6Fsd3uDaRZQxkn4
	 vpJN6VkkdqQjgJw3k3bdc/zYcHc9bd5ZlaAuai48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE052F80520;
	Wed, 14 Dec 2022 11:54:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61EAEF804FF; Wed, 14 Dec 2022 11:54:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24ADFF80310
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 11:54:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24ADFF80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=P2zUjNQu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671015257; x=1702551257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0wVKU8uuvOU19AOoBiJh83abrnwnKYpxFSdlGj+Hezo=;
 b=P2zUjNQu2wULl3udyZ6vi+M50YilO8AxBCaNfK41EUPC823axJguvjLc
 Fcn7GRKERERdrs3E8TIZAOfzfGsW6ipIb5l6vIXM/wBHpM5NvuIykWpAI
 sgoZSag12Z72B9Ev1p+YsvDpzsgWkVbDtJwEpSzu7wCuP/s3gS1ZuyGBs
 +0sD5bcmdSlb/X/pAJbOkP2EiHmCQH4mxk5eHUI0tor+o/uuGJUlWilQb
 NP9fObYGdOxqJdWSIcuhtPFUotDIPOCdZWT8lPEzetX0uYNDmZ4ClaLFJ
 kZaA2etBEI9PsLZLFYwYv5/89jvOqY23yfWjSFjBhb0KtVbGlWB8Y1WU8 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="318412895"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="318412895"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2022 02:54:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="679653318"
X-IronPort-AV: E=Sophos;i="5.96,244,1665471600"; d="scan'208";a="679653318"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by orsmga008.jf.intel.com with ESMTP; 14 Dec 2022 02:54:13 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/4] ASoC: Intel: avs: Add control volume operations
Date: Wed, 14 Dec 2022 19:54:58 +0100
Message-Id: <20221214185500.3896902-3-amadeuszx.slawinski@linux.intel.com>
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

To make introduced peakvol module useful from userspace perspective,
expose ALSA controls allowing DSP volume modification. These provide
even more granular control over volume but are also the only way to
modify volume for devices devoid of codec kcontrols e.g.: DMIC.

Co-authored-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/Makefile  |  2 +-
 sound/soc/intel/avs/control.c | 95 +++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/control.h | 23 +++++++++
 3 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/control.c
 create mode 100644 sound/soc/intel/avs/control.h

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index 1c6924a1ebca..460ee6599daf 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
-		    topology.o path.o pcm.o board_selection.o
+		    topology.o path.o pcm.o board_selection.o control.o
 snd-soc-avs-objs += cldma.o
 snd-soc-avs-objs += skl.o apl.o
 
diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
new file mode 100644
index 000000000000..92b3aad0baca
--- /dev/null
+++ b/sound/soc/intel/avs/control.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+//
+// Authors: Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//          Cezary Rojewski <cezary.rojewski@intel.com>
+//
+
+#include <sound/soc.h>
+#include "avs.h"
+#include "control.h"
+#include "messages.h"
+#include "path.h"
+
+static struct avs_dev *avs_get_kcontrol_adev(struct snd_kcontrol *kcontrol)
+{
+	struct snd_soc_dapm_widget *w;
+
+	w = snd_soc_dapm_kcontrol_widget(kcontrol);
+
+	return to_avs_dev(w->dapm->component->dev);
+}
+
+static struct avs_path_module *avs_get_kcontrol_module(struct avs_dev *adev, u32 id)
+{
+	return NULL;
+}
+
+int avs_control_volume_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	struct avs_control_data *ctl_data = (struct avs_control_data *)mc->dobj.private;
+	struct avs_dev *adev = avs_get_kcontrol_adev(kcontrol);
+	struct avs_volume_cfg *dspvols = NULL;
+	struct avs_path_module *active_module;
+	size_t num_dspvols;
+	int ret = 0;
+
+	/* prevent access to modules while path is being constructed */
+	mutex_lock(&adev->path_mutex);
+
+	active_module = avs_get_kcontrol_module(adev, ctl_data->id);
+	if (active_module) {
+		ret = avs_ipc_peakvol_get_volume(adev, active_module->module_id,
+						 active_module->instance_id, &dspvols,
+						 &num_dspvols);
+		if (!ret)
+			ucontrol->value.integer.value[0] = dspvols[0].target_volume;
+
+		ret = AVS_IPC_RET(ret);
+		kfree(dspvols);
+	} else {
+		ucontrol->value.integer.value[0] = ctl_data->volume;
+	}
+
+	mutex_unlock(&adev->path_mutex);
+	return ret;
+}
+
+int avs_control_volume_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
+	struct avs_control_data *ctl_data = (struct avs_control_data *)mc->dobj.private;
+	struct avs_dev *adev = avs_get_kcontrol_adev(kcontrol);
+	long *volume = &ctl_data->volume;
+	struct avs_path_module *active_module;
+	struct avs_volume_cfg dspvol = {0};
+	long ctlvol = ucontrol->value.integer.value[0];
+	int ret = 0, changed = 0;
+
+	if (ctlvol < 0 || ctlvol > mc->max)
+		return -EINVAL;
+
+	/* prevent access to modules while path is being constructed */
+	mutex_lock(&adev->path_mutex);
+
+	if (*volume != ctlvol) {
+		*volume = ctlvol;
+		changed = 1;
+	}
+
+	active_module = avs_get_kcontrol_module(adev, ctl_data->id);
+	if (active_module) {
+		dspvol.channel_id = AVS_ALL_CHANNELS_MASK;
+		dspvol.target_volume = *volume;
+
+		ret = avs_ipc_peakvol_set_volume(adev, active_module->module_id,
+						 active_module->instance_id, &dspvol);
+		ret = AVS_IPC_RET(ret);
+	}
+
+	mutex_unlock(&adev->path_mutex);
+
+	return ret ? ret : changed;
+}
diff --git a/sound/soc/intel/avs/control.h b/sound/soc/intel/avs/control.h
new file mode 100644
index 000000000000..08631bde13c3
--- /dev/null
+++ b/sound/soc/intel/avs/control.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2021-2022 Intel Corporation. All rights reserved.
+ *
+ * Authors: Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ *          Cezary Rojewski <cezary.rojewski@intel.com>
+ */
+
+#ifndef __SOUND_SOC_INTEL_AVS_CTRL_H
+#define __SOUND_SOC_INTEL_AVS_CTRL_H
+
+#include <sound/control.h>
+
+struct avs_control_data {
+	u32 id;
+
+	long volume;
+};
+
+int avs_control_volume_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+int avs_control_volume_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol);
+
+#endif
-- 
2.25.1

