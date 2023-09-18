Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B237A4AB7
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 15:43:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CAC4DF5;
	Mon, 18 Sep 2023 15:42:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CAC4DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695044626;
	bh=Ao0Fti3HQX5SzxE6ablx/PbGr9FZ+B+C2Nn7SH023j0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VtWVnQQCtZnSravgUG6L1BjIMcGdYo4HFc36ZavGiEGOFdPQX4uP/cqdVc2QIykQB
	 ATmyBZfYQBM4mfUMo284Tjq2NZ1Oec40d9vFyP38PeWFzONYbuqvxHNj7PAqIUsAnB
	 FUQ493NZwrpfD/h6MWrMKN+/GYq0ehV7lED3WMgE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46C58F805EC; Mon, 18 Sep 2023 15:40:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE241F80552;
	Mon, 18 Sep 2023 15:40:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01AD5F805C1; Mon, 18 Sep 2023 15:40:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5B03F805AE
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 15:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5B03F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DP4iqwOo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695044431; x=1726580431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ao0Fti3HQX5SzxE6ablx/PbGr9FZ+B+C2Nn7SH023j0=;
  b=DP4iqwOoRx9/IE3ljXeq7jXoHJVKvFX3bgNcWdO+CJfBC9zQG0h1fNUu
   HM251+ewG8/iLyCNh9zOarix1cMZ54u3jzvdcxMLWt4EyhB/rpOTCqbWy
   KYYk5++eVADrdP2+P9G4pKG/3Jn89JR1qKMLcR2bVnw90cAeM8C+a90mq
   xb2TJyCVOsmlnPuqOzkQkjmfQz4c6G2fETaTXUIN+gI1N14OiTCWTC016
   vNCj8kL8XCrxhmwiuByc4W9OKvULPpJWTDBk31b0kvNBlOi4k0W+oWzym
   XlWnYbYGb9yD7/HaS3Z3BPh4137w8t2fW22y9qawvcGHrJgCaIpoXeazW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466003779"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="466003779"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:40:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="745825889"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="745825889"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga002.jf.intel.com with ESMTP; 18 Sep 2023 06:40:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 05/17] ALSA: hda: Upgrade stream-format infrastructure
Date: Mon, 18 Sep 2023 15:39:28 +0200
Message-Id: <20230918133940.3676091-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230918133940.3676091-1-cezary.rojewski@intel.com>
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MXHDK7APEXZOGLWCE7F6GBHML37GHULK
X-Message-ID-Hash: MXHDK7APEXZOGLWCE7F6GBHML37GHULK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXHDK7APEXZOGLWCE7F6GBHML37GHULK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce a set of functions that facilite SDxFMT-related calculations
in atomic manner:

snd_hdac_format_normalize() - format converter. S20_LE, S24_LE and their
unsigned and BE friends are invalid from HDAudio perspective but still
can be specified as function argument due to compatibility reasons.

snd_hdac_stream_format_bps() - obtain just the bits-per-sample value.
Does not ignore subformat and msbits parameters.

snd_hdac_stream_format() and snd_hdac_spdif_stream_format() - obtain the
SDxFMT value given the audio format parameters. The former is stripped
away of spdif-related information. Useful for users that do not care
about them.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio.h |   5 ++
 sound/hda/hdac_device.c | 124 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 129 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index a2f10f7785bb..589812c6f6ce 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -140,6 +140,11 @@ int snd_hdac_get_connections(struct hdac_device *codec, hda_nid_t nid,
 			     hda_nid_t *conn_list, int max_conns);
 int snd_hdac_get_sub_nodes(struct hdac_device *codec, hda_nid_t nid,
 			   hda_nid_t *start_id);
