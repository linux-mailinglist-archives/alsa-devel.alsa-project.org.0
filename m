Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4BA7EF257
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 13:09:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C4E1DED;
	Fri, 17 Nov 2023 13:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C4E1DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222968;
	bh=VuYlq/FCccFmDGVaizE1u1dTXFhtVM3x9r1OKSKW4tI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YrL9eFHJfOpl/Lb3tIB5xte26w1oN2FFfZ+LBrMiCMI2nUauIncFuk9HI/+WRc3iz
	 Cu76NBKtEPGerGO/65F+R9DXOi87bNLLqYkQ/r6++l4dZKzKnsP2oYOivuF3/ffG0q
	 M+qCVU5tbuLgbGW8FzbnfzOHQqv/Fe0ugdTaOacs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDDD9F80564; Fri, 17 Nov 2023 13:06:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3E6FF80551;
	Fri, 17 Nov 2023 13:06:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E59A5F802E8; Fri, 17 Nov 2023 13:06:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97B2EF801D5
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 13:04:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97B2EF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IbMU4gno
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222653; x=1731758653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VuYlq/FCccFmDGVaizE1u1dTXFhtVM3x9r1OKSKW4tI=;
  b=IbMU4gnoaeCQ7cPGeCiatSQ3hajCLI8ePB5PMpp/KxoOb5E6vdOrpIwu
   Br4gWK/X1a18Bq8YMpUwcbZnYn4bpkN00RQkT7Tb4pVoKQcDdg9tGabZr
   SLHi4eXoojJoWgS1C/lW2nZuu2ACfx7H8tJUWI9L1cbWnfGxRfWUP1QPg
   lAY33dYAwN6Ep6lsIiCPYSWdwse1+Qnuo+0ZqTdaVJK6IbKKEbnoycY8v
   Dp7SOh26xOIQc1Wwn9wS9VBADp9LWOoUjR976NPKJeb/2QYvLZDToy29V
   FJMNpcZz0IioEWVyFazlMyPcMzi4jS9bQDHxJZ99CbPlBI/qWeoLdR/+Z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675175"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="381675175"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 04:04:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110158"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="883110158"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:05 -0800
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
Subject: [PATCH v5 02/16] ALSA: hda: Honor subformat when querying PCMs
Date: Fri, 17 Nov 2023 13:05:56 +0100
Message-Id: <20231117120610.1755254-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KALCDJURLLD3R5GV2APLEBKCXLJTQPLU
X-Message-ID-Hash: KALCDJURLLD3R5GV2APLEBKCXLJTQPLU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KALCDJURLLD3R5GV2APLEBKCXLJTQPLU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Update mechanism for querying supported PCMs to allow for granular
format selection when container size is 32 bits. Currently always the
highest bit depth is selected, regardless of how many actual formats
codec in question supports.

Acked-by: Mark Brown <broonie@kernel.org>
Co-developed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hda_codec.h    |  5 ++--
 include/sound/hdaudio.h      |  3 ++-
 sound/hda/hdac_device.c      | 45 ++++++++++++++++++++----------------
 sound/pci/hda/hda_codec.c    |  2 ++
 sound/pci/hda/patch_hdmi.c   |  1 +
 sound/soc/codecs/hdac_hdmi.c |  3 ++-
 6 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 5497dc9c396a..9c94ba7c183d 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -141,6 +141,7 @@ struct hda_pcm_stream {
 	hda_nid_t nid;	/* default NID to query rates/formats/bps, or set up */
 	u32 rates;	/* supported rates */
 	u64 formats;	/* supported formats (SNDRV_PCM_FMTBIT_) */
+	u32 subformats;	/* for S32_LE format, SNDRV_PCM_SUBFMTBIT_* */
 	unsigned int maxbps;	/* supported max. bit per sample */
 	const struct snd_pcm_chmap_elem *chmap; /* chmap to override */
 	struct hda_pcm_ops ops;
@@ -448,8 +449,8 @@ void __snd_hda_codec_cleanup_stream(struct hda_codec *codec, hda_nid_t nid,
 #define snd_hda_codec_cleanup_stream(codec, nid) \
 	__snd_hda_codec_cleanup_stream(codec, nid, 0)
 
-#define snd_hda_query_supported_pcm(codec, nid, ratesp, fmtsp, bpsp) \
-	snd_hdac_query_supported_pcm(&(codec)->core, nid, ratesp, fmtsp, bpsp)
+#define snd_hda_query_supported_pcm(codec, nid, ratesp, fmtsp, subfmtp, bpsp) \
+	snd_hdac_query_supported_pcm(&(codec)->core, nid, ratesp, fmtsp, subfmtp, bpsp)
 #define snd_hda_is_supported_format(codec, nid, fmt) \
 	snd_hdac_is_supported_format(&(codec)->core, nid, fmt)
 
diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index dd7c87bbc613..7cfea9e7f6e4 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -146,7 +146,8 @@ unsigned int snd_hdac_calc_stream_format(unsigned int rate,
 					 unsigned int maxbps,
 					 unsigned short spdif_ctls);
 int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
-				u32 *ratesp, u64 *formatsp, unsigned int *bpsp);
+				 u32 *ratesp, u64 *formatsp, u32 *subformatsp,
+				 unsigned int *bpsp);
 bool snd_hdac_is_supported_format(struct hdac_device *codec, hda_nid_t nid,
 				  unsigned int format);
 
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index bbf7bcdb449a..cde4d5c33771 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -817,15 +817,17 @@ static unsigned int query_stream_param(struct hdac_device *codec, hda_nid_t nid)
  * @nid: NID to query
  * @ratesp: the pointer to store the detected rate bitflags
  * @formatsp: the pointer to store the detected formats
