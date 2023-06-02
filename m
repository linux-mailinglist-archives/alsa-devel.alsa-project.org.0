Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66891720A41
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:27:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE6291F4;
	Fri,  2 Jun 2023 22:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE6291F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737627;
	bh=I7AZuLYjtek0HesdZ1llCjFj/vTISX1WIUFVoA+3774=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iX7wYbnPq9AobKk6wo5u9RL1gIoMZCr1ShYMLedSAPwf4u7dF/AcF+2bb7ry2F/9h
	 fox04Xf/fTnu19z+FSVBUgniugqVEbhI9utPe4U3MJf2fLF6vvtbs+R6zq9LZuusyP
	 olmZrXKG7HFqmWHp+tO3OpYn26T15M1R7gjTCAWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74A13F805FD; Fri,  2 Jun 2023 22:23:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 254B3F80149;
	Fri,  2 Jun 2023 22:23:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE805F80553; Fri,  2 Jun 2023 22:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4216EF80553
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4216EF80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ic6AFD2O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737392; x=1717273392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I7AZuLYjtek0HesdZ1llCjFj/vTISX1WIUFVoA+3774=;
  b=Ic6AFD2Oa3nTUTrYe+UydtKRB6bHGT/f2AsfLM+snPIZaDr6RwVYsT4s
   2OzY4EBn7mO+CF7Ond/Nj5mFzDilN8uNNeVqy9z8J6H+mqp22Q+FZnCzd
   dfljgCP9Q+V12a7hH0MwmLuMONZVEtSS+HXgQfva+Be4HHEVqGXodfuAT
   mx8OucCjYxfmZTyCLaHcAw7VSJm+Jif4nNhWITkzi4liQcWWkGm1lWhST
   jzo2mBg4QKRPC/tO/OcTkz1wrmWNluFeFTrrKTgdk9Y65H0XSMcKTfvF6
   zPbve1CZkIHC3s5+Ho499AFLGpva9c24SJCF6L4w0t5dPzKIgKOq7d7LE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811280"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811280"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020029"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020029"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 17/28] ASoC: Intel: soc-acpi: add tables for Dell SKU 0B34
Date: Fri,  2 Jun 2023 15:22:14 -0500
Message-Id: <20230602202225.249209-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VB33DPK535RBTTCBOJR63BYQKNQOVI42
X-Message-ID-Hash: VB33DPK535RBTTCBOJR63BYQKNQOVI42
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VB33DPK535RBTTCBOJR63BYQKNQOVI42/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Yet another permutation of devices.

Closes: https://github.com/thesofproject/linux/issues/4399
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index d8c80041388a..ac18a6c83a4e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -133,6 +133,15 @@ static const struct snd_soc_acpi_adr_device rt1316_1_group2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_1_single_adr[] = {
+	{
+		.adr = 0x000130025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1316_2_single_adr[] = {
 	{
 		.adr = 0x000230025D131601ull,
@@ -312,6 +321,20 @@ static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link12_rt714_link0[] =
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link1_rt714_link0[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_single_adr),
+		.adr_d = rt1316_1_single_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt714_0_adr),
+		.adr_d = rt714_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link2_rt714_link3[] = {
 	{
 		.mask = BIT(2),
@@ -620,6 +643,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt1316-l2-mono-rt714-l3.tplg",
 	},
+	{
+		.link_mask = 0x3, /* rt1316 on link1 & rt714 on link0 */
+		.links = adl_sdw_rt1316_link1_rt714_link0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt1316-l1-mono-rt714-l0.tplg",
+	},
 	{
 		.link_mask = 0x7, /* rt714 on link0 & two rt1316s on link1 and link2 */
 		.links = adl_sdw_rt1316_link12_rt714_link0,
-- 
2.37.2

