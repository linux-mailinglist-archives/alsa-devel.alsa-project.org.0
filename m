Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A772976A331
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:45:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27C8082A;
	Mon, 31 Jul 2023 23:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27C8082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690839933;
	bh=VsiZmhINio/NVDO0AijMJGUfKJp2g5mtREObtxVR7Ls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uuVEOROWVzDyLrdvY8GA1IWieg62+ylRGUyW/h9OIVCU+HI54wBsaBNKFR7kWqJJ6
	 ZgHMqqmE7oK3j1mb44Zst2d7yPm7lVPojvGZNQzQ41JU4Gtex3EvSp0HhqrtOo07DO
	 sQBo7RZ9pOyGBTMEilWclkn94J9j8TnTPpRzOhVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92CC6F8016D; Mon, 31 Jul 2023 23:43:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA039F8016D;
	Mon, 31 Jul 2023 23:43:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2ADC6F80579; Mon, 31 Jul 2023 23:43:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF894F80163
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF894F80163
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hJ/YkXQk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839793; x=1722375793;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VsiZmhINio/NVDO0AijMJGUfKJp2g5mtREObtxVR7Ls=;
  b=hJ/YkXQkuUyexhdmYjXhXCtpRfj/2c4ZngF9Zza0m1bPN6k4FZeCM1+k
   jftVAl5ygSjydNlZDMzj57fqjKJZW+zotls4ugI5Z0qYIyC2SME16H2LX
   rMqFjhzgCmC8hggg6gzZZIoRaGgpuX4vkQKGz0IAfHTZRt2Q4p3x0xkNs
   SayaIVE3a1tmOoFN9R2T5b1pzIyKqX2uhse7D+iknkfzm7uQ7wZCK/Lj5
   8OsWodtNC+rjkSwBKk/I436oChjICIm1gffXnNPvrpJwtCO1kE/mEWq+e
   Q4c8EuzzAY1qcWcEdXN3xBZpJZC8TnLkLjM/A/G0WRAXsvqjYEHUctxBi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449736"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449736"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523524"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523524"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	apoorv <apoorv@intel.com>,
	CBM <balamurugan.c@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 03/23] ASoC: Intel: sof_rt5682 add support for HDMI_In capture
Date: Mon, 31 Jul 2023 16:42:37 -0500
Message-Id: <20230731214257.444605-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ODQTWGEOS6643HSGOVZRZPDLUBCXOFPZ
X-Message-ID-Hash: ODQTWGEOS6643HSGOVZRZPDLUBCXOFPZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODQTWGEOS6643HSGOVZRZPDLUBCXOFPZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: apoorv <apoorv@intel.com>

Adding support for 2 streams of HDMI-In capture via I2S with rt5682s
codec variant

Reviewed-by: CBM <balamurugan.c@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: apoorv <apoorv@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c           | 47 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-adl-match.c   |  7 +++
 2 files changed, 54 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 5e29853ae4f1..febf3a5bae95 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -63,6 +63,11 @@
 #define SOF_RT1019_SPEAKER_AMP_PRESENT	BIT(26)
 #define SOF_RT5650_HEADPHONE_CODEC_PRESENT	BIT(27)
 
+/* HDMI capture*/
+#define SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT  27
+#define SOF_SSP_HDMI_CAPTURE_PRESENT_MASK (GENMASK(30, 27))
+#define SOF_HDMI_CAPTURE_SSP_MASK(quirk)   \
+	(((quirk) << SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT) & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -688,6 +693,7 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
 	int i, id = 0;
+	int hdmi_id_offset = 0;
 
 	links = devm_kcalloc(dev, sof_audio_card_rt5682.num_links,
 			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
@@ -919,6 +925,34 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].num_cpus = 1;
 	}
 
+	/* HDMI-In SSP */
+	if (sof_rt5682_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK) {
+		unsigned long hdmi_in_ssp = (sof_rt5682_quirk &
+				SOF_SSP_HDMI_CAPTURE_PRESENT_MASK) >>
+				SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
+		int port = 0;
+
+		for_each_set_bit(port, &hdmi_in_ssp, 32) {
+			links[id].cpus = &cpus[id];
+			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+								  "SSP%d Pin", port);
+			if (!links[id].cpus->dai_name)
+				return NULL;
+			links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-HDMI", port);
+			if (!links[id].name)
+				return NULL;
+			links[id].id = id + hdmi_id_offset;
+			links[id].codecs = &asoc_dummy_dlc;
+			links[id].num_codecs = 1;
+			links[id].platforms = platform_component;
+			links[id].num_platforms = ARRAY_SIZE(platform_component);
+			links[id].dpcm_capture = 1;
+			links[id].no_pcm = 1;
+			links[id].num_cpus = 1;
+			id++;
+		}
+	}
+
 	return links;
 devm_err:
 	return NULL;
@@ -1030,6 +1064,11 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		sof_audio_card_rt5682.num_links++;
 
+	if (sof_rt5682_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK)
+		sof_audio_card_rt5682.num_links +=
+			hweight32((sof_rt5682_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT_MASK) >>
+					SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT);
+
 	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
 					      dmic_be_num, hdmi_num, ctx->idisp_codec);
 	if (!dai_links)
@@ -1196,6 +1235,14 @@ static const struct platform_device_id board_ids[] = {
 					SOF_BT_OFFLOAD_SSP(2) |
 					SOF_SSP_BT_OFFLOAD_PRESENT),
 	},
+	{
+		.name = "adl_rt5682_c1_h02",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(1) |
+					SOF_RT5682_NUM_HDMIDEV(3) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
+					SOF_HDMI_CAPTURE_SSP_MASK(0x5)),
+	},
 	{
 		.name = "rpl_mx98357_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index bcd66e0094b4..8e995edf4c10 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -568,6 +568,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_max98390_amp,
 		.sof_tplg_filename = "sof-adl-max98390-rt5682.tplg",
 	},
+	{
+		.comp_ids = &adl_rt5682_rt5682s_hp,
+		.drv_name = "adl_rt5682_c1_h02",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_lt6911_hdmi,
+		.sof_tplg_filename = "sof-adl-rt5682-ssp1-hdmi-ssp02.tplg",
+	},
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
 		.drv_name = "adl_rt5682",
-- 
2.39.2

