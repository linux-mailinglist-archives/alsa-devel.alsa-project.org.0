Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 778D076A333
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7C92DF3;
	Mon, 31 Jul 2023 23:45:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7C92DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839977;
	bh=tnLINPijn4O9CvkI3DyjWwv8HmZpb3SZanOkC0r+AuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GIEYNyiPmtGPMUo8mxu+HiU4IDl4ueO6VWRHzoEDJ85LsY9BEdRsxdfunDx++J/Gd
	 0KTqzKJPAQ2FUh2PjksraDWwUB0gfbzGLbKmgjNZ63REE9cvyvBKLgSMDdeiTF5HEG
	 uwrKN1MIyxKIQSOyDsLH9E/u+TF0Z6bYzb3AkQLY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BD5FF805B5; Mon, 31 Jul 2023 23:43:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66AE0F8015B;
	Mon, 31 Jul 2023 23:43:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40CB9F8059F; Mon, 31 Jul 2023 23:43:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A39DF8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A39DF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l5TEbVjk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839796; x=1722375796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tnLINPijn4O9CvkI3DyjWwv8HmZpb3SZanOkC0r+AuY=;
  b=l5TEbVjkhNSxDuLBF1wbJzhYzHuvTSeKm8UoPgPP2GeAcGYdSD0fu2wy
   JJ7JrxvpONazEMUdn9aSPZ33p64ZymAAbDZXeFCxMUVRmUZbP2RPL/6Xx
   2ajE/eQ4N+US605/sdP6n50ixURRhe13x3W6PI9kjPSP0BpUXRTVbaQHw
   As028m9wQrhQOIozElJGmn4QYIVT/Kv1cWBtmZ9u+q2SWHiIYMadeQMdI
   GEzIhwg8g3Z2OSb6XMWf7GSW1QcvdPIX0I6l01nAdrK2Ziqk0uYIRmDju
   JyUHwJVdC0RV+8YiH87DhENFhaDOe02aD78n/M4+gQ3sUSDEABvPytbEv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449750"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449750"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523532"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523532"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 06/23] ASoC: Intel: sof_sdw: allow mockup amplifier to provide
 feedback
Date: Mon, 31 Jul 2023 16:42:40 -0500
Message-Id: <20230731214257.444605-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WOQBW7M2IWSI7CZ75ISJTXPE46FCTUBU
X-Message-ID-Hash: WOQBW7M2IWSI7CZ75ISJTXPE46FCTUBU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOQBW7M2IWSI7CZ75ISJTXPE46FCTUBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The capture setting are missing and preventing topologies with
feedback from loading.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b811446be4cd..7e43be46cfa8 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -942,10 +942,10 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.version_id = 0,
 		.dais = {
 			{
-				.direction = {true, false},
+				.direction = {true, true},
 				.dai_name = "sdw-mockup-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
-				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = NULL,
 			},
 		},
-- 
2.39.2

