Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69C65E8B28
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Sep 2022 11:52:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6998182A;
	Sat, 24 Sep 2022 11:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6998182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664013123;
	bh=azc1OM0CwWJIwEZmrGMw6Xz3fXUwZeRE7CCQFOuRfDw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rtM8sRkTZs2k68sGnXqEgsyKHrb9XTPhKT7Rcp4OY/otiIEaJkbXM6ZOnYqVDBabh
	 Q3B8dZA9vp8GhB+LEs9igyd56OjW+CwSNyYidsnT0AFOMGIJGvKZvviwTtZUyqnGPj
	 Gy2u49dAL1/tFyG26NLz9oMlDND09qUZ0QkimtbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CED04F804E6;
	Sat, 24 Sep 2022 11:50:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D6F3F804E6; Sat, 24 Sep 2022 11:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6806F8011C
 for <alsa-devel@alsa-project.org>; Sat, 24 Sep 2022 11:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6806F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ftJ39f4E"
Received: by mail-pj1-x102e.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so8046315pja.5
 for <alsa-devel@alsa-project.org>; Sat, 24 Sep 2022 02:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XvnLxeE0AO/sb9+4Q89V2vzbus4Cqug44xbFR5p3YOU=;
 b=ftJ39f4E1m8gmH8TmgOHpWD8mg832NoK+mK2tkeja4ah6OjfQBSygn3EIuISW/rbmY
 D8yd1R1FLeD2h4tRAt5Ts+BTzM9usF9kZsJmHxvdwL7jPzZftwRubtoceGwoHKnCYbMU
 npbhvwEB7oet7j3JsZX7b1YWjiGlGyAmSvHyPjnV6Z5lZ13Pacld1WJ9vPkNrZ9W/wKV
 CU6iw7blWe1IrvE9FP9HGkYq9uB7XciRNeN7pgl4IE1o4L+iMDobCnX4dLI/ERGyPKZu
 39y6VQw72DjXt1aavpBiOYSiDxy8lFysP+aJZvQvOCRYXldAmfy524PPjCGnKpc0wJvb
 Y1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XvnLxeE0AO/sb9+4Q89V2vzbus4Cqug44xbFR5p3YOU=;
 b=kvPeBH6ilIJGKUTWZpUApKmaQ5ZteHhXqoZFj6ioxYor7yDDbCUi+T+FQ+DGJrwx5a
 Z3dxWq62GzyM5Ydkn8YhGo4xUyxbs0E06wctP8ZHC3fkI+xCHZYjOv33pz3o7ihRI69j
 YEAhGY8L6IQi1x9YSP/E90uXYnr9xlEZ/++IJhf1yj3DiT1HQiWU4YLR2KSVtZlCCEgL
 N2JeDO7JVCeXmmQvj8HrdiN145Itxi65MLQYyRY8PTevDtr3CwTbje8cFrNYkseQsrNC
 S+ONvQbHw2mbXxySusvZKk2k4BOPqlnctolzkbTd3akTONaZgXxy6im0Wx8YrtypVS56
 +drQ==
X-Gm-Message-State: ACrzQf2XRphEHZevaLbc4aHHG/1x3K7TfmHX6y6AMRHOdTx/2HUBTeh2
 NA8n/s6a8qRvdKV+SoDLPmo=
X-Google-Smtp-Source: AMsMyM5nelo22CdgC7JmIDrjRFDB7bs738j3UegAaYnT3tFCz3RV59HX5wD7fY6qYXB0K58BqzGqTw==
X-Received: by 2002:a17:90b:1650:b0:205:65db:d6eb with SMTP id
 il16-20020a17090b165000b0020565dbd6ebmr13320796pjb.246.1664013034691; 
 Sat, 24 Sep 2022 02:50:34 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b00176c0e055f8sm7340223pls.64.2022.09.24.02.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Sep 2022 02:50:34 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 2/2] ASoC: amd: acp3x-5682: Expose individual headset jack pins
Date: Sat, 24 Sep 2022 18:50:25 +0900
Message-Id: <20220924095025.7778-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924095025.7778-1-akihiko.odaki@gmail.com>
References: <20220924095025.7778-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
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

The rt5682 codec is able to distinguish between two event types:
headphone insertion/removal and headset microphone insertion/removal.
However, currently, the acp3x-5682 driver exposes a single kcontrol
for the headset jack, so userspace isn't able to differentiate between
the two events.

Add a definition for the headset jack pins, so that a separate jack
kcontrol is created for each one, allowing userspace to track and handle
them individually.

This change is based on commit 194ff8db0378 ("ASoC: mediatek:
mt8192-mt6359: Expose individual headset jack pins").

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 sound/soc/amd/acp3x-rt5682-max9836.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 0bdd9c26dd22..3679931a2285 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -39,6 +39,17 @@ enum {
 	EC,
 };
 
+static struct snd_soc_jack_pin acp3x_5682_jack_pins[] = {
+	{
+		.pin	= "Headphone Jack",
+		.mask	= SND_JACK_HEADPHONE,
+	},
+	{
+		.pin	= "Headset Mic",
+		.mask	= SND_JACK_MICROPHONE,
+	},
+};
+
 static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
@@ -86,11 +97,12 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 	rt5682_dai_wclk = clk_get(component->dev, "rt5682-dai-wclk");
 	rt5682_dai_bclk = clk_get(component->dev, "rt5682-dai-bclk");
 
-	ret = snd_soc_card_jack_new(card, "Headset Jack",
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
 				SND_JACK_HEADSET |
 				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 				SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				&pco_jack);
+				&pco_jack, acp3x_5682_jack_pins,
+				ARRAY_SIZE(acp3x_5682_jack_pins));
 	if (ret) {
 		dev_err(card->dev, "HP jack creation failed %d\n", ret);
 		return ret;
-- 
2.37.3

