Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6C38B3B45
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:24:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF617E8E;
	Fri, 26 Apr 2024 17:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF617E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145085;
	bh=EN06Qbj+h6vmWB7m/IpZGvOt02dFoebcBQ4VHz/TBPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=euFcbu53klayuMt5LN5d4a8yDf3ZwmJpneJQeA+Z0s32XpTwbGFyJ/i1OLcq8nZbs
	 BETPk7Dz5HDfs8YoIf8cUzOw2eeMqSyRwpBB1vmOK9HRD8xf84uRjkciUymDeZ25hj
	 Pio0gs1Ho7V05u+7wjYsRR8U2eUCxnU4gCk500w4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47E83F806E2; Fri, 26 Apr 2024 17:22:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7918EF806CA;
	Fri, 26 Apr 2024 17:22:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10749F805E5; Fri, 26 Apr 2024 17:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBAEFF80548
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBAEFF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dPoy/yyy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144910; x=1745680910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EN06Qbj+h6vmWB7m/IpZGvOt02dFoebcBQ4VHz/TBPQ=;
  b=dPoy/yyytar3HnvQHULoIGEMh6+oujeoas1CACU+Ucj5vQhGfEvcsv/0
   mtSMRZ589VXhr9GJhM34mI6zhfPZHeBVNZZFHxDRu5wkQ1lIMhPFxOltr
   aZ8psroKeCTn6hpMID6jSLGzGGnt+zc3r/pBARe/cT0dK42N3/86qs3OS
   peQK09EgQWhIzxgmYxKDIL0+AFeKJIuF8uprRiLGyljzLZq38KhIuiZLx
   nd+wyDT2EfTIwrKusrJuc1uxjJD6F1Ycr5PvepVO7WBlDG3f2vtREcuuN
   nGkd9rsdts8v07QAXDnEYGk3QwwxbbI+HNpB2C0+7pjP7EHyAWsmeLTce
   w==;
X-CSE-ConnectionGUID: cuHEBxKNQdymEIWQ0ijHkw==
X-CSE-MsgGUID: dsCV0J/MQbmZR+AAetjnUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290626"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290626"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:43 -0700
X-CSE-ConnectionGUID: vsV7XhHgRo25bOlE0XUwRw==
X-CSE-MsgGUID: UB9LVCLCQZGb4I0qHSboiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259032"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 07/12] ASoC: Intel: sof-sdw: don't set card long_name
Date: Fri, 26 Apr 2024 10:21:18 -0500
Message-Id: <20240426152123.36284-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XLD2REJ4HYLBRBCSIIXZKRM3FKQPOCXU
X-Message-ID-Hash: XLD2REJ4HYLBRBCSIIXZKRM3FKQPOCXU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLD2REJ4HYLBRBCSIIXZKRM3FKQPOCXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

UCM can load a board-specific file based on the card long_name. Remove
the constant "Intel Soundwire SOF" long_name so that the ASoC core can
set the long_name based on DMI information.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 384c3d41a9ad..b9a5fcb42847 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1879,9 +1879,6 @@ static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 	return ret;
 }
 
-/* SoC card */
-static const char sdw_card_long_name[] = "Intel Soundwire SOF";
-
 /* helper to get the link that the codec DAI is used */
 static struct snd_soc_dai_link *mc_find_codec_dai_used(struct snd_soc_card *card,
 						       const char *dai_name)
@@ -1999,8 +1996,6 @@ static int mc_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
-	card->long_name = sdw_card_long_name;
-
 	/* Register the card */
 	ret = devm_snd_soc_register_card(card->dev, card);
 	if (ret) {
-- 
2.40.1

