Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 880388B3B2A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:23:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DB1EEB1;
	Fri, 26 Apr 2024 17:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DB1EEB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714144983;
	bh=PuF4w6Ln2EhUy7cEQnbfcGAWOeZqMgiQxCSwhmlUlek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rXuLfhRGnv7hQdN5XQbmxfdUraJ8Z0cY9MfvdQ7npW8sMWA9sZUuNOUlWNHstGOLt
	 /YJF860ZqvTw1ZqP7MVZ/+n8jXq38Ct+IaWZ+cYZ8NzPjk5ObTtQbKYqDgcMZsrZvr
	 2BNncGwcil+7srmOQYUxLWwYKfPhoOCtUQgK5CYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1665AF805FB; Fri, 26 Apr 2024 17:22:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB910F80548;
	Fri, 26 Apr 2024 17:22:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A769DF805BE; Fri, 26 Apr 2024 17:21:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2486AF804B0
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2486AF804B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gjfwu4Ly
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144908; x=1745680908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PuF4w6Ln2EhUy7cEQnbfcGAWOeZqMgiQxCSwhmlUlek=;
  b=gjfwu4Lyi7Z63OEGVsnKy7/MBGm3swp3i482Hay/yy/UT2TkX7BFXL4z
   9mPcV4n34LCpqfBiDloKOWPNhCDid5lit5ypjcSKHjpbO8wtUe89ZaRNp
   LK2S1fH9tMKmZ8vzb7RZEiDk0Hpmm4T1uITEX1khtdpennTKygw6P/+/+
   Zwp1EtxZHv4U1/mpm8dxF0silR5ZKZyRWm+pWR3aJpjMDMyK6gLBcnfCq
   lrz2BPXAwXJFa2AN+35VB8nLD3RfdLH9vMnVkAAXHMNzraTMXsz2vyH7a
   8ExK81+ZdEgAqGL92GRyxmHs0vUhd7/tvau/jV94RlWpyKytUp9F0/EJF
   g==;
X-CSE-ConnectionGUID: Lxm7vLYnRd2M1Qf62cAbtw==
X-CSE-MsgGUID: kJslez1dSpKt/TzDXIJOOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290614"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290614"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:42 -0700
X-CSE-ConnectionGUID: o3pmswGHQIiEbQYdntSOJw==
X-CSE-MsgGUID: 61DS1Hl5R2Ozpi/Y5mDOtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259030"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Mac Chiang <mac.chiang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/12] ASoC: Intel: soc-acpi-intel-lnl-match: adds RT714 and
 RT1318 support
Date: Fri, 26 Apr 2024 10:21:16 -0500
Message-Id: <20240426152123.36284-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GCEOBX2UL6GQ3SJB3MHLMIXFYX5MD24T
X-Message-ID-Hash: GCEOBX2UL6GQ3SJB3MHLMIXFYX5MD24T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCEOBX2UL6GQ3SJB3MHLMIXFYX5MD24T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mac Chiang <mac.chiang@intel.com>

This patch adds support for corresponding codecs on LNL hardware
configuration:

SDW0: RT714 DMIC
SDW1: RT1318 Left Speaker
SDW2: RT1318 Right Speaker

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 74d6dcd7471f..0318c1a46f3c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -130,6 +130,33 @@ static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1318_1_group1_adr[] = {
+	{
+		.adr = 0x000130025D131801ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1318-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1318_2_group1_adr[] = {
+	{
+		.adr = 0x000232025D131801ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1318-2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
+	{
+		.adr = 0x000030025D071401ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt714_1_adr[] = {
 	{
 		.adr = 0x000130025D071401ull,
@@ -195,6 +222,25 @@ static const struct snd_soc_acpi_link_adr lnl_3_in_1_sdca[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_sdw_rt1318_l12_rt714_l0[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1318_1_group1_adr),
+		.adr_d = rt1318_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1318_2_group1_adr),
+		.adr_d = rt1318_2_group1_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt714_0_adr),
+		.adr_d = rt714_0_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -240,6 +286,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt722-l0.tplg",
 	},
+	{
+		.link_mask = GENMASK(2, 0),
+		.links = lnl_sdw_rt1318_l12_rt714_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-rt1318-l12-rt714-l0.tplg"
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_lnl_sdw_machines);
-- 
2.40.1

