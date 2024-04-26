Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D35808B3B29
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:22:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7439393A;
	Fri, 26 Apr 2024 17:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7439393A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714144969;
	bh=HubybkhRbfo/I4Z9f4ZL9Jl07Vz/hlhXaq7GSFqYs28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ttM5xNxOxPnYiF4zXfaUxfFEno6DWqYjdaCuCgS1ATRwAZ07HVmtaRkp2K2SaoWYs
	 W7OtgKs6bW94QrFcJurTW+a0D8XIpOn/vh4kPzY4JkhTO0Gq2L37KGxSzb2OQBq1V6
	 yd7awQhdY93Bn1THS8IwVTX1JMgmYdkFQBfRVz+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9D7CF8003A; Fri, 26 Apr 2024 17:22:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A004FF805C7;
	Fri, 26 Apr 2024 17:21:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7E79F8057B; Fri, 26 Apr 2024 17:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29BDEF800B5
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29BDEF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AWyCoa6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144906; x=1745680906;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HubybkhRbfo/I4Z9f4ZL9Jl07Vz/hlhXaq7GSFqYs28=;
  b=AWyCoa6aqzIyQ8KhSRko8Nov3Cdv1PqrVdmsh7FhA4Bo9pI5SnJ4a9D7
   cFWLNC1QCn+pKM8NIHBJBlpIgZ3dJYne4QcJLXYzDkIgf8Ms3NncONEtE
   /+2bB/cjaGb5gN8vBbWXtSSX7h/OoAVuTYgVKjclhEJu508grDhBbCpLb
   HKLfPPcVmbAq1uCeMJeppXVhFcLU7HqFFumpHuRWDsEBZU5DmV7PkFGIu
   AfCpknnf7YdOkRvtB8PpjlCjNsLmmboaQ3Uf4007A7q2Ixq4QsvQdOCIg
   3bINpe00Kbbb8lQO8v0UeNvgw5sDi5a0v1Z964VPBpUdJvpkTaNO2YdAD
   w==;
X-CSE-ConnectionGUID: x7L5Hw4PSbiXX/8BSRE61A==
X-CSE-MsgGUID: j1WDN+3ATau85uZHZ7tMxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290592"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290592"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:39 -0700
X-CSE-ConnectionGUID: DLM2Grf3Rz68RvkKcQjYCw==
X-CSE-MsgGUID: lp2Fd53FSIKI76PkW97tPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259023"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/12] ASoC: Intel: skl_hda_dsp_generic: Allocate snd_soc_card
 dynamically
Date: Fri, 26 Apr 2024 10:21:12 -0500
Message-Id: <20240426152123.36284-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BXCWG27BXKY4DJW6Z4WMLMR7JONLJMLA
X-Message-ID-Hash: BXCWG27BXKY4DJW6Z4WMLMR7JONLJMLA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BXCWG27BXKY4DJW6Z4WMLMR7JONLJMLA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The static hda_soc_card might be modified during runtime which might cause
issues on next time when the card is created.
For example if the dmic_num was set with module parameter then removed for
the next module loading then the card's components will still going to
point to the previous boot's cfg-dmics:X string.

There might be other places where devm allocated memory have been freed but
the hda_soc_card still pointing to the now unallocated memory (the memory
is freed when the platform device is removed).

Fix this issue by moving the snd_soc_card into skl_hda_private and use it
for the card registration to ensure that it is correctly initialized every
time.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_common.h  |  1 +
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 42 ++++++++++----------
 2 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.h b/sound/soc/intel/boards/skl_hda_dsp_common.h
index 4b0b3959182e..19b814dee4ad 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.h
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.h
@@ -28,6 +28,7 @@ struct skl_hda_hdmi_pcm {
 };
 
 struct skl_hda_private {
+	struct snd_soc_card card;
 	struct list_head hdmi_pcm_list;
 	int pcm_count;
 	int dai_index;
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 4aa7fd2a05e4..208395872d8b 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -92,17 +92,6 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
 	return ret;
 }
 
-static struct snd_soc_card hda_soc_card = {
-	.name = "hda-dsp",
-	.owner = THIS_MODULE,
-	.dai_link = skl_hda_be_dai_links,
-	.dapm_widgets = skl_hda_widgets,
-	.dapm_routes = skl_hda_map,
-	.add_dai_link = skl_hda_add_dai_link,
-	.fully_routed = true,
-	.late_probe = skl_hda_card_late_probe,
-};
-
 static char hda_soc_components[30];
 
 #define IDISP_DAI_COUNT		3
@@ -115,9 +104,9 @@ static char hda_soc_components[30];
 
 #define HDA_CODEC_AUTOSUSPEND_DELAY_MS 1000
 
-static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
+static int skl_hda_fill_card_info(struct snd_soc_card *card,
+				  struct snd_soc_acpi_mach_params *mach_params)
 {
-	struct snd_soc_card *card = &hda_soc_card;
 	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *dai_link;
 	u32 codec_count, codec_mask;
@@ -199,6 +188,7 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach;
 	struct skl_hda_private *ctx;
+	struct snd_soc_card *card;
 	int ret;
 
 	dev_dbg(&pdev->dev, "entry\n");
@@ -213,32 +203,42 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 	if (!mach)
 		return -EINVAL;
 
-	snd_soc_card_set_drvdata(&hda_soc_card, ctx);
+	card = &ctx->card;
+	card->name = "hda-dsp",
+	card->owner = THIS_MODULE,
+	card->dai_link = skl_hda_be_dai_links,
+	card->dapm_widgets = skl_hda_widgets,
+	card->dapm_routes = skl_hda_map,
+	card->add_dai_link = skl_hda_add_dai_link,
+	card->fully_routed = true,
+	card->late_probe = skl_hda_card_late_probe,
 
-	ret = skl_hda_fill_card_info(&mach->mach_params);
+	snd_soc_card_set_drvdata(card, ctx);
+
+	ret = skl_hda_fill_card_info(card, &mach->mach_params);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Unsupported HDAudio/iDisp configuration found\n");
 		return ret;
 	}
 
-	ctx->pcm_count = hda_soc_card.num_links;
+	ctx->pcm_count = card->num_links;
 	ctx->dai_index = 1; /* hdmi codec dai name starts from index 1 */
 	ctx->platform_name = mach->mach_params.platform;
 	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
 
-	hda_soc_card.dev = &pdev->dev;
+	card->dev = &pdev->dev;
 	if (!snd_soc_acpi_sof_parent(&pdev->dev))
-		hda_soc_card.disable_route_checks = true;
+		card->disable_route_checks = true;
 
 	if (mach->mach_params.dmic_num > 0) {
 		snprintf(hda_soc_components, sizeof(hda_soc_components),
 				"cfg-dmics:%d", mach->mach_params.dmic_num);
-		hda_soc_card.components = hda_soc_components;
+		card->components = hda_soc_components;
 	}
 
-	ret = devm_snd_soc_register_card(&pdev->dev, &hda_soc_card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (!ret)
-		skl_set_hda_codec_autosuspend_delay(&hda_soc_card);
+		skl_set_hda_codec_autosuspend_delay(card);
 
 	return ret;
 }
-- 
2.40.1

