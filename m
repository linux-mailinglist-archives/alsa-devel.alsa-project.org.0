Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE87F752FF0
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 05:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33B62E11;
	Fri, 14 Jul 2023 05:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33B62E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689305296;
	bh=rSbOfH40gnUkWe5YEFRVKpbsWJedT9JZ3xUbzXAKW5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rgIzZzHSfzLtPczib2OYNI9+Qr1C/KI0C3gy79ejSFmM0VhFzpw6Fvi2EPJjjCz1t
	 R2aw6NSgF27jmymVv2Zm+5yUG1eWHaO1rW9sfub3g4TIrHGgqlfHaQrkdJwubczFD8
	 OZmD3/6lLE19XwYWmtPIQuUJ/3YXMzaRoiwj7j2c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60AFCF805A0; Fri, 14 Jul 2023 05:26:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 205E3F80588;
	Fri, 14 Jul 2023 05:26:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 036A0F80236; Fri, 14 Jul 2023 05:25:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6683F8024E
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 05:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6683F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=rUMg3bF9
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-26586e824e7so699047a91.3
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 20:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689305112; x=1691897112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df/yzNnf113vLbNsPU0LAwfRD+OTGiv/GARCU5EDeks=;
        b=rUMg3bF9gwMv6OxrDFCcN/otnEmwnZeLeZnv0f61cfJslI8ewZKl7SS78PXS6mIxlX
         iVoNBmCibEoKx5oOGcIC/3Aukzbo9vXYVU5hR/SiePCJfLuKpn8NzGLa0m3mb8ly9j85
         7fWV2b/odJY/JZ+dknTvq2e2ys6wUajLnFxGGj0VyqJUZO4TyMu7bghMvwMtfQGQ3fZ5
         SNddvdN7f1Oyt/R37Lq5i6QrM4c5oMtv1JOCz3LjN47OMC/yu2pN0tWSiL4rQxmxF2c3
         bEM36R8qvDyXKf9t96MvO4OhsUGyUB+K5Gtmjkmb0KXRqcQfjdMF+yJaVMh6H/CjG1/Z
         iepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689305112; x=1691897112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=df/yzNnf113vLbNsPU0LAwfRD+OTGiv/GARCU5EDeks=;
        b=hTmn8ow6jVYw2ZVALW8ocud0ACDFXe/WNN0Xq+P/dbO6FCmZOwP30bofVbj/4+lReg
         igVWXDGydu1i+LXzfNSlIm0SQy0BCMVfq1pBCmdMXQ4YYEUZY638uUtOn+mxJ89Lvnth
         jK3JrNOU/3+NJ3h9iUjZ0zDWXPQzVegpvLWXzBquQ2/ABrBdZL99fj7uAkKsYahTfvDi
         LtzdPN5YZaFUytVmVsqEczY5KeuimbpTA/s+VUsagprggHHSOzSZhU5oD0e9R6wkRwFd
         70IVuTAvKwj9W+WFsobXB3X2VbOjz2zEguiYcKTGzzBCV8zAuVQsxhjXdKvUHKpLB9EL
         c9Dg==
X-Gm-Message-State: ABy/qLYHbHegSzObHGrvsz/oP8hXp5lj7XHQ844AT1AA+ujMXyYXMaTY
	HhfBori3IYxHoVIxttJtZngQ/DVf88RCr2c5
X-Google-Smtp-Source: 
 APBJJlFXzXD5DI8QjxgUETFtVucalJgzfF6jj7TEWOdMjrneU1EzZfpK9yRija72dYTo5IeGdfUMMQ==
X-Received: by 2002:a17:90a:7781:b0:263:f648:e6e1 with SMTP id
 v1-20020a17090a778100b00263f648e6e1mr2270330pjk.14.1689305111518;
        Thu, 13 Jul 2023 20:25:11 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 t3-20020a17090b018300b00262d6ac0140sm216016pjs.9.2023.07.13.20.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 20:25:11 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 5/5] ASoC: codecs: ES8326: Update jact detection function
Date: Fri, 14 Jul 2023 11:24:53 +0800
Message-Id: <20230714032453.3334-5-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714032453.3334-1-zhuning0077@gmail.com>
References: <20230714032453.3334-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O5LLM2KDV5EJXDOZTD47DQZRT2HBAGSL
X-Message-ID-Hash: O5LLM2KDV5EJXDOZTD47DQZRT2HBAGSL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O5LLM2KDV5EJXDOZTD47DQZRT2HBAGSL/>
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
 sound/soc/codecs/es8326.c | 111 +++++++++++++++++++++++++++++++-------
 1 file changed, 91 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 0474bfd79aa5..40bd9b7c82ed 100644
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
@@ -763,7 +831,10 @@ static int es8326_resume(struct snd_soc_component *component)
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol) :
 			(ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol | 0x04)));
 
-	es8326_irq(es8326->irq, es8326);
+	es8326->jack_remove_retry = 0;
+	es8326->hp = 0;
+	dev_dbg(component->dev, "es8326->jack_remove_retry = %d", es8326->jack_remove_retry);
+	dev_dbg(component->dev, "es8326->hp= %d", es8326->hp);
 	return 0;
 }
 
-- 
2.34.1

