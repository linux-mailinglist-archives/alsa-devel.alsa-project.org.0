Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60F8C9E71
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11C0282B;
	Mon, 20 May 2024 15:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11C0282B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716213388;
	bh=vuYNtCSoGcmTk8GfhvJhaoNcv6Dz56BFdGIefFxXzuk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aJi45WzbbbM1aNZWehGnliFOBjghYWC2cF1K+MkpCMm4T6au89OTsP4W5e/7bqAcF
	 3zAZuZZJmRwz+6dk2T3TDlcCxJX5kiFqckWFyEYLMSM7dadoCspEOqcHfNPo1uBGFH
	 +LZU37iXp8+LkGA8iIfxSvLolCNh3bhU1W43JkA8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 505B0F805D2; Mon, 20 May 2024 15:56:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C076F805C2;
	Mon, 20 May 2024 15:56:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C862F805C2; Mon, 20 May 2024 15:16:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29AFEF80578
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 15:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29AFEF80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MdUn+LPv
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-42016c8daa7so18515205e9.2
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716211007; x=1716815807;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUmoS//RS/NzAGvmwPir69ysTLwZDq4qcPlEK/AGs3g=;
        b=MdUn+LPvJnfIopv15i+3+iLEhATkz/RqJ4qhR2d8Bwy07oj7o5zHovElf5CZHgs3Ma
         bVLvxlYUZ26Acz93Wl/AtweZXE+r+K1Qxk9Jz4M/8lgUGb3PBMrGbMNGeQXMDtWh7Ffa
         Xo2ANhTgURXi0vd+QqyHdVi+GoqSTCP/pvPiNJ4P3enEP47QZRUnVel2OHxTMAdVmfRM
         NckibvRs6iXnCBRJlHMONbVnD+boaj8o95aqKTo/DY9FNZAY4GYcj3dbeNrrSO3AGAdF
         JTMbj1OYhHWzzX7NaMJ9SYbFQBFQcBUS0nxy5kygLTBrRMWy2kTbWaXnqLFo3wxt3xSo
         EcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716211007; x=1716815807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EUmoS//RS/NzAGvmwPir69ysTLwZDq4qcPlEK/AGs3g=;
        b=QxRiy1Xrc6nYIUZZtR8zF6qy9MDNi+HUVfZH1O8G4TzqPlpb/ZEeqEDXUThneT48H6
         OptlYJMZZCb6wxJMpi5xqmrIEN93rrmZsYGrxdiKi54fO9k9U30z41S6p4lzuoldmpSz
         uNiqqXoSj6TcLiujxwYWN81zm4higKqZwTQjIfwhyFqxgHoaCCYN98ZSvNvdjVDfqG7R
         NF/o3eBijwJppxSjawNzpY3vU/Lwk6u0Xg/ZyYDOhprwfaVuiOo29ybeIwVcDR+zfDJa
         VrxgpWu0BnjzpRarIIbG/MH7pL36AOBomiSjBOFDldAxts5Z/JQpalaOcULK0I01+OD/
         /BGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSUI6DRuEALBplMdOITKz8GgvDV0yzdzr5AVDwkG1HfF2YizCU5DluL/FXH+/tGq9kFi9kbLmZBy+CM63HWvuSw/90E3MTXHDdeCA=
X-Gm-Message-State: AOJu0YxBOiQv6V8GuGKxiSryPNeLqIAv5oRsvQA0c/JXeM2U2DlzZw9O
	9R+wCDE9oi+jofvR1iwhytjfGQDY+b/sUhE+dT7Uv2trmgKxVO6XKmvCNQ==
X-Google-Smtp-Source: 
 AGHT+IFtA0Va8QiICPbaNatA5PVquOStRUtv//wy7zLyNNpUAzWXvwJve0s999PpRDl1QmQ8sDDadQ==
X-Received: by 2002:a50:8a84:0:b0:572:7280:89d6 with SMTP id
 4fb4d7f45d1cf-5734d597a25mr18601319a12.7.1716106692558;
        Sun, 19 May 2024 01:18:12 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl.
 [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:12 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:49 +0200
Subject: [PATCH v3 3/8] ASoC: samsung: midas_wm1811: Add headset mic bias
 supply support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-3-0c1736144c0e@gmail.com>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
In-Reply-To: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=2705;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=vuYNtCSoGcmTk8GfhvJhaoNcv6Dz56BFdGIefFxXzuk=;
 b=Oph8hMfgjPv7+ASAJ6X81w2AItr7S+gGYQiA9lMJgDun4mT3Z8oy8+F7ihMMEw8x/x9MM0sTS
 JswKrd6RYJNAbRYAXVEkhrsO34yH4MtOXVYi+wgzHZq41rRJmRkYJWp
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: USBIWFAXGQAGK34DHQTJ7BPF4T7W73YE
X-Message-ID-Hash: USBIWFAXGQAGK34DHQTJ7BPF4T7W73YE
X-Mailman-Approved-At: Mon, 20 May 2024 13:56:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/USBIWFAXGQAGK34DHQTJ7BPF4T7W73YE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some devices use a headset mic bias supply (sometimes referred to as
"ear mic bias") to enable/disable the headset mic.

Add support for getting the supply from DT and setting it up
accordingly to the value of the Headset Mic switch.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Added this commit
---
 sound/soc/samsung/midas_wm1811.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index f31244156ff6..ab0a4804b45e 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -29,6 +29,7 @@
 struct midas_priv {
 	struct regulator *reg_mic_bias;
 	struct regulator *reg_submic_bias;
+	struct regulator *reg_headset_mic_bias;
 	struct gpio_desc *gpio_fm_sel;
 	struct gpio_desc *gpio_lineout_sel;
 	unsigned int fll1_rate;
@@ -201,6 +202,25 @@ static int midas_submic_bias(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int midas_headset_mic_bias(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_card *card = w->dapm->card;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
+
+	if (!priv->reg_headset_mic_bias)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		return regulator_enable(priv->reg_headset_mic_bias);
+	case SND_SOC_DAPM_POST_PMD:
+		return regulator_disable(priv->reg_headset_mic_bias);
+	}
+
+	return 0;
+}
+
 static int midas_fm_set(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event)
 {
@@ -271,7 +291,7 @@ static const struct snd_soc_dapm_widget midas_dapm_widgets[] = {
 	SND_SOC_DAPM_LINE("FM In", midas_fm_set),
 
 	SND_SOC_DAPM_HP("Headphone", NULL),
-	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", midas_headset_mic_bias),
 	SND_SOC_DAPM_MIC("Main Mic", midas_mic_bias),
 	SND_SOC_DAPM_MIC("Sub Mic", midas_submic_bias),
 };
@@ -455,6 +475,17 @@ static int midas_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->reg_submic_bias);
 	}
 
+	priv->reg_headset_mic_bias = devm_regulator_get_optional(dev,
+							    "headset-mic-bias");
+	if (IS_ERR(priv->reg_headset_mic_bias)) {
+		ret = PTR_ERR(priv->reg_headset_mic_bias);
+		if (ret == -ENODEV)
+			priv->reg_headset_mic_bias = NULL;
+		else
+			return dev_err_probe(dev, ret,
+				     "Failed to get headset mic bias regulator\n");
+	}
+
 	priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
 	if (IS_ERR(priv->gpio_fm_sel)) {
 		dev_err(dev, "Failed to get FM selection GPIO\n");

-- 
2.45.0

