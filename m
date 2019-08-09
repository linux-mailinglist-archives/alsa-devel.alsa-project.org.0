Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE587D43
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 16:54:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B7DD165D;
	Fri,  9 Aug 2019 16:54:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B7DD165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565362497;
	bh=qxrruMZQ0r4DSXyVEuoGTsJf1S4m7zFpEQhubhFDfmY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tXMPtt7bi2rH+sdgI8Yw89fdPJ/oUmcp6UNvnZDtztcVYXcvs3DbusSyOez6tMfbn
	 4LtkZ8HLRehL/bPQaLZCsyVcNrfIx3RgN0LqEGXxEQvQkW1rBq+F/ytcu3GxXAx2Ym
	 YaC6OQ+8fzOOMBjGphKShzaVSPsar6cRE59e5oNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B21FF804AB;
	Fri,  9 Aug 2019 16:53:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD3C4F803F3; Fri,  9 Aug 2019 16:53:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E8F8F800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 16:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E8F8F800E4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 02204AF7A
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 14:53:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  9 Aug 2019 16:53:06 +0200
Message-Id: <20190809145306.18429-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: hda - Add a quirk model for fixing
	Huawei Matebook X right speaker
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

From: Tomas Espeleta <tomas.espeleta@gmail.com>

[ This is rather a revival of the patch Tomas sent in months ago, but
  applying only with the quirk model option -- tiwai ]

Hard coded coefficients to make Huawuei Matebook X right speaker
work. The Matebook X has a ALC298, please refer to bug 197801 on
how these numbers were reverse engineered from the Windows driver

The reversed engineered sequence represents a repeating pattern
of verbs, and the only values that are changing periodically are
written on indexes 0x23 and 0x25:

0x500, 0x23
0x400, VALUE1
0x500, 0x25
0x400, VALUE2

* skipped reading sequences (0x500 - 0xc00 sequences are ignored)
* static values from reverse engineering are used

NOTE: since a significant risk is still considered, this is provided
as an experimental fix that isn't applied as default for now.  For
enabling the fix, you'll have to choose huawei-mbx-stereo via model
option of snd-hda-intel module.

If we get feedback from users that this works stably, we may apply it
per default.

[ Some coding style fixes and replacement with AC_VERB_* by tiwai ]

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=197801
Signed-off-by: Tomas Espeleta <tomas.espeleta@gmail.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/hd-audio/models.rst |  3 ++
 sound/pci/hda/patch_realtek.c           | 74 +++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/Documentation/sound/hd-audio/models.rst b/Documentation/sound/hd-audio/models.rst
index 7d7c191102a7..11298f0ce44d 100644
--- a/Documentation/sound/hd-audio/models.rst
+++ b/Documentation/sound/hd-audio/models.rst
@@ -260,6 +260,9 @@ alc295-hp-x360
     HP Spectre X360 fixups
 alc-sense-combo
     Headset button support for Chrome platform
+huawei-mbx-stereo
+    Enable initialization verbs for Huawei MBX stereo speakers;
+    might be risky, try this at your own risk
 
 ALC66x/67x/892
 ==============
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index de224cbea7a0..cb7baa65b298 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -3762,6 +3762,72 @@ static void alc269_x101_hp_automute_hook(struct hda_codec *codec,
 			    vref);
 }
 
