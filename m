Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2876A330
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:45:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 205C3DEB;
	Mon, 31 Jul 2023 23:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 205C3DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839922;
	bh=aA9Ehm7wWJqwjJD3ouu/0FyX0BMaApF/VsxrtiUtTOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WT9u/UnNH/5/leDw7wQOwNhmuWmSCzDKrpmiDToNNsq7qBrA2eSAVlbrCWQ1GgVJL
	 4OqLjnNPDS8Rt8j3MvluvyyizrFlvYIoSx0wVw9WmWrK76+IpKXbKsiqx5omPLI/C3
	 4Yui4dFW79VM6hz+EKs/6ABEUxfkFwPz6zNUZ/wU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9193AF805AE; Mon, 31 Jul 2023 23:43:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA13F8015B;
	Mon, 31 Jul 2023 23:43:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81185F8055A; Mon, 31 Jul 2023 23:43:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 211BDF8016D
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 211BDF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S8RS3drb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839794; x=1722375794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aA9Ehm7wWJqwjJD3ouu/0FyX0BMaApF/VsxrtiUtTOE=;
  b=S8RS3drbQDYGpoDUjqS3y1xNXzZVt8IKK504JI013U/Wd0wJZsC4a99c
   1pco+X0D2S2Xa1o0C60J2G1EcDIh6yG73sdOGCpoAJzSnZW0MGbFbGPmx
   PUHHiZv0kiI9EbV0FPZOmsg5FR6EaaTtZqqX1zNROfjeXk4yJypn3oY1r
   1RM2hxo7pPTBmW7l/ZWIqsnWvqZbroIkuvSDet7hAB973dF8OA4rzwE+k
   OF+6Xabpzj+9C4wtrg8B6dcJshzs3ctTidIfe10us2kE9cP0VziS/fD6k
   U1PQU+AjH7Lq7WLQKmODfUMpocW72yLQHfeJrqDsCxA8fPOLMOQpXG0tc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449732"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449732"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523520"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523520"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Terry Cheong <htcheong@chromium.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/23] ASoC: Intel: sof_rt5682: add RPL support for MAX98357A
 speaker
Date: Mon, 31 Jul 2023 16:42:36 -0500
Message-Id: <20230731214257.444605-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UITMHFCBVI3VL3EOB7ZF2HF7CIQK2W72
X-Message-ID-Hash: UITMHFCBVI3VL3EOB7ZF2HF7CIQK2W72
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UITMHFCBVI3VL3EOB7ZF2HF7CIQK2W72/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Terry Cheong <htcheong@chromium.org>

Adding support back to RPL devices that lost audio after the RPL/ADL
split. The hardware configuration is:

SSP0: 10EC5682/RTL5682 codec
SSP2: MAX98357A amplifier

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Terry Cheong <htcheong@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c               |  8 ++++++++
 sound/soc/intel/common/soc-acpi-intel-rpl-match.c | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index b4f07bdcf8b4..5e29853ae4f1 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1196,6 +1196,14 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "rpl_mx98357_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(2) |
+					SOF_RT5682_NUM_HDMIDEV(4)),
+	},
 	{
 		.name = "rpl_mx98360_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 99dc76c99f0d..4eefdb2dd45c 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -331,6 +331,11 @@ static const struct snd_soc_acpi_codecs rpl_rt5682_hp = {
 	.codecs = {"10EC5682", "RTL5682"},
 };
 
+static const struct snd_soc_acpi_codecs rpl_max98357a_amp = {
+	.num_codecs = 1,
+	.codecs = {"MX98357A"}
+};
+
 static const struct snd_soc_acpi_codecs rpl_max98360a_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98360A"},
@@ -347,6 +352,13 @@ static const struct snd_soc_acpi_codecs rpl_rt1019p_amp = {
 };
 
 struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
+	{
+		.comp_ids = &rpl_rt5682_hp,
+		.drv_name = "rpl_mx98357_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rpl_max98357a_amp,
+		.sof_tplg_filename = "sof-rpl-max98357a-rt5682.tplg",
+	},
 	{
 		.comp_ids = &rpl_rt5682_hp,
 		.drv_name = "rpl_mx98360_rt5682",
-- 
2.39.2

