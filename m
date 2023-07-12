Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C50147500DA
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 10:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EF366C1;
	Wed, 12 Jul 2023 10:10:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EF366C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689149467;
	bh=3KUKIZfZGrcxSfsgfQOfa4CtqE/FexWSD7w4dPXb+og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nG589OWr+Yjf7JyMSCqtm2Jhsx4h5JOEhuki3AGMJKqxcE/YmN8sVJSTBBhvbthWG
	 Ez31A60yWxFk31iA1f10FmkMMHEgbDpdFQ1hhiQO+5+YbCww7BQ4BUudZnycWtgNFF
	 CVWDr6M9gBv6WLFFr1S2pyDQMn0n5ymItEabU48Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1FF5F80249; Wed, 12 Jul 2023 10:10:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E5D1F80236;
	Wed, 12 Jul 2023 10:10:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFCA8F80249; Wed, 12 Jul 2023 10:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67208F8024E
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 10:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67208F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=CuzY6jr4
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6831e80080dso338414b3a.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jul 2023 01:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689149326; x=1691741326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Q6uX3QZM+MretKXDPhESSKBYs/QtN8Pl9WOLRIb584=;
        b=CuzY6jr4z3Wr6WuOzrPB407Ie/B5TRUKpN7CekuKy2RiiV7I8Tpqe4F32BmnyZEGtj
         AL5SJOxpZmDVVSIoQKZitdXD+BWusiXrLuFzX4LXYBYqWIJujSGnC3IbsSprIJKFg9rR
         FdMQ3iVFJMrq+qzK8vjARAQV0VGJf281WWXG34KcRfICGk0D/ROqZReT0/zJuFxnN39a
         ADN1QZJqmO3fjbXnriPQAMhy3s1v1kONwW1QY3KY/KXKfe3kEqWZYGClQaEw0393HI3e
         pzNgBJ/tKl9xZtDSIUK4OO8IbxCxPG8M1all4VbXNz2B4e8ziNbWJCZFk1ZPUFTMAVQP
         BWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689149326; x=1691741326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Q6uX3QZM+MretKXDPhESSKBYs/QtN8Pl9WOLRIb584=;
        b=O/R4ODZTfEyL3n7fOvWEShsVYMq02cd2uC0KR6P3ISBboAxZywFBuObyqzAP9vS0+N
         j8uqqiupQxaNUAFvlR5fzslt5Ht/f7mVx2/o3v8bGDGDbvGqil3bpC1LIUcDIX76SnuK
         lx+bjxHgq6yMjPwQr0IGEdKiMsOpIDRVzDp3bmzLH6xdOU0LSvZfAyZ9v0t5tGQOt6BE
         ewgt1deRU/xaFBBMzILnA9wmx4B0WzRspqnGCxxqlYw3BXjEts6QWP5yQWivaW74LxGG
         F+6YmL1TgF1hmx08CBGUENO9mGPhrP+8Xlb0VMyMnl5LMkW2RWEm639m8zHq9bpnfiAu
         H/bw==
X-Gm-Message-State: ABy/qLb78yi+Gvqs3ZJ3Eir2hF1rOXUku5q6rWJ7T+hgME4Bk8CmuWjw
	AFT6wok8+g9rwtNtk4ZWPvHvDMMI7kfeGkpD
X-Google-Smtp-Source: 
 APBJJlFgxi8xX71kyFQTNBcX2/RLzfYYU3v4At5g+bcLGx6yqnWzIqhALpFwoiYfTR671zsUM7ghzw==
X-Received: by 2002:a05:6a21:900c:b0:130:74c8:b501 with SMTP id
 tq12-20020a056a21900c00b0013074c8b501mr10390857pzb.30.1689149326299;
        Wed, 12 Jul 2023 01:08:46 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 z10-20020a170903018a00b001b3f9a5d4besm3285962plg.255.2023.07.12.01.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 01:08:46 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH 4/4] ASoC: codecs: ES8326: Update jact detection function
Date: Wed, 12 Jul 2023 16:08:30 +0800
Message-Id: <20230712080830.973766-4-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712080830.973766-1-zhuning0077@gmail.com>
References: <20230712080830.973766-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RWCKFSYY6WTRRMERHZCBREN44VZJ7WOS
X-Message-ID-Hash: RWCKFSYY6WTRRMERHZCBREN44VZJ7WOS
X-MailFrom: zhuning0077@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RWCKFSYY6WTRRMERHZCBREN44VZJ7WOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The old jack detection function only supports fixed OMTP/CTIA
hardware connection. The new one supports auto OMTP/CTIA
headset detection

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 113 ++++++++++++++++++++++++++++++--------
 sound/soc/codecs/es8326.h |  14 +++--
 2 files changed, 101 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 4fc5190d8494..c1b1f41bd4e4 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -41,6 +41,8 @@ struct es8326_priv {
 
 	bool calibrated;
 	int version;
+	int hp;
+	int jack_remove_retry;
 };
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
@@ -528,13 +530,14 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		return;
 
 	mutex_lock(&es8326->lock);
