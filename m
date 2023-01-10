Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F653664D38
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 21:26:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5E1D783;
	Tue, 10 Jan 2023 21:26:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5E1D783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673382410;
	bh=MEejYbw8dcDa3DUGUZRzzPL8AkL59tjy8R6jRGsfjOY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=B/Z0YXlyURnJl0FjG9zbB7HrW+MYD2mRBM4Y6w3Cd9F7cWAo9NyTTtYzEqADbXcs1
	 CrApPbgW+WwwCnDhLxUxYghARFQeD8ssvmh9eACnYb30+Hl8hEEOcp7Cs08CXSA3+L
	 w7ls4nYxpY3XokQHPjfF8lh8FC9GzEodPcuv+MXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D15B2F800C7;
	Tue, 10 Jan 2023 21:25:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADD9FF804C1; Tue, 10 Jan 2023 21:25:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF382F8019B
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 21:25:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF382F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 secure) header.d=web.de header.i=@web.de header.a=rsa-sha256
 header.s=s29768273 header.b=EUhpdUXY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1673382343; bh=MEejYbw8dcDa3DUGUZRzzPL8AkL59tjy8R6jRGsfjOY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=EUhpdUXYDazSY+d+DIKtCqy+wnMJ4gNOh1emncoOsx8/B+KBabBVClaxt23kkLnIg
 b1kE9FdIwHcVQO2xDQ33ZKLmbozQs8IqPs/BrX7KkCxL1IAjwiIsi73Kq/HUggsKxO
 Kb0IZQFz5P5aUNyu1vd6cq+yqptDYNg7YsadJXD+rurmMQv/SQI/tV+jR/tpb/aqLa
 r4zY03204gEtGiqEaSUgoDUJePoBPsfijK92lVE0zeDyJdJJJnJ7z3MgMKaAlu6rqN
 5sq6kh/33qnX2OHMzE4vLjTEoNI3M++5ZxYmXYG7aCOhJWbztyupMvXgalXNMOL8e3
 OAr8Rz8FEU0cw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from luka-spectre.fritz.box ([93.129.44.167]) by smtp.web.de
 (mrweb005 [213.165.67.108]) with ESMTPSA (Nemesis) id
 1MVJRb-1pNHnc0G4l-00SRYv; Tue, 10 Jan 2023 21:25:43 +0100
From: Luka Guzenko <l.guzenko@web.de>
To: tiwai@suse.com
Subject: [PATCH v2] ALSA: hda/realtek: Enable mute/micmute LEDs on HP Spectre
 x360 13-aw0xxx
Date: Tue, 10 Jan 2023 21:25:14 +0100
Message-Id: <20230110202514.2792-1-l.guzenko@web.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/szKTTJvCAPwW11ClrWP49WM+KH1T+Wcs9r+r+84lKyxX0LdTXO
 90IyXQGm0GYJeqnkDxdxpxozHnsD7+xNQzqndUF01e/WtN/qjDpbEAwESEOOW32GCcXUTeV
 31cOopdhgcwya7/U4cSjqR2YcML2grX5HXcMO0Kxqp5xXW2fEH4KP9iNcV2W0RP+qeozqrw
 4yhGmPQnD4ami7787DqnQ==
UI-OutboundReport: notjunk:1;M01:P0:r4LwyxPvEaU=;WOmxJuurha2cxYvUQGQnyWuEmyK
 QuHDXk2NstbLqJdFrPHZBoW/xdpyhdMmJwNMRDpYlWTX0E8pSM+AI/in6YwdeIzeB0aLk/LO5
 hayymnhDDF1G5PFJSTqiLobVt8zSCf0YGv8L8lvlx7761Hd89LNmpayQXFh+X+N7z6sLf1Ds7
 hGHuFG5mAnrr3fO4zm2Fje/Pl+YloryxmK3nyv+JxnmBJB6RCS4KjNyVqkUBa0MAf3Y9PwfEq
 eULxkA1LaCmCGoWTyKEuH2douqptTreo+bVJj5bsTUcrQqWTHISU4ALZdwZa455+bDir+/oOK
 Ro1C6vOsRNHliwJlAUramQ+usvXSKNCtf16AI3EFDNA+k/R5AmwQi1iSbYabHZRT11V0x3nd3
 5rXr0+fJ5F1bQTZmTj65eVtf1WY2sls1v/A/Ty8cCT3qWvWSK26Dxi9OQkYybZIvGyWFsxi4R
 do097hl3p47GUrdD3yWTrFN4eXsD2GtL//6TA88Qs6pB3RZJuc+m5nX8cDlncyiRyJUUU8cef
 AZCiSSztMETX9s5inKm1h6TuohsUSAeysPW7trCjFQXq5/pwgSzYPrdRIYdroHVDLdfApry/T
 ctkiAvbRYLBqpUk7jksXPqfAN7wpgWqhU3NGl6t/RHXwp9fCOd7JUseylcGZz1nK6aYfbsNoA
 cwSYMDwnfI3oz4IaIy6GFRLPswF8Be2KfAa+BHUe88CBsIFHbEHXq4SvWBO6XGlQui3KbiwQB
 TsrzOOs4+xRW4dVBrdxvx1eRuml3D+7nS2BBDaLKbkrj7gJAuG6ODS4sO2kJzmYVIJ0aYu0hI
 F+70opmPkJ4mup3mX8E4QCCwvhOSV8/r/lTeSdPmJVHF93XVFabvx3ywTmhCGtbmyR378Tp+O
 s6r1O5q3Qy8mgLTXbYhGie2I1vwAolyfRXbM8y609tjElCiF8XVAJhlvN66T286+fguAn1PwY
 l3GDOg==
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
A quirk was added to make these work as well as a fixup.

Signed-off-by: Luka Guzenko <l.guzenko@web.de>
=2D--
V1 -> V2: Inverted the conditional statement in
	  alc285_fixup_hp_gpio_micmute_led as suggested by Takashi Iwai

 sound/pci/hda/patch_realtek.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3794b522c222..dc4b07a0c240 100644
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
+	if (action =3D=3D HDA_FIXUP_ACT_PRE_PROBE)
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

