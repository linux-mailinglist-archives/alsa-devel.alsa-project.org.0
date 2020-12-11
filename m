Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8E2D826E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 23:57:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B02511672;
	Fri, 11 Dec 2020 23:56:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B02511672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607727420;
	bh=2zsOMd+vuSfYxTDR/YoGlvAmwfLMsyJJuKA/tSwPzqY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sYb5sYOHsY1QG9+j6Ob+ome/JbPP2WUOsWUpqUGkjAprfM9ISLpXZM5nUxDmDljUX
	 FbvESTCsBfcpjdXMnE+D69wHfan0V2J+GrstmJeP2RgKXr9mVt89T++m5hn7t3E1VA
	 boAPOWzHdy707sDHz/UrlO8V7s/GeeafymaEvbLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10223F80217;
	Fri, 11 Dec 2020 23:55:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 565D5F80217; Fri, 11 Dec 2020 23:55:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80E9EF8011F
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 23:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E9EF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="epnhOlCp"
Received: by mail-qk1-x742.google.com with SMTP id z11so10129527qkj.7
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 14:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dRHr/uDawSIVOsWFHrSFkeCjCrKvMAqRmkxX5HLJ6pA=;
 b=epnhOlCpUO40W9BG7w+rZSg+AU5U1lGqALVjfpJEPPQ0MsjW4ffyDec33UZNsilcWt
 2yNhZz8mxTW6nTMEXYIFMOtnPlaobDgT+Q5ZrmhiFKdleYaoYSSmzIbGK0bz3B+KOs7p
 Oa96Co1IVeqz4SmmyBJFLubcNXfW5tTFQ4i1pY90CDsQQKQ93dmTyObpSyNxNCQiOmf+
 LHmyUhGxDMudScs77QQoftYWk3kzylaK/KRDBDRMn7fDlQHQ/WXwI5MgMYmbvkppQxUD
 pOni+WrodpNCVILZeCCB6o83lq9En9vPDHan8nP4J6rwj4val8fbU0n4tCEdz5+0ovhQ
 xGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dRHr/uDawSIVOsWFHrSFkeCjCrKvMAqRmkxX5HLJ6pA=;
 b=Mfmtl6jdvv7zPZXS2A8A4WVHcshwCON6wDrfpCS+PFxhD0Mzu9tuKi7wWAKnmafAnE
 /SbOW1AZduyb/lAPfgA+nx69sIn4tLi4G63VgEn9S5SNL2IOU2CJE4FdoqZ0tA9Wh3Z4
 VAF/KFZY5UIM84qgMaQ+KlaHfx5YGOeMQj7FGkwmmLVyJpQ8LAHlYHyAerKoDpiWgM1q
 9aZoKO3yY/ZYhzX8YiojJNeVw/OjINCxi6hwQtYBE0aEwh1hmKlebWMXzylFa3aGDHnk
 /sfWwxlDA0WHkL816Tyd6XaEnq2Ft87c+ghCf28KrANquioRQ7qXTSnR3oMdaANKbE8u
 32Dw==
X-Gm-Message-State: AOAM532EBuMSvPmKnOhSR7Knm/2gQynrR7XniAcDOhb3zilVWZCm8gAd
 +KUL3SOSA62E7qYd55lqEPo=
X-Google-Smtp-Source: ABdhPJwiweyqLPsItY+4everWoJtpf1jkZeRMN0vKOmoFwwE44OHmed0+BGfVuCWrhdzflXaXAt3qw==
X-Received: by 2002:a37:90c4:: with SMTP id s187mr19012010qkd.6.1607727317375; 
 Fri, 11 Dec 2020 14:55:17 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id i4sm7409594qti.78.2020.12.11.14.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 14:55:16 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 1/2] ALSA: hda/ca0132 - Add 8051 PLL write helper functions.
Date: Fri, 11 Dec 2020 17:55:02 -0500
Message-Id: <20201211225504.4508-1-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

