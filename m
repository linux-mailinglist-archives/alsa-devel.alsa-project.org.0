Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B49B310289
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 00:40:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F3B316B3;
	Wed,  1 May 2019 00:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F3B316B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556664034;
	bh=U+GfkVa5D6pfiEWpF0bH94JZyx8mnkgyxfhE96pzXHE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=haWySOKcGUSQsLD2mjR6EnIhGJ7hX0oXnj++blnooJFtOyoHO8LszuYaGxeFQZpuY
	 Ra7sY7GyTL9v0W90M8xEBcc0TE25sLjuQKBphsOYwVD1EhOwUg04ubliAVQNw9nRo+
	 FsTdze/M3HxlU/5u7IDKffluUiwMOEE0WW7ddUYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 571A0F89722;
	Wed,  1 May 2019 00:38:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EC3CF896EC; Wed,  1 May 2019 00:38:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2828CF8065C
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 00:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2828CF8065C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 15:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="147124106"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by orsmga003.jf.intel.com with ESMTP; 30 Apr 2019 15:38:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 17:37:42 -0500
Message-Id: <20190430223744.3863-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430223744.3863-1-pierre-louis.bossart@linux.intel.com>
References: <20190430223744.3863-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org,
 Rander Wang <rander.wang@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/3] ASoC: Intel: skl_hda_dsp_generic: add DMIC
	support
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@linux.intel.com>

Add dmic dai links using naming conventions used in
previous machine drivers.

Tested on whiskylake & icelake with SOF driver. Due
to a missing topology file, the DMIC functionality
could not be tested with the Skylake driver but was
tested for non-regressions on a GeminiLake platform
without DMICs.

Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_common.c  | 22 ++++++++++++++++++--
 sound/soc/intel/boards/skl_hda_dsp_common.h  |  2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 17 ++++++++++++++-
 3 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index 3fdbf239da74..8b68f41a5b88 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -78,7 +78,6 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 		.platform_name = "0000:00:1f.3",
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
-		.init = NULL,
 		.no_pcm = 1,
 	},
 	{
@@ -90,7 +89,26 @@ struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS] = {
 		.platform_name = "0000:00:1f.3",
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
-		.init = NULL,
+		.no_pcm = 1,
+	},
+	{
+		.name = "dmic01",
+		.id = 6,
+		.cpu_dai_name = "DMIC01 Pin",
+		.codec_name = "dmic-codec",
+		.codec_dai_name = "dmic-hifi",
+		.platform_name = "0000:00:1f.3",
+		.dpcm_capture = 1,
+		.no_pcm = 1,
+	},
+	{
+		.name = "dmic16k",
+		.id = 7,
+		.cpu_dai_name = "DMIC16k Pin",
+		.codec_name = "dmic-codec",
+		.codec_dai_name = "dmic-hifi",
+		.platform_name = "0000:00:1f.3",
+		.dpcm_capture = 1,
 		.no_pcm = 1,
 	},
 };
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.h b/sound/soc/intel/boards/skl_hda_dsp_common.h
index 87c50aff56cd..daa582e513b2 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.h
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.h
@@ -15,7 +15,7 @@
 #include <sound/core.h>
 #include <sound/jack.h>
 
-#define HDA_DSP_MAX_BE_DAI_LINKS 5
+#define HDA_DSP_MAX_BE_DAI_LINKS 7
 
 struct skl_hda_hdmi_pcm {
 	struct list_head head;
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index b9a21e64ead2..e69dc36b6600 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -97,6 +97,9 @@ static struct snd_soc_card hda_soc_card = {
 };
 
 #define IDISP_DAI_COUNT		3
+#define HDAC_DAI_COUNT		2
+#define DMIC_DAI_COUNT		2
+
 /* there are two routes per iDisp output */
 #define IDISP_ROUTE_COUNT	(IDISP_DAI_COUNT * 2)
 #define IDISP_CODEC_MASK	0x4
@@ -112,8 +115,20 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 	codec_count = hweight_long(codec_mask);
 
 	if (codec_count == 1 && codec_mask & IDISP_CODEC_MASK) {
-		num_links = IDISP_DAI_COUNT;
+		num_links = IDISP_DAI_COUNT + DMIC_DAI_COUNT;
 		num_route = IDISP_ROUTE_COUNT;
+
+		/*
+		 * rearrange the dai link array and make the
+		 * dmic dai links follow idsp dai links for only
+		 * num_links of dai links need to be registered
+		 * to ASoC.
+		 */
+		for (i = 0; i < DMIC_DAI_COUNT; i++) {
+			skl_hda_be_dai_links[IDISP_DAI_COUNT + i] =
+				skl_hda_be_dai_links[IDISP_DAI_COUNT +
+					HDAC_DAI_COUNT + i];
+		}
 	} else if (codec_count == 2 && codec_mask & IDISP_CODEC_MASK) {
 		num_links = ARRAY_SIZE(skl_hda_be_dai_links);
 		num_route = ARRAY_SIZE(skl_hda_map),
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
