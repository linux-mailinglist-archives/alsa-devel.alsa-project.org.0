Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5266D2921FF
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 06:49:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF1617B4;
	Mon, 19 Oct 2020 06:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF1617B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603082970;
	bh=xpooQ390Z4xjNOVmaAwJErNNuxZxQXcgVNqgKNIUopE=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PI4taEVddZjPWJpTNyls5T9LPgvD8qab+i+U4sflhnlzimUdKNIRKH1C9Z5pLi2AA
	 Xnq6SNdmQ+yVSN7YnJP3v4H40mb+ynY8F5g+K+WG+fdm4hkmfwBVkLpppyLTL9Upgz
	 lPzZnV+EALlN/90bREmZ5aVgjntHIdlC2NM1kcIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76BA0F80264;
	Mon, 19 Oct 2020 06:47:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A416F80247; Mon, 19 Oct 2020 06:47:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB7B1F8010F
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 06:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB7B1F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="dWFBSPDc"
Received: by mail-yb1-xb4a.google.com with SMTP id v4so10314691ybp.3
 for <alsa-devel@alsa-project.org>; Sun, 18 Oct 2020 21:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=i+hW0NHkwqdVP+vdoT2uhmHt5Woaig2J2wJn4kfZA2Y=;
 b=dWFBSPDcz9yN0hoCmv0/Dg528NP37Sb/mu6mkXLs7YKzNcf0sxFFknImJkEdo5Kcp/
 hFzF0l5DbqW0mjuMOoDeJRjHRO1GoD+3Q0D+ZemSonBb9ewnKyFTRXsUmjtpPH7ZI7cF
 BKOcvjpH+Vi/bLns0AK0Gc4KplpHJ/1HWv2afvuVc4MEiiQuvwOtpg+mQiDjc07gJWET
 KrjM3jo7QdzLeouBZjTJHvFKXC+33+W38QMZ+Vn0CZeDY8d3NHLI7NtterW4sspaTs81
 dwYtQTKyif9kIXmZjxuJ1p3bs/iSfEVQDtTg+NRQO7rW9VEFFQeS6r38SkpKnIEH8NWv
 C9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=i+hW0NHkwqdVP+vdoT2uhmHt5Woaig2J2wJn4kfZA2Y=;
 b=VKCkH5GGytm4vop4dVZ2usVoRY/tGxSqlS7uYyiONZhmpX8y9iuARhctG2S5ecHeoS
 b4JKEzeZ7xlAPOidlfXOLTqkxbmCJIEzmVWJFWvbAS1tJc0+EmJ/OLUQ79tte4OMHWkN
 dD8YLM4rv+6hEf5jj/UP+2p7x/ZKLivIB0MrXDmsOqsRFrfumR0xWUDHWo7eHgW1GA0p
 vOJi6xMUDMLnz0Tq3ZQEMVvr+VQeAelq/A2NVGND5oQjcl0MtGTaqEeqq+F9zD6KIWAp
 4GWHaonPzGofQNQ/CEeaqD/ylOI8oWCHTo8rZaI+gEhPqYoRyRJ+xyDN4iBEwhItILzl
 lNAQ==
X-Gm-Message-State: AOAM533GgV/qzR1JGTFQN8HaIIeCfQIIUQs94BztA4G/lXp1P8EugX1j
 DD2f1430RhXaVhTYg7wz/N0TE8ARBsQu
X-Google-Smtp-Source: ABdhPJwnADu/8APtMIPkgCqiMwm8gvHPWf1g3Diaaya51b6c2E1KldyC3DakL8Jyimirmvg5QAfqMDBo2WS0
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:b5c2:: with SMTP id
 d2mr18810600ybg.102.1603082860320; Sun, 18 Oct 2020 21:47:40 -0700 (PDT)
Date: Mon, 19 Oct 2020 12:47:24 +0800
Message-Id: <20201019044724.1601476-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH] ASoC: mediatek: mt8183-da7219: fix DAPM paths for rt1015
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

RT1015's output widget name is "SPO" instead of "Speaker".  Fixes it to
use the correct names.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 31 +++++++++++++++----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index c2c1eb16fcc0..26e7d9a7198f 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -630,15 +630,34 @@ static struct snd_soc_codec_conf mt8183_da7219_rt1015_codec_conf[] = {
 	},
 };
 
+static const struct snd_kcontrol_new mt8183_da7219_rt1015_snd_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
+static const
+struct snd_soc_dapm_widget mt8183_da7219_rt1015_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+	SND_SOC_DAPM_PINCTRL("TDM_OUT_PINCTRL",
+			     "aud_tdm_out_on", "aud_tdm_out_off"),
+};
+
+static const struct snd_soc_dapm_route mt8183_da7219_rt1015_dapm_routes[] = {
+	{"Left Spk", NULL, "Left SPO"},
+	{"Right Spk", NULL, "Right SPO"},
+	{"I2S Playback", NULL, "TDM_OUT_PINCTRL"},
+};
+
 static struct snd_soc_card mt8183_da7219_rt1015_card = {
 	.name = "mt8183_da7219_rt1015",
 	.owner = THIS_MODULE,
-	.controls = mt8183_da7219_max98357_snd_controls,
-	.num_controls = ARRAY_SIZE(mt8183_da7219_max98357_snd_controls),
-	.dapm_widgets = mt8183_da7219_max98357_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(mt8183_da7219_max98357_dapm_widgets),
-	.dapm_routes = mt8183_da7219_max98357_dapm_routes,
-	.num_dapm_routes = ARRAY_SIZE(mt8183_da7219_max98357_dapm_routes),
+	.controls = mt8183_da7219_rt1015_snd_controls,
+	.num_controls = ARRAY_SIZE(mt8183_da7219_rt1015_snd_controls),
+	.dapm_widgets = mt8183_da7219_rt1015_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8183_da7219_rt1015_dapm_widgets),
+	.dapm_routes = mt8183_da7219_rt1015_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8183_da7219_rt1015_dapm_routes),
 	.dai_link = mt8183_da7219_dai_links,
 	.num_links = ARRAY_SIZE(mt8183_da7219_dai_links),
 	.aux_dev = &mt8183_da7219_max98357_headset_dev,
-- 
2.29.0.rc1.297.gfa9743e501-goog

