Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8A7A4AAF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 15:42:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5241EA4B;
	Mon, 18 Sep 2023 15:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5241EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695044525;
	bh=bo/JuwD+k9n4xco/rAd9l95ubha52Yro2BUBFk5GWlg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y9v5RVKrE+DjgJQAbDWtopTxiTiFaYRrr31mUSRfOCxE0lUY4zmFj1SfUbtjB4g12
	 Rfh9JZV4MICcdHqhT5aqlUX+jZx6YETKvt4YCom/t+3Q416tVF0/l5NWKoqtO/YYy5
	 V6j/nTo2mEtOYPSCtVi/OgqXwEN0qoBw7tvdPN7U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BBBEF8058C; Mon, 18 Sep 2023 15:40:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A9AF8057B;
	Mon, 18 Sep 2023 15:40:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09183F80124; Mon, 18 Sep 2023 15:40:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 048C1F80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 15:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 048C1F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fLgFyuMZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695044409; x=1726580409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bo/JuwD+k9n4xco/rAd9l95ubha52Yro2BUBFk5GWlg=;
  b=fLgFyuMZOntOCP4kuSxdXNPw8ATqdve+yiPHbb+3orTu61c/uoMu9c/k
   2yW5LrEC7aeNCqSrdB7VjSKPtdk3+FBsp3SeFo+Q6ZIoKa34GmCmAfX53
   EBDRgvVw52jq82VxSktWcMXfPYccoeHQAj372yllLMhiwNZTaY/JJ8BdH
   /Qm/CwZs2Emorj14VhonqwYR5S23/Hoi3nWurB8rHZUzyJ6DOA9sBiahk
   7WHTlQ/X+cQM00bmcoqXRq5HirQlh2JSk9Fc/q7YLbVNuVkebNaAOzcK/
   3BzRaYPSYUDdVpH+VUVPuIAulUmuz7eRnPMWwtrmI/353NOAVFCz+dKhC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466003749"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="466003749"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="745825836"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="745825836"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga002.jf.intel.com with ESMTP; 18 Sep 2023 06:40:03 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Date: Mon, 18 Sep 2023 15:39:24 +0200
Message-Id: <20230918133940.3676091-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230918133940.3676091-1-cezary.rojewski@intel.com>
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: T5YEF4PMLRBCGOM6WOD2XHZ4QDAFE2J5
X-Message-ID-Hash: T5YEF4PMLRBCGOM6WOD2XHZ4QDAFE2J5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5YEF4PMLRBCGOM6WOD2XHZ4QDAFE2J5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Improve granularity of format selection for S32/U32 formats by adding
constants representing 20, 24 and MAX most significant bits.

To make it easy for drivers to utilize those constants, introduce
snd_pcm_subformat_width() and snd_pcm_hw_params_bps(). While the former
is self-explanatory, the latter returns the bit-per-sample value based
on format and subformat characteristics of the provided hw_params.
snd_pcm_hw_copy() helps with copying a hardware parameters space as with
introduction of subformats the operations becomes non-trivial.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/pcm.h               | 14 +++++++++
 include/sound/pcm_params.h        |  2 ++
 include/uapi/sound/asound.h       |  7 +++--
 sound/core/pcm.c                  |  4 +++
 sound/core/pcm_lib.c              | 28 +++++++++++++++++
 sound/core/pcm_misc.c             | 51 +++++++++++++++++++++++++++++++
 tools/include/uapi/sound/asound.h |  7 +++--
 7 files changed, 109 insertions(+), 4 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2a815373dac1..ddacfedba3ab 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -29,9 +29,15 @@
  *  Hardware (lowlevel) section
  */
 
