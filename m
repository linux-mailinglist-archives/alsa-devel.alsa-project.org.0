Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE5C7C67A6
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 10:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEA1E857;
	Thu, 12 Oct 2023 10:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEA1E857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697100014;
	bh=nj17oRFzyvmyQOQJmAwbnMy2j3Jrqv8Of3qGHVFkqjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jaOmj9455co+YxyWh1cgMXTYSdSwUnGqNr1vvmC8FUUMLS2DcDf/lZ/QrtsjdbdwZ
	 K6rK5/vhAZrdjb6MccAP/r44MPIskYsE/2U1g7d0eqqPm0gxamFdIr2qDXRQQ89jeq
	 H5sRQQsIPgf0YcVuRDLpji6M4RJY5KMDmDbicu+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B57DDF80567; Thu, 12 Oct 2023 10:38:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BF05F80563;
	Thu, 12 Oct 2023 10:38:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F0F4F80563; Thu, 12 Oct 2023 10:35:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 195A0F802BE
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 10:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 195A0F802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Wol8bjRN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697099716; x=1728635716;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nj17oRFzyvmyQOQJmAwbnMy2j3Jrqv8Of3qGHVFkqjI=;
  b=Wol8bjRNQHNHGvA7FOIF9xjnILhEB7kGMmRRuysIOK4vSEXqoYpt4nyU
   TTvbYOgj/KqTAKrT1VSbRv0cSRV8TTnd/PqqOJXaaHEUpYubiNToD8Asx
   Gnn0WZgURwh2BBZ4qREhwk59mQe7XAMRB412Mvip8anY3wcjvXWjd4CBM
   yNSpUHRrk7T35L4qK2wRGAhOSNR9OMB+O/rdtpj97WSyX7pA4PwOahdII
   1ME+YwIi0kh9PsVfNXczquMoFSWPFVNosphyTSIWJJRKGUXK9j6WAOwIE
   f0iBrRveOmuLhKfFtM4lQ6gV6H7JAzEEuM0E2FcdsRJ8GsK61julTLmfj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6417208"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="6417208"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 01:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824516583"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="824516583"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 01:35:09 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 02/16] ASoC: Intel: avs: Introduce helper functions for SSP
 and TDM handling
Date: Thu, 12 Oct 2023 10:35:00 +0200
Message-Id: <20231012083514.492626-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
References: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I4SYGDELN22ZOI3EOKMET7KX6GQVPKNS
X-Message-ID-Hash: I4SYGDELN22ZOI3EOKMET7KX6GQVPKNS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4SYGDELN22ZOI3EOKMET7KX6GQVPKNS/>
List-Archive: <>
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

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/utils.h | 65 +++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 sound/soc/intel/avs/utils.h

diff --git a/sound/soc/intel/avs/utils.h b/sound/soc/intel/avs/utils.h
new file mode 100644
index 000000000000..0b82a98ed024
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
+static inline bool avs_mach_singular_ssp(struct snd_soc_acpi_mach *mach)
+{
+	return hweight_long(mach->mach_params.i2s_link_mask) == 1;
+}
+
+static inline u32 avs_mach_ssp_port(struct snd_soc_acpi_mach *mach)
+{
+	return __ffs(mach->mach_params.i2s_link_mask);
+}
+
+static inline bool avs_mach_singular_tdm(struct snd_soc_acpi_mach *mach, u32 port)
+{
+	unsigned long *tdms = mach->pdata;
+
+	return !tdms || (hweight_long(tdms[port]) == 1);
+}
+
+static inline u32 avs_mach_ssp_tdm(struct snd_soc_acpi_mach *mach, u32 port)
+{
+	unsigned long *tdms = mach->pdata;
+
+	return tdms ? __ffs(tdms[port]) : 0;
+}
+
+static inline int avs_mach_get_ssp_tdm(struct device *dev, struct snd_soc_acpi_mach *mach,
+				       int *ssp_port, int *tdm_slot)
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

