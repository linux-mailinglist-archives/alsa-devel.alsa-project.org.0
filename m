Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C31DAF38
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 16:09:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91D991691;
	Thu, 17 Oct 2019 16:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91D991691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571321363;
	bh=0NtcqLAvqDNiiJ7pmaXit1Y538syZHP5Cjfud1cfyaA=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dg5HJJkRWaGuuPIziqmR9woxEZCibAovBXAKJgFUvzY6HQ3epJ39NcEsMCwLq1cWh
	 dg/zGuAAIIHwVmPaZ9vDMDzkov/m/uk2+aj2vQLNO1FdS7SYWckadHlPZrT1qwBxf4
	 rlK2OtPuZ041s3zkbYUFxsSC1fLK/lv06LAIHeoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B611F804AA;
	Thu, 17 Oct 2019 16:01:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CEDAF8070D; Thu, 17 Oct 2019 16:01:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AECA7F80709
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 16:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AECA7F80709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rIhJwKUl"
Received: by mail-yw1-xc4a.google.com with SMTP id u131so1837441ywa.1
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=TGRk5VKUseteFNz9IdieAorUl/jPsDxLvDx05ItO45s=;
 b=rIhJwKUl3ey3DfK+hJ6gtObEbk8w9lJN8FwtQ2NDhIPHw4CpwQs48OQ5PSE3KVomXQ
 wz74Y141vWmpwb8ZRTXrrE86i8eeimnBsS/2LyG+c+UvvKddYJ1/l4YOCk0QoJ5UkOu4
 RdOcqkzxl0NJ/AU0vl4/20juJBCsHLKEv1kGqJTcA8ZNl+YF6DeFpJVBK4gDNk8McRvH
 atVYcVboBISGi9QJrmeigP+mn0knbkg58Ka/HjMz++Pgtojyj1TfH3n6RXhALL/gZEce
 d2eHY089pv+TiqqVS3XnXPB0a19+EQN8b25wG0lnvV9l5uQJhpMGTkLNRKCDFJ3pRBvr
 ccAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=TGRk5VKUseteFNz9IdieAorUl/jPsDxLvDx05ItO45s=;
 b=pTzAaDgNq9eMRTNp6MRRPKv+DSmrR1RxtrujZ5qb/W5KDdEXVhUVGAUb+QleoBwQfW
 joacjAzPb8Ayyd+PRVpeecfdoYGHfjxw5gG/XKINDTxsdVKpHFbg9vpOBlFGGkXgnluG
 0xFohs8MoYPRbRDUyFTuZTn33YhwPTu22w+S2vbNTNh5cx+qw63BrhIEYgiXCrisNIf5
 M8c6KRBN+NowNyQ0oHhO5PWBjhCUyXfyK+MhLa1cceDUvrVZ0C1RUcjUY9lqJ2hOvHo8
 Rn+JlkyoiHrVcu6vStFkC1uTrVomzdl4C86u7Mqolipqu+cnrwYpmF7XYsPKODBvR5T7
 +1qg==
X-Gm-Message-State: APjAAAXQFWtYhDx5Esv7HleEgxVq66kpAx9toRef0hafkAeYuCv6Y622
 Oz/+8MoEcbPxHAfUMgHHu0lwaqjkmjdP
X-Google-Smtp-Source: APXvYqz8GKngkqaQHrN7BhPxupi50PFCV7rAjAl4jrR2OAde0Swk8V7gi3iNkNVMCgVay+HRqi1fqwa4nods
X-Received: by 2002:a81:11d3:: with SMTP id 202mr2679548ywr.354.1571320884414; 
 Thu, 17 Oct 2019 07:01:24 -0700 (PDT)
Date: Thu, 17 Oct 2019 22:00:15 +0800
In-Reply-To: <20191017213539.00-tzungbi@google.com>
Message-Id: <20191017213539.10.Ibf012d0cd8679d846213606dc5f426aea1ff590a@changeid>
Mime-Version: 1.0
References: <20191017213539.00-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v4 10/10] ASoC: mediatek: mt8183: support WoV
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

Add DAI link and pin muxing for wake on voice.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   | 70 ++++++++++++++++++-
 2 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 111e44b64b38..8b29f3979899 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -125,6 +125,7 @@ config SND_SOC_MT8183_MT6358_TS3A227E_MAX98357A
 	select SND_SOC_MAX98357A
 	select SND_SOC_BT_SCO
 	select SND_SOC_TS3A227E
