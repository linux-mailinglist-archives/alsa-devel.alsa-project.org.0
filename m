Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 821D984E5B8
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 17:59:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6DEE83E;
	Thu,  8 Feb 2024 17:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6DEE83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411538;
	bh=1kT9AYfgbt68b2+64UdzrKXkhHTQJhaZtb2wzHczw94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g7yCp5yEXuwJmJTLl2UYAygB5gqx01tY/Sqmn0eTrGECabG3aJ9Kdzz0ELRJOREkw
	 nU3g8WbEIrqdQNkgsg30VF7WFZP9b/IhMU/AIHe3LHb/zCQJAJXtTFwWziA9qVTQaI
	 jaZBrerBzg889Mea+ir3D8tZY8mw0FuoPETQGzwY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 502A3F806D0; Thu,  8 Feb 2024 17:56:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5835F806CD;
	Thu,  8 Feb 2024 17:56:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0FD5F805EF; Thu,  8 Feb 2024 17:56:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D18CF80548
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D18CF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZpiHnIg6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411367; x=1738947367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1kT9AYfgbt68b2+64UdzrKXkhHTQJhaZtb2wzHczw94=;
  b=ZpiHnIg6MsDvNXF3qKGrudnTtNwIEgnBYPt7Ujl7WbF3K9skJjbtwJHJ
   kP66kMAJ3XmnnUYwVsDzqqolZyOYpraQMa1VKColcO+/g91E0lOvUd/S5
   +qb5iYZvoGmUBShy0vwmloWYrmvNpNo6EN73qNxwf5BZfDts0NCE3aLnW
   kqeHwK2xn3gLjjsOynYiNH5uJzibDZsjpd7gGMN6VSzNQeJf9Nm8HWDuD
   Y8UjQnL8lCoCALluiPx53i/wynwFn6e+epCtE5OIUB11fX06hWz2lGtXQ
   aNf3ulEsrnkh+8E4aj1LeeXfb9f13pIaSEzSG0oAwFA9K+AUA0zLskeCc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675344"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675344"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690179"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:55:59 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/24] ASoC: Intel: sof_cs42l42: use common module for DAI
 link generation
Date: Thu,  8 Feb 2024 10:55:29 -0600
Message-Id: <20240208165545.93811-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SFYI2BLHEPMUTMYD452MKTGQU5GHW4YL
X-Message-ID-Hash: SFYI2BLHEPMUTMYD452MKTGQU5GHW4YL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFYI2BLHEPMUTMYD452MKTGQU5GHW4YL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use intel_board module to generate DAI link array and update num_links
field in snd_soc_card structure.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_cs42l42.c | 224 +++++++--------------------
 1 file changed, 53 insertions(+), 171 deletions(-)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index c2442bf8ced0..323b86c42ef9 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -34,25 +34,12 @@
 #define SOF_CS42L42_NUM_HDMIDEV_MASK		(GENMASK(9, 7))
 #define SOF_CS42L42_NUM_HDMIDEV(quirk)	\
 	(((quirk) << SOF_CS42L42_NUM_HDMIDEV_SHIFT) & SOF_CS42L42_NUM_HDMIDEV_MASK)
-#define SOF_CS42L42_DAILINK_SHIFT		10
-#define SOF_CS42L42_DAILINK_MASK		(GENMASK(24, 10))
-#define SOF_CS42L42_DAILINK(link1, link2, link3, link4, link5) \
-	((((link1) | ((link2) << 3) | ((link3) << 6) | ((link4) << 9) | ((link5) << 12)) << SOF_CS42L42_DAILINK_SHIFT) & SOF_CS42L42_DAILINK_MASK)
 #define SOF_BT_OFFLOAD_PRESENT			BIT(25)
 #define SOF_CS42L42_SSP_BT_SHIFT		26
 #define SOF_CS42L42_SSP_BT_MASK			(GENMASK(28, 26))
 #define SOF_CS42L42_SSP_BT(quirk)	\
 	(((quirk) << SOF_CS42L42_SSP_BT_SHIFT) & SOF_CS42L42_SSP_BT_MASK)
 
