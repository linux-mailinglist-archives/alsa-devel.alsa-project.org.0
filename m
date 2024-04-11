Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3840C8A21C4
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:34:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B5DB2BF7;
	Fri, 12 Apr 2024 00:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B5DB2BF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874843;
	bh=V80U71ZVk1BSbUWzsi/2PM4s6/P91O4qwdizAbM2i2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hbDSgKK2SMDVduSwtdCwSMhAnUnXqP4tDIV+xFQKaKVihUYi3UDn4Y8nQmfN+sycq
	 dWjGNNcYRqoRKN46WHDlz+cHfpclKfrW1OKvuh0z8+uuUSJlmQT76rkxXGTZOUiaxK
	 rpe3889gZJIYNo4LPuI2Gq1lxSiRCM1WK4/Skyts=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BEE0F806AA; Fri, 12 Apr 2024 00:32:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA170F8069C;
	Fri, 12 Apr 2024 00:32:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44B32F80236; Fri, 12 Apr 2024 00:16:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 343B3F80579
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 343B3F80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KRRc2AsL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873069; x=1744409069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V80U71ZVk1BSbUWzsi/2PM4s6/P91O4qwdizAbM2i2A=;
  b=KRRc2AsLBcvQgWjB5zFdfmH/x1bBk2BwvvX/Yd9MSzruMeb8tPyDfGOK
   pE0qDOQmz+FHQvG2ydBHh4ULChJ7Z0sKF/k1c0mKFLq8+0Ubz41++0FAQ
   bPwIESvWbhZDKnbzlzrjfmN1UbYZ3+/Lrvmh66u8+KOZsy83RVVt/BUUz
   ZtWWqQL63e0eycyHoU05hu6isxED8udpunSQhnpkoiaXcYdukD0DtSXkJ
   I/Bry0/12Hg+EzOfedr4HdM1JvfBUk4EGDzAOYzyE/jh1pBFuBHVPtvbT
   SzIckD1rfSuRNNkBgvrDgMpBWrBHvLQhPxeWuTLmoJ1XcBXinEa6qF5MA
   A==;
X-CSE-ConnectionGUID: PEwojOc2RHaewcNgqd6PAQ==
X-CSE-MsgGUID: lMVzGFl3T2KQta61oQbTqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708382"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708382"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:20 -0700
X-CSE-ConnectionGUID: bIENvs6YTASXeV35ZC/E2w==
X-CSE-MsgGUID: QrMlRKCdSeWXMnRWhgs61Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628764"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Chao Song <chao.song@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/12] ASoC: Intel: sof_rt5682: support ALC1011 on cml boards
Date: Thu, 11 Apr 2024 17:03:45 -0500
Message-Id: <20240411220347.131267-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WA334MY6OLCT7RT32AMZ4DCD22FTZYCM
X-Message-ID-Hash: WA334MY6OLCT7RT32AMZ4DCD22FTZYCM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WA334MY6OLCT7RT32AMZ4DCD22FTZYCM/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

For cml boards, ALC1011 speaker amplifier is supported by machine
driver cml_rt1011_rt5682. Use same driver name for backward
compatibility with existing devices on market.

Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 326d23dd79de..735e07ea62bd 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -606,6 +606,7 @@ static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
 	struct sof_card_private *ctx;
+	char *card_name;
 	bool is_legacy_cpu = false;
 	int ret;
 
@@ -631,14 +632,27 @@ static int sof_audio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	if (ctx->codec_type == CODEC_RT5650) {
-		sof_audio_card_rt5682.name = devm_kstrdup(&pdev->dev, "rt5650",
-							  GFP_KERNEL);
+		card_name = devm_kstrdup(&pdev->dev, "rt5650", GFP_KERNEL);
+		if (!card_name)
+			return -ENOMEM;
+
+		sof_audio_card_rt5682.name = card_name;
 
 		/* create speaker dai link also */
 		if (ctx->amp_type == CODEC_NONE)
 			ctx->amp_type = CODEC_RT5650;
 	}
 
+	if (ctx->amp_type == CODEC_RT1011 && soc_intel_is_cml()) {
+		/* backward-compatible with existing cml devices */
+		card_name = devm_kstrdup(&pdev->dev, "cml_rt1011_rt5682",
+					 GFP_KERNEL);
+		if (!card_name)
+			return -ENOMEM;
+
+		sof_audio_card_rt5682.name = card_name;
+	}
+
 	if (is_legacy_cpu) {
 		ctx->rt5682.is_legacy_cpu = true;
 		ctx->dmic_be_num = 0;
-- 
2.40.1

