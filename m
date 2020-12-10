Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2842D613D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 17:10:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD3C5169F;
	Thu, 10 Dec 2020 17:09:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD3C5169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607616608;
	bh=nHHD7GnNYYmTGyYRxsi+2VRnBE8cWh6prAdLIRAJlG4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PgJdqNulpQJGY/OHDiu9CVfgmjubX1wM8lLv2xsfchrkJVSWvKK5pPlltlpJeDzeS
	 5haxzxPJh/JjePGNtKeC33LCbK79XO9JHp+ynDA2JGqpkVlfyd7AHi0oLHj1C0ZVx5
	 0xEgIILgm7gdlKKkuYI5hu26QzUahdlfvMUPlRkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CB47F804D6;
	Thu, 10 Dec 2020 17:07:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A04CF804CC; Thu, 10 Dec 2020 17:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F134EF80255
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 17:07:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F134EF80255
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IxVDdTJO"
Received: by mail-qt1-x844.google.com with SMTP id f14so3993370qto.12
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 08:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LNFp0e1oxBHLLAbT98jciqioJbJK5/HPHacwl39pCE4=;
 b=IxVDdTJOW62Ph/K7eG/YCffUU8ua98VD/E4CYuBqyyVt7m3Voea7EXFrTgosgE/9z4
 /JQLQjl6ZY3G8yXIPrxlg1CgHcptQYV52P84VVy1rdohFoDD3ZSLR9MpHbYrzYQYAikP
 QZYxj0aqMaWGVbQFhXydxf9J5+wzqOgG/MtEvrotEwYvUj4LSoJ7scMf4wjrmpGaogew
 2KMGA1jzgE3Vl4f1MowYPriISWa6iYNB/Ef/UDKvu66dvNgRD2DPa+z6gHpLWQnaTK6K
 FSp+hub37+dJNSNlBKOj+XtS8j0cnq90BypmsLF7F9wbkUNs7cPlxQqBt5hwwSEHnNp2
 cB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LNFp0e1oxBHLLAbT98jciqioJbJK5/HPHacwl39pCE4=;
 b=bSC4urYKFUVaXnyQ/lj4gfiAjHPKv4cbmi7GvRwdlTxJSzXMJwLu3N+A7OcmJRECbp
 K1RepZ/MrZBvciarzmAKqAihEDXrB5qPTDvjn9TGvoY30lRy1bq7LbFsSYP/SWAZ9Kdp
 oNJT1D7RmIeXLDd9q4Qh56WE+oymnuMqlpNbP9vfAX1rYhAQMjQpS7HsBCWiL4KBy1Cs
 5uQXQNti3NfjVba8NCFTj5bSkbN9A0L3pQ9Cl6NTUgMXx0ceOwhdQdk3qbqt7PQEL30p
 j+MnBkBrnvSb0rKyqP6aixQeSo+wDsOXOcxjIhHPwiCHaHKVSRRmNTAU+/dVG02iFQz+
 BjCA==
X-Gm-Message-State: AOAM533vbtsOK34QNyEZRZUus+bGzi0VEVivrB/Z+HL3nkZi7tW9fDqs
 CVfZ8phNWkdYo4jwwTN63Nk=
X-Google-Smtp-Source: ABdhPJw+IGq515hstY9rhetdhZePZmALzlL0Q61eB2u/VgWWVO75b1vkxRAlVIEb95nZKaa7z7rD6Q==
X-Received: by 2002:a05:622a:109:: with SMTP id
 u9mr9773412qtw.213.1607616449508; 
 Thu, 10 Dec 2020 08:07:29 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 d190sm3852290qkf.112.2020.12.10.08.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 08:07:29 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 3/5] ALSA: hda/ca0132 - Add 8051 exram helper functions.
Date: Thu, 10 Dec 2020 11:06:55 -0500
Message-Id: <20201210160658.461739-4-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210160658.461739-1-conmanx360@gmail.com>
References: <20201210160658.461739-1-conmanx360@gmail.com>
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

