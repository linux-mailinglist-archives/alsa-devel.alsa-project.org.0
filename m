Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BB587DCBB
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 10:05:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 306A72BAC;
	Sun, 17 Mar 2024 10:05:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 306A72BAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710666335;
	bh=4wRJFN6IXBfIiauJKNPViO/VAlzpwd79IT7rJ8dvJv0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Eojw+aFEfgappXWo1eiWZcp+6cpQe1Cl5dXL6YjcX/sFeAHvzOQwuYptrvWh8HZbL
	 gddN86401V37xLbgq7X7YDf8cXwXBKWUhBQqcNyhzZ6RIdMV/W0qd80vqM5fDWKuJd
	 YWBX+/kHnIcrK3WS2hDpUEEtFm0nRy77id9DrInA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FAE0F806EC; Sun, 17 Mar 2024 10:03:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CD06F806E8;
	Sun, 17 Mar 2024 10:03:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31539F8028D; Sat, 16 Mar 2024 10:43:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EE8EF80088
	for <alsa-devel@alsa-project.org>; Sat, 16 Mar 2024 10:43:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EE8EF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DjC1GwtU
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d2509c66daso38505541fa.3
        for <alsa-devel@alsa-project.org>;
 Sat, 16 Mar 2024 02:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710582207; x=1711187007;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXpQc7xpGdduCJ7w/YzFGyfHXDRiwkRakFMzzDur64Q=;
        b=DjC1GwtU5V3LPV41wiioovqzflAwk/7adejDFxNKYGlmvX45QS1YdkLXerrgJ00BLz
         dsEDcbxPRsRxmFtlsHcFkzlHnT9wj//8ab0spvwiWj3X//Rg4UoMC/nfq1129zTQDOnY
         /8sZKkcklgRX57lqB6E3cRDnnQdJ23bk+u7W//DQU6ro1rW0kUwuLaMNRXNLwh0WqWoQ
         PFFZJN6CYSmqdxFlycEGHQQjyTNkHn3sl9hMmj+Fsj5fL9ATz+/iMVCF+uPFynpkoAIv
         sHd5jLmhZHbIunLZPefBcBCHhdxAmZuIYzP+X7TIJ0OODNByBlJMhUMu7ig0vvJYHRoA
         A4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710582207; x=1711187007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXpQc7xpGdduCJ7w/YzFGyfHXDRiwkRakFMzzDur64Q=;
        b=Fyq+ldz9FRDv7xIDTpM0BCzgivT9A3i/B+U9+g0e71jDVLlvlb8ert71yGYAI2n81W
         yUQaUcTLtgt7FFh3GdS4Mp9LHvFgfyzddH0bDv4BPJGPvQZITxsLDzuPmmReZgwysT09
         gsZNwLJPaikZazuVMetMH0dll+9Q3jxfmQs3N5/TbzLqCbgQfrtDYSP4Ty9FEHd2MCrY
         XUjatLqRa42Rw3q1yCjjc/4uT0qvQgxwzTFMH2dH8Aa7bbWQ/yz01Xi8rDySytQJqvwU
         yI2SDiFfDvdH0npIri7TflW0Bhr04ERE2wHhepZxPQWXpABsTjHILMQd9UKDsV8QLETE
         huJw==
X-Gm-Message-State: AOJu0YyzCVJI+Nvm0CMeLIcoH3Pdo+hwdUHBM7XNoMdhz3Pr8KHkYcWU
	9JePQ6OcCgDmJk4peeJE0NcwnXdTYsQXTcRsMVF5iWRxt/jbXO0W
X-Google-Smtp-Source: 
 AGHT+IGmyz/fcATvO+Tv2wCPoiXnHeamAhSlCJnPcXEq1U9ZXUP7l48mVQVvnhmTmMaFDRW7GdnKeQ==
X-Received: by 2002:ac2:4acd:0:b0:513:cf5a:f872 with SMTP id
 m13-20020ac24acd000000b00513cf5af872mr4321013lfp.69.1710582206718;
        Sat, 16 Mar 2024 02:43:26 -0700 (PDT)
Received: from localhost.localdomain
 (51-171-224-185-dynamic.agg7.kby.lmk-mlw.eircom.net. [51.171.224.185])
        by smtp.googlemail.com with ESMTPSA id
 l21-20020a056000023500b0033ec312cd8asm5068843wrz.33.2024.03.16.02.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 02:43:26 -0700 (PDT)
From: Ian Murphy <iano200@gmail.com>
To: tiwai@suse.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Ian Murphy <iano200@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: add in quirk for Acer Swift Go 16 -
 SFG16-71
Date: Sat, 16 Mar 2024 09:41:57 +0000
Message-ID: <20240316094157.13890-1-iano200@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: iano200@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BTMRYBMPAYNXXZD5SHMFYKSQ27U3UCZT
X-Message-ID-Hash: BTMRYBMPAYNXXZD5SHMFYKSQ27U3UCZT
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:56:46 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Keyboard has an LED that is ON/OFF when mic is muted/active
 - LED is controlled by GPIO pin
 - Patch enables led to appear in /sys/class/leds/ as hda::micmute
 - Enables LED when mic is MUTED
 - Disables LED when mic is active

Signed-off-by: Ian Murphy <iano200@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a91d5ec29bfb..05c685485606 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6891,6 +6891,13 @@ static void yoga7_14arb7_fixup_i2c(struct hda_codec *cdc,
 	comp_generic_fixup(cdc, action, "i2c", "INT8866", "-%s:00", 1);
 }
 
+static void alc256_fixup_acer_sfg16_micmute_led(struct hda_codec *codec,
+			       const struct hda_fixup *fix, int action)
+{
+       alc_fixup_hp_gpio_led(codec, action, 0, 0x04);
+}
+
+
 /* for alc295_fixup_hp_top_speakers */
 #include "hp_x360_helper.c"
 
@@ -7374,6 +7381,7 @@ enum {
 	ALC289_FIXUP_DELL_CS35L41_SPI_2,
 	ALC294_FIXUP_CS35L41_I2C_2,
 	ALC245_FIXUP_CS35L56_SPI_4_HP_GPIO_LED,
+	ALC256_FIXUP_ACER_SFG16_MICMUTE_LED,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9569,6 +9577,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_GPIO_LED,
 	},
+	[ALC256_FIXUP_ACER_SFG16_MICMUTE_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc256_fixup_acer_sfg16_micmute_led,
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -9612,6 +9624,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1430, "Acer TravelMate B311R-31", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1025, 0x1466, "Acer Aspire A515-56", ALC255_FIXUP_ACER_HEADPHONE_AND_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1534, "Acer Predator PH315-54", ALC255_FIXUP_ACER_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0x1025, 0x169a, "Acer Swift SFG16", ALC256_FIXUP_ACER_SFG16_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1028, 0x0470, "Dell M101z", ALC269_FIXUP_DELL_M101Z),
 	SND_PCI_QUIRK(0x1028, 0x053c, "Dell Latitude E5430", ALC292_FIXUP_DELL_E7X),
 	SND_PCI_QUIRK(0x1028, 0x054b, "Dell XPS one 2710", ALC275_FIXUP_DELL_XPS),
-- 
2.44.0

