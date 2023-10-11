Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B56B7C5378
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 14:19:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D86EF15BE;
	Wed, 11 Oct 2023 14:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D86EF15BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697026745;
	bh=pSM2bHawGazkr86J1ByDoPl8fCxvna3URNjEwCyngA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gn1lnVTAL8mzahYNvSNdlKH0xLqtSkRfzhAqkMWPLyL24EhbsJ+EdgG6z7zDMqoG7
	 lLdrq9dhmWs3vBgOlg9EXx7u5d9+lR7PObjz8Eg1WcTfiARbYug1/LMGtIdv4vH4L5
	 QvVdeZnIIRCKz/n/A0uNHHjvi0ReCCws+WI1wljg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58E50F80570; Wed, 11 Oct 2023 14:17:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACC10F80552;
	Wed, 11 Oct 2023 14:17:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CD07F80557; Wed, 11 Oct 2023 14:17:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD0D6F8027B
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 14:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD0D6F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QxQvZLlT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697026630; x=1728562630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pSM2bHawGazkr86J1ByDoPl8fCxvna3URNjEwCyngA4=;
  b=QxQvZLlTd39eervmvGJpGHFkUy5H31Ws8wQJ0MSZwZYgNNYK7fSWweoT
   flidkzehHbuguP4f+KuSY9X14dQ0O5SybGSnEhgTZj7OyLNyKrM8UAB0i
   2W5GsbLc8W4+TPcdRYn0sj4YnSBYoZz3D7u0REQRXQHMaUPj2HDDEBTzb
   19cFeUFm+dodufCq7zzAAVztGbLGKBwo5uOn3voRTuXSLfVEnIUaxXfIa
   NIBb5+33PUUExtnThOzStXIy52YjbdoO+Lg2wcUXIIL2hrpjJx+UceYMM
   CAeQuH5hMWp64Gzio0Ep3c+YEKZTvrw8MphIfHYArUioziCeoHnOBIXF3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="374988346"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200";
   d="scan'208";a="374988346"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:16:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747428334"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200";
   d="scan'208";a="747428334"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga007.jf.intel.com with ESMTP; 11 Oct 2023 05:16:56 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 01/16] ASoC: Intel: avs: Only create SSP%d snd_soc_dai_driver
 when requested
Date: Wed, 11 Oct 2023 14:16:48 +0200
Message-Id: <20231011121703.363652-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231011121703.363652-1-amadeuszx.slawinski@linux.intel.com>
References: <20231011121703.363652-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4XBEDFRUR5AID5SLOIL5Z3OBOX4XJK27
X-Message-ID-Hash: 4XBEDFRUR5AID5SLOIL5Z3OBOX4XJK27
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XBEDFRUR5AID5SLOIL5Z3OBOX4XJK27/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When using TDM configuration some other device may be using SSP%d, so
don't create snd_soc_dai_driver configuration for it unless requested
by TDM configuration.

While at it adjust tdf8532 board to explicitly describe TDM
configuration.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/board_selection.c |  2 +-
 sound/soc/intel/avs/pcm.c             | 28 ++++++++++++++++-----------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 59a13feec57b..c10fff705496 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -193,7 +193,7 @@ static struct snd_soc_acpi_mach avs_apl_i2s_machines[] = {
 		.mach_params = {
 			.i2s_link_mask = AVS_SSP_RANGE(0, 5),
 		},
-		.pdata = (unsigned long[]){ 0, 0, 0x14, 0, 0, 0 }, /* SSP2 TDMs */
+		.pdata = (unsigned long[]){ 0x1, 0x1, 0x14, 0x1, 0x1, 0x1 }, /* SSP2 TDMs */
 		.tplg_filename = "tdf8532-tplg.bin",
 	},
 	{
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 5b31203bd56a..bea66e6bd438 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -1238,7 +1238,11 @@ int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned l
 	int i, j;
 
 	ssp_count = adev->hw_cfg.i2s_caps.ctrl_count;
-	cpu_count = hweight_long(port_mask);
+
+	cpu_count = 0;
+	for_each_set_bit(i, &port_mask, ssp_count)
+		if (!tdms || test_bit(0, &tdms[i]))
+			cpu_count++;
 	if (tdms)
 		for_each_set_bit(i, &port_mask, ssp_count)
 			cpu_count += hweight_long(tdms[i]);
@@ -1249,18 +1253,20 @@ int avs_i2s_platform_register(struct avs_dev *adev, const char *name, unsigned l
 
 	dai = cpus;
 	for_each_set_bit(i, &port_mask, ssp_count) {
-		memcpy(dai, &i2s_dai_template, sizeof(*dai));
+		if (!tdms || test_bit(0, &tdms[i])) {
+			memcpy(dai, &i2s_dai_template, sizeof(*dai));
 
-		dai->name =
-			devm_kasprintf(adev->dev, GFP_KERNEL, "SSP%d Pin", i);
-		dai->playback.stream_name =
-			devm_kasprintf(adev->dev, GFP_KERNEL, "ssp%d Tx", i);
-		dai->capture.stream_name =
-			devm_kasprintf(adev->dev, GFP_KERNEL, "ssp%d Rx", i);
+			dai->name =
+				devm_kasprintf(adev->dev, GFP_KERNEL, "SSP%d Pin", i);
+			dai->playback.stream_name =
+				devm_kasprintf(adev->dev, GFP_KERNEL, "ssp%d Tx", i);
+			dai->capture.stream_name =
+				devm_kasprintf(adev->dev, GFP_KERNEL, "ssp%d Rx", i);
 
-		if (!dai->name || !dai->playback.stream_name || !dai->capture.stream_name)
-			return -ENOMEM;
-		dai++;
+			if (!dai->name || !dai->playback.stream_name || !dai->capture.stream_name)
+				return -ENOMEM;
+			dai++;
+		}
 	}
 
 	if (!tdms)
-- 
2.34.1

