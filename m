Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3C37EDF94
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 12:22:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A139844;
	Thu, 16 Nov 2023 12:22:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A139844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700133770;
	bh=x7hSpdmxDwHku0Gw3Nt2H2k9NcxA8uREnviOjleLnKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z4veJl77ZiktcvD4FoUyNief+JGu7syXpBmVExxQGzPrMfe5oKFpE97hy0Uv8eRul
	 NzBFG68iQAg7cTEFqb1c1lur2EM6gy2tOoE67XBMMju9XGKnq5BWeQWAaWKjZePUFa
	 5gTR8JBt2Sdf1WgDNopmc4G+Sh3uV1o2BOzqm6R4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E8BAF80563; Thu, 16 Nov 2023 12:21:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 106C0F80557;
	Thu, 16 Nov 2023 12:21:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEBF5F802E8; Thu, 16 Nov 2023 12:21:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A28E4F80166
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 12:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A28E4F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i7Zj4J0Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133702; x=1731669702;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x7hSpdmxDwHku0Gw3Nt2H2k9NcxA8uREnviOjleLnKM=;
  b=i7Zj4J0YUJS60Q8KY4mRVDnkqHQN+JOg/L2MhZ8t7MMY+BMT5SiEFr45
   LWF/yw4VLxyJUFgeHvVRSIoFuiuR278R+8pm0apWwkXW3hNfX+DtUYF85
   d+gn9BN+AIROHxGaRWpSX3cGbv7t+jgssnrUQ2C9CAJiJe20gQTLlLfCy
   xQ9oQHdfPmViBfRcOt4sFbDGQJa7I9QZUr2n5l4TzjYqWFN6gLW6T2JiF
   AtMW1W4BFeIw6tnOXyvI2j9NDAOWT269VaozFe11uvH/pxP2MK8Q4gbWO
   lVwb+lGcSO1pNDvYm+tlxtNqDJDpOujvLU4f64Lm2CEF2VbtX50gTUnBx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457561949"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200";
   d="scan'208";a="457561949"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 03:21:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200";
   d="scan'208";a="6698214"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:21:34 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 01/16] ALSA: pcm: Introduce MSBITS subformat interface
Date: Thu, 16 Nov 2023 12:22:40 +0100
Message-Id: <20231116112255.1584795-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116112255.1584795-1-cezary.rojewski@intel.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I4PQJRD4IUFR6ZB5G6WN3S2OJBWLZHS3
X-Message-ID-Hash: I4PQJRD4IUFR6ZB5G6WN3S2OJBWLZHS3
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4PQJRD4IUFR6ZB5G6WN3S2OJBWLZHS3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jaroslav Kysela <perex@perex.cz>

Improve granularity of format selection for S32/U32 formats by adding
constants representing 20, 24 and MAX most significant bits.

The MAX means the maximum number of significant bits which can
the physical format hold. For 32-bit formats, MAX is related
to 32 bits. For 8-bit formats, MAX is related to 8 bits etc.

