Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1465720A5B
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:31:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA3D7206;
	Fri,  2 Jun 2023 22:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA3D7206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737880;
	bh=yWDb3PTVtNifPI3I7lBZwI++TdKsSrNta+K3hlEdSIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c3ltbqK7TUoAknNIH0Q7CmWJKQM6djKdVyVDsXRlW6vFdTffICavRSCbQFb5tm+zA
	 g5Edv2GzgrWYe67uscSbxMnZNer4uMQ47BrcBr1b/wnm2cQu2hN8zNY2eB/S+TZ8Hb
	 moWy5NF3ZWzhkfKiauwn9R1U7+tzyy6WaCW0DiOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CCC5F806AC; Fri,  2 Jun 2023 22:24:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 536F7F806AB;
	Fri,  2 Jun 2023 22:24:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FF86F80634; Fri,  2 Jun 2023 22:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAF51F80580
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAF51F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iB+1eVb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737400; x=1717273400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yWDb3PTVtNifPI3I7lBZwI++TdKsSrNta+K3hlEdSIw=;
  b=iB+1eVb7sDjlBpfyUODtU1RZ/wIj+QxyacTTBIR79bw8Np0ka+HrZRDn
   zIm/WJXbJuU7Evu6hFf0bhkHtXdLW8M1XZK5kN7FEJKLMK4HDmArmLqxr
   QKazha+rgz+GIlgaVlrkI4NIcvqArc6ZYl2wlNmFdHWf8te4oAV9JkoW4
   xxf5sxbUDQIOOMjd6YFflGsxP7dm294H8gd4fKowRGMj536gH429CwLR6
   9jUp3CPcgTYcjNMp6rsD/9fokVdOigwvkTNkS6qd7FlvxEmf3V6ugyuuD
   E9A+Z4X26aZW352OglJh0DsXgmxL6YvPzjZAXF9K40ToN5E0c/taynL8A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811361"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811361"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020065"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020065"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 28/28] ASoC: Intel: soc-acpi: add Rex CS42l42 and MAX98363
 SoundWire entries
Date: Fri,  2 Jun 2023 15:22:25 -0500
Message-Id: <20230602202225.249209-29-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z73BW5W5ZL5TQUAA54H7M2N7GT2DQSGU
X-Message-ID-Hash: Z73BW5W5ZL5TQUAA54H7M2N7GT2DQSGU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z73BW5W5ZL5TQUAA54H7M2N7GT2DQSGU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uday M Bhat <uday.m.bhat@intel.com>

Add support to the following daughter card for rex:

SDW0: CS42l42 Headset
SDW2: MX98363 Speaker

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 2c2bece6cd77..3d5cf8867926 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -220,6 +220,45 @@ static const struct snd_soc_acpi_link_adr mtl_3_in_1_sdca[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_adr_device mx8363_2_adr[] = {
+	{
+		.adr = 0x000230019F836300ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "Left"
+	},
+	{
+		.adr = 0x000231019F836300ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "Right"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs42l42_0_adr[] = {
+	{
+		.adr = 0x00001001FA424200ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "cs42l42"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr cs42l42_link0_max98363_link2[] = {
+	/* Expected order: jack -> amp */
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l42_0_adr),
+		.adr_d = cs42l42_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(mx8363_2_adr),
+		.adr_d = mx8363_2_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -265,6 +304,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-sdw-rt5682-l2-max98373-l0.tplg",
 	},
+	{
+		.link_mask = BIT(0) | BIT(2),
+		.links = cs42l42_link0_max98363_link2,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-sdw-cs42l42-l0-max98363-l2.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_sdw_machines);
-- 
2.37.2

