Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D52071F5A84
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 19:31:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C0CA1664;
	Wed, 10 Jun 2020 19:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C0CA1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591810304;
	bh=0IggnKPAbRfltg0PgWySEyfVv7aRN1ZGbMemxPOR/18=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XaC2IuU26jU2JSk8AUiQFt1+BvJok+js6Kow5YBYmCWSk9Yme9DX/DScY4TC+rRBG
	 4jdXnYAB/XBtCfeV7/1oLvubbrHlvQT09E2V12Xxz7TVkS+vfUE/18GwVE2oXAa28l
	 1JF7s58NXwgYBbeyExoVNywdJAJesxnyBib/PHfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AFFAF80252;
	Wed, 10 Jun 2020 19:29:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28927F8024A; Wed, 10 Jun 2020 19:29:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 562BDF8021C
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 19:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 562BDF8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i8/yyzCM"
Received: by mail-pl1-x643.google.com with SMTP id bh7so1202690plb.11
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 10:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y6k/7QsHaLDLvfshfaz5BRU4ZY9fb7OyvkPWjkbCUPQ=;
 b=i8/yyzCM9b20RAxBiypRxbSOUWLB/v8YvSqCyJn/V2O+/ntCgJ8nWUklji3KjTydfo
 X6krgZqofgBk44Z6cBw1wSQqkibasy6WtaWl4TjSHJuufhOQs9G3EO3qKRNRO8/Pt8pM
 8o69hFFvQYYzFT2knESwDsYL4Kn9kX6TxdZxOqtJua04JpAoSPjYVppreIYD6xbmXcck
 wSCS+d68caY8esVchPIs5/UnltJWwvA0I7kMAseyFnXtViPNyur6q5xxXn8lQMMJP/jV
 gs+/1j3Ha0iLqUTwI42V80GyVsm1zgtmPVbQaR0uf8QxYLkF7HpW7/3KKIa3ohr75hHL
 dz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y6k/7QsHaLDLvfshfaz5BRU4ZY9fb7OyvkPWjkbCUPQ=;
 b=Z+h7+YegBwlx92br47zQEEpzlyWRpIvOMIZzsLrAVndzLhJHO1Hq8PhzWbHbFSJjeO
 3dt+5c2pxXsKVfz4ciSN3Hjhx0qoMP/xc2mE7TjFNDlLVhAntsNVcbgJcm5VpDoWwnPA
 ZeR69dnMtSUoPec92QGEMZibRg8G+kJbMYj9AlDgBq6WQEM7SsQoruG7WFyKpwNx75qz
 j3n1AonA+BbJ73n09uc2Rp+JK+ekURe1mp+5mZer0gqjPgHuw3P7WVPcKKEB9pxC7Fih
 s+XspZ5mQnsH+WNxsCx/sjMqiuFMHfpOeUhvdmx2lDvF0e1zxJEQZpNrgbaqk2KVtass
 6xxA==
X-Gm-Message-State: AOAM533HBmmOuTm0ndQavZfgpXKQkCNXgYslhs/FKEwMSeEOu1hJKso5
 BMqTexavcnlZ/t+sgFrgFt0=
X-Google-Smtp-Source: ABdhPJyHSF6BBRt+DRbRAiQl9cvHyZSZn5HFwRHbESmV4SGcQ/a+q3ZlJDKRx4M7S8rCGDXeGQDBXA==
X-Received: by 2002:a17:90b:252:: with SMTP id
 fz18mr3757996pjb.96.1591810155527; 
 Wed, 10 Jun 2020 10:29:15 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.54.40])
 by smtp.googlemail.com with ESMTPSA id l83sm490470pfd.150.2020.06.10.10.29.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jun 2020 10:29:15 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 1/6] staging: greybus: audio: Update snd_jack FW usage as
 per new APIs
Date: Wed, 10 Jun 2020 22:58:25 +0530
Message-Id: <48ba07c38dc72d272dda4d4d2c3fe3690ee71eb3.1591802243.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591802243.git.vaibhav.sr@gmail.com>
References: <cover.1591802243.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devel@driverdev.osuosl.org, alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
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

