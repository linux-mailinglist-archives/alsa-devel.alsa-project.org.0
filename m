Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C75847A4AB1
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 15:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31D4B3E7;
	Mon, 18 Sep 2023 15:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31D4B3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695044540;
	bh=o9XiRR6dSRO93DjHJtbdro+OqjprUjqZDExg+SyqPlg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BIhf3oko5UDumhGTBL5UVtpWCWUFTyBELhJPqv6nYKFpT1rHGx6egVlvc/UFLH6H7
	 F0Dmgvhh1Iz927p+MESXw7Z1SxSmrODJnUqTyhM30o1yXCq51TuM3gzGOGJlepC1Ie
	 YRZdZJs3XJyiWhSHKk1IZ1qOIhqZTAPnfSCvgF6Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CC6DF805AA; Mon, 18 Sep 2023 15:40:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39408F80588;
	Mon, 18 Sep 2023 15:40:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C498F8059F; Mon, 18 Sep 2023 15:40:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2586AF8025A
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 15:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2586AF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lL3axf+C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695044413; x=1726580413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=o9XiRR6dSRO93DjHJtbdro+OqjprUjqZDExg+SyqPlg=;
  b=lL3axf+CtJ1Ra9rlBha1PFqxr0RfbCe/IFpQHBuCpSTnTfrda1zNl7mN
   zZUA0jkJr6PnitVCnpYDujGyLMe+g/f4n27Y7OY8saHUOFwEpgTC4IHyM
   IAv3MyyPnGFUOO8gcDZAQPNrr62rKhYSlACUdlSjjVQmCkNI7uohtoNow
   D7q73Fs7z/uMeqxNDjEXr8E2SWRKHOMX+pR/yD3QIU3ANvcm4fMwjIzDU
   t4atu5rc91rFpzsYf1GKRygHW9liNxP2N4CCOqF9Fn9Kgj3fSDL30IHOU
   r66LuxfUmwud333yqMHvnWGnHbriVS6IY0CYnNasBetq4z1HaA812wlyQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="466003766"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="466003766"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:40:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="745825867"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="745825867"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by orsmga002.jf.intel.com with ESMTP; 18 Sep 2023 06:40:08 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 03/17] ALSA: hda: Honor subformat when querying PCMs
Date: Mon, 18 Sep 2023 15:39:26 +0200
Message-Id: <20230918133940.3676091-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230918133940.3676091-1-cezary.rojewski@intel.com>
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YRFLFU57DBBQP5B3325YFXGRQ5R5RWMW
X-Message-ID-Hash: YRFLFU57DBBQP5B3325YFXGRQ5R5RWMW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRFLFU57DBBQP5B3325YFXGRQ5R5RWMW/>
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
 include/sound/hda_codec.h    |  5 ++--
 include/sound/hdaudio.h      |  4 ++-
 sound/hda/hdac_device.c      | 52 ++++++++++++++++++++++--------------
 sound/pci/hda/hda_codec.c    |  5 ++++
 sound/pci/hda/patch_hdmi.c   |  1 +
 sound/soc/codecs/hdac_hdmi.c |  3 ++-
 6 files changed, 46 insertions(+), 24 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 5497dc9c396a..6db063d5a7fe 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -141,6 +141,7 @@ struct hda_pcm_stream {
 	hda_nid_t nid;	/* default NID to query rates/formats/bps, or set up */
 	u32 rates;	/* supported rates */
 	u64 formats;	/* supported formats (SNDRV_PCM_FMTBIT_) */
+	const struct snd_pcm_subformat *subformats;
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
index 32c59053b48e..a2f10f7785bb 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -146,7 +146,9 @@ unsigned int snd_hdac_calc_stream_format(unsigned int rate,
 					 unsigned int maxbps,
 					 unsigned short spdif_ctls);
 int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
-				u32 *ratesp, u64 *formatsp, unsigned int *bpsp);
+				 u32 *ratesp, u64 *formatsp,
+				 const struct snd_pcm_subformat **subformatsp,
+				 unsigned int *bpsp);
 bool snd_hdac_is_supported_format(struct hdac_device *codec, hda_nid_t nid,
 				  unsigned int format);
 
diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index bbf7bcdb449a..a2ce4ea809b3 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -817,15 +817,18 @@ static unsigned int query_stream_param(struct hdac_device *codec, hda_nid_t nid)
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
+				 u32 *ratesp, u64 *formatsp,
+				 const struct snd_pcm_subformat **subformatsp,
+				 unsigned int *bpsp)
 {
 	unsigned int i, val, wcaps;
 
@@ -848,9 +851,13 @@ int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
 		*ratesp = rates;
 	}
 
-	if (formatsp || bpsp) {
-		u64 formats = 0;
+	if (formatsp || subformatsp || bpsp) {
+		struct snd_pcm_subformat subformats[] = {
+			{ .format = SNDRV_PCM_FORMAT_S32_LE, },
+			{}
+		};
 		unsigned int streams, bps;
+		u64 formats = 0;
 
 		streams = query_stream_param(codec, nid);
 		if (!streams)
@@ -866,24 +873,24 @@ int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
 				formats |= SNDRV_PCM_FMTBIT_S16_LE;
 				bps = 16;
 			}
-			if (wcaps & AC_WCAP_DIGITAL) {
-				if (val & AC_SUPPCM_BITS_32)
+			if (val & AC_SUPPCM_BITS_20) {
+				formats |= SNDRV_PCM_FMTBIT_S32_LE;
+				subformats[0].mask |= SNDRV_PCM_SUBFMTBIT_MSBITS_20;
+				bps = 20;
+			}
+			if (val & AC_SUPPCM_BITS_24) {
+				formats |= SNDRV_PCM_FMTBIT_S32_LE;
+				subformats[0].mask |= SNDRV_PCM_SUBFMTBIT_MSBITS_24;
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
+					subformats[0].mask |= SNDRV_PCM_SUBFMTBIT_MSBITS_MAX;
 					bps = 32;
-				else if (val & AC_SUPPCM_BITS_24)
-					bps = 24;
-				else if (val & AC_SUPPCM_BITS_20)
-					bps = 20;
+				}
 			}
 		}
 #if 0 /* FIXME: CS4206 doesn't work, which is the only codec supporting float */
@@ -911,6 +918,11 @@ int snd_hdac_query_supported_pcm(struct hdac_device *codec, hda_nid_t nid,
 		}
 		if (formatsp)
 			*formatsp = formats;
+		if (subformatsp) {
+			*subformatsp = kmemdup(subformats, sizeof(subformats), GFP_KERNEL);
+			if (!*subformatsp)
+				return -ENOMEM;
+		}
 		if (bpsp)
 			*bpsp = bps;
 	}
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 33af707a65ab..8cd2db528bbd 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -755,12 +755,15 @@ void snd_hda_codec_disconnect_pcms(struct hda_codec *codec)
 static void codec_release_pcms(struct hda_codec *codec)
 {
 	struct hda_pcm *pcm, *n;
+	int dir;
 
 	list_for_each_entry_safe(pcm, n, &codec->pcm_list_head, list) {
 		list_del(&pcm->list);
 		if (pcm->pcm)
 			snd_device_free(pcm->codec->card, pcm->pcm);
 		clear_bit(pcm->device, pcm->codec->bus->pcm_dev_bits);
+		for_each_pcm_streams(dir)
+			kfree(pcm->stream[dir].subformats);
 		kfree(pcm->name);
 		kfree(pcm);
 	}
@@ -3163,6 +3166,7 @@ static int set_pcm_default_values(struct hda_codec *codec,
 		err = snd_hda_query_supported_pcm(codec, info->nid,
 				info->rates ? NULL : &info->rates,
 				info->formats ? NULL : &info->formats,
+				info->subformats ? NULL : &info->subformats,
 				info->maxbps ? NULL : &info->maxbps);
 		if (err < 0)
 			return err;
@@ -3757,6 +3761,7 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
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

