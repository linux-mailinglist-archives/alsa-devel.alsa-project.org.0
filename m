Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD0C779521
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 18:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6B49852;
	Fri, 11 Aug 2023 18:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6B49852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691772672;
	bh=acwhoOhlpZq7S3kSVfDdEptkwmpR6HwxRSBoiGZkFGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GfSA8iebVs+D2prvdoVZff8IqcdRwNRnit0/fG2p9KPJvyyEfPhXl7r7067RrBrCq
	 hv3ysi3IpmstC7jrzhAbl1b5g7Y7uo7p//PO28/rP5oIDWniZIr5wwxvgaEvZTkFUI
	 NymiB1dLEmMI5zLfDfJsCOut1hsYIPTQA2WZ+rCY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A493F8057E; Fri, 11 Aug 2023 18:49:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E341F8056F;
	Fri, 11 Aug 2023 18:49:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0CDAF80557; Fri, 11 Aug 2023 18:49:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9D5EF80134
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 18:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9D5EF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=N2A3rXH4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691772557; x=1723308557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=acwhoOhlpZq7S3kSVfDdEptkwmpR6HwxRSBoiGZkFGA=;
  b=N2A3rXH4w85a+1w8WtbUifCx8vfLUNPvgEXyOmuLKEsoKRMjoTQxcgJD
   jaT08vlM24qesb3CS3/VSTSR+2eFb6FY4R4Qe7+BSHw2qTKmDmtwPhWey
   HXN/CjpeX0sYzMEcVSnuiN4P/VxPxZLHI44mDJMgdMBzpltdWzDNAWVXB
   2erx3R3YIKYGN6DB01WFtwHNRAu8hZ8L6gl7DAu17yiIBjVdVO7zRUoIW
   BJlWfb7NlVhV+ackFOYNd7BFJdr0vvqKRFFFZYVfCDiHpqUpy3USQXris
   rDLe8VWAJuOKI/EkQHsnbEuEKMrUW5JZVgO4nw/H9nyO6Xlh+4ekDkBex
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371725011"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="371725011"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:49:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846842744"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="846842744"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 09:49:09 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Date: Fri, 11 Aug 2023 18:48:37 +0200
Message-Id: <20230811164853.1797547-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811164853.1797547-1-cezary.rojewski@intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PCKQ2TINUPYVGE2LXCOVY5BYBHWZWQII
X-Message-ID-Hash: PCKQ2TINUPYVGE2LXCOVY5BYBHWZWQII
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCKQ2TINUPYVGE2LXCOVY5BYBHWZWQII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Improve granularity of format selection for S32/U32 formats by adding
constants representing 20, 24 and 32 most significant bits.

