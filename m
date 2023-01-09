Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCDA663B4B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 09:37:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 660A09A34;
	Tue, 10 Jan 2023 09:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 660A09A34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673339872;
	bh=FMcjA51wpzoraSDLjxsaLpmF0naPwUP70E0dsefK2kE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ne0EpiEaMPVQclF+KdGLIUIVXI++UV0sUBkuLADx/TGrqPjKmaNGNT32AJp/kOArj
	 qKQuLlAYyOGbfQWw0i+IMtGGoS9Ya1E/4jnD7iHEZTzUyufltQ4xRqLiRE6Cdu1fuE
	 RbFgf1zb2Q8PNSLKpVbworogJy7mIQyzqd0POsww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C370BF805BD;
	Tue, 10 Jan 2023 09:32:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B78FDF802BE; Tue, 10 Jan 2023 00:59:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52E63F800C7
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 00:59:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52E63F800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=s29768273 header.b=NbrIC3v4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1673308738; bh=FMcjA51wpzoraSDLjxsaLpmF0naPwUP70E0dsefK2kE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=NbrIC3v4a9JK1+VGa/iF+OJMNNgwwbr5/9+6WqgaTSYBnndWJ1QraPOFr/KNPucw8
 WSqa6XlXlQfJ/Ozs2j0YXBWn43rpSeUVtotji1s3bVcvvvg91wvH1PdHoZEoDO3YoQ
 UBJ/QiBjEefElAcJuLUYfWHRVEXZOWrrdxNOEtQ+NLcjze47U69VnleNzn9qcy496c
 kTQmSQ1y48qinlUfm98mQGGh2Kzd1D9oO1Xy1Mr4cHg0vF1qFDRGl3Q5rh0J7HUI8b
 lTkHDMuvUg4vLcHPxtSxBhFILeNHBjtRY1EARUnXjNayua7CwALxfpPB4DzquYMxwn
 9WJ3hWfwHmLVg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from luka-spectre.fritz.box ([77.180.184.175]) by smtp.web.de
 (mrweb006 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MxYXF-1or3992FVh-00xcIG; Tue, 10 Jan 2023 00:58:58 +0100
From: Luka Guzenko <l.guzenko@web.de>
To: tiwai@suse.com
Subject: [PATCH] ALSA: hda/realtek: Enable mute/micmute LEDs on HP Spectre
 x360 13-aw0xxx
Date: Tue, 10 Jan 2023 00:58:40 +0100
Message-Id: <20230109235840.26452-1-l.guzenko@web.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XouvoeaEbNqWsNABGNhUZH/5qo2PXjBy/mxzbDIEJNW6259sGQg
 KSGr0Ds2MNYakBIeGzHn7hOdD79CoKopik/RnSF374hafAZGwP5U05njMd3x5PGbzf0kKSx
 au3xD3a2JTTmdoKWzZ4ilqh7cvoflxoHm4RwNhZYfRcgoCZLKGrfLjkzmY8OdDIKwpaGd/M
 L0+saHHyjiudMaIzMFvMQ==
UI-OutboundReport: notjunk:1;M01:P0:1jhPLbLZR4k=;CsQR9QSobUElphVxrW7w7TsPNx5
 LMo1MAkiKVCtl6fG1on8BaoMHDCuES4ge+kHT9KPiDBwX6CZQkiKWbaJLvmb7Eswc8M/bCOFj
 ma3Ru8mInsVOW16B6pbLpfvEo5T8LQOFnyxkSyhiLRGJbsSxUY47MEeGFlATlp/k4fSEGOjm+
 U46FYZuzCJ295yRHQ4ud48aee4asuxNnk5sw/tRNwFvvWGuduLeWyNO96yf24A9n074ZBxlM8
 mKbe+2iuJbaujMjuPx+U/GvAeqa2fJfPyTPfZQlWW5zguNAS5gNxXyLD1WoGsy6/5qVrCfZxp
 zqpYpBmvHmkNgFDQWdjqNC4r/MqHnqrzckQ7g0dKwPzlf4h/b0SGQpmHo/Q5UIPVwFWLTVqf8
 9swkv8M+fG4irmdiQFoqh5sMHtYCV8qxkrVkejg1kcGscqHsMr86CSKKyb7h37z75oy54o1ED
 3xb+tT+gIn9/QDOve6NvRH/cOAmxNDNRUg1iRJPjy5kWA8vKbLNvdSjbeJj/4zQcL7ssLMQbP
 1WqzO047Z7uZMG9Srw1UQtuwqGtb9HaS1wbtu1Dt2gnHh0bjOitajE2SGFf0Xaji4xSUXNXTX
 HpzgAoTrxObn9+8LJzLoKecQL1cM+wqtrwIeOQ/Cvy2WvvxL1MwUw1tfuv0Gu5HA//9aZ7PTF
 hgOkECqbQkt4VQ4WNpLyocedNfOfrQRyFaG5KmuOJ2KC+CL6ye/cHD5qyq5T9zYHd1GdEx9Kg
 LJHfmC3+xSx5x3B1L9wBYxfmFvu8LW1l6Y2SED9dGb2d8FzrTkrolmj4M/t1dsHKmlWcKW78R
 Cj5qx2u8SUKE6adH1Wa6ioHGto8ub1f/BajikPw3doz7gY0UFPB8zxPhojIvFMCbuLM/txjyH
 2IEmsAKp802hXHbdjOkpr2P799t4jSXWf0ygJgdAaahktYlDIW0NHKpMnZvHwze2BNo5/xoR6
 /dpydtvozCZ2VYXchV9ykvLq9ZQ=
X-Mailman-Approved-At: Tue, 10 Jan 2023 09:32:36 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Luka Guzenko <l.guzenko@web.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The HP Spectre x360 13-aw0xxx devices use the ALC285 codec with GPIO 0x04
controlling the micmute LED and COEF 0x0b index 8 controlling the mute LED=
.
A quirk was added to make these work as well as a fixup entry.

Signed-off-by: Luka Guzenko <l.guzenko@web.de>
=2D--
 sound/pci/hda/patch_realtek.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3794b522c222..6a76a2eddd3c 100644
=2D-- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4644,6 +4644,16 @@ static void alc285_fixup_hp_coef_micmute_led(struct=
 hda_codec *codec,
 	}
 }