Add helper functions for the 8051 PLL PMU write verbs.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 130 ++++++++++++++---------------------
 1 file changed, 50 insertions(+), 80 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index e9019e840a4d..9b6b7601a881 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1949,6 +1949,14 @@ static unsigned int chipio_8051_get_data(struct hda_codec *codec)
 				   VENDOR_CHIPIO_8051_DATA_READ, 0);
 }
 
+/* PLL_PMU writes share the lower address register of the 8051 exram writes. */
+static void chipio_8051_set_data_pll(struct hda_codec *codec, unsigned int data)
+{
+	/* 8-bits of data. */
+	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
+			    VENDOR_CHIPIO_PLL_PMU_WRITE, data & 0xff);
+}
+
 static void chipio_8051_write_exram(struct hda_codec *codec,
 		unsigned int addr, unsigned int data)
 {
@@ -1977,6 +1985,26 @@ static void chipio_8051_read_exram(struct hda_codec *codec,
 	*data = chipio_8051_get_data(codec);
 }
 
+static void chipio_8051_write_pll_pmu(struct hda_codec *codec,
+		unsigned int addr, unsigned int data)
+{
+	struct ca0132_spec *spec = codec->spec;
+
+	mutex_lock(&spec->chipio_mutex);
+
+	chipio_8051_set_address(codec, addr & 0xff);
+	chipio_8051_set_data_pll(codec, data);
+
+	mutex_unlock(&spec->chipio_mutex);
+}
+
+static void chipio_8051_write_pll_pmu_no_mutex(struct hda_codec *codec,
+		unsigned int addr, unsigned int data)
+{
+	chipio_8051_set_address(codec, addr & 0xff);
+	chipio_8051_set_data_pll(codec, data);
+}
+
 /*
  * Enable clocks.
  */
@@ -1985,18 +2013,11 @@ static void chipio_enable_clocks(struct hda_codec *codec)
 	struct ca0132_spec *spec = codec->spec;
 
 	mutex_lock(&spec->chipio_mutex);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xff);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 5);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0x0b);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 6);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xff);
+
+	chipio_8051_write_pll_pmu_no_mutex(codec, 0x00, 0xff);
+	chipio_8051_write_pll_pmu_no_mutex(codec, 0x05, 0x0b);
+	chipio_8051_write_pll_pmu_no_mutex(codec, 0x06, 0xff);
+
 	mutex_unlock(&spec->chipio_mutex);
 }
 
@@ -7904,10 +7925,7 @@ static void ae5_post_dsp_register_set(struct hda_codec *codec)
 	struct ca0132_spec *spec = codec->spec;
 
 	chipio_8051_write_direct(codec, 0x93, 0x10);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x44);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xc2);
+	chipio_8051_write_pll_pmu(codec, 0x44, 0xc2);
 
 	writeb(0xff, spec->mem_base + 0x304);
 	writeb(0xff, spec->mem_base + 0x304);
@@ -7949,30 +7967,11 @@ static void ae5_post_dsp_param_setup(struct hda_codec *codec)
 
 static void ae5_post_dsp_pll_setup(struct hda_codec *codec)
 {
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x41);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xc8);
-
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x45);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xcc);
-
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x40);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xcb);
-
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x43);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xc7);
-
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x51);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0x8d);
+	chipio_8051_write_pll_pmu(codec, 0x41, 0xc8);
+	chipio_8051_write_pll_pmu(codec, 0x45, 0xcc);
+	chipio_8051_write_pll_pmu(codec, 0x40, 0xcb);
+	chipio_8051_write_pll_pmu(codec, 0x43, 0xc7);
+	chipio_8051_write_pll_pmu(codec, 0x51, 0x8d);
 }
 
 static void ae5_post_dsp_stream_setup(struct hda_codec *codec)
@@ -7994,10 +7993,7 @@ static void ae5_post_dsp_stream_setup(struct hda_codec *codec)
 
 	chipio_set_control_param_no_mutex(codec, CONTROL_PARAM_ASI, 4);
 
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x43);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xc7);
+	chipio_8051_write_pll_pmu_no_mutex(codec, 0x43, 0xc7);
 
 	ca0113_mmio_command_set(codec, 0x48, 0x01, 0x80);
 
