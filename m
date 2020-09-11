Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAA8265721
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 04:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC51168B;
	Fri, 11 Sep 2020 04:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC51168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599792696;
	bh=4EX5/X0/cMfjgR/scmTtcnPu4AZznHKUFlnkJONkMyk=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EZd2Mpl7TG39OZk068oVxMLedn/ISwdZ28sGrRYOjIt1PHF5vHUeVuizSTuqdWMR/
	 NugJunhZmgMxqluds3hTgRkKG1Wuuk4Q6zSIpEziV6s59cgbEWM67kN2jkK77kvAvY
	 D9i4v8VxdFhdFy536DoOUB+Id2aXryljNUno3Ulc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 180C0F802C4;
	Fri, 11 Sep 2020 04:49:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 693DDF802C2; Fri, 11 Sep 2020 04:49:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6034FF80240
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 04:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6034FF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="dLZIjf7n"
Received: by mail-qt1-x84a.google.com with SMTP id e11so5578842qth.21
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 19:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=OL6Xca6wUTPR4KoDA1xBq3ODskMxZl1kDYmO7BayCTk=;
 b=dLZIjf7n0npnKd6VdQ//HGxZeCosdJZA3pvmsUmXYVUE/733J5SFK6o8U2lpv8RBPt
 hfvAE0s/nKApYLm2W2T8h/TtgDZCWJUOtUCXi2kwm3XBeH+wPmD8CerR52z2G/hQRJ2R
 yB2QYDAYuS52CkrvREjjyA1s8lRFQCl0wtjYwmJKcOyCBmLu7aNf4XtCFldqD+wB9gcV
 qqxeoLGMHFn+KoC3rZcxmCeMwm4/VJWbjn3IJVHhMqstsX8LZQn4dcpxEWRut3VVc7NX
 Ay/yK58EhKVAF88//yuY2BQ0dAH/udf//+HLzLGDYLa3R4txJiLLG6xGN7Sp5YiQ4/I0
 sR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=OL6Xca6wUTPR4KoDA1xBq3ODskMxZl1kDYmO7BayCTk=;
 b=qMFG/QxptlvR31tgHREzGCEmBTyeikQ96RGJIjQB4Dnm34/Rqg3Oy1ayul7Xf7uBeY
 ncbPburJ3LQdXsWqTKalbtQIitab24fJHSQ5FB4BZ5WCzPv61vSZ0jdOf7TCuHoDP9XK
 poC5p9WCTiSbgLljInJ1lGrSATWMmmEgTlMDXAvDDG5P8vkK++oj4+AdoVkEVER8+2wV
 7TVIJxpadXC36fK6jk1QP2CI9ZgTrCGHiSwTT1DVi//kzXXsgJrZr2Jl7y0GAwMeDopZ
 6gIZR1LfFiCuy4mLd6BUB+zFzi566E4T+k4jHTfFhhjCSrZ2jVrzMs+d7u1Z5wQrYuJs
 mlEg==
X-Gm-Message-State: AOAM530a/JdAC2x2YxLyDwFor7gFpHy+COALpFbZURs3PI1Celm85uq1
 zTQdRIRR93DwgioB5TK8aNUH6wY37vqK
X-Google-Smtp-Source: ABdhPJytnnY1L+ZcVp1rnBboTBm+V2Y6jLV/v4L2ZulAlFV9n0VOjVW5DEEiQmMM5ybQ3zgxVrhZId/WvKbk
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:d848:: with SMTP id
 i8mr119788qvj.31.1599792536009; Thu, 10 Sep 2020 19:48:56 -0700 (PDT)
