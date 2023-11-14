Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA387EB79F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 21:16:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D59AAEA2;
	Tue, 14 Nov 2023 21:15:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D59AAEA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699993009;
	bh=KwkY+eHQWpCiDJcXbY37JYsxoT88TaZ3QkaLCgM9rzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iLya8D2GOgC4euAjYDtICdWhMtits+q2Qos9uevbMIlMyFk7aIl3/hltoo7A4soch
	 zHqW6GhODEEHcFPbqsQvYob5YFxQ3MXH1UrvDbe3gH7uMkrXQOXmDJOkCnalGrYsjW
	 4yCCOjK2GsCTddSK7tIrHWXqNJa9mTfVAYdHArk4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48ACFF805AD; Tue, 14 Nov 2023 21:12:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99391F805AD;
	Tue, 14 Nov 2023 21:12:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FCD3F80564; Tue, 14 Nov 2023 21:12:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0CA9F8016E
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 21:11:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0CA9F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LHn7M58+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992685; x=1731528685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KwkY+eHQWpCiDJcXbY37JYsxoT88TaZ3QkaLCgM9rzI=;
  b=LHn7M58+aX2TgjZdPzM+nbGAr5C5sy9Z1aMkUFcBTQoMetNXD8yEePJf
   GZnW6/7muCys9L2mTTuY52f2NaC1zWaL1T7NvT2dw+JZv+PoyqyvwD30y
   77ahfzitW1WbYmsllVl7uFj+GWa4IA9hY748eUZG3wu59dh+jtvQp793/
   7HM+kdWzfBqwLFWMQsIhNsW2SKxC+EDWxipoZlteVYvCkom/02ZNmnUbV
   zVlj3p5ZZA+5bJlgjxtSu4lkodD6463zQdmQJYWTbSUI/PCdelQHybYPx
   ELlLwDNQlYqvpIADE4ySeddXOZKLjwhA4qu1oyxWALk85h3x5GngzM12N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134634"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="381134634"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 12:11:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422392"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="855422392"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:19 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 02/16] ALSA: hda: Honor subformat when querying PCMs
Date: Tue, 14 Nov 2023 21:13:03 +0100
Message-Id: <20231114201317.1348066-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231114201317.1348066-1-cezary.rojewski@intel.com>
References: <20231114201317.1348066-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CFJCQPTININIULJPG6C5QBIAA5H6OS7Z
X-Message-ID-Hash: CFJCQPTININIULJPG6C5QBIAA5H6OS7Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFJCQPTININIULJPG6C5QBIAA5H6OS7Z/>
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

