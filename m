Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E457C537A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 14:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C3F15E0;
	Wed, 11 Oct 2023 14:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C3F15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697026771;
	bh=IcR2+alp7ZQ8W1Uf3jAEvOViV8wtUWhbVQLtTTY/Fu8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EAIqjw3TV7NS2a2QJNZyaXDKr0pUuQoOp3S1JI6sAqWjpavddYnkq/526R2WfyeMe
	 tJslV3bSDfHxDFhxbVXj848CxMX/xo5v0b3IqV9kub+NgoWsGogrEh394EcXnY/trt
	 Re8PPO3dDpSznjXeZ/s/mleSE5AgWt9idwvTjvyk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13985F805A9; Wed, 11 Oct 2023 14:17:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C20BF8059F;
	Wed, 11 Oct 2023 14:17:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2D6EF80553; Wed, 11 Oct 2023 14:17:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CB89F80310
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 14:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB89F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j/Ka3sV6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697026637; x=1728562637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IcR2+alp7ZQ8W1Uf3jAEvOViV8wtUWhbVQLtTTY/Fu8=;
  b=j/Ka3sV64EMtTy9SKTAmBiYy9fMF6KUfQEB0KRWxCx3MIDwRaqkCXIu2
   6GcEDibc2kZtxsuYquixo6x9xMQZ9oEHk2o09rSSl4OWnB+JT3ZuObNLQ
   zjI3iAcn7A82hogvTHqW9e1QHEhLGv3O3qwDWNdfJIQPCb0RNoeIAbXE5
   EXrsONlm4yOAcoNNv6X3tM9mQ9e9k2ZvAEGBj0L8INuRwZEgBx/kPBgqQ
   OrJDy/VjUorzo0oT5HNXl5PrYRPTaREvxnEc9IYCUy7ZfMXZrJPE7yDWZ
   YexeBzdcvwRVVOGLTvErRXA+iLb6cGw3ytC+nEAmSDOcFsHDrwT6ZzrCD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374988361"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200";
   d="scan'208";a="374988361"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:16:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747428340"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200";
   d="scan'208";a="747428340"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 05:16:58 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 02/16] ASoC: Intel: avs: Introduce helper functions for SSP
 and TDM handling
Date: Wed, 11 Oct 2023 14:16:49 +0200
Message-Id: <20231011121703.363652-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011121703.363652-1-amadeuszx.slawinski@linux.intel.com>
References: <20231011121703.363652-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O66GQ5P2QVLIMCMAAXHBQQAW6ZPJNKYQ
X-Message-ID-Hash: O66GQ5P2QVLIMCMAAXHBQQAW6ZPJNKYQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O66GQ5P2QVLIMCMAAXHBQQAW6ZPJNKYQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In quite a few places in code there are checks for number of SSPs
present on system, to reduce maintenance burden introduce helper
functions allowing to get SSP and TDM from machine board configuration.

Additionally in boards we use SSP and TDM to generate quite a few
strings, it could be done like:
if (tdms)
	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d:%d-Codec",
		ssp_port, tdm_slot);
else
	dl->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec",
		ssp_port);

but quite quickly code ends up with spaghetti of similar if elses.
Instead introduce macro which can be used to generate correct string,
allowing to minimize code to something like:
dl->name = devm_kasprintf(dev, GFP_KERNEL, AVS_STRING_FMT("SSP", "-Codec",
		ssp_port, tdm_slot));

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/utils.h | 65 +++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 sound/soc/intel/avs/utils.h

diff --git a/sound/soc/intel/avs/utils.h b/sound/soc/intel/avs/utils.h
new file mode 100644
index 000000000000..6123fab527ec
--- /dev/null
+++ b/sound/soc/intel/avs/utils.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#ifndef __SOUND_SOC_INTEL_AVS_UTILS_H
+#define __SOUND_SOC_INTEL_AVS_UTILS_H
+
+#include <sound/soc-acpi.h>
+
+inline bool avs_mach_singular_ssp(struct snd_soc_acpi_mach *mach)
+{
+	return hweight_long(mach->mach_params.i2s_link_mask) == 1;
+}
+
+inline u32 avs_mach_ssp_port(struct snd_soc_acpi_mach *mach)
+{
+	return __ffs(mach->mach_params.i2s_link_mask);
+}
+
+inline bool avs_mach_singular_tdm(struct snd_soc_acpi_mach *mach, u32 port)
+{
+	unsigned long *tdms = mach->pdata;
+
+	return !tdms || (hweight_long(tdms[port]) == 1);
+}
+
+inline u32 avs_mach_ssp_tdm(struct snd_soc_acpi_mach *mach, u32 port)
+{
+	unsigned long *tdms = mach->pdata;
+
+	return tdms ? __ffs(tdms[port]) : 0;
+}
+
+inline int avs_mach_get_ssp_tdm(struct device *dev, struct snd_soc_acpi_mach *mach,
+				int *ssp_port, int *tdm_slot)
+{
+	int port;
+
+	if (!avs_mach_singular_ssp(mach)) {
+		dev_err(dev, "Invalid SSP configuration\n");
+		return -EINVAL;
+	}
+	port = avs_mach_ssp_port(mach);
+
+	if (!avs_mach_singular_tdm(mach, port)) {
+		dev_err(dev, "Invalid TDM configuration\n");
+		return -EINVAL;
+	}
+	*ssp_port = port;
+	*tdm_slot = avs_mach_ssp_tdm(mach, *ssp_port);
+
+	return 0;
+}
+
+/*
+ * Macro to easily generate format strings
+ */
+#define AVS_STRING_FMT(prefix, suffix, ssp, tdm) \
+	(tdm) ? prefix "%d:%d" suffix : prefix "%d" suffix, (ssp), (tdm)
+
+#endif
-- 
2.34.1

