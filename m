Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D9D1EBCBF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 15:13:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB0FA1616;
	Tue,  2 Jun 2020 15:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB0FA1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591103610;
	bh=oNkKmQoRMafXyLXgfjIBEylkxzqM38zE5g7GYWKUE/w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OdJTkdiSYnT76oJSHpHQ89gCZLcwQEzsl0mwQbQd8E/McYcuPFLTmkqmswzEWrgTB
	 vvC+HnUT76JKksZ5T7g0lAxP1nXRFJhtUoMD/wZhlHQPs9lumplF/K5kI4AVV1GB06
	 6IV5q+rizFUV9mk64ZmeBSpATas/b7PUsnIdMY3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D12CF80291;
	Tue,  2 Jun 2020 15:10:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB075F8026F; Tue,  2 Jun 2020 07:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3D04F8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 07:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3D04F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gpJmF9im"
Received: by mail-pl1-x643.google.com with SMTP id y18so881906plr.4
 for <alsa-devel@alsa-project.org>; Mon, 01 Jun 2020 22:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HrE8jPu+eUk0rWTp09/AJ6eqmFiFFAxiAwX4LTYEZSI=;
 b=gpJmF9imy7EwPbtaigUBNEagjOGDTHD7fGkw4xKgjzwdrEDC95Xhb57T5uX5Cv2MYb
 EsIlOcMB0m4Sl/Y/j17qCRyftShvGybRddCKlD2EKGmKcig/PPIjsUbJBBHmfOgb/y14
 aLp8xW4F4acHz4tcakZ98Jo6bh1vl22/wf0uBDJuL+3cSJfwezXm8oDsD3PeVIMhYn/U
 FJ6yTQJaB5SVCNWXe2aJQ8peooqMUZTIqZlOyv/c1j/lxVpFseme/3udPj/dwPKEDXPf
 QqsX8S8kYLK9v1SQXu8zvztocBOWKIPVDLksgkkUCYlcANLGjmGplT/D5QRxqgY2TXVY
 PUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HrE8jPu+eUk0rWTp09/AJ6eqmFiFFAxiAwX4LTYEZSI=;
 b=l72/PoWBKxrdJ3FL+Pz0fscpA5O33ECqHQjjXsoLTur0LjK+UJzS5487Q/9rBqOi6T
 liM2xFmjqjJHlAYfVPVEq3TzrSc2OPnRNz+2RCDWeSRp48fGTe/iBP715RPl1uh/XU76
 g6KVJDwafQTbKrfai74t+JR3EHBbZSlvIzudkQitxGCutfwmRJAfDYCYkyqzSsvirk1L
 AACIzW6LwBOCR5MNpNzX04Fjkd5+v+plCfk96IGOWVPkHdtJhpWAr8tuwZKkHMiO5TkM
 rvSKmS0Pu0+7uqbu1Atop6t2zh9bvsRQJ1AzSQexWpuNWG/8mnRf7fx+OFxt/q7I7WwK
 aCFA==
X-Gm-Message-State: AOAM531PkgS56OlwlvavlDB/5lrsXksi0zUiT1Vhuoolb640ORru4Rih
 ccyMzjmnZeOzmQbABQbjhMc=
X-Google-Smtp-Source: ABdhPJwliQkS5O5QAObRlb1MPyWfpR5B70bSXSCGtCR9PUV8lwzDthFzWXZlc9YWILqypdxgX7VFnQ==
X-Received: by 2002:a17:90a:20a2:: with SMTP id
 f31mr318401pjg.34.1591075306770; 
 Mon, 01 Jun 2020 22:21:46 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.55.41])
 by smtp.googlemail.com with ESMTPSA id f18sm1004764pga.75.2020.06.01.22.21.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 22:21:46 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [RESEND PATCH v1 1/6] staging: greybus: audio: Update snd_jack FW
 usage as per new APIs
Date: Tue,  2 Jun 2020 10:51:10 +0530
Message-Id: <1ee2783b64c68e49880f88457655648ac45bbcb8.1591040859.git.vaibhav.sr@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591040859.git.vaibhav.sr@gmail.com>
References: <cover.1591040859.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 02 Jun 2020 15:10:43 +0200
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
 drivers/staging/greybus/audio_codec.c | 59 +++++++++++++++++++++------
 1 file changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 08746c85dea6..ebf8484f0ae7 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -709,17 +709,29 @@ static struct snd_soc_dai_driver gbaudio_dai[] = {
 };
 
 static int gbaudio_init_jack(struct gbaudio_module_info *module,
-			     struct snd_soc_codec *codec)
+			     struct snd_soc_card *card)
 {
 	int ret;
 
+	struct snd_soc_jack *jack;
+	struct snd_soc_jack_pin *headset, *button;
+
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
+	jack = &module->headset_jack;
+
+	ret = snd_soc_card_jack_new(card, module->jack_name, module->jack_mask,
+				    jack, headset, 1);
 	if (ret) {
 		dev_err(module->dev, "Failed to create new jack\n");
 		return ret;
@@ -730,11 +742,21 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 
 	snprintf(module->button_name, NAME_SIZE, "GB %d Button Jack",
 		 module->dev_id);
-	ret = snd_soc_jack_new(codec, module->button_name, module->button_mask,
-			       &module->button_jack);
+	button = devm_kzalloc(module->dev, sizeof(*headset), GFP_KERNEL);
+	if (!button) {
+		ret = -ENOMEM;
+		goto free_headset;
+	}
+
+	button->pin = module->button_name;
+	button->mask = module->button_mask;
+	jack = &module->button_jack;
+
+	ret = snd_soc_card_jack_new(card, module->button_name,
+				    module->button_mask, jack, button, 1);
 	if (ret) {
 		dev_err(module->dev, "Failed to create button jack\n");
-		return ret;
+		goto free_headset;
 	}
 
 	/*
@@ -750,7 +772,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 				       KEY_MEDIA);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_0\n");
-			return ret;
+			goto free_button;
 		}
 	}
 
@@ -759,7 +781,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 				       KEY_VOICECOMMAND);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_1\n");
-			return ret;
+			goto free_button;
 		}
 	}
 
@@ -768,7 +790,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 				       KEY_VOLUMEUP);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_2\n");
-			return ret;
+			goto free_button;
 		}
 	}
 
@@ -777,7 +799,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 				       KEY_VOLUMEDOWN);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_0\n");
-			return ret;
+			goto free_button;
 		}
 	}
 
@@ -788,6 +810,18 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 	*/
 
 	return 0;
+
+free_button:
+	jack = &module->button_jack;
+	snd_device_free(card->snd_card, jack->jack);
+	list_del(&jack->list);
+
+free_headset:
+	jack = &module->headset_jack;
+	snd_device_free(card->snd_card, jack->jack);
+	list_del(&jack->list);
+
+	return ret;
 }
 
 int gbaudio_register_module(struct gbaudio_module_info *module)
@@ -815,7 +849,7 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 		return -EINVAL;
 	}
 
-	ret = gbaudio_init_jack(module, codec);
+	ret = gbaudio_init_jack(module, component->card);
 	if (ret) {
 		up_write(&card->controls_rwsem);
 		return ret;
@@ -942,7 +976,8 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 
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

