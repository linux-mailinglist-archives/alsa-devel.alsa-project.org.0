Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC4C7C67AB
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 10:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96AB3DED;
	Thu, 12 Oct 2023 10:40:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96AB3DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697100054;
	bh=CBr7+wMU/IkWb3QPmgjG0/U5KSwig70kzXJn27Ush5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J/1wXzws0R5qTyRo919ddRg5J2iV2iHoOpzIZU1wGTuL+su1DA/dHPvXt7guQ/EQZ
	 eRmoqLKFlJsTGRTyQRDcw26JpkZuzgr7Ctf2TndUIGuItSkPKRShS5hcVVqttYKWNc
	 35f3oH0Z2K7LBGHycE7wBkUFClmXATLMaS0R6GIo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A78DEF80588; Thu, 12 Oct 2023 10:38:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F05A8F8057B;
	Thu, 12 Oct 2023 10:38:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7A7CF80579; Thu, 12 Oct 2023 10:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8F5CF80536
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 10:35:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8F5CF80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iRcqD6ZY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697099719; x=1728635719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CBr7+wMU/IkWb3QPmgjG0/U5KSwig70kzXJn27Ush5M=;
  b=iRcqD6ZYMr3JjtYXEfOZYrSS/KoUfuK7ZjhqtneZIQDYLqQixmNs4K6n
   KJfJC0KvMTuc8fA1EbdsWEdywrdyOjUJmjcdSye9ztylWslN9piuX9S2F
   kAxLOdV31bf4a2aApKPIOG8BZE4BKNM9v5VogFRtMo4ZwWKwkYTFBGPQm
   CaRG2kc+3HH9ZNmVeL7Dv62MdD/KyoPYHDAqec4EbqCBN4ZkwG0+pbJP+
   taC0PISbhpEj3DXiyxTafAL0b09o1xQW9wzkzEmU+FtHgykue3Ho+8kDj
   NHM9NJjU7WVjj+Vvb7LVIljpOEJaAId96oTo5AMEG837X/a2KZn3GmRIM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6417220"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="6417220"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 01:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824516597"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200";
   d="scan'208";a="824516597"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga004.fm.intel.com with ESMTP; 12 Oct 2023 01:35:11 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 03/16] ASoC: Intel: avs: Improve topology parsing of
 dynamic strings
Date: Thu, 12 Oct 2023 10:35:01 +0200
Message-Id: <20231012083514.492626-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
References: <20231012083514.492626-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DL4FF4LNWIHD2HHZZBRN6E345YDGJUEH
X-Message-ID-Hash: DL4FF4LNWIHD2HHZZBRN6E345YDGJUEH
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DL4FF4LNWIHD2HHZZBRN6E345YDGJUEH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current mechanism replaces "%d" present in some routes and widget names
with SSP number. However there are also configurations which make use of
TDM number, in which case expected behavior would be to have string in
form of SSP:TDM - see implementation of avs_i2s_platform_register() in
sound/soc/intel/avs/pcm.c.

Implement custom function, which parses string and make use of it when
parsing topology. While at it make sure that we generate dynamic names
only if there is no multiple SSPs or TDMs defined.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/topology.c | 102 ++++++++++++++++++++++++++-------
 1 file changed, 80 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 45d0eb2a8e71..c74e9d622e4c 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -15,6 +15,7 @@
 #include "avs.h"
 #include "control.h"
 #include "topology.h"
+#include "utils.h"
 
 /* Get pointer to vendor array at the specified offset. */
 #define avs_tplg_vendor_array_at(array, offset) \
@@ -371,22 +372,50 @@ parse_audio_format_bitfield(struct snd_soc_component *comp, void *elem, void *ob
 	return 0;
 }
 
+static int avs_ssp_sprint(char *buf, size_t size, const char *fmt, int port, int tdm)
+{
+	char *needle = strstr(fmt, "%d");
+	int retsize;
+
+	/*
+	 * If there is %d present in fmt string it should be replaced by either
+	 * SSP or SSP:TDM, where SSP and TDM are numbers, all other formatting
+	 * will be ignored.
+	 */
+	if (needle) {
+		retsize = scnprintf(buf, min_t(size_t, size, needle - fmt + 1), "%s", fmt);
+		retsize += scnprintf(buf + retsize, size - retsize, "%d", port);
+		if (tdm)
+			retsize += scnprintf(buf + retsize, size - retsize, ":%d", tdm);
+		retsize += scnprintf(buf + retsize, size - retsize, "%s", needle + 2);
+		return retsize;
+	}
+
+	return snprintf(buf, size, "%s", fmt);
+}
+
 static int parse_link_formatted_string(struct snd_soc_component *comp, void *elem,
 				       void *object, u32 offset)
 {
 	struct snd_soc_tplg_vendor_string_elem *tuple = elem;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
 	char *val = (char *)((u8 *)object + offset);
+	int ssp_port, tdm_slot;
 
 	/*
 	 * Dynamic naming - string formats, e.g.: ssp%d - supported only for
 	 * topologies describing single device e.g.: an I2S codec on SSP0.
 	 */
-	if (hweight_long(mach->mach_params.i2s_link_mask) != 1)
+	if (!avs_mach_singular_ssp(mach))
+		return avs_parse_string_token(comp, elem, object, offset);
+
+	ssp_port = avs_mach_ssp_port(mach);
+	if (!avs_mach_singular_tdm(mach, ssp_port))
 		return avs_parse_string_token(comp, elem, object, offset);
 
-	snprintf(val, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, tuple->string,
-		 __ffs(mach->mach_params.i2s_link_mask));
+	tdm_slot = avs_mach_ssp_tdm(mach, ssp_port);
+
+	avs_ssp_sprint(val, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, tuple->string, ssp_port, tdm_slot);
 
 	return 0;
 }
