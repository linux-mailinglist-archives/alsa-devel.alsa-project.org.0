Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF75B8206
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 09:29:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ABD21811;
	Wed, 14 Sep 2022 09:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ABD21811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663140577;
	bh=9L9CgvzeZD2dVPAKr51Own7PFKetJldhmKUIO3fqkNk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FByxqxI2IhlIQB7bnH6xEfUvlBna601OZzJ/lh2a0+0Ggw5GEtKMM/g/bRMFGvgXR
	 hqKVKh38ip0oKVfe4TBRtmvkaTAABLQZWn239y+6N0kVZIzL5kx+FitfP5EHcAAWvS
	 Uu3nhf3fPqIFISwMNhIYqM5CO9DbueCUw+pYWAlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78ECAF8014B;
	Wed, 14 Sep 2022 09:28:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EA8AF8014E; Wed, 14 Sep 2022 09:28:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0392CF800FE
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 09:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0392CF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="N6mPrcwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1663140509;
 bh=9L9CgvzeZD2dVPAKr51Own7PFKetJldhmKUIO3fqkNk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=N6mPrcwVmZORdV5AcCREBpxSWIxTrEJSUGW0awOlNHz2RNTO6uIbp6q63HjjoND2T
 dD+OmfoaEkS6kx0ljG0/PrkXQTG+qir80AjuY87vHaQ5vBkjONWxny7WWToyOFiBcH
 koqgIgx7PjkXtGNrO95puEV8oMOd7qi1zrCVbtTU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from yoga9.fritz.box ([87.123.204.248]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MUXtS-1ohGnt1duy-00QUfV; Wed, 14
 Sep 2022 09:28:29 +0200
From: Philipp Jungkamp <p.jungkamp@gmx.net>
To: tiwai@suse.com
Subject: [PATCH] ALSA: patch_realtek: Fix Dell Inspiron Plus 16
Date: Wed, 14 Sep 2022 09:28:04 +0200
Message-Id: <20220914072804.39046-1-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Dts4Imt3TDflGgacPvDjzDMjnpd/ElyNwR8rG0Ll/b/vyvuF/+J
 QxnhRrQJ4L8b2TuwjO1Ig88WbnOdDPt7b/mD9l4JPZErtBrElW49B6tfwGKB0PTguItnA5H
 PhJiUZFzQJlop0wuUcXAcbezUR76QBhbn13C/xZ9CkuBOCBqHfpTHl14U3Jhrxs69jqZo+z
 5S3QhG/sC0utVb8yQMFPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NTYlFirVEbQ=:cKXdZW0gxYLULTrnmhgyYe
 deXcuwPScr54AweWgw3gDOPD5VwqZgVawzbftsR6yIBxHIeDK6+KS/HB+5+QIq448W33CZVGS
 J9XWdr5lSg0IIGyiNuJSKn7SZLsDbeTzPHmRXjc+QEySLP53r5w3HrZxP9pyd3JenUuiFsgji
 memhPZfptJTv6CUDxvflGRPKk74HItUyir57VsLZiPpImyfKMBVrqmIIUv1chc4aEDLDFSqJD
 bSpn08MxUyzrs5FaUNwxvqWXOkYebSCcSOwjqnDYh5pYTz8bC23bK8UxNujb2XQfELgWDUOPp
 BKjo3BA3p+GxAt79jSyJ552k5t8ntGxmvqzqQVvWwUhF2SyG7a/fb5S0bnjUvOeGB/21PiyVY
 zksFUPkHdQHqe4NGhU2imW2L2fqNdvMIuzD6MXCyBtOvYUoDcVcv1LEkZIBl7Ti1BaWvMo/Kc
 5vCbTU8l7pbsYLeIvK3YjK1SB/bbl3RUjjMDIxD6KIG5KRU2JyeorK3D/SksHmtdzp1NJkQs2
 as6fU3Y59ZgaPhmaQ7P8D1wxpCjR7JHeqY1IHO7iAaGJextSgzayczNMi9pBXA0kMr6BXMRh0
 elYmGfIpwVaqkEJ0qj0lkmK0R51vMMgM/+/OcTwq1td3YcMhHPbAoUAZ+uOaQpwY3pYMlBD6D
 wtRpUdbD/sizvX3aoTZWplATgQqJmAa8VyxaB+bkR8Rs1g70UJq6sjItEU6sU0374jVyeJNpw
 SWNxMpnwlqwWTu7OISNG2Pm9autGOkRTo79KK/gzHaGhadxgzwF39GrzTOi4Kt7FyvMaOL5NT
 48MyOLwwgpDucgITHdLwaXZMEHQ3DUM7x+6v6g5jxV9V5mSTo1trQQUU+wn5je+/cdJVEQ9Tg
 bGltWPATL/1qfkAR+/LEU0qI95n0625J4M0ENHCfT1MWIvJLVo3E5QnfZ49ge3PAo4gQFiU/N
 aTxRuzqLr1Q+/+CaOUmtXbRZ0zX5WZuWVVE2lpwUuXzFlBDUMIckZIXWZtc5ROftAJQlbd3MJ
 2lt/6bBcnLFjCo8LtSPgSAGYFvS8yeHG0ntAjALPbr/20uEaR3MZi3WxKHNMX85/A3FQC2F8K
 ROlV8/hdiSR/LVMU0u339Yd77zwYunyVIWTrK6LC0OEmJnrqPuFAsQQb10fJc7yppXn0X3Urn
 eb4dx83gmFa8/Us4fsvHfpwKMM
Cc: Philipp Jungkamp <p.jungkamp@gmx.net>, alsa-devel@alsa-project.org,
 lakotamm@gmail.com
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

The Dell Inspiron Plus 16 has top speakers connected on NID 0x17, which
the codec reports as unconnected.
These speakers should be connected to the DAC on NID 0x03.
=2D--
I don't possess this Laptop myself. The owner of this Laptop reports
that the speakers are now active, though there are still problem's.

> There are still 2 small issues present:
> 1. 0,5s delay before the top speakers turn on
> 2. Popping sound from headphones 5s after the music stops playing
> and afterwards when it starts playing again. This can be fixed by
> disabling power save on the audio driver [...].

I've only written this patch because the issue seemed similar to that
on my Lenovo Yoga 9 14IAP7.

 sound/pci/hda/patch_realtek.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 38930cf5aace..e6f229e418c3 100644
=2D-- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6896,6 +6896,32 @@ static void alc287_fixup_yoga9_14iap7_bass_spk_pin(=
struct hda_codec *codec,
 	}
 }

