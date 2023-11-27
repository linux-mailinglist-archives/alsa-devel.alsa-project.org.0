Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C73A7FA4EC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 16:39:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C1B9E7B;
	Mon, 27 Nov 2023 16:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C1B9E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701099578;
	bh=XBafYApF575mHRlnm2NvKYMhKgk9gGsTHnetRd1yj3c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hA9QxJ9LXGHnsNciS64PJdhOrG4CF5TzMTGZk5Fsq/dJTPiSOmpPN94cBWJyv1f95
	 glc3ZqEZAeCtAPSAjC60PnefL1XVwBpR4c4EgS6TboDx6svAGP65FKy4hcj3Icr87W
	 evbK1FWUBtPGzjwolWtD0MkTHXxBUu2ULiy5tXlE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B812DF80563; Mon, 27 Nov 2023 16:36:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B28CF8087D;
	Mon, 27 Nov 2023 16:36:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB2E3F801D5; Mon, 27 Nov 2023 16:35:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 195DAF801D5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 16:35:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 195DAF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KFQ+kNpN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099337; x=1732635337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XBafYApF575mHRlnm2NvKYMhKgk9gGsTHnetRd1yj3c=;
  b=KFQ+kNpN7FNFK6navDpuh5z3ODen17oPMDXzv/tr6lazICE4kmV6KIFf
   8AP/Dbn2fQI/hkyMJ+XODET5T4sFRiyvkGkgFmbBqkzDQBJQ2670etaAs
   bq/Mlk3l/al5D8KtNe8+hX0GHKjNDQRxQVQSuago2UhuORRdTRKHzkxJd
   iatXaAvItR55RHy4pHiaifFH9+6yfUeAKto0XUOrih0fD5iUl9jG3N0ss
   v0ewQoUzYkk5X3iN0Whl3+SLQ6bRkHZDa08zCKqIl2+iCqBqZp4AVXX9Y
   NuYOP/C232eKLSqkhyFx+bPr0qmHQih0ED6tqs/1uvyGvg5vSCtJsD93o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894572"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="372894572"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956833"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="771956833"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 07:27:03 -0800
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
Subject: [PATCH 16/27] ASoC: Intel: board_helpers: support BT offload link
 initialization
Date: Mon, 27 Nov 2023 17:26:43 +0200
Message-ID: <20231127152654.28204-17-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 46GYAVWYKFZWZF2IEZVHMV73KVLYTMHS
X-Message-ID-Hash: 46GYAVWYKFZWZF2IEZVHMV73KVLYTMHS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46GYAVWYKFZWZF2IEZVHMV73KVLYTMHS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add a helper function for machine drivers to initialize BT offload
DAI link.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 43 ++++++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  8 ++++
 2 files changed, 51 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 515634db0a4d..335c660561d5 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -290,6 +290,49 @@ int sof_intel_board_set_ssp_amp_link(struct device *dev,
 }
 EXPORT_SYMBOL_NS(sof_intel_board_set_ssp_amp_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+int sof_intel_board_set_bt_link(struct device *dev,
+				struct snd_soc_dai_link *link, int be_id,
+				int ssp_bt)
+{
+	struct snd_soc_dai_link_component *cpus;
+
+	dev_dbg(dev, "link %d: bt offload, ssp %d\n", be_id, ssp_bt);
+
+	/* link name */
+	link->name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", ssp_bt);
+	if (!link->name)
+		return -ENOMEM;
+
+	/* cpus */
+	cpus = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link_component),
+			    GFP_KERNEL);
+	if (!cpus)
+		return -ENOMEM;
+
+	cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_bt);
+	if (!cpus->dai_name)
+		return -ENOMEM;
+
+	link->cpus = cpus;
+	link->num_cpus = 1;
+
+	/* codecs */
+	link->codecs = &snd_soc_dummy_dlc;
+	link->num_codecs = 1;
+
+	/* platforms */
+	link->platforms = platform_component;
+	link->num_platforms = ARRAY_SIZE(platform_component);
+
+	link->id = be_id;
+	link->no_pcm = 1;
+	link->dpcm_capture = 1;
+	link->dpcm_playback = 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(sof_intel_board_set_bt_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index 17922f3e17a5..49a7bfa12a6d 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -32,6 +32,8 @@ struct sof_rt5682_private {
  * @hdmi_num: number of Intel HDMI BE link
  * @ssp_codec: ssp port number of headphone BE link
  * @ssp_amp: ssp port number of speaker BE link
+ * @ssp_bt: ssp port number of BT offload BE link
+ * @bt_offload_present: true to create BT offload BE link
  * @rt5682: private data for rt5682 machine driver
  */
 struct sof_card_private {
@@ -46,6 +48,9 @@ struct sof_card_private {
 
 	int ssp_codec;
 	int ssp_amp;
+	int ssp_bt;
+
+	bool bt_offload_present;
 
 	union {
 		struct sof_rt5682_private rt5682;
@@ -71,5 +76,8 @@ int sof_intel_board_set_intel_hdmi_link(struct device *dev,
 int sof_intel_board_set_ssp_amp_link(struct device *dev,
 				     struct snd_soc_dai_link *link, int be_id,
 				     enum sof_ssp_codec amp_type, int ssp_amp);
+int sof_intel_board_set_bt_link(struct device *dev,
+				struct snd_soc_dai_link *link, int be_id,
+				int ssp_bt);
 
 #endif /* __SOF_INTEL_BOARD_HELPERS_H */
-- 
2.43.0

