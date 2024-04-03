Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46824896A46
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 11:16:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EB962C5E;
	Wed,  3 Apr 2024 11:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EB962C5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712135765;
	bh=68Ebllns87Qtj6T741kWqjemPHFqRDgQfjhIbBcWx+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fwV2vYwga0PtP8fadQ8e8OTEpOUWHfqoXvc7qWU2sXW7yZCab9+Wq5VnnAqlTi/IX
	 fkLm6WIiL4bAZz/NBGprLeRPmywifBAOvy8764iddxdP5rsbsSobLhhIGy8gbjFHZr
	 VSs6lK48HlMdhHOH6Wse5vOl+/0hYmGrN2xFFfm0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C5A7F805C9; Wed,  3 Apr 2024 11:15:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 776D0F805CB;
	Wed,  3 Apr 2024 11:15:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A4CAF80238; Wed,  3 Apr 2024 11:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81C80F8020D
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 11:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C80F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T9LJPwpU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712135700; x=1743671700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=68Ebllns87Qtj6T741kWqjemPHFqRDgQfjhIbBcWx+k=;
  b=T9LJPwpUcFs9fbWTkR5Q0XZMwlkN66oAS7sdY42b6s/o/qA7teHQYDzd
   JPQ7ezeLojr17/o4ehl1DT8ulr7TP3sW65anmKKD/LN6We1j7rsQxzmXx
   n1vQ4iXDusRWIbaK80rS9wmCn0PBBgVCkq0fRcYo1+ii/F64B6UaWdA3r
   na66C71ZZPQERbZmcokX/TIRPgdjy1dX/IlajAL8qXkyiicUG/D3PH4Fd
   6reRWKc/oCBHCeydrmAZXZ6BAiXScnECkMF2/7uDRVVhuGtXPKIJFMiN+
   396Kufae55MTeTv8SlPPIydp52DTVdoVpwf4VzYimkFCsKe7vNcdGjkkO
   g==;
X-CSE-ConnectionGUID: kz3D9ZXmQp+sQTbhXLwYPg==
X-CSE-MsgGUID: 60V7q3C7Q8mj8i4fZ58hiA==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="10322557"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="10322557"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 02:14:58 -0700
X-CSE-ConnectionGUID: eQ90Fz6TQV+raAy9sMq6WQ==
X-CSE-MsgGUID: SxMmx1MCQd+b3UfP1LJWBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18410506"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 03 Apr 2024 02:14:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	cujomalainey@chromium.org,
	lmajczak@google.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 2/4] ASoC: topology: Remove ABI v4 support
Date: Wed,  3 Apr 2024 11:16:27 +0200
Message-Id: <20240403091629.647267-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240403091629.647267-1-cezary.rojewski@intel.com>
References: <20240403091629.647267-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E5KERZGJTCE5X44F7NFE5UXUMJKN3CWC
X-Message-ID-Hash: E5KERZGJTCE5X44F7NFE5UXUMJKN3CWC
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5KERZGJTCE5X44F7NFE5UXUMJKN3CWC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There are no users of soc-topology ABI v4 since kernel v5.4 so remove
all v4 -> v5 converters.

Cc: Curtis Malainey <cujomalainey@chromium.org>
Cc: Łukasz Majczak <lmajczak@google.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/soc-topology.c | 210 +++------------------------------------
 1 file changed, 16 insertions(+), 194 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index fad9432a10f1..e73dc4e786ff 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -1768,75 +1768,6 @@ static int soc_tplg_pcm_create(struct soc_tplg *tplg,
 	return  soc_tplg_fe_link_create(tplg, pcm);
 }
 
