Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 353CE586D2E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 16:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37F7D8;
	Mon,  1 Aug 2022 16:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37F7D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659365109;
	bh=KQfM3IIeO8JaA83zurWqxinCFxU2tyANd04g1TA0ang=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sP3aPGk75Y3Hiqdy/GL71+MrEGQ+gaU/FJCd3VxyIDslMg7/Qd/JPKKj1Hvgh9slv
	 OhfjhSfOCPLKstn3rXpfNEGhpzXjYCnFGdvbsw3WMCBodRG9FYzm7YL6HpxqqOQfE7
	 5aEgC6Yau1yVFhgS2FDlcDiumVgjqaPw8TdxcLnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07C44F80246;
	Mon,  1 Aug 2022 16:44:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1824F8049C; Fri, 29 Jul 2022 16:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27AF6F8015B
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 16:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27AF6F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="lNEQybRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1659104250;
 bh=KQfM3IIeO8JaA83zurWqxinCFxU2tyANd04g1TA0ang=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=lNEQybRO2rpJobXOhxy0bgWU38hkg2uh45dVc4NJ0lH/dLVsgWlX4UmJfskpQ/mb+
 zvQr4WCbput7Au4juuCWulxWcuVKHOdsIyWS8hL3KZjh3WZLKb8rOTK10rJ1I40Uj1
 mIHgf49dxos0YpLtKpWccR1t9/bXxYo/BWWTRG+U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from yoga9.fritz.box ([93.238.92.22]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1wpt-1nJVcB0Npp-012K3O; Fri, 29
 Jul 2022 16:17:30 +0200
From: Philipp Jungkamp <p.jungkamp@gmx.net>
To: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH] ALSA: hda/realtek: Add quirk for Lenovo Yoga9 14IAP7
Date: Fri, 29 Jul 2022 16:17:22 +0200
Message-Id: <20220729141722.566771-1-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:212fBHz6O0Q9c4py/HsFh+bhj/U/coYId2FeMJ8JEtyH1eiBNvY
 hRkB+xxuUwDCePWPnrWYS54KSSjHEP+S6FyUDCbhoaVTk9IBUXfaPBMQLNQ5aEqBxS0TlTO
 +SfNQE2GASiOQpO91K3+rTDEgaCeokvIHbt1IUpef7Z/ONcUhEsAqXETO/IqpZciNLcR/yB
 QTP1nWZrGBtg4QhVuE0dw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H7GLwSxZSv0=:wfqvczXYi+AtXD6fdpiwXR
 HVIdeF/3Yfff1/WicywureHYKjrA935GRYVTH/LNT0j44NgJaOqvmD9sd96pE2bgEeWKyrAyQ
 nTanNZmNp8AvcqvuqgHfHRUAM28Xhg2dDRC7PJT+egb8E7Ey5BEdVnzFKURQnRFjs+ijsHzNa
 u2gL0d7vf1w1lq5VyWMRxQULxDI6Cng7c9skuyTEcG5UN5BqRShcp0C6Hj61+GodB/3RJlb8x
 e5UWNSvbLaYPHuu8m221+BST8oY8i6QFb9iQeY3PpoAQG2aY2FZizc4B5sSnSALFB9CJPwJNy
 XShfuev1HX2LFTIYHBICFsyWqq7trx7hl6PUvAsoupIZiVd8QRW3oGCnjEld2HXzmCo/lNUee
 4HuSkcp87wda0Kvsc/kLGnTko4Env8TGdCGwUzD5u/kJ9ZtiZQ/z98XY/r84eKiuq7hLVEM5W
 pytBh8SdpFa3j60PGjfk0WFhyg1fOzV+wEkBhr3l75HUS2VM4q+QBXJD8hbihTy09YIX5RH7Q
 Wc02DMOCV5SdnnCRaElrrITXwT7xddGKrLlcMNoRRGphqfSnf9X//Pxc3QOL/Q9/rQ6nA7AK4
 O4gzvp44zbCXT3kJof0UHDbhFyQ3G/JRVWgAyZmxVlDa/HEvyQDicWnGt0rV5aSauqk1buLLc
 5McA7YgaJ/k3Zp9dxBuf8B07cCvAz5lP7HFQHnapiLFoKNFiW/+XAjYw9yqHs7dynIpLeE9gp
 y/PplCcEEVUbmuYI5aFgXdaqXLDwDO9t7SDRoIP2BAX6xLrDYNpcEd/Q1F0O/nSrL8ZqYMNqL
 zY58EtipiMRIKAQZzz3ucJ4+LSX2Dwu4qrZrg49TXE1PlRJPkZUyLBppdE2PtfMCDTwX0lFu5
 zj29Uq4pBdKAOQNGR7o2fh1Xn6428Qw6COleZw5z98La+SwGmAvGsWw3VmKGmLmnh9N+zstgU
 N7SYgYIwyvmVVShqWSk4gtFCF3bdzAJL6087MHnJSfEFwKIX1oQ8FM/ZPTrznXib7u35L+ohx
 JMILv9XtTzdVWMXwsYEiJyCLUaVwQQXAnD/RM7DIMRsOERiIG96PME4TTbWWFWZq2/uPOgXHJ
 pcl+bNAakw1kVWG9SQGBBhaFTC+AyTuUi1YBwfQ7SGUoWrMN76KQVbZFQ==