@@ -8090,12 +8086,8 @@ static void ae7_post_dsp_pll_setup(struct hda_codec *codec)
 	};
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(addr); i++) {
-		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-				    VENDOR_CHIPIO_8051_ADDRESS_LOW, addr[i]);
-		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-				    VENDOR_CHIPIO_PLL_PMU_WRITE, data[i]);
-	}
+	for (i = 0; i < ARRAY_SIZE(addr); i++)
+		chipio_8051_write_pll_pmu_no_mutex(codec, addr[i], data[i]);
 }
 
 static void ae7_post_dsp_asi_setup_ports(struct hda_codec *codec)
@@ -8111,10 +8103,7 @@ static void ae7_post_dsp_asi_setup_ports(struct hda_codec *codec)
 
 	mutex_lock(&spec->chipio_mutex);
 
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x43);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xc7);
+	chipio_8051_write_pll_pmu_no_mutex(codec, 0x43, 0xc7);
 
 	chipio_write_no_mutex(codec, 0x189000, 0x0001f101);
 	chipio_write_no_mutex(codec, 0x189004, 0x0001f101);
@@ -8187,10 +8176,7 @@ static void ae7_post_dsp_asi_setup(struct hda_codec *codec)
 {
 	chipio_8051_write_direct(codec, 0x93, 0x10);
 
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x44);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xc2);
+	chipio_8051_write_pll_pmu(codec, 0x44, 0xc2);
 
 	ca0113_mmio_command_set_type2(codec, 0x48, 0x07, 0x83);
 	ca0113_mmio_command_set(codec, 0x30, 0x2e, 0x3f);
@@ -8207,10 +8193,7 @@ static void ae7_post_dsp_asi_setup(struct hda_codec *codec)
 	ae7_post_dsp_pll_setup(codec);
 	ae7_post_dsp_asi_stream_setup(codec);
 
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x43);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xc7);
+	chipio_8051_write_pll_pmu(codec, 0x43, 0xc7);
 
 	ae7_post_dsp_asi_setup_ports(codec);
 }
@@ -9367,18 +9350,11 @@ static void ae5_register_set(struct hda_codec *codec)
 	unsigned int i, cur_addr;
 	unsigned char tmp[3];
 
-	if (ca0132_quirk(spec) == QUIRK_AE7) {
-		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-				    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x41);
-		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-				    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xc8);
-	}
+	if (ca0132_quirk(spec) == QUIRK_AE7)
+		chipio_8051_write_pll_pmu(codec, 0x41, 0xc8);
 
 	chipio_8051_write_direct(codec, 0x93, 0x10);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x44);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_PLL_PMU_WRITE, 0xc2);
+	chipio_8051_write_pll_pmu(codec, 0x44, 0xc2);
 
 	if (ca0132_quirk(spec) == QUIRK_AE7) {
 		tmp[0] = 0x03;
@@ -9454,10 +9430,7 @@ static void ca0132_alt_init(struct hda_codec *codec)
 		break;
 	case QUIRK_AE5:
 		ca0132_gpio_init(codec);
-		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-				VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x49);
-		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-				VENDOR_CHIPIO_PLL_PMU_WRITE, 0x88);
+		chipio_8051_write_pll_pmu(codec, 0x49, 0x88);
 		chipio_write(codec, 0x18b030, 0x00000020);
 		snd_hda_sequence_write(codec, spec->chip_init_verbs);
 		snd_hda_sequence_write(codec, spec->desktop_init_verbs);
@@ -9465,10 +9438,7 @@ static void ca0132_alt_init(struct hda_codec *codec)
 		break;
 	case QUIRK_AE7:
 		ca0132_gpio_init(codec);
-		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-				VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x49);
-		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-				VENDOR_CHIPIO_PLL_PMU_WRITE, 0x88);
+		chipio_8051_write_pll_pmu(codec, 0x49, 0x88);
 		snd_hda_sequence_write(codec, spec->chip_init_verbs);
 		snd_hda_sequence_write(codec, spec->desktop_init_verbs);
 		chipio_write(codec, 0x18b008, 0x000000f8);
-- 
2.25.1

