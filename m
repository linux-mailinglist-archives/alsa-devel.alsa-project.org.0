Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64147704979
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:39:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A122E1E3;
	Tue, 16 May 2023 11:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A122E1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684229962;
	bh=y9Zvpv+r5INf8aHvJfs52xjAw6Rp4osofBWkuMDkqRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SZfwFn5vflO0qEwGz8lOcmDrx8jrt96g0itjnQTf3jBwLend8OEcu7m/kX7nmRKk/
	 7B537kbs6ZZmVxSd5EUDZ/wYTTeVD5dhcKkvdlunATOdl4d50F64N/Kl7JYZHNns7I
	 im2DoJ68VnGGL7GO7OEdHM4iFoKEfVN2iXO232GM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E6ACF805C6; Tue, 16 May 2023 11:36:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61517F805C5;
	Tue, 16 May 2023 11:36:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC961F805B0; Tue, 16 May 2023 11:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 242EDF80549
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 242EDF80549
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 1563324291;
	Tue, 16 May 2023 05:36:13 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q0r-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 01/10] ALSA: emu10k1: make some initializer arrays less
 wasteful
Date: Tue, 16 May 2023 11:36:03 +0200
Message-Id: <20230516093612.3536508-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536508-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZZDWEYHBHDLF77XQPVGRMSIMWWA7SGZH
X-Message-ID-Hash: ZZDWEYHBHDLF77XQPVGRMSIMWWA7SGZH
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZZDWEYHBHDLF77XQPVGRMSIMWWA7SGZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- Use bit fields in struct snd_emu_chip_details
- Use shorts in the E-MU routing register arrays

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h      | 36 ++++++++++++++++++------------------
 sound/pci/emu10k1/emumixer.c | 10 +++++-----
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 7bcb1a2d779a..990ea66a828a 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1601,24 +1601,24 @@ struct snd_emu_chip_details {
 	u32 device;
 	u32 subsystem;
 	unsigned char revision;
-	unsigned char emu10k1_chip; /* Original SB Live. Not SB Live 24bit. */
-				    /* Redundant with emu10k2_chip being unset. */
-	unsigned char emu10k2_chip; /* Audigy 1 or Audigy 2. */
-	unsigned char ca0102_chip;  /* Audigy 1 or Audigy 2. Not SB Audigy 2 Value. */
-				    /* Redundant with ca0108_chip being unset. */
-	unsigned char ca0108_chip;  /* Audigy 2 Value */
-	unsigned char ca_cardbus_chip; /* Audigy 2 ZS Notebook */
-	unsigned char ca0151_chip;  /* P16V */
-	unsigned char spk71;        /* Has 7.1 speakers */
-	unsigned char sblive51;	    /* SBLive! 5.1 - extout 0x11 -> center, 0x12 -> lfe */
-	unsigned char spdif_bug;    /* Has Spdif phasing bug */
-	unsigned char ac97_chip;    /* Has an AC97 chip: 1 = mandatory, 2 = optional */
-	unsigned char ecard;        /* APS EEPROM */
-	unsigned char emu_model;     /* EMU model type */
-	unsigned char spi_dac;      /* SPI interface for DAC; requires ca0108_chip */
-	unsigned char i2c_adc;      /* I2C interface for ADC; requires ca0108_chip */
-	unsigned char adc_1361t;    /* Use Philips 1361T ADC */
-	unsigned char invert_shared_spdif; /* analog/digital switch inverted */
+	unsigned char emu_model;	/* EMU model type */
+	unsigned int emu10k1_chip:1;	/* Original SB Live. Not SB Live 24bit. */
+					/* Redundant with emu10k2_chip being unset. */
+	unsigned int emu10k2_chip:1;	/* Audigy 1 or Audigy 2. */
+	unsigned int ca0102_chip:1;	/* Audigy 1 or Audigy 2. Not SB Audigy 2 Value. */
+					/* Redundant with ca0108_chip being unset. */
+	unsigned int ca0108_chip:1;	/* Audigy 2 Value */
+	unsigned int ca_cardbus_chip:1;	/* Audigy 2 ZS Notebook */
+	unsigned int ca0151_chip:1;	/* P16V */
+	unsigned int spk71:1;		/* Has 7.1 speakers */
+	unsigned int sblive51:1;	/* SBLive! 5.1 - extout 0x11 -> center, 0x12 -> lfe */
+	unsigned int spdif_bug:1;	/* Has Spdif phasing bug */
+	unsigned int ac97_chip:2;	/* Has an AC97 chip: 1 = mandatory, 2 = optional */
+	unsigned int ecard:1;		/* APS EEPROM */
+	unsigned int spi_dac:1;		/* SPI interface for DAC; requires ca0108_chip */
+	unsigned int i2c_adc:1;		/* I2C interface for ADC; requires ca0108_chip */
+	unsigned int adc_1361t:1;	/* Use Philips 1361T ADC */
+	unsigned int invert_shared_spdif:1;  /* analog/digital switch inverted */
 	const char *driver;
 	const char *name;
 	const char *id;		/* for backward compatibility - can be NULL if not needed */
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 9fa4bc845116..92bada196f54 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -180,7 +180,7 @@ static const char * const emu1616_src_texts[] = {
 /*
  * List of data sources available for each destination
  */
-static const unsigned int emu1010_src_regs[] = {
+static const unsigned short emu1010_src_regs[] = {
 	EMU_SRC_SILENCE,/* 0 */
 	EMU_SRC_DOCK_MIC_A1, /* 1 */
 	EMU_SRC_DOCK_MIC_B1, /* 2 */
@@ -237,7 +237,7 @@ static const unsigned int emu1010_src_regs[] = {
 };
 
 /* 1616(m) cardbus */
-static const unsigned int emu1616_src_regs[] = {
+static const unsigned short emu1616_src_regs[] = {
 	EMU_SRC_SILENCE,
 	EMU_SRC_DOCK_MIC_A1,
 	EMU_SRC_DOCK_MIC_B1,
@@ -293,7 +293,7 @@ static const unsigned int emu1616_src_regs[] = {
  * Data destinations - physical EMU outputs.
  * Each destination has an enum mixer control to choose a data source
  */
-static const unsigned int emu1010_output_dst[] = {
+static const unsigned short emu1010_output_dst[] = {
 	EMU_DST_DOCK_DAC1_LEFT1, /* 0 */
 	EMU_DST_DOCK_DAC1_RIGHT1, /* 1 */
 	EMU_DST_DOCK_DAC2_LEFT1, /* 2 */
@@ -321,7 +321,7 @@ static const unsigned int emu1010_output_dst[] = {
 };
 
 /* 1616(m) cardbus */
-static const unsigned int emu1616_output_dst[] = {
+static const unsigned short emu1616_output_dst[] = {
 	EMU_DST_DOCK_DAC1_LEFT1,
 	EMU_DST_DOCK_DAC1_RIGHT1,
 	EMU_DST_DOCK_DAC2_LEFT1,
@@ -347,7 +347,7 @@ static const unsigned int emu1616_output_dst[] = {
  *   capture (EMU32 + I2S links)
  * Each destination has an enum mixer control to choose a data source
  */
-static const unsigned int emu1010_input_dst[] = {
+static const unsigned short emu1010_input_dst[] = {
 	EMU_DST_ALICE2_EMU32_0,
 	EMU_DST_ALICE2_EMU32_1,
 	EMU_DST_ALICE2_EMU32_2,
-- 
2.40.0.152.g15d061e6df

