Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C9983338F
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jan 2024 11:16:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 094F07F8;
	Sat, 20 Jan 2024 11:16:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 094F07F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705745774;
	bh=biAapYxHeeokdyQw9Z1WAP41WVsRCym8l3FljfSgHUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nj3UwEbAnZAYbHgdLMmVjhdMrhWk20VeHAHzB3UNGQqru7SADwEpfcGIb38+/4SBm
	 vsiaH1aqetsz7K32sc0FMaNg8X0itDH4eO1CljIMKMDJFtCMBQiXH5b2BRYyPmd5Jo
	 ZCW4o9ijVg1WY/NENH+OHy4xzKQmbPUbZ7WXi38Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 183B5F805A8; Sat, 20 Jan 2024 11:15:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 448B1F805C8;
	Sat, 20 Jan 2024 11:15:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27B49F80236; Sat, 20 Jan 2024 11:13:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3813F8014B
	for <alsa-devel@alsa-project.org>; Sat, 20 Jan 2024 11:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3813F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hreshklg
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-361af86c7f7so3863985ab.3
        for <alsa-devel@alsa-project.org>;
 Sat, 20 Jan 2024 02:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705745573; x=1706350373;
 darn=alsa-project.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tarW1IWFVdEd8Eg2tTqYDQxdL2RArk29+vqx+X5rhUU=;
        b=hreshklgsehhTADbtCUMIdeEzbE2IrqNC/o2G3NM6xMaoYS8S3WRQeY1LaS9En+ejo
         1K+ggfThw+fqvGfn/vVeZFp1b8UHoTNuha+tx3VXCfsewO6OdZ3IuCbJDGDZyHN5wfx5
         3OvOq4055NMC2XaLtN4uTlm6vxkJveI/CJ4BQDtJhYGEvaEeVH4ayURx4hiqMvAo9ynF
         Ut+p1kg+Tmjy2QHpiI7vEVmJAxlOaNT6jsRF6SJqQQRqj2x/FUc4ZC5Atut+DEVM5PUR
         lHpIKEW0/W3yaIhwhoyYVAp1Uk1XJAQjnczPjR0sfrtTPVKbfFukBg9xls/z9wgWFzje
         nPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705745573; x=1706350373;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tarW1IWFVdEd8Eg2tTqYDQxdL2RArk29+vqx+X5rhUU=;
        b=dApmMd2RchMP6siXI2QEgFon+IwD7HxckTyC7PNmf4emNVaRKtpW5yV+YzKIgoZK+s
         EkEY8iwVFC3iqVUbk9EF4RkxQntNGMlDkxuTyON8bODJqrWxeBisBzUNsNqtaOM33IdX
         Rfk7hhoMBpV9RoDUwEjlqXqk25BfVPI3rKWI6KO7O4+yVIM7cRS4SVRExehceMPNVWog
         SW0ZerNtSNqKgfnJR2bT18OdxxarW7u4UpTr11Ii8FJs9m7P1x2vbnPG40HqbO/X+n1K
         RtM3LcRwcGSU0jgWS5fr0ghCBmjIC/RUFMYgBxpiJwRbatou8C1aSjeF2eZ/+op/7yN5
         EIPg==
X-Gm-Message-State: AOJu0YyZUNSO+N4i+AanzJthr/G4kZTy0nIVyqQUGT5ISnkdgfkACYtk
	G3jyBuRpbFCZElgSzp1Z+hASkai8JK3LUauQK2zhGXvXJgNTA4rkVnVxFsnu3jyv0g==
X-Google-Smtp-Source: 
 AGHT+IGgC6ECdtCWi1zIV7aUGnDdXVxTy/augsh5rQItYRUMtYA69PDQmosTPAcw4qu4iVF0PjkelA==
X-Received: by 2002:a05:6e02:c73:b0:35f:d8fd:8ecc with SMTP id
 f19-20020a056e020c7300b0035fd8fd8eccmr1578082ilj.0.1705745573503;
        Sat, 20 Jan 2024 02:12:53 -0800 (PST)
Received: from zy-virtual-machine.localdomain ([222.70.13.170])
        by smtp.gmail.com with ESMTPSA id
 jc17-20020a17090325d100b001d72cf69508sm967365plb.23.2024.01.20.02.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 02:12:53 -0800 (PST)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 2/5] ASoC: codecs: ES8326: Improving the THD+N performance
Date: Sat, 20 Jan 2024 18:12:37 +0800
Message-Id: <20240120101240.12496-3-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240120101240.12496-1-zhuning0077@gmail.com>
References: <20240120101240.12496-1-zhuning0077@gmail.com>
Message-ID-Hash: FYPLCISXISSZFYDT5N2WM5MX47EKXBWI
X-Message-ID-Hash: FYPLCISXISSZFYDT5N2WM5MX47EKXBWI
X-MailFrom: zhuning0077@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FYPLCISXISSZFYDT5N2WM5MX47EKXBWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We update the values of some registers in the initialization
sequence in es8326_resume function to improve THD+N performance.
THD+N performance decreases if the output level on headphone is
close to full scale. So we change the register setting in
es8326_jack_detect_handler function to improve THD+N performance
if headphone pulgged. Also, the register setting should be restored
when the headset is unplugged

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 21 +++++++++++++--------
 sound/soc/codecs/es8326.h |  2 +-
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 82d1c4f8324c..10157a4bd500 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -752,6 +752,8 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			es8326->hp = 0;
 		}
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
+		regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x0a);
+		regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x0f, 0x03);
 		/*
 		 * Inverted HPJACK_POL bit to trigger one IRQ to double check HP Removal event
 		 */
