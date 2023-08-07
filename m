Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 132B77731AB
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 23:52:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4462484A;
	Mon,  7 Aug 2023 23:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4462484A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691445122;
	bh=AxnK1EnqOwsIlsUyEZHBS+ITY6bccL0OykTpi5k12vQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PEMspFj7PyKoZJSW4Etk3O9Iq23hs9n42E2xoeKXap2/SWzQ+3BMqBVW3fhwJxekM
	 fQU1i9J8tXBQSOq6X1I5yfMc3aEzASApaRAAe3ulxWJqs8RirNcdglb5YTTSa2ns8r
	 c5xCYYpcmw5lm1AzMiXqB28fDT7MUe5NhgredgX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 956B9F80570; Mon,  7 Aug 2023 23:50:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FBA5F80563;
	Mon,  7 Aug 2023 23:50:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C69D4F8051E; Mon,  7 Aug 2023 23:50:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 509C2F80116
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 23:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 509C2F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l0TkJhc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691445018; x=1722981018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AxnK1EnqOwsIlsUyEZHBS+ITY6bccL0OykTpi5k12vQ=;
  b=l0TkJhc4fkge4GLaiudQm3IjhSMG1AvXApLKcaCDOh8iGKtMB6F4IfJH
   zK8wihDCJpFtdPvbitMtbphj2BRTZVwuH9rZlTq6mPYwE2t87Q6cvG4LJ
   X6heGawYZzNL3f2ci0q4gp0HfpCk/yen5S1BSzwUENFS49YDQmOCEZHm5
   G1Q+Qxm/CnZj9qi2BBPJljcpHT4iP/NjqyZhCMBrl3kBSy+cFnExeyK8e
   f5KaPK/5WDqq81cbl0gn4CLeWU5+2Gx0rpuY/CPNf5vjn6AI/zr0wSEBc
   W849BShMQU+G5Sb1Cq02gu7tKW2jHCpJX2ouKjUmlF+UDjL8B3X3VePef
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434505572"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="434505572"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200";
   d="scan'208";a="874470769"
Received: from mkabani-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.55.216])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 14:50:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	jairaj-arava <jairaj.arava@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 1/2] ASoC: Intel: sof-sdw-cs42142: fix for codec button
 mapping
Date: Mon,  7 Aug 2023 16:49:59 -0500
Message-Id: <20230807215000.515846-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807215000.515846-1-pierre-louis.bossart@linux.intel.com>
References: <20230807215000.515846-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7YVNBS2XREDRMYERTGA7GVMDIXIH3QYN
X-Message-ID-Hash: 7YVNBS2XREDRMYERTGA7GVMDIXIH3QYN
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: jairaj-arava <jairaj.arava@intel.com>

The CS42142 soundwire codec button mapping is corrected to
handle the button detection correctly.

Fixes: 1340018d8683 ("ASoC: Intel: sof_sdw: Add helper function for cs42l42 codec")
Signed-off-by: jairaj-arava <jairaj.arava@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_cs42l42.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index c4a16e4c9f69..ad130d913415 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -99,9 +99,9 @@ static int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	jack = &ctx->sdw_headset;
 
 	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
 
 	ret = snd_soc_component_set_jack(component, jack, NULL);
 
-- 
2.39.2

