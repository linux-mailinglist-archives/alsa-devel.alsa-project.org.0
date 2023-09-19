Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D4F7A5C7C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 10:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A47DAEA;
	Tue, 19 Sep 2023 10:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A47DAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695112095;
	bh=SdFFbhC/VcdqZI/WpPp/xZ/CoVrwDc9IOpQWX5AyUEM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nPWzpRevykreg/jjoJ/Nw4AePKWOeVZzRZq4Pov6/vs97Rgs3hPjbavWmg41xMfqS
	 ljvja39sQpmI8Vojag95MCXeSuXc/4pMnXIziTtSo8uHYyERHv5BBkpO6aGnY8vI43
	 g5jcBcg+988rFzNgsIpH+hBKFvjdLOhaiVj8jhik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D3FEF801F5; Tue, 19 Sep 2023 10:27:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA37F80125;
	Tue, 19 Sep 2023 10:27:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64F4EF801F5; Tue, 19 Sep 2023 10:27:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 999A7F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 10:26:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 999A7F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iPXfo/bH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695112017; x=1726648017;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SdFFbhC/VcdqZI/WpPp/xZ/CoVrwDc9IOpQWX5AyUEM=;
  b=iPXfo/bHs94mr9E9Pih3I4WaRfC/IGlde76v23kVcsYp6EJCU5gBP7qg
   Ys9Ue18YfIJUKzvoC0KwaIOA+lpWtVTEsEYV7ayRXlWudglHl7vv9obH3
   PPzx9i9H0mEGCzgJTxqkKnt2pJr96K4PiOTf3cd5GMysSJRdtq18vA1XH
   hsAbcUOflPNNbSKEOvrD8yxnnTAQclscXxvvPG0fxtk8RtY+/kPy51a8G
   qQaRIO9QFCvkunWGbGIL6slbzmzLmSpACfd7KaBxFBhwBb0fxaW99TvS3
   sfix6KD+ATB9762VO5iiv7450vjgILlcQKcUo3soAn9EIOSkamnhIiDMv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="379787641"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="379787641"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 01:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775455695"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="775455695"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 01:26:51 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: Intel: soc-acpi: fix Dell SKU 0B34
Date: Tue, 19 Sep 2023 16:36:06 +0800
Message-Id: <20230919083606.1920202-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FL27MDJVPPYHTMFHMMJXBTMB3O4JWKCT
X-Message-ID-Hash: FL27MDJVPPYHTMFHMMJXBTMB3O4JWKCT
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FL27MDJVPPYHTMFHMMJXBTMB3O4JWKCT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The rule for the SoundWire tables is that the platforms with more
devices need to be added first. We broke that rule with the Dell SKU
0B34, and caused the second amplifier for SKU 0AF3 to be ignored.

The fix is simple, we need to move the single-amplifier entry after
the two-amplifier one.

Fixes: b62a1a839b48 ("ASoC: Intel: soc-acpi: add tables for Dell SKU 0B34")
Closes: https://github.com/thesofproject/linux/issues/4559
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index b513eceb60c3..6e712ad954c8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -674,18 +674,18 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt1316-l2-mono-rt714-l3.tplg",
 	},
-	{
-		.link_mask = 0x3, /* rt1316 on link1 & rt714 on link0 */
-		.links = adl_sdw_rt1316_link1_rt714_link0,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-adl-rt1316-l1-mono-rt714-l0.tplg",
-	},
 	{
 		.link_mask = 0x7, /* rt714 on link0 & two rt1316s on link1 and link2 */
 		.links = adl_sdw_rt1316_link12_rt714_link0,
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt1316-l12-rt714-l0.tplg",
 	},
+	{
+		.link_mask = 0x3, /* rt1316 on link1 & rt714 on link0 */
+		.links = adl_sdw_rt1316_link1_rt714_link0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-adl-rt1316-l1-mono-rt714-l0.tplg",
+	},
 	{
 		.link_mask = 0x5, /* 2 active links required */
 		.links = adl_sdw_rt1316_link2_rt714_link0,
-- 
2.25.1

