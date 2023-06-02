Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FAE720A4A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:29:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD5C3950;
	Fri,  2 Jun 2023 22:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD5C3950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737752;
	bh=aP0XQqDpFQ05QGlxfQ8OGNlcy+7JxQvcw5KcWL+kiUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XxsBig9rFD8eOBshcdp7H1sxcZALdpKHrwtWALFOR/kj46fQCru7ASEMznlc1R5uv
	 WXxCKrasHVZt56LDzA9o7InEhvw74OBRwoGcbxMKklluH8eg57iIGwxI91MSpG22h0
	 Agj5UIkb3rtdBFhpBFYE7pEGtUOgo54mzAgZ67IY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02C8FF80634; Fri,  2 Jun 2023 22:24:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1B1DF805B1;
	Fri,  2 Jun 2023 22:24:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D722F8060A; Fri,  2 Jun 2023 22:23:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF293F8055C
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF293F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M6LJZkVs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737395; x=1717273395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aP0XQqDpFQ05QGlxfQ8OGNlcy+7JxQvcw5KcWL+kiUA=;
  b=M6LJZkVspvGDcJKOw/fqqSy/QiHLkTJzCW48K5n/HtZzXy47Yz2WmBIU
   dwXuH+4cfoiIPc7AA4mHfCEREaA6DC2nKlxw4zAZbRNmNL2NYogoKk9nc
   Y12/79lVbbpZ+Su5r57E7QBArfPb+kI5QNyQ01Qw9i55A2/XKHbGvODYw
   9K2zi9OQyMy6IzwMYo07eiYrxVnUicU1kFQG8aGCqwiUfGEzffkEH3G5p
   0nR5SrCf4l53uyfOC77aWI2Em/zPHZf9zW+U9HZdV8cE/j4reSV2hWvyc
   PkFjp2A3lIDX48Vc9nzYjPHFfKQHFcGQiKfTtJJNbruN8ttHw4L/leLzN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811314"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811314"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020041"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020041"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Terry Cheong <htcheong@chromium.org>,
	Curtis Malainey <cujomalainey@chromium.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 22/28] ASoC: Intel: Add rpl_rt1019_rt5682 driver
Date: Fri,  2 Jun 2023 15:22:19 -0500
Message-Id: <20230602202225.249209-23-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BBTFVVR7AD2Z7RQCM7OYOBVLOFW574MM
X-Message-ID-Hash: BBTFVVR7AD2Z7RQCM7OYOBVLOFW574MM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBTFVVR7AD2Z7RQCM7OYOBVLOFW574MM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Terry Cheong <htcheong@chromium.org>

Boards were using this in older kernels before adl and rpl ids were
split. Add this back to maintain support.

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Terry Cheong <htcheong@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               | 11 +++++++++++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 12 ++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 7f4783592668..86bbc1fea6ff 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1119,6 +1119,17 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "rpl_rt1019_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1019_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{
 		.name = "mtl_mx98357_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 4dc9ba70f481..302a08018572 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -332,6 +332,11 @@ static const struct snd_soc_acpi_codecs rpl_max98373_amp = {
 	.codecs = {"MX98373"}
 };
 
+static const struct snd_soc_acpi_codecs rpl_rt1019p_amp = {
+	.num_codecs = 1,
+	.codecs = {"RTL1019"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	{
 		.comp_ids = &rpl_rt5682_hp,
@@ -347,6 +352,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.quirk_data = &rpl_max98373_amp,
 		.sof_tplg_filename = "sof-rpl-max98373-nau8825.tplg",
 	},
+	{
+		.comp_ids = &rpl_rt5682_hp,
+		.drv_name = "rpl_rt1019_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rpl_rt1019p_amp,
+		.sof_tplg_filename = "sof-rpl-rt1019-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
-- 
2.37.2

