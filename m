Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA2888B398
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:12:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC7362235;
	Mon, 25 Mar 2024 23:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC7362235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404753;
	bh=3Xj5RZRNSXKv7J/MxFQUJPFRkMs0lPtQcij8Y5QF8ws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QWgSsHKtbg3njDuKvFqQiVj1Ub32l5h1IcWq+KdCCsGX1zFATZ6gAxzoPZDV1yeL4
	 QMN0yTz5lte19wjf/Jdl1S7gHkROZJSwCBlDeKH3YYxUybLOLWAhFCzmXTcoG1s0p9
	 SQy+sAiL7aD5nd0Ethrmapz2TX7Z/x5ly4B7UK7w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A405EF80608; Mon, 25 Mar 2024 23:11:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33C0DF805F0;
	Mon, 25 Mar 2024 23:11:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D00FF805C0; Mon, 25 Mar 2024 23:11:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D015F80093
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D015F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EORT594r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404684; x=1742940684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Xj5RZRNSXKv7J/MxFQUJPFRkMs0lPtQcij8Y5QF8ws=;
  b=EORT594r65Bgq3YFmCgFTlcrGB29ULjwIzENgEa6nC+pP148eGN3U/rB
   duvsW0xYzJSBdYfHLGdUHd5vwSh5aidxQi0K1O+8NUMof6PXvA8boUBrF
   Dw5sRoLTtK0R69pDcP3+iV4CNpkxC/ZRfhQudVqQVETPkte/PT/uTIwcM
   7Lsg+nq4EOc4fcR8SOcilkxBZykpyO9MoW3+QzPZ4iTv/Yqk3fbTXKdiC
   GUSYGnQpAb6nKKV4r/HPm9o+h3R4YSCSHabBvXMXpLGYVIXbRjrDtcEOc
   lbYLlQzLzhij5o9XACq2vNVzYDc2mcaVGxypSx1oSpMidVqFlvTVP6WYy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643620"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643620"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722107"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/21] ASoC: Intel: sof_rt5682: support ALC5650 on RPL boards
Date: Mon, 25 Mar 2024 17:10:43 -0500
Message-Id: <20240325221059.206042-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HSEJSJBPUTLPHLAOPIKJP3AVVOLYY3Z5
X-Message-ID-Hash: HSEJSJBPUTLPHLAOPIKJP3AVVOLYY3Z5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HSEJSJBPUTLPHLAOPIKJP3AVVOLYY3Z5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

This commit supports RPL boards which implement ALC5650 dual I2S
interface codec.

SSP port usage:
  HP:  SSP0 -> AIF1
  SPK: SSP1 -> AIF2
  BT:  SSP2 -> BT

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index f797937cf9d8..c43e537e60d2 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -462,6 +462,11 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.quirk_data = &rpl_max98360a_amp,
 		.sof_tplg_filename = "sof-rpl-max98360a-da7219.tplg",
 	},
+	{
+		.id = "10EC5650",
+		.drv_name = "rpl_rt5682_def",
+		.sof_tplg_filename = "sof-rpl-rt5650.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
-- 
2.40.1

