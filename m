Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA881785257
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 10:10:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AC1FA4D;
	Wed, 23 Aug 2023 10:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AC1FA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692778200;
	bh=OJ576/1w9u7k81TtDQ7Kv6kMK9t0WXvYg95NJFotF0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qx39K1HhJ1nY7c6jF2L7sCdssWmhx70vqwKByNHvC6YWZ4hqsoTcinZkxkOtBk++f
	 WoH8OcismkK+ePeX9lRT+VbPz2wXlebD3lPcsNdzro5OsmqXaAU7/mqXH9meUohI07
	 957esIMG7SkqVHCCnfHMenhB2uPiN+WPx3WPQgLY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37C86F805A9; Wed, 23 Aug 2023 10:07:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D1D9F805AB;
	Wed, 23 Aug 2023 10:07:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ACA5F80537; Wed, 23 Aug 2023 10:06:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E975F80158
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E975F80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KMclLn5y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692777971; x=1724313971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OJ576/1w9u7k81TtDQ7Kv6kMK9t0WXvYg95NJFotF0Q=;
  b=KMclLn5y/Wy1UEGdI2eX7N1BHuTdJGBUCBmKP7vdlzySQDPRPjnDRRBt
   txg9UxzI7eFw/6OkNR4zNF34EBOrFJCmTDLnnLebFHnYqTmqpY3SuyUmb
   7H3+yLGn3nc9WBSzZbUs84+G9BK+nbsXr3bxzUmIF4i6IUK4IcSTZk2hx
   VQD+lpwz11KgYgpCz+5nbcT6+mZSrcwrdJeXzKl1yk+XJLaSOl37yVfd6
   4QFcqN1z9o4rGQHwnEPj6s4CRWuHFHYEU5L718XSUwrzn+25ig0KgPAWJ
   NhD39R/C33j2BH3UtLOwK+kFqnrZh4cZGCClavlpLNHMR5eTkUu9JWWPr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372987983"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="372987983"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="766042635"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="766042635"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 01:06:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Date: Wed, 23 Aug 2023 10:05:30 +0200
Message-Id: <20230823080546.2224713-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823080546.2224713-1-cezary.rojewski@intel.com>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MBZVB2RXSXCYNXQ2B53ELGXY5UBWRVAY
X-Message-ID-Hash: MBZVB2RXSXCYNXQ2B53ELGXY5UBWRVAY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBZVB2RXSXCYNXQ2B53ELGXY5UBWRVAY/>
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
snd_pcm_subformat_width() and snd_pcm_hw_params_bps(). While the former
is self-explanatory, the latter returns the bit-per-sample value based
on format, subformat and msbits characteristics of the provided
hw_params.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/pcm.h               |  8 ++++++++
 include/sound/pcm_params.h        |  2 ++
 include/uapi/sound/asound.h       |  5 ++++-
 sound/core/pcm.c                  |  3 +++
 sound/core/pcm_lib.c              | 30 ++++++++++++++++++++++++++++++
 sound/core/pcm_misc.c             | 23 +++++++++++++++++++++++
 tools/include/uapi/sound/asound.h |  5 ++++-
 7 files changed, 74 insertions(+), 2 deletions(-)

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
index f9939da41122..30a43541ed00 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
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
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index 9d95e3731123..7900897ef036 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -265,6 +265,9 @@ static const char * const snd_pcm_access_names[] = {
 
 static const char * const snd_pcm_subformat_names[] = {
 	SUBFORMAT(STD), 
+	SUBFORMAT(MSBITS_20),
+	SUBFORMAT(MSBITS_24),
+	SUBFORMAT(MSBITS_32),
 };
 
 static const char * const snd_pcm_tstamp_mode_names[] = {
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 9c121a921b04..ed7e3dc6b529 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1706,6 +1706,36 @@ int snd_pcm_hw_param_last(struct snd_pcm_substream *pcm,
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
+		if (p->msbits)
+			return (int)p->msbits;
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
index f9939da41122..30a43541ed00 100644
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

