Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A70958535F
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 18:22:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F41BD1651;
	Fri, 29 Jul 2022 18:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F41BD1651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659111748;
	bh=1gnbIMRmU0bN+8npKGl6pLy9YFh6OUOE+s325fiA1QY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XwqqmLfDtsrdd989zjNqg5mUtrzVlDhBrbd9nG1Nbr2zO+RIVsh7Q4OfUn9NCsoco
	 XTksWM4UtgBKcLAqla92+xtPp46eBTMkUoJA/FkcHu7FFibvmfngMAecRXYQmVu2GG
	 RwiEhRmQ0jSYgqClHYBy36LQOO4ona9OfgdacQPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DC7DF804B1;
	Fri, 29 Jul 2022 18:21:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3058F8049C; Fri, 29 Jul 2022 18:21:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C814AF800BD
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 18:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C814AF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="DHx0K5xU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659111682;
 bh=1gnbIMRmU0bN+8npKGl6pLy9YFh6OUOE+s325fiA1QY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=DHx0K5xUrrxjp1zP3wunaCON4gb6ctEIg4MI5Kv36h7rxjfyhiBlTCCGxLdxyQz7V
 B330QaCjj1RgDyptet95vHB64Zxm4N5RlKdhjry9Paf7iqtsQxEKFS5cdiE4zzWOPL
 IPwTU0h84emhh/r/fsvZOgwMDgm1684uwKokulI8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from yoga9.fritz.box ([93.238.92.22]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9o1v-1oL3e30L7F-005uKj; Fri, 29
 Jul 2022 18:21:22 +0200
From: Philipp Jungkamp <p.jungkamp@gmx.net>
To: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH v2] ALSA: hda/realtek: Add quirk for Lenovo Yoga9 14IAP7
Date: Fri, 29 Jul 2022 18:21:03 +0200
Message-Id: <20220729162103.6062-1-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MfWnnAooXWBIjsLbDQgxYNngP5E43MVQUweerDOCbD1X216ucW1
 kHxMAFhy9RxiHDUkvPxPUpyIb320MAFdC+367wokcafmY4/SZQgSV7hXkVzVWDAg1VUqSVa
 LL7wm+xwEwxw7IA2knxBHj7xfuv/Ic3Nc8oY0Y3KOua5U2zYomMFjDiSOWsEIsruZmfkP0i
 osap/8RkbpG0qIddr22tA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ymBQebVr3EA=:s0uC5NBpKNrA0EPOvlWKyz
 zBmQH7dknbWpH/WpS5QVKmFYsbOJ0VACqOEIsnDtUkvtf4JaUIWfTVD1Ju9+81NEOLlNk7Tq8
 YpKB+EWNYZPj3klL70OvKjGDHZlUOK6eOSAunUturedJ4W2uE/pO/Ee9dcwQHUrDzOy3cmOSy
 s6mL290/yUefrDNEeWjt265PS9nSnKn94AUj+mJsXRdaSHkcO4Buf5jY1uAgkCiH4HxhQuufP
 u9pI5SjF+Cx/Zidhuq/NDVCXcNJge8cFZkPtvLWiBUU1BFfmNp1f3Tz2uKNpvPrhq4nphQoxK
 4YhG8TtVNr2+b4gv+QDJW3FdF/jzXvckEn8kKZmRTMyd4Xs7/JgmhEGJ0yvlUXa4GSnzqbqDe
 iYI+eo21HFZlFZ+Q+2fcHFsAREbXT1dY+JmUQ27UeUpQPMJ01O+i+VFYsF+ABv+Y56EbN4Phc
 yw3SNi1BhP47r/jMI7MWSbUgChFRqEiT0OY+JlSuK0rvRC9gWybEF/ahC49nf02UUSaUdkVJQ
 x8u/lTYg9MIrZDnJM7ToDifFDxntEaOuZGKmsTcz8QbwVlbokRoI0NLd9jtP5t/X89AvsWa1a
 FJ490+MhkAmDDk7nvHZQ+udaR3L5fm0PvjrEnYSxu3W8aovvK20ynYJPEhk8lwVWNp4SPzUQ7
 Zo7sWPNcNLyEK2UVTh3xgtyi1TguucU7eY1bOcbYEJHjghgyVsfQDipkKUfpq66soMsTDaLXr
 VBPxKvP3twPOJjcGL7sFSATQUI5Lc66DpF18i2+9+/gTUAc5VHu3AvKOI6vFOzeIosBFJfvmO
 nL1T/c65ZTL18wYx74EAlCfPjWAznstUL8n+lGoT4ju13soZNQ+vDrKkRitXigAXmeNCpFqXd
 rIo7uEphhXGviT/iyW9g9n9k+252QDiw4+e3BhZ0d5h+uYefdLOowmG7NWFG4zLmtKyJ1NYul
 Ur9VM/HnlZ0UudGF7KrFNmSnw6VMoN6prdKRx9PG6d/wfdU1UNDrAgB6s2PekIgeQCvP+cjjg
 TVZvCYIlEA/3yj2gKMaEzWMWCDwxb3qP1Jh1mODeAknjLOy4GP5ns6YtFFt8yMrinmrd1zT8L
 q00GJWBp6hgMB56rOfPQF+H9eLnOt8FLVAu2kguDy5qX4d1J+TZw1zb2A==
Cc: alsa-devel@alsa-project.org, Philipp Jungkamp <p.jungkamp@gmx.net>
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

