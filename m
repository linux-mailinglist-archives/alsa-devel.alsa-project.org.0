Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D4755A20
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jul 2023 05:35:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91380AE8;
	Mon, 17 Jul 2023 05:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91380AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689564949;
	bh=QjDnB89hjRx55s7EDZuB9ho6HsYGvnAnuBjm0bhJJIQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EAb+pzEUsryvjEcVqeBT33B6cLxcbYVRfI9Xywi/0grXOstsDoPTrnFSEL26X8pTn
	 V8wQUFKuvSBIE7UdGwfCCJ2OUr00s8D+N+MMuO0rlzFnXT8LCYAvcQBFZ096Bmb0dJ
	 wXbTXk8zPe+U/z+ht5NWH9fjDuyZmsZeUZQQMzjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BACAF80494; Mon, 17 Jul 2023 05:34:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D490F8032D;
	Mon, 17 Jul 2023 05:34:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDA7DF80527; Mon, 17 Jul 2023 05:32:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 163EDF800D2
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 05:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 163EDF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=IaGBK371
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6b9b89627c3so1711407a34.1
        for <alsa-devel@alsa-project.org>;
 Sun, 16 Jul 2023 20:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689564749; x=1692156749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OSQ/EF4eTeZehLtAwdrrxfniB7LkpUpWRgcBFX06IoY=;
        b=IaGBK371AH+W28iGujdqp77Jk3e+29UkB3k1JOp5WVxrMN6WTt9jDC8EiaJJC0UT6x
         YR5yP+fgIBFiOJVOvPgwjmbPpcY49fYKymEAAUQKMZvl5JDMDMWxxUQcbEhhYe+wkLW7
         yTINTNsvKAgxhlAWPGr5S+eUFKZEnw8ZfQNL1JgjsOnntGRXqzqQaGCqRfiUXMi0Yag/
         RZbaQ6w84fiPntEd1bcBL4smJxndGlhxfU5aOkHLme0PVTv+qT6EPuPt595ERQe9Rv+7
         nGbQv3r8BE2qVwkbH6oqwCRJ4m/fMIx6L9MxrlFhRzVQm3+7m6ucTY60QNKQMrPMfEYu
         Akyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689564749; x=1692156749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSQ/EF4eTeZehLtAwdrrxfniB7LkpUpWRgcBFX06IoY=;
        b=VFfRM0jBFePZLB3V3KyHHsHhM1msEFR/c9RjunyZ+1z422Ads7PXhwkUwz1fCOgiLG
         GiLLT+YP8IUYe4lk2Y2tSFe3iUYEKSecWIHkJ8/O4mQNUhwAwk2MXtHeL3bPqc3VqyEs
         AjW1o48UI6v/6GDw+uNTRIlpVUfoDeWnSFgXJ0ntYKTGGhb9aPM+r8KJBOTeCXzEaGNO
         ZERdrOp0Hg6Mi3580sR7H/BTQrp25Eg7Y80a9gDhW5CS1bx2dXWNKei1H8+1cwWYLfBH
         YN9OGGBIDIw1pO+AJKthkwWJ5CwiRHyboYN4KWQN2OCYvuozNZa6xhMtRqH2GBriuUYH
         6HmQ==
X-Gm-Message-State: ABy/qLa+Bu6tZB47sUKoSZ89+fKiFCvoCJ8/w6LSTFmrlSik/osr444B
	XBT5w7kkby0mMQd8SKNkHLXZfTrMwdSoZExQ
X-Google-Smtp-Source: 
 APBJJlGg8JYNaTcEI4w4FmPP+UoihsWazxN4PnsVp22P5uh5MAU2lthLhzuKclMyf3+e/7VZG0/cZw==
X-Received: by 2002:a05:6830:148:b0:6b9:c869:862c with SMTP id
 j8-20020a056830014800b006b9c869862cmr3382128otp.1.1689564748854;
        Sun, 16 Jul 2023 20:32:28 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 a28-20020a63705c000000b00528513c6bbcsm11647509pgn.28.2023.07.16.20.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 20:32:28 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v2 1/5] ASoC: codecs: ES8326: Change Hp_detect register names
Date: Mon, 17 Jul 2023 11:32:19 +0800
Message-Id: <20230717033223.42506-1-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NH3DZORNQJTELWNPVS5S6JTRZXR37IBU
X-Message-ID-Hash: NH3DZORNQJTELWNPVS5S6JTRZXR37IBU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NH3DZORNQJTELWNPVS5S6JTRZXR37IBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The old register naming method is confusing. The reg 0x57 decides
the default headset hardware connection type, and the reg 0xfb is
the headset detection status register, which changes during headset
insertion. Change the name to ES8326_HPDET_TYPE and ES8326_HPDET_STA.

