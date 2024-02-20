Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C4885BCDC
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Feb 2024 14:08:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B166DDEC;
	Tue, 20 Feb 2024 14:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B166DDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708434526;
	bh=9L+4+6msVe4FYO1F5PFxrLPkiaC6YQgK3r5V3wn3D40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fFwvWIU3BwOTtVD3WPdri2bM10cQu4oydjhjlX/EW9CjYZXjxNOZAfsCX4FmVxKZZ
	 +NsiuE14jDnV9UUVv6ZPLeU/j3ZFbs2Jd3dMxqw5BEsCyjZ4GV2ccnLeyplc4r6/PG
	 lh69IhNLgMs+8K2VTFdS/EjQooZxQOqUBzD8TIw0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FDDFF806B0; Tue, 20 Feb 2024 14:07:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44700F8060D;
	Tue, 20 Feb 2024 14:07:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E799BF80571; Tue, 20 Feb 2024 14:04:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74D19F8056F
	for <alsa-devel@alsa-project.org>; Tue, 20 Feb 2024 14:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74D19F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Mmq+POkz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708434226; x=1739970226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9L+4+6msVe4FYO1F5PFxrLPkiaC6YQgK3r5V3wn3D40=;
  b=Mmq+POkzqnmrH2oNa6ZQKIBbQB4MAqRflPp6kmCmDnmxE1hSdep2e9rw
   3+qXPceygfP9UiC9jVkLAatBTor7B2hgy5cHLhTrJHrG/wEvJwgGMeXTB
   V4e91zy25XzyOGzscpDX7Z93ecUoQnsMCL+yZPZ9UheoF26+nRjrDXvg6
   ILrpJhM6FXZ+gB6FM1+uwFrcipHwk0S4RqMmKgdQUW0gxnoQiTNu7RGDf
   ozcs8xBU3bXWPuheBswQQML/A/XpZo9yM/ROenVrSW2GuxPfTVBIhVUsv
   6rSqHOSzPzAXV4HGOHt7oEhlMAZJpcZtWqDUOedljRsyd4Kam/w/Z5Mba
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988998"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="2988998"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 03:49:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000";
   d="scan'208";a="4751036"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:32 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 08/10] ASoC: Intel: avs: TGL-based platforms support
Date: Tue, 20 Feb 2024 12:50:33 +0100
Message-Id: <20240220115035.770402-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B3W4C4BJMVZIB73GYAHJLPPSAAUBNPHJ
X-Message-ID-Hash: B3W4C4BJMVZIB73GYAHJLPPSAAUBNPHJ
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B3W4C4BJMVZIB73GYAHJLPPSAAUBNPHJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Define handlers specific to cAVS 2.5 platforms, that is TGL, ADL, RPL
and all other variants based on this very version of AudioDSP
architecture. Most operations are inherited from their predecessors with
the major difference being AudioDSP cores management - firmware handlers
that on its own so there is no need to interfere.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/Makefile |  2 +-
 sound/soc/intel/avs/avs.h    |  1 +
 sound/soc/intel/avs/core.c   | 34 +++++++++++++++++++++++
 sound/soc/intel/avs/tgl.c    | 54 ++++++++++++++++++++++++++++++++++++
 4 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/avs/tgl.c

diff --git a/sound/soc/intel/avs/Makefile b/sound/soc/intel/avs/Makefile
index d9c0027e72de..5480500337f8 100644
--- a/sound/soc/intel/avs/Makefile
+++ b/sound/soc/intel/avs/Makefile
@@ -4,7 +4,7 @@ snd-soc-avs-objs := dsp.o ipc.o messages.o utils.o core.o loader.o \
 		    topology.o path.o pcm.o board_selection.o control.o \
 		    sysfs.o
 snd-soc-avs-objs += cldma.o
-snd-soc-avs-objs += skl.o apl.o cnl.o icl.o
+snd-soc-avs-objs += skl.o apl.o cnl.o icl.o tgl.o
 
 snd-soc-avs-objs += trace.o
 # tell define_trace.h where to find the trace header
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index a850351808f9..22bdb562dbc7 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -68,6 +68,7 @@ extern const struct avs_dsp_ops avs_skl_dsp_ops;
 extern const struct avs_dsp_ops avs_apl_dsp_ops;
 extern const struct avs_dsp_ops avs_cnl_dsp_ops;
 extern const struct avs_dsp_ops avs_icl_dsp_ops;
