Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2E47C766E
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 21:11:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED79A4E;
	Thu, 12 Oct 2023 21:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED79A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697137868;
	bh=J7jDGFClffbd+qauO6FlXUGv2hXLVhl/UXaH8Fezvb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iLz7yUfqTR4HOxXH34cLbnFt7LzaQ7zInLywdlR5vGRXnT7GDqAZe9Uc/tLBNSJSt
	 y2eBrpCnIkd9p3yj5Akealn0tZsn40D3PlsArtQAETC6jxXXS7mOVQBbshBOj5A1iv
	 Aol4i5XM4/9DdJMgYIJ1SPl5iFunpnElr23KaIFs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C20AF805BD; Thu, 12 Oct 2023 21:09:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB431F805B1;
	Thu, 12 Oct 2023 21:09:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0436FF8057D; Thu, 12 Oct 2023 21:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56C5FF802BE
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 21:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56C5FF802BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ygtpvir1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697137739; x=1728673739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J7jDGFClffbd+qauO6FlXUGv2hXLVhl/UXaH8Fezvb4=;
  b=Ygtpvir1QISBnsdVJ+VG6dG2iwl/FA8KOI271oySxsO+frOXmppEs2Nn
   CC0wiIb0actHCngGClX945elinCEQFqm7amAJCOwJWNUx6Z6zN0TNUE47
   kc1dgO9ubMwHwPLPEjJcoyDpgnskJtKMGqH5sM+/dCTb7wwhILlFWm/KF
   jGIqgZI5Q74jgk11RA8pbQqeR5Yd8BJGQGk5P2Zv4TKZPkaI6c14rpgOe
   hMok/Ibst1Lj2YBxVa172A4yYhEkIF09sb7FR6uhrB/IVocovUxeDrQfL
   j+lAD8jSvf8qAIp2h19c7889pr21bMOxDXECVDB2NzKtafKKUV7rcQzWX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="416060176"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="416060176"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="845108057"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="845108057"
Received: from gchoudha-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.hsd1.md.comcast.net) ([10.212.114.241])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 12:08:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/23] ASoC: Intel: sof_sdw_rt_sdca_jack_common: add rt713
 support
Date: Thu, 12 Oct 2023 15:08:07 -0400
Message-Id: <20231012190826.142619-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
References: <20231012190826.142619-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W5E2YZBMNOIQ4BVL2NV5M25X7OMLJJNW
X-Message-ID-Hash: W5E2YZBMNOIQ4BVL2NV5M25X7OMLJJNW
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5E2YZBMNOIQ4BVL2NV5M25X7OMLJJNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Adding rt713 support to sof_sdw_rt_sdca_jack_common.c.

Fixes: fbaaf80d8cf6 ("ASoC: Intel: sof_sdw: add rt713 support")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index ef62ac5fdf55..65bbcee88d6d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -58,6 +58,11 @@ static const struct snd_soc_dapm_route rt712_sdca_map[] = {
 	{ "rt712 MIC2", NULL, "Headset Mic" },
 };
 
+static const struct snd_soc_dapm_route rt713_sdca_map[] = {
+	{ "Headphone", NULL, "rt713 HP" },
+	{ "rt713 MIC2", NULL, "Headset Mic" },
+};
+
 static const struct snd_kcontrol_new rt_sdca_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
@@ -109,6 +114,9 @@ static int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	} else if (strstr(component->name_prefix, "rt712")) {
 		ret = snd_soc_dapm_add_routes(&card->dapm, rt712_sdca_map,
 					      ARRAY_SIZE(rt712_sdca_map));
+	} else if (strstr(component->name_prefix, "rt713")) {
+		ret = snd_soc_dapm_add_routes(&card->dapm, rt713_sdca_map,
+					      ARRAY_SIZE(rt713_sdca_map));
 	} else {
 		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
 		return -EINVAL;
-- 
2.39.2

