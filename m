Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7732BA0C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 19:55:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48D4718F7;
	Wed,  3 Mar 2021 19:54:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48D4718F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614797747;
	bh=7YoThR2068iim7rHfN0NOjuZUZPaGjQNEyNdBSca7LY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FL8xAC8C20GJl2BersxD30l7xSOleadKmotp+68Pr7BNZg8M7vTjvTt3TzEfolLmN
	 eWS2udjThEGrJep3MhMxtrV4J/Y8Q1S+z5c59rxLvpsmItKcnc2pYRgaZI2sCIDUn5
	 2jVh1VMJzpEpfFaiKQO4+u0ggIlJorAIPXIuM/z8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DBC0F80227;
	Wed,  3 Mar 2021 19:54:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43D79F80275; Wed,  3 Mar 2021 19:54:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7833FF80227
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 19:53:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7833FF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="fL7JuH4X"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123IrMkL001579; Wed, 3 Mar 2021 12:53:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=qkkHmcwxsuDjX/9vpPuFpdfsgDnrt3T4rDmcXwsIJrM=;
 b=fL7JuH4XiZs3wWR/zvTl56v3CxOVve654o2S7yBxa6t8l8VMyWRIRhBgA6LU8tH5kLSI
 D3vYPpsejy63aX6MAcrwT9EwWnrk6bigOnExvIxR+kHtUOmfV+v0ucxvNVu7ZxVbBmYs
 0GGag1UkwMmfGDknIY6JeUc2IorbzTLx528eKG43heqw0gETdUbaPR1wSnhsq58VF89t
 nNZw08b2d9LP+o18Gq4EaPYJqDeHCiFzrLLZTSNnoHXU1ANPrKAOv9qxl1UvX79TJ0er
 2HNk9kxT8QE7msKsQZlU77xaMfnLGz+HWPlat+Rvs3Ja7yNkTmGOZzp7igd23BL/jrY3 rg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 36ykctnd7w-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 03 Mar 2021 12:53:52 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 3 Mar 2021
 18:53:50 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 3 Mar 2021 18:53:50 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.45])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 881FD11D1;
 Wed,  3 Mar 2021 18:53:50 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/4] ALSA: hda/cirrus: Add support for CS8409 HDA bridge and
 CS42L42 companion codec.
Date: Wed, 3 Mar 2021 18:53:47 +0000
Message-ID: <20210303185349.6227-3-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303185349.6227-1-vitalyr@opensource.cirrus.com>
References: <20210303185349.6227-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103030131
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Dell's laptops Inspiron 3500, Inspiron 3501, Inspiron 3505 are using Cirrus Logic
CS8409 HDA bridge with CS42L42 companion codec.

The CS8409 is a multichannel HD audio routing controller.
CS8409 includes support for four channels of digital
microphone data and two bidirectional ASPs for up to 32
channels of TDM data or 4 channels of I2S data. The CS8409 is
intended to be used with a remote companion codec that implements
high performance analog functions in close physical
proximity to the end-equipment audio port or speaker driver.

The CS42L42 is a low-power audio codec with integrated MIPI
SoundWire interface or I2C/I2S/TDM interfaces designed
for portable applications. It provides a high-dynamic range,
stereo DAC for audio playback and a mono high-dynamic-range
ADC for audio capture

CS42L42 is connected to CS8409 HDA bridge via I2C and I2S.

CS8409          CS42L42
-------         --------
ASP1.A TX  -->  ASP_SDIN
ASP1.A RX  <--  ASP_SDOUT
GPIO5      -->  RST#
GPIO4      <--  INT#
GPIO3      <--  WAKE#
GPIO7      <->  I2C SDA
GPIO6      -->  I2C CLK

Tested on DELL Inspiron-3500, DELL Inspiron-3501, DELL Inspiron-3505

This patch will register CS8409 with sound card and create
input/output paths and two input devices, initialise CS42L42
companion codec and configure it for ASP TX/RX TDM mode,
24bit, 48kHz.

cat /proc/asound/pcm
00-00: CS8409 Analog : CS8409 Analog : playback 1 : capture 1
00-03: HDMI 0 : HDMI 0 : playback 1

