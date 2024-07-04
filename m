Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 973CB92727A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 11:00:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FC51E7F;
	Thu,  4 Jul 2024 11:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FC51E7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720083656;
	bh=bfvc5FLaFeKYhbLLxS6MoY6PRX1DIf6hUoi6GjD3luQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eD14+TgX8UFt6nEfuSR3mA6y//gSfJJGm8TjxkW+JQSKk4pnCX892O0Mx3snh9hEm
	 NNqISNVs5oYIAPz/D/3ilXj1cL5Za5PlmcKM9C0tlauH3BHybYJiapNs7onXhvBKXw
	 OJBbF6vivVVPHmG7/L7eXN//OYw43W+yBHRLPDCg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACF1BF806C1; Thu,  4 Jul 2024 10:59:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 831D3F806A2;
	Thu,  4 Jul 2024 10:59:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DFC6F8025E; Thu,  4 Jul 2024 10:56:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 739E9F80301
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 10:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 739E9F80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jc1T7JzQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720083250; x=1751619250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bfvc5FLaFeKYhbLLxS6MoY6PRX1DIf6hUoi6GjD3luQ=;
  b=jc1T7JzQl5jlHxgktLVUfq201LAY3f3LubfBcoMtEwIT9/FO9Smqotun
   4DBuhAMGtpNMKJALMO8qBoSDshRHEAoUY/Jcqy1z5lDbeoYw7f/PVkbPQ
   KFokz2l/nv+/nn8Emn/3TFmpfY63iHQIcOQMX6vKaa3//Q5Ydsqe0lerN
   DDcnXMBBq8Xf1OcbtzoJJz419SZb7fxkgYamFOruWEnuDHkWSENxDejoG
   bEg9IRj8sOJGxfGcekYnRPcIKrUVpACL25y94VYWIKcZBbMIKyre01Z+w
   dsU+7WruUSYPw6YsyLWXDJgjESi8Cuv97PRYcBdc2GfGjg+9Jl2qoXiTF
   A==;
X-CSE-ConnectionGUID: 3B6jKkTZR/avvup2UhBDzw==
X-CSE-MsgGUID: WFE3KRG2R9uK3Mq3f6JxnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17300641"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="17300641"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:54:05 -0700
X-CSE-ConnectionGUID: 3mW3Ax9FR7CK9fSQbNPv/g==
X-CSE-MsgGUID: pQGtUe3PTnqCpJ8HA0ipnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="51708624"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.90])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:54:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v3 6/6] ASoC: Intel: soc-acpi-intel-ptl-match: add rt722 l3
 adr
Date: Thu,  4 Jul 2024 10:53:30 +0200
Message-ID: <20240704085330.371332-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240704085330.371332-1-pierre-louis.bossart@linux.intel.com>
References: <20240704085330.371332-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q6L6SL4CKMFBG65M4MDDXDK4FMFBVYFN
X-Message-ID-Hash: Q6L6SL4CKMFBG65M4MDDXDK4FMFBVYFN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6L6SL4CKMFBG65M4MDDXDK4FMFBVYFN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Add rt722 support on SoundWire link 3.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index d01646f52d1f..8a0c3aa8efaa 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -65,6 +65,15 @@ static const struct snd_soc_acpi_adr_device rt722_0_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt722_3_single_adr[] = {
+	{
+		.adr = 0x000330025d072201ull,
+		.num_endpoints = ARRAY_SIZE(rt722_endpoints),
+		.endpoints = rt722_endpoints,
+		.name_prefix = "rt722"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
 	{
 		.mask = BIT(0),
@@ -74,6 +83,15 @@ static const struct snd_soc_acpi_link_adr ptl_rt722_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_rt722_l3[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt722_3_single_adr),
+		.adr_d = rt722_3_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -116,6 +134,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-rt722-l0.tplg",
 	},
+	{
+		.link_mask = BIT(3),
+		.links = ptl_rt722_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt722-l3.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
-- 
2.43.0