The drivers may use snd_pcm_hw_constraint_subformats with
a simple format -> subformats table.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Co-developed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/pcm.h               |  7 ++++
 include/uapi/sound/asound.h       |  7 ++--
 sound/core/pcm.c                  |  3 ++
 sound/core/pcm_native.c           | 55 +++++++++++++++++++++++++++++--
 tools/include/uapi/sound/asound.h |  7 ++--
 5 files changed, 73 insertions(+), 6 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2a815373dac1..cc175c623dac 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -32,6 +32,7 @@
 struct snd_pcm_hardware {
 	unsigned int info;		/* SNDRV_PCM_INFO_* */
 	u64 formats;			/* SNDRV_PCM_FMTBIT_* */
+	u32 subformats;			/* for S32_LE, SNDRV_PCM_SUBFMTBIT_* */
 	unsigned int rates;		/* SNDRV_PCM_RATE_* */
 	unsigned int rate_min;		/* min rate */
 	unsigned int rate_max;		/* max rate */
@@ -217,6 +218,12 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_FMTBIT_U20		SNDRV_PCM_FMTBIT_U20_BE
 #endif
 
+#define _SNDRV_PCM_SUBFMTBIT(fmt)	BIT((__force int)SNDRV_PCM_SUBFORMAT_##fmt)
+#define SNDRV_PCM_SUBFMTBIT_STD		_SNDRV_PCM_SUBFMTBIT(STD)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_MAX	_SNDRV_PCM_SUBFMTBIT(MSBITS_MAX)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_20	_SNDRV_PCM_SUBFMTBIT(MSBITS_20)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_24	_SNDRV_PCM_SUBFMTBIT(MSBITS_24)
+
 struct snd_pcm_file {
 	struct snd_pcm_substream *substream;
 	int no_compat_mmap;
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index f9939da41122..d5b9cfbd9cea 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
  *                                                                           *
  *****************************************************************************/
 
-#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 15)
+#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 16)
 
 typedef unsigned long snd_pcm_uframes_t;
 typedef signed long snd_pcm_sframes_t;
@@ -267,7 +267,10 @@ typedef int __bitwise snd_pcm_format_t;
 
 typedef int __bitwise snd_pcm_subformat_t;
 #define	SNDRV_PCM_SUBFORMAT_STD		((__force snd_pcm_subformat_t) 0)
-#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_STD
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_MAX	((__force snd_pcm_subformat_t) 1)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_20	((__force snd_pcm_subformat_t) 2)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_24	((__force snd_pcm_subformat_t) 3)
+#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_MSBITS_24
 
 #define SNDRV_PCM_INFO_MMAP		0x00000001	/* hardware supports mmap */
 #define SNDRV_PCM_INFO_MMAP_VALID	0x00000002	/* period data are valid during transfer */
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 20bb2d7c8d4b..c4bc15f048b6 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -265,6 +265,9 @@ static const char * const snd_pcm_access_names[] = {
 
 static const char * const snd_pcm_subformat_names[] = {
 	SUBFORMAT(STD), 
+	SUBFORMAT(MSBITS_MAX),
+	SUBFORMAT(MSBITS_20),
+	SUBFORMAT(MSBITS_24),
 };
 
 static const char * const snd_pcm_tstamp_mode_names[] = {
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index f610b08f5a2b..5a9faa701059 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -479,6 +479,7 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 {
 	const struct snd_interval *i;
 	const struct snd_mask *m;
+	struct snd_mask *m_rw;
 	int err;
 
 	if (!params->msbits) {
@@ -487,6 +488,22 @@ static int fixup_unreferenced_params(struct snd_pcm_substream *substream,
 			params->msbits = snd_interval_value(i);
 	}
 
+	if (params->msbits) {
+		m = hw_param_mask_c(params, SNDRV_PCM_HW_PARAM_FORMAT);
+		if (snd_mask_single(m)) {
+			snd_pcm_format_t format = (__force snd_pcm_format_t)snd_mask_min(m);
+
+			if (snd_pcm_format_linear(format) &&
+			    snd_pcm_format_width(format) != params->msbits) {
+				m_rw = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
+				snd_mask_reset(m_rw,
+					       (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
+				if (snd_mask_empty(m_rw))
+					return -EINVAL;
+			}
+		}
+	}
+
 	if (!params->rate_den) {
 		i = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_RATE);
 		if (snd_interval_single(i)) {
@@ -2483,6 +2500,41 @@ static int snd_pcm_hw_rule_buffer_bytes_max(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }		
 
+static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
+				      struct snd_pcm_hw_rule *rule)
+{
+	struct snd_mask *sfmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
+	struct snd_mask *fmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	u32 *subformats = rule->private;
+	snd_pcm_format_t f;
+	struct snd_mask m;
+
+	snd_mask_none(&m);
+	/* All PCMs support at least the default STD subformat. */
+	snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
+
+	pcm_for_each_format(f) {
+		if (!snd_mask_test(fmask, (__force unsigned)f))
+			continue;
+
+		if (f == SNDRV_PCM_FORMAT_S32_LE)
+			m.bits[0] |= *subformats;
+		else if (snd_pcm_format_linear(f))
+			snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
+	}
+
+	return snd_mask_refine(sfmask, &m);
+}
+
+static int snd_pcm_hw_constraint_subformats(struct snd_pcm_runtime *runtime,
+					   unsigned int cond, u32 *subformats)
+{
+	return snd_pcm_hw_rule_add(runtime, cond, -1,
+				   snd_pcm_hw_rule_subformats, (void *)subformats,
+				   SNDRV_PCM_HW_PARAM_SUBFORMAT,
+				   SNDRV_PCM_HW_PARAM_FORMAT, -1);
+}
+
 static int snd_pcm_hw_constraints_init(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -2634,8 +2686,7 @@ static int snd_pcm_hw_constraints_complete(struct snd_pcm_substream *substream)
 	if (err < 0)
 		return err;
 
-	err = snd_pcm_hw_constraint_mask(runtime, SNDRV_PCM_HW_PARAM_SUBFORMAT,
-					 PARAM_MASK_BIT(SNDRV_PCM_SUBFORMAT_STD));
+	err = snd_pcm_hw_constraint_subformats(runtime, 0, &hw->subformats);
 	if (err < 0)
 		return err;
 
diff --git a/tools/include/uapi/sound/asound.h b/tools/include/uapi/sound/asound.h
index f9939da41122..d5b9cfbd9cea 100644
--- a/tools/include/uapi/sound/asound.h
+++ b/tools/include/uapi/sound/asound.h
@@ -142,7 +142,7 @@ struct snd_hwdep_dsp_image {
  *                                                                           *
  *****************************************************************************/
 
-#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 15)
+#define SNDRV_PCM_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 16)
 
 typedef unsigned long snd_pcm_uframes_t;
 typedef signed long snd_pcm_sframes_t;
@@ -267,7 +267,10 @@ typedef int __bitwise snd_pcm_format_t;
 
 typedef int __bitwise snd_pcm_subformat_t;
 #define	SNDRV_PCM_SUBFORMAT_STD		((__force snd_pcm_subformat_t) 0)
-#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_STD
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_MAX	((__force snd_pcm_subformat_t) 1)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_20	((__force snd_pcm_subformat_t) 2)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_24	((__force snd_pcm_subformat_t) 3)
+#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_MSBITS_24
 
 #define SNDRV_PCM_INFO_MMAP		0x00000001	/* hardware supports mmap */
 #define SNDRV_PCM_INFO_MMAP_VALID	0x00000002	/* period data are valid during transfer */
-- 
2.25.1

