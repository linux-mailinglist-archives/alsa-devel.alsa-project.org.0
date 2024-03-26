Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EB788C8AA
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:11:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169D72BDC;
	Tue, 26 Mar 2024 17:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169D72BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469467;
	bh=sTf7iewjShTLIpZ76HtMb1ZNJ2Egbdu079zsrWu6ef0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZY+d8NTsHFGXbQ51UonbiLgd/DClx+YiN+e9T/IogAKqaL+QFn9Ma0UExIyn6/A64
	 gM4jsd9Xl3K3q5n2vE7FknaDXzCB2AxcVJ7HD1klhRnQXRvIZhGPWGRPu8r9tTG49x
	 fXhldGOZ5FiubVU4CSfRVeXyP+23qJ2LSjkumDpc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9344F80CB8; Tue, 26 Mar 2024 17:06:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE3AF805F4;
	Tue, 26 Mar 2024 17:06:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB5C5F8060E; Tue, 26 Mar 2024 17:06:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C468BF8058C
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C468BF8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=alWtLEV5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469144; x=1743005144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sTf7iewjShTLIpZ76HtMb1ZNJ2Egbdu079zsrWu6ef0=;
  b=alWtLEV5obqfbJwkiOrrNoJ/bED0LOVebQ5a0GCDMzVjQ3tHDP/i6tMQ
   rvYsNeQiD5bThNAfH1W/mtsZ5sBJVLznjnB2utstc2g+4DrSNSBWmNE3Y
   FA80i6SM8c+4p3ui/5FsJWitYxa9L4vA2cLSfsmvK1iWBeFzJrJjf7bTp
   GAA8+pAOgBOJXoMijnf/7LDdTiJwpHblBeUAttC8p1zruXIZRJTk0JAPh
   GV0IuackV4kvIRvyfzACGg7GL2OEBWQAwLdkos0aZlrYv7Z2oF/E9IAtt
   G6+4gDOFTrcuT/SION+a8sq0yfHjM24POedfGPb57kdeiC+h7LqqZMTdL
   Q==;
X-CSE-ConnectionGUID: 9/TaSgQ3ST6JbnwuYPqdhQ==
X-CSE-MsgGUID: ebFIhWwYTSiKsAafZfII+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260448"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260448"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482289"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/34] ASoC: intel: soc-acpi: Add missing cs42l43 endpoints
Date: Tue, 26 Mar 2024 11:04:12 -0500
Message-Id: <20240326160429.13560-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WB2UYDOYHWQEBJNXNVRCFWG56T5UCNGZ
X-Message-ID-Hash: WB2UYDOYHWQEBJNXNVRCFWG56T5UCNGZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WB2UYDOYHWQEBJNXNVRCFWG56T5UCNGZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Currently the cs42l43 just specifies a single endpoint, as the current
machine driver only looks at the first endpoint specified. Future
refactoring will process all endpoints, as such proper specification
should be added for all the cs42l43 endpoints.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 25 +++++++++++++++++--
 .../intel/common/soc-acpi-intel-tgl-match.c   | 25 +++++++++++++++++--
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index e9a5da079089..e06efc5b1457 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -338,11 +338,32 @@ static const struct snd_soc_acpi_link_adr mtl_712_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
+	{ /* Jack Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Jack Capture Endpoint */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_0_adr[] = {
 	{
 		.adr = 0x00003001FA424301ull,
-		.num_endpoints = 1,
-		.endpoints = &single_endpoint,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
 		.name_prefix = "cs42l43"
 	}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 0fba0a60d9c7..007f1ac2327a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -414,11 +414,32 @@ static const struct snd_soc_acpi_link_adr tgl_712_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_endpoint cs42l43_endpoints[] = {
+	{ /* Jack Playback Endpoint */
+		.num = 0,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* DMIC Capture Endpoint */
+		.num = 1,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+	{ /* Jack Capture Endpoint */
+		.num = 2,
+		.aggregated = 0,
+		.group_position = 0,
+		.group_id = 0,
+	},
+};
+
 static const struct snd_soc_acpi_adr_device cs42l43_3_adr[] = {
 	{
 		.adr = 0x00033001FA424301ull,
-		.num_endpoints = 1,
-		.endpoints = &single_endpoint,
+		.num_endpoints = ARRAY_SIZE(cs42l43_endpoints),
+		.endpoints = cs42l43_endpoints,
 		.name_prefix = "cs42l43"
 	}
 };
-- 
2.40.1