+unsigned int snd_hdac_stream_format_bps(snd_pcm_format_t format, snd_pcm_subformat_t subformat,
+					unsigned int maxbps);
+unsigned int snd_hdac_stream_format(unsigned int channels, unsigned int bps, unsigned int rate);
+unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bps,
+					  unsigned int rate, unsigned short spdif_ctls);
 unsigned int snd_hdac_calc_stream_format(unsigned int rate,
 					 unsigned int channels,
 					 snd_pcm_format_t format,
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index a2ce4ea809b3..ff5f45b95be4 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -13,6 +13,7 @@
 #include <sound/hdaudio.h>
 #include <sound/hda_regmap.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include "local.h"
 
 static void setup_fg_nodes(struct hdac_device *codec);
@@ -725,6 +726,129 @@ static const struct hda_rate_tbl rate_bits[] = {
 	{ 0 } /* terminator */
 };
 
+static snd_pcm_format_t snd_hdac_format_normalize(snd_pcm_format_t format)
+{
+	switch (format) {
+	case SNDRV_PCM_FORMAT_S20_LE:
+	case SNDRV_PCM_FORMAT_S24_LE:
+		return SNDRV_PCM_FORMAT_S32_LE;
+
+	case SNDRV_PCM_FORMAT_U20_LE:
+	case SNDRV_PCM_FORMAT_U24_LE:
+		return SNDRV_PCM_FORMAT_U32_LE;
+
+	case SNDRV_PCM_FORMAT_S20_BE:
+	case SNDRV_PCM_FORMAT_S24_BE:
+		return SNDRV_PCM_FORMAT_S32_BE;
+
+	case SNDRV_PCM_FORMAT_U20_BE:
+	case SNDRV_PCM_FORMAT_U24_BE:
+		return SNDRV_PCM_FORMAT_U32_BE;
+
+	default:
+		return format;
+	}
+}
+
+/**
+ * snd_hdac_stream_format_bps - obtain bits per sample value.
+ * @format:	the PCM format.
+ * @subformat:	the PCM subformat.
+ * @maxbps:	the maximum bits per sample.
+ *
+ * Return: The number of bits per sample.
+ */
+unsigned int snd_hdac_stream_format_bps(snd_pcm_format_t format, snd_pcm_subformat_t subformat,
+					unsigned int maxbps)
+{
+	struct snd_pcm_hw_params params;
+	unsigned int bps;
+
+	memset(&params, 0, sizeof(params));
+
+	params_set_format(&params, snd_hdac_format_normalize(format));
+	snd_mask_set(hw_param_mask(&params, SNDRV_PCM_HW_PARAM_SUBFORMAT),
+		     (__force unsigned int)subformat);
+
+	bps = snd_pcm_hw_params_bps(&params);
+	if (maxbps)
+		return min(bps, maxbps);
+	return bps;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_stream_format_bps);
+
+/**
+ * snd_hdac_stream_format - convert format parameters to SDxFMT value.
+ * @channels:	the number of channels.
+ * @bps:	bits per sample.
+ * @rate:	the sample rate.
+ *
+ * Return: The format bitset or zero if invalid.
+ */
+unsigned int snd_hdac_stream_format(unsigned int channels, unsigned int bps, unsigned int rate)
+{
+	unsigned int val = 0;
+	int i;
+
+	for (i = 0; rate_bits[i].hz; i++) {
+		if (rate_bits[i].hz == rate) {
+			val = rate_bits[i].hda_fmt;
+			break;
+		}
+	}
+
+	if (!rate_bits[i].hz)
+		return 0;
+
+	if (channels == 0 || channels > 8)
+		return 0;
+	val |= channels - 1;
+
+	switch (bps) {
+	case 8:
+		val |= AC_FMT_BITS_8;
+		break;
+	case 16:
+		val |= AC_FMT_BITS_16;
+		break;
+	case 20:
+		val |= AC_FMT_BITS_20;
+		break;
+	case 24:
+		val |= AC_FMT_BITS_24;
+		break;
+	case 32:
+		val |= AC_FMT_BITS_32;
+		break;
+	default:
+		return 0;
+	}
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_stream_format);
+
+/**
+ * snd_hdac_spdif_stream_format - convert format parameters to SDxFMT value.
+ * @channels:	the number of channels.
+ * @bps:	bits per sample.
+ * @rate:	the sample rate.
+ * @spdif_ctls:	HD-audio SPDIF status bits (0 if irrelevant).
+ *
+ * Return: The format bitset or zero if invalid.
+ */
+unsigned int snd_hdac_spdif_stream_format(unsigned int channels, unsigned int bps,
+					  unsigned int rate, unsigned short spdif_ctls)
+{
+	unsigned int val = snd_hdac_stream_format(channels, bps, rate);
+
+	if (val && spdif_ctls & AC_DIG1_NONAUDIO)
+		val |= AC_FMT_TYPE_NON_PCM;
+
+	return val;
+}
+EXPORT_SYMBOL_GPL(snd_hdac_spdif_stream_format);
+
 /**
  * snd_hdac_calc_stream_format - calculate the format bitset
  * @rate: the sample rate
-- 
2.25.1

