Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D325D6101E7
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:42:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BB53846;
	Thu, 27 Oct 2022 21:41:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BB53846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899733;
	bh=DOPsl7eh/L5GCNTINXTpcAIX55By8BK/YgCoZ/3V3bE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fIXT+k+uakSK3NOuLJjTD4kI03OOaAztN9v3G1oRuw7zbUX5kdndK4/BlpyVVokeq
	 dMs9F7blL9IZriMcYP9ywgn54vGdgisaIelKtOnDh8/QS/lQ6P+1z1R6wink4w49Xd
	 EtJLo3/7POQP3ZBC6as9QjF3efKq8GvBCnjPFATo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D77F805D9;
	Thu, 27 Oct 2022 21:36:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55EDAF805C5; Thu, 27 Oct 2022 21:36:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32589F8058C
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32589F8058C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="a09taGKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899389; x=1698435389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DOPsl7eh/L5GCNTINXTpcAIX55By8BK/YgCoZ/3V3bE=;
 b=a09taGKnHZxQic1wg5zP20zVXmIIG+yw5GY+NtZzU3C9yVk8yXwJFmkG
 uVQlk0J5VQH2wtLOKe0X+wY7TPdzjbKRDdPkYzVsXK6rLHEfz7SimtczL
 zGItlCzGKi6PEPKyAXqdmJ7VcR6fUlebPRM6s1R3ilOdjse72r2Mlcl2N
 8R48PiK6SLEU7y5xFEujEu6MvVYLwJsHy7gOmDYpdJY4z1oZ14aEE+eHS
 407Xn53du0hkfIYZKpcm0egkfdrV8tDyqMhQo+qLbGdDB5/0jaiTxVA2w
 JHfqrRaH8IB1ArPrPGeiH8KonPaXFK53fU1zw63hna23MBqJ7qP2csUsU A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957885"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957885"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527088"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527088"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 20/21] ASoC: SOF: Intel: hda-codec: use GPL-2.0-only license
Date: Thu, 27 Oct 2022 15:35:39 -0400
Message-Id: <20221027193540.259520-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

All the HDAudio codec handling is completely specific to Linux and
completely dependency on GPL2.0 code, specifically the snd_hdac_
library.

There was no intention to have a dual-license for this code, this was
an oversight that needs to be corrected. Update the SPDX and
EXPORT_SYMBOL information, no functionality change otherwise.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 60c15f9f0f3c..50a7e3f08285 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -1,7 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-//
-// This file is provided under a dual BSD/GPLv2 license.  When using or
-// redistributing this file, you may do so under either license.
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // Copyright(c) 2018 Intel Corporation. All rights reserved.
 //
@@ -83,7 +80,7 @@ void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable)
 
 	snd_hdac_chip_updatew(bus, WAKEEN, STATESTS_INT_MASK, mask);
 }
-EXPORT_SYMBOL_NS(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
 /* check jack status after resuming from suspend mode */
 void hda_codec_jack_check(struct snd_sof_dev *sdev)
@@ -99,7 +96,7 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev)
 		if (codec->jacktbl.used)
 			pm_request_resume(&codec->core.dev);
 }
-EXPORT_SYMBOL_NS(hda_codec_jack_check, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_jack_check, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
 #if IS_ENABLED(CONFIG_SND_HDA_GENERIC)
 #define is_generic_config(bus) \
@@ -218,7 +215,7 @@ void hda_codec_probe_bus(struct snd_sof_dev *sdev)
 		}
 	}
 }
-EXPORT_SYMBOL_NS(hda_codec_probe_bus, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_probe_bus, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
 void hda_codec_check_for_state_change(struct snd_sof_dev *sdev)
 {
@@ -231,7 +228,7 @@ void hda_codec_check_for_state_change(struct snd_sof_dev *sdev)
 		snd_hdac_chip_writew(bus, STATESTS, codec_mask);
 	}
 }
-EXPORT_SYMBOL_NS(hda_codec_check_for_state_change, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_check_for_state_change, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
 void hda_codec_detect_mask(struct snd_sof_dev *sdev)
 {
@@ -355,7 +352,7 @@ void hda_codec_i915_display_power(struct snd_sof_dev *sdev, bool enable)
 		snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, enable);
 	}
 }
-EXPORT_SYMBOL_NS(hda_codec_i915_display_power, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
+EXPORT_SYMBOL_NS_GPL(hda_codec_i915_display_power, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 int hda_codec_i915_init(struct snd_sof_dev *sdev)
 {
@@ -372,7 +369,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_codec_i915_init, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
+EXPORT_SYMBOL_NS_GPL(hda_codec_i915_init, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 {
@@ -386,7 +383,7 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 
 	return snd_hdac_i915_exit(bus);
 }
-EXPORT_SYMBOL_NS(hda_codec_i915_exit, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
+EXPORT_SYMBOL_NS_GPL(hda_codec_i915_exit, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 #endif
 
-- 
2.34.1