snd_soc_jack APIs are modified in recent kernel versions. This patch
updates the codec driver to resolve the compilation errors related to
jack framework.

Signed-off-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 54 +++++++++++++++++++++------
 1 file changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 08746c85dea6..5d3a5e6a8fe6 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -709,17 +709,26 @@ static struct snd_soc_dai_driver gbaudio_dai[] = {
 };
 
 static int gbaudio_init_jack(struct gbaudio_module_info *module,
-			     struct snd_soc_codec *codec)
+			     struct snd_soc_card *card)
 {
 	int ret;
+	struct snd_soc_jack_pin *headset, *button;
 
 	if (!module->jack_mask)
 		return 0;
 
 	snprintf(module->jack_name, NAME_SIZE, "GB %d Headset Jack",
 		 module->dev_id);
-	ret = snd_soc_jack_new(codec, module->jack_name, module->jack_mask,
-			       &module->headset_jack);
+
+	headset = devm_kzalloc(module->dev, sizeof(*headset), GFP_KERNEL);
+	if (!headset)
+		return -ENOMEM;
+
+	headset->pin = module->jack_name;
+	headset->mask = module->jack_mask;
+
+	ret = snd_soc_card_jack_new(card, module->jack_name, module->jack_mask,
+				    &module->headset_jack, headset, 1);
 	if (ret) {
 		dev_err(module->dev, "Failed to create new jack\n");
 		return ret;
@@ -730,11 +739,21 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 
 	snprintf(module->button_name, NAME_SIZE, "GB %d Button Jack",
 		 module->dev_id);
-	ret = snd_soc_jack_new(codec, module->button_name, module->button_mask,
-			       &module->button_jack);
+	button = devm_kzalloc(module->dev, sizeof(*button), GFP_KERNEL);
+	if (!button) {
+		ret = -ENOMEM;
+		goto free_headset;
+	}
+
+	button->pin = module->button_name;
+	button->mask = module->button_mask;
+
+	ret = snd_soc_card_jack_new(card, module->button_name,
+				    module->button_mask, &module->button_jack,
+				    button, 1);
 	if (ret) {
 		dev_err(module->dev, "Failed to create button jack\n");
-		return ret;
+		goto free_headset;
 	}
 
 	/*
@@ -750,7 +769,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 				       KEY_MEDIA);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_0\n");
-			return ret;
+			goto free_button;
 		}
 	}
 
@@ -759,7 +778,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 				       KEY_VOICECOMMAND);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_1\n");
-			return ret;
+			goto free_button;
 		}
 	}
 
@@ -768,7 +787,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 				       KEY_VOLUMEUP);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_2\n");
-			return ret;
+			goto free_button;
 		}
 	}
 
@@ -777,7 +796,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 				       KEY_VOLUMEDOWN);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_0\n");
-			return ret;
+			goto free_button;
 		}
 	}
 
@@ -788,6 +807,16 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 	*/
 
 	return 0;
+
+free_button:
+	snd_device_free(card->snd_card, module->button_jack.jack);
+	list_del(&module->button_jack.list);
+
+free_headset:
+	snd_device_free(card->snd_card, module->headset_jack.jack);
+	list_del(&module->headset_jack.list);
+
+	return ret;
 }
 
 int gbaudio_register_module(struct gbaudio_module_info *module)
@@ -815,7 +844,7 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 		return -EINVAL;
 	}
 
-	ret = gbaudio_init_jack(module, codec);
+	ret = gbaudio_init_jack(module, component->card);
 	if (ret) {
 		up_write(&card->controls_rwsem);
 		return ret;
@@ -942,7 +971,8 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 
 #ifdef CONFIG_SND_JACK
 	/* free jack devices for this module from codec->jack_list */
-	list_for_each_entry_safe(jack, next_j, &codec->jack_list, list) {
+	list_for_each_entry_safe(jack, next_j, &component->card->jack_list,
+				 list) {
 		if (jack == &module->headset_jack)
 			mask = GBCODEC_JACK_MASK;
 		else if (jack == &module->button_jack)
-- 
2.26.2

