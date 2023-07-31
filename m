Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E6176A344
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:47:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3130EDF3;
	Mon, 31 Jul 2023 23:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3130EDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690840074;
	bh=slYSQ1zk9zLf+x6fzq0FvAhOUxuCFVa63EqUyleJmk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N2NbZYIJx+bvB7vOGlmrtZvmEV7u8/uyqn2mFu6POe84ISFkW7u2mFXjAp1Rxrqt2
	 Mz+uYOvUxTwXViAcEStLFawXF65M8enA6fiLVZtnn91ubnRk2vzVKONbZb8UqUqxbr
	 H93YPakWNom+e9vCbnRqEvI6bt0y+nEPOlTIWqP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40D4DF805FC; Mon, 31 Jul 2023 23:44:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE0D1F805FC;
	Mon, 31 Jul 2023 23:43:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49A03F8016D; Mon, 31 Jul 2023 23:43:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4272DF80578
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4272DF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TaiLVjfO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839800; x=1722375800;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=slYSQ1zk9zLf+x6fzq0FvAhOUxuCFVa63EqUyleJmk4=;
  b=TaiLVjfOudac75bug3b6q0OxEj16CYat8T7zoUIBhRBTxV7y0sAmPgao
   ny07Ac5LDPz0ox6r3B52gUQpiwv0er4/0VsdHsA6543u1rMnYFWZoUhTk
   ncRPeyVJHEZcp62NQJs9EB2SKqpbN0Dl21fd7eL+Imyf8WIWiXYwRWg08
   JbH6Saa0uPyJYxKDZn9Q5S12S4fnJSx2j2YXcvZCEx+gym1QZfGk3TAw5
   Z9Q1klKoxfVpRWw4t8i0a3xh8ggLiy2Hhayducs9Ciuycy9ex/WCDyJiu
   4pRBh1I4QqaPOEL4TBIs0duWht+Q61IBk6avVc3t1K+lyGNepe265odsD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449775"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449775"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523548"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523548"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/23] ASoC: intel: sof_sdw: Use a module device table
Date: Mon, 31 Jul 2023 16:42:46 -0500
Message-Id: <20230731214257.444605-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JJDWTRJA5AGRIBBLPRH4NNPGLJP5YYSI
X-Message-ID-Hash: JJDWTRJA5AGRIBBLPRH4NNPGLJP5YYSI
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

From: Charles Keepax <ckeepax@opensource.cirrus.com>

A module device table is generally preferred over hard coding a
MODULE_ALIAS.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 4f7ef83c21c5..6b55bcdccccc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -2045,6 +2045,12 @@ static void mc_remove(struct platform_device *pdev)
 	mc_dailink_exit_loop(card);
 }
 
+static const struct platform_device_id mc_id_table[] = {
+	{ "sof_sdw", },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, mc_id_table);
+
 static struct platform_driver sof_sdw_driver = {
 	.driver = {
 		.name = "sof_sdw",
@@ -2052,6 +2058,7 @@ static struct platform_driver sof_sdw_driver = {
 	},
 	.probe = mc_probe,
 	.remove_new = mc_remove,
+	.id_table = mc_id_table,
 };
 
 module_platform_driver(sof_sdw_driver);
@@ -2061,6 +2068,5 @@ MODULE_AUTHOR("Bard Liao <yung-chuan.liao@linux.intel.com>");
 MODULE_AUTHOR("Rander Wang <rander.wang@linux.intel.com>");
 MODULE_AUTHOR("Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform:sof_sdw");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
-- 
2.39.2