Signed-off-by: Zhu Ning <zhuning0077@gmail.com>
---
 sound/soc/codecs/es8326.c | 10 +++++-----
 sound/soc/codecs/es8326.h | 13 ++++++++-----
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 4399ba36aee2..e953c0157ba0 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -159,7 +159,7 @@ static const struct snd_soc_dapm_route es8326_dapm_routes[] = {
 };
 
 static const struct regmap_range es8326_volatile_ranges[] = {
-	regmap_reg_range(ES8326_HP_DETECT, ES8326_HP_DETECT),
+	regmap_reg_range(ES8326_HPDET_STA, ES8326_HPDET_STA),
 };
 
 static const struct regmap_access_table es8326_volatile_table = {
@@ -519,7 +519,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		return;
 
 	mutex_lock(&es8326->lock);
-	iface = snd_soc_component_read(comp, ES8326_HP_DETECT);
+	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
 		/* pause button detected */
@@ -578,7 +578,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	unsigned int iface;
 
 	mutex_lock(&es8326->lock);
-	iface = snd_soc_component_read(comp, ES8326_HP_DETECT);
+	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
 		/* Jack unplugged or spurious IRQ */
@@ -651,7 +651,7 @@ static int es8326_resume(struct snd_soc_component *component)
 	regmap_write(es8326->regmap, ES8326_ADC1_SRC, es8326->mic1_src);
 	regmap_write(es8326->regmap, ES8326_ADC2_SRC, es8326->mic2_src);
 	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER, 0x88);
-	regmap_write(es8326->regmap, ES8326_HP_DET,
+	regmap_write(es8326->regmap, ES8326_HPDET_TYPE,
 		     ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol);
 	regmap_write(es8326->regmap, ES8326_INT_SOURCE, es8326->interrupt_src);
 	regmap_write(es8326->regmap, ES8326_INTOUT_IO, es8326->interrupt_clk);
@@ -743,7 +743,7 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 
 	mutex_lock(&es8326->lock);
 	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HP_DET,
+		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
 					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
 	es8326->jack = jack;
 
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index 3f8f7da58062..cd04d11a88d9 100644
--- a/sound/soc/codecs/es8326.h
+++ b/sound/soc/codecs/es8326.h
@@ -73,15 +73,19 @@
 #define ES8326_DRC_RECOVERY	0x53
 #define ES8326_DRC_WINSIZE	0x54
 #define ES8326_HPJACK_TIMER	0x56
-#define ES8326_HP_DET		0x57
+#define ES8326_HPDET_TYPE	0x57
 #define ES8326_INT_SOURCE	0x58
 #define ES8326_INTOUT_IO	0x59
 #define ES8326_SDINOUT1_IO	0x5A
 #define ES8326_SDINOUT23_IO	0x5B
 #define ES8326_JACK_PULSE	0x5C
 
+#define ES8326_HP_MISC		0xF7
+#define ES8326_CTIA_OMTP_STA	0xF8
 #define ES8326_PULLUP_CTL	0xF9
-#define ES8326_HP_DETECT	0xFB
+#define ES8326_CSM_I2C_STA	0xFA
+#define ES8326_HPDET_STA	0xFB
+#define ES8326_CSM_MUTE_STA	0xFC
 #define ES8326_CHIP_ID1		0xFD
 #define ES8326_CHIP_ID2		0xFE
 #define ES8326_CHIP_VERSION	0xFF
@@ -146,7 +150,7 @@
 #define ES8326_ADC3_SHIFT 0
 #define ES8326_ADC4_SHIFT 3
 
-/* ES8326_HP_DET */
+/* ES8326_HPDET_TYPE */
 #define ES8326_HP_DET_SRC_PIN27 (1 << 5)
 #define ES8326_HP_DET_SRC_PIN9 (1 << 4)
 #define ES8326_HP_DET_JACK_POL (1 << 3)
@@ -174,7 +178,7 @@
 #define ES8326_SDINOUT2_SHIFT 4
 #define ES8326_SDINOUT3_SHIFT 0
 
-/* ES8326_HP_DETECT */
+/* ES8326_HPDET_STA */
 #define ES8326_HPINSERT_FLAG (1 << 1)
 #define ES8326_HPBUTTON_FLAG (1 << 0)
 
@@ -182,4 +186,3 @@
 #define ES8326_VERSION_B (1 << 0)
 
 #endif
-
-- 
2.34.1

