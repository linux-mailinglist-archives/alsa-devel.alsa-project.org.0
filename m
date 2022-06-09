Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC2C5441E3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:28:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ACC31FEB;
	Thu,  9 Jun 2022 05:27:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ACC31FEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745320;
	bh=TX+SeT0U//RZ0s9AM5EaLkxDc5a4CUZoOFdZ6f7subw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uTLFB/sUdW6Nwnv5uYTZmHOIr9Afq4BhLb8qByo/5wpXTzD2vOlkYVHlelIjo6dg8
	 8xWwEH5uN1GUHhGNV/VgatTKH7p5BS0ukDzkT6olgn9DHKiNTEjQ+f7vH1qLKY7HOT
	 ewnDa5JCvBpdPQ4Lkryx83BFu4we8LMPyCOUXRAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A03BDF80529;
	Thu,  9 Jun 2022 05:27:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92D71F80526; Thu,  9 Jun 2022 05:27:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0405F80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0405F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lucAN27V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745228; x=1686281228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TX+SeT0U//RZ0s9AM5EaLkxDc5a4CUZoOFdZ6f7subw=;
 b=lucAN27VF1i+uWYmFZe0hYEOD8vfOrduK5yzbWhRV25eisK+EDA216mA
 NXv1tjkE5/uGZx0h9kS/XRBIfuB7gf1Q0kLi0JM0gHwBRxBgOVSInUzeC
 OR73+tB9Ta/YJnSNiu4c1yMA6ZMMZs69GmAtINdKLact58MENOoGLVMlq
 Zj9oSEYI9yAIxAfJi39qp92108sXIZimUxF3WXnVeeol+TyTfCm0AZfYL
 Bif888VHVSlD6d36K//f7Ef4fGQRwilj5tI8zbHToMXYPsyIyFEMGxN7r
 WrP6NGbfd9TYU7IAcU4G+7ngjZKvtcFgbf79DzVGzQ0RW0HBwpSpdT/NI Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219545"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219545"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:58 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260227"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:57 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/23] ASoC: SOF: Add topology tokens for IPC4
Date: Wed,  8 Jun 2022 20:26:21 -0700
Message-Id: <20220609032643.916882-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Add the required tokens for parsing the topology for IPC4.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h | 40 +++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index b72fa385bebf..f7b2019065ad 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -52,11 +52,17 @@
 #define SOF_TKN_SCHED_FRAMES			204
 #define SOF_TKN_SCHED_TIME_DOMAIN		205
 #define SOF_TKN_SCHED_DYNAMIC_PIPELINE		206
+#define SOF_TKN_SCHED_LP_MODE			207
+#define SOF_TKN_SCHED_MEM_USAGE			208
 
 /* volume */
 #define SOF_TKN_VOLUME_RAMP_STEP_TYPE		250
 #define SOF_TKN_VOLUME_RAMP_STEP_MS		251
 
+#define SOF_TKN_GAIN_RAMP_TYPE			260
+#define SOF_TKN_GAIN_RAMP_DURATION		261
+#define SOF_TKN_GAIN_VAL			262
+
 /* SRC */
 #define SOF_TKN_SRC_RATE_IN			300
 #define SOF_TKN_SRC_RATE_OUT			301
@@ -79,6 +85,9 @@
  */
 #define SOF_TKN_COMP_CORE_ID			404
 #define SOF_TKN_COMP_UUID                       405
+#define SOF_TKN_COMP_CPC			406
+#define SOF_TKN_COMP_IS_PAGES			409
+#define SOF_TKN_COMP_NUM_AUDIO_FORMATS		410
 
 /* SSP */
 #define SOF_TKN_INTEL_SSP_CLKS_CONTROL		500
@@ -145,4 +154,35 @@
 #define SOF_TKN_MEDIATEK_AFE_CH			1601
 #define SOF_TKN_MEDIATEK_AFE_FORMAT		1602
 
+/* MIXER */
+#define SOF_TKN_MIXER_TYPE			1700
+
+/* CAVS AUDIO FORMAT */
+#define SOF_TKN_CAVS_AUDIO_FORMAT_IN_RATE	1900
+#define SOF_TKN_CAVS_AUDIO_FORMAT_IN_BIT_DEPTH	1901
+#define SOF_TKN_CAVS_AUDIO_FORMAT_IN_VALID_BIT	1902
+#define SOF_TKN_CAVS_AUDIO_FORMAT_IN_CHANNELS	1903
+#define SOF_TKN_CAVS_AUDIO_FORMAT_IN_CH_MAP	1904
+#define SOF_TKN_CAVS_AUDIO_FORMAT_IN_CH_CFG	1905
+#define SOF_TKN_CAVS_AUDIO_FORMAT_IN_INTERLEAVING_STYLE	1906
+#define SOF_TKN_CAVS_AUDIO_FORMAT_IN_FMT_CFG	1907
+#define SOF_TKN_CAVS_AUDIO_FORMAT_IN_SAMPLE_TYPE	1908
+/* intentional token numbering discontinuity, reserved for future use */
+#define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_RATE	1930
+#define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_BIT_DEPTH	1931
+#define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_VALID_BIT	1932
+#define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_CHANNELS	1933
+#define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_CH_MAP	1934
+#define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_CH_CFG	1935
+#define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_INTERLEAVING_STYLE	1936
+#define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_FMT_CFG	1937
+#define SOF_TKN_CAVS_AUDIO_FORMAT_OUT_SAMPLE_TYPE	1938
+/* intentional token numbering discontinuity, reserved for future use */
+#define SOF_TKN_CAVS_AUDIO_FORMAT_IBS		1970
+#define SOF_TKN_CAVS_AUDIO_FORMAT_OBS		1971
+#define SOF_TKN_CAVS_AUDIO_FORMAT_DMA_BUFFER_SIZE	1972
+
+/* COPIER */
+#define SOF_TKN_INTEL_COPIER_NODE_TYPE		1980
+
 #endif
-- 
2.25.1