-enum {
-	LINK_NONE = 0,
-	LINK_HP = 1,
-	LINK_SPK = 2,
-	LINK_DMIC = 3,
-	LINK_HDMI = 4,
-	LINK_BT = 5,
-};
-
 static struct snd_soc_jack_pin jack_pins[] = {
 	{
 		.pin    = "Headphone Jack",
@@ -182,156 +169,63 @@ static struct snd_soc_dai_link_component cs42l42_component[] = {
 	}
 };
 
-static struct snd_soc_dai_link *
-sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
-			  int ssp_codec, int ssp_amp, int ssp_bt,
-			  int dmic_be_num, int hdmi_num, bool idisp_codec)
+static int
+sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
+			  struct sof_card_private *ctx)
 {
-	struct snd_soc_dai_link *links;
 	int ret;
-	int id = 0;
-	int link_seq;
-	int i;
 
-	links = devm_kcalloc(dev, sof_audio_card_cs42l42.num_links,
-			    sizeof(struct snd_soc_dai_link), GFP_KERNEL);
-	if (!links)
-		goto devm_err;
+	ret = sof_intel_board_set_dai_link(dev, card, ctx);
+	if (ret)
+		return ret;
 
-	link_seq = (sof_cs42l42_quirk & SOF_CS42L42_DAILINK_MASK) >> SOF_CS42L42_DAILINK_SHIFT;
-
-	while (link_seq) {
-		int link_type = link_seq & 0x07;
-
-		switch (link_type) {
-		case LINK_HP:
-			ret = sof_intel_board_set_codec_link(dev, &links[id], id,
-							     CODEC_CS42L42,
-							     ssp_codec);
-			if (ret) {
-				dev_err(dev, "fail to create hp codec dai links, ret %d\n",
-					ret);
-				goto devm_err;
-			}
-
-			/* codec-specific fields */
-			links[id].codecs = cs42l42_component;
-			links[id].num_codecs = ARRAY_SIZE(cs42l42_component);
-			links[id].init = sof_cs42l42_init;
-			links[id].exit = sof_cs42l42_exit;
-			links[id].ops = &sof_cs42l42_ops;
-
-			id++;
-			break;
-		case LINK_SPK:
-			if (amp_type != CODEC_NONE) {
-				ret = sof_intel_board_set_ssp_amp_link(dev,
-								       &links[id],
-								       id,
-								       amp_type,
-								       ssp_amp);
-				if (ret) {
-					dev_err(dev, "fail to create spk amp dai links, ret %d\n",
-						ret);
-					goto devm_err;
-				}
-
-				/* codec-specific fields */
-				switch (amp_type) {
-				case CODEC_MAX98357A:
-					max_98357a_dai_link(&links[id]);
-					break;
-				case CODEC_MAX98360A:
-					max_98360a_dai_link(&links[id]);
-					break;
-				default:
-					dev_err(dev, "invalid amp type %d\n",
-						amp_type);
-					goto devm_err;
-				}
-
-				id++;
-			}
-			break;
-		case LINK_DMIC:
-			if (dmic_be_num > 0) {
-				/* at least we have dmic01 */
-				ret = sof_intel_board_set_dmic_link(dev,
-								    &links[id],
-								    id,
-								    SOF_DMIC_01);
-				if (ret) {
-					dev_err(dev, "fail to create dmic01 link, ret %d\n",
-						ret);
-					goto devm_err;
-				}
-
-				id++;
-			}
-
-			if (dmic_be_num > 1) {
-				/* set up 2 BE links at most */
-				ret = sof_intel_board_set_dmic_link(dev,
-								    &links[id],
-								    id,
-								    SOF_DMIC_16K);
-				if (ret) {
-					dev_err(dev, "fail to create dmic16k link, ret %d\n",
-						ret);
-					goto devm_err;
-				}
+	if (!ctx->codec_link) {
+		dev_err(dev, "codec link not available");
+		return -EINVAL;
+	}
 
-				id++;
-			}
-			break;
-		case LINK_HDMI:
-			for (i = 1; i <= hdmi_num; i++) {
-				ret = sof_intel_board_set_intel_hdmi_link(dev,
-									  &links[id],
-									  id, i,
-									  idisp_codec);
-				if (ret) {
-					dev_err(dev, "fail to create hdmi link, ret %d\n",
-						ret);
-					goto devm_err;
-				}
+	/* codec-specific fields for headphone codec */
+	ctx->codec_link->codecs = cs42l42_component;
+	ctx->codec_link->num_codecs = ARRAY_SIZE(cs42l42_component);
+	ctx->codec_link->init = sof_cs42l42_init;
+	ctx->codec_link->exit = sof_cs42l42_exit;
+	ctx->codec_link->ops = &sof_cs42l42_ops;
 
-				id++;
-			}
-			break;
-		case LINK_BT:
-			if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT) {
-				ret = sof_intel_board_set_bt_link(dev,
-								  &links[id], id,
-								  ssp_bt);
-				if (ret) {
-					dev_err(dev, "fail to create bt offload dai links, ret %d\n",
-						ret);
-					goto devm_err;
-				}
+	if (ctx->amp_type == CODEC_NONE)
+		return 0;
 
-				id++;
-			}
-			break;
-		case LINK_NONE:
-			/* caught here if it's not used as terminator in macro */
-		default:
-			dev_err(dev, "invalid link type %d\n", link_type);
-			goto devm_err;
-		}
+	if (!ctx->amp_link) {
+		dev_err(dev, "amp link not available");
+		return -EINVAL;
+	}
 
-		link_seq >>= 3;
+	/* codec-specific fields for speaker amplifier */
+	switch (ctx->amp_type) {
+	case CODEC_MAX98357A:
+		max_98357a_dai_link(ctx->amp_link);
+		break;
+	case CODEC_MAX98360A:
+		max_98360a_dai_link(ctx->amp_link);
+		break;
+	default:
+		dev_err(dev, "invalid amp type %d\n", ctx->amp_type);
+		return -EINVAL;
 	}
 
-	return links;
-devm_err:
-	return NULL;
+	return 0;
 }
 