+static void alc295_fixup_dell_inspiron_top_speakers(struct hda_codec *cod=
ec,
+					  const struct hda_fixup *fix, int action)
+{
+	static const struct hda_pintbl pincfgs[] =3D {
+		{ 0x14, 0x90170151 },
+		{ 0x17, 0x90170150 },
+		{ }
+	};
+	static const hda_nid_t conn[] =3D { 0x02, 0x03 };
+	static const hda_nid_t preferred_pairs[] =3D {
+		0x14, 0x02,
+		0x17, 0x03,
+		0x21, 0x02,
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
@@ -7137,6 +7163,7 @@ enum {
 	ALC287_FIXUP_LEGION_16ITHG6,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
+	ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS,
 };

 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9066,6 +9093,12 @@ static const struct hda_fixup alc269_fixups[] =3D {
 		.chained =3D true,
 		.chain_id =3D ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
 	},
+	[ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS] =3D {
+		.type =3D HDA_FIXUP_FUNC,
+		.v.func =3D alc295_fixup_dell_inspiron_top_speakers,
+		.chained =3D true,
+		.chain_id =3D ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
+	},
 };

 static const struct snd_pci_quirk alc269_fixup_tbl[] =3D {
@@ -9165,6 +9198,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]=
 =3D {
 	SND_PCI_QUIRK(0x1028, 0x0a9d, "Dell Latitude 5430", ALC269_FIXUP_DELL4_M=
IC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430", ALC269_FIXUP_DELL4_M=
IC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0b19, "Dell XPS 15 9520", ALC289_FIXUP_DUAL_SPK)=
,
+	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP=
_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x164a, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE=
),
 	SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE=
),
 	SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
=2D-
2.37.3

