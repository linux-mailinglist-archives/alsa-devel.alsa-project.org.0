Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF52672B5F1
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 05:17:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E294823;
	Mon, 12 Jun 2023 05:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E294823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686539837;
	bh=n4WljQzl2VdpQPd3iTWOpWki7dTWlXg8XREKcKcC5Fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BGLTVN4mEj6cYWse8Kz6Y0DcJjqrqnFZevjzbwtEAn62kZX4uVMUCYQTGPXHXGWOC
	 2Jr5MjCEeKEIAyhpInQDTzenYrG/4J649epfeG+vmKo08V2IFG+ulUDyXgmbES3MoF
	 Jt37XRNpm9q4eEnTtrWg6BmImg8WCdVemLaHQD+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D17C0F80301; Mon, 12 Jun 2023 05:15:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D76DAF80544;
	Mon, 12 Jun 2023 05:15:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27C99F80544; Mon, 12 Jun 2023 05:15:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B0ECAF80132
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 05:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0ECAF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T2JOH3tk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686539693; x=1718075693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n4WljQzl2VdpQPd3iTWOpWki7dTWlXg8XREKcKcC5Fk=;
  b=T2JOH3tks/7t6mwcT25veZ+tu3vng1F2sFRPbML1Mx8fY6n5SzOpw70V
   NRDjyDABQiNqwjiBLYzKanCx4z+Yg2kDZTCdl3QlHfJGPSGjFb6aURFG2
   7EIkzYYUDSjYoDKEXYrjNB0UlUvkYkcmVXIt+/+a4MHpHBlcSZl/Ng3x8
   SXd0J+2Qs+kEzSJ1YAyKm28HRn0DHoOi0eB2v1bR5/i+K6Xd2XsKelWAr
   wiw9aq5wXFELGpVVv9I0WiVExtnR03DnPUSv8yL/9UdkCxLrYI27IhiIX
   N1uFE3h+1cTZ7HFNw1hySng3l5QODJnpZPWGn+WOHgy6Agp4TtzDvK/Bw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347578902"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400";
   d="scan'208";a="347578902"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2023 20:14:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="776191885"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400";
   d="scan'208";a="776191885"
Received: from brentlu-desktop.itwn.intel.com ([10.5.252.92])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jun 2023 20:14:47 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Brent Lu <brent.lu@intel.com>,
	linux-kernel@vger.kernel.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/12] ASoC: Intel: avs-dmic: remove redundant dapm routes
Date: Mon, 12 Jun 2023 19:09:48 +0800
Message-Id: <20230612110958.592674-3-brent.lu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230612110958.592674-1-brent.lu@intel.com>
References: <20230612110958.592674-1-brent.lu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J4OZMPOU56EBSKZQ3AT4UGB6VTXHSBUH
X-Message-ID-Hash: J4OZMPOU56EBSKZQ3AT4UGB6VTXHSBUH
X-MailFrom: brent.lu@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J4OZMPOU56EBSKZQ3AT4UGB6VTXHSBUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Two routes "DMIC Rx<-Capture" and "DMIC WoV Rx<-Capture" are created
by snd_soc_dapm_connect_dai_link_widgets() automatically. Remove the
duplicate routes.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/avs/boards/dmic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index 90a921638572..c270646faf86 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -44,8 +44,6 @@ static const struct snd_soc_dapm_widget card_widgets[] = {
 
 static const struct snd_soc_dapm_route card_routes[] = {
 	{"DMic", NULL, "SoC DMIC"},
-	{"DMIC Rx", NULL, "Capture"},
-	{"DMIC WoV Rx", NULL, "Capture"},
 };
 
 static int avs_dmic_probe(struct platform_device *pdev)
-- 
2.34.1

