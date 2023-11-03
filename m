Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB587DFE7E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 04:56:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45570208;
	Fri,  3 Nov 2023 04:55:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45570208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698983808;
	bh=Xf7I+a6R6mRM3M26yR00JW3d5/kN+0JIHdBger0fMIg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hIGYse1hPO5wWqTl7n5pwl/E+wKK6e2o0DwmhkSb6mE6Ls1BzwxO2o9JBk9GvSPBY
	 3/CfcyzJd/OgqN+8Xgq5ISbx1iB7CSacbZOynCk2bgTgZ4j83lZUGf0oqijKKeEBsg
	 6Ykp65AJzyJWVXOv6FMoGTtLku+iSnQAprbGVMQI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A130F8055A; Fri,  3 Nov 2023 04:55:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD5DFF8020D;
	Fri,  3 Nov 2023 04:55:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 263D2F80290; Fri,  3 Nov 2023 04:53:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92E13F8003C
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 04:53:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92E13F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NFLxt1zk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698983618; x=1730519618;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Xf7I+a6R6mRM3M26yR00JW3d5/kN+0JIHdBger0fMIg=;
  b=NFLxt1zkqwzyuKjZhNcrMReHdX/IOnDh1A2JyNwZojMkxiUeAhEDtyjv
   hFMBf+9DcpTOP0ZlJdmNIdN/7b+qIG+7Q7dAvt2BToA7tjK0IDlnfycYS
   0L+0/7cJzR61TBFnERFm79ngkpQTYDJ1/zIZlvN9PhMwcbqpDNbtTlioN
   dlfePLLu/QOq4G8vXVa9B6ph85o6zZKjpYKOAu/sJOJlYSLokxOZgsAJX
   aJUSh5fBuFjs35rqRyFd/8pdkQywdFU5XhedNUBsI5F6qBpeUbV6xpzvk
   M7CgZ9HfoC+jTIZzda97oKP5Qoysbl21MItDG9SNhLI3v5d4y+En2QeBY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="392753900"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200";
   d="scan'208";a="392753900"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 20:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="765134524"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200";
   d="scan'208";a="765134524"
Received: from macchian-builder.itwn.intel.com ([10.5.253.188])
  by fmsmga007.fm.intel.com with ESMTP; 02 Nov 2023 20:53:29 -0700
From: Mac Chiang <mac.chiang@intel.com>
To: alsa-devel@alsa-project.org
Cc: cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	mac.chiang@intel.com
Subject: [PATCH v3] ASoC: Intel: sof_rt5682: add mtl_rt5650 support
Date: Thu,  2 Nov 2023 23:32:32 -0400
Message-Id: <20231103033232.11193-1-mac.chiang@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2PIF2JFZC5ZFALM4KEWIKBBPCHQD5VMZ
X-Message-ID-Hash: 2PIF2JFZC5ZFALM4KEWIKBBPCHQD5VMZ
X-MailFrom: mac.chiang@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PIF2JFZC5ZFALM4KEWIKBBPCHQD5VMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RT5650 is I2S codec integrated with HP and SPK.
The HW board connects SoC I2S to RT5650 codec as below:

I2S0: ALC5650 aif1 for Speaker
I2S2: ALC5650 aif2 for Headphone

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
Changes v3:
  - missing Reviewed-by, add it.
---

 sound/soc/intel/boards/sof_rt5682.c               |  9 +++++++++
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 06ad15af46de..9723479f43da 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1147,6 +1147,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(0) |
 					SOF_RT5682_NUM_HDMIDEV(3)),
 	},
+	{
+		.name = "mtl_rt5650",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(2) |
+					SOF_RT5682_SSP_AMP(0) |
+					SOF_RT5682_NUM_HDMIDEV(3) |
+					SOF_BT_OFFLOAD_SSP(1) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 301b8142d554..af4224bff718 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -40,6 +40,11 @@ static const struct snd_soc_acpi_codecs mtl_lt6911_hdmi = {
 	.codecs = {"INTC10B0"}
 };
 
+static const struct snd_soc_acpi_codecs mtl_rt5650_amp = {
+	.num_codecs = 1,
+	.codecs = {"10EC5650"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 	{
 		.comp_ids = &mtl_rt5682_rt5682s_hp,
@@ -77,6 +82,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
+	{
+		.id = "10EC5650",
+		.drv_name = "mtl_rt5650",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &mtl_rt5650_amp,
+		.sof_tplg_filename = "sof-mtl-rt5650.tplg",
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "INTC10B0",
-- 
2.20.1

