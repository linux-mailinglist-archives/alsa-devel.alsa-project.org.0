Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A23C6720A43
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4B9B826;
	Fri,  2 Jun 2023 22:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4B9B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737657;
	bh=9iyj+WGoP838INCOMe9ikFDwGCH9jGUXiFbPzfgl9d8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CciLXuLpy5LPEjJTfEk2SaOszOijQYnnzKAUU/o2qJuwXTQFAeZcRKISLkn2dL2lF
	 HMjqXcra2TH6xvXvPWlWimEgKTn16fU7hhko/vLDRj0iHzq3pgM4BPWLlyNUpXM6CO
	 YcxigY9U4W0rDZszMrYW0lU9/tiBK4e1Rjh6hGdg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88798F80603; Fri,  2 Jun 2023 22:24:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C26FF80603;
	Fri,  2 Jun 2023 22:23:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33547F80527; Fri,  2 Jun 2023 22:23:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEF15F80552
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEF15F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Gakb5Cxy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737392; x=1717273392;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9iyj+WGoP838INCOMe9ikFDwGCH9jGUXiFbPzfgl9d8=;
  b=Gakb5Cxygg+GKnG+R+Hs+l/yQPnH+1qCYFLqRfojAf0aXKddpHwTk44c
   dTVY5A1j+2qvVOVu7v9CFhCQd4oS7O2UokZzyFAqCy21MBHQzZfJElGxC
   8+/cLtWw0kYDOZcp9oiari1zwmDZqYtSJEKax3Rc/8YAUiQZT42SdYjHD
   rR8nElL1w1pUOvQM4Uth+Qj0PDJBePZehWCFMeh0Sb/VLD3j8HOz1mG7l
   v6eHmILYV1/RYXHQk8lV/wsBC+m+yKT/6S8u+n+VGY+pe5NLpPx6jBGdg
   l/mwPsxpw1KQQSJj6jcW3lXsoAg1eD253T5q33EOkA2Zz8lclrhIwYusX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811274"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811274"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020027"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020027"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 15/28] ASoC: Intel: soc-acpi: add table for RPL Dell SKU 0BDA
Date: Fri,  2 Jun 2023 15:22:12 -0500
Message-Id: <20230602202225.249209-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YGBR2XUOBP4QSB5KNVZDK7XUVFT7DKQR
X-Message-ID-Hash: YGBR2XUOBP4QSB5KNVZDK7XUVFT7DKQR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGBR2XUOBP4QSB5KNVZDK7XUVFT7DKQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a standard configuration we've seen before for TGL.

Closes: https://github.com/thesofproject/linux/issues/4380
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-rpl-match.c   | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index c61d654eb1e2..4dc9ba70f481 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -179,6 +179,30 @@ static const struct snd_soc_acpi_link_adr rpl_sdca_3_in_1[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link0_rt1316_link12_rt714_link3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1316_1_group1_adr),
+		.adr_d = rt1316_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1316_2_group1_adr),
+		.adr_d = rt1316_2_group1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt714_3_adr),
+		.adr_d = rt714_3_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr rpl_sdw_rt711_link2_rt1316_link01_rt714_link3[] = {
 	{
 		.mask = BIT(2),
@@ -341,6 +365,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-rpl-rt711-l2-rt1316-l01-rt714-l3.tplg",
 	},
+	{
+		.link_mask = 0xF, /* 4 active links required */
+		.links = rpl_sdw_rt711_link0_rt1316_link12_rt714_link3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-rpl-rt711-l0-rt1316-l12-rt714-l3.tplg",
+	},
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = rpl_sdw_rt711_link0_rt1318_link12_rt714_link3,
-- 
2.37.2

