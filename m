Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A28720A48
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:28:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 265C8843;
	Fri,  2 Jun 2023 22:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 265C8843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737716;
	bh=yzdbsRMevvjJYm+E0v2dcGet06G7mPsFfNglCgBakhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EvhDHDxcbl9IAgam2QnYKqm8z9LYbjWVotxs/h3vY3QF3JEe/++Y9jw07Y03/qI1C
	 ay4tVlQjIZkaonKkyToMZgXGk0aDOp4eNW8Kmb9NnU/rhPhi0LfPtwLpZsvfzPksd8
	 imTIITyB3nMAcB6bFsZ4CmDtyGHlfuk99IZIoiwY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBFE3F80579; Fri,  2 Jun 2023 22:24:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D1C9F8056F;
	Fri,  2 Jun 2023 22:24:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38D49F805FD; Fri,  2 Jun 2023 22:23:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0740F80558
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0740F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oCWAIuvy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737393; x=1717273393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yzdbsRMevvjJYm+E0v2dcGet06G7mPsFfNglCgBakhU=;
  b=oCWAIuvyfrJ8XMych8al1GfM8UdwaziiDCXog5JX41lKHkY9uMH8VJss
   fZuvDq0PCSsNtSRUjXv65huhBrzJYFfAs6JXmgyL3C2cAAKUyQSysnyjI
   Lxx0/R14aOJzjFWfzX4yHstPYODegkANcDUmP3PtHYzhqOlkqmf0x/geV
   v9NJdwr6JHgo8F/50pfFIvLcHxKZnWkIp9/X7iiwvuP21RrpeRgrwoUbe
   ZVErq0Cqyz2lQFMTd4RFtwYfk0lDnxEkAiRXVm2LQjNMaSvR0PfyjY7D6
   TvoQX/nPM7YOwRgx23YZrcvFiYLZK5lbRan4dGshF+4O7KQfMeDWMHE9C
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811268"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811268"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020024"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020024"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:53 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 13/28] ASoC: Intel: sof_sdw: add rt713 support
Date: Fri,  2 Jun 2023 15:22:10 -0500
Message-Id: <20230602202225.249209-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M2Z5K2HGMYUHDGMJXITRCY2NBYARBHF4
X-Message-ID-Hash: M2Z5K2HGMYUHDGMJXITRCY2NBYARBHF4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2Z5K2HGMYUHDGMJXITRCY2NBYARBHF4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

rt713 is rt712 but without amp.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 4ab7cd7f9178..73e5a6aed776 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -640,6 +640,35 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 	},
+	{
+		.part_id = 0x713,
+		.version_id = 3,
+		.dais =	{
+			{
+				.direction = {true, true},
+				.dai_name = "rt712-sdca-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.init = sof_sdw_rt_sdca_jack_init,
+				.exit = sof_sdw_rt_sdca_jack_exit,
+			},
+		},
+		.dai_num = 1,
+	},
+	{
+		.part_id = 0x1713,
+		.version_id = 3,
+		.dais =	{
+			{
+				.direction = {false, true},
+				.dai_name = "rt712-sdca-dmic-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.init = sof_sdw_rt712_sdca_dmic_init,
+			},
+		},
+		.dai_num = 1,
+	},
 	{
 		.part_id = 0x1308,
 		.acpi_id = "10EC1308",
-- 
2.37.2