+ * @subformatsp: the pointer to store the detected subformats for S32_LE format
  * @bpsp: the pointer to store the detected format widths
  *
- * Queries the supported PCM rates and formats.  The NULL @ratesp, @formatsp
- * or @bsps argument is ignored.
+ * Queries the supported PCM rates and formats.  The NULL @ratesp, @formatsp,
+ * @subformatsp or @bpsp argument is ignored.
  *
  * Returns 0 if successful, otherwise a negative error code.
  */
 int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
-				 u32 *ratesp, u64 *formatsp, unsigned int *bpsp)
+				 u32 *ratesp, u64 *formatsp, u32 *subformatsp,
+				 unsigned int *bpsp)
 {
 	unsigned int i, val, wcaps;
 
@@ -848,9 +850,10 @@ int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
 		*ratesp = rates;
 	}
 
-	if (formatsp || bpsp) {
-		u64 formats = 0;
+	if (formatsp || subformatsp || bpsp) {
 		unsigned int streams, bps;
+		u32 subformats = 0;
+		u64 formats = 0;
 
 		streams = query_stream_param(codec, nid);
 		if (!streams)
@@ -866,24 +869,24 @@ int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
 				formats |= SNDRV_PCM_FMTBIT_S16_LE;
 				bps = 16;
 			}
-			if (wcaps & AC_WCAP_DIGITAL) {
-				if (val & AC_SUPPCM_BITS_32)
+			if (val & AC_SUPPCM_BITS_20) {
+				formats |= SNDRV_PCM_FMTBIT_S32_LE;
+				subformats |= SNDRV_PCM_SUBFMTBIT_MSBITS_20;
+				bps = 20;
+			}
+			if (val & AC_SUPPCM_BITS_24) {
+				formats |= SNDRV_PCM_FMTBIT_S32_LE;
+				subformats |= SNDRV_PCM_SUBFMTBIT_MSBITS_24;
+				bps = 24;
+			}
+			if (val & AC_SUPPCM_BITS_32) {
+				if (wcaps & AC_WCAP_DIGITAL) {
 					formats |= SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE;
-				if (val & (AC_SUPPCM_BITS_20|AC_SUPPCM_BITS_24))
+				} else {
 					formats |= SNDRV_PCM_FMTBIT_S32_LE;
-				if (val & AC_SUPPCM_BITS_24)
-					bps = 24;
-				else if (val & AC_SUPPCM_BITS_20)
-					bps = 20;
-			} else if (val & (AC_SUPPCM_BITS_20|AC_SUPPCM_BITS_24|
-					  AC_SUPPCM_BITS_32)) {
-				formats |= SNDRV_PCM_FMTBIT_S32_LE;
-				if (val & AC_SUPPCM_BITS_32)
+					subformats |= SNDRV_PCM_SUBFMTBIT_MSBITS_MAX;
 					bps = 32;
-				else if (val & AC_SUPPCM_BITS_24)
-					bps = 24;
-				else if (val & AC_SUPPCM_BITS_20)
-					bps = 20;
+				}
 			}
 		}
 #if 0 /* FIXME: CS4206 doesn't work, which is the only codec supporting float */
@@ -911,6 +914,8 @@ int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
 		}
 		if (formatsp)
 			*formatsp = formats;
+		if (subformatsp)
+			*subformatsp = subformats;
 		if (bpsp)
 			*bpsp = bps;
 	}
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 01718b1fc9a7..12f02cdc9659 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3163,6 +3163,7 @@ static int set_pcm_default_values(struct hda_codec *codec,
 		err = snd_hda_query_supported_pcm(codec, info->nid,
 				info->rates ? NULL : &info->rates,
 				info->formats ? NULL : &info->formats,
+				info->subformats ? NULL : &info->subformats,
 				info->maxbps ? NULL : &info->maxbps);
 		if (err < 0)
 			return err;
@@ -3757,6 +3758,7 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 			snd_hda_query_supported_pcm(codec, mout->dig_out_nid,
 						    &mout->spdif_rates,
 						    &mout->spdif_formats,
+						    NULL,
 						    &mout->spdif_maxbps);
 		}
 		mutex_lock(&codec->spdif_mutex);
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 1cde2a69bdb4..687b8b8fd7ac 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1977,6 +1977,7 @@ static int hdmi_add_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 	err = snd_hda_query_supported_pcm(codec, cvt_nid,
 					  &per_cvt->rates,
 					  &per_cvt->formats,
+					  NULL,
 					  &per_cvt->maxbps);
 	if (err < 0)
 		return err;
diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index b9c5ffbfb5ba..3e4f632d8665 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -670,6 +670,7 @@ hdac_hdmi_query_cvt_params(struct hdac_device *hdev, struct hdac_hdmi_cvt *cvt)
 	err = snd_hdac_query_supported_pcm(hdev, cvt->nid,
 			&cvt->params.rates,
 			&cvt->params.formats,
+			NULL,
 			&cvt->params.maxbps);
 	if (err < 0)
 		dev_err(&hdev->dev,
@@ -1577,7 +1578,7 @@ static int hdac_hdmi_create_dais(struct hdac_device *hdev,
 
 	list_for_each_entry(cvt, &hdmi->cvt_list, head) {
 		ret = snd_hdac_query_supported_pcm(hdev, cvt->nid,
-					&rates,	&formats, &bps);
+					&rates,	&formats, NULL, &bps);
 		if (ret)
 			return ret;
 
-- 
2.25.1