Add functions for both reading and writing to the 8051's exram. Also,
add a little bit of documentation on how the addresses are segmented.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 137 ++++++++++++++++++++---------------
 1 file changed, 79 insertions(+), 58 deletions(-)

v2 changes:
-Remove conditional mutex.

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 8d2f12f2ce3f..f84815cc8d2f 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1901,6 +1901,70 @@ static void chipio_8051_write_direct(struct hda_codec *codec,
 	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0, verb, addr);
 }
 
+/*
+ * Writes to the 8051's exram, which has 16-bits of address space.
+ * Data at addresses 0x2000-0x7fff is mirrored to 0x8000-0xdfff.
+ * Data at 0x8000-0xdfff can also be used as program memory for the 8051 by
+ * setting the pmem bank selection SFR.
+ * 0xe000-0xffff is always mapped as program memory, with only 0xf000-0xffff
+ * being writable.
+ */
+static void chipio_8051_set_address(struct hda_codec *codec, unsigned int addr)
+{
+	unsigned int tmp;
+
+	/* Lower 8-bits. */
+	tmp = addr & 0xff;
+	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
+			    VENDOR_CHIPIO_8051_ADDRESS_LOW, tmp);
+
+	/* Upper 8-bits. */
+	tmp = (addr >> 8) & 0xff;
+	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
+			    VENDOR_CHIPIO_8051_ADDRESS_HIGH, tmp);
+}
+
+static void chipio_8051_set_data(struct hda_codec *codec, unsigned int data)
+{
+	/* 8-bits of data. */
+	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
+			    VENDOR_CHIPIO_8051_DATA_WRITE, data & 0xff);
+}
+
+static unsigned int chipio_8051_get_data(struct hda_codec *codec)
+{
+	return snd_hda_codec_read(codec, WIDGET_CHIP_CTRL, 0,
+				   VENDOR_CHIPIO_8051_DATA_READ, 0);
+}
+
+static void chipio_8051_write_exram(struct hda_codec *codec,
+		unsigned int addr, unsigned int data)
+{
+	struct ca0132_spec *spec = codec->spec;
+
+	mutex_lock(&spec->chipio_mutex);
+
+	chipio_8051_set_address(codec, addr);
+	chipio_8051_set_data(codec, data);
+
+	mutex_unlock(&spec->chipio_mutex);
+}
+
+static void chipio_8051_write_exram_no_mutex(struct hda_codec *codec,
+		unsigned int addr, unsigned int data)
+{
+	chipio_8051_set_address(codec, addr);
+	chipio_8051_set_data(codec, data);
+}
+
+/* Readback data from the 8051's exram. No mutex. */
+static void chipio_8051_read_exram(struct hda_codec *codec,
+		unsigned int addr, unsigned int *data)
+{
+	chipio_8051_set_address(codec, addr);
+	*data = chipio_8051_get_data(codec);
+}
+
 /*
  * Enable clocks.
  */
@@ -7422,18 +7486,10 @@ static void ca0132_init_analog_mic2(struct hda_codec *codec)
 	struct ca0132_spec *spec = codec->spec;
 
 	mutex_lock(&spec->chipio_mutex);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x20);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_HIGH, 0x19);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_DATA_WRITE, 0x00);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x2D);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_HIGH, 0x19);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_DATA_WRITE, 0x00);
+
+	chipio_8051_write_exram_no_mutex(codec, 0x1920, 0x00);
+	chipio_8051_write_exram_no_mutex(codec, 0x192d, 0x00);
+
 	mutex_unlock(&spec->chipio_mutex);
 }
 
