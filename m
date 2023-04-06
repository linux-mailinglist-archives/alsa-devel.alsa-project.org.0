Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C33B6D9C85
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 17:38:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59497F06;
	Thu,  6 Apr 2023 17:37:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59497F06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680795505;
	bh=oTWdqAXAm0XU/iS8tZ9aO0Ba0sM8yPjs3zgmYUB2Atg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uoZ1+rsJrABFCE9Jc/8/nK4F4dN5yzDPm6NXtVNWra8PassBMNMvrmSfxQyNbutSL
	 Fh3wW8C6bhhtJnKG2JkONOB+0du0cxZJsOoMCFizA6DbGusC/Wz1kzlxICFZ0XyRiZ
	 GyCrWGplXiokeDyNz6abXioxgKg99anHMpzxz2/g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B026FF80171;
	Thu,  6 Apr 2023 17:37:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00E81F80246; Thu,  6 Apr 2023 17:37:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23BE2F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23BE2F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YLRkCQaC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680795448; x=1712331448;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oTWdqAXAm0XU/iS8tZ9aO0Ba0sM8yPjs3zgmYUB2Atg=;
  b=YLRkCQaCqqk5jSrv4rUZXxEsdrndunXfSWofCHx9AIdrdUk0HP7S5s54
   SpU2omRD3APo7XfZYrSXJv1WmlLS81IXXlokBj0K5arhVwFGZtpyH49FW
   9bPp7M24xDSiVg/yZqcDUn5V4NNNh6uMUImOq4t17xch15vWH3yNYK5ua
   j5MNee9+KgT2QvlME8t2ek+8kRD4LZLdpANzNUSQAM62qPG7D1GlL91vX
   ChT+88/39ybpttSF8ba1MtC1afTr988FXBhI8r1L0aI19cntw72lEppWz
   BR8llJpwR8xwM4pcSRhbkhftsqnXiqsw9L3H64LxDrKurZgzZBUBK4G/+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323141636"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="323141636"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="1016909225"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400";
   d="scan'208";a="1016909225"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.83.247])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2023 08:37:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: Add rpl_mx98360_rt5682 driver
Date: Thu,  6 Apr 2023 10:37:02 -0500
Message-Id: <20230406153703.17194-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2LQC433CLB4YABEKPLVJLCXX4SIBGWZR
X-Message-ID-Hash: 2LQC433CLB4YABEKPLVJLCXX4SIBGWZR
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org,
 Curtis Malainey <cujomalainey@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LQC433CLB4YABEKPLVJLCXX4SIBGWZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Curtis Malainey <cujomalainey@chromium.org>

Boards were using this in older kernels before adl and rpl ids were
split. Add this back to maintain support.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c             | 11 +++++++++++
 .../soc/intel/common/soc-acpi-intel-rpl-match.c | 17 +++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 8735519cf4ed..791a59c5f00d 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1116,6 +1116,17 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "rpl_mx98360_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{
 		.name = "mtl_mx98357_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 07f96a11ea2f..13cbd8e9d41f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -284,7 +284,24 @@ static const struct snd_soc_acpi_link_adr rpl_sdw_rt1316_link12_rt714_link0[] =
 	{}
 };
 
+static const struct snd_soc_acpi_codecs rpl_rt5682_hp = {
+	.num_codecs = 2,
+	.codecs = {"10EC5682", "RTL5682"},
+};
+
+static const struct snd_soc_acpi_codecs rpl_max98360a_amp = {
+	.num_codecs = 1,
+	.codecs = {"MX98360A"},
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
+	{
+		.comp_ids = &rpl_rt5682_hp,
+		.drv_name = "rpl_mx98360_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rpl_max98360a_amp,
+		.sof_tplg_filename = "sof-rpl-max98360a-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
-- 
2.37.2

