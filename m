Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6B98D0E4C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F286DEC;
	Mon, 27 May 2024 21:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F286DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838799;
	bh=U3Rbt/6smxjRheL/77eROvvMmUYTv45AaEcSrIsRTY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aD7GemT0ScTR2t+2CRiNxgopPn2n3dmZXHDn+rXjuHm9wNACN3ndIXK/WcF0PnvKg
	 F8p17g/EP7j6c+lK54X5nMuCFgDX3XdlzS48Qjgqsnmb8BAAoR5QxdeHn7hgdnJdXy
	 4D4zjFRIaOVG1g8svFCp7e7rg6FQVO6QMDvs71Nw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 048F6F80769; Mon, 27 May 2024 21:37:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AB73F80750;
	Mon, 27 May 2024 21:37:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BCFDF80746; Mon, 27 May 2024 21:37:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B4D6F805AA
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B4D6F805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A8DCBEll
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838586; x=1748374586;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=U3Rbt/6smxjRheL/77eROvvMmUYTv45AaEcSrIsRTY0=;
  b=A8DCBElljfJnjeSDM9xTZ2uyj1iviBi2Ws68GKgHsN1iDyuRrTNteEwd
   IfzRPLcmVA7Cpy68IDjKP3GZ5Ze0BRIor0/T6NCdFrSKfxHN647Zefe/g
   smDCRBCkYkVeZqzeoWGyojCzS75hcKMTVn00auN/IBN1K8f6H0T8KwFOQ
   VLSBg5HtY6TQHCZYq3BPrDbPcrrXGqo/TSR5Ihp8j1JIvqRp9f7tOvXxb
   oBWgW0eO7Tl4Zx5VM5uISLmyen0RInYL/hFzXIDzXXdezfvfLbGVTdVRT
   yH7pgbXAQf+lvP1G/I2Z7mP4J3w4O2h1tiut8r2aLvjtlwh8IzwfVPG0X
   g==;
X-CSE-ConnectionGUID: trahBHSbRgSbvr7OsFvCwQ==
X-CSE-MsgGUID: U2imboXZTaiHjWEo8F6Edw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339396"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339396"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:22 -0700
X-CSE-ConnectionGUID: irAPE2IESt+QlpW+NtAvog==
X-CSE-MsgGUID: BMzUnfFcTmmCq2zlcx5/Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029794"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 16/18] ASoC: Intel: maxim-common: rewrite max_98373_hw_params
 function
Date: Mon, 27 May 2024 14:35:50 -0500
Message-ID: <20240527193552.165567-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y7CRQRDTHD4U5JCWB6KEUNLQIYQKDHDK
X-Message-ID-Hash: Y7CRQRDTHD4U5JCWB6KEUNLQIYQKDHDK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y7CRQRDTHD4U5JCWB6KEUNLQIYQKDHDK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Rewrite max_98373_hw_params() function to get tdm slot number from
topology in runtime because earlier platforms use 4-slot setting
instead of 8. Also check if the interface is configured in TDM mode
before calling snd_soc_dai_set_tdm_slot() function.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 84 +++++++++++++++++++----
 1 file changed, 72 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 6c40ecc04723..f965b172fa36 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -9,6 +9,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
+#include <sound/sof.h>
 #include <uapi/sound/asound.h>
 #include "../common/soc-intel-quirks.h"
 #include "sof_maxim_common.h"
@@ -72,26 +73,85 @@ static struct snd_soc_dai_link_component max_98373_components[] = {
 	},
 };
 
+/*
+ * According to the definition of 'DAI Sel Mux' mixer in max98373.c, rx mask
+ * should choose two channels from TDM slots, the LSB of rx mask is left channel
+ * and the other one is right channel.
+ *
+ * For tx mask, each codec requires two channels: one for V-sense and the other
+ * one for I-sense. Must match the device property "maxim,vmon-slot-no" and
+ * "maxim,imon-slot-no" in ACPI table.
+ */
+static const struct {
+	unsigned int tx;
+	unsigned int rx;
+} max_98373_tdm_mask[] = {
+	{.tx = 0x03, .rx = 0x3},
+	{.tx = 0x0c, .rx = 0x3},
+};
+
 static int max_98373_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *codec_dai;
+	int i;
+	int tdm_slots;
 	int ret = 0;
-	int j;
 
-	for_each_rtd_codec_dais(rtd, j, codec_dai) {
-		if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) {
-			/* DEV0 tdm slot configuration */
-			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x03, 3, 8, 32);
-		} else if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
-			/* DEV1 tdm slot configuration */
-			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x0C, 3, 8, 32);
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (i >= ARRAY_SIZE(max_98373_tdm_mask)) {
+			dev_err(codec_dai->dev, "only 2 amps are supported\n");
+			return -EINVAL;
 		}
-		if (ret < 0) {
-			dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
-				ret);
-			return ret;
+
+		switch (dai_link->dai_fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+		case SND_SOC_DAIFMT_DSP_A:
+		case SND_SOC_DAIFMT_DSP_B:
+			/* get the tplg configured tdm slot number */
+			tdm_slots = sof_dai_get_tdm_slots(rtd);
+			if (tdm_slots <= 0) {
+				dev_err(rtd->dev, "invalid tdm slots %d\n",
+					tdm_slots);
+				return -EINVAL;
+			}
+
+			/*
+			 * check if tdm slot number is too small for channel
+			 * allocation
+			 */
+			if (fls(max_98373_tdm_mask[i].tx) > tdm_slots) {
+				dev_err(codec_dai->dev, "slot mismatch, tx %d slots %d\n",
+					fls(max_98373_tdm_mask[i].tx), tdm_slots);
+				return -EINVAL;
+			}
+
+			if (fls(max_98373_tdm_mask[i].rx) > tdm_slots) {
+				dev_err(codec_dai->dev, "slot mismatch, rx %d slots %d\n",
+					fls(max_98373_tdm_mask[i].rx), tdm_slots);
+				return -EINVAL;
+			}
+
+			dev_dbg(codec_dai->dev, "set tdm slot: tx 0x%x rx 0x%x slots %d width %d\n",
+				max_98373_tdm_mask[i].tx,
+				max_98373_tdm_mask[i].rx,
+				tdm_slots, params_width(params));
+
+			ret = snd_soc_dai_set_tdm_slot(codec_dai,
+						       max_98373_tdm_mask[i].tx,
+						       max_98373_tdm_mask[i].rx,
+						       tdm_slots,
+						       params_width(params));
+			if (ret < 0) {
+				dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
+					ret);
+				return ret;
+			}
+			break;
+		default:
+			dev_dbg(codec_dai->dev, "codec is in I2S mode\n");
+			break;
 		}
 	}
 	return 0;
-- 
2.43.0