+#define GLK_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_AMP,         \
+					SOF_LINK_CODEC,      \
+					SOF_LINK_DMIC01,     \
+					SOF_LINK_IDISP_HDMI, \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE)
+
 static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
-	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
 	int ret;
 
@@ -348,6 +242,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (soc_intel_is_glk()) {
 		ctx->dmic_be_num = 1;
 		ctx->hdmi_num = 3;
+
+		/* overwrite the DAI link order for GLK boards */
+		ctx->link_order_overwrite = GLK_LINK_ORDER;
 	} else {
 		ctx->dmic_be_num = 2;
 		ctx->hdmi_num = (sof_cs42l42_quirk & SOF_CS42L42_NUM_HDMIDEV_MASK) >>
@@ -371,25 +268,13 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	ctx->ssp_codec = sof_cs42l42_quirk & SOF_CS42L42_SSP_CODEC_MASK;
 
-	/* compute number of dai links */
-	sof_audio_card_cs42l42.num_links = 1 + ctx->dmic_be_num + ctx->hdmi_num;
-
-	if (ctx->amp_type != CODEC_NONE)
-		sof_audio_card_cs42l42.num_links++;
-	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT) {
+	if (sof_cs42l42_quirk & SOF_BT_OFFLOAD_PRESENT)
 		ctx->bt_offload_present = true;
-		sof_audio_card_cs42l42.num_links++;
-	}
 
-	dai_links = sof_card_dai_links_create(&pdev->dev, ctx->amp_type,
-					      ctx->ssp_codec, ctx->ssp_amp,
-					      ctx->ssp_bt, ctx->dmic_be_num,
-					      ctx->hdmi_num,
-					      ctx->hdmi.idisp_codec);
-	if (!dai_links)
-		return -ENOMEM;
-
-	sof_audio_card_cs42l42.dai_link = dai_links;
+	/* update dai_link */
+	ret = sof_card_dai_links_create(&pdev->dev, &sof_audio_card_cs42l42, ctx);
+	if (ret)
+		return ret;
 
 	sof_audio_card_cs42l42.dev = &pdev->dev;
 
@@ -409,14 +294,12 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "glk_cs4242_mx98357a",
 		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(2) |
-					SOF_CS42L42_SSP_AMP(1)) |
-					SOF_CS42L42_DAILINK(LINK_SPK, LINK_HP, LINK_DMIC, LINK_HDMI, LINK_NONE),
+					SOF_CS42L42_SSP_AMP(1)),
 	},
 	{
 		.name = "jsl_cs4242_mx98360a",
 		.driver_data = (kernel_ulong_t)(SOF_CS42L42_SSP_CODEC(0) |
-					SOF_CS42L42_SSP_AMP(1)) |
-					SOF_CS42L42_DAILINK(LINK_HP, LINK_DMIC, LINK_HDMI, LINK_SPK, LINK_NONE),
+					SOF_CS42L42_SSP_AMP(1)),
 	},
 	{
 		.name = "adl_mx98360a_cs4242",
@@ -424,8 +307,7 @@ static const struct platform_device_id board_ids[] = {
 				SOF_CS42L42_SSP_AMP(1) |
 				SOF_CS42L42_NUM_HDMIDEV(4) |
 				SOF_BT_OFFLOAD_PRESENT |
-				SOF_CS42L42_SSP_BT(2) |
-				SOF_CS42L42_DAILINK(LINK_HP, LINK_DMIC, LINK_HDMI, LINK_SPK, LINK_BT)),
+				SOF_CS42L42_SSP_BT(2)),
 	},
 	{ }
 };
-- 
2.40.1

