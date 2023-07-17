Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2B0755A23
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 05:37:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1927AE0F;
	Mon, 17 Jul 2023 05:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1927AE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689565026;
	bh=rtdGQYBWGUpna2FPjsL9T4rQG6S0ab/3WCfgQD2+N10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LLeVoVikYkBw+PjMGomXRUI/m5j4LY+SLzIBmbj5k+4awES5DA2fqZQm8Bf7//LIv
	 aUs7SGjS+C0upYricqZtPmRV7DExxuZFyDFdXApgGqybF5e5cS5eNi6HiYWvpmgyti
	 up/q7zpS7j9ZN+/YDMBp/fMfPgtQzLxDAiKXi57E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20924F8057B; Mon, 17 Jul 2023 05:35:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34E70F80578;
	Mon, 17 Jul 2023 05:35:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCD62F8047D; Mon, 17 Jul 2023 05:33:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5414FF8032D
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 05:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5414FF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=FUqeePH0
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3a1e6022b93so2939412b6e.1
        for <alsa-devel@alsa-project.org>;
 Sun, 16 Jul 2023 20:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689564758; x=1692156758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbZ8B9EmRUagDKp2bmjGUZzuohr9WL08JwlgNpFRSPk=;
        b=FUqeePH0dmcgxhHNTF9xOXEfXtFY2knFN618TyPHDyzW+JmLShbbxnHVkjQYG5t9yH
         JkX8L1tkxYvqHnAv13CQCa1G55p5zGA7pGkMnwWFevEIslDrgKEQAfzfrm/pacf3d4QI
         yTkFo2OP/yBjypdp5GACrPecStaTjHReBdeRRdQEl2XYT0JdbJrnqPKu6RJU1nSbnKN3
         3oFoXCpsgIWJvRDvrFZ34w5rkNlsxg6R/+Pqg9uKNuaKKTp7l4+KPbk6lBKA+oe0LYjO
         wNXoUJeRDtBzu53CTLP90saTYXn3fMxAmb29zKh6w47o0jkeSdwy/ESV9HqWeXqqJLbK
         QFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689564758; x=1692156758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZbZ8B9EmRUagDKp2bmjGUZzuohr9WL08JwlgNpFRSPk=;
        b=anfk9qiEnNnfbIZqv8+z5YdaG85bggiIVYLF/xAbD//rYRxvUlQaBPhp80ONZOKNmf
         VPqhfNr3995P62ShdmroUVmhigDlkjqpOHxhptl3bqyAeS2gQTJf8Lwf4CQil2pux20I
         sawQ0OQH1eFZDB2Owb730cX3gAP9uohYg1CJahZHOcxr9pwK5jPRPA64VY60xaeH42Tv
         MXhIGagWrpU/EnV1EhNQFtbi+/itCbDPtVEv/4CZF+joKTVLyFaa2rzmsUx+TWMnFScv
         k7mWqhID6k4jeHCddn27SyB9GLRav/oyTdfFs3BNweTLAaPwDKWqJTivvLQj3xpDYxof
         fQNw==
X-Gm-Message-State: ABy/qLYkXUY1qx8uzRxs/K+5xyaWB+YIGgc0VhB2+oddQGSBoFw9Is5x
	ClYB5agTArQJRo8MpbxqE1q/WIY0TkYfMlRa
X-Google-Smtp-Source: 
 APBJJlEWMVVqeKj8z9+jTurhA6evp44VtrxH+r5igBjvCOdmByWsF3ZlsryhLh5MEsSDp0J+h+8yBA==
X-Received: by 2002:a05:6808:1645:b0:3a3:7977:8995 with SMTP id
 az5-20020a056808164500b003a379778995mr10537548oib.47.1689564757822;
        Sun, 16 Jul 2023 20:32:37 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 a28-20020a63705c000000b00528513c6bbcsm11647509pgn.28.2023.07.16.20.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 20:32:37 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v2 5/5] ASoC: codecs: ES8326: Update jact detection function
Date: Mon, 17 Jul 2023 11:32:23 +0800
Message-Id: <20230717033223.42506-5-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717033223.42506-1-zhuning0077@gmail.com>
References: <20230717033223.42506-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2E2AFLBGMJHBB4GFSV22V34SSD7HSS2M
X-Message-ID-Hash: 2E2AFLBGMJHBB4GFSV22V34SSD7HSS2M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2E2AFLBGMJHBB4GFSV22V34SSD7HSS2M/>
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
 sound/soc/codecs/es8326.c | 109 +++++++++++++++++++++++++++++++-------
 1 file changed, 89 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 50b13296e246..74c03d151005 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -41,6 +41,8 @@ struct es8326_priv {
 
 	bool calibrated;
 	int version;
+	int hp;
+	int jack_remove_retry;
 };
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(dac_vol_tlv, -9550, 50, 0);
@@ -535,6 +537,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
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
@@ -589,32 +593,96 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	mutex_lock(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
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
@@ -763,7 +831,8 @@ static int es8326_resume(struct snd_soc_component *component)
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol) :
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol | 0x04)));
 
-	es8326_irq(es8326->irq, es8326);
+	es8326->jack_remove_retry = 0;
+	es8326->hp = 0;
 	return 0;
 }
 
-- 
2.34.1