+	select SND_SOC_CROS_EC_CODEC
 	help
 	  This adds ASoC driver for Mediatek MT8183 boards
 	  with the MT6358 TS3A227E MAX98357A audio codec.
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index bb9cdc0d6552..0555f7d73d05 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -19,11 +19,12 @@ enum PINCTRL_PIN_STATE {
 	PIN_STATE_DEFAULT = 0,
 	PIN_TDM_OUT_ON,
 	PIN_TDM_OUT_OFF,
+	PIN_WOV,
 	PIN_STATE_MAX
 };
 
 static const char * const mt8183_pin_str[PIN_STATE_MAX] = {
-	"default", "aud_tdm_out_on", "aud_tdm_out_off",
+	"default", "aud_tdm_out_on", "aud_tdm_out_off", "wov",
 };
 
 struct mt8183_mt6358_ts3a227_max98357_priv {
@@ -142,6 +143,11 @@ SND_SOC_DAILINK_DEFS(playback_hdmi,
 	DAILINK_COMP_ARRAY(COMP_DUMMY()),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+SND_SOC_DAILINK_DEFS(wake_on_voice,
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 /* BE */
 SND_SOC_DAILINK_DEFS(primary_codec,
 	DAILINK_COMP_ARRAY(COMP_CPU("ADDA")),
@@ -229,6 +235,41 @@ static struct snd_soc_ops mt8183_mt6358_tdm_ops = {
 	.shutdown = mt8183_mt6358_tdm_shutdown,
 };
 
+static int
+mt8183_mt6358_ts3a227_max98357_wov_startup(
+	struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
+			snd_soc_card_get_drvdata(card);
+
+	return pinctrl_select_state(priv->pinctrl,
+				    priv->pin_states[PIN_WOV]);
+}
+
+static void
+mt8183_mt6358_ts3a227_max98357_wov_shutdown(
+	struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct mt8183_mt6358_ts3a227_max98357_priv *priv =
+			snd_soc_card_get_drvdata(card);
+	int ret;
+
+	ret = pinctrl_select_state(priv->pinctrl,
+				   priv->pin_states[PIN_STATE_DEFAULT]);
+	if (ret)
+		dev_err(card->dev, "%s failed to select state %d\n",
+			__func__, ret);
+}
+
+static const struct snd_soc_ops mt8183_mt6358_ts3a227_max98357_wov_ops = {
+	.startup = mt8183_mt6358_ts3a227_max98357_wov_startup,
+	.shutdown = mt8183_mt6358_ts3a227_max98357_wov_shutdown,
+};
+
 static struct snd_soc_dai_link
 mt8183_mt6358_ts3a227_max98357_dai_links[] = {
 	/* FE */
@@ -306,6 +347,15 @@ mt8183_mt6358_ts3a227_max98357_dai_links[] = {
 		.dpcm_playback = 1,
 		SND_SOC_DAILINK_REG(playback_hdmi),
 	},
+	{
+		.name = "Wake on Voice",
+		.stream_name = "Wake on Voice",
+		.ignore_suspend = 1,
+		.ignore = 1,
+		SND_SOC_DAILINK_REG(wake_on_voice),
+		.ops = &mt8183_mt6358_ts3a227_max98357_wov_ops,
+	},
+
 	/* BE */
 	{
 		.name = "Primary Codec",
@@ -429,7 +479,7 @@ static int
 mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8183_mt6358_ts3a227_max98357_card;
-	struct device_node *platform_node;
+	struct device_node *platform_node, *ec_codec;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv;
 	int ret;
@@ -444,10 +494,24 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	ec_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,ec-codec", 0);
+
 	for_each_card_prelinks(card, i, dai_link) {
 		if (dai_link->platforms->name)
 			continue;
-		dai_link->platforms->of_node = platform_node;
+
+		if (ec_codec && strcmp(dai_link->name, "Wake on Voice") == 0) {
+			dai_link->cpus[0].name = NULL;
+			dai_link->cpus[0].of_node = ec_codec;
+			dai_link->cpus[0].dai_name = NULL;
+			dai_link->codecs[0].name = NULL;
+			dai_link->codecs[0].of_node = ec_codec;
+			dai_link->codecs[0].dai_name = "Wake on Voice";
+			dai_link->platforms[0].of_node = ec_codec;
+			dai_link->ignore = 0;
+		} else {
+			dai_link->platforms->of_node = platform_node;
+		}
 	}
 
 	mt8183_mt6358_ts3a227_max98357_headset_dev.dlc.of_node =
-- 
2.23.0.700.g56cf767bdb-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
