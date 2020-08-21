Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD1924E18D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 21:59:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 452C4168C;
	Fri, 21 Aug 2020 21:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 452C4168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598039942;
	bh=IqImp2Nk/EXphVxRNVe90M0a5GbSDrhsb8Mnd9OCH+s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qFteB2eBpzKphn6iXIL5RCb69PwiopK74ACxUCCf54pkpLvjjv/H7R8rMUHuBdCHG
	 pjV9V9Pg+AGCJw03QZj20kgwUJ2kUycrA9fmGy5peuiBZ3bY7omWrh/5YLQyR0NjgA
	 gfdKbnmxWEnEXjgZ2bHtszwP/KQ1rVO3gRg9K2Og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8F17F802E8;
	Fri, 21 Aug 2020 21:56:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CE69F802D2; Fri, 21 Aug 2020 21:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59E1DF80216
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59E1DF80216
IronPort-SDR: fgZDYDrQv4R6Fnn9tFiqH75ODri8YVj/aMfFvByQh4hvIFahv1mg+YgWOrc9o9W8oeSSiiv8GX
 lfrTRMPgq7Kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158538"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158538"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:15 -0700
IronPort-SDR: iNVd9IoE6k3FYeu93VyjRjmOW00PejWxCzo5jEuIGARTvGWHlHNWlSaA4Gh8mFm7n4TtP+BL/q
 lBHHsVUNnfnQ==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002392"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/14] ASoC: Intel: soc-acpi: cnl: add support for rt5682 on
 SoundWire link2
Date: Fri, 21 Aug 2020 14:55:49 -0500
Message-Id: <20200821195603.215535-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@intel.com, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add one of the configurations for rt5682 w/ the Up Extreme Advanced
Audio mode using the SoundWire link2.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-cnl-match.c   | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 6a0bcc1a8429..7d61e0da808b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -27,8 +27,39 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cnl_machines);
 
+static const struct snd_soc_acpi_endpoint single_endpoint = {
+	.num = 0,
+	.aggregated = 0,
+	.group_position = 0,
+	.group_id = 0,
+};
+
+static const struct snd_soc_acpi_adr_device rt5682_2_adr[] = {
+	{
+		.adr = 0x000220025D568200,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_link_adr up_extreme_rt5682_2[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt5682_2_adr),
+		.adr_d = rt5682_2_adr,
+	},
+	{}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_sdw_machines[] = {
-	{},
+	{
+		.link_mask = BIT(2),
+		.links = up_extreme_rt5682_2,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-cnl.ri",
+		.sof_tplg_filename = "sof-cnl-rt5682-sdw2.tplg"
+	},
+	{}
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cnl_sdw_machines);
 
-- 
2.25.1