-/* copy stream caps from the old version 4 of source */
-static void stream_caps_new_ver(struct snd_soc_tplg_stream_caps *dest,
-				struct snd_soc_tplg_stream_caps_v4 *src)
-{
-	dest->size = cpu_to_le32(sizeof(*dest));
-	memcpy(dest->name, src->name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
-	dest->formats = src->formats;
-	dest->rates = src->rates;
-	dest->rate_min = src->rate_min;
-	dest->rate_max = src->rate_max;
-	dest->channels_min = src->channels_min;
-	dest->channels_max = src->channels_max;
-	dest->periods_min = src->periods_min;
-	dest->periods_max = src->periods_max;
-	dest->period_size_min = src->period_size_min;
-	dest->period_size_max = src->period_size_max;
-	dest->buffer_size_min = src->buffer_size_min;
-	dest->buffer_size_max = src->buffer_size_max;
-}
-
-/**
- * pcm_new_ver - Create the new version of PCM from the old version.
- * @tplg: topology context
- * @src: older version of pcm as a source
- * @pcm: latest version of pcm created from the source
- *
- * Support from version 4. User should free the returned pcm manually.
- */
-static int pcm_new_ver(struct soc_tplg *tplg,
-		       struct snd_soc_tplg_pcm *src,
-		       struct snd_soc_tplg_pcm **pcm)
-{
-	struct snd_soc_tplg_pcm *dest;
-	struct snd_soc_tplg_pcm_v4 *src_v4;
-	int i;
-
-	*pcm = NULL;
-
-	if (le32_to_cpu(src->size) != sizeof(*src_v4)) {
-		dev_err(tplg->dev, "ASoC: invalid PCM size\n");
-		return -EINVAL;
-	}
-
-	dev_warn(tplg->dev, "ASoC: old version of PCM\n");
-	src_v4 = (struct snd_soc_tplg_pcm_v4 *)src;
-	dest = kzalloc(sizeof(*dest), GFP_KERNEL);
-	if (!dest)
-		return -ENOMEM;
-
-	dest->size = cpu_to_le32(sizeof(*dest)); /* size of latest abi version */
-	memcpy(dest->pcm_name, src_v4->pcm_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
-	memcpy(dest->dai_name, src_v4->dai_name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN);
-	dest->pcm_id = src_v4->pcm_id;
-	dest->dai_id = src_v4->dai_id;
-	dest->playback = src_v4->playback;
-	dest->capture = src_v4->capture;
-	dest->compress = src_v4->compress;
-	dest->num_streams = src_v4->num_streams;
-	for (i = 0; i < le32_to_cpu(dest->num_streams); i++)
-		memcpy(&dest->stream[i], &src_v4->stream[i],
-		       sizeof(struct snd_soc_tplg_stream));
-
-	for (i = 0; i < 2; i++)
-		stream_caps_new_ver(&dest->caps[i], &src_v4->caps[i]);
-
-	*pcm = dest;
-	return 0;
-}
-
 static int soc_tplg_pcm_elems_load(struct soc_tplg *tplg,
 	struct snd_soc_tplg_hdr *hdr)
 {
@@ -1852,8 +1783,7 @@ static int soc_tplg_pcm_elems_load(struct soc_tplg *tplg,
 	/* check the element size and count */
 	pcm = (struct snd_soc_tplg_pcm *)tplg->pos;
 	size = le32_to_cpu(pcm->size);
-	if (size > sizeof(struct snd_soc_tplg_pcm)
-		|| size < sizeof(struct snd_soc_tplg_pcm_v4)) {
+	if (size > sizeof(struct snd_soc_tplg_pcm)) {
 		dev_err(tplg->dev, "ASoC: invalid size %d for PCM elems\n",
 			size);
 		return -EINVAL;
@@ -1872,15 +1802,11 @@ static int soc_tplg_pcm_elems_load(struct soc_tplg *tplg,
 		/* check ABI version by size, create a new version of pcm
 		 * if abi not match.
 		 */
-		if (size == sizeof(*pcm)) {
-			abi_match = true;
-			_pcm = pcm;
-		} else {
-			abi_match = false;
-			ret = pcm_new_ver(tplg, pcm, &_pcm);
-			if (ret < 0)
-				return ret;
-		}
+		if (size != sizeof(*pcm))
+			return -EINVAL;
+
+		abi_match = true;
+		_pcm = pcm;
 
 		/* create the FE DAIs and DAI links */
 		ret = soc_tplg_pcm_create(tplg, _pcm);
@@ -1972,49 +1898,6 @@ static void set_link_hw_format(struct snd_soc_dai_link *link,
 	}
 }
 
-/**
- * link_new_ver - Create a new physical link config from the old
- * version of source.
- * @tplg: topology context
- * @src: old version of phyical link config as a source
- * @link: latest version of physical link config created from the source
- *
- * Support from version 4. User need free the returned link config manually.
- */
-static int link_new_ver(struct soc_tplg *tplg,
-			struct snd_soc_tplg_link_config *src,
-			struct snd_soc_tplg_link_config **link)
-{
-	struct snd_soc_tplg_link_config *dest;
-	struct snd_soc_tplg_link_config_v4 *src_v4;
-	int i;
-
-	*link = NULL;
-
-	if (le32_to_cpu(src->size) !=
-	    sizeof(struct snd_soc_tplg_link_config_v4)) {
-		dev_err(tplg->dev, "ASoC: invalid physical link config size\n");
-		return -EINVAL;
-	}
-
-	dev_warn(tplg->dev, "ASoC: old version of physical link config\n");
-
-	src_v4 = (struct snd_soc_tplg_link_config_v4 *)src;
-	dest = kzalloc(sizeof(*dest), GFP_KERNEL);
-	if (!dest)
-		return -ENOMEM;
-
-	dest->size = cpu_to_le32(sizeof(*dest));
-	dest->id = src_v4->id;
-	dest->num_streams = src_v4->num_streams;
-	for (i = 0; i < le32_to_cpu(dest->num_streams); i++)
-		memcpy(&dest->stream[i], &src_v4->stream[i],
-		       sizeof(struct snd_soc_tplg_stream));
-
-	*link = dest;
-	return 0;
-}
-
 /**
  * snd_soc_find_dai_link - Find a DAI link
  *
@@ -2131,8 +2014,7 @@ static int soc_tplg_link_elems_load(struct soc_tplg *tplg,
 	/* check the element size and count */
 	link = (struct snd_soc_tplg_link_config *)tplg->pos;
 	size = le32_to_cpu(link->size);
-	if (size > sizeof(struct snd_soc_tplg_link_config)
-		|| size < sizeof(struct snd_soc_tplg_link_config_v4)) {
+	if (size > sizeof(struct snd_soc_tplg_link_config)) {
 		dev_err(tplg->dev, "ASoC: invalid size %d for physical link elems\n",
 			size);
 		return -EINVAL;
@@ -2147,15 +2029,11 @@ static int soc_tplg_link_elems_load(struct soc_tplg *tplg,
 	for (i = 0; i < count; i++) {
 		link = (struct snd_soc_tplg_link_config *)tplg->pos;
 		size = le32_to_cpu(link->size);
-		if (size == sizeof(*link)) {
-			abi_match = true;
-			_link = link;
-		} else {
-			abi_match = false;
-			ret = link_new_ver(tplg, link, &_link);
-			if (ret < 0)
-				return ret;
-		}
+		if (size != sizeof(*link))
+			return -EINVAL;
+
+		abi_match = true;
+		_link = link;
 
 		ret = soc_tplg_link_config(tplg, _link);
 		if (ret < 0) {
@@ -2280,57 +2158,6 @@ static int soc_tplg_dai_elems_load(struct soc_tplg *tplg,
 	return 0;
 }
 
-/**
- * manifest_new_ver - Create a new version of manifest from the old version
- * of source.
- * @tplg: topology context
- * @src: old version of manifest as a source
- * @manifest: latest version of manifest created from the source
- *
- * Support from version 4. Users need free the returned manifest manually.
- */
-static int manifest_new_ver(struct soc_tplg *tplg,
-			    struct snd_soc_tplg_manifest *src,
-			    struct snd_soc_tplg_manifest **manifest)
-{
-	struct snd_soc_tplg_manifest *dest;
-	struct snd_soc_tplg_manifest_v4 *src_v4;
-	int size;
-
-	*manifest = NULL;
-
-	size = le32_to_cpu(src->size);
-	if (size != sizeof(*src_v4)) {
-		dev_warn(tplg->dev, "ASoC: invalid manifest size %d\n",
-			 size);
-		if (size)
-			return -EINVAL;
-		src->size = cpu_to_le32(sizeof(*src_v4));
-	}
-
-	dev_warn(tplg->dev, "ASoC: old version of manifest\n");
-
-	src_v4 = (struct snd_soc_tplg_manifest_v4 *)src;
-	dest = kzalloc(sizeof(*dest) + le32_to_cpu(src_v4->priv.size),
-		       GFP_KERNEL);
-	if (!dest)
-		return -ENOMEM;
-
-	dest->size = cpu_to_le32(sizeof(*dest)); /* size of latest abi version */
-	dest->control_elems = src_v4->control_elems;
-	dest->widget_elems = src_v4->widget_elems;
-	dest->graph_elems = src_v4->graph_elems;
-	dest->pcm_elems = src_v4->pcm_elems;
-	dest->dai_link_elems = src_v4->dai_link_elems;
-	dest->priv.size = src_v4->priv.size;
-	if (dest->priv.size)
-		memcpy(dest->priv.data, src_v4->priv.data,
-		       le32_to_cpu(src_v4->priv.size));
-
-	*manifest = dest;
-	return 0;
-}
-
 static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 				  struct snd_soc_tplg_hdr *hdr)
 {
@@ -2341,16 +2168,11 @@ static int soc_tplg_manifest_load(struct soc_tplg *tplg,
 	manifest = (struct snd_soc_tplg_manifest *)tplg->pos;
 
 	/* check ABI version by size, create a new manifest if abi not match */
-	if (le32_to_cpu(manifest->size) == sizeof(*manifest)) {
-		abi_match = true;
-		_manifest = manifest;
-	} else {
-		abi_match = false;
+	if (le32_to_cpu(manifest->size) != sizeof(*manifest))
+		return -EINVAL;
 
-		ret = manifest_new_ver(tplg, manifest, &_manifest);
-		if (ret < 0)
-			return ret;
-	}
+	abi_match = true;
+	_manifest = manifest;
 
 	/* pass control to component driver for optional further init */
 	if (tplg->ops && tplg->ops->manifest)
-- 
2.25.1

