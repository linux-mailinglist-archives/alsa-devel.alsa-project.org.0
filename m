Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4DA7FA4F5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:41:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EDF8EA1;
	Mon, 27 Nov 2023 16:41:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EDF8EA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099679;
	bh=V9pgylZHahZco3buAi1WhdAgC4fsMC6uVO+c+3nQkc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pTicihFp5i2EoQOU/rKcrYxsUt0NH20qyOvqLfogEqbugUR6yNN84FKShh/llvDtY
	 w3BTEDSNp7jaXbMnXm59T8vqS8nGA/yzZOtcvA3E8GcHtgPR7V/MSHd7OeXCapKfQm
	 HeV6yfuEKIvnMIPBmhCBsD+ZVs4ap6B+Dz5NgwOo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA6CDF896E3; Mon, 27 Nov 2023 16:36:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10755F896EC;
	Mon, 27 Nov 2023 16:36:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A35EF80BF3; Mon, 27 Nov 2023 16:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E355F8065E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E355F8065E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QWEJaWFL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099346; x=1732635346;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V9pgylZHahZco3buAi1WhdAgC4fsMC6uVO+c+3nQkc0=;
  b=QWEJaWFLNdd/xUbtgTFrWXMeIIVosB71FZ5oQiqyfKdRAJU+vub0LSrl
   8RxvOkFmM3QEjvK1JUdCyGD298v+JJR2MfbUzuSotkWJdC04OEe/Hvf7i
   GUok5wklBM19/mdUK7lQZ3Ygpk1tAcaVq+JUXvVpjMVb2D1XC3gj09wb8
   5B+eqJHkH7SyKmbir2+7OrvzrI9CByqgtDg3BmojnuWk6F41XAltIqMS3
   i9DzgFPaUx8NMgBebNTvSOdzkUNXS1eNVwXU2Sr6C9n6SxcdfVFZdwd/B
   3LnWQyOoPxhBSpve+8KTquLHiXrhSb23/7Yvwa2w6LHcADZ1IM0t/kWo3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894636"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894636"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771957049"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771957049"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:18 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 21/27] ASoC: Intel: sof_ssp_amp: simplify HDMI-In quirks
Date: Mon, 27 Nov 2023 17:26:48 +0200
Message-ID: <20231127152654.28204-22-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PBGG24YYYV5FQATUUTL5GEBCZBCJLE7A
X-Message-ID-Hash: PBGG24YYYV5FQATUUTL5GEBCZBCJLE7A
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBGG24YYYV5FQATUUTL5GEBCZBCJLE7A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Use bit mask to handle SSP port number of HDMI-In devices to simplify
the code. No functional change in this patch.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 70 +++++++++++-----------------
 1 file changed, 26 insertions(+), 44 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 72505f6a6501..eddefa69355d 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -27,21 +27,10 @@
 #define SOF_AMPLIFIER_SSP_MASK			(GENMASK(3, 0))
 
 /* HDMI capture*/
-#define SOF_SSP_HDMI_CAPTURE_PRESENT		BIT(4)
-#define SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT		5
-#define SOF_NO_OF_HDMI_CAPTURE_SSP_MASK		(GENMASK(6, 5))
-#define SOF_NO_OF_HDMI_CAPTURE_SSP(quirk)	\
-	(((quirk) << SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT) & SOF_NO_OF_HDMI_CAPTURE_SSP_MASK)
-
-#define SOF_HDMI_CAPTURE_1_SSP_SHIFT		7
-#define SOF_HDMI_CAPTURE_1_SSP_MASK		(GENMASK(9, 7))
-#define SOF_HDMI_CAPTURE_1_SSP(quirk)	\
-	(((quirk) << SOF_HDMI_CAPTURE_1_SSP_SHIFT) & SOF_HDMI_CAPTURE_1_SSP_MASK)
-
-#define SOF_HDMI_CAPTURE_2_SSP_SHIFT		10
-#define SOF_HDMI_CAPTURE_2_SSP_MASK		(GENMASK(12, 10))
-#define SOF_HDMI_CAPTURE_2_SSP(quirk)	\
-	(((quirk) << SOF_HDMI_CAPTURE_2_SSP_SHIFT) & SOF_HDMI_CAPTURE_2_SSP_MASK)
+#define SOF_HDMI_CAPTURE_SSP_MASK_SHIFT		4
+#define SOF_HDMI_CAPTURE_SSP_MASK_MASK		(GENMASK(9, 4))
+#define SOF_HDMI_CAPTURE_SSP_MASK(quirk)	\
+	(((quirk) << SOF_HDMI_CAPTURE_SSP_MASK_SHIFT) & SOF_HDMI_CAPTURE_SSP_MASK_MASK)
 
 /* HDMI playback */
 #define SOF_HDMI_PLAYBACK_PRESENT		BIT(13)
@@ -108,6 +97,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 	int ret;
 	bool fixed_be = false;
 	int be_id;
+	unsigned long ssp_mask_hdmi_in;
 
 	links = devm_kcalloc(dev, sof_ssp_amp_card.num_links,
 					sizeof(struct snd_soc_dai_link), GFP_KERNEL);
@@ -117,20 +107,17 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 		return NULL;
 
 	/* HDMI-In SSP */