+static void alc285_fixup_hp_gpio_micmute_led(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec =3D codec->spec;
+
+	if (action !=3D HDA_FIXUP_ACT_PRE_PROBE)
+		spec->micmute_led_polarity =3D 1;
+	alc_fixup_hp_gpio_led(codec, action, 0, 0x04);
+}
+
 static void alc236_fixup_hp_coef_micmute_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -4665,6 +4675,13 @@ static void alc285_fixup_hp_mute_led(struct hda_cod=
ec *codec,
 	alc285_fixup_hp_coef_micmute_led(codec, fix, action);
 }

+static void alc285_fixup_hp_spectre_x360_mute_led(struct hda_codec *codec=
,
+				const struct hda_fixup *fix, int action)
+{
+	alc285_fixup_hp_mute_led_coefbit(codec, fix, action);
+	alc285_fixup_hp_gpio_micmute_led(codec, fix, action);
+}
+
 static void alc236_fixup_hp_mute_led(struct hda_codec *codec,
 				const struct hda_fixup *fix, int action)
 {
@@ -7106,6 +7123,7 @@ enum {
 	ALC285_FIXUP_ASUS_G533Z_PINS,
 	ALC285_FIXUP_HP_GPIO_LED,
 	ALC285_FIXUP_HP_MUTE_LED,
+	ALC285_FIXUP_HP_SPECTRE_X360_MUTE_LED,
 	ALC236_FIXUP_HP_GPIO_LED,
 	ALC236_FIXUP_HP_MUTE_LED,
 	ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF,
@@ -8486,6 +8504,10 @@ static const struct hda_fixup alc269_fixups[] =3D {
 		.type =3D HDA_FIXUP_FUNC,
 		.v.func =3D alc285_fixup_hp_mute_led,
 	},
+	[ALC285_FIXUP_HP_SPECTRE_X360_MUTE_LED] =3D {
+		.type =3D HDA_FIXUP_FUNC,
+		.v.func =3D alc285_fixup_hp_spectre_x360_mute_led,
+	},
 	[ALC236_FIXUP_HP_GPIO_LED] =3D {
 		.type =3D HDA_FIXUP_FUNC,
 		.v.func =3D alc236_fixup_hp_gpio_led,
@@ -9327,6 +9349,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]=
 =3D {
 	SND_PCI_QUIRK(0x103c, 0x86c7, "HP Envy AiO 32", ALC274_FIXUP_HP_ENVY_GPI=
O),
 	SND_PCI_QUIRK(0x103c, 0x86e7, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_=
HP_SPECTRE_X360_EB1),
 	SND_PCI_QUIRK(0x103c, 0x86e8, "HP Spectre x360 15-eb0xxx", ALC285_FIXUP_=
HP_SPECTRE_X360_EB1),
+	SND_PCI_QUIRK(0x103c, 0x86f9, "HP Spectre x360 13-aw0xxx", ALC285_FIXUP_=
HP_SPECTRE_X360_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8716, "HP Elite Dragonfly G2 Notebook PC", ALC28=
5_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8720, "HP EliteBook x360 1040 G8 Notebook PC", A=
LC285_FIXUP_HP_GPIO_AMP_INIT),
 	SND_PCI_QUIRK(0x103c, 0x8724, "HP EliteBook 850 G7", ALC285_FIXUP_HP_GPI=
O_LED),
=2D-
2.39.0

