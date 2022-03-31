Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D142B4EDAC1
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 15:43:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 714AE1920;
	Thu, 31 Mar 2022 15:43:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 714AE1920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648734238;
	bh=ZaiNzGX/jQ+AWaux6ukiDkpA16eI04+OqcktDvqKBSQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hsMuri2Clx5VL97B88ySOrrCYZ5SwN+HK0tDM3wbRAiPPzGkGND81CI4zf4ya8SzT
	 kA52sCSQhPOZvFFrx1ihwiHQToQBDwQIYgZickFdP79mT/U/XSCBHV6PoFaOn8VWSx
	 DsNb8q7vuzr78pHEivnbGqBBWngMew0FKCVXsUrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A70B3F8050F;
	Thu, 31 Mar 2022 15:42:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AF90F804AE; Thu, 31 Mar 2022 15:42:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2A82F80100
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 15:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2A82F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IT6UAH6t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648734135; x=1680270135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZaiNzGX/jQ+AWaux6ukiDkpA16eI04+OqcktDvqKBSQ=;
 b=IT6UAH6tjtIBI7ftFj8C+nylsCcjqrhlBAjh+ZRnzE+bxE2mH83wXqKJ
 upgFtdio5L8nShN0Up9d57FNd6YAObfRv72ACt44fntnjSeMl2ep4Xddh
 GiPgdQeJAch9VQHnoLj0hJx+rfuLu9cFXHDCACs5cwqFeTr7y/7ouHLHf
 oJ+vclHp/2YJqXgJyPKzbRm3UtR9WzqYc8/hTnyNuI0UTb+JC6pnbNtth
 /nZ1AbCUOJ0injVSxMz0vmZB+5bNzygVc39zWwvnVFoHKd33YLvGtcDeQ
 bSYdLWoMf1MfHMoJltLTdKH9zFmg/unI+n9w6JlgR75yy2DTn1xAea7V1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259819080"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="259819080"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="522349081"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 31 Mar 2022 06:42:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 01/14] ASoC: Intel: avs: Declare vendor tokens
Date: Thu, 31 Mar 2022 15:52:33 +0200
Message-Id: <20220331135246.993089-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331135246.993089-1-cezary.rojewski@intel.com>
References: <20220331135246.993089-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Expose all vendor tokens that help shape AVS topology. Parsing helpers
introduced in follow up patches make use of these to know which block
they are currently dealing with and to verify their correctness.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/uapi/sound/intel/avs/tokens.h | 126 ++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)
 create mode 100644 include/uapi/sound/intel/avs/tokens.h

diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
new file mode 100644
index 000000000000..754f02b2f444
--- /dev/null
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ *
+ * Authors: Cezary Rojewski <cezary.rojewski@intel.com>
+ *          Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
+ */
+
+#ifndef __UAPI_SOUND_INTEL_AVS_TOKENS_H
+#define __UAPI_SOUND_INTEL_AVS_TOKENS_H
+
+enum avs_tplg_token {
+	/* struct avs_tplg */
+	AVS_TKN_MANIFEST_NAME_STRING			= 1,
+	AVS_TKN_MANIFEST_VERSION_U32			= 2,
+	AVS_TKN_MANIFEST_NUM_LIBRARIES_U32		= 3,
+	AVS_TKN_MANIFEST_NUM_AFMTS_U32			= 4,
+	AVS_TKN_MANIFEST_NUM_MODCFGS_BASE_U32		= 5,
+	AVS_TKN_MANIFEST_NUM_MODCFGS_EXT_U32		= 6,
+	AVS_TKN_MANIFEST_NUM_PPLCFGS_U32		= 7,
+	AVS_TKN_MANIFEST_NUM_BINDINGS_U32		= 8,
+
+	/* struct avs_tplg_library */
+	AVS_TKN_LIBRARY_ID_U32				= 101,
+	AVS_TKN_LIBRARY_NAME_STRING			= 102,
+
+	/* struct avs_audio_format */
+	AVS_TKN_AFMT_ID_U32				= 201,
+	AVS_TKN_AFMT_SAMPLE_RATE_U32			= 202,
+	AVS_TKN_AFMT_BIT_DEPTH_U32			= 203,
+	AVS_TKN_AFMT_CHANNEL_MAP_U32			= 204,
+	AVS_TKN_AFMT_CHANNEL_CFG_U32			= 205,
+	AVS_TKN_AFMT_INTERLEAVING_U32			= 206,
+	AVS_TKN_AFMT_NUM_CHANNELS_U32			= 207,
+	AVS_TKN_AFMT_VALID_BIT_DEPTH_U32		= 208,
+	AVS_TKN_AFMT_SAMPLE_TYPE_U32			= 209,
+
+	/* struct avs_tplg_modcfg_base */
+	AVS_TKN_MODCFG_BASE_ID_U32			= 301,
+	AVS_TKN_MODCFG_BASE_CPC_U32			= 302,
+	AVS_TKN_MODCFG_BASE_IBS_U32			= 303,
+	AVS_TKN_MODCFG_BASE_OBS_U32			= 304,
+	AVS_TKN_MODCFG_BASE_PAGES_U32			= 305,
+
+	/* struct avs_tplg_modcfg_ext */
+	AVS_TKN_MODCFG_EXT_ID_U32			= 401,
+	AVS_TKN_MODCFG_EXT_TYPE_UUID			= 402,
+	AVS_TKN_MODCFG_CPR_OUT_AFMT_ID_U32		= 403,
+	AVS_TKN_MODCFG_CPR_FEATURE_MASK_U32		= 404,
+	AVS_TKN_MODCFG_CPR_DMA_TYPE_U32			= 405,
+	AVS_TKN_MODCFG_CPR_DMABUFF_SIZE_U32		= 406,
+	AVS_TKN_MODCFG_CPR_VINDEX_U8			= 407,
+	AVS_TKN_MODCFG_CPR_BLOB_FMT_ID_U32		= 408,
+	AVS_TKN_MODCFG_MICSEL_OUT_AFMT_ID_U32		= 409,
+	AVS_TKN_MODCFG_INTELWOV_CPC_LP_MODE_U32		= 410,
+	AVS_TKN_MODCFG_SRC_OUT_FREQ_U32			= 411,
+	AVS_TKN_MODCFG_MUX_REF_AFMT_ID_U32		= 412,
+	AVS_TKN_MODCFG_MUX_OUT_AFMT_ID_U32		= 413,
+	AVS_TKN_MODCFG_AEC_REF_AFMT_ID_U32		= 414,
+	AVS_TKN_MODCFG_AEC_OUT_AFMT_ID_U32		= 415,
+	AVS_TKN_MODCFG_AEC_CPC_LP_MODE_U32		= 416,
+	AVS_TKN_MODCFG_ASRC_OUT_FREQ_U32		= 417,
+	AVS_TKN_MODCFG_ASRC_MODE_U8			= 418,
+	AVS_TKN_MODCFG_ASRC_DISABLE_JITTER_U8		= 419,
+	AVS_TKN_MODCFG_UPDOWN_MIX_OUT_CHAN_CFG_U32	= 420,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_SELECT_U32	= 421,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_0_S32		= 422,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_1_S32		= 423,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_2_S32		= 424,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_3_S32		= 425,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_4_S32		= 426,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_5_S32		= 427,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_6_S32		= 428,
+	AVS_TKN_MODCFG_UPDOWN_MIX_COEFF_7_S32		= 429,
+	AVS_TKN_MODCFG_UPDOWN_MIX_CHAN_MAP_U32		= 430,
+	AVS_TKN_MODCFG_EXT_NUM_INPUT_PINS_U16		= 431,
+	AVS_TKN_MODCFG_EXT_NUM_OUTPUT_PINS_U16		= 432,
+
+	/* struct avs_tplg_pplcfg */
+	AVS_TKN_PPLCFG_ID_U32				= 1401,
+	AVS_TKN_PPLCFG_REQ_SIZE_U16			= 1402,
+	AVS_TKN_PPLCFG_PRIORITY_U8			= 1403,
+	AVS_TKN_PPLCFG_LOW_POWER_BOOL			= 1404,
+	AVS_TKN_PPLCFG_ATTRIBUTES_U16			= 1405,
+	AVS_TKN_PPLCFG_TRIGGER_U32			= 1406,
+
+	/* struct avs_tplg_binding */
+	AVS_TKN_BINDING_ID_U32				= 1501,
+	AVS_TKN_BINDING_TARGET_TPLG_NAME_STRING		= 1502,
+	AVS_TKN_BINDING_TARGET_PATH_TMPL_ID_U32		= 1503,
+	AVS_TKN_BINDING_TARGET_PPL_ID_U32		= 1504,
+	AVS_TKN_BINDING_TARGET_MOD_ID_U32		= 1505,
+	AVS_TKN_BINDING_TARGET_MOD_PIN_U8		= 1506,
+	AVS_TKN_BINDING_MOD_ID_U32			= 1507,
+	AVS_TKN_BINDING_MOD_PIN_U8			= 1508,
+	AVS_TKN_BINDING_IS_SINK_U8			= 1509,
+
+	/* struct avs_tplg_pipeline */
+	AVS_TKN_PPL_ID_U32				= 1601,
+	AVS_TKN_PPL_PPLCFG_ID_U32			= 1602,
+	AVS_TKN_PPL_NUM_BINDING_IDS_U32			= 1603,
+	AVS_TKN_PPL_BINDING_ID_U32			= 1604,
+
+	/* struct avs_tplg_module */
+	AVS_TKN_MOD_ID_U32				= 1701,
+	AVS_TKN_MOD_MODCFG_BASE_ID_U32			= 1702,
+	AVS_TKN_MOD_IN_AFMT_ID_U32			= 1703,
+	AVS_TKN_MOD_CORE_ID_U8				= 1704,
+	AVS_TKN_MOD_PROC_DOMAIN_U8			= 1705,
+	AVS_TKN_MOD_MODCFG_EXT_ID_U32			= 1706,
+
+	/* struct avs_tplg_path_template */
+	AVS_TKN_PATH_TMPL_ID_U32			= 1801,
+
+	/* struct avs_tplg_path */
+	AVS_TKN_PATH_ID_U32				= 1901,
+	AVS_TKN_PATH_FE_FMT_ID_U32			= 1902,
+	AVS_TKN_PATH_BE_FMT_ID_U32			= 1903,
+
+	/* struct avs_tplg_pin_format */
+	AVS_TKN_PIN_FMT_INDEX_U32			= 2201,
+	AVS_TKN_PIN_FMT_IOBS_U32			= 2202,
+	AVS_TKN_PIN_FMT_AFMT_ID_U32			= 2203,
+};
+
+#endif
-- 
2.25.1

