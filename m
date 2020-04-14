Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC9A1A80EB
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 17:04:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F63216A1;
	Tue, 14 Apr 2020 17:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F63216A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586876665;
	bh=hJDh7EaWhZf8LcP3NbG8CQBRkXS4ky85CVdPSmxVqJ4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=X4V9y5jZa9OuoFsklJDU9C+ehUlzR7dbYzLvMYTYJLKBLe6fhgPzeLyQ296dWrnAn
	 PGuFy1PSA/1XvfYyUd9Yd1qhyv2LQRJZc6BVwzYIak2IuewxUHIaf7vpVP5IlnAkyW
	 2ufzdFYKjUCafhN3TnZbuRCMuheIucc/mTcD3zFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59DFCF803B1;
	Tue, 14 Apr 2020 16:48:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 776DFF80371; Tue, 14 Apr 2020 16:48:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB836F8034E
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 16:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB836F8034E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VpDegGgQ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E2CD620578;
 Tue, 14 Apr 2020 14:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586875703;
 bh=hJDh7EaWhZf8LcP3NbG8CQBRkXS4ky85CVdPSmxVqJ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=VpDegGgQLo/NAVmHh0UYxXKafXMIKEH0/MPvjIX0a9REhETg4iTdEFzqnBLlXJZ1D
 Oal/ial3xr9IwvGCkCSN4lDtl/K9uxiytSzGRJ/pwM0DxCAa3RhZ13KhMiufXW8hxg
 4ia18ZZyIP9h+huQn4oAVdJemoEUdnMKf1JZpzAk=
Date: Tue, 14 Apr 2020 15:48:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Hui Wang <hui.wang@canonical.com>
Subject: Applied "ASoC: intel/skl/hda - set autosuspend timeout for hda
 codecs" to the asoc tree
In-Reply-To: <20200409185827.16255-3-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200409185827.16255-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Clarex Zhou <clarex.zhou@intel.com>, Mark Brown <broonie@kernel.org>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: intel/skl/hda - set autosuspend timeout for hda codecs

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 3a24f135e6cc58c2dc042dde44031ec31b706ce5 Mon Sep 17 00:00:00 2001
From: Hui Wang <hui.wang@canonical.com>
Date: Thu, 9 Apr 2020 13:58:16 -0500
Subject: [PATCH] ASoC: intel/skl/hda - set autosuspend timeout for hda codecs

On some Lenovo and HP laptops, if both codec driver and SOF driver
are in runtime suspend mode, we plug a headset to the audio jack,
the headphone could be detected but Mic couldn't.

That is because when plugging, the headphone triggers a unsol event
first, and about 0.7s later (on the Lenovo X1 Carbon 7th), the Mic
triggers a unsol event. But if the codec driver enters runtime suspend
within 0.7s, the Mic can't trigger the unsol event.

If we don't set autosuspend_delay to a non-zero value for the hda codec
driver, it will enter runtime suspend immediately after the headphone
triggers the unsol event.

Follow the sequence of legacy hda driver and set a autosuspend delay
of 1sec after card registration (refer to pci/hda/hda_intel.c and
pci/hda/hda_codec.c).

Co-developed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Co-developed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Clarex Zhou <clarex.zhou@intel.com>
Link: https://lore.kernel.org/r/20200409185827.16255-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 29 +++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 3be764299ab0..64197b010e7d 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -113,6 +113,8 @@ static char hda_soc_components[30];
 #define IDISP_ROUTE_COUNT	(IDISP_DAI_COUNT * 2)
 #define IDISP_CODEC_MASK	0x4
 
+#define HDA_CODEC_AUTOSUSPEND_DELAY_MS 1000
+
 static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 {
 	struct snd_soc_card *card = &hda_soc_card;
@@ -168,6 +170,27 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 	return 0;
 }
 
+static void skl_set_hda_codec_autosuspend_delay(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *rtd =
+		list_first_entry(&card->rtd_list,
+				 struct snd_soc_pcm_runtime, list);
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct hdac_hda_priv *hda_pvt;
+
+	if (!codec_dai)
+		return;
+
+	/*
+	 * all codecs are on the same bus, so it's sufficient
+	 * to lookup the first runtime and its codec, and set
+	 * power save defaults for all codecs on the bus
+	 */
+	hda_pvt = snd_soc_component_get_drvdata(codec_dai->component);
+	snd_hda_set_power_save(hda_pvt->codec.bus,
+			       HDA_CODEC_AUTOSUSPEND_DELAY_MS);
+}
+
 static int skl_hda_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach;
@@ -206,7 +229,11 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 		hda_soc_card.components = hda_soc_components;
 	}
 
-	return devm_snd_soc_register_card(&pdev->dev, &hda_soc_card);
+	ret = devm_snd_soc_register_card(&pdev->dev, &hda_soc_card);
+	if (!ret)
+		skl_set_hda_codec_autosuspend_delay(&hda_soc_card);
+
+	return ret;
 }
 
 static struct platform_driver skl_hda_audio = {
-- 
2.20.1

