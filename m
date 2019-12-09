Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7AF117535
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:08:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 158E21698;
	Mon,  9 Dec 2019 20:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 158E21698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918526;
	bh=EN8zzzFIOu5gI1Gh0d4qlZgjdz4nDBf2Z6jTxu4qAtE=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=guTyjTQO6zvsDkOnd6Z9Zf+Jg5FL9OpRb04jgPbjsokAsvNNycbB9TDGNlmWKOCs+
	 rOUV+y+s41yC0sjOOIL3Z/IuEi5XW7FOPC1MM54VeD6Bp8GSkMbv+8brIf/HXxNFzd
	 o2NZT9mIfuQtar61rgIHk79t0Beq/APXu9HR3Jcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA69DF80305;
	Mon,  9 Dec 2019 19:59:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 109D1F802A2; Mon,  9 Dec 2019 19:59:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 17D73F8029A
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:59:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17D73F8029A
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30F741396;
 Mon,  9 Dec 2019 10:59:06 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A430C3F6CF;
 Mon,  9 Dec 2019 10:59:05 -0800 (PST)
Date: Mon, 09 Dec 2019 18:59:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20191204211556.12671-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191204211556.12671-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: intel/skl/hda - export number of
	digital microphones via control components" to the asoc tree
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: intel/skl/hda - export number of digital microphones via control components

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 8cd9956f61c65022209ce6d1e55ed12aea12357d Mon Sep 17 00:00:00 2001
From: Jaroslav Kysela <perex@perex.cz>
Date: Wed, 4 Dec 2019 15:15:44 -0600
Subject: [PATCH] ASoC: intel/skl/hda - export number of digital microphones
 via control components

It is required for the auto-detection in the user space (for UCM).

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20191204211556.12671-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 8 ++++++++
 sound/soc/sof/intel/hda.c                    | 3 ++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 4e45901e3a2f..11eaee9ae41f 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -100,6 +100,8 @@ static struct snd_soc_card hda_soc_card = {
 	.late_probe = skl_hda_card_late_probe,
 };
 
+static char hda_soc_components[30];
+
 #define IDISP_DAI_COUNT		3
 #define HDAC_DAI_COUNT		2
 #define DMIC_DAI_COUNT		2
@@ -183,6 +185,12 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 	hda_soc_card.dev = &pdev->dev;
 	snd_soc_card_set_drvdata(&hda_soc_card, ctx);
 
+	if (mach->mach_params.dmic_num > 0) {
+		snprintf(hda_soc_components, sizeof(hda_soc_components),
+				"cfg-dmics:%d", mach->mach_params.dmic_num);
+		hda_soc_card.components = hda_soc_components;
+	}
+
 	return devm_snd_soc_register_card(&pdev->dev, &hda_soc_card);
 }
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 4596239c63d8..98512a338748 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -351,7 +351,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	const char *tplg_filename;
 	const char *idisp_str;
 	const char *dmic_str;
-	int dmic_num;
+	int dmic_num = 0;
 	int codec_num = 0;
 	int i;
 #endif
@@ -472,6 +472,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 		mach_params->codec_mask = bus->codec_mask;
 		mach_params->platform = dev_name(sdev->dev);
 		mach_params->common_hdmi_codec_drv = hda_codec_use_common_hdmi;
+		mach_params->dmic_num = dmic_num;
 	}
 
 	/* create codec instances */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
