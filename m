Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C9F130873
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 15:53:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB902178D;
	Sun,  5 Jan 2020 15:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB902178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236021;
	bh=gB53paFvqlRf8lQ7NfNYPdGomBuQW2/RQk0kQjr91g0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wd3NHJLthUa3x0aSdjnTDXw22GRv+u55lwQCi6O/X146DZ/TTDkFHvkGPIx7v4tda
	 h4A0zhhZaHIohMki7Ey/Q+PxJs/SAnKHeSHAvQMVMt9Hwm0eAjT+JwzWDC4v2ATu2x
	 IDmdFpu9Z/lzyPIS8lhq1ADxrdkQRW/AAQmo8KTI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67641F80331;
	Sun,  5 Jan 2020 15:48:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBE06F80315; Sun,  5 Jan 2020 15:48:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D91AEF80172
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D91AEF80172
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3BE9B158
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:18 +0100
Message-Id: <20200105144823.29547-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 03/68] ALSA: hda/realtek - More constifications
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Apply const prefix to each coef table array.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 118 +++++++++++++++++++++---------------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 76b603544f2a..73407b25a777 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -948,7 +948,7 @@ struct alc_codec_rename_pci_table {
 	const char *name;
 };
 
-static struct alc_codec_rename_table rename_tbl[] = {
+static const struct alc_codec_rename_table rename_tbl[] = {
 	{ 0x10ec0221, 0xf00f, 0x1003, "ALC231" },
 	{ 0x10ec0269, 0xfff0, 0x3010, "ALC277" },
 	{ 0x10ec0269, 0xf0f0, 0x2010, "ALC259" },
@@ -969,7 +969,7 @@ static struct alc_codec_rename_table rename_tbl[] = {
 	{ } /* terminator */
 };
 
-static struct alc_codec_rename_pci_table rename_pci_tbl[] = {
+static const struct alc_codec_rename_pci_table rename_pci_tbl[] = {
 	{ 0x10ec0280, 0x1028, 0, "ALC3220" },
 	{ 0x10ec0282, 0x1028, 0, "ALC3221" },
 	{ 0x10ec0283, 0x1028, 0, "ALC3223" },
@@ -2995,7 +2995,7 @@ static void alc269_shutup(struct hda_codec *codec)
 	alc_shutup_pins(codec);
 }
 
-static struct coef_fw alc282_coefs[] = {
+static const struct coef_fw alc282_coefs[] = {
 	WRITE_COEF(0x03, 0x0002), /* Power Down Control */
 	UPDATE_COEF(0x05, 0xff3f, 0x0700), /* FIFO and filter clock */
 	WRITE_COEF(0x07, 0x0200), /* DMIC control */
@@ -3107,7 +3107,7 @@ static void alc282_shutup(struct hda_codec *codec)
 	alc_write_coef_idx(codec, 0x78, coef78);
 }
 
-static struct coef_fw alc283_coefs[] = {
+static const struct coef_fw alc283_coefs[] = {
 	WRITE_COEF(0x03, 0x0002), /* Power Down Control */
 	UPDATE_COEF(0x05, 0xff3f, 0x0700), /* FIFO and filter clock */
 	WRITE_COEF(0x07, 0x0200), /* DMIC control */
@@ -4183,7 +4183,7 @@ static void alc269_fixup_hp_line1_mic1_led(struct hda_codec *codec,
 	}
 }
 
-static struct coef_fw alc225_pre_hsmode[] = {
+static const struct coef_fw alc225_pre_hsmode[] = {
 	UPDATE_COEF(0x4a, 1<<8, 0),
 	UPDATE_COEFEX(0x57, 0x05, 1<<14, 0),
 	UPDATE_COEF(0x63, 3<<14, 3<<14),
@@ -4196,7 +4196,7 @@ static struct coef_fw alc225_pre_hsmode[] = {
 
 static void alc_headset_mode_unplugged(struct hda_codec *codec)
 {
-	static struct coef_fw coef0255[] = {
+	static const struct coef_fw coef0255[] = {
 		WRITE_COEF(0x1b, 0x0c0b), /* LDO and MISC control */
 		WRITE_COEF(0x45, 0xd089), /* UAJ function set to menual mode */
 		UPDATE_COEFEX(0x57, 0x05, 1<<14, 0), /* Direct Drive HP Amp control(Set to verb control)*/
@@ -4204,7 +4204,7 @@ static void alc_headset_mode_unplugged(struct hda_codec *codec)
 		WRITE_COEFEX(0x57, 0x03, 0x8aa6), /* Direct Drive HP Amp control */
 		{}
 	};
-	static struct coef_fw coef0256[] = {
+	static const struct coef_fw coef0256[] = {
 		WRITE_COEF(0x1b, 0x0c4b), /* LDO and MISC control */
 		WRITE_COEF(0x45, 0xd089), /* UAJ function set to menual mode */
 		WRITE_COEF(0x06, 0x6104), /* Set MIC2 Vref gate with HP */
@@ -4212,7 +4212,7 @@ static void alc_headset_mode_unplugged(struct hda_codec *codec)
 		UPDATE_COEFEX(0x57, 0x05, 1<<14, 0), /* Direct Drive HP Amp control(Set to verb control)*/
 		{}
 	};
-	static struct coef_fw coef0233[] = {
+	static const struct coef_fw coef0233[] = {
 		WRITE_COEF(0x1b, 0x0c0b),
 		WRITE_COEF(0x45, 0xc429),
 		UPDATE_COEF(0x35, 0x4000, 0),
@@ -4222,7 +4222,7 @@ static void alc_headset_mode_unplugged(struct hda_codec *codec)
 		WRITE_COEF(0x32, 0x42a3),
 		{}
 	};
-	static struct coef_fw coef0288[] = {
+	static const struct coef_fw coef0288[] = {
 		UPDATE_COEF(0x4f, 0xfcc0, 0xc400),
 		UPDATE_COEF(0x50, 0x2000, 0x2000),
 		UPDATE_COEF(0x56, 0x0006, 0x0006),
@@ -4230,18 +4230,18 @@ static void alc_headset_mode_unplugged(struct hda_codec *codec)
 		UPDATE_COEF(0x67, 0x2000, 0),
 		{}
 	};
-	static struct coef_fw coef0298[] = {
+	static const struct coef_fw coef0298[] = {
 		UPDATE_COEF(0x19, 0x1300, 0x0300),
 		{}
 	};
-	static struct coef_fw coef0292[] = {
+	static const struct coef_fw coef0292[] = {
 		WRITE_COEF(0x76, 0x000e),
 		WRITE_COEF(0x6c, 0x2400),
 		WRITE_COEF(0x18, 0x7308),
 		WRITE_COEF(0x6b, 0xc429),
 		{}
 	};
-	static struct coef_fw coef0293[] = {
+	static const struct coef_fw coef0293[] = {
 		UPDATE_COEF(0x10, 7<<8, 6<<8), /* SET Line1 JD to 0 */
 		UPDATE_COEFEX(0x57, 0x05, 1<<15|1<<13, 0x0), /* SET charge pump by verb */
 		UPDATE_COEFEX(0x57, 0x03, 1<<10, 1<<10), /* SET EN_OSW to 1 */
@@ -4250,16 +4250,16 @@ static void alc_headset_mode_unplugged(struct hda_codec *codec)
 		UPDATE_COEF(0x4a, 0x000f, 0x000e), /* Combo Jack auto detect */
 		{}
 	};
-	static struct coef_fw coef0668[] = {
+	static const struct coef_fw coef0668[] = {
 		WRITE_COEF(0x15, 0x0d40),
 		WRITE_COEF(0xb7, 0x802b),
 		{}
 	};
-	static struct coef_fw coef0225[] = {
+	static const struct coef_fw coef0225[] = {
 		UPDATE_COEF(0x63, 3<<14, 0),
 		{}
 	};
-	static struct coef_fw coef0274[] = {
+	static const struct coef_fw coef0274[] = {
 		UPDATE_COEF(0x4a, 0x0100, 0),
 		UPDATE_COEFEX(0x57, 0x05, 0x4000, 0),
 		UPDATE_COEF(0x6b, 0xf000, 0x5000),
@@ -4324,25 +4324,25 @@ static void alc_headset_mode_unplugged(struct hda_codec *codec)
 static void alc_headset_mode_mic_in(struct hda_codec *codec, hda_nid_t hp_pin,
 				    hda_nid_t mic_pin)
 {
-	static struct coef_fw coef0255[] = {
+	static const struct coef_fw coef0255[] = {
 		WRITE_COEFEX(0x57, 0x03, 0x8aa6),
 		WRITE_COEF(0x06, 0x6100), /* Set MIC2 Vref gate to normal */
 		{}
 	};
-	static struct coef_fw coef0256[] = {
+	static const struct coef_fw coef0256[] = {
 		UPDATE_COEFEX(0x57, 0x05, 1<<14, 1<<14), /* Direct Drive HP Amp control(Set to verb control)*/
 		WRITE_COEFEX(0x57, 0x03, 0x09a3),
 		WRITE_COEF(0x06, 0x6100), /* Set MIC2 Vref gate to normal */
 		{}
 	};
-	static struct coef_fw coef0233[] = {
+	static const struct coef_fw coef0233[] = {
 		UPDATE_COEF(0x35, 0, 1<<14),
 		WRITE_COEF(0x06, 0x2100),
 		WRITE_COEF(0x1a, 0x0021),
 		WRITE_COEF(0x26, 0x008c),
 		{}
 	};
-	static struct coef_fw coef0288[] = {
+	static const struct coef_fw coef0288[] = {
 		UPDATE_COEF(0x4f, 0x00c0, 0),
 		UPDATE_COEF(0x50, 0x2000, 0),
 		UPDATE_COEF(0x56, 0x0006, 0),
@@ -4351,30 +4351,30 @@ static void alc_headset_mode_mic_in(struct hda_codec *codec, hda_nid_t hp_pin,
 		UPDATE_COEF(0x67, 0x2000, 0x2000),
 		{}
 	};
-	static struct coef_fw coef0292[] = {
+	static const struct coef_fw coef0292[] = {
 		WRITE_COEF(0x19, 0xa208),
 		WRITE_COEF(0x2e, 0xacf0),
 		{}
 	};
-	static struct coef_fw coef0293[] = {
+	static const struct coef_fw coef0293[] = {
 		UPDATE_COEFEX(0x57, 0x05, 0, 1<<15|1<<13), /* SET charge pump by verb */
 		UPDATE_COEFEX(0x57, 0x03, 1<<10, 0), /* SET EN_OSW to 0 */
 		UPDATE_COEF(0x1a, 1<<3, 0), /* Combo JD gating without LINE1-VREFO */
 		{}
 	};
-	static struct coef_fw coef0688[] = {
+	static const struct coef_fw coef0688[] = {
 		WRITE_COEF(0xb7, 0x802b),
 		WRITE_COEF(0xb5, 0x1040),
 		UPDATE_COEF(0xc3, 0, 1<<12),
 		{}
 	};
-	static struct coef_fw coef0225[] = {
+	static const struct coef_fw coef0225[] = {
 		UPDATE_COEFEX(0x57, 0x05, 1<<14, 1<<14),
 		UPDATE_COEF(0x4a, 3<<4, 2<<4),
 		UPDATE_COEF(0x63, 3<<14, 0),
 		{}
 	};
-	static struct coef_fw coef0274[] = {
+	static const struct coef_fw coef0274[] = {
 		UPDATE_COEFEX(0x57, 0x05, 0x4000, 0x4000),
 		UPDATE_COEF(0x4a, 0x0010, 0),
 		UPDATE_COEF(0x6b, 0xf000, 0),
@@ -4460,7 +4460,7 @@ static void alc_headset_mode_mic_in(struct hda_codec *codec, hda_nid_t hp_pin,
 
 static void alc_headset_mode_default(struct hda_codec *codec)
 {
-	static struct coef_fw coef0225[] = {
+	static const struct coef_fw coef0225[] = {
 		UPDATE_COEF(0x45, 0x3f<<10, 0x30<<10),
 		UPDATE_COEF(0x45, 0x3f<<10, 0x31<<10),
 		UPDATE_COEF(0x49, 3<<8, 0<<8),
@@ -4469,14 +4469,14 @@ static void alc_headset_mode_default(struct hda_codec *codec)
 		UPDATE_COEF(0x67, 0xf000, 0x3000),
 		{}
 	};
-	static struct coef_fw coef0255[] = {
+	static const struct coef_fw coef0255[] = {
 		WRITE_COEF(0x45, 0xc089),
 		WRITE_COEF(0x45, 0xc489),
 		WRITE_COEFEX(0x57, 0x03, 0x8ea6),
 		WRITE_COEF(0x49, 0x0049),
 		{}
 	};
-	static struct coef_fw coef0256[] = {
+	static const struct coef_fw coef0256[] = {
 		WRITE_COEF(0x45, 0xc489),
 		WRITE_COEFEX(0x57, 0x03, 0x0da3),
 		WRITE_COEF(0x49, 0x0049),
@@ -4484,12 +4484,12 @@ static void alc_headset_mode_default(struct hda_codec *codec)
 		WRITE_COEF(0x06, 0x6100),
 		{}
 	};
-	static struct coef_fw coef0233[] = {
+	static const struct coef_fw coef0233[] = {
 		WRITE_COEF(0x06, 0x2100),
 		WRITE_COEF(0x32, 0x4ea3),
 		{}
 	};
-	static struct coef_fw coef0288[] = {
+	static const struct coef_fw coef0288[] = {
 		UPDATE_COEF(0x4f, 0xfcc0, 0xc400), /* Set to TRS type */
 		UPDATE_COEF(0x50, 0x2000, 0x2000),
 		UPDATE_COEF(0x56, 0x0006, 0x0006),
@@ -4497,26 +4497,26 @@ static void alc_headset_mode_default(struct hda_codec *codec)
 		UPDATE_COEF(0x67, 0x2000, 0),
 		{}
 	};
-	static struct coef_fw coef0292[] = {
+	static const struct coef_fw coef0292[] = {
 		WRITE_COEF(0x76, 0x000e),
 		WRITE_COEF(0x6c, 0x2400),
 		WRITE_COEF(0x6b, 0xc429),
 		WRITE_COEF(0x18, 0x7308),
 		{}
 	};
-	static struct coef_fw coef0293[] = {
+	static const struct coef_fw coef0293[] = {
 		UPDATE_COEF(0x4a, 0x000f, 0x000e), /* Combo Jack auto detect */
 		WRITE_COEF(0x45, 0xC429), /* Set to TRS type */
 		UPDATE_COEF(0x1a, 1<<3, 0), /* Combo JD gating without LINE1-VREFO */
 		{}
 	};
-	static struct coef_fw coef0688[] = {
+	static const struct coef_fw coef0688[] = {
 		WRITE_COEF(0x11, 0x0041),
 		WRITE_COEF(0x15, 0x0d40),
 		WRITE_COEF(0xb7, 0x802b),
 		{}
 	};
-	static struct coef_fw coef0274[] = {
+	static const struct coef_fw coef0274[] = {
 		WRITE_COEF(0x45, 0x4289),
 		UPDATE_COEF(0x4a, 0x0010, 0x0010),
 		UPDATE_COEF(0x6b, 0x0f00, 0),
@@ -4579,53 +4579,53 @@ static void alc_headset_mode_ctia(struct hda_codec *codec)
 {
 	int val;
 
-	static struct coef_fw coef0255[] = {
+	static const struct coef_fw coef0255[] = {
 		WRITE_COEF(0x45, 0xd489), /* Set to CTIA type */
 		WRITE_COEF(0x1b, 0x0c2b),
 		WRITE_COEFEX(0x57, 0x03, 0x8ea6),
 		{}
 	};
-	static struct coef_fw coef0256[] = {
+	static const struct coef_fw coef0256[] = {
 		WRITE_COEF(0x45, 0xd489), /* Set to CTIA type */
 		WRITE_COEF(0x1b, 0x0e6b),
 		{}
 	};
-	static struct coef_fw coef0233[] = {
+	static const struct coef_fw coef0233[] = {
 		WRITE_COEF(0x45, 0xd429),
 		WRITE_COEF(0x1b, 0x0c2b),
 		WRITE_COEF(0x32, 0x4ea3),
 		{}
 	};
-	static struct coef_fw coef0288[] = {
+	static const struct coef_fw coef0288[] = {
 		UPDATE_COEF(0x50, 0x2000, 0x2000),
 		UPDATE_COEF(0x56, 0x0006, 0x0006),
 		UPDATE_COEF(0x66, 0x0008, 0),
 		UPDATE_COEF(0x67, 0x2000, 0),
 		{}
 	};
-	static struct coef_fw coef0292[] = {
+	static const struct coef_fw coef0292[] = {
 		WRITE_COEF(0x6b, 0xd429),
 		WRITE_COEF(0x76, 0x0008),
 		WRITE_COEF(0x18, 0x7388),
 		{}
 	};
-	static struct coef_fw coef0293[] = {
+	static const struct coef_fw coef0293[] = {
 		WRITE_COEF(0x45, 0xd429), /* Set to ctia type */
 		UPDATE_COEF(0x10, 7<<8, 7<<8), /* SET Line1 JD to 1 */
 		{}
 	};
-	static struct coef_fw coef0688[] = {
+	static const struct coef_fw coef0688[] = {
 		WRITE_COEF(0x11, 0x0001),
 		WRITE_COEF(0x15, 0x0d60),
 		WRITE_COEF(0xc3, 0x0000),
 		{}
 	};
-	static struct coef_fw coef0225_1[] = {
+	static const struct coef_fw coef0225_1[] = {
 		UPDATE_COEF(0x45, 0x3f<<10, 0x35<<10),
 		UPDATE_COEF(0x63, 3<<14, 2<<14),
 		{}
 	};
-	static struct coef_fw coef0225_2[] = {
+	static const struct coef_fw coef0225_2[] = {
 		UPDATE_COEF(0x45, 0x3f<<10, 0x35<<10),
 		UPDATE_COEF(0x63, 3<<14, 1<<14),
 		{}
@@ -4697,48 +4697,48 @@ static void alc_headset_mode_ctia(struct hda_codec *codec)
 /* Nokia type */
 static void alc_headset_mode_omtp(struct hda_codec *codec)
 {
-	static struct coef_fw coef0255[] = {
+	static const struct coef_fw coef0255[] = {
 		WRITE_COEF(0x45, 0xe489), /* Set to OMTP Type */
 		WRITE_COEF(0x1b, 0x0c2b),
 		WRITE_COEFEX(0x57, 0x03, 0x8ea6),
 		{}
 	};
-	static struct coef_fw coef0256[] = {
+	static const struct coef_fw coef0256[] = {
 		WRITE_COEF(0x45, 0xe489), /* Set to OMTP Type */
 		WRITE_COEF(0x1b, 0x0e6b),
 		{}
 	};
-	static struct coef_fw coef0233[] = {
+	static const struct coef_fw coef0233[] = {
 		WRITE_COEF(0x45, 0xe429),
 		WRITE_COEF(0x1b, 0x0c2b),
 		WRITE_COEF(0x32, 0x4ea3),
 		{}
 	};
-	static struct coef_fw coef0288[] = {
+	static const struct coef_fw coef0288[] = {
 		UPDATE_COEF(0x50, 0x2000, 0x2000),
 		UPDATE_COEF(0x56, 0x0006, 0x0006),
 		UPDATE_COEF(0x66, 0x0008, 0),
 		UPDATE_COEF(0x67, 0x2000, 0),
 		{}
 	};
-	static struct coef_fw coef0292[] = {
+	static const struct coef_fw coef0292[] = {
 		WRITE_COEF(0x6b, 0xe429),
 		WRITE_COEF(0x76, 0x0008),
 		WRITE_COEF(0x18, 0x7388),
 		{}
 	};
-	static struct coef_fw coef0293[] = {
+	static const struct coef_fw coef0293[] = {
 		WRITE_COEF(0x45, 0xe429), /* Set to omtp type */
 		UPDATE_COEF(0x10, 7<<8, 7<<8), /* SET Line1 JD to 1 */
 		{}
 	};
-	static struct coef_fw coef0688[] = {
+	static const struct coef_fw coef0688[] = {
 		WRITE_COEF(0x11, 0x0001),
 		WRITE_COEF(0x15, 0x0d50),
 		WRITE_COEF(0xc3, 0x0000),
 		{}
 	};
-	static struct coef_fw coef0225[] = {
+	static const struct coef_fw coef0225[] = {
 		UPDATE_COEF(0x45, 0x3f<<10, 0x39<<10),
 		UPDATE_COEF(0x63, 3<<14, 2<<14),
 		{}
@@ -4798,17 +4798,17 @@ static void alc_determine_headset_type(struct hda_codec *codec)
 	int val;
 	bool is_ctia = false;
 	struct alc_spec *spec = codec->spec;
-	static struct coef_fw coef0255[] = {
+	static const struct coef_fw coef0255[] = {
 		WRITE_COEF(0x45, 0xd089), /* combo jack auto switch control(Check type)*/
 		WRITE_COEF(0x49, 0x0149), /* combo jack auto switch control(Vref
  conteol) */
 		{}
 	};
-	static struct coef_fw coef0288[] = {
+	static const struct coef_fw coef0288[] = {
 		UPDATE_COEF(0x4f, 0xfcc0, 0xd400), /* Check Type */
 		{}
 	};
-	static struct coef_fw coef0298[] = {
+	static const struct coef_fw coef0298[] = {
 		UPDATE_COEF(0x50, 0x2000, 0x2000),
 		UPDATE_COEF(0x56, 0x0006, 0x0006),
 		UPDATE_COEF(0x66, 0x0008, 0),
@@ -4816,19 +4816,19 @@ static void alc_determine_headset_type(struct hda_codec *codec)
 		UPDATE_COEF(0x19, 0x1300, 0x1300),
 		{}
 	};
-	static struct coef_fw coef0293[] = {
+	static const struct coef_fw coef0293[] = {
 		UPDATE_COEF(0x4a, 0x000f, 0x0008), /* Combo Jack auto detect */
 		WRITE_COEF(0x45, 0xD429), /* Set to ctia type */
 		{}
 	};
-	static struct coef_fw coef0688[] = {
+	static const struct coef_fw coef0688[] = {
 		WRITE_COEF(0x11, 0x0001),
 		WRITE_COEF(0xb7, 0x802b),
 		WRITE_COEF(0x15, 0x0d60),
 		WRITE_COEF(0xc3, 0x0c00),
 		{}
 	};
-	static struct coef_fw coef0274[] = {
+	static const struct coef_fw coef0274[] = {
 		UPDATE_COEF(0x4a, 0x0010, 0),
 		UPDATE_COEF(0x4a, 0x8000, 0),
 		WRITE_COEF(0x45, 0xd289),
@@ -5115,7 +5115,7 @@ static void alc_fixup_headset_mode_no_hp_mic(struct hda_codec *codec,
 static void alc255_set_default_jack_type(struct hda_codec *codec)
 {
 	/* Set to iphone type */
-	static struct coef_fw alc255fw[] = {
+	static const struct coef_fw alc255fw[] = {
 		WRITE_COEF(0x1b, 0x880b),
 		WRITE_COEF(0x45, 0xd089),
 		WRITE_COEF(0x1b, 0x080b),
@@ -5123,7 +5123,7 @@ static void alc255_set_default_jack_type(struct hda_codec *codec)
 		WRITE_COEF(0x1b, 0x0c0b),
 		{}
 	};
-	static struct coef_fw alc256fw[] = {
+	static const struct coef_fw alc256fw[] = {
 		WRITE_COEF(0x1b, 0x884b),
 		WRITE_COEF(0x45, 0xd089),
 		WRITE_COEF(0x1b, 0x084b),
@@ -8482,7 +8482,7 @@ static void alc662_fixup_aspire_ethos_hp(struct hda_codec *codec,
 	}
 }
 
-static struct coef_fw alc668_coefs[] = {
+static const struct coef_fw alc668_coefs[] = {
 	WRITE_COEF(0x01, 0xbebe), WRITE_COEF(0x02, 0xaaaa), WRITE_COEF(0x03,    0x0),
 	WRITE_COEF(0x04, 0x0180), WRITE_COEF(0x06,    0x0), WRITE_COEF(0x07, 0x0f80),
 	WRITE_COEF(0x08, 0x0031), WRITE_COEF(0x0a, 0x0060), WRITE_COEF(0x0b,    0x0),
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