-	iface = snd_soc_component_read(comp, ES8326_HPDET_TYPE);
+	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
 		/* pause button detected */
 		cur_button = SND_JACK_BTN_0;
 		break;
 	case 0x6f:
+	case 0x4b:
 		/* button volume up */
 		cur_button = SND_JACK_BTN_1;
 		break;
@@ -543,6 +546,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		cur_button = SND_JACK_BTN_2;
 		break;
 	case 0x1e:
+	case 0xe2:
 		/* button released or not pressed */
 		cur_button = 0;
 		break;
@@ -552,20 +556,20 @@ static void es8326_jack_button_handler(struct work_struct *work)
 
 	if ((prev_button == cur_button) && (cur_button != 0)) {
 		press_count++;
-		if (press_count > 10) {
-			/* report a press every 500ms */
+		if (press_count > 3) {
+			/* report a press every 120ms */
 			snd_soc_jack_report(es8326->jack, cur_button,
 					SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
 			press_count = 0;
 		}
 		button_to_report = cur_button;
 		queue_delayed_work(system_wq, &es8326->button_press_work,
-				   msecs_to_jiffies(50));
+				   msecs_to_jiffies(35));
 	} else if (prev_button != cur_button) {
 		/* mismatch, detect again */
 		prev_button = cur_button;
 		queue_delayed_work(system_wq, &es8326->button_press_work,
-				   msecs_to_jiffies(50));
+				   msecs_to_jiffies(35));
 	} else {
 		/* released or no pressed */
 		if (button_to_report != 0) {
@@ -587,34 +591,98 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	unsigned int iface;
 
 	mutex_lock(&es8326->lock);
-	iface = snd_soc_component_read(comp, ES8326_HPDET_TYPE);
+	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
+
+	if (es8326->jack_remove_retry == 1) {
+		if (iface & ES8326_HPINSERT_FLAG)
+			es8326->jack_remove_retry = 2;
+		else
+			es8326->jack_remove_retry = 0;
+
+		dev_dbg(comp->dev, "remove event check, set HPJACK_POL normal, cnt = %d\n",
+				es8326->jack_remove_retry);
+		/*
+		 * Inverted HPJACK_POL bit to trigger one IRQ to double check HP Removal event
+		 */
+		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE,
+					ES8326_HP_DET_JACK_POL, (es8326->jd_inverted ?
+					~es8326->jack_pol : es8326->jack_pol));
+		goto exit;
+	}
+
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
 		/* Jack unplugged or spurious IRQ */
-		dev_dbg(comp->dev, "No headset detected");
+		dev_dbg(comp->dev, "No headset detected\n");
+		es8326_disable_micbias(es8326->component);
 		if (es8326->jack->status & SND_JACK_HEADPHONE) {
+			dev_dbg(comp->dev, "Report hp remove event\n");
 			snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
-			snd_soc_component_write(comp, ES8326_ADC1_SRC, es8326->mic2_src);
-			es8326_disable_micbias(comp);
+			/* mute adc when mic path switch */
+			regmap_write(es8326->regmap, ES8326_ADC_SCALE, 0x33);
+			regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x44);
+			regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x66);
+			es8326->hp = 0;
+		}
+		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
+		/*
+		 * Inverted HPJACK_POL bit to trigger one IRQ to double check HP Removal event
+		 */
+		if (es8326->jack_remove_retry == 0) {
+			es8326->jack_remove_retry = 1;
+			dev_dbg(comp->dev, "remove event check, invert HPJACK_POL, cnt = %d\n",
+					es8326->jack_remove_retry);
+			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE,
+					ES8326_HP_DET_JACK_POL, (es8326->jd_inverted ?
+					es8326->jack_pol : ~es8326->jack_pol));
+
+		} else {
+			es8326->jack_remove_retry = 0;
 		}
 	} else if ((iface & ES8326_HPINSERT_FLAG) == ES8326_HPINSERT_FLAG) {
+		es8326->jack_remove_retry = 0;
+		if (es8326->hp == 0) {
+			dev_dbg(comp->dev, "First insert, start OMTP/CTIA type check\n");
+			/*
+			 * set auto-check mode, then restart jack_detect_work after 100ms.
+			 * Don't report jack status.
+			 */
+			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
+			usleep_range(50000, 70000);
+			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
+			queue_delayed_work(system_wq, &es8326->jack_detect_work,
+					msecs_to_jiffies(100));
+			es8326->hp = 1;
+			goto exit;
+		}
 		if (es8326->jack->status & SND_JACK_HEADSET) {
 			/* detect button */
+			dev_dbg(comp->dev, "button pressed\n");
 			queue_delayed_work(system_wq, &es8326->button_press_work, 10);
+			goto exit;
+		}
+		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
+			dev_dbg(comp->dev, "Headphone detected\n");
+			snd_soc_jack_report(es8326->jack,
+					SND_JACK_HEADPHONE, SND_JACK_HEADSET);
 		} else {
-			if ((iface & ES8326_HPBUTTON_FLAG) == 0x00) {
-				dev_dbg(comp->dev, "Headset detected");
-				snd_soc_jack_report(es8326->jack,
-						    SND_JACK_HEADSET, SND_JACK_HEADSET);
-				snd_soc_component_write(comp,
-							ES8326_ADC1_SRC, es8326->mic1_src);
-			} else {
-				dev_dbg(comp->dev, "Headphone detected");
-				snd_soc_jack_report(es8326->jack,
-						    SND_JACK_HEADPHONE, SND_JACK_HEADSET);
-			}
+			dev_dbg(comp->dev, "Headset detected\n");
+			snd_soc_jack_report(es8326->jack,
+					SND_JACK_HEADSET, SND_JACK_HEADSET);
+
+			regmap_write(es8326->regmap, ES8326_ADC_SCALE, 0x33);
+			regmap_update_bits(es8326->regmap, ES8326_PGA_PDN,
+					0x08, 0x08);
+			regmap_update_bits(es8326->regmap, ES8326_PGAGAIN,
+					0x80, 0x80);
+			regmap_write(es8326->regmap, ES8326_ADC1_SRC, 0x00);
+			regmap_write(es8326->regmap, ES8326_ADC2_SRC, 0x00);
+			regmap_update_bits(es8326->regmap, ES8326_PGA_PDN,
+					0x08, 0x00);
+			usleep_range(10000, 15000);
 		}
 	}
