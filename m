Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C5F8B3B2F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:23:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F11DA4B;
	Fri, 26 Apr 2024 17:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F11DA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145016;
	bh=PEhn8HQcSVd6mSeWV30RYAJSQWq9dxPGiCp9O1JeE+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tAuP5BbMr97sxU8CGZJ/PfnbzLmbbModxDprAjKvJYR3AzRMqUzDcmseUY0D8gUch
	 zmcLP8eLMq70Q/vjeQdETk5/NwHx4mOSA2RJuiE7IVtSfUKhOM8w2VKwB94Cm49vMB
	 t51dT2XJt70HnQXs99wI33AIs+6Kalx0iJJS2gOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31427F8063C; Fri, 26 Apr 2024 17:22:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F85EF80635;
	Fri, 26 Apr 2024 17:22:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B7C4F80423; Fri, 26 Apr 2024 17:21:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B8CCF80423
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B8CCF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UA0KmZSm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144910; x=1745680910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PEhn8HQcSVd6mSeWV30RYAJSQWq9dxPGiCp9O1JeE+o=;
  b=UA0KmZSm8Nniq4FlHxzFQcSqKHDpWK3iulIrB6r8ZtNX/1X8CH5POKEW
   XbbgbFmpriS0la7qTpCTHKdc8koNy0hmYSLAr11MCSbO5ti7E7wqOcabl
   ZlrlrSetTPiXQ67wkLyjU0YQJ5GAciEW9UI8YGcYRpuxXdRbpqngQzzYr
   b7EJTW/NdQmKTEDjMvVWI4b2itA9w65tzSz+WSTHsSKkgtAmCSRVORl3T
   9PUZ8SYANfYjGR2GnvpAihI41ZwKb37D0PlcUnAKLn7IjvrYwfdAaWsJO
   o2WMz/LHxSW1v6jcNLlzGEJVkzVeYR5doBJB6bBkWIIGcir6faRjKwDgO
   g==;
X-CSE-ConnectionGUID: I8HrgLTVTtGxna7L3enptQ==
X-CSE-MsgGUID: lHfbwUIGTHu0Yi68Kghw9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290621"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290621"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:43 -0700
X-CSE-ConnectionGUID: 6HKKzj6bTdWsV+vqO8bB8Q==
X-CSE-MsgGUID: zEUUyN3TTdKBKXE+HfltGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259031"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/12] ASoC: Intel: sof_sdw: Allocate snd_soc_card dynamically
Date: Fri, 26 Apr 2024 10:21:17 -0500
Message-Id: <20240426152123.36284-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4DBX7XXRRE7SY2OQSGX24APDBB5CZVGU
X-Message-ID-Hash: 4DBX7XXRRE7SY2OQSGX24APDBB5CZVGU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4DBX7XXRRE7SY2OQSGX24APDBB5CZVGU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The static card_sof_sdw struct is modified during runtime and in case the
module is not removed, but the card is, then the next time the card is
created the card_sof_sdw will contain information from the previous card
which might lead to hard to debug issues, side effects.

Move the snd_soc_card into mc_private and use that to make sure that the
card is initialized correctly.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 20 +++++++++-----------
 sound/soc/intel/boards/sof_sdw_common.h |  1 +
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d65c5da49000..384c3d41a9ad 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1882,12 +1882,6 @@ static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 /* SoC card */
 static const char sdw_card_long_name[] = "Intel Soundwire SOF";
 
-static struct snd_soc_card card_sof_sdw = {
-	.name = "soundwire",
-	.owner = THIS_MODULE,
-	.late_probe = sof_sdw_card_late_probe,
-};
-
 /* helper to get the link that the codec DAI is used */
 static struct snd_soc_dai_link *mc_find_codec_dai_used(struct snd_soc_card *card,
 						       const char *dai_name)
@@ -1939,20 +1933,24 @@ static void mc_dailink_exit_loop(struct snd_soc_card *card)
 
 static int mc_probe(struct platform_device *pdev)
 {
-	struct snd_soc_card *card = &card_sof_sdw;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(&pdev->dev);
+	struct snd_soc_card *card;
 	struct mc_private *ctx;
 	int amp_num = 0, i;
 	int ret;
 
-	card->dev = &pdev->dev;
+	dev_dbg(&pdev->dev, "Entry\n");
 
-	dev_dbg(card->dev, "Entry\n");
-
-	ctx = devm_kzalloc(card->dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	card = &ctx->card;
+	card->dev = &pdev->dev;
+	card->name = "soundwire",
+	card->owner = THIS_MODULE,
+	card->late_probe = sof_sdw_card_late_probe,
+
 	snd_soc_card_set_drvdata(card, ctx);
 
 	dmi_check_system(sof_sdw_quirk_table);
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 89253938ebaa..853278c6e525 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -101,6 +101,7 @@ struct sof_sdw_codec_info {
 };
 
 struct mc_private {
+	struct snd_soc_card card;
 	struct snd_soc_jack sdw_headset;
 	struct sof_hdmi_private hdmi;
 	struct device *headset_codec_dev; /* only one headset per card */
-- 
2.40.1