dmesg
snd_hda_codec_cirrus hdaudioC0D0: autoconfig for CS8409: line_outs=1 (0x2c/0x0/0x0/0x0/0x0) type:speaker
snd_hda_codec_cirrus hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
snd_hda_codec_cirrus hdaudioC0D0:    hp_outs=1 (0x24/0x0/0x0/0x0/0x0)
snd_hda_codec_cirrus hdaudioC0D0:    mono: mono_out=0x0
snd_hda_codec_cirrus hdaudioC0D0:    inputs:
snd_hda_codec_cirrus hdaudioC0D0:      Internal Mic=0x44
snd_hda_codec_cirrus hdaudioC0D0:      Mic=0x34
input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input8
input: HDA Intel PCH Headset Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input9

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cirrus.c | 543 +++++++++++++++++++++++++++++++++++
 1 file changed, 543 insertions(+)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index f46204ab0b90..9d664982544f 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -9,6 +9,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <sound/core.h>
+#include <linux/pci.h>
 #include <sound/tlv.h>
 #include <sound/hda_codec.h>
 #include "hda_local.h"
@@ -1219,6 +1220,547 @@ static int patch_cs4213(struct hda_codec *codec)
 	return err;
 }
 
+/* Cirrus Logic CS8409 HDA bridge with
+ * companion codec CS42L42
+ */
+#define CS8409_VENDOR_NID 0x47
+
+#define CS8409_CS42L42_HP_PIN_NID	0x24
+#define CS8409_CS42L42_SPK_PIN_NID	0x2c
+#define CS8409_CS42L42_AMIC_PIN_NID	0x34
+#define CS8409_CS42L42_DMIC_PIN_NID	0x44
+
+#define GPIO3_INT (1 << 3)
+#define GPIO4_INT (1 << 4)
+#define GPIO5_INT (1 << 5)
+
+#define CS42L42_I2C_ADDR	(0x48 << 1)
+
+#define CIR_I2C_ADDR	0x0059
+#define CIR_I2C_DATA	0x005A
+#define CIR_I2C_CTRL	0x005B
+#define CIR_I2C_STATUS	0x005C
+#define CIR_I2C_QWRITE	0x005D
+#define CIR_I2C_QREAD	0x005E
+
+struct cs8409_i2c_param {
+	unsigned int addr;
+	unsigned int reg;
+};
+
+struct cs8409_cir_param {
+	unsigned int nid;
+	unsigned int cir;
+	unsigned int coeff;
+};
+
+enum {
+	CS8409_BULLSEYE,
+	CS8409_WARLOCK,
+	CS8409_CYBORG,
+	CS8409_VERBS,
+};
+
+/* Dell Inspiron models with cs8409/cs42l42 */
+static const struct hda_model_fixup cs8409_models[] = {
+	{ .id = CS8409_BULLSEYE, .name = "bullseye" },
+	{ .id = CS8409_WARLOCK, .name = "warlock" },
+	{ .id = CS8409_CYBORG, .name = "cyborg" },
+	{}
+};
+
+/* Dell Inspiron platforms
+ * with cs8409 bridge and cs42l42 codec
+ */
+static const struct snd_pci_quirk cs8409_fixup_tbl[] = {
+	SND_PCI_QUIRK(0x1028, 0x0A11, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A12, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A23, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A24, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A25, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A29, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A2A, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0A2B, "Bullseye", CS8409_BULLSEYE),
+	SND_PCI_QUIRK(0x1028, 0x0AB0, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AB2, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AB1, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AB3, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AB4, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AB5, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AD9, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0ADA, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0ADB, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0ADC, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AF4, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0AF5, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0A77, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A78, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A79, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A7A, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A7D, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A7E, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A7F, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0A80, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0ADF, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AE0, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AE1, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AE2, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AE9, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AEA, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AEB, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AEC, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AED, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AEE, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AEF, "Cyborg", CS8409_CYBORG),
+	SND_PCI_QUIRK(0x1028, 0x0AF0, "Cyborg", CS8409_CYBORG),
+	{} /* terminator */
+};
+
+static const struct hda_verb cs8409_cs42l42_init_verbs[] = {
+	{ 0x01, AC_VERB_SET_POWER_STATE, 0x0000 },    /* AFG: D0 */
+	{ 0x01, AC_VERB_SET_GPIO_DIRECTION, 0x0020 }, /* GPIO 5 out, 3,4 in */
+	{ 0x01, AC_VERB_SET_GPIO_DATA, 0x0000 },      /* GPIO  data 0 */
+	{ 0x01, AC_VERB_SET_GPIO_MASK, 0x003f },      /* Enable GPIO */
+	{ 0x01, AC_VERB_SET_GPIO_WAKE_MASK, 0x0018 }, /* WAKE from GPIO 3,4 */
+	{ 0x47, AC_VERB_SET_PROC_STATE, 0x0001 },     /* Enable VPW processing  */
+	{ 0x47, AC_VERB_SET_COEF_INDEX, 0x0002 },     /* Configure GPIO 6,7 */
+	{ 0x47, AC_VERB_SET_PROC_COEF,  0x0080 },     /* I2C mode */
+	{ 0x47, AC_VERB_SET_COEF_INDEX, 0x005b },     /* Set I2C bus speed */
+	{ 0x47, AC_VERB_SET_PROC_COEF,  0x0200 },     /* 100kHz I2C_STO = 2 */
+	{} /* terminator */
+};
+
+static const struct hda_pintbl cs8409_cs42l42_pincfgs[] = {
+	{ 0x24, 0x042120f0 }, /* ASP-1-TX */
+	{ 0x34, 0x04a12050 }, /* ASP-1-RX */
+	{ 0x2c, 0x901000f0 }, /* ASP-2-TX */
+	{ 0x44, 0x90a00090 }, /* DMIC-1 */
+	{} /* terminator */
+};
+
+static const struct hda_verb cs8409_cs42l42_add_verbs[] = {
+	{ 0x24, 0x71c, 0xF0 }, /* Widget node ASP-1-TX */
+	{ 0x24, 0x71d, 0x20 },
+	{ 0x24, 0x71e, 0x21 },
+	{ 0x24, 0x71f, 0x04 },
+	{ 0x34, 0x71c, 0x50 }, /* Widget node ASP-1-RX0 */
+	{ 0x34, 0x71d, 0x20 },
+	{ 0x34, 0x71e, 0xa1 },
+	{ 0x34, 0x71f, 0x04 },
+	{ 0x2C, 0x71c, 0xF0 }, /* Widget node ASP-2-TX */
+	{ 0x2C, 0x71d, 0x00 },
+	{ 0x2C, 0x71e, 0x10 },
+	{ 0x2C, 0x71f, 0x90 },
+	{ 0x44, 0x71c, 0x90 }, /* Widget node DMIC-1 */
+	{ 0x44, 0x71d, 0x00 },
+	{ 0x44, 0x71e, 0xA0 },
+	{ 0x44, 0x71f, 0x90 },
+	{} /* terminator */
+};
+
+static const struct hda_fixup cs8409_fixups[] = {
+	[CS8409_BULLSEYE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = cs8409_cs42l42_pincfgs,
+		.chained = true,
+		.chain_id = CS8409_VERBS,
+	},
+	[CS8409_WARLOCK] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = cs8409_cs42l42_pincfgs,
+		.chained = true,
+		.chain_id = CS8409_VERBS,
+	},
+	[CS8409_CYBORG] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = cs8409_cs42l42_pincfgs,
+		.chained = true,
+		.chain_id = CS8409_VERBS,
+	},
+	[CS8409_VERBS] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = cs8409_cs42l42_add_verbs,
+	},
+};
+
+/* Vendor specific HW configuration for CS42L42 */
+static const struct cs8409_i2c_param cs42l42_init_reg_seq[] = {
+	{ 0x1010, 0xB0 },
+	{ 0x1D01, 0x00 },
+	{ 0x1D02, 0x06 },
+	{ 0x1D03, 0x00 },
+	{ 0x1107, 0x01 },
+	{ 0x1009, 0x02 },
+	{ 0x1007, 0x03 },
+	{ 0x1201, 0x00 },
+	{ 0x1208, 0x13 },
+	{ 0x1205, 0xFF },
+	{ 0x1206, 0x00 },
+	{ 0x1207, 0x20 },
+	{ 0x1202, 0x0D },
+	{ 0x2A02, 0x02 },
+	{ 0x2A03, 0x00 },
+	{ 0x2A04, 0x00 },
+	{ 0x2A05, 0x02 },
+	{ 0x2A06, 0x00 },
+	{ 0x2A07, 0x20 },
+	{ 0x2A08, 0x02 },
+	{ 0x2A09, 0x00 },
+	{ 0x2A0A, 0x80 },
+	{ 0x2A0B, 0x02 },
+	{ 0x2A0C, 0x00 },
+	{ 0x2A0D, 0xA0 },
+	{ 0x2A01, 0x0C },
+	{ 0x2902, 0x01 },
+	{ 0x2903, 0x02 },
+	{ 0x2904, 0x00 },
+	{ 0x2905, 0x00 },
+	{ 0x2901, 0x01 },
+	{ 0x1101, 0x0A },
+	{ 0x1102, 0x84 },
+	{ 0x2301, 0x00 },
+	{ 0x2303, 0x00 },
+	{ 0x2302, 0x3f },
+	{ 0x2001, 0x03 },
+	{ 0x1B75, 0xB6 },
+	{ 0x1B73, 0xC2 },
+	{ 0x1129, 0x01 },
+	{ 0x1121, 0xF3 },
+	{ 0x1103, 0x20 },
+	{ 0x1105, 0x00 },
+	{ 0x1112, 0xC0 },
+	{ 0x1113, 0x80 },
+	{ 0x1C03, 0xC0 },
+	{ 0x1105, 0x00 },
+	{ 0x1112, 0xC0 },
+	{} /* Terminator */
+};
+
+/* Vendor specific hw configuration for CS8409 */
+static const struct cs8409_cir_param cs8409_cs42l42_hw_cfg[] = {
+	{ 0x47, 0x00, 0xb008 }, /* +PLL1/2_EN, +I2C_EN */
+	{ 0x47, 0x01, 0x0002 }, /* ASP1/2_EN=0, ASP1_STP=1 */
+	{ 0x47, 0x02, 0x0a80 }, /* ASP1/2_BUS_IDLE=10, +GPIO_I2C */
+	{ 0x47, 0x19, 0x0800 }, /* ASP1.A: TX.LAP=0, TX.LSZ=24 bits, TX.LCS=0 */
+	{ 0x47, 0x1a, 0x0820 }, /* ASP1.A: TX.RAP=0, TX.RSZ=24 bits, TX.RCS=32 */
+	{ 0x47, 0x29, 0x0800 }, /* ASP2.A: TX.LAP=0, TX.LSZ=24 bits, TX.LCS=0 */
+	{ 0x47, 0x2a, 0x2800 }, /* ASP2.A: TX.RAP=1, TX.RSZ=24 bits, TX.RCS=0 */
+	{ 0x47, 0x39, 0x0800 }, /* ASP1.A: RX.LAP=0, RX.LSZ=24 bits, RX.LCS=0 */
+	{ 0x47, 0x3a, 0x0800 }, /* ASP1.A: RX.RAP=0, RX.RSZ=24 bits, RX.RCS=0 */
+	{ 0x47, 0x03, 0x8000 }, /* ASP1: LCHI = 00h */
+	{ 0x47, 0x04, 0x28ff }, /* ASP1: MC/SC_SRCSEL=PLL1, LCPR=FFh */
+	{ 0x47, 0x05, 0x0062 }, /* ASP1: MCEN=0, FSD=011, SCPOL_IN/OUT=0, SCDIV=1:4 */
+	{ 0x47, 0x06, 0x801f }, /* ASP2: LCHI=1Fh */
+	{ 0x47, 0x07, 0x283f }, /* ASP2: MC/SC_SRCSEL=PLL1, LCPR=3Fh */
+	{ 0x47, 0x08, 0x805c }, /* ASP2: 5050=1, MCEN=0, FSD=010, SCPOL_IN/OUT=1, SCDIV=1:16 */
+	{ 0x47, 0x09, 0x0023 }, /* DMIC1_MO=10b, DMIC1/2_SR=1 */
+	{ 0x47, 0x0a, 0x0000 }, /* ASP1/2_BEEP=0 */
+	{ 0x47, 0x01, 0x0062 }, /* ASP1/2_EN=1, ASP1_STP=1 */
+	{ 0x47, 0x00, 0x9008 }, /* -PLL2_EN */
+	{ 0x47, 0x68, 0x0000 }, /* TX2.A: pre-scale att.=0 dB */
+	{ 0x47, 0x82, 0xfc03 }, /* ASP1/2_xxx_EN=1, ASP1/2_MCLK_EN=0, DMIC1_SCL_EN=1 */
+	{ 0x47, 0xc0, 0x9999 }, /* test mode on */
+	{ 0x47, 0xc5, 0x0000 }, /* GPIO hysteresis = 30 us */
+	{ 0x47, 0xc0, 0x0000 }, /* test mode off */
+	{} /* Terminator */
+};
+
+/* Enable I2C clocks */
+static void cs8409_enable_i2c_clock(struct hda_codec *codec, unsigned int flag)
+{
+	unsigned int retval = 0;
+	unsigned int newval = 0;
+
+	retval = cs_vendor_coef_get(codec, 0x0);
+	newval = (flag) ? (retval | 0x8) : (retval & 0xfffffff7);
+	cs_vendor_coef_set(codec, 0x0, newval);
+}
+
+/* Wait I2C transaction  */
+static int cs8409_i2c_wait_complete(struct hda_codec *codec)
+{
+	int repeat = 5;
+	unsigned int retval = 0;
+
+	do {
+		retval = cs_vendor_coef_get(codec, CIR_I2C_STATUS);
+		if ((retval & 0x18) != 0x18) {
+			usleep_range(2000, 4000);
+			--repeat;
+		} else
+			break;
+
+	} while (repeat);
+
+	return repeat > 0 ? 0 : -1;
+}
+
+/* CS8409 slave i2cRead */
+static unsigned int cs8409_i2c_read(struct hda_codec *codec,
+		unsigned int i2c_address,
+		unsigned int i2c_reg,
+		unsigned int paged)
+{
+	unsigned int i2c_reg_data;
+	unsigned int retval;
+
+	cs8409_enable_i2c_clock(codec, 1);
+	cs_vendor_coef_set(codec, CIR_I2C_ADDR, i2c_address);
+
+	if (paged) {
+		cs_vendor_coef_set(codec, CIR_I2C_QWRITE, i2c_reg >> 8);
+		if (cs8409_i2c_wait_complete(codec) == -1) {
+			codec_err(codec,
+				"%s() Paged Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
+				__func__, i2c_address, i2c_reg, retval);
+		}
+	}
+
+	i2c_reg_data = (i2c_reg << 8) & 0x0ffff;
+	cs_vendor_coef_set(codec, CIR_I2C_QREAD, i2c_reg_data);
+	if (cs8409_i2c_wait_complete(codec) == -1) {
+		codec_err(codec, "%s() Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
+			__func__, i2c_address, i2c_reg, retval);
+	}
+
+	/* Register in bits 15-8 and the data in 7-0 */
+	retval = cs_vendor_coef_get(codec, CIR_I2C_QREAD);
+	retval &= 0x0ff;
+
+	cs8409_enable_i2c_clock(codec, 0);
+
+	return retval;
+}
+
+/* CS8409 slave i2cWrite */
+static unsigned int cs8409_i2c_write(struct hda_codec *codec,
+		unsigned int i2c_address, unsigned int i2c_reg,
+		unsigned int i2c_data,
+		unsigned int paged)
+{
+	unsigned int retval = 0;
+	unsigned int i2c_reg_data = 0;
+
+	cs8409_enable_i2c_clock(codec, 1);
+	cs_vendor_coef_set(codec, CIR_I2C_ADDR, i2c_address);
+
+	if (paged) {
+		cs_vendor_coef_set(codec, CIR_I2C_QWRITE, i2c_reg >> 8);
+		if (cs8409_i2c_wait_complete(codec) == -1) {
+			codec_err(codec,
+				"%s() Paged Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
+				__func__, i2c_address, i2c_reg, retval);
+		}
+	}
+
+	i2c_reg_data = ((i2c_reg << 8) & 0x0ff00) | (i2c_data & 0x0ff);
+	cs_vendor_coef_set(codec, CIR_I2C_QWRITE, i2c_reg_data);
+
+	if (cs8409_i2c_wait_complete(codec) == -1) {
+		codec_err(codec, "%s() Transaction Failed 0x%02x : 0x%04x = 0x%02x\n",
+			__func__, i2c_address, i2c_reg, retval);
+	}
+
+	cs8409_enable_i2c_clock(codec, 0);
+
+	return retval;
+}
+
+/* Assert/release RTS# line to CS42L42 */
+static void cs8409_cs42l42_reset(struct hda_codec *codec)
+{
+	/* Assert RTS# line */
+	snd_hda_codec_write(codec,
+			codec->core.afg, 0, AC_VERB_SET_GPIO_DATA, 0);
+	/* wait ~10ms */
+	usleep_range(10000, 15000);
+	/* Release RTS# line */
+	snd_hda_codec_write(codec,
+			codec->core.afg, 0, AC_VERB_SET_GPIO_DATA, GPIO5_INT);
+	/* wait ~10ms */
+	usleep_range(10000, 15000);
+
+	/* Clear interrupts status */
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1308, 1);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x1309, 1);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130A, 1);
+	cs8409_i2c_read(codec, CS42L42_I2C_ADDR, 0x130F, 1);
+
+}
+
+static void cs8409_cs42l42_reg_setup(struct hda_codec *codec)
+{
+	const struct cs8409_i2c_param *seq = cs42l42_init_reg_seq;
+
+	for (; seq->addr; seq++)
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, seq->addr, seq->reg, 1);
+
+}
+
+static int cs8409_cs42l42_build_controls(struct hda_codec *codec)
+{
+	int err;
+
+	err = snd_hda_gen_build_controls(codec);
+	if (err < 0)
+		return err;
+
+	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_BUILD);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM
+/* Manage PDREF, when transition to D3hot */
+static int cs8409_suspend(struct hda_codec *codec)
+{
+	snd_hda_shutup_pins(codec);
+	return 0;
+}
+#endif
+
+static const struct hda_codec_ops cs8409_cs42l42_patch_ops = {
+	.build_controls = cs8409_cs42l42_build_controls,
+	.build_pcms = snd_hda_gen_build_pcms,
+	.init = snd_hda_gen_init,
+	.free = cs_free,
+	.unsol_event = snd_hda_jack_unsol_event,
+#ifdef CONFIG_PM
+	.suspend = cs8409_suspend,
+#endif
+};
+
+/* Vendor specific HW configuration
+ * PLL, ASP, I2C, SPI, GPIOs, DMIC etc...
+ */
+static int cs8409_cs42l42_hw_init(struct hda_codec *codec)
+{
+	const struct cs8409_cir_param *seq = cs8409_cs42l42_hw_cfg;
+
+	for (; seq->nid; seq++)
+		cs_vendor_coef_set(codec, seq->cir, seq->coeff);
+
+	/* Reset CS42L42 */
+	cs8409_cs42l42_reset(codec);
+
+	/* Initialise CS42L42 companion codec */
+	cs8409_cs42l42_reg_setup(codec);
+
+	if (codec->fixup_id == CS8409_WARLOCK ||
+			codec->fixup_id == CS8409_CYBORG) {
+
+		/* FULL_SCALE_VOL = 0 for Warlock / Cyborg */
+		cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x2001, 0x01, 1);
+		/* DMIC1_MO=00b, DMIC1/2_SR=1 */
+		cs_vendor_coef_set(codec, 0x09, 0x0003);
+	}
+
+	return 1;
+}
+
+static int cs8409_cs42l42_fixup(struct hda_codec *codec)
+{
+	int err = 0;
+	struct cs_spec *spec = codec->spec;
+	unsigned int pincap = 0;
+
+	/* Basic initial sequence for specific hw configuration */
+	snd_hda_sequence_write(codec, cs8409_cs42l42_init_verbs);
+
+	/* CS8409 is simple HDA bridge and intended to be used with a remote
+	 * companion codec. Most of input/output PIN(s) have only basic
+	 * capabilities. NID(s) 0x24 and 0x34 have only OUTC and INC
+	 * capabilities and no presence detect capable (PDC) and call to
+	 * snd_hda_gen_build_controls() will mark them as non detectable
+	 * phantom jacks. However, in this configuration companion codec
+	 * CS42L42 is connected to these pins and it has jack detect
+	 * capabilities. We have to override pin capabilities,
+	 * otherwise they will not be created as input devices.
+	 */
+	_snd_hdac_read_parm(&codec->core,
+			CS8409_CS42L42_HP_PIN_NID, AC_PAR_PIN_CAP, &pincap);
+
+	snd_hdac_override_parm(&codec->core,
+			CS8409_CS42L42_HP_PIN_NID, AC_PAR_PIN_CAP,
+			(pincap | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
+
+	_snd_hdac_read_parm(&codec->core, CS8409_CS42L42_AMIC_PIN_NID,
+			AC_PAR_PIN_CAP, &pincap);
+
+	snd_hdac_override_parm(&codec->core,
+			CS8409_CS42L42_AMIC_PIN_NID, AC_PAR_PIN_CAP,
+			(pincap | (AC_PINCAP_IMP_SENSE | AC_PINCAP_PRES_DETECT)));
+
+	snd_hda_override_wcaps(codec, CS8409_CS42L42_HP_PIN_NID,
+			(get_wcaps(codec, CS8409_CS42L42_HP_PIN_NID) | AC_WCAP_UNSOL_CAP));
+
+	snd_hda_override_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID,
+			(get_wcaps(codec, CS8409_CS42L42_AMIC_PIN_NID) | AC_WCAP_UNSOL_CAP));
+
+	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
+
+	err = snd_hda_parse_pin_defcfg(codec, &spec->gen.autocfg, 0, 0);
+	if (err < 0)
+		return err;
+
+	err = snd_hda_gen_parse_auto_config(codec, &spec->gen.autocfg);
+	if (err < 0)
+		return err;
+
+	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
+
+	return err;
+}
+
+static int patch_cs8409(struct hda_codec *codec)
+{
+	struct cs_spec *spec;
+	int err = -EINVAL;
+
+	spec = cs_alloc_spec(codec, CS8409_VENDOR_NID);
+	if (!spec)
+		return -ENOMEM;
+
+	snd_hda_pick_fixup(codec,
+			cs8409_models, cs8409_fixup_tbl, cs8409_fixups);
+
+	codec_dbg(codec, "Picked ID=%d, VID=%08x, DEV=%08x\n",
+			codec->fixup_id,
+			codec->bus->pci->subsystem_vendor,
+			codec->bus->pci->subsystem_device);
+
+	switch (codec->fixup_id) {
+	/* Dell platforms with CS42L42 companion codec */
+	case CS8409_BULLSEYE:
+	case CS8409_WARLOCK:
+	case CS8409_CYBORG:
+
+		snd_hda_add_verbs(codec, cs8409_cs42l42_add_verbs);
+
+		codec->patch_ops = cs8409_cs42l42_patch_ops;
+
+		spec->gen.suppress_auto_mute = 1;
+		spec->gen.no_primary_hp = 1;
+
+		err = cs8409_cs42l42_fixup(codec);
+
+		if (err > 0)
+			err = cs8409_cs42l42_hw_init(codec);
+		break;
+
+	default:
+		codec_err(codec, "VID=%08x, DEV=%08x not supported\n",
+				codec->bus->pci->subsystem_vendor,
+				codec->bus->pci->subsystem_device);
+		break;
+	}
+	if (err < 0)
+		cs_free(codec);
+	else
+		snd_hda_codec_set_name(codec, "CS8409/CS42L42");
+
+	return err;
+}
 
 /*
  * patch entries
@@ -1229,6 +1771,7 @@ static const struct hda_device_id snd_hda_id_cirrus[] = {
 	HDA_CODEC_ENTRY(0x10134208, "CS4208", patch_cs4208),
 	HDA_CODEC_ENTRY(0x10134210, "CS4210", patch_cs4210),
 	HDA_CODEC_ENTRY(0x10134213, "CS4213", patch_cs4213),
+	HDA_CODEC_ENTRY(0x10138409, "CS8409", patch_cs8409),
 	{} /* terminator */
 };
 MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_cirrus);
-- 
2.25.1

