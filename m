Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E42BD1EBCC7
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 15:14:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 994EC1677;
	Tue,  2 Jun 2020 15:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 994EC1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591103649;
	bh=ouHYNWuDpPWltr6a6eREKtebhB6oDOUPxnGIKOAwKl8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W+1OGRR/qyIAPR9NE1u9WDxCGSbquOpCpT+zfVFPZYnpO8K3/iEqJmFOmdLSb3VFy
	 pgTf8grOnRcjDxjUYRG5tsrdqCCSq5ubP1DB2j/mzFPS7ThFQcf4wNkuSjfkhxtE88
	 9TDCsXQRV621fbqjyxo4GGkhNc78sEo31WH3VQMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E1FEF802A0;
	Tue,  2 Jun 2020 15:10:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E324F8026F; Tue,  2 Jun 2020 07:22:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9D42F8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 07:21:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9D42F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LjAd7juK"
Received: by mail-pl1-x642.google.com with SMTP id g12so865465pll.10
 for <alsa-devel@alsa-project.org>; Mon, 01 Jun 2020 22:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6w49s8vASLEohgXCuLWOT610sDy/W13BVCsIn1lkugE=;
 b=LjAd7juKsAoR9uNpTa+UgdK7B9QTuMRto3ngp9JnESyAhUz0TZNTA6OY2IrxAiiHT5
 HQ4hw5kf1yIs0W86wh3Gc6nZq0PQqT0gXgQmk6jq+M3QaVE6RUx720BKpPJqvtO/rjPA
 ESEJXNzOhRam6cpess4xrFI9yTQ9aciQl3Gb1jRpuq8Ng8bp/WNL4+BrZVNoHBQLWvHt
 zSg+m2HNQyok/dIYWrJptOdMJcnuS2PmHI/lH9HmC9vENq9I+n/Bl3KN5IeX76QwMfd/
 tUJxS2BXDLGy/WHHgLC4Ra/LRRQPPDsZCWXZ2KQf1pOXTA4TdtmlzIH8Hm/ENRAEUFCI
 hyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6w49s8vASLEohgXCuLWOT610sDy/W13BVCsIn1lkugE=;
 b=eJA0BhoVVKhG/ygBWmbNEYV6boT9RjfbOx8e6CDUSIJrZsS+izoQ8IMmnGUCDg+4zh
 TXeuC7cOFb6B91Sptrw1B2+RJVdWABAglKuRnr5Qg/IrERQ8WKcymlkAnFYwPVd46XrP
 IddaPNfq/aGBolQCAoHzsv99uMoDMve84AaV3opYsA/j0yiWDkw/5i1xHh8C95jCS2Lu
 pCFGCpe2tmCUhYeYcwWeBGl2fksbEerjUTfLqRhIVFq9D0hC2I3Zi9GdA+CRGdVzBdS0
 Wtd7UwzyHLQPlrGjOzQTEkWnNV1gZGeUP3FHOLIc8hm5Htxz4nEsRExouSV+HfbH44WT
 J6uw==
X-Gm-Message-State: AOAM531AEDQgW8WBo8LWC3RcLI/5QGMO2jvum7JsoRuWHGDC7SvCXTX6
 mDJLVpn4YXFUh4CrQgADn1g=
X-Google-Smtp-Source: ABdhPJxbspGz7qP61diRakcvcAkIj5uoqUpw3niU51tUCw17/TaHluyeihPQsMQrg+wSJwzWsqeBBA==
X-Received: by 2002:a17:90a:32ee:: with SMTP id
 l101mr3561025pjb.213.1591075317759; 
 Mon, 01 Jun 2020 22:21:57 -0700 (PDT)
Received: from cvds-vagarw7.iind.intel.com ([192.55.55.41])
 by smtp.googlemail.com with ESMTPSA id f18sm1004764pga.75.2020.06.01.22.21.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 22:21:57 -0700 (PDT)
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Mark Greer <mgreer@animalcreek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [RESEND PATCH v1 2/6] staging: greybus: audio: Maintain jack list
 within GB Audio module