+/*
+ * Magic sequence to make Huawei Matebook X right speaker working (bko#197801)
+ */
+struct hda_alc298_mbxinit {
+	unsigned char value_0x23;
+	unsigned char value_0x25;
+};
+
+static void alc298_huawei_mbx_stereo_seq(struct hda_codec *codec,
+					 const struct hda_alc298_mbxinit *initval,
+					 bool first)
+{
+	snd_hda_codec_write(codec, 0x06, 0, AC_VERB_SET_DIGI_CONVERT_3, 0x0);
+	alc_write_coef_idx(codec, 0x26, 0xb000);
+
+	if (first)
+		snd_hda_codec_write(codec, 0x21, 0, AC_VERB_GET_PIN_SENSE, 0x0);
+
+	snd_hda_codec_write(codec, 0x6, 0, AC_VERB_SET_DIGI_CONVERT_3, 0x80);
+	alc_write_coef_idx(codec, 0x26, 0xf000);
+	alc_write_coef_idx(codec, 0x23, initval->value_0x23);
+
+	if (initval->value_0x23 != 0x1e)
+		alc_write_coef_idx(codec, 0x25, initval->value_0x25);
+
+	snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_COEF_INDEX, 0x26);
+	snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_PROC_COEF, 0xb010);
+}
+
+static void alc298_fixup_huawei_mbx_stereo(struct hda_codec *codec,
+					   const struct hda_fixup *fix,
+					   int action)
+{
+	/* Initialization magic */
+	static const struct hda_alc298_mbxinit dac_init[] = {
+		{0x0c, 0x00}, {0x0d, 0x00}, {0x0e, 0x00}, {0x0f, 0x00},
+		{0x10, 0x00}, {0x1a, 0x40}, {0x1b, 0x82}, {0x1c, 0x00},
+		{0x1d, 0x00}, {0x1e, 0x00}, {0x1f, 0x00},
+		{0x20, 0xc2}, {0x21, 0xc8}, {0x22, 0x26}, {0x23, 0x24},
+		{0x27, 0xff}, {0x28, 0xff}, {0x29, 0xff}, {0x2a, 0x8f},
+		{0x2b, 0x02}, {0x2c, 0x48}, {0x2d, 0x34}, {0x2e, 0x00},
+		{0x2f, 0x00},
+		{0x30, 0x00}, {0x31, 0x00}, {0x32, 0x00}, {0x33, 0x00},
+		{0x34, 0x00}, {0x35, 0x01}, {0x36, 0x93}, {0x37, 0x0c},
+		{0x38, 0x00}, {0x39, 0x00}, {0x3a, 0xf8}, {0x38, 0x80},
+		{}
+	};
+	const struct hda_alc298_mbxinit *seq;
+
+	if (action != HDA_FIXUP_ACT_INIT)
+		return;
+
+	/* Start */
+	snd_hda_codec_write(codec, 0x06, 0, AC_VERB_SET_DIGI_CONVERT_3, 0x00);
+	snd_hda_codec_write(codec, 0x06, 0, AC_VERB_SET_DIGI_CONVERT_3, 0x80);
+	alc_write_coef_idx(codec, 0x26, 0xf000);
+	alc_write_coef_idx(codec, 0x22, 0x31);
+	alc_write_coef_idx(codec, 0x23, 0x0b);
+	alc_write_coef_idx(codec, 0x25, 0x00);
+	snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_COEF_INDEX, 0x26);
+	snd_hda_codec_write(codec, 0x20, 0, AC_VERB_SET_PROC_COEF, 0xb010);
+
+	for (seq = dac_init; seq->value_0x23; seq++)
+		alc298_huawei_mbx_stereo_seq(codec, seq, seq == dac_init);
+}
+
 static void alc269_fixup_x101_headset_mic(struct hda_codec *codec,
 				     const struct hda_fixup *fix, int action)
 {
@@ -5787,6 +5853,7 @@ enum {
 	ALC255_FIXUP_DUMMY_LINEOUT_VERB,
 	ALC255_FIXUP_DELL_HEADSET_MIC,
 	ALC256_FIXUP_HUAWEI_MACH_WX9_PINS,
+	ALC298_FIXUP_HUAWEI_MBX_STEREO,
 	ALC295_FIXUP_HP_X360,
 	ALC221_FIXUP_HP_HEADSET_MIC,
 	ALC285_FIXUP_LENOVO_HEADPHONE_NOISE,
@@ -6095,6 +6162,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC255_FIXUP_MIC_MUTE_LED
 	},
+	[ALC298_FIXUP_HUAWEI_MBX_STEREO] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc298_fixup_huawei_mbx_stereo,
+		.chained = true,
+		.chain_id = ALC255_FIXUP_MIC_MUTE_LED
+	},
 	[ALC269_FIXUP_ASUS_X101_FUNC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc269_fixup_x101_headset_mic,
@@ -7272,6 +7345,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
 	{.id = ALC225_FIXUP_HEADSET_JACK, .name = "alc-headset-jack"},
 	{.id = ALC295_FIXUP_CHROME_BOOK, .name = "alc-chrome-book"},
 	{.id = ALC299_FIXUP_PREDATOR_SPK, .name = "predator-spk"},
+	{.id = ALC298_FIXUP_HUAWEI_MBX_STEREO, .name = "huawei-mbx-stereo"},
 	{}
 };
 #define ALC225_STANDARD_PINS \
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
