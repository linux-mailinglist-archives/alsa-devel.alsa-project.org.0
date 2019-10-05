Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 978BFCC8EF
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 11:04:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32CC61693;
	Sat,  5 Oct 2019 11:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32CC61693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570266245;
	bh=MkoGuavGoOYmDb1rQq9CogQgljWl2JKKzQcfgJJWMxE=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YrCXIgHskm4PiNy4sEzn711kJU8ed6lqB4tSW8sTedzyqM4w8rRhFgiLkBxWVMdID
	 Zb1qfZ7kB7faRAu2xdkyDqOtMjJxXqSOqjFwNLOcFvkjzM5TsQNp75WHb2P4JUXC4a
	 RNlHc40dRJmhNO0v0BfpH4j08u3wfV5Pa/79MZ5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82E00F806F5;
	Sat,  5 Oct 2019 10:56:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D8D3F806F5; Sat,  5 Oct 2019 10:56:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A51C1F806E9
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 10:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A51C1F806E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="MViR0B89"
Received: by mail-qt1-x849.google.com with SMTP id s14so9337450qtn.4
 for <alsa-devel@alsa-project.org>; Sat, 05 Oct 2019 01:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=wFKIOToRbdu3m60b5e+tQ6dn8L8Tfr3EeQzYLtHUnvY=;
 b=MViR0B89/L+ScGHkQ49vGGXrVHmFgqeJOHqJYODn5V/sJXxhih5diLkNYzhJEWMT3C
 sjhrvSTNpKPxd/1jrOJ+js1yByjRCDe6cKOwrpY8mK9ws5MUu3vwvKqXsCZ/k2lYgGvU
 6knH4UcL+/DEadOmHbR0RWJ3eJzfBb6TNQBWzFqqgzqP5fuVYmN9vjzy98PHHNp19f3I
 bwsySnOuGyUOVcMwY+nxCJKzV7CeMBAYFAKaLxpMBavfZR+buLB1Finbg9ufJf9UsK0q
 nQkilQ6UD/bu7QG9qCRvD5exZtJ7krxIA9B073D5APokq1wQbt4m5rvPw5r/s2o0LIgD
 aZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=wFKIOToRbdu3m60b5e+tQ6dn8L8Tfr3EeQzYLtHUnvY=;
 b=PrBl6Do8BvBAmPrT7SBoxI+2d/C32KKem3yNmm1ZzFF3KaaAbk0QhS2uSFXS28tHUv
 BBeEbXacwL+CPy6Qq3Ef0ujXiaDdIzgQYBlI1+gVb5gRsq8tuxmg4w+fRD6G3sWXXK8N
 gUYjKDgbKcdtH+Iir6hdR9F6xWfa65f8I3Tr+AILDtbnBjCXfpN+x+uXb16WkntJeF5v
 XEDOLZlTANhwkKJCKla0qcmRR49xVuFAPfS9VBDfVO6equerGGR57Lc5ddoQZdWBLRqm
 XgJ/BglzwC49ENJLfHx6khRSglvrnbpbA0XJorsVXb+uZrdwIpmOdbf73/Hq22CdewH1
 kEBA==
X-Gm-Message-State: APjAAAUefbIbBHLiltTjTkd6JyRakusCu4ywGwqLFm3ocNr6X7+Ohc+p
 1qLsngTfGs4dBHX/77hNKJy21Ekb1kQ+
X-Google-Smtp-Source: APXvYqxa97eRMrLw1vPgB3fDcRzUkPqK8/HJZKwJUcBMaIzcaj7TncKQChVjY39cByP70fmMcWL3Z5nZNXU7
X-Received: by 2002:a0c:ffa7:: with SMTP id d7mr17069407qvv.12.1570265775991; 
 Sat, 05 Oct 2019 01:56:15 -0700 (PDT)
Date: Sat,  5 Oct 2019 16:55:09 +0800
In-Reply-To: <20191005085509.187179-1-tzungbi@google.com>
Message-Id: <20191005164320.10.Ibf012d0cd8679d846213606dc5f426aea1ff590a@changeid>
Mime-Version: 1.0
References: <20191005085509.187179-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v2 10/10] ASoC: mediatek: mt8183: support WoV
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
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
