Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 194548C130F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:36:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78F4DAE8;
	Thu,  9 May 2024 18:36:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78F4DAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272581;
	bh=Ih4hPWHUQ0BVIZi3ZlyMjC6ui+8DfUNPiSSGL7Ht/qc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=auohyicxTz+t6l8KzWg4NlHyA18KV2oOHQkDEXOis7KVu8Qa/8jjrV2VrvMl7qlWJ
	 irn7NfgH/fkz8aSr6sUhgAgiVaQUQXgTR616gmG8UZ5+TeQdYNXsJAJAm4Cpv/EPtK
	 04N9Wzm8MLpSF/L7MfWvB/pPIOSWy5mwoDxfbZEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B600F80621; Thu,  9 May 2024 18:35:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 122CCF80618;
	Thu,  9 May 2024 18:35:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EF5DF8049C; Thu,  9 May 2024 18:34:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53F61F8049C
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53F61F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mxyv28XO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272475; x=1746808475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ih4hPWHUQ0BVIZi3ZlyMjC6ui+8DfUNPiSSGL7Ht/qc=;
  b=mxyv28XO5BSqoYpf41KcIMYMa8/YPRC91emp8RUS1OvNCPCsu+weIAf4
   mrg7weVZs4GiS8E7z9rDYnANPHlUhpZ77iYPT1n12ZixGG6fahTz+akuT
   TI5BODMEKii8W+2z9e1xTb8UcrVjiGBP/9ZKgaEXzOVCGGI9vmkp27XjD
   oKK7xBRTRnhWzNcfyiYNkRUy/k5RwMhpDgkjKo2yIq6csVRfBRCYOYkvY
   pjb+rYF54StyzU5UE15PhzYtqo1DO84d+XnXbWvqpLCea3FxbhmD9N/p+
   oXZyKEVjJmTgcr/RgxGMfYq9AgrQFEIdXUp9zksRyzQeu7N6KH6ITwmIi
   g==;
X-CSE-ConnectionGUID: d3THpEMSSJCfp+Mm3sU9Uw==
X-CSE-MsgGUID: 3V2WhO0xTZ61wZ08FDvSBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017511"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017511"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:26 -0700
X-CSE-ConnectionGUID: 5PMwLs5nSZuWjhHWQtbj/g==
X-CSE-MsgGUID: EvuCzSuRTz6DYN2fal+saA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33760970"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/18] ASoC: Intel: sof_sdw_rt_sdca_jack_common: remove -sdca
 for new codecs
Date: Thu,  9 May 2024 11:34:01 -0500
Message-Id: <20240509163418.67746-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7KL3J5H23LT2MNDPIIFDTOAB5BTZNKMV
X-Message-ID-Hash: 7KL3J5H23LT2MNDPIIFDTOAB5BTZNKMV
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7KL3J5H23LT2MNDPIIFDTOAB5BTZNKMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Realtek new SoundWire codecs are all -sdca version. No need to add
-sdca to distinguish the non-sdca version. To be consistent with "spk:"
and "mic:" components string, remove "-sdca" suffix from "hs:"
components string.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../boards/sof_sdw_rt_sdca_jack_common.c      | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 85c09513bc35..69161ea5b290 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -88,6 +88,15 @@ static const char * const jack_codecs[] = {
 	"rt711", "rt712", "rt713", "rt722"
 };
 
+/*
+ * The sdca suffix is required for rt711 since there are two generations of the same chip.
+ * RT713 is an SDCA device but the sdca suffix is required for backwards-compatibility with
+ * previous UCM definitions.
+ */
+static const char * const need_sdca_suffix[] = {
+	"rt711", "rt713"
+};
+
 int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -96,6 +105,7 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
 	int ret;
+	int i;
 
 	codec_dai = get_codec_dai_by_name(rtd, jack_codecs, ARRAY_SIZE(jack_codecs));
 	if (!codec_dai)
@@ -103,11 +113,22 @@ int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	component = codec_dai->component;
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s hs:%s-sdca",
+					  "%s hs:%s",
 					  card->components, component->name_prefix);
 	if (!card->components)
 		return -ENOMEM;
 
+	for (i = 0; i < ARRAY_SIZE(need_sdca_suffix); i++) {
+		if (strstr(codec_dai->name, need_sdca_suffix[i])) {
+			/* Add -sdca suffix for existing UCMs */
+			card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+							  "%s-sdca", card->components);
+			if (!card->components)
+				return -ENOMEM;
+			break;
+		}
+	}
+
 	ret = snd_soc_add_card_controls(card, rt_sdca_jack_controls,
 					ARRAY_SIZE(rt_sdca_jack_controls));
 	if (ret) {
-- 
2.40.1