@@ -777,6 +779,8 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x01);
 			usleep_range(50000, 70000);
 			regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE, 0x03, 0x00);
+			regmap_write(es8326->regmap, ES8326_SYS_BIAS, 0x1f);
+			regmap_update_bits(es8326->regmap, ES8326_HP_DRIVER_REF, 0x0f, 0x08);
 			queue_delayed_work(system_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
@@ -846,14 +850,14 @@ static int es8326_calibrate(struct snd_soc_component *component)
 	if ((es8326->version == ES8326_VERSION_B) && (es8326->calibrated == false)) {
 		dev_dbg(component->dev, "ES8326_VERSION_B, calibrating\n");
 		regmap_write(es8326->regmap, ES8326_CLK_INV, 0xc0);
-		regmap_write(es8326->regmap, ES8326_CLK_DIV1, 0x01);
+		regmap_write(es8326->regmap, ES8326_CLK_DIV1, 0x03);
 		regmap_write(es8326->regmap, ES8326_CLK_DLL, 0x30);
 		regmap_write(es8326->regmap, ES8326_CLK_MUX, 0xed);
 		regmap_write(es8326->regmap, ES8326_CLK_DAC_SEL, 0x08);
 		regmap_write(es8326->regmap, ES8326_CLK_TRI, 0xc1);
 		regmap_write(es8326->regmap, ES8326_DAC_MUTE, 0x03);
 		regmap_write(es8326->regmap, ES8326_ANA_VSEL, 0x7f);
-		regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x03);
+		regmap_write(es8326->regmap, ES8326_VMIDLOW, 0x23);
 		regmap_write(es8326->regmap, ES8326_DAC2HPMIX, 0x88);
 		usleep_range(15000, 20000);
 		regmap_write(es8326->regmap, ES8326_HP_OFFSET_CAL, 0x8c);
@@ -894,13 +898,13 @@ static int es8326_resume(struct snd_soc_component *component)
 	/* reset internal clock state */
 	regmap_write(es8326->regmap, ES8326_RESET, 0x1f);
 	regmap_write(es8326->regmap, ES8326_VMIDSEL, 0x0E);
+	regmap_write(es8326->regmap, ES8326_ANA_LP, 0xf0);
 	usleep_range(10000, 15000);
 	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER, 0xe9);
-	regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0x4b);
+	regmap_write(es8326->regmap, ES8326_ANA_MICBIAS, 0xcb);
 	/* set headphone default type and detect pin */
 	regmap_write(es8326->regmap, ES8326_HPDET_TYPE, 0x83);
 	regmap_write(es8326->regmap, ES8326_CLK_RESAMPLE, 0x05);
-	regmap_write(es8326->regmap, ES8326_HP_MISC, 0x30);
 
 	/* set internal oscillator as clock source of headpone cp */
 	regmap_write(es8326->regmap, ES8326_CLK_DIV_CPC, 0x89);
@@ -908,14 +912,15 @@ static int es8326_resume(struct snd_soc_component *component)
 	/* clock manager reset release */
 	regmap_write(es8326->regmap, ES8326_RESET, 0x17);
 	/* set headphone detection as half scan mode */
-	regmap_write(es8326->regmap, ES8326_HP_MISC, 0x30);
+	regmap_write(es8326->regmap, ES8326_HP_MISC, 0x3d);
 	regmap_write(es8326->regmap, ES8326_PULLUP_CTL, 0x00);
 
 	/* enable headphone driver */
+	regmap_write(es8326->regmap, ES8326_HP_VOL, 0xc4);
 	regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa7);
 	usleep_range(2000, 5000);
-	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xa3);
-	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0xb3);
+	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0x23);
+	regmap_write(es8326->regmap, ES8326_HP_DRIVER_REF, 0x33);
 	regmap_write(es8326->regmap, ES8326_HP_DRIVER, 0xa1);
 
 	regmap_write(es8326->regmap, ES8326_CLK_INV, 0x00);
@@ -946,7 +951,7 @@ static int es8326_resume(struct snd_soc_component *component)
 		    (ES8326_IO_DMIC_CLK << ES8326_SDINOUT1_SHIFT));
 	regmap_write(es8326->regmap, ES8326_SDINOUT23_IO, ES8326_IO_INPUT);
 
-	regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x3b);
+	regmap_write(es8326->regmap, ES8326_ANA_PDN, 0x00);
 	regmap_write(es8326->regmap, ES8326_RESET, ES8326_CSM_ON);
 	regmap_update_bits(es8326->regmap, ES8326_PGAGAIN, ES8326_MIC_SEL_MASK,
 			   ES8326_MIC1_SEL);
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index dfef808673f4..4234bbb900c4 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -101,7 +101,7 @@
 #define ES8326_MUTE (3 << 0)
 
 /* ES8326_CLK_CTL */
-#define ES8326_CLK_ON (0x7f << 0)
+#define ES8326_CLK_ON (0x7e << 0)
 #define ES8326_CLK_OFF (0 << 0)
 
 /* ES8326_CLK_INV */
-- 
2.17.1

