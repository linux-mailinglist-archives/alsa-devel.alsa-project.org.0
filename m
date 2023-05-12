Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E92700DF6
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 19:36:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEE5C1D6;
	Fri, 12 May 2023 19:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEE5C1D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683912961;
	bh=gTaG7l8GHvuYiM6ICB2GytBt9/hvsNC2LDPPsZ9Uhq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MWGREVNdgvCCINvdQJILTHlbNZyICsAlQK8c0Vdo9Bxy5AnVx5mzgSamevhcoh5yq
	 pwxUdShIEynMRzeU555bDOG5K+0nXuN+BI2mbz3sw6S629Vdkt+PHskPS21EXOxh6/
	 GCrWc5eOuIXCQL/g3c4vK63HwJqb/R6CGa4JVLuk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C081F80588; Fri, 12 May 2023 19:34:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A993F80587;
	Fri, 12 May 2023 19:34:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A5DDF80578; Fri, 12 May 2023 19:33:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEBD1F8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 19:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEBD1F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UU9Y1Or7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683912828; x=1715448828;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gTaG7l8GHvuYiM6ICB2GytBt9/hvsNC2LDPPsZ9Uhq8=;
  b=UU9Y1Or7Pb6kmCsBYTmZn1tUzwBjFLv+RxE2DGGQLpeQ4SDXax5lOG8o
   nI+CYRs0Q+djcFuEyhcKUZuinizR+lZ7hA5J13jSvHHONVux4O/3sjzCb
   hz0Yra6XbLfnoB6QLrLmmHdWpoKNFUv33F1oCfr/jErCSZ3NFdCKW8FNn
   nNuL9f/876vMhCCxMlZGDHW8V4EWAthT8dHX50oloa6MKTedLH5X+mxfG
   x71cml6cfWVgcaKyxyu6lt7Up78SYUw2PF8amWFXQLtNVwjk8Bxoal41M
   PGo+5eTM28PKSBmmnmQp1sxkybAj5Qh6dhZXBLDaNX3VxF9X7Z87WrKbh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340164731"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="340164731"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:33:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="1030160314"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="1030160314"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:33:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 6/8] ASoC: Intel: sof_sdw: add new mapping for HP Spectre x360
Date: Fri, 12 May 2023 12:33:03 -0500
Message-Id: <20230512173305.65399-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512173305.65399-1-pierre-louis.bossart@linux.intel.com>
References: <20230512173305.65399-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MPYA25KAE65JAIF34N5JP4PUOXWCTUYB
X-Message-ID-Hash: MPYA25KAE65JAIF34N5JP4PUOXWCTUYB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MPYA25KAE65JAIF34N5JP4PUOXWCTUYB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A BIOS/DMI update seems to have broken some devices, let's add a new
mapping.

Link: https://github.com/thesofproject/linux/issues/4323
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e97cc769a11c..dbcae1d09c55 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -191,6 +191,20 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_SDW_PCH_DMIC |
 					RT711_JD1),
 	},
+	{
+		/*
+		 * this entry covers HP Spectre x360 where the DMI information
+		 * changed somehow
+		 */
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8709"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_SDW_PCH_DMIC |
+					RT711_JD1),
+	},
 	{
 		/* NUC15 'Bishop County' LAPBC510 and LAPBC710 skews */
 		.callback = sof_sdw_quirk_cb,
-- 
2.37.2

