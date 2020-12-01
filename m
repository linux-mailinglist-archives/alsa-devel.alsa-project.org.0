Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D59852CA3DE
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 14:30:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 665CB17C9;
	Tue,  1 Dec 2020 14:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 665CB17C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606829412;
	bh=k8NR5XKvM3eZqA9cBL/lGpKp3+xtQCAzKDgPKM4l4rw=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fty6z7I94oC+JFvqVF9nGqhF8/+uy2/hCQIHUEGvRSXrW1ZqjicGBIijwbXAtV18H
	 YwZUhOgcbom57Sop7efYJrnbcoGfof4NWE+VDJZhyYCTnBAr6vO8Ogyrbdu08BC1WU
	 KWjo4qin+CdkTuCNWXqRPHD7TIsY+YN5I6MMU8D0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E468CF804F2;
	Tue,  1 Dec 2020 14:27:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7DBCF804F1; Tue,  1 Dec 2020 14:26:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [IPv6:2607:f8b0:4864:20::1049])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D252F804EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 14:26:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D252F804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="P+0WQ1ph"
Received: by mail-pj1-x1049.google.com with SMTP id cm17so1053459pjb.2
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 05:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=SQuaclQlbq8ZR5gX0U6eAnPIjuDHifr/n0O8Gkw3oUU=;
 b=P+0WQ1phBJO1qp5WKeFAKy04MY9rRx4Edu4MF2zM+0Z18+QN9jK+WYmhaxsvb6HRw6
 n9xnnsqZM07DyTXbBerMEyjrF94sAzO7a5JE9kqJcz+tlMJq3mAZHQ5Rq2ok+hEOlMvv
 MaWL2YIwSDMXAfuzMhI1zHB8YVHp8GBIxS3BWsUOS9X9v8tiueSizWJfr5NbauebWbhA
 E3thCrfSOrA8//jRhgqLAnzTGImpwUvlmL/YW43hPp1PyxaG0SrtOPv9jVeVkqNWEGN5
 Q5mcGhHWiMhuweoBIIli6dzHyhm5XWpW1aVORGSPLC632WfvbQmU4boOnMN92wYckdMi
 1hYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=SQuaclQlbq8ZR5gX0U6eAnPIjuDHifr/n0O8Gkw3oUU=;
 b=A3iqjs7RPWmgNpbFfMR5Q/LQvANGQA8HNg6PMMPdHWxLDudnw1XVCqL7TCvuTBfiqK
 E7g2x+FJ4eWE0Eel0stooBqL0B2gy6GlJVnrYcy1m7t39WlnkUjB22pHkvnDE86CFRmS
 X7tCV85dAJZZXrEuVSVm47iuZkbDnq7A7IXkiEu4zGGNR15r1FlLYnchQ4BA0jUdohjM
 CqDgwr7I8fy5HWTdP3giiUWG82SmvqeFlOyWDanWLFBDuxef0hbabqQJsEO6V/3IPEEK
 vThhhRN/ETu5dk53w/EXnBkddnvZNTFOSrThWB0I2W6mbpR9KybvjHarbi5ttKmxFu7i
 Mr0Q==
X-Gm-Message-State: AOAM531ctNvSF0A1WlLdro0uJnvVw19eCpS3NhtpzqFc8XAylGyuZrTY
 vVw3JzRNrU/zoYOr8YLlN1wAg5Pl6V8f
X-Google-Smtp-Source: ABdhPJxd09EeTMvgoN7wMG5sCX3SEvxsILCwYqI54xEA2B9ORVM8M4ipscINbd9qpITlRVIgZbEJKOoZv57O
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:17a4:: with SMTP id
 q33mr295837pja.0.1606829210557; Tue, 01 Dec 2020 05:26:50 -0800 (PST)
Date: Tue,  1 Dec 2020 21:26:14 +0800
In-Reply-To: <20201201132614.1691352-1-tzungbi@google.com>
Message-Id: <20201201132614.1691352-7-tzungbi@google.com>
Mime-Version: 1.0
References: <20201201132614.1691352-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [RESEND PATCH 6/6] ASoC: mediatek: mt8192: support rt1015p_rt5682
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

Supports machines with rt1015p and rt5682.  Uses new proposed compatible
string "mt8192_mt6359_rt1015p_rt5682".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 49772dfc92c7..8d3dcfb6a580 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -175,6 +175,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
 	depends on SND_SOC_MT8192
 	select SND_SOC_MT6359
 	select SND_SOC_RT1015
+	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
 	help
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 0d2cc6800f08..716fbb4126b5 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -560,6 +560,11 @@ SND_SOC_DAILINK_DEFS(i2s3_rt1015,
 						   RT1015_CODEC_DAI)),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+SND_SOC_DAILINK_DEFS(i2s3_rt1015p,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("rt1015p", "HiFi")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 SND_SOC_DAILINK_DEFS(i2s5,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S5")),
 		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
@@ -997,6 +1002,41 @@ static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_card = {
 	.num_configs = ARRAY_SIZE(rt1015_amp_conf),
 };
 
+static const struct snd_soc_dapm_widget
+mt8192_mt6359_rt1015p_rt5682_widgets[] = {
+	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route mt8192_mt6359_rt1015p_rt5682_routes[] = {
+	/* speaker */
+	{ "Speakers", NULL, "Speaker" },
+	/* headset */
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+	{ "IN1P", NULL, "Headset Mic" },
+};
+
+static const struct snd_kcontrol_new mt8192_mt6359_rt1015p_rt5682_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682_card = {
+	.name = "mt8192_mt6359_rt1015p_rt5682",
+	.owner = THIS_MODULE,
+	.dai_link = mt8192_mt6359_dai_links,
+	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
+	.controls = mt8192_mt6359_rt1015p_rt5682_controls,
+	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_controls),
+	.dapm_widgets = mt8192_mt6359_rt1015p_rt5682_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_widgets),
+	.dapm_routes = mt8192_mt6359_rt1015p_rt5682_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
+};
+
 static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
@@ -1032,6 +1072,16 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 				dai_link->platforms = i2s3_rt1015_platforms;
 				dai_link->num_platforms =
 					ARRAY_SIZE(i2s3_rt1015_platforms);
+			} else if (card == &mt8192_mt6359_rt1015p_rt5682_card) {
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
 
@@ -1054,6 +1104,10 @@ static const struct of_device_id mt8192_mt6359_dt_match[] = {
 		.compatible = "mediatek,mt8192_mt6359_rt1015_rt5682",
 		.data = &mt8192_mt6359_rt1015_rt5682_card,
 	},
+	{
+		.compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682",
+		.data = &mt8192_mt6359_rt1015p_rt5682_card,
+	},
 	{}
 };
 #endif
-- 
2.29.2.454.gaff20da3a2-goog