To make it easy for drivers to utilize those constants, introduce
snd_pcm_subformat_width() and params_bps(). While the former is
self-explanatory, the latter returns the bit-per-sample value based on
format, subformat and msbits characteristics of the provided hw_params.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/pcm.h               |  8 ++++++++
 include/sound/pcm_params.h        |  2 ++
 include/uapi/sound/asound.h       |  5 ++++-
 sound/core/pcm_lib.c              | 30 ++++++++++++++++++++++++++++++
 sound/core/pcm_misc.c             | 23 +++++++++++++++++++++++
 tools/include/uapi/sound/asound.h |  5 ++++-
 6 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 19f564606ac4..f78441ff9d85 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -31,6 +31,7 @@
 struct snd_pcm_hardware {
 	unsigned int info;		/* SNDRV_PCM_INFO_* */
 	u64 formats;			/* SNDRV_PCM_FMTBIT_* */
+	u64 subformats;			/* SNDRV_PCM_SUBFMTBIT_* */
 	unsigned int rates;		/* SNDRV_PCM_RATE_* */
 	unsigned int rate_min;		/* min rate */
 	unsigned int rate_max;		/* max rate */
@@ -219,6 +220,12 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_FMTBIT_U20		SNDRV_PCM_FMTBIT_U20_BE
 #endif
 
+#define _SNDRV_PCM_SUBFMTBIT(fmt)	BIT((__force int)SNDRV_PCM_SUBFORMAT_##fmt)
+#define SNDRV_PCM_SUBFMTBIT_STD		_SNDRV_PCM_SUBFMTBIT(STD)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_20	_SNDRV_PCM_SUBFMTBIT(MSBITS_20)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_24	_SNDRV_PCM_SUBFMTBIT(MSBITS_24)
+#define SNDRV_PCM_SUBFMTBIT_MSBITS_32	_SNDRV_PCM_SUBFMTBIT(MSBITS_32)
+
 struct snd_pcm_file {
 	struct snd_pcm_substream *substream;
 	int no_compat_mmap;
@@ -1130,6 +1137,7 @@ int snd_pcm_format_physical_width(snd_pcm_format_t format);		/* in bits */
 ssize_t snd_pcm_format_size(snd_pcm_format_t format, size_t samples);
 const unsigned char *snd_pcm_format_silence_64(snd_pcm_format_t format);
 int snd_pcm_format_set_silence(snd_pcm_format_t format, void *buf, unsigned int frames);
+int snd_pcm_subformat_width(snd_pcm_subformat_t subformat);
 
 void snd_pcm_set_ops(struct snd_pcm * pcm, int direction,
 		     const struct snd_pcm_ops *ops);
diff --git a/include/sound/pcm_params.h b/include/sound/pcm_params.h
index ba184f49f7e1..f09ae37ed44d 100644
--- a/include/sound/pcm_params.h
+++ b/include/sound/pcm_params.h
@@ -362,6 +362,8 @@ static inline int params_physical_width(const struct snd_pcm_hw_params *p)
 	return snd_pcm_format_physical_width(params_format(p));
 }
 
+int params_bps(const struct snd_pcm_hw_params *p);
+
 static inline void
 params_set_format(struct snd_pcm_hw_params *p, snd_pcm_format_t fmt)
 {
diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index d6864f672630..27db9f3558fd 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -268,7 +268,10 @@ typedef int __bitwise snd_pcm_format_t;
 
 typedef int __bitwise snd_pcm_subformat_t;
 #define	SNDRV_PCM_SUBFORMAT_STD		((__force snd_pcm_subformat_t) 0)
-#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_STD
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_20	((__force snd_pcm_subformat_t) 1)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_24	((__force snd_pcm_subformat_t) 2)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_32	((__force snd_pcm_subformat_t) 3)
+#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_MSBITS_32
 
 #define SNDRV_PCM_INFO_MMAP		0x00000001	/* hardware supports mmap */
 #define SNDRV_PCM_INFO_MMAP_VALID	0x00000002	/* period data are valid during transfer */
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 9c121a921b04..4a60632220c2 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1706,6 +1706,36 @@ int snd_pcm_hw_param_last(struct snd_pcm_substream *pcm,
 }
 EXPORT_SYMBOL(snd_pcm_hw_param_last);
 
+/**
+ * params_bps - Get the number of bits per the sample.
+ * @p: hardware parameters
+ *
+ * Return: The number of bits per sample based on the format,
+ * subformat and msbits the specified hw params has.
+ */
+int params_bps(const struct snd_pcm_hw_params *p)
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
+		if (p->msbits)
+			return (int)p->msbits;
+		fallthrough;
+	default:
+		return snd_pcm_format_width(format);
+	}
+}
+EXPORT_SYMBOL(params_bps);
+
 static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
 				   void *arg)
 {
diff --git a/sound/core/pcm_misc.c b/sound/core/pcm_misc.c
index 5588b6a1ee8b..127bb36fd2e4 100644
--- a/sound/core/pcm_misc.c
+++ b/sound/core/pcm_misc.c
@@ -482,6 +482,29 @@ int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data, unsigned int
 }
 EXPORT_SYMBOL(snd_pcm_format_set_silence);
 
+/**
+ * snd_pcm_subformat_width - return the bit-width of the subformat
+ * @subformat: the subformat to check
+ *
+ * Return: The bit-width of the subformat, or a negative error code
+ * otherwise.
+ */
+int snd_pcm_subformat_width(snd_pcm_subformat_t subformat)
+{
+	switch (subformat) {
+	case SNDRV_PCM_SUBFORMAT_MSBITS_20:
+		return 20;
+	case SNDRV_PCM_SUBFORMAT_MSBITS_24:
+		return 24;
+	case SNDRV_PCM_SUBFORMAT_MSBITS_32:
+		return 32;
+	case SNDRV_PCM_SUBFORMAT_STD:
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL(snd_pcm_subformat_width);
+
 /**
  * snd_pcm_hw_limit_rates - determine rate_min/rate_max fields
  * @hw: the pcm hw instance
diff --git a/tools/include/uapi/sound/asound.h b/tools/include/uapi/sound/asound.h
index 0aa955aa8246..eb45a698767f 100644
--- a/tools/include/uapi/sound/asound.h
+++ b/tools/include/uapi/sound/asound.h
@@ -267,7 +267,10 @@ typedef int __bitwise snd_pcm_format_t;
 
 typedef int __bitwise snd_pcm_subformat_t;
 #define	SNDRV_PCM_SUBFORMAT_STD		((__force snd_pcm_subformat_t) 0)
-#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_STD
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_20	((__force snd_pcm_subformat_t) 1)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_24	((__force snd_pcm_subformat_t) 2)
+#define	SNDRV_PCM_SUBFORMAT_MSBITS_32	((__force snd_pcm_subformat_t) 3)
+#define	SNDRV_PCM_SUBFORMAT_LAST	SNDRV_PCM_SUBFORMAT_MSBITS_32
 
 #define SNDRV_PCM_INFO_MMAP		0x00000001	/* hardware supports mmap */
 #define SNDRV_PCM_INFO_MMAP_VALID	0x00000002	/* period data are valid during transfer */
-- 
2.25.1