+exit:
 	mutex_unlock(&es8326->lock);
 }
 
@@ -633,7 +701,7 @@ static irqreturn_t es8326_irq(int irq, void *dev_id)
 				   msecs_to_jiffies(10));
 	else
 		queue_delayed_work(system_wq, &es8326->jack_detect_work,
-				   msecs_to_jiffies(300));
+				   msecs_to_jiffies(600));
 
 out:
 	return IRQ_HANDLED;
@@ -766,7 +834,8 @@ static int es8326_resume(struct snd_soc_component *component)
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol) :
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol | 0x04)));
 
-	es8326_irq(es8326->irq, es8326);
+	es8326->jack_remove_retry = 0;
+	es8326->hp = 0;
 	return 0;
 }
 
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index 9093222ae04d..34bc3313a518 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -127,6 +127,10 @@
 
 /* ES8326_HP_CAL */
 #define ES8326_HPOR_SHIFT 4
+#define ES8326_HPOL_CALI (1 << 7)
+#define ES8326_HPOR_CALI (1 << 3)
+#define ES8326_HPOL_ON (7 << 4)
+#define ES8326_HPOR_ON (7 << 0)
 
 /* ES8326_ADC1_SRC */
 #define ES8326_ADC1_SHIFT 0
@@ -149,14 +153,16 @@
 #define ES8326_ADC4_SHIFT 3
 
 /* ES8326_HP_DET */
+#define ES8326_HP_INSERT_SEL (3 << 4)
+#define ES8326_HP_DET_DISABLE (0 << 4)
 #define ES8326_HP_DET_SRC_PIN27 (1 << 5)
 #define ES8326_HP_DET_SRC_PIN9 (1 << 4)
 #define ES8326_HP_DET_JACK_POL (1 << 3)
 #define ES8326_HP_DET_BUTTON_POL (1 << 2)
-#define ES8326_HP_TYPE_OMTP	(3 << 0)
-#define ES8326_HP_TYPE_CTIA	(2 << 0)
-#define ES8326_HP_TYPE_AUTO	(1 << 0)
-#define ES8326_HP_TYPE_AUTO_INV	(0 << 0)
+#define ES8326_HP_TYPE_CTIA	(3 << 0)
+#define ES8326_HP_TYPE_OMTP	(2 << 0)
+#define ES8326_HP_TYPE_TRS	(1 << 0)
+#define ES8326_HP_TYPE_AUTO	(0 << 0)
 
 /* ES8326_SDINOUT1_IO */
 #define ES8326_IO_INPUT	(0 << 0)
-- 
2.34.1

