Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A5310EEC3
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 18:52:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C436C828;
	Mon,  2 Dec 2019 18:51:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C436C828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575309122;
	bh=JH1bHL0hZYMtdafFVvOEcgmJICaT1Kon4Ym9dbyAA9E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vfIHWdkTvMVW0nKe22YafDNTz5KH5ng/c01NFj3q0/Fo+xc9anCEGRDsd4JjciJCh
	 KxPYRW1dzpXlaWDupx2Q5STQXiTJS3lKCJOhh8LOm6wCvqhC1ibQRMZFuHEJrmCX9O
	 x7YWUyMxrDSo49LgCTy9yQ78rYeU+UCI6I5LQbEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42024F80246;
	Mon,  2 Dec 2019 18:48:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 555C6F8021D; Mon,  2 Dec 2019 18:48:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from node.akkea.ca (node.akkea.ca [192.155.83.177])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3221F801D9
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 18:48:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3221F801D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="Of/kzTfg"; 
 dkim=pass (1024-bit key) header.d=akkea.ca header.i=@akkea.ca
 header.b="Of/kzTfg"
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id AB3454E201A;
 Mon,  2 Dec 2019 17:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1575308921; bh=G5vaGCDrjN3o6pi2NVpdKXh0OAe+GAhoowcjoaH2b54=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Of/kzTfgYvw4remviMNGT6ec9GPUDfmztvI21zCw3Yty2/9Zhj0MhTDBj6guJDf6k
 vn1pJbt3kKR8OaPp9ufsybizx73RazGUnF3IYFs4bJ26PH/SS7Zu8rHjW4ge5L0shz
 mr2gYYt5B+Q6Tsbsl4oqm7l5HT5DVqmdDiBhd8qU=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qiB4KwjmIXlp; Mon,  2 Dec 2019 17:48:41 +0000 (UTC)
Received: from thinkpad-tablet.cg.shawcable.net
 (S0106905851b613e9.cg.shawcable.net [70.77.244.40])
 by node.akkea.ca (Postfix) with ESMTPSA id 904B64E2006;
 Mon,  2 Dec 2019 17:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1575308921; bh=G5vaGCDrjN3o6pi2NVpdKXh0OAe+GAhoowcjoaH2b54=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Of/kzTfgYvw4remviMNGT6ec9GPUDfmztvI21zCw3Yty2/9Zhj0MhTDBj6guJDf6k
 vn1pJbt3kKR8OaPp9ufsybizx73RazGUnF3IYFs4bJ26PH/SS7Zu8rHjW4ge5L0shz
 mr2gYYt5B+Q6Tsbsl4oqm7l5HT5DVqmdDiBhd8qU=
From: "Angus Ainslie (Purism)" <angus@akkea.ca>
To: kernel@puri.sm
Date: Mon,  2 Dec 2019 10:48:30 -0700
Message-Id: <20191202174831.13638-2-angus@akkea.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202174831.13638-1-angus@akkea.ca>
References: <20191202174831.13638-1-angus@akkea.ca>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Enrico Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>
Subject: [alsa-devel] [PATCH 1/2] sound: codecs: gtm601: add Broadmobi bm818
	sound profile
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

The Broadmobi bm818 uses stereo sound at 48Khz sample rate

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 sound/soc/codecs/gtm601.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/gtm601.c b/sound/soc/codecs/gtm601.c
index d454294c8d06..302569bc46ff 100644
--- a/sound/soc/codecs/gtm601.c
+++ b/sound/soc/codecs/gtm601.c
@@ -37,7 +37,7 @@ static struct snd_soc_dai_driver gtm601_dai = {
 		.channels_max = 1,
 		.rates = SNDRV_PCM_RATE_8000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE,
-		},
+	},
 	.capture = {
 		.stream_name = "Capture",
 		.channels_min = 1,
@@ -47,6 +47,24 @@ static struct snd_soc_dai_driver gtm601_dai = {
 	},
 };
 
+static struct snd_soc_dai_driver bm818_dai = {
+	.name = "bm818",
+	.playback = {
+		.stream_name = "Playback",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.capture = {
+		.stream_name = "Capture",
+		.channels_min = 2,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_48000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+};
+
 static const struct snd_soc_component_driver soc_component_dev_gtm601 = {
 	.dapm_widgets		= gtm601_dapm_widgets,
 	.num_dapm_widgets	= ARRAY_SIZE(gtm601_dapm_widgets),
@@ -60,13 +78,20 @@ static const struct snd_soc_component_driver soc_component_dev_gtm601 = {
 
 static int gtm601_platform_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
+	struct snd_soc_dai_driver *dai_driver = &gtm601_dai;
+
+	if (np && of_device_is_compatible(np, "broadmobi,bm818"))
+		dai_driver = &bm818_dai;
+
 	return devm_snd_soc_register_component(&pdev->dev,
-			&soc_component_dev_gtm601, &gtm601_dai, 1);
+			&soc_component_dev_gtm601, dai_driver, 1);
 }
 
 #if defined(CONFIG_OF)
 static const struct of_device_id gtm601_codec_of_match[] = {
 	{ .compatible = "option,gtm601", },
+	{ .compatible = "broadmobi,bm818", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, gtm601_codec_of_match);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
