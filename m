Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 744D477954D
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 18:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 814D082C;
	Fri, 11 Aug 2023 18:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 814D082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691772854;
	bh=pMuHtRDVFGWhA3z2lv+JiX5oTpQ33VExjy6vFl/q3MU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sg0kJ5lOWIf5hfTwRLTrYP7m+AAHa5li3KOba/daryn4HnD8CavTFjhNXUYE4Cxmv
	 pioFKDjoXlYXil8WAve/qfkHIkO39bTyRfKNkkeuKYCqqxk0V5BbmT6gXNXuWQZr50
	 ZFpaJTHsnm/MjLyI6wanVp2vKjoNtXcs6sW84k00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2D1FF80611; Fri, 11 Aug 2023 18:50:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E93DCF80602;
	Fri, 11 Aug 2023 18:50:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48BA1F805D7; Fri, 11 Aug 2023 18:49:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02705F805BA
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 18:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02705F805BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bCj4Itli
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691772591; x=1723308591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pMuHtRDVFGWhA3z2lv+JiX5oTpQ33VExjy6vFl/q3MU=;
  b=bCj4ItliACJYNzg1WRpsjeHOrsC/IYEuMeqAWMaUFS3xV0/HLPs4tyWH
   SS7k3d16ZmjdUfXGkQjCDrrFuEdqNIRS2HQdVgpU1FRLi74mj99MUyNJQ
   /NtomtHJXjrAwl1WU4kH93fyb8R0C7/LSmTxDOacUYbDqjAmQA4sdA7i7
   EhZ2It5HWAxq1R7cB9FjjiHKSCNfwWjouCPjFDnGq2GjMG00p4me0r1/1
   YBPperVCEy+pkTYysH3R6GCmHMdXKfCf9E6Kn+huIrynEBi1ntNj/V3KM
   Mpb87rZ3ZFmSuEG5noUyyow8sqvdq6Ix+U4bH9zhn0Vc0bc/4ujMGWcij
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371725177"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="371725177"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 09:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="846842880"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="846842880"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2023 09:49:43 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC PATCH 16/17] ASoC: Intel: avs: Unhardcode HDAudio BE DAI drivers
 description
Date: Fri, 11 Aug 2023 18:48:52 +0200
Message-Id: <20230811164853.1797547-17-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811164853.1797547-1-cezary.rojewski@intel.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L7ZKO4NW5AVZTVENW42NRELEHPDJIMGR
X-Message-ID-Hash: L7ZKO4NW5AVZTVENW42NRELEHPDJIMGR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L7ZKO4NW5AVZTVENW42NRELEHPDJIMGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To not expose more than in fact is supported by the codec, update CPU
DAI initialization procedure to rely on codec capabilities instead of
hardcoding them. This includes subformat which is currently ignored.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index fa9d3292fe82..31737133b991 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1413,27 +1413,6 @@ int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned l
 	return avs_soc_component_register(adev->dev, name, &avs_component_driver, cpus, cpu_count);
 }
 
-/* HD-Audio CPU DAI template */
-static const struct snd_soc_dai_driver hda_cpu_dai = {
-	.ops = &avs_dai_hda_be_ops,
-	.playback = {
-		.channels_min	= 1,
-		.channels_max	= 8,
-		.rates		= SNDRV_PCM_RATE_8000_192000,
-		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
-				  SNDRV_PCM_FMTBIT_S32_LE,
-	},
-	.capture = {
-		.channels_min	= 1,
-		.channels_max	= 8,
-		.rates		= SNDRV_PCM_RATE_8000_192000,
-		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
-				  SNDRV_PCM_FMTBIT_S24_LE |
-				  SNDRV_PCM_FMTBIT_S32_LE,
-	},
-};
-
 static void avs_component_hda_unregister_dais(struct snd_soc_component *component)
 {
 	struct snd_soc_acpi_mach *mach;
@@ -1490,8 +1469,8 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 	for (i = 0; i < pcm_count; i++, pcm = list_next_entry(pcm, list)) {
 		struct snd_soc_dai *dai;
 
-		memcpy(&dais[i], &hda_cpu_dai, sizeof(*dais));
 		dais[i].id = i;
+		dais[i].ops = &avs_dai_hda_be_ops;
 		dais[i].name = devm_kasprintf(component->dev, GFP_KERNEL,
 					      "%s-cpu%d", cname, i);
 		if (!dais[i].name) {
@@ -1507,6 +1486,13 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 				ret = -ENOMEM;
 				goto exit;
 			}
+
+			dais[i].playback.formats = pcm->stream[0].formats;
+			dais[i].playback.subformats = pcm->stream[0].subformats;
+			dais[i].playback.rates = pcm->stream[0].rates;
+			dais[i].playback.channels_min = pcm->stream[0].channels_min;
+			dais[i].playback.channels_max = pcm->stream[0].channels_max;
+			dais[i].playback.sig_bits = pcm->stream[0].maxbps;
 		}
 
 		if (pcm->stream[1].substreams) {
@@ -1517,6 +1503,13 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 				ret = -ENOMEM;
 				goto exit;
 			}
+
+			dais[i].capture.formats = pcm->stream[1].formats;
+			dais[i].capture.subformats = pcm->stream[1].subformats;
+			dais[i].capture.rates = pcm->stream[1].rates;
+			dais[i].capture.channels_min = pcm->stream[1].channels_min;
+			dais[i].capture.channels_max = pcm->stream[1].channels_max;
+			dais[i].capture.sig_bits = pcm->stream[1].maxbps;
 		}
 
 		dai = snd_soc_register_dai(component, &dais[i], false);
-- 
2.25.1