Date: Fri, 11 Sep 2020 10:48:33 +0800
In-Reply-To: <20200911024833.1673961-1-tzungbi@google.com>
Message-Id: <20200911024833.1673961-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200911024833.1673961-1-tzungbi@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH 2/2] ASoC: mediatek: mt8183-da7219: support machine driver
 with rt1015p
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Supports machine driver with rt1015p ("mt8183_da7219_rt1015p").
Embeds in the existing mt8183-da7219-max98357.c because they share
most of the code.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index f7bc007bbdec..76e055d1dfb2 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -140,6 +140,7 @@ config SND_SOC_MT8183_DA7219_MAX98357A
 	select SND_SOC_MT6358
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT1015
+	select SND_SOC_RT1015P
 	select SND_SOC_DA7219
 	select SND_SOC_BT_SCO
 	select SND_SOC_HDMI_CODEC
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 06d0a4f80fc1..68fe23b96b14 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -348,6 +348,12 @@ SND_SOC_DAILINK_DEFS(i2s3_rt1015,
 			   COMP_CODEC(DA7219_DEV_NAME, DA7219_CODEC_DAI)),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+SND_SOC_DAILINK_DEFS(i2s3_rt1015p,
+	DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("rt1015p", "HiFi"),
+			   COMP_CODEC(DA7219_DEV_NAME, DA7219_CODEC_DAI)),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 SND_SOC_DAILINK_DEFS(i2s5,
 	DAILINK_COMP_ARRAY(COMP_CPU("I2S5")),
 	DAILINK_COMP_ARRAY(COMP_CODEC("bt-sco", "bt-sco-pcm")),
@@ -641,6 +647,23 @@ static struct snd_soc_card mt8183_da7219_rt1015_card = {
 	.num_configs = ARRAY_SIZE(mt8183_da7219_rt1015_codec_conf),
 };
 
+static struct snd_soc_card mt8183_da7219_rt1015p_card = {
+	.name = "mt8183_da7219_rt1015p",
+	.owner = THIS_MODULE,
+	.controls = mt8183_da7219_max98357_snd_controls,
+	.num_controls = ARRAY_SIZE(mt8183_da7219_max98357_snd_controls),
+	.dapm_widgets = mt8183_da7219_max98357_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8183_da7219_max98357_dapm_widgets),
+	.dapm_routes = mt8183_da7219_max98357_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8183_da7219_max98357_dapm_routes),
+	.dai_link = mt8183_da7219_dai_links,
+	.num_links = ARRAY_SIZE(mt8183_da7219_dai_links),
+	.aux_dev = &mt8183_da7219_max98357_headset_dev,
+	.num_aux_devs = 1,
+	.codec_conf = mt6358_codec_conf,
+	.num_configs = ARRAY_SIZE(mt6358_codec_conf),
+};
+
 static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
@@ -696,6 +719,19 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 				dai_link->platforms = i2s3_rt1015_platforms;
 				dai_link->num_platforms =
 					ARRAY_SIZE(i2s3_rt1015_platforms);
+			} else if (card == &mt8183_da7219_rt1015p_card) {
+				dai_link->be_hw_params_fixup =
+					mt8183_rt1015_i2s_hw_params_fixup;
+				dai_link->ops = &mt8183_da7219_i2s_ops;
+				dai_link->cpus = i2s3_rt1015p_cpus;
+				dai_link->num_cpus =
+					ARRAY_SIZE(i2s3_rt1015p_cpus);
+				dai_link->codecs = i2s3_rt1015p_codecs;
+				dai_link->num_codecs =
+					ARRAY_SIZE(i2s3_rt1015p_codecs);
+				dai_link->platforms = i2s3_rt1015p_platforms;
+				dai_link->num_platforms =
+					ARRAY_SIZE(i2s3_rt1015p_platforms);
 			}
 		}
 
@@ -742,6 +778,10 @@ static const struct of_device_id mt8183_da7219_max98357_dt_match[] = {
 		.compatible = "mediatek,mt8183_da7219_rt1015",
 		.data = &mt8183_da7219_rt1015_card,
 	},
+	{
+		.compatible = "mediatek,mt8183_da7219_rt1015p",
+		.data = &mt8183_da7219_rt1015p_card,
+	},
 	{}
 };
 #endif
-- 
2.28.0.526.ge36021eeef-goog

