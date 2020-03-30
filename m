Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1991985C3
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 22:45:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E394D1666;
	Mon, 30 Mar 2020 22:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E394D1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585601147;
	bh=y0An0/glDFapFI2Vu6Gx7gNwNWWhP+tT6d44HQq8wUE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eVkUiDv7Juo6a3vQJzhbadvAdp15vGiiLZ2BjcDWF+cnFS3rfNDN+mM2ipJla/Pby
	 koYcdYDlHe5N9MMGOJeMP5ibagxNGT8k8g88jK9b5Zo9kt5jym/g4BRmPQEt1JPcQm
	 3wRe7u1ycT81Ms0PthW3AZAhbuNmwOp5+AUJ16U8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34BA8F80292;
	Mon, 30 Mar 2020 22:43:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0BD0F8010C; Mon, 30 Mar 2020 22:42:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 785E0F80145
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 22:42:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 785E0F80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oh689xve"
Received: by mail-lf1-x144.google.com with SMTP id u15so6316731lfi.3
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9UkrNjDcajPGTgBBKiQQcXEwPOc4ohLFowCr4Ks0haU=;
 b=oh689xveR36/57W4/RPGauOKst42L1S+MXOTtXleBkLzOiJ+NL6bEEF08gPLfBCf0w
 9Pjkq3FiUE6g4iYJ8R39BdR0UWMSKcTcSnno1jANPY0fk/zWl1BAJFlujrzpTgHKkSGV
 gObEjTicF1K/HwtUIdhfSUayjN79qoBwC316M9dZthNujLGmduxoHiokK5om+GbTi3AS
 L/Dxvq4qgEZhv5U/aZrx6fSyXGwCCMliWGEcViF4NUEropR1GG3/uqfvnR5+yzLKHgyT
 aXNT0WT7NKJmJsVH/dDsGFZR3FUZqlExP3CH+UOkUsLNUYXSPO1fGkEna1DVIH04DUpT
 cdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9UkrNjDcajPGTgBBKiQQcXEwPOc4ohLFowCr4Ks0haU=;
 b=AkwROSvbIj3RXY/jtCaMZz7zUTYIFuqKFwX9jZ5CKon3rf/teiI2BPxwRZuven2dz+
 yhMdLeceHJdKnrjFm+pPS2tSg/Hj8qjeFjjHxr5iWxJWk2PQ8xd4x5I9m5hXP1h9P90s
 kXbB3fox/+r/cNVN65K2Mal4if5K2rE7V6evGYfNn5GZcVXlmPWSUkDDxSoE1hcBXjoG
 u34Bx4p/pw5ACiXboAreQ1FwkOclxFWizyW92BGA+gUeDPrT+xsOzf8dn4vhFCyFnDIp
 OgokA/N1uFMVumIMqZcqPChldpdYDpGsWMux0tajMioNHIzMtNuOo+SOFBFWaFyJoHPY
 9QMQ==
X-Gm-Message-State: AGi0PuYI8gUexI1iUeP9ERfv5GqHV/g0FCpWnI0sOf5df+AvwGpTXj7y
 sTsHSYmoIUQk0WTuApalifs=
X-Google-Smtp-Source: APiQypLLLnVzRTLcP4jabC1fU1WzfNOMcZ3hKwFpODI7tRHqByybGrOo5XBHUG6/XotAfAYXhdyTvQ==
X-Received: by 2002:ac2:4c88:: with SMTP id d8mr9381636lfl.100.1585600965414; 
 Mon, 30 Mar 2020 13:42:45 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id v22sm7287988ljj.67.2020.03.30.13.42.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 13:42:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v1 2/2] ASoC: tegra: tegra_wm8903: Support nvidia,
 headset property
Date: Mon, 30 Mar 2020 23:40:11 +0300
Message-Id: <20200330204011.18465-3-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330204011.18465-1-digetx@gmail.com>
References: <20200330204011.18465-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

The microphone-jack state needs to be masked in a case of a 4-pin jack
when microphone and ground pins are shorted. Presence of nvidia,headset
tells that WM8903 CODEC driver should mask microphone's status if short
circuit is detected, i.e headphones are inserted.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra_wm8903.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 071c7d2de77c..e756dc8eeca4 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -177,6 +177,7 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = codec_dai->component;
 	struct snd_soc_card *card = rtd->card;
 	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
+	int shrt = 0;
 
 	if (gpio_is_valid(machine->gpio_hp_det)) {
 		tegra_wm8903_hp_jack_gpio.gpio = machine->gpio_hp_det;
@@ -189,12 +190,15 @@ static int tegra_wm8903_init(struct snd_soc_pcm_runtime *rtd)
 					&tegra_wm8903_hp_jack_gpio);
 	}
 
+	if (of_property_read_bool(card->dev->of_node, "nvidia,headset"))
+		shrt = SND_JACK_MICROPHONE;
+
 	snd_soc_card_jack_new(rtd->card, "Mic Jack", SND_JACK_MICROPHONE,
 			      &tegra_wm8903_mic_jack,
 			      tegra_wm8903_mic_jack_pins,
 			      ARRAY_SIZE(tegra_wm8903_mic_jack_pins));
 	wm8903_mic_detect(component, &tegra_wm8903_mic_jack, SND_JACK_MICROPHONE,
-				0);
+				shrt);
 
 	snd_soc_dapm_force_enable_pin(&card->dapm, "MICBIAS");
 
-- 
2.25.1

