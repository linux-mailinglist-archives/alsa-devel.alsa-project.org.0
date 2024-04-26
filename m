Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC9B8B3B2E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:23:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C603E9A;
	Fri, 26 Apr 2024 17:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C603E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145001;
	bh=mkPPo4cmXEwCG5YJSWVnWIbjUUOV62VUhBtNpvDcliE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FWUA9Cb+fxg6Rqr/vIFoT78iUm0bwuvuWxFDjokMQ5iZN8kHyAj3yGSX0WYMxkDX1
	 LMCzuiAJsN1tnTlE7wCzejKPvY9G1HMdenfKIE176ECz3WEccFuBMgMiKn9eNzRZ73
	 wDetlFkRFJD51sodvPoQpe+vcyicHCSc7WvOC/nI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00552F8060C; Fri, 26 Apr 2024 17:22:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10798F8060C;
	Fri, 26 Apr 2024 17:22:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26313F805BD; Fri, 26 Apr 2024 17:21:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD6E9F8003A
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD6E9F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZRMfmErC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144906; x=1745680906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mkPPo4cmXEwCG5YJSWVnWIbjUUOV62VUhBtNpvDcliE=;
  b=ZRMfmErC8SWnaL6d3VJb2GLKP40/LvXuTuqDS553DQWaGghR8qsKaK19
   RxbLTJuMYogp8VZO/1+1MpSKhS4f0txW+o+Uhra4UCLZP2vKbTAJrhXhL
   gEbTzOJG+UbGVnA7Jmwj9EgXSpRGbkVPfgW2Z/eRuCGtC3JPthkobNQkq
   n62VJ1y6MDGSBuv/Xqpc7HVjbkNSpLXQ+yfrh4WApap81s6l1JgS7iW+i
   c8g2ydU2xbUFP//H2nVb2thqLLxOuzaZI6/1KQpV9GA1mDQxdw2O9tY6o
   owKtcsYaO67LKMwYa62Dq8yQirVkSS2gxXiS76LqYJ6DZ3teVLL5YiKGF
   Q==;
X-CSE-ConnectionGUID: M26KGmQjTwC8E5Ne1mjhWA==
X-CSE-MsgGUID: OQGovAIjRPyCtyFJntZIWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290596"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290596"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:40 -0700
X-CSE-ConnectionGUID: mI/xbSpZSAivebQ/hXRUEg==
X-CSE-MsgGUID: lM7woBPGTi6TglTya21fBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259024"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:39 -0700
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
Subject: [PATCH 02/12] ASoC: Intel: skl_hda_dsp_generic: Use devm_kasprintf
 for the components string
Date: Fri, 26 Apr 2024 10:21:13 -0500
Message-Id: <20240426152123.36284-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2QZN4V2G2IVKVQSGREQUXCHU2EVH3IPW
X-Message-ID-Hash: 2QZN4V2G2IVKVQSGREQUXCHU2EVH3IPW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2QZN4V2G2IVKVQSGREQUXCHU2EVH3IPW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Instead of using a global char array, allocate the string with
devm_kasprintf if needed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 208395872d8b..88d91c0280bb 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -92,8 +92,6 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
 	return ret;
 }
 
-static char hda_soc_components[30];
-
 #define IDISP_DAI_COUNT		3
 #define HDAC_DAI_COUNT		2
 #define DMIC_DAI_COUNT		2
@@ -231,9 +229,11 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 		card->disable_route_checks = true;
 
 	if (mach->mach_params.dmic_num > 0) {
-		snprintf(hda_soc_components, sizeof(hda_soc_components),
-				"cfg-dmics:%d", mach->mach_params.dmic_num);
-		card->components = hda_soc_components;
+		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+						  "cfg-dmics:%d",
+						  mach->mach_params.dmic_num);
+		if (!card->components)
+			return -ENOMEM;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-- 
2.40.1

