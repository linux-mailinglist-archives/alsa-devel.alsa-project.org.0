Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26494785263
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 10:11:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 865E57F1;
	Wed, 23 Aug 2023 10:10:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 865E57F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692778270;
	bh=ngU0OZ1zaFpKeiLs9pGmm0oDyxE4GLMkNKWHMdSNTVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c/Pm3HB2/Sj45RPh+9L70bIeYFd1UP91E82hXDzCN4Crw/oUT40jDfDFNN2s1cIDE
	 UwcCYVLiycQZZ/3asyxjRuEX8p6S/SJ+/z4KnHudidJUO7PUx+/0EplwVklCktf45Y
	 Jy+g/KiJqVnxFsdc2QC7Ekb+x9x2pezVMyDyGrxI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7737BF805E9; Wed, 23 Aug 2023 10:07:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1BBCF805EA;
	Wed, 23 Aug 2023 10:07:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6EFFF80022; Wed, 23 Aug 2023 10:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FEAAF8022B
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 10:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FEAAF8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Qj/MZ8Zh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692777973; x=1724313973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ngU0OZ1zaFpKeiLs9pGmm0oDyxE4GLMkNKWHMdSNTVQ=;
  b=Qj/MZ8ZhObn4FYAtQeo+opF8jnktSspMSlnuxBfDxSSiwXXcCKp4trLV
   CEEvoGA1OmVFPe4pqW+gsHSOIBYE32EnV7knDvBLm/rGq1SEQcPEanq15
   2fd9zuCh21RI4tSYoiPXRQ+9dmg+X452rSBVK41Pc/gIb+uLRfLI8bGuk
   mv+9995HamB/TJK2NXg/Fbd5yfvcjUwq3B8oJQZ0j7+QXy0otV6or8CLt
   hLA4gNQ/UVwtvqY8mehPdNf5jSMqjjs9JU+s0IX1A+OAXVbzdzh9RGxOo
   HkkkTa2+pRcrRWnyhH9lEy4KTYNw59GvANhgeVVfWwvmJGum7HVIt6qq+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="372988021"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="372988021"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 01:06:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="766042668"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="766042668"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga008.jf.intel.com with ESMTP; 23 Aug 2023 01:06:09 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 03/17] ALSA: hda: Honor subformat when querying PCMs
Date: Wed, 23 Aug 2023 10:05:32 +0200
Message-Id: <20230823080546.2224713-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823080546.2224713-1-cezary.rojewski@intel.com>
References: <20230823080546.2224713-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZSDQU7L45Z7CJMXBWUOLDQUWLXBB4C5W
X-Message-ID-Hash: ZSDQU7L45Z7CJMXBWUOLDQUWLXBB4C5W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSDQU7L45Z7CJMXBWUOLDQUWLXBB4C5W/>
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

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hda_codec.h    |  5 +++--
 include/sound/hdaudio.h      |  2 +-
 sound/hda/hdac_device.c      | 42 ++++++++++++++++++++----------------
 sound/pci/hda/hda_codec.c    |  2 ++
 sound/pci/hda/patch_hdmi.c   |  1 +
 sound/soc/codecs/hdac_hdmi.c |  3 ++-
 6 files changed, 32 insertions(+), 23 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 5497dc9c396a..2ffefcfe06aa 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -141,6 +141,7 @@ struct hda_pcm_stream {
 	hda_nid_t nid;	/* default NID to query rates/formats/bps, or set up */
 	u32 rates;	/* supported rates */
 	u64 formats;	/* supported formats (SNDRV_PCM_FMTBIT_) */
+	u64 subformats;	/* supported subformats (SNDRV_PCM_SUBFMTBIT_) */
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
index 32c59053b48e..000fc72aaece 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -146,7 +146,7 @@ unsigned int snd_hdac_calc_stream_format(unsigned int rate,
 					 unsigned int maxbps,
 					 unsigned short spdif_ctls);
 int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
-				u32 *ratesp, u64 *formatsp, unsigned int *bpsp);
+				 u32 *ratesp, u64 *formatsp, u64 *subformatsp, unsigned int *bpsp);
 bool snd_hdac_is_supported_format(struct hdac_device *codec, hda_nid_t nid,
 				  unsigned int format);
 
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index bbf7bcdb449a..eb4ece908bca 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -817,15 +817,16 @@ static unsigned int query_stream_param(struct hdac_device *codec, hda_nid_t nid)
  * @nid: NID to query
  * @ratesp: the pointer to store the detected rate bitflags
  * @formatsp: the pointer to store the detected formats
+ * @subformatsp: the pointer to store the detected subformats
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
+				 u32 *ratesp, u64 *formatsp, u64 *subformatsp, unsigned int *bpsp)
 {
 	unsigned int i, val, wcaps;
 
@@ -848,8 +849,9 @@ int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
 		*ratesp = rates;
 	}
 
-	if (formatsp || bpsp) {
+	if (formatsp || subformatsp || bpsp) {
 		u64 formats = 0;
+		u64 subformats = 0;
 		unsigned int streams, bps;
 
 		streams = query_stream_param(codec, nid);
@@ -866,24 +868,24 @@ int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
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
+				subformats |= SNDRV_PCM_SUBFMTBIT_MSBITS_32;
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
 					bps = 32;
-				else if (val & AC_SUPPCM_BITS_24)
-					bps = 24;
-				else if (val & AC_SUPPCM_BITS_20)
-					bps = 20;
+				}
 			}
 		}
 #if 0 /* FIXME: CS4206 doesn't work, which is the only codec supporting float */
@@ -911,6 +913,8 @@ int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
 		}
 		if (formatsp)
 			*formatsp = formats;
+		if (subformatsp)
+			*subformatsp = subformats;
 		if (bpsp)
 			*bpsp = bps;
 	}
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index bd19f92aeeec..3c1555e327cd 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3165,6 +3165,7 @@ static int set_pcm_default_values(struct hda_codec *codec,
 		err = snd_hda_query_supported_pcm(codec, info->nid,
 				info->rates ? NULL : &info->rates,
 				info->formats ? NULL : &info->formats,
+				info->subformats ? NULL : &info->subformats,
 				info->maxbps ? NULL : &info->maxbps);
 		if (err < 0)
 			return err;
@@ -3759,6 +3760,7 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 			snd_hda_query_supported_pcm(codec, mout->dig_out_nid,
 						    &mout->spdif_rates,
 						    &mout->spdif_formats,
+						    NULL,
 						    &mout->spdif_maxbps);
 		}
 		mutex_lock(&codec->spdif_mutex);
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 260d3e64f658..c476b16144cb 100644
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
index 8b6b76029694..fb3f8a565485 100644
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

