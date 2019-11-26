Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C9B109C61
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 11:36:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A499D1730;
	Tue, 26 Nov 2019 11:35:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A499D1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574764570;
	bh=Qwn/KyvNHNK9zB2FC1Nlvdw1HeeEt0YinZicaHUCGQk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CBXrpMV7SF9JhGZD9VJXewzSLCv49EtnIrs3GOKZ1Emav1vhe7/mer6acyU9zhfSt
	 c4faSXeiXatvF6TvylzdyGtCMWUQr3esFZvIPR+iXKxf6YmhmmhOHNgEUWrh5PyK18
	 nlIPatwHp6uv9Qg5dGrs6QVPIlUwysSqlW9dVCxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50EE0F80159;
	Tue, 26 Nov 2019 11:34:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DC50F80159; Tue, 26 Nov 2019 11:34:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8C0EF80109
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 11:34:21 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 04F96A0048;
 Tue, 26 Nov 2019 11:34:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 04F96A0048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1574764461; bh=eWd20pLDAs4Q24FBEJ6u96SlAbicAm2KZiUd0xVY+nM=;
 h=From:To:Cc:Subject:Date:From;
 b=SJYxoUWkH2HNHStV5iIaeiuVApqmGyzZRDBjQSBSWEXlaU95vuKSO8/xjX5aC3ESU
 Lc2yp6RjldSkkSIqFT4U7AG87g98qn9X3q6DMRcXJwghINi8BFHq1b+tEi51BGh9Ti
 3FEh0LqmBGlyM5HxY11Ld4OFWXBNWe2GpTfvlNes=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 26 Nov 2019 11:34:15 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Tue, 26 Nov 2019 11:34:04 +0100
Message-Id: <20191126103404.29534-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: intel/skl/hda - export number of digital
	microphones via control components
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

It is required for the auto-detection in the user space (for UCM).

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
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
index 7dc0018dc4c3..92fffca76af5 100644
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
@@ -465,6 +465,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
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
