Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD1D76D65F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 20:02:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD1F64E;
	Wed,  2 Aug 2023 20:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD1F64E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999375;
	bh=PrSI7WQVnoqDe9IDUmJvNs1KkhAx16hNHXIFGdWiaBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RnbFs3w42SW7Q5TSz4gy71SASRfbbTkGJGiXhk2d/VmvN6kJOsLoMS/tiprRN+2Sh
	 pxP70Yjv+dwV3nRmpSROZuSIRcL8LznYVYw5mNgj+EoQBjLY1y0kgJ0bt5bBEG7HXK
	 3yECtVnanolXJ/TyDYO+R2dyt4spZKue6fGGpS2c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D60DF80610; Wed,  2 Aug 2023 19:58:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE678F80610;
	Wed,  2 Aug 2023 19:58:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 003CFF805C5; Wed,  2 Aug 2023 19:58:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9358BF805AF
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9358BF805AF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=CaRzBES1
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe110de3b6so914485e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999106; x=1691603906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOTz/u9h6P9leGyC09eMFHXEMo4zw2Mhp9Q7N9y8+Lo=;
        b=CaRzBES1FDktCZ6D1HQtMLP4jc3qk7AZELAeJc3JSrbBRbYT0tfEJLlNDso9DRXWOq
         XVa8E3R5/mgszPKPvlD9LObpE5K+AmZjjJZac2SCgTJlj/3djHobvaynwKLytSkxJclO
         gwFAo3t+7JdJSVqeu+Se0wFkPHJ/GP8VYslMCzNd3kCuz3qehCHDPI2dftcLcLPDZG4b
         Ro1XKGKxJRWs1GA73woOh33jfl+8dsm4GUV2WyKiLK6z671qh0cLSTriuuv8e9LjCEXb
         WAmrmaxWqWdev+LNA6O3tMS69WFQGt8jxVGZ3Wp7azGnHcHjZiuRl8bEhjX/yLiHQ/lm
         tRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999106; x=1691603906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JOTz/u9h6P9leGyC09eMFHXEMo4zw2Mhp9Q7N9y8+Lo=;
        b=YkUlAfIHBxUrQ/hi9vhBsMGYIi4Rdk01nzVljeWBMUBfMD6EiaNXyJkNk4qlLuy34b
         yMfvPozocIFJnfQsbbSsv7L7/2cT0wuXmMRGbcqqa/mMuepwu+LwZVrv9rZKZIOM7QrS
         NCA+9rLzKAVwDs6s3opgopSbK4ULZrKVyng96THJM6DDJDq12q89SGuyAAvhZ3oM7Tg+
         6euvRO8qhtALSkIxdKWXjDctsaimgQ2CBzkQoZaNqjFeZ7fAWjeEWKJ/FceleR5xFo2W
         MFoHEIcxYuEV5ibxhAx1NdAL07YmskatWSDw6Whw7TRm2SHzGoJXSkRkSJRYMbuwA9qD
         fpjQ==
X-Gm-Message-State: ABy/qLYBNxxArs6uhzCsVPjrfme6J596GiGwyw8KA7wBH9sfHJfqM/8F
	OSjJj+ZkI+C8XyZUWvaeoIGgsWOY1C4=
X-Google-Smtp-Source: 
 APBJJlFQr90XtoOe1xMFjV23Olv3dL2133iR2JzhQ3pihRr/5UJoSbJrQ/JU2PzpS3DPbWt4BQ8fFw==
X-Received: by 2002:a7b:ce94:0:b0:3fb:e1d0:6417 with SMTP id
 q20-20020a7bce94000000b003fbe1d06417mr5516087wmj.19.1690999106013;
        Wed, 02 Aug 2023 10:58:26 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:58:25 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH 16/27] ASoC: mediatek: mt8183-da7219-max98357: Map missing
 jack kcontrols
Date: Wed,  2 Aug 2023 20:57:26 +0300
Message-Id: <20230802175737.263412-17-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802175737.263412-1-alpernebiyasak@gmail.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SRRFDJZZEQ3NZ675PCCICITFZNYE6225
X-Message-ID-Hash: SRRFDJZZEQ3NZ675PCCICITFZNYE6225
X-MailFrom: alpernebiyasak@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SRRFDJZZEQ3NZ675PCCICITFZNYE6225/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver does not properly map jack pins to kcontrols that PulseAudio
and PipeWire need to handle jack detection events. The DA7219 codec used
here can detect Headphones, Headset Mic and Line Out connections. Expose
each to userspace as kcontrols and add the necessary widgets.

Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 43 ++++++++++++++++---
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 87bb04846991..701fbcc0f2c9 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -29,6 +29,21 @@ struct mt8183_da7219_max98357_priv {
 	struct snd_soc_jack headset_jack, hdmi_jack;
 };
 
+static struct snd_soc_jack_pin mt8183_da7219_max98357_jack_pins[] = {
+	{
+		.pin	= "Headphone",
+		.mask	= SND_JACK_HEADPHONE,
+	},
+	{
+		.pin	= "Headset Mic",
+		.mask	= SND_JACK_MICROPHONE,
+	},
+	{
+		.pin	= "Line Out",
+		.mask	= SND_JACK_LINEOUT,
+	},
+};
+
 static int mt8183_mt6358_i2s_hw_params(struct snd_pcm_substream *substream,
 				       struct snd_pcm_hw_params *params)
 {
@@ -572,13 +587,15 @@ mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
 			snd_soc_card_get_drvdata(component->card);
 
 	/* Enable Headset and 4 Buttons Jack detection */
-	ret = snd_soc_card_jack_new(component->card,
-				    "Headset Jack",
-				    SND_JACK_HEADSET |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3 |
-				    SND_JACK_LINEOUT,
-				    &priv->headset_jack);
+	ret = snd_soc_card_jack_new_pins(component->card,
+					 "Headset Jack",
+					 SND_JACK_HEADSET |
+					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+					 SND_JACK_LINEOUT,
+					 &priv->headset_jack,
+					 mt8183_da7219_max98357_jack_pins,
+					 ARRAY_SIZE(mt8183_da7219_max98357_jack_pins));
 	if (ret)
 		return ret;
 
@@ -609,12 +626,18 @@ static struct snd_soc_codec_conf mt6358_codec_conf[] = {
 };
 
 static const struct snd_kcontrol_new mt8183_da7219_max98357_snd_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 };
 
 static const
 struct snd_soc_dapm_widget mt8183_da7219_max98357_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_SPK("Line Out", NULL),
 	SND_SOC_DAPM_PINCTRL("TDM_OUT_PINCTRL",
 			     "aud_tdm_out_on", "aud_tdm_out_off"),
 };
@@ -657,14 +680,20 @@ static struct snd_soc_codec_conf mt8183_da7219_rt1015_codec_conf[] = {
 };
 
 static const struct snd_kcontrol_new mt8183_da7219_rt1015_snd_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 	SOC_DAPM_PIN_SWITCH("Left Spk"),
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
+	SOC_DAPM_PIN_SWITCH("Line Out"),
 };
 
 static const
 struct snd_soc_dapm_widget mt8183_da7219_rt1015_dapm_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_SPK("Left Spk", NULL),
 	SND_SOC_DAPM_SPK("Right Spk", NULL),
+	SND_SOC_DAPM_LINE("Line Out", NULL),
 	SND_SOC_DAPM_PINCTRL("TDM_OUT_PINCTRL",
 			     "aud_tdm_out_on", "aud_tdm_out_off"),
 };
-- 
2.40.1

