Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 978747FA12B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:37:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E908E832;
	Mon, 27 Nov 2023 14:37:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E908E832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701092249;
	bh=mJesEuzPrGuDLW8lzbIbz3ZHGfHLQu0+NnuIRJyxKts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V72H0Sfuryqk6ggMOOfe3bVzJULyvir77pdER/ZK65qAa1nKbNqZeRXHBOOj8MB17
	 jDoZ0dkK5jbf1fX60Y917M0LF60Lflju9/sx/R9Se7D7RtKC5GCV3sRCtHUVYlbr5G
	 HDcSH479NwHiey2IM6xDXq6Jg91HcqGJj7Cyd4I0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E501BF80606; Mon, 27 Nov 2023 14:36:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8241F80609;
	Mon, 27 Nov 2023 14:36:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B42E3F80254; Mon, 27 Nov 2023 14:36:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4023F80104
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:36:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4023F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XpYuxRkb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092164; x=1732628164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mJesEuzPrGuDLW8lzbIbz3ZHGfHLQu0+NnuIRJyxKts=;
  b=XpYuxRkbOHYz+xOWqCqcgO+iKMZKL5Uf0dgxug+8Dn7a8g22qtTgcgHo
   6uEZMhGBsOPm/4/eraJwtWlVrS1BXBxssqGtDDFcaO3Nlly0LlzYLiW3s
   y5N+os7Z6USUPL6efuCNIcSbbvhaBmuTLANgwkJ2/nqADtrhy2ztjA+9f
   jmTcbUDDEeUvISrD1CxYHnwN5QUTIdoG9rkeU072emQDOcIP3nvxiYOmF
   Y1Wa7nWxh/wyeVvjvQOQSQBuxMqwKN0TUrR9PvDtHm8pSWIAYmougsirX
   b5yju7eHekWt6185WXC24NW/cjuZoEMrvwmLiwCVhpHOIvx2t5UsEBSJA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578600"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="391578600"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743786"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="891743786"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:39 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	cezary.rojewski@intel.com,
	yung-chuan.liao@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	yong.zhi@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 7/7] ASoC: Intel: soc-acpi-intel-mtl-match: Add rt722 support
Date: Mon, 27 Nov 2023 15:34:48 +0200
Message-ID: <20231127133448.18449-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AUMQWO4A3B7YEVQ4PIG2WTLH6IMNCYUR
X-Message-ID-Hash: AUMQWO4A3B7YEVQ4PIG2WTLH6IMNCYUR
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUMQWO4A3B7YEVQ4PIG2WTLH6IMNCYUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

This patch adds match table for rt722 codec on link 0.

RT722 is a multi-function codec, three endpoints are
created for its headset, amp and dmic functions.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 2035f561ca50..f2c17cee1a5d 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -135,6 +135,31 @@ static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
 	},
 };
 
+/*
+ * RT722 is a multi-function codec, three endpoints are created for
+ * its headset, amp and dmic functions.
+ */
+static const struct snd_soc_acpi_endpoint rt722_endpoints[] = {
+	{
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
 	.num = 0,
 	.aggregated = 1,
@@ -176,6 +201,15 @@ static const struct snd_soc_acpi_adr_device rt1712_3_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
+	{
+		.adr = 0x000030025d072201ull,
+		.num_endpoints = ARRAY_SIZE(rt722_endpoints),
+		.endpoints = rt722_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt713_0_single_adr[] = {
 	{
 		.adr = 0x000031025D071301ull,
@@ -367,6 +401,15 @@ static const struct snd_soc_acpi_link_adr mtl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_rt722_only[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
+		.adr_d = rt722_0_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr mtl_3_in_1_sdca[] = {
 	{
 		.mask = BIT(0),
@@ -568,6 +611,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt711-l0-rt1316-l23-rt714-l1.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = mtl_rt722_only,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt722-l0.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = mtl_rvp,
-- 
2.43.0

