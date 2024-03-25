Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45D88B39C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:13:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F01621DF;
	Mon, 25 Mar 2024 23:12:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F01621DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711404787;
	bh=Wywr4VA7AxafZFUyAAtsuXWMM3q95q02IaLHyvm6k1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lonG5AXkCX6XSPclbfcrQECYzb0YjjBzvf/wzzhiBkqmjyUaY155Nda+PtYqTt3tm
	 WRkfMssu/Wv4NlKvAIY9l8bygn8ZdK9TAI5EYGKVYxYlGj47tW56MwvWeB7FA4NbiH
	 CjbfD143yzgq72OP7vxkP62M0vb07bk8ldBAaKps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C069F8063A; Mon, 25 Mar 2024 23:11:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CFE9F80652;
	Mon, 25 Mar 2024 23:11:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEAEFF805D9; Mon, 25 Mar 2024 23:11:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65470F80236
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:11:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65470F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zjr2Gwuy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404684; x=1742940684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wywr4VA7AxafZFUyAAtsuXWMM3q95q02IaLHyvm6k1I=;
  b=Zjr2GwuyT8uALibPNpJqvP/X6VI17Awhf5/UY5AWVnh/vMyyrLT885su
   bqPP5aaK+2SugLO6+7fgXMcbV9vBeA2G9SZlpUDB1/6shIZZiqcVHRhwJ
   fQGJ7BloFwggCahIPbIvLVhOtDWalTEDfsFuyfE919a+tiSbOWMqx8O/K
   UTDRYA0TRkOUQbGGBSGST/9GkreKWOOGrFbhc1BxWwc1u6kykXcgsB0C/
   +0wRPQmLk2w5yh9SS+m7w9j/a2IMufKCcaL6uEPtvcjHGx9u9/tnrSA3Z
   kh8mt2HJX3ZLG6ExgDgMVuUNyb7V9PILHbQ47vmSoLKaN45YrycwPrOdZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643616"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="6643616"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 15:11:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000";
   d="scan'208";a="15722103"
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
Subject: [PATCH 04/21] ASoC: Intel: sof_da7219: add rpl_mx98360_da7219 board
 config
Date: Mon, 25 Mar 2024 17:10:42 -0500
Message-Id: <20240325221059.206042-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JEHV4RAPOZBAVFTSHLXIASBR6NKHDU2R
X-Message-ID-Hash: JEHV4RAPOZBAVFTSHLXIASBR6NKHDU2R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEHV4RAPOZBAVFTSHLXIASBR6NKHDU2R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

This configuration supports RPL boards which implement DA7219 on SSP0
and MAX98360A on SSP1. DA7219 uses PLL bypass mode to avoid WCLK
locking problem. To use this mode, the MCLK frequency must be 12.288
or 24.576MHz in the topology binary.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c               | 4 ++++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 6eb5a6144e97..290bf75bdaef 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -545,6 +545,10 @@ static const struct platform_device_id board_ids[] = {
 		.name = "adl_mx98360_da7219",
 		/* no quirk needed for this board */
 	},
+	{
+		.name = "rpl_mx98360_da7219",
+		/* no quirk needed for this board */
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 00a21af210fa..f797937cf9d8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -455,6 +455,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.drv_name = "rpl_lt6911_hdmi_ssp",
 		.sof_tplg_filename = "sof-rpl-nocodec-hdmi-ssp02.tplg"
 	},
+	{
+		.id = "DLGS7219",
+		.drv_name = "rpl_mx98360_da7219",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rpl_max98360a_amp,
+		.sof_tplg_filename = "sof-rpl-max98360a-da7219.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
-- 
2.40.1