+extern const struct avs_dsp_ops avs_tgl_dsp_ops;
 
 #define AVS_PLATATTR_CLDMA		BIT_ULL(0)
 #define AVS_PLATATTR_IMR		BIT_ULL(1)
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index b66d9c89f79a..5e9cae1f47f5 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -828,6 +828,23 @@ static const struct avs_spec jsl_desc = {
 	.hipc = &cnl_hipc_spec,
 };
 
+#define AVS_TGL_BASED_SPEC(sname)		\
+static const struct avs_spec sname##_desc = {	\
+	.name = #sname,				\
+	.min_fw_version = { 10,	29, 0, 5646 },	\
+	.dsp_ops = &avs_tgl_dsp_ops,		\
+	.core_init_mask = 1,			\
+	.attributes = AVS_PLATATTR_IMR,		\
+	.sram = &apl_sram_spec,			\
+	.hipc = &cnl_hipc_spec,			\
+}
+
+AVS_TGL_BASED_SPEC(lkf);
+AVS_TGL_BASED_SPEC(tgl);
+AVS_TGL_BASED_SPEC(ehl);
+AVS_TGL_BASED_SPEC(adl);
+AVS_TGL_BASED_SPEC(adl_n);
+
 static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_SKL_LP, &skl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_SKL, &skl_desc) },
@@ -846,6 +863,23 @@ static const struct pci_device_id avs_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_ICL_N,	&icl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_ICL_H,	&icl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_JSL_N,	&jsl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_LKF,	&lkf_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_TGL_LP,	&tgl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_TGL_H,	&tgl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_CML_R,	&tgl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_EHL_0,	&ehl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_EHL_3,	&ehl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_S,	&adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_P,	&adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_PS,	&adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_M,	&adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_PX,	&adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_N,	&adl_n_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_S,	&adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_P_0,	&adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_P_1,	&adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_M,	&adl_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_PX,	&adl_desc) },
 	{ 0 }
 };
 MODULE_DEVICE_TABLE(pci, avs_ids);
diff --git a/sound/soc/intel/avs/tgl.c b/sound/soc/intel/avs/tgl.c
new file mode 100644
index 000000000000..8abdff4fbb87
--- /dev/null
+++ b/sound/soc/intel/avs/tgl.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2021-2024 Intel Corporation. All rights reserved.
+//
+// Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+//          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+//
+
+#include "avs.h"
+
+static int avs_tgl_dsp_core_power(struct avs_dev *adev, u32 core_mask, bool power)
+{
+	core_mask &= AVS_MAIN_CORE_MASK;
+
+	if (!core_mask)
+		return 0;
+	return avs_dsp_core_power(adev, core_mask, power);
+}
+
+static int avs_tgl_dsp_core_reset(struct avs_dev *adev, u32 core_mask, bool reset)
+{
+	core_mask &= AVS_MAIN_CORE_MASK;
+
+	if (!core_mask)
+		return 0;
+	return avs_dsp_core_reset(adev, core_mask, reset);
+}
+
+static int avs_tgl_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall)
+{
+	core_mask &= AVS_MAIN_CORE_MASK;
+
+	if (!core_mask)
+		return 0;
+	return avs_dsp_core_stall(adev, core_mask, stall);
+}
+
+const struct avs_dsp_ops avs_tgl_dsp_ops = {
+	.power = avs_tgl_dsp_core_power,
+	.reset = avs_tgl_dsp_core_reset,
+	.stall = avs_tgl_dsp_core_stall,
+	.irq_handler = avs_irq_handler,
+	.irq_thread = avs_cnl_irq_thread,
+	.int_control = avs_dsp_interrupt_control,
+	.load_basefw = avs_hda_load_basefw,
+	.load_lib = avs_hda_load_library,
+	.transfer_mods = avs_hda_transfer_modules,
+	.log_buffer_offset = avs_icl_log_buffer_offset,
+	.log_buffer_status = avs_apl_log_buffer_status,
+	.coredump = avs_apl_coredump,
+	.d0ix_toggle = avs_icl_d0ix_toggle,
+	.set_d0ix = avs_icl_set_d0ix,
+	AVS_SET_ENABLE_LOGS_OP(icl)
+};
-- 
2.25.1

