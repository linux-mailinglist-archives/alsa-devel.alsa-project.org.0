Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235666E823C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A665FF16;
	Wed, 19 Apr 2023 21:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A665FF16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681934324;
	bh=9v9ZarbvgVm/nqh3t36oBi7X/oFk5g4InTITr9lxgVg=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E2KqQ2+n7rA/XDWlrJkvkLZqh/YaC+C1pMmgG2yAcEAZ/CMhD8KjO9vs2cCKZVcKx
	 2liBU4JOGKJmabw93peAKHPeoDJGKvj58/RrxJAUxtGIkYlmifnWgr2khqSf6oGxN3
	 3ayihdTTPYE+S5ynI20hwsPA6qz+fSvchk1GhgqU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E56DF80558;
	Wed, 19 Apr 2023 21:56:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6039F80544; Wed, 19 Apr 2023 21:56:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF128F8019B
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 21:56:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF128F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DE3s6Nfy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681934165; x=1713470165;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9v9ZarbvgVm/nqh3t36oBi7X/oFk5g4InTITr9lxgVg=;
  b=DE3s6NfyKNVncjlJg1tOtfsMcdLtOG2P1sPTQ0KGBWbqT3dBqAwuwq/j
   mu7YU3l+owyhQhcPnCbMeGy06VIFUDUMtEheGWLSlWAjRVnIBBZ9FM+5L
   Pqm7cwtiLhhwHYRSlJmIIxqToUZ8VF8WxJVJc4KUdihyJUTOZK345o6jl
   v/NlfNSYd/4dPMY6LF12Z9/bFMI0NY+zihS4268NlYoMbe7LsUyu67X4t
   cESv+79tON7qgH1aoAHKdw2jdRsPhP2bkLxUf10+aIlNKmw5FBT2sJTPA
   X/leYqQgZ44hoHFLBT9qRFPLvmwzyOfLJafPoO2kY5WloQewsbQSpMZIi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373434386"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="373434386"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:56:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815728098"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="815728098"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.74.38])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:56:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/7] ASoC: Intel: soc-acpi: Add entry for rt711-sdca-sdw at
 link 2 in RPL match table
Date: Wed, 19 Apr 2023 14:55:19 -0500
Message-Id: <20230419195524.46995-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
References: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EIZ7VBW2SPTXWXQJ7DEGIJO7ZLTYLW2Y
X-Message-ID-Hash: EIZ7VBW2SPTXWXQJ7DEGIJO7ZLTYLW2Y
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org, apoorv <apoorv@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIZ7VBW2SPTXWXQJ7DEGIJO7ZLTYLW2Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: apoorv <apoorv@intel.com>

RT711 sdca sdw is added with SDW2 link for RPL-P CRB platform.

Signed-off-by: apoorv <apoorv@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../soc/intel/common/soc-acpi-intel-rpl-match.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 13cbd8e9d41f..749d371a86ae 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -284,6 +284,15 @@ static const struct snd_soc_acpi_link_adr rpl_sdw_rt1316_link12_rt714_link0[] =
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr rplp_crb[] = {
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt711_sdca_2_adr),
+		.adr_d = rt711_sdca_2_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_codecs rpl_rt5682_hp = {
 	.num_codecs = 2,
 	.codecs = {"10EC5682", "RTL5682"},
@@ -348,7 +357,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[] = {
 		.link_mask = 0x1, /* link0 required */
 		.links = rpl_rvp,
 		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-rpl-rt711.tplg",
+		.sof_tplg_filename = "sof-rpl-rt711-l0.tplg",
+	},
+	{
+		.link_mask = 0x4, /* link2 required */
+		.links = rplp_crb,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-rpl-rt711-l2.tplg",
 	},
 	{},
 };
-- 
2.37.2