Date: Tue,  2 Jun 2020 10:51:11 +0530
Message-Id: <ccb39352a30ab39df1534efafc9415aa89b156fa.1591040859.git.vaibhav.sr@gmail.com>
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

As per the current implementation for GB codec driver, a jack list is
maintained for each module. And it expects the list to be populated by
the snd_soc_jack structure which would require modifications in
mainstream code.

However, this is not a necessary requirement and the list can be easily
maintained within gbaudio_module_info as well. This patch provides the
relevant changes for the same.

Signed-off-by: Vaibhav Agarwal <vaibhav.sr@gmail.com>
---
 drivers/staging/greybus/audio_codec.c  | 76 ++++++++++++++------------
 drivers/staging/greybus/audio_codec.h  | 10 +++-
 drivers/staging/greybus/audio_module.c | 20 ++++---
 3 files changed, 60 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index ebf8484f0ae7..a2ee587e5a79 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -712,7 +712,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 			     struct snd_soc_card *card)
 {
 	int ret;
-
+	struct gbaudio_jack *gba_jack, *n;
 	struct snd_soc_jack *jack;
 	struct snd_soc_jack_pin *headset, *button;
 
@@ -728,7 +728,8 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 
 	headset->pin = module->jack_name;
 	headset->mask = module->jack_mask;
-	jack = &module->headset_jack;
+	gba_jack = &module->headset;
+	jack = &gba_jack->jack;
 
 	ret = snd_soc_card_jack_new(card, module->jack_name, module->jack_mask,
 				    jack, headset, 1);
@@ -737,6 +738,9 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 		return ret;
 	}
 
+	/* Add to module's jack list */
+	list_add(&gba_jack->list, &module->jack_list);
+
 	if (!module->button_mask)
 		return 0;
 
@@ -745,20 +749,24 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 	button = devm_kzalloc(module->dev, sizeof(*headset), GFP_KERNEL);
 	if (!button) {
 		ret = -ENOMEM;
-		goto free_headset;
+		goto free_jack;
 	}
 
 	button->pin = module->button_name;
 	button->mask = module->button_mask;
-	jack = &module->button_jack;
+	gba_jack = &module->button;
+	jack = &gba_jack->jack;
 
 	ret = snd_soc_card_jack_new(card, module->button_name,
 				    module->button_mask, jack, button, 1);
 	if (ret) {
 		dev_err(module->dev, "Failed to create button jack\n");
-		goto free_headset;
+		goto free_jack;
 	}
 
+	/* Add to module's jack list */
+	list_add(&gba_jack->list, &module->jack_list);
+
 	/*
 	 * Currently, max 4 buttons are supported with following key mapping
 	 * BTN_0 = KEY_MEDIA
@@ -768,58 +776,55 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 	 */
 
 	if (module->button_mask & SND_JACK_BTN_0) {
-		ret = snd_jack_set_key(module->button_jack.jack, SND_JACK_BTN_0,
+		ret = snd_jack_set_key(jack->jack, SND_JACK_BTN_0,
 				       KEY_MEDIA);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_0\n");
-			goto free_button;
+			goto free_jack;
 		}
 	}
 
 	if (module->button_mask & SND_JACK_BTN_1) {
-		ret = snd_jack_set_key(module->button_jack.jack, SND_JACK_BTN_1,
+		ret = snd_jack_set_key(jack->jack, SND_JACK_BTN_1,
 				       KEY_VOICECOMMAND);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_1\n");
-			goto free_button;
+			goto free_jack;
 		}
 	}
 
 	if (module->button_mask & SND_JACK_BTN_2) {
-		ret = snd_jack_set_key(module->button_jack.jack, SND_JACK_BTN_2,
+		ret = snd_jack_set_key(jack->jack, SND_JACK_BTN_2,
 				       KEY_VOLUMEUP);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_2\n");
-			goto free_button;
+			goto free_jack;
 		}
 	}
 
 	if (module->button_mask & SND_JACK_BTN_3) {
-		ret = snd_jack_set_key(module->button_jack.jack, SND_JACK_BTN_3,
+		ret = snd_jack_set_key(jack->jack, SND_JACK_BTN_3,
 				       KEY_VOLUMEDOWN);
 		if (ret) {
 			dev_err(module->dev, "Failed to set BTN_0\n");
-			goto free_button;
+			goto free_jack;
 		}
 	}
 
 	/* FIXME
 	 * verify if this is really required
 	set_bit(INPUT_PROP_NO_DUMMY_RELEASE,
-		module->button_jack.jack->input_dev->propbit);
+		module->button->jack->jack->input_dev->propbit);
 	*/
 
 	return 0;
 
-free_button:
-	jack = &module->button_jack;
-	snd_device_free(card->snd_card, jack->jack);
-	list_del(&jack->list);
-
-free_headset:
-	jack = &module->headset_jack;
-	snd_device_free(card->snd_card, jack->jack);
-	list_del(&jack->list);
+free_jack:
+	list_for_each_entry_safe(gba_jack, n, &module->jack_list, list) {
+		jack = &gba_jack->jack;
+		snd_device_free(card->snd_card, jack->jack);
+		list_del(&gba_jack->list);
+	}
 
 	return ret;
 }