@@ -7504,18 +7560,11 @@ static void ca0132_refresh_widget_caps(struct hda_codec *codec)
 static void chipio_remap_stream(struct hda_codec *codec,
 		const struct chipio_stream_remap_data *remap_data)
 {
-	unsigned int i, stream_offset, tmp;
+	unsigned int i, stream_offset;
 
 	/* Get the starting port for the stream to be remapped. */
-	tmp = 0x1578 + remap_data->stream_id;
-	for (i = 0; i < 2; i++) {
-		snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-				    VENDOR_CHIPIO_8051_ADDRESS_LOW + i,
-				    ((tmp >> (i * 8)) & 0xff));
-	}
-
-	stream_offset = snd_hda_codec_read(codec, WIDGET_CHIP_CTRL, 0,
-				   VENDOR_CHIPIO_8051_DATA_READ, 0);
+	chipio_8051_read_exram(codec, 0x1578 + remap_data->stream_id,
+			&stream_offset);
 
 	/*
 	 * Check if the stream's port value is 0xff, because the 8051 may not
@@ -7526,9 +7575,8 @@ static void chipio_remap_stream(struct hda_codec *codec,
 		for (i = 0; i < 5; i++) {
 			msleep(25);
 
-			stream_offset = snd_hda_codec_read(codec,
-					WIDGET_CHIP_CTRL, 0,
-					VENDOR_CHIPIO_8051_DATA_READ, 0);
+			chipio_8051_read_exram(codec, 0x1578 + remap_data->stream_id,
+					&stream_offset);
 
 			if (stream_offset != 0xff)
 				break;
@@ -7863,12 +7911,7 @@ static void ae5_post_dsp_param_setup(struct hda_codec *codec)
 	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0, 0x724, 0x83);
 	chipio_set_control_param(codec, CONTROL_PARAM_ASI, 0);
 
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x92);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_HIGH, 0xfa);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_DATA_WRITE, 0x22);
+	chipio_8051_write_exram(codec, 0xfa92, 0x22);
 }
 
 static void ae5_post_dsp_pll_setup(struct hda_codec *codec)
@@ -8134,12 +8177,7 @@ static void ae7_post_dsp_asi_setup(struct hda_codec *codec)
 	chipio_set_control_param(codec, CONTROL_PARAM_ASI, 0);
 	snd_hda_codec_write(codec, 0x17, 0, 0x794, 0x00);
 
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x92);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_HIGH, 0xfa);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_DATA_WRITE, 0x22);
+	chipio_8051_write_exram(codec, 0xfa92, 0x22);
 
 	ae7_post_dsp_pll_setup(codec);
 	ae7_post_dsp_asi_stream_setup(codec);
@@ -9133,12 +9171,7 @@ static void r3d_pre_dsp_setup(struct hda_codec *codec)
 {
 	chipio_write(codec, 0x18b0a4, 0x000000c2);
 
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x1E);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_HIGH, 0x1C);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_DATA_WRITE, 0x5B);
+	chipio_8051_write_exram(codec, 0x1c1e, 0x5b);
 
 	snd_hda_codec_write(codec, 0x11, 0,
 			AC_VERB_SET_PIN_WIDGET_CONTROL, 0x44);
@@ -9148,21 +9181,9 @@ static void r3di_pre_dsp_setup(struct hda_codec *codec)
 {
 	chipio_write(codec, 0x18b0a4, 0x000000c2);
 
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x1E);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_HIGH, 0x1C);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_DATA_WRITE, 0x5B);
-
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_LOW, 0x20);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_ADDRESS_HIGH, 0x19);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_DATA_WRITE, 0x00);
-	snd_hda_codec_write(codec, WIDGET_CHIP_CTRL, 0,
-			    VENDOR_CHIPIO_8051_DATA_WRITE, 0x40);
+	chipio_8051_write_exram(codec, 0x1c1e, 0x5b);
+	chipio_8051_write_exram(codec, 0x1920, 0x00);
+	chipio_8051_write_exram(codec, 0x1921, 0x40);
 
 	snd_hda_codec_write(codec, 0x11, 0,
 			AC_VERB_SET_PIN_WIDGET_CONTROL, 0x04);
-- 
2.25.1

