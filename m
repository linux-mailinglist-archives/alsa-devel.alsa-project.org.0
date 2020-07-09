Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF14A21A002
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 14:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C07E15DC;
	Thu,  9 Jul 2020 14:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C07E15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594297696;
	bh=KAjTiJ2UKvlLX91fk1dQ998phd02LGCWF3E3vMjcPTQ=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WFjWy9ry2W8gCzhvx/jY2/dKUfn0G5wqoKN0WhayzjergFhl9qEQYOurkrksSrxYA
	 hJWttieXAP7kb5rtaYlcLdd2r4daGVGvG+OM0mmiAaVdgbI6oegX8V/0Fh1pZIHEZT
	 TiYIGMWuWddJ9Rce7NW+fntrGgjpR5/axCA+La3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22987F802DC;
	Thu,  9 Jul 2020 14:25:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C97C0F802BD; Thu,  9 Jul 2020 14:25:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DD76F80216
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 14:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DD76F80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="V34mfSd+"
Received: by mail-yb1-xb49.google.com with SMTP id d202so2643911ybh.12
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 05:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=iN6AMgjebh5ttSunoTyBZvzZ1AdBhEV/5hqARnWvgG0=;
 b=V34mfSd+xCol1IDsUVrqxEEcIIvarJToDbvlYlKp8+hAqyWcs1tWcLVOpOhWSj6ClQ
 3ePIX220ioq5Pcnr5++HSGAhUWAT77TrIO3d6GuA5S3AB9AgHPjrEt1UzICzufir72zk
 C42HVotEjh/OoNfMLhOFLR2d1iYvO7xTF+3yn+wKOW+nUR1FPmbyMsSbaI7vUVD4Nzjz
 +m5WiyLSvWUAKYRTbWAy/fq0OcyAtnTauMRKV8Y0B6n8v/1VQ9ofA0LSuovnbPjrKXmu
 OWi6p5TxBDdyJ+sUpKs0C0sn/N7fxHPJrn4bUde/p1hVDLNbtupyKZHWWD0JKCSuutB5
 x1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=iN6AMgjebh5ttSunoTyBZvzZ1AdBhEV/5hqARnWvgG0=;
 b=f4yOr6Hr5gEI2SeMfrG/V4mOiM3oHI//YckWytcW8tgAmWMF/w+WmyNENXrqGTtBGT
 s5sLYG81E07Hbqu815dr/4wTAB9ggvHnCp8AIfIydTmHEssGC67c8pbREeScZuqEjql3
 E7MnxDSo/M54s9j5y9QUd3U4rpsXxOfZpOjBjOKdpkIatCR8ERrixmQKozdpY83XxlU8
 qEZe8A1RsyxMtIox4wxH1MarirVmwc02iX1maDNu/DuwwCyWfI6hLzVvGnm2CUjCnly3
 4+NQMSOM560Yh5izSa0lw8MzJ9o5ecxpD7MsBvY/ulHk61/u8OfcuLIHqNBsVdPEHYi/
 rXiQ==
X-Gm-Message-State: AOAM532M0gMhx3Tq/+nXM1iUNNM8avzrCAe+kX44PnsCCNGUvtoLOXwn
 QDRL2mS5VGWzHcfFYKwPqyi2ykV+40U5
X-Google-Smtp-Source: ABdhPJwbF+zynCh0TwXUPC0JjIsYL9xAFfS5BreeMFHEwPE+fKZODAHc1He6dBu8sNwWoGYRxnGuzRbVJzeg
X-Received: by 2002:a25:cb42:: with SMTP id b63mr39593168ybg.266.1594297500635; 
 Thu, 09 Jul 2020 05:25:00 -0700 (PDT)
Date: Thu,  9 Jul 2020 20:24:42 +0800
In-Reply-To: <20200709122445.1584497-1-tzungbi@google.com>
Message-Id: <20200709122445.1584497-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200709122445.1584497-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 2/5] ASoC: mediatek: mt8183-da7219: remove forward declaration
 of headset_init
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

In headset_init(), it can access card by component->card.  Removes the
forward declaration.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 63 +++++++++----------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 4cffe7daf33c..9636771ce9a2 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -449,7 +449,36 @@ static struct snd_soc_dai_link mt8183_da7219_max98357_dai_links[] = {
 };
 
 static int
-mt8183_da7219_max98357_headset_init(struct snd_soc_component *component);
+mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
+{
+	int ret;
+	struct mt8183_da7219_max98357_priv *priv =
+			snd_soc_card_get_drvdata(component->card);
+
+	/* Enable Headset and 4 Buttons Jack detection */
+	ret = snd_soc_card_jack_new(component->card,
+				    "Headset Jack",
+				    SND_JACK_HEADSET |
+				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
+				    &priv->headset_jack,
+				    NULL, 0);
+	if (ret)
+		return ret;
+
+	snd_jack_set_key(
+		priv->headset_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(
+		priv->headset_jack.jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
+	snd_jack_set_key(
+		priv->headset_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+	snd_jack_set_key(
+		priv->headset_jack.jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	da7219_aad_jack_det(component, &priv->headset_jack);
+
+	return 0;
+}
 
 static struct snd_soc_aux_dev mt8183_da7219_max98357_headset_dev = {
 	.dlc = COMP_EMPTY(),
@@ -496,38 +525,6 @@ static struct snd_soc_card mt8183_da7219_max98357_card = {
 	.num_configs = ARRAY_SIZE(mt6358_codec_conf),
 };
 
-static int
-mt8183_da7219_max98357_headset_init(struct snd_soc_component *component)
-{
-	int ret;
-	struct mt8183_da7219_max98357_priv *priv =
-			snd_soc_card_get_drvdata(component->card);
-
-	/* Enable Headset and 4 Buttons Jack detection */
-	ret = snd_soc_card_jack_new(&mt8183_da7219_max98357_card,
-				    "Headset Jack",
-				    SND_JACK_HEADSET |
-				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
-				    &priv->headset_jack,
-				    NULL, 0);
-	if (ret)
-		return ret;
-
-	snd_jack_set_key(
-		priv->headset_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
-	snd_jack_set_key(
-		priv->headset_jack.jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
-	snd_jack_set_key(
-		priv->headset_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
-	snd_jack_set_key(
-		priv->headset_jack.jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
-
-	da7219_aad_jack_det(component, &priv->headset_jack);
-
-	return 0;
-}
-
 static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8183_da7219_max98357_card;
-- 
2.27.0.383.g050319c2ae-goog

