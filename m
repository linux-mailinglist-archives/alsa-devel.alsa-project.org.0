Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E358221BE
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:08:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F09C1E7A;
	Tue,  2 Jan 2024 20:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F09C1E7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222485;
	bh=E7Q60s3IwDmLJ+2sCyI4vtSF/n26s1n/OwmYrM7vSNk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G1sdUwKy1PvFeSAMpI4nO4Lm+KsTaEAZ32c2EJsyoCcWIjVBx8oEX5uyMqTB75PQX
	 /1w0W7J0YQ1YW9NUEFmfjoBIFVtqWdGwFwEzMiAsoDM9q8DXLxEoMNKB2nLLZKYOW0
	 boeMn8g+f0CCREwpBy1iYcB6kJzteZXSsjYl31B8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F3E1F8060F; Tue,  2 Jan 2024 20:06:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9409EF805FF;
	Tue,  2 Jan 2024 20:06:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06587F8065A; Tue,  2 Jan 2024 19:59:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 1D3D1F8067D
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 19:54:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D3D1F8067D
Received: from fedori.lan (51b6838a.dsl.pool.telekom.hu
 [::ffff:81.182.131.138])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000720A0.00000000658F5FD1.0014D4C3;
 Sat, 30 Dec 2023 01:09:53 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v2 4/4] ALSA: hda/tas2781: add fixup for Lenovo 14ARB7
Date: Sat, 30 Dec 2023 01:09:45 +0100
Message-ID: 
 <abce9ee55689523562feb72383377171a489ddc7.1703891777.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703891777.git.soyer@irl.hu>
References: <cover.1703891777.git.soyer@irl.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: V2RBLABF3O7IOLQU7DOC36CH2F2DRRR5
X-Message-ID-Hash: V2RBLABF3O7IOLQU7DOC36CH2F2DRRR5
X-MailFrom: soyer@irl.hu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V2RBLABF3O7IOLQU7DOC36CH2F2DRRR5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The 14ARB7 has two tas2563 amplifier on i2c.
Connect it to the tas2781 driver.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/patch_realtek.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 19040887ff67..67468f7d1c90 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6989,6 +6989,12 @@ static void tas2781_fixup_i2c(struct hda_codec *cdc,
 	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
 }
 
+static void yoga7_14arb7_fixup_i2c(struct hda_codec *cdc,
+	const struct hda_fixup *fix, int action)
+{
+	 tas2781_generic_fixup(cdc, action, "i2c", "INT8866");
+}
+
 /* for alc295_fixup_hp_top_speakers */
 #include "hp_x360_helper.c"
 
@@ -7460,6 +7466,7 @@ enum {
 	ALC236_FIXUP_DELL_DUAL_CODECS,
 	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
 	ALC287_FIXUP_TAS2781_I2C,
+	ALC287_FIXUP_YOGA7_14ARB7_I2C,
 	ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
 	ALC245_FIXUP_HP_X360_MUTE_LEDS,
 	ALC287_FIXUP_THINKPAD_I2S_SPK,
@@ -9578,6 +9585,12 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
 	},
+	[ALC287_FIXUP_YOGA7_14ARB7_I2C] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = yoga7_14arb7_fixup_i2c,
+		.chained = true,
+		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
+	},
 	[ALC245_FIXUP_HP_MUTE_LED_COEFBIT] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc245_fixup_hp_mute_led_coefbit,
@@ -10231,6 +10244,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3853, "Lenovo Yoga 7 15ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3855, "Legion 7 16ITHG6", ALC287_FIXUP_LEGION_16ITHG6),
 	SND_PCI_QUIRK(0x17aa, 0x3869, "Lenovo Yoga7 14IAL7", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
+	SND_PCI_QUIRK(0x17aa, 0x3870, "Lenovo Yoga 7 14ARB7", ALC287_FIXUP_YOGA7_14ARB7_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x387d, "Yoga S780-16 pro Quad AAC", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x387e, "Yoga S780-16 pro Quad YC", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x3881, "YB9 dual power mode2 YC", ALC287_FIXUP_TAS2781_I2C),
-- 
2.43.0