+struct snd_pcm_subformat {
+	snd_pcm_format_t format;	/* SNDRV_PCM_FORMAT_* */
+	u32 mask;			/* Mask of SNDRV_PCM_SUBFMTBIT_* */
+};
+
 struct snd_pcm_hardware {
 	unsigned int info;		/* SNDRV_PCM_INFO_* */
 	u64 formats;			/* SNDRV_PCM_FMTBIT_* */
+	struct snd_pcm_subformat *subformats;
 	unsigned int rates;		/* SNDRV_PCM_RATE_* */
 	unsigned int rate_min;		/* min rate */
 	unsigned int rate_max;		/* max rate */
@@ -217,6 +223,12 @@ struct snd_pcm_ops {
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
@@ -1128,6 +1140,7 @@ int snd_pcm_format_physical_width(snd_pcm_format_t format);		/* in bits */
 ssize_t snd_pcm_format_size(snd_pcm_format_t format, size_t samples);
 const unsigned char *snd_pcm_format_silence_64(snd_pcm_format_t format);
 int snd_pcm_format_set_silence(snd_pcm_format_t format, void *buf, unsigned int frames);
+int snd_pcm_subformat_width(snd_pcm_subformat_t subformat);
 
 void snd_pcm_set_ops(struct snd_pcm * pcm, int direction,
 		     const struct snd_pcm_ops *ops);
@@ -1196,6 +1209,7 @@ snd_pcm_kernel_readv(struct snd_pcm_substream *substream,
 	return __snd_pcm_lib_xfer(substream, bufs, false, frames, true);
 }
 
+int snd_pcm_hw_copy(struct snd_pcm_hardware *hw, const struct snd_pcm_hardware *from);
 int snd_pcm_hw_limit_rates(struct snd_pcm_hardware *hw);
 
 static inline int
diff --git a/include/sound/pcm_params.h b/include/sound/pcm_params.h
index ba184f49f7e1..df17c7d3e853 100644
--- a/include/sound/pcm_params.h
+++ b/include/sound/pcm_params.h
@@ -362,6 +362,8 @@ static inline int params_physical_width(const struct snd_pcm_hw_params *p)
 	return snd_pcm_format_physical_width(params_format(p));
 }
 
+int snd_pcm_hw_params_bps(const struct snd_pcm_hw_params *p);
+
 static inline void
 params_set_format(struct snd_pcm_hw_params *p, snd_pcm_format_t fmt)
 {
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
index 20bb2d7c8d4b..74d7f244e81c 100644
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
@@ -999,6 +1002,7 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 	free_pages_exact(runtime->control,
 		       PAGE_ALIGN(sizeof(struct snd_pcm_mmap_control)));
 	kfree(runtime->hw_constraints.rules);
+	kfree(runtime->hw.subformats);
 	/* Avoid concurrent access to runtime via PCM timer interface */
 	if (substream->timer) {
 		spin_lock_irq(&substream->timer->lock);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index a11cd7d6295f..05f649b0bf00 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1706,6 +1706,34 @@ int snd_pcm_hw_param_last(struct snd_pcm_substream *pcm,
 }
 EXPORT_SYMBOL(snd_pcm_hw_param_last);
 
+/**
+ * snd_pcm_hw_params_bps - Get the number of bits per the sample.
+ * @p: hardware parameters
+ *
+ * Return: The number of bits per sample based on the format,
+ * subformat and msbits the specified hw params has.
+ */
+int snd_pcm_hw_params_bps(const struct snd_pcm_hw_params *p)
+{
+	snd_pcm_subformat_t subformat = params_subformat(p);
+	snd_pcm_format_t format = params_format(p);
+	int width;
+
+	switch (format) {
+	case SNDRV_PCM_FORMAT_S32_LE:
+	case SNDRV_PCM_FORMAT_U32_LE:
+	case SNDRV_PCM_FORMAT_S32_BE:
+	case SNDRV_PCM_FORMAT_U32_BE:
+		width = snd_pcm_subformat_width(subformat);
+		if (width)
+			return width;
+		fallthrough;
+	default:
+		return snd_pcm_format_width(format);
+	}
+}
+EXPORT_SYMBOL(snd_pcm_hw_params_bps);
+
 static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
 				   void *arg)
 {
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index 5588b6a1ee8b..e468b9b82d0c 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -482,6 +482,57 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int
 }
 EXPORT_SYMBOL(snd_pcm_format_set_silence);
 
+/**
+ * snd_pcm_subformat_width - return the bit-width of the subformat
+ * @subformat: the subformat to check
+ *
+ * Return: The bit-width of the subformat, or 0 if result is dependent
+ * on other parameters in the configuration space.
+ */
+int snd_pcm_subformat_width(snd_pcm_subformat_t subformat)
+{
+	switch (subformat) {
+	case SNDRV_PCM_SUBFORMAT_MSBITS_20:
+		return 20;
+	case SNDRV_PCM_SUBFORMAT_MSBITS_24:
+		return 24;
+	case SNDRV_PCM_SUBFORMAT_MSBITS_MAX:
+	case SNDRV_PCM_SUBFORMAT_STD:
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL(snd_pcm_subformat_width);
+
+/**
+ * snd_pcm_hw_copy - Copy information of one hardware parameters space into another.
+ * @hw: the space to copy the information into.
+ * @from: the space to copy the information from.
+ *
+ * Return: Zero on success, negative error code otherwise.
+ */
+int snd_pcm_hw_copy(struct snd_pcm_hardware *hw, const struct snd_pcm_hardware *from)
+{
+	struct snd_pcm_subformat *sf = NULL;
+	struct snd_pcm_subformat *pos;
+	u32 count = 1; /* At least a sentinel. */
+
+	if (from->subformats) {
+		for (pos = from->subformats; pos->mask; pos++)
+			count++;
+
+		sf = kmemdup(from->subformats, count * sizeof(*from->subformats), GFP_KERNEL);
+		if (!sf)
+			return -ENOMEM;
+		kfree(hw->subformats);
+	}
+
+	*hw = *from;
+	hw->subformats = sf;
+	return 0;
+}
+EXPORT_SYMBOL(snd_pcm_hw_copy);
+
 /**
  * snd_pcm_hw_limit_rates - determine rate_min/rate_max fields
  * @hw: the pcm hw instance
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