-	if (sof_ssp_amp_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT) {
-		int num_of_hdmi_ssp = (sof_ssp_amp_quirk & SOF_NO_OF_HDMI_CAPTURE_SSP_MASK) >>
-				SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
+	ssp_mask_hdmi_in = (sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_SSP_MASK_MASK) >>
+				SOF_HDMI_CAPTURE_SSP_MASK_SHIFT;
+
+	if (ssp_mask_hdmi_in) {
+		int port = 0;
 
 		/* the topology supports HDMI-IN uses fixed BE ID for DAI links */
 		fixed_be = true;
 
 		be_id = HDMI_IN_BE_ID;
-		for (i = 1; i <= num_of_hdmi_ssp; i++) {
-			int port = (i == 1 ? (sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_1_SSP_MASK) >>
-						SOF_HDMI_CAPTURE_1_SSP_SHIFT :
-						(sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_2_SSP_MASK) >>
-						SOF_HDMI_CAPTURE_2_SSP_SHIFT);
-
+		for_each_set_bit(port, &ssp_mask_hdmi_in, 32) {
 			links[id].cpus = &cpus[id];
 			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
 								  "SSP%d Pin", port);
@@ -231,6 +218,7 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	struct snd_soc_dai_link *dai_links;
 	struct sof_card_private *ctx;
 	int ret;
+	unsigned long ssp_mask_hdmi_in;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
@@ -246,7 +234,10 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	else
 		ctx->dmic_be_num = 0;
 
-	/* port number of peripherals attached to ssp interface */
+	/* port number/mask of peripherals attached to ssp interface */
+	ssp_mask_hdmi_in = (sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_SSP_MASK_MASK) >>
+			SOF_HDMI_CAPTURE_SSP_MASK_SHIFT;
+
 	ctx->ssp_bt = (sof_ssp_amp_quirk & SOF_BT_OFFLOAD_SSP_MASK) >>
 			SOF_BT_OFFLOAD_SSP_SHIFT;
 
@@ -258,9 +249,8 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	if (ctx->amp_type != CODEC_NONE)
 		sof_ssp_amp_card.num_links++;
 
-	if (sof_ssp_amp_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT)
-		sof_ssp_amp_card.num_links += (sof_ssp_amp_quirk & SOF_NO_OF_HDMI_CAPTURE_SSP_MASK) >>
-				SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
+	if (ssp_mask_hdmi_in)
+		sof_ssp_amp_card.num_links += hweight32(ssp_mask_hdmi_in);
 
 	if (sof_ssp_amp_quirk & SOF_HDMI_PLAYBACK_PRESENT) {
 		ctx->hdmi_num = (sof_ssp_amp_quirk & SOF_NO_OF_HDMI_PLAYBACK_MASK) >>
@@ -325,10 +315,8 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "tgl_rt1308_hdmi_ssp",
 		.driver_data = (kernel_ulong_t)(SOF_AMPLIFIER_SSP(2) |
-					SOF_NO_OF_HDMI_CAPTURE_SSP(2) |
-					SOF_HDMI_CAPTURE_1_SSP(1) |
-					SOF_HDMI_CAPTURE_2_SSP(5) |
-					SOF_SSP_HDMI_CAPTURE_PRESENT),
+					SOF_HDMI_CAPTURE_SSP_MASK(0x22)),
+					/* SSP 1 and SSP 5 are used for HDMI IN */
 	},
 	{
 		.name = "adl_cs35l41",
@@ -340,28 +328,22 @@ static const struct platform_device_id board_ids[] = {
 	},
 	{
 		.name = "adl_lt6911_hdmi_ssp",
-		.driver_data = (kernel_ulong_t)(SOF_NO_OF_HDMI_CAPTURE_SSP(2) |
-					SOF_HDMI_CAPTURE_1_SSP(0) |
-					SOF_HDMI_CAPTURE_2_SSP(2) |
-					SOF_SSP_HDMI_CAPTURE_PRESENT |
+		.driver_data = (kernel_ulong_t)(SOF_HDMI_CAPTURE_SSP_MASK(0x5) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_NO_OF_HDMI_PLAYBACK(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{
 		.name = "rpl_lt6911_hdmi_ssp",
-		.driver_data = (kernel_ulong_t)(SOF_NO_OF_HDMI_CAPTURE_SSP(2) |
-					SOF_HDMI_CAPTURE_1_SSP(0) |
-					SOF_HDMI_CAPTURE_2_SSP(2) |
-					SOF_SSP_HDMI_CAPTURE_PRESENT |
+		.driver_data = (kernel_ulong_t)(SOF_HDMI_CAPTURE_SSP_MASK(0x5) |
+					/* SSP 0 and SSP 2 are used for HDMI IN */
 					SOF_NO_OF_HDMI_PLAYBACK(3) |
 					SOF_HDMI_PLAYBACK_PRESENT),
 	},
 	{
 		.name = "mtl_lt6911_hdmi_ssp",
-		.driver_data = (kernel_ulong_t)(SOF_NO_OF_HDMI_CAPTURE_SSP(2) |
-				SOF_HDMI_CAPTURE_1_SSP(0) |
-				SOF_HDMI_CAPTURE_2_SSP(2) |
-				SOF_SSP_HDMI_CAPTURE_PRESENT |
+		.driver_data = (kernel_ulong_t)(SOF_HDMI_CAPTURE_SSP_MASK(0x5) |
+				/* SSP 0 and SSP 2 are used for HDMI IN */
 				SOF_NO_OF_HDMI_PLAYBACK(3) |
 				SOF_HDMI_PLAYBACK_PRESENT),
 	},
-- 
2.43.0