X-Mailman-Approved-At: Mon, 01 Aug 2022 16:44:10 +0200
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
 sound/pci/hda/patch_realtek.c | 109 ++++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2f55bc43bfa9..fe1a4212dbc3 100644
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
+			{ 0x20, 0x500, 0x24 },
+			{ 0x20, 0x400, 0x41 },
+
+			{ 0x20, 0x500, 0x26 },
+			{ 0x20, 0x400, 0xc },
+			{ 0x20, 0x400, 0x0 },
+			{ 0x20, 0x400, 0x1a },
+			{ 0x20, 0x4b0, 0x20 },
+
+			{ 0x20, 0x500, 0x26 },
+			{ 0x20, 0x400, 0xf },
+			{ 0x20, 0x400, 0x0 },
+			{ 0x20, 0x400, 0x42 },
+			{ 0x20, 0x4b0, 0x20 },
+
+			{ 0x20, 0x500, 0x26 },
+			{ 0x20, 0x400, 0x10 },
+			{ 0x20, 0x400, 0x0 },
+			{ 0x20, 0x400, 0x40 },
+			{ 0x20, 0x4b0, 0x20 },
+
+			{ 0x20, 0x500, 0x26 },
+			{ 0x20, 0x400, 0x2 },
+			{ 0x20, 0x400, 0x0 },
+			{ 0x20, 0x400, 0x0 },
+			{ 0x20, 0x4b0, 0x20 },
+
+			// enable righ speaker
+			{ 0x20, 0x500, 0x24 },
+			{ 0x20, 0x400, 0x46 },
+
+			{ 0x20, 0x500, 0x26 },
+			{ 0x20, 0x400, 0xc },
+			{ 0x20, 0x400, 0x0 },
+			{ 0x20, 0x400, 0x2a },
+			{ 0x20, 0x4b0, 0x20 },
+
+			{ 0x20, 0x500, 0x26 },
+			{ 0x20, 0x400, 0xf },
+			{ 0x20, 0x400, 0x0 },
+			{ 0x20, 0x400, 0x46 },
+			{ 0x20, 0x4b0, 0x20 },
+
+			{ 0x20, 0x500, 0x26 },
+			{ 0x20, 0x400, 0x10 },
+			{ 0x20, 0x400, 0x0 },
+			{ 0x20, 0x400, 0x44 },
+			{ 0x20, 0x4b0, 0x20 },
+
+			{ 0x20, 0x500, 0x26 },
+			{ 0x20, 0x400, 0x2 },
+			{ 0x20, 0x400, 0x0 },
+			{ 0x20, 0x400, 0x0 },
+			{ 0x20, 0x4b0, 0x20 },
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

