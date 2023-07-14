Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C3B752FEA
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 05:26:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 780BA9F6;
	Fri, 14 Jul 2023 05:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 780BA9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689305213;
	bh=//C8QBbqwlSo+88uWHFl8aGRTWRCQfaV95H9/D8vYpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sOmKT3UsGOPljkzZR7VzoG7/1zjRwpiA0QaSTOOJfWmJRJZNiT5oXSXpwVyrovx/D
	 PjgiAL638yoiWBokLqAbaxjVDKmUddm5vj3BjhjCPoVLqb6T/8W8eX2KN0qVRwxnqT
	 ttQoIvIP7W1BEIWXko2vXuTwMZiFrbtlbCMpR3To=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75677F800E4; Fri, 14 Jul 2023 05:26:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDC00F80236;
	Fri, 14 Jul 2023 05:26:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAF2CF8047D; Fri, 14 Jul 2023 05:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9D65F80153
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 05:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9D65F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Br5ZIlno
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-26304be177fso732886a91.1
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jul 2023 20:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689305104; x=1691897104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOZb/xhnDNhIGb+3d6RQflc3XdvWBmSZTU31RKUBBTs=;
        b=Br5ZIlnooZWtbVflPCDTZc7KPMW29YA0w49PKdu+gvImhAZdQqBMFOpjcLIaFk+H9o
         Cbm1dQUEgoIRXdzkuHJ8H2alJ4OlwYuaREyNKYviubQUsQ+h+Y2Xdu4L36a/EKPTSsAX
         Kaep/DSETdjQ+idD95591F8rc/UAI7fzLu7znwiuz99EMRRyfB2OiTAJgu/9q8Lu2AhN
         B8GqGrwsD5evoMFTF/az5skbJ2d/OKe0zc+FaAcHFSATK0kMsImcqjluF8oSak+Pl1f9
         X1YLDj9dgZ7WqNDN512bWwFjXQHFoJQypB49Ovf9UMasZX5pUhkvtv1WPpMDtJ4aIWtP
         UtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689305104; x=1691897104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOZb/xhnDNhIGb+3d6RQflc3XdvWBmSZTU31RKUBBTs=;
        b=ZanRqHcaBzIYQpFT1rORUOGbk/RVEQFeaAKOBiNAn+KiWnYUDOwxwBeINddN02cXCm
         L96mReRa0kghsYaAD7zihhnTudLcLCWOG/nlxxMj/3LoCH4Zej60XcJTLkLWeyFMB6RI
         NzwZeSKHbHXLPffq6ksgQ0qNhIpQ0SGiqxELArIhqvtXjAM3qZX77tTP03AWFMqI++5s
         r56fSCIWPYG0YhB1yXn3SJ7nOghAqLpXUQWzgL8XXcLyBKwBJppJB6vEuKaX882ZPbWT
         9Uo8H+DzZ6G+9vDNYMiLzcKKOxvjJpDC8w+PfcCbuqqaC0ti8dHZdKz2Z93yB1QOd2Iy
         XZIA==
X-Gm-Message-State: ABy/qLawehGu6Uj8lux87Uh5SJHTW8GcCC4qLkTZ/ExkAavease1MoL+
	PoJpSft8rc/Z9NUuELidRzbdf29SSiOTAHJy
X-Google-Smtp-Source: 
 APBJJlEhh6em1dz5ep8dpJXJ+xN3fv0vvaBe07ALydxAXh1oDtg6ETnBu7RcInnWmCCGc6VcpvNULg==
X-Received: by 2002:a17:90a:990e:b0:267:6586:f39a with SMTP id
 b14-20020a17090a990e00b002676586f39amr2452030pjp.47.1689305103733;
        Thu, 13 Jul 2023 20:25:03 -0700 (PDT)
Received: from a-VirtualBox.. ([116.233.75.15])
        by smtp.gmail.com with ESMTPSA id
 t3-20020a17090b018300b00262d6ac0140sm216016pjs.9.2023.07.13.20.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 20:25:03 -0700 (PDT)
From: Zhu Ning <zhuning0077@gmail.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: pierre-louis.bossart@linux.intel.com,
	tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	Zhu Ning <zhuning0077@gmail.com>
Subject: [PATCH v1 2/5] ASoC: codecs: ES8326: Change Hp_detect and volatile
 reg function
Date: Fri, 14 Jul 2023 11:24:50 +0800
Message-Id: <20230714032453.3334-2-zhuning0077@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714032453.3334-1-zhuning0077@gmail.com>
References: <20230714032453.3334-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FFWBBW5TIRRFIQJW6M5GJKITL3LIXPDW
X-Message-ID-Hash: FFWBBW5TIRRFIQJW6M5GJKITL3LIXPDW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FFWBBW5TIRRFIQJW6M5GJKITL3LIXPDW/>
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
 sound/soc/codecs/es8326.c | 29 +++++++++++++++++------------
 sound/soc/codecs/es8326.h | 12 ++++++++----
 2 files changed, 25 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 191579d9552c..8c78f0bf514b 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -158,20 +158,25 @@ static const struct snd_soc_dapm_route es8326_dapm_routes[] = {
 	{"HPOR", NULL, "RHPMIX"},
 };
 
-static const struct regmap_range es8326_volatile_ranges[] = {
-	regmap_reg_range(ES8326_HP_DETECT, ES8326_HP_DETECT),
-};
-
-static const struct regmap_access_table es8326_volatile_table = {
-	.yes_ranges = es8326_volatile_ranges,
-	.n_yes_ranges = ARRAY_SIZE(es8326_volatile_ranges),
-};
+static bool es8326_volatile_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case ES8326_HPL_OFFSET_INI:
+	case ES8326_HPR_OFFSET_INI:
+	case ES8326_HPDET_STA:
+	case ES8326_CTIA_OMTP_STA:
+	case ES8326_CSM_MUTE_STA:
+		return true;
+	default:
+		return false;
+	}
+}
 
 static const struct regmap_config es8326_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0xff,
-	.volatile_table = &es8326_volatile_table,
+	.volatile_reg = es8326_volatile_register,
 	.cache_type = REGCACHE_RBTREE,
 };
 
@@ -519,7 +524,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		return;
 
 	mutex_lock(&es8326->lock);
-	iface = snd_soc_component_read(comp, ES8326_HP_DETECT);
+	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
 		/* pause button detected */
@@ -578,7 +583,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	unsigned int iface;
 
 	mutex_lock(&es8326->lock);
-	iface = snd_soc_component_read(comp, ES8326_HP_DETECT);
+	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
 		/* Jack unplugged or spurious IRQ */
@@ -743,7 +748,7 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 
 	mutex_lock(&es8326->lock);
 	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HP_DET,
+		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
 					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
 	es8326->jack = jack;
 
diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
index 3f8f7da58062..6cb8e3ed76e3 100644
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
 
-- 
2.34.1