@@ -829,6 +834,7 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 	int ret;
 	struct snd_soc_codec *codec;
 	struct snd_card *card;
+	struct gbaudio_jack *gba_jack = NULL;
 	struct snd_soc_jack *jack = NULL;
 
 	if (!gbcodec) {
@@ -874,11 +880,10 @@ int gbaudio_register_module(struct gbaudio_module_info *module)
 		 * register jack devices for this module
 		 * from codec->jack_list
 		 */
-		list_for_each_entry(jack, &codec->jack_list, list) {
-			if ((jack == &module->headset_jack) ||
-			    (jack == &module->button_jack))
-				snd_device_register(codec->card->snd_card,
-						    jack->jack);
+		list_for_each_entry(gba_jack, &module->jack_list, list) {
+			jack = &gba_jack->jack;
+			snd_device_register(codec->card->snd_card,
+					    jack->jack);
 		}
 #endif
 	}
@@ -962,7 +967,8 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 {
 	struct snd_soc_codec *codec = gbcodec->codec;
 	struct snd_card *card = codec->card->snd_card;
-	struct snd_soc_jack *jack, *next_j;
+	struct gbaudio_jack *gba_jack, *n;
+	struct snd_soc_jack *jack;
 	int mask;
 
 	dev_dbg(codec->dev, "Unregister %s module\n", module->name);
@@ -975,21 +981,21 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 	mutex_unlock(&gbcodec->lock);
 
 #ifdef CONFIG_SND_JACK
-	/* free jack devices for this module from codec->jack_list */
-	list_for_each_entry_safe(jack, next_j, &component->card->jack_list,
-				 list) {
-		if (jack == &module->headset_jack)
+	/* free jack devices for this module jack_list */
+	list_for_each_entry_safe(gba_jack, n, &module->jack_list, list) {
+		if (gba_jack == &module->headset)
 			mask = GBCODEC_JACK_MASK;
-		else if (jack == &module->button_jack)
+		else if (gba_jack == &module->button)
 			mask = GBCODEC_JACK_BUTTON_MASK;
 		else
 			mask = 0;
 		if (mask) {
+			jack = &gba_jack->jack;
 			dev_dbg(module->dev, "Report %s removal\n",
 				jack->jack->id);
 			snd_soc_jack_report(jack, 0, mask);
 			snd_device_free(codec->card->snd_card, jack->jack);
-			list_del(&jack->list);
+			list_del(&gba_jack->list);
 		}
 	}
 #endif
diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index cb5d271da1a5..af9195eceb3a 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -106,6 +106,11 @@ enum gbaudio_module_state {
 	GBAUDIO_MODULE_ON,
 };
 
+struct gbaudio_jack {
+	struct snd_soc_jack jack;
+	struct list_head list;
+};
+
 struct gbaudio_module_info {
 	/* module info */
 	struct device *dev;
@@ -130,8 +135,8 @@ struct gbaudio_module_info {
 	int jack_mask;
 	int button_mask;
 	int button_status;
-	struct snd_soc_jack headset_jack;
-	struct snd_soc_jack button_jack;
+	struct gbaudio_jack headset;
+	struct gbaudio_jack button;
 
 	/* connection info */
 	struct gb_connection *mgmt_connection;
@@ -155,6 +160,7 @@ struct gbaudio_module_info {
 	struct list_head widget_list;
 	struct list_head ctl_list;
 	struct list_head widget_ctl_list;
+	struct list_head jack_list;
 
 	struct gb_audio_topology *topology;
 };
diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 300a2b4f3fc7..cdd4b6be5e9c 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -21,8 +21,10 @@ static int gbaudio_request_jack(struct gbaudio_module_info *module,
 				struct gb_audio_jack_event_request *req)
 {
 	int report;
-	struct snd_jack *jack = module->headset_jack.jack;
-	struct snd_jack *btn_jack = module->button_jack.jack;
+	struct snd_soc_jack *hs = &module->headset.jack;
+	struct snd_soc_jack *btn = &module->button.jack;
+	struct snd_jack *jack = hs->jack;
+	struct snd_jack *btn_jack = btn->jack;
 
 	if (!jack) {
 		dev_err_ratelimited(module->dev,
@@ -38,12 +40,10 @@ static int gbaudio_request_jack(struct gbaudio_module_info *module,
 	if (req->event == GB_AUDIO_JACK_EVENT_REMOVAL) {
 		module->jack_type = 0;
 		if (btn_jack && module->button_status) {
-			snd_soc_jack_report(&module->button_jack, 0,
-					    module->button_mask);
+			snd_soc_jack_report(btn, 0, module->button_mask);
 			module->button_status = 0;
 		}
-		snd_soc_jack_report(&module->headset_jack, 0,
-				    module->jack_mask);
+		snd_soc_jack_report(hs, 0, module->jack_mask);
 		return 0;
 	}
 
@@ -61,7 +61,7 @@ static int gbaudio_request_jack(struct gbaudio_module_info *module,
 				     module->jack_type, report);
 
 	module->jack_type = report;
-	snd_soc_jack_report(&module->headset_jack, report, module->jack_mask);
+	snd_soc_jack_report(hs, report, module->jack_mask);
 
 	return 0;
 }
@@ -70,7 +70,8 @@ static int gbaudio_request_button(struct gbaudio_module_info *module,
 				  struct gb_audio_button_event_request *req)
 {
 	int soc_button_id, report;
-	struct snd_jack *btn_jack = module->button_jack.jack;
+	struct snd_soc_jack *btn = &module->button.jack;
+	struct snd_jack *btn_jack = btn->jack;
 
 	if (!btn_jack) {
 		dev_err_ratelimited(module->dev,
@@ -124,7 +125,7 @@ static int gbaudio_request_button(struct gbaudio_module_info *module,
 
 	module->button_status = report;
 
-	snd_soc_jack_report(&module->button_jack, report, module->button_mask);
+	snd_soc_jack_report(btn, report, module->button_mask);
 
 	return 0;
 }
@@ -258,6 +259,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	INIT_LIST_HEAD(&gbmodule->widget_list);
 	INIT_LIST_HEAD(&gbmodule->ctl_list);
 	INIT_LIST_HEAD(&gbmodule->widget_ctl_list);
+	INIT_LIST_HEAD(&gbmodule->jack_list);
 	gbmodule->dev = dev;
 	snprintf(gbmodule->name, NAME_SIZE, "%s.%s", dev->driver->name,
 		 dev_name(dev));
-- 
2.26.2