The Lenovo Yoga 9 14IAP7 is set up similarly to the Thinkpad X1 7th and
8th Gen. It also has the speakers attached to NID 0x14 and the bass
speakers to NID 0x17, but here the codec misreports the NID 0x17 as
unconnected.

The pincfg and hda verbs connect and activate the bass speaker
amplifiers, but the generic driver will connect them to NID 0x06 which
has no volume control. Set connection list/preferred connections is
required to gain volume control.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D208555
Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
=2D--
The HDA verbs now use AC_VERB_SET_COEF_INDEX and AC_VERB_SET_PROC_COEF
instead of 0x500 and 0x400.

 sound/pci/hda/patch_realtek.c | 109 ++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2f55bc43bfa9..6c4e9994d99c 100644
=2D-- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6787,6 +6787,43 @@ static void alc_fixup_dell4_mic_no_presence_quiet(s=
truct hda_codec *codec,
 	}
 }

+static void alc287_fixup_yoga9_14iap7_bass_spk_pin(struct hda_codec *code=
c,
+					  const struct hda_fixup *fix, int action)
+{
+	/*
+	 * The Pin Complex 0x17 for the bass speakers is wrongly reported as
+	 * unconnected.
+	 */
+	static const struct hda_pintbl pincfgs[] =3D {
+		{ 0x17, 0x90170121 },
+		{ }
+	};
+	/*
+	 * Avoid DAC 0x06 and 0x08, as they have no volume controls.
+	 * DAC 0x02 and 0x03 would be fine.
+	 */
+	static const hda_nid_t conn[] =3D { 0x02, 0x03 };
+	/*
+	 * Prefer both speakerbar (0x14) and bass speakers (0x17) connected to D=
AC 0x02.
+	 * Headphones (0x21) are connected to DAC 0x03.
+	 */
+	static const hda_nid_t preferred_pairs[] =3D {
+		0x14, 0x02,
+		0x17, 0x02,
+		0x21, 0x03,
+		0
+	};
+	struct alc_spec *spec =3D codec->spec;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		snd_hda_apply_pincfgs(codec, pincfgs);
+		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
+		spec->gen.preferred_dacs =3D preferred_pairs;
+		break;
+	}
+}
+
 enum {
 	ALC269_FIXUP_GPIO2,
 	ALC269_FIXUP_SONY_VAIO,
@@ -7023,6 +7060,8 @@ enum {
 	ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED,
 	ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED,
 	ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE,
+	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
+	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
 };

 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -8865,6 +8904,74 @@ static const struct hda_fixup alc269_fixups[] =3D {
 		.chained =3D true,
 		.chain_id =3D ALC269_FIXUP_HEADSET_MODE_NO_HP_MIC
 	},
+	[ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK] =3D {
+		.type =3D HDA_FIXUP_VERBS,
+		.v.verbs =3D (const struct hda_verb[]) {
+			// enable left speaker
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x41 },
+
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xc },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x1a },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xf },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x42 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x10 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x40 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			// enable right speaker
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x24 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x46 },
+
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xc },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x2a },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xf },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x46 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x10 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x44 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x26 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x2 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x0 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0xb020 },
+
+			{ },
+		},
+	},
+	[ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN] =3D {
+		.type =3D HDA_FIXUP_FUNC,
+		.v.func =3D alc287_fixup_yoga9_14iap7_bass_spk_pin,
+		.chained =3D true,
+		.chain_id =3D ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
+	},
 };

 static const struct snd_pci_quirk alc269_fixup_tbl[] =3D {
@@ -9315,6 +9422,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]=
 =3D {
 	SND_PCI_QUIRK(0x17aa, 0x3176, "ThinkCentre Station", ALC283_FIXUP_HEADSE=
T_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x3178, "ThinkCentre Station", ALC283_FIXUP_HEADSE=
T_MIC),
 	SND_PCI_QUIRK(0x17aa, 0x31af, "ThinkCentre Station", ALC623_FIXUP_LENOVO=
_THINKSTATION_P340),
+	SND_PCI_QUIRK(0x17aa, 0x3801, "Lenovo Yoga9 14IAP7", ALC287_FIXUP_YOGA9_=
14IAP7_BASS_SPK_PIN),
 	SND_PCI_QUIRK(0x17aa, 0x3802, "Lenovo Yoga DuetITL 2021", ALC287_FIXUP_Y=
OGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3813, "Legion 7i 15IMHG05", ALC287_FIXUP_LEGION_=
15IMHG05_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3818, "Lenovo C940 / Yoga Duet 7", ALC298_FIXUP_=
LENOVO_C940_DUET7),
@@ -9560,6 +9668,7 @@ static const struct hda_model_fixup alc269_fixup_mod=
els[] =3D {
 	{.id =3D ALC285_FIXUP_HP_SPECTRE_X360, .name =3D "alc285-hp-spectre-x360=
"},
 	{.id =3D ALC285_FIXUP_HP_SPECTRE_X360_EB1, .name =3D "alc285-hp-spectre-=
x360-eb1"},
 	{.id =3D ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP, .name =3D "alc287-ideapad-ba=
ss-spk-amp"},
+	{.id =3D ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN, .name =3D "alc287-yoga9=
-bass-spk-pin"},
 	{.id =3D ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name =3D "alc623-lenovo=
-thinkstation-p340"},
 	{.id =3D ALC255_FIXUP_ACER_HEADPHONE_AND_MIC, .name =3D "alc255-acer-hea=
dphone-and-mic"},
 	{.id =3D ALC285_FIXUP_HP_GPIO_AMP_INIT, .name =3D "alc285-hp-amp-init"},
=2D-
2.37.1