@@ -813,6 +842,7 @@ static void
 assign_copier_gtw_instance(struct snd_soc_component *comp, struct avs_tplg_modcfg_ext *cfg)
 {
 	struct snd_soc_acpi_mach *mach;
+	int ssp_port, tdm_slot;
 
 	if (!guid_equal(&cfg->type, &AVS_COPIER_MOD_UUID))
 		return;
@@ -826,11 +856,22 @@ assign_copier_gtw_instance(struct snd_soc_component *comp, struct avs_tplg_modcf
 		return;
 	}
 
+	/* If topology sets value don't overwrite it */
+	if (cfg->copier.vindex.i2s.instance)
+		return;
+
 	mach = dev_get_platdata(comp->card->dev);
 
-	/* Automatic assignment only when board describes single SSP. */
-	if (hweight_long(mach->mach_params.i2s_link_mask) == 1 && !cfg->copier.vindex.i2s.instance)
-		cfg->copier.vindex.i2s.instance = __ffs(mach->mach_params.i2s_link_mask);
+	if (!avs_mach_singular_ssp(mach))
+		return;
+	ssp_port = avs_mach_ssp_port(mach);
+
+	if (!avs_mach_singular_tdm(mach, ssp_port))
+		return;
+	tdm_slot = avs_mach_ssp_tdm(mach, ssp_port);
+
+	cfg->copier.vindex.i2s.instance = ssp_port;
+	cfg->copier.vindex.i2s.time_slot = tdm_slot;
 }
 
 static int avs_tplg_parse_modcfg_ext(struct snd_soc_component *comp,
@@ -1381,20 +1422,24 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
 	size_t len = SNDRV_CTL_ELEM_ID_NAME_MAXLEN;
 	char buf[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
-	u32 port;
+	int ssp_port, tdm_slot;
 
 	/* See parse_link_formatted_string() for dynamic naming when(s). */
-	if (hweight_long(mach->mach_params.i2s_link_mask) == 1) {
-		port = __ffs(mach->mach_params.i2s_link_mask);
-
-		snprintf(buf, len, route->source, port);
-		strscpy((char *)route->source, buf, len);
-		snprintf(buf, len, route->sink, port);
-		strscpy((char *)route->sink, buf, len);
-		if (route->control) {
-			snprintf(buf, len, route->control, port);
-			strscpy((char *)route->control, buf, len);
-		}
+	if (!avs_mach_singular_ssp(mach))
+		return 0;
+	ssp_port = avs_mach_ssp_port(mach);
+
+	if (!avs_mach_singular_tdm(mach, ssp_port))
+		return 0;
+	tdm_slot = avs_mach_ssp_tdm(mach, ssp_port);
+
+	avs_ssp_sprint(buf, len, route->source, ssp_port, tdm_slot);
+	strscpy((char *)route->source, buf, len);
+	avs_ssp_sprint(buf, len, route->sink, ssp_port, tdm_slot);
+	strscpy((char *)route->sink, buf, len);
+	if (route->control) {
+		avs_ssp_sprint(buf, len, route->control, ssp_port, tdm_slot);
+		strscpy((char *)route->control, buf, len);
 	}
 
 	return 0;
@@ -1408,6 +1453,7 @@ static int avs_widget_load(struct snd_soc_component *comp, int index,
 	struct avs_tplg_path_template *template;
 	struct avs_soc_component *acomp = to_avs_soc_component(comp);
 	struct avs_tplg *tplg;
+	int ssp_port, tdm_slot;
 
 	if (!le32_to_cpu(dw->priv.size))
 		return 0;
@@ -1419,16 +1465,28 @@ static int avs_widget_load(struct snd_soc_component *comp, int index,
 
 	tplg = acomp->tplg;
 	mach = dev_get_platdata(comp->card->dev);
+	if (!avs_mach_singular_ssp(mach))
+		goto static_name;
+	ssp_port = avs_mach_ssp_port(mach);
 
 	/* See parse_link_formatted_string() for dynamic naming when(s). */
-	if (hweight_long(mach->mach_params.i2s_link_mask) == 1) {
+	if (avs_mach_singular_tdm(mach, ssp_port)) {
+		/* size is based on possible %d -> SSP:TDM, where SSP and TDM < 10 + '\0' */
+		size_t size = strlen(dw->name) + 2;
+		char *buf;
+
+		tdm_slot = avs_mach_ssp_tdm(mach, ssp_port);
+
+		buf = kmalloc(size, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+		avs_ssp_sprint(buf, size, dw->name, ssp_port, tdm_slot);
 		kfree(w->name);
 		/* w->name is freed later by soc_tplg_dapm_widget_create() */
-		w->name = kasprintf(GFP_KERNEL, dw->name, __ffs(mach->mach_params.i2s_link_mask));
-		if (!w->name)
-			return -ENOMEM;
+		w->name = buf;
 	}
 
+static_name:
 	template = avs_tplg_path_template_create(comp, tplg, dw->priv.array,
 						 le32_to_cpu(dw->priv.size));
 	if (IS_ERR(template)) {
-- 
2.34.1

