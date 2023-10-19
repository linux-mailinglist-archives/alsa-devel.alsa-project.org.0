Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBD17D00BF
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 19:37:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60DBE201;
	Thu, 19 Oct 2023 19:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60DBE201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697737043;
	bh=1yf54dellcqsfaGDqZHU10FeruGNInLonMi8h0y1HMc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=poDvmWwrRVIOzAj/SXZJJTc+dkxDGB+wDrdd5jyROsNEfGYXuqDeTm5/VudawR/8S
	 Kx3/ObGGuSVAsfum2w39i4iA8K0PkYq1BniMzvYzvi/DN+0FjUNEx85ENG6/Bvkyw4
	 HCziyhp9lmGBfgjfnRAJ6Zow13AhE81QkSNIcA1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30379F80557; Thu, 19 Oct 2023 19:34:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A1AF805C0;
	Thu, 19 Oct 2023 19:34:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E0EDF805A9; Thu, 19 Oct 2023 19:34:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 13B8BF80536
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13B8BF80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JA/BgPZn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697736875; x=1729272875;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1yf54dellcqsfaGDqZHU10FeruGNInLonMi8h0y1HMc=;
  b=JA/BgPZnO9gMnkzmVW1CVb9ucyTj7aOfCA7Y8MOhsodMnbla8ODPAQLV
   g9s/BeVni6sPQhzpi1voLOIaBOPDHCSA5lvGzBJS25AQYNThIL/xNym3w
   qeZ9oN5Inz06WzflV6SCEUP3UP0JyiVt5rxVkm+CKGpjWisix0Q6vltDr
   uPNE2QJMNo+paa5bYbohQaMUIEAcRT+e7D7/H/npZxYIMM33p+aSKbNN1
   8KVICBdmCkV7DGS2YC38w0BybTatkmZFCAWEUi7i3XpEo1Q2OhcnsUkk6
   n/8itKnoL5fddIq4AhmhopEAZ3ZjF4pEYrgwrW6R9WKj52tgTUOpoy/uQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7884349"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="7884349"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792090676"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="792090676"
Received: from jihao1-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.163.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/10] ASoC: Intel: board_helpers: support dmic link
 initialization
Date: Thu, 19 Oct 2023 12:34:07 -0500
Message-Id: <20231019173411.166759-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
References: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4SFSZX6TXZ3DMTVBPBZRBCFFVZ2VVNQR
X-Message-ID-Hash: 4SFSZX6TXZ3DMTVBPBZRBCFFVZ2VVNQR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4SFSZX6TXZ3DMTVBPBZRBCFFVZ2VVNQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add functions for machine drivers to initialize dmic01 and dmic16k DAI
links.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 92 ++++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h | 10 +++
 2 files changed, 102 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 627742ce84bd..ce2967850c2d 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -36,9 +36,49 @@ int sof_intel_board_card_late_probe(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_NS(sof_intel_board_card_late_probe, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+/*
+ * DMIC DAI Link
+ */
+static const struct snd_soc_dapm_widget dmic_widgets[] = {
+	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
+};
+
+static const struct snd_soc_dapm_route dmic_routes[] = {
+	{"DMic", NULL, "SoC DMIC"},
+};
+
+static int dmic_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, dmic_widgets,
+					ARRAY_SIZE(dmic_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add dmic widgets, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, dmic_routes,
+				      ARRAY_SIZE(dmic_routes));
+	if (ret) {
+		dev_err(rtd->dev, "fail to add dmic routes, ret %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 /*
  * DAI Link Helpers
  */
+static struct snd_soc_dai_link_component dmic_component[] = {
+	{
+		.name = "dmic-codec",
+		.dai_name = "dmic-hifi",
+	}
+};
+
 static struct snd_soc_dai_link_component platform_component[] = {
 	{
 		/* name might be overridden during probe */
@@ -46,6 +86,58 @@ static struct snd_soc_dai_link_component platform_component[] = {
 	}
 };
 
+int sof_intel_board_set_dmic_link(struct device *dev,
+				  struct snd_soc_dai_link *link, int be_id,
+				  enum sof_dmic_be_type be_type)
+{
+	struct snd_soc_dai_link_component *cpus;
+
+	/* cpus */
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
+			    GFP_KERNEL);
+	if (!cpus)
+		return -ENOMEM;
+
+	switch (be_type) {
+	case SOF_DMIC_01:
+		dev_dbg(dev, "link %d: dmic01\n", be_id);
+
+		link->name = "dmic01";
+		cpus->dai_name = "DMIC01 Pin";
+		break;
+	case SOF_DMIC_16K:
+		dev_dbg(dev, "link %d: dmic16k\n", be_id);
+
+		link->name = "dmic16k";
+		cpus->dai_name = "DMIC16k Pin";
+		break;
+	default:
+		dev_err(dev, "invalid be type %d\n", be_type);
+		return -EINVAL;
+	}
+
+	link->cpus = cpus;
+	link->num_cpus = 1;
+
+	/* codecs */
+	link->codecs = dmic_component;
+	link->num_codecs = ARRAY_SIZE(dmic_component);
+
+	/* platforms */
+	link->platforms = platform_component;
+	link->num_platforms = ARRAY_SIZE(platform_component);
+
+	link->id = be_id;
+	if (be_type == SOF_DMIC_01)
+		link->init = dmic_init;
+	link->ignore_suspend = 1;
+	link->no_pcm = 1;
+	link->dpcm_capture = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_set_dmic_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 int sof_intel_board_set_intel_hdmi_link(struct device *dev,
 					struct snd_soc_dai_link *link, int be_id,
 					int hdmi_id, bool idisp_codec)
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 7a15ddaa3a2c..df99f576c1d8 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -28,6 +28,7 @@ struct sof_rt5682_private {
  * @hdmi: init data for hdmi dai link
  * @codec_type: type of headset codec
  * @amp_type: type of speaker amplifier
+ * @dmic_be_num: number of Intel PCH DMIC BE link
  * @hdmi_num: number of Intel HDMI BE link
  * @rt5682: private data for rt5682 machine driver
  */
@@ -38,6 +39,7 @@ struct sof_card_private {
 	enum sof_ssp_codec codec_type;
 	enum sof_ssp_codec amp_type;
 
+	int dmic_be_num;
 	int hdmi_num;
 
 	union {
@@ -45,8 +47,16 @@ struct sof_card_private {
 	};
 };
 
+enum sof_dmic_be_type {
+	SOF_DMIC_01,
+	SOF_DMIC_16K,
+};
+
 int sof_intel_board_card_late_probe(struct snd_soc_card *card);
 
+int sof_intel_board_set_dmic_link(struct device *dev,
+				  struct snd_soc_dai_link *link, int be_id,
+				  enum sof_dmic_be_type be_type);
 int sof_intel_board_set_intel_hdmi_link(struct device *dev,
 					struct snd_soc_dai_link *link, int be_id,
 					int hdmi_id, bool idisp_codec);
-- 
2.39.2

