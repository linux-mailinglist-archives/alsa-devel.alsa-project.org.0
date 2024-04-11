Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 072288A21B7
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 00:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBF372BF5;
	Fri, 12 Apr 2024 00:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBF372BF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712874347;
	bh=Kbiv77vxQq3VJjGZ7RvYiy7zJq+A+aZfJkXlW/grBDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lGgZHKQgBWK9tya+jb648xMjAG0cNMwCFJsghNfoUgSM48qypBzWnWD13/onG62D2
	 a/Z8DT9RUj0BhpTkPt4dYAUqQmzeQ8DDNDHFrAX5tLpVt3dTfDEOcjdKBPvVbVDcmf
	 +zdObPKRx6M6pV9hMOAtXQJzZpfWMLPkmSCCfIjE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56FECF805AE; Fri, 12 Apr 2024 00:25:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7067CF805B4;
	Fri, 12 Apr 2024 00:25:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5037DF800C9; Fri, 12 Apr 2024 00:14:25 +0200 (CEST)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AA69F8026D
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 00:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AA69F8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WVLgeQPm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873062; x=1744409062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kbiv77vxQq3VJjGZ7RvYiy7zJq+A+aZfJkXlW/grBDc=;
  b=WVLgeQPmtMVsSnlfsDWmcjyulG/N4t7k0qiWaSrntdjtqup1lI9IgbHy
   CA0FZfPuTUc0ggcnZSkpq2fqqiU1SYgsXlaxcyL/mNUlEWWwX107lRDVA
   e2Gd5ojmB1/VGkM1PEkNOAcxnpUJIpOIwnhiAOiFxJrndBFj0oaoec95x
   /pR5pkPB2B1d/SI944mbf56+v7W1iA09NKHtqQiB7A8hOvD1ghwZrMsA7
   29RqI6dsjaVce/B4HUft3uDgKZy1BxtkYM/nKUq4uwc9XpuBthAVV2qh7
   2ltFmiI1ywOCpwWdA8C0EOazHdVIyCoEq+RDfXXNYVNDSMtvS4TAIwywW
   Q==;
X-CSE-ConnectionGUID: 4Ux0iriwSAupPNQBXZnobw==
X-CSE-MsgGUID: 13buQPNQQFu29a/9oalalA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708340"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="19708340"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:13 -0700
X-CSE-ConnectionGUID: n0ovwgHsTQKoQzRwtPERSQ==
X-CSE-MsgGUID: iX8eRg2NTPW/XSnD8RtMfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000";
   d="scan'208";a="21628715"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 15:04:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/12] ASoC: Intel: soc-acpi: add support for HP Omen14
 SoundWire configuration
Date: Thu, 11 Apr 2024 17:03:37 -0500
Message-Id: <20240411220347.131267-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IZKS7GZV2IIC3WVVOGXOJR7GFZPILNCJ
X-Message-ID-Hash: IZKS7GZV2IIC3WVVOGXOJR7GFZPILNCJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZKS7GZV2IIC3WVVOGXOJR7GFZPILNCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This platform has an RT711-sdca on link0 and RT1316 on link3

Closes: https://github.com/thesofproject/linux/issues/4880
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 75935b454e5d..264f5c19af56 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -296,6 +296,15 @@ static const struct snd_soc_acpi_adr_device rt1316_2_group2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_3_single_adr[] = {
+	{
+		.adr = 0x000330025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1318_1_group1_adr[] = {
 	{
 		.adr = 0x000130025D131801ull,
@@ -562,6 +571,20 @@ static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1316_l12[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_rt711_l0_rt1316_l3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1316_3_single_adr),
+		.adr_d = rt1316_3_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device mx8363_2_adr[] = {
 	{
 		.adr = 0x000230019F836300ull,
@@ -703,6 +726,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt711-l0-rt1316-l23-rt714-l1.tplg",
 	},
+	{
+		.link_mask = 0x9, /* 2 active links required */
+		.links = mtl_rt711_l0_rt1316_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt711-l0-rt1316-l3.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = mtl_rt722_only,
-- 
2.40.1

