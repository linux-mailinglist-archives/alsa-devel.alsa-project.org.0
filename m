Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC862FCC6B
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 09:12:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8F1E17F6;
	Wed, 20 Jan 2021 09:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8F1E17F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611130365;
	bh=Df24PrR4ZHSTi17K/cmXn/adg/JFPFc//H80xDdjKaU=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QZygiaAJTfbTgXpu+xjs7zPguZeK7UYdK0oZ9cu9xIZ1v+8eqEokR+pWTySk4izvf
	 iUUa7i0pOGUnURKmTIJG4IVBuDrzdp+yrqI+LSuqJ96J6Y9uoKnabGN9vhcp+1mQeh
	 2i4mI3sjn1fK0GKY3YBma5INpRFmHjtfsvXwm+tI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6766F804EC;
	Wed, 20 Jan 2021 09:09:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47EFBF804D6; Wed, 20 Jan 2021 09:09:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A16CF804D6
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 09:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A16CF804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="XHin27U/"
Received: by mail-qt1-x849.google.com with SMTP id 22so20582410qty.14
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 00:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=sQhmAabxwvCN6VVpbop+UBorAEcNt9ytsxAM/0+JvF8=;
 b=XHin27U/N0fQ34PIArxAW2shOw/rjlWwDl3nOAM2NMubmTTzcW1XTDK74gQ1R7RMEn
 0aa47E5WiPHsN90DZqMoVTSTOV08s7sQ19nN53hYxydGfm6dhzAMlaG3+yIFqub69tcx
 q+DRAUhp8hQ7PFUV1nS+QZT91phyTujh4P56fcQXiwRQRyF3lQIpUjAmcz+oMUK4FnNW
 zQxJ9H5GWUx/uyuccaQsFx1a9wFkGDuklQiNxKQf8cuvSrp8S1Qz1z4iTNme3UdcoiwF
 4OaMlf0ltrlbVm5XpTIlWa6vO/e0tAmw86z0AmM3QnLQtLHN0hZE28oWI1YOvnOLeorc
 v01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=sQhmAabxwvCN6VVpbop+UBorAEcNt9ytsxAM/0+JvF8=;
 b=B5VsOo1YYPiqyuc3qws1S7h6WLP32MF2wPVFQylvQpwIm0v71gJW07rzOO7pBvfENe
 WZylrMWgTTiBKYyxSVJg25HfIToc9+UfqwmI+2OgoHLc+CEpZztV3NRpcnmZfx8hP4S3
 8d/zAJXj44lkbmKsH38TJ8Wobafw+3IW6OGCSn2w3XJzYpYTsx0qnWhYt8zyJO9uImDv
 Jfb8TI5bmuTGu/kTPrsdDlxiArNfgL3PlbFNXe73GLyGMO3MWufrMBzAtf9rz4+a3Kvu
 VXfEJvlDwEAWOXvoxirvoVqUaiZs5atW5XhRa1T47JXNiaKWdNz6Rv6b/EePPA24zXPh
 vGKQ==
X-Gm-Message-State: AOAM530RQB2bIuqLCbfJlTzMN5O+FQysWPQOLKMrFNt+o4qc1fDo8ztl
 29iRWRN1AeZbnnDftlZCJ8w5ehmP0u9i
X-Google-Smtp-Source: ABdhPJxehndhb8u41XwHipFb3V90nONbfNuOZLuAMKwJz+KEqMbLrtwgT3VtjA53R1Q3SW2jghvJY22UV08P
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:1164:8893:969a:b338])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:14ae:: with SMTP id
 bo14mr8437792qvb.16.1611130161829; Wed, 20 Jan 2021 00:09:21 -0800 (PST)
Date: Wed, 20 Jan 2021 16:08:50 +0800
In-Reply-To: <20210120080850.699354-1-tzungbi@google.com>
Message-Id: <20210120080850.699354-6-tzungbi@google.com>
Mime-Version: 1.0
References: <20210120080850.699354-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH 5/5] ASoC: mediatek: mt8192-mt6359: support audio over DP
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org
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

If the DTS property is specified, the DP bridge should populate a
"hdmi-codec" platform device (sound/soc/codecs/hdmi-codec.c).

The "hdmi-codec" device is the communication relayer between the ASoC
machine driver and the DP bridge.  For example:
- Notifies DP bridge when setting hw_param.
- Notifies ASoC when jack detection events.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 39 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 8ea24b32a535..cc0fc72305d2 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -33,6 +33,7 @@
 
 struct mt8192_mt6359_priv {
 	struct snd_soc_jack headset_jack;
+	struct snd_soc_jack hdmi_jack;
 };
 
 static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
@@ -329,6 +330,23 @@ static int mt8192_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 	return snd_soc_component_set_jack(cmpnt_codec, jack, NULL);
 };
 
+static int mt8192_mt6359_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	struct mt8192_mt6359_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &priv->hdmi_jack, NULL, 0);
+	if (ret) {
+		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	return snd_soc_component_set_jack(cmpnt_codec, &priv->hdmi_jack, NULL);
+}
+
 static int mt8192_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				      struct snd_pcm_hw_params *params)
 {
@@ -600,7 +618,7 @@ SND_SOC_DAILINK_DEFS(pcm2,
 
 SND_SOC_DAILINK_DEFS(tdm,
 		     DAILINK_COMP_ARRAY(COMP_CPU("TDM")),
-		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
@@ -936,8 +954,14 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 	{
 		.name = "TDM",
 		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_DSP_A |
+			   SND_SOC_DAIFMT_IB_NF |
+			   SND_SOC_DAIFMT_CBM_CFM,
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		.ignore = 1,
+		.init = mt8192_mt6359_hdmi_init,
 		SND_SOC_DAILINK_REG(tdm),
 	},
 };
@@ -948,6 +972,7 @@ mt8192_mt6359_rt1015_rt5682_widgets[] = {
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_OUTPUT("TDM Out"),
 };
 
 static const struct snd_soc_dapm_route mt8192_mt6359_rt1015_rt5682_routes[] = {
@@ -958,6 +983,8 @@ static const struct snd_soc_dapm_route mt8192_mt6359_rt1015_rt5682_routes[] = {
 	{ "Headphone Jack", NULL, "HPOL" },
 	{ "Headphone Jack", NULL, "HPOR" },
 	{ "IN1P", NULL, "Headset Mic" },
+	/* TDM */
+	{ "TDM Out", NULL, "TDM" },
 };
 
 static const struct snd_kcontrol_new mt8192_mt6359_rt1015_rt5682_controls[] = {
@@ -1031,7 +1058,7 @@ static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682_card = {
 static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
-	struct device_node *platform_node;
+	struct device_node *platform_node, *hdmi_codec;
 	int ret, i;
 	struct snd_soc_dai_link *dai_link;
 	const struct of_device_id *match;
@@ -1051,6 +1078,9 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 	card = (struct snd_soc_card *)match->data;
 	card->dev = &pdev->dev;
 
+	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
+				      "mediatek,hdmi-codec", 0);
+
 	for_each_card_prelinks(card, i, dai_link) {
 		if (strcmp(dai_link->name, "I2S3") == 0) {
 			if (card == &mt8192_mt6359_rt1015_rt5682_card) {
@@ -1077,6 +1107,11 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 			}
 		}
 
+		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
+			dai_link->codecs->of_node = hdmi_codec;
+			dai_link->ignore = 0;
+		}
+
 		if (!dai_link->platforms->name)
 			dai_link->platforms->of_node = platform_node;
 	}
-- 
2.30.0.284.gd98b1dd5eaa7-goog

