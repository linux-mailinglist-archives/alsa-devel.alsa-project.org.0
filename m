Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBFC644877
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 16:59:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2D9F1895;
	Tue,  6 Dec 2022 16:58:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2D9F1895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670342343;
	bh=TDMtuIw66n1/32kerpv7wVaqyX5b8LRtqB1sttnaodg=;
	h=From:To:Subject:Date:Resent-From:Resent-To:Resent-Cc:Resent-Date:
	 Cc:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From;
	b=nAPNGs9SmKrpc6Njbt3B+95D82qjgKZHhRYfYgkgWG653GsHS5CuxNIj52FEGsE5u
	 /f7cuJxvvBEZOXwPAdqlez7/JllGuzsTRxawdWARl6RZ442fpd2mT9MCMJB0uYb0HC
	 IS0DKzwzqoRzc5JwdqfMlQuCei4kUkRt9K0fKJ70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B47F80290;
	Tue,  6 Dec 2022 16:58:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EE8DF8014E; Tue,  6 Dec 2022 16:58:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BF16F8014E
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 16:57:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BF16F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="Dnh6W7CU"; 
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="G8cxqjXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
 t=1670342274; bh=TDMtuIw66n1/32kerpv7wVaqyX5b8LRtqB1sttnaodg=;
 h=X-UI-Sender-Class:X-UI-Sender-Class:From:To:Cc:Subject:Date:
 Resent-From:Resent-To:Resent-Cc:Resent-Date;
 b=Dnh6W7CUy/7OWQI9mwKuila48DLklatoKw2B8bFnQrqriboVu7b0ZapVszldmGw+j
 neAd58jCaaQNjYxJX0UY3qe/Do1ZzxLFE/Qnb8cKsUMMXhXeQ9Km76OLvhJ0gKqn4m
 TkqZlU2Bil6dveyzzVQGSNSV4iKvbf6wVd0f3+o2NQPDMS9dRKL7ocPTbpJ3FvtHRk
 iXFVcVty0MJiraPPBOIelOOXqsudTJ7TxL4cCN0y6fdkqBvFfqY86YAgtJKVTXNvSO
 tSRXm14qW6EKhPXbbO1LFb3WLwbe6s6lJ3L2KlY4DsrIMrZmGH+5W/MVFf3Ipex0Ga
 UBcmX3JtlAmUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.87] ([95.223.45.245]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJmGZ-1pHeNE48YD-00KCzQ; Tue, 06
 Dec 2022 16:57:54 +0100
Authentication-Results: gmx.net; dkim=pass header.i=@gmx.net
Received: from mout.gmx.net ([212.227.17.20]) by mx-ha.gmx.net (mxgmx114
 [212.227.17.5]) with ESMTPS (Nemesis) id 1MaJKP-1pWHuy2AM9-00WQcz for
 <p.jungkamp@gmx.net>; Mon, 05 Dec 2022 17:37:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=s31663417; t=1670258256; bh=TDMtuIw66n1/32kerpv7wVaqyX5b8LRtqB1sttnaodg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=G8cxqjXgJYTsALawOim/atZZlgv+aNJVQHvDBAWTG94qiapYt7EHeTXjgRcZfL5i5
 6ZisZDJeouMdgyPfaL6Va/aCTTitkhsTHdK4wSYh3b2VNEy1srQF4ybtn5ntwV4k10
 hZpCL/djGKjXmJVSiff8WcSPX60GSJc2Dw987Et04D+GXDoqtNEDKVBBrrwmF/jF+t
 EqGV8suyiOxlaqyoAFKl4k8zWQnXEDRsddpMwuNCkEpd3tjDRXM4i7TygnjNSXpOZc
 Wn6Fe/kl4QFBymlyAGKdTcRiIm5eq5I0QGSgtEzxhjFZy9pnSn5OAqYVCAN5OrRkgE
 xRQ6BS0qPrlVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from yoga9 ([46.114.196.142]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QS8-1p6cBz3XZg-004TXg; Mon,
 05 Dec 2022 17:37:36 +0100
From: Philipp Jungkamp <p.jungkamp@gmx.net>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ALSA: patch_realtek: Fix Dell Inspiron Plus 16
Date: Mon,  5 Dec 2022 17:37:13 +0100
Message-Id: <20221205163713.7476-1-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-GMX-Antispam: 0 (Mail was not recognized as spam); Detail=V3;
UI-InboundReport: notjunk:1;M01:P0:+9z6DQ92uYg=;U81ZWeivgksXemHp1k2PUEL8FUiE
 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
 lPzQ3Jk1U2Taj9OedUjEtymKmaQLNihfGXH
Resent-From: Philipp Jungkamp <p.jungkamp@gmx.net>
Resent-To: Takashi Iwai <tiwai@suse.com>
Resent-Cc: alsa-devel@alsa-project.org, lakotamm@gmail.com, tom@tlvince.com,
 Philipp Jungkamp <p.jungkamp@gmx.net>
Resent-Date: Tue, 06 Dec 2022 16:57:52 +0100
X-Provags-ID: V03:K1:9cqhDh3SDG68Afef9DUkU7d70rqUulyC+L+FYmDRt9vxFYshOuz
 msDjGDQeLfIskU8q5uZci0ZTlUdXwWFQT1YvPBa/eAXctFGnZW1MaoMC7a8BwFllKdooKGP
 ZZZOCmzzLuQbN+GrO1zes42viUnOgVHPc5LxSQN+sTT2lonzWirYz9n8dlNpfiBd0oR51F2
 Lx2fyqkH9+IvhQkRniV+Q==
UI-OutboundReport: notjunk:1;M01:P0:jCcGsJtO7/U=;MgJPz+NZPA+h8PwH8LeAxNM4a+e
 c/ic87/xaF41qSg8PHJV5eu27JezOQHZZl0QCD3exPAu2olsYcz/I4+F7WKMsiOPAB+M7k3BI
 rHVMqX8Tmbh/B0icBjZ2fLFj6clI8BEhCRaN+qnsUQAGrUDUVWV4ClzPdl0S1zvmpM0iVQjFs
 Bm4pEErJX4qd+a1k847HsQ9Uwh+VboPBCpFVqNvgeRlYIsRNSE7C8qoMTtQdhaMOqVGhJvVql
 aUrVlOYxbEs6SCdOV0uF15+7XahscBgAeFpkkKPlSzcyU6RF89lHduF5Yfra3cPQ7nmqkJUSR
 toCB53XdkdQ5dHjY42Er2wFKf6ml1si8pN/gWvQ6KC22ujZfsZNP2v8GAsM87qbxbnLAinEz0
 WJysZIvZX45qkiOq2u0iVtdg8foi0cUeNwuJ5hxXFhro/TYS36YnhUYDZjJ+XN3WlIEkbkto4
 WgJ/ofK37r09Y5hC6/kP0QcA1kbKI+IDpEhcm4wVMrynr3ULx48VglFRLWoD3+niyrEJ6lqtx
 J/651mUMQrUptK4sDkyafPSsAJzi1V9BNl7LdOeENaKEM0HNJfrS4sDnx8zZ848BldzRIiYf8
 ZXS2eNWL25esmkl1wqSwnH/Gv1IUnnPDySSoqC0C1Sjy31AO+qrk+l4fNM+kcuhcVuKSNhDOV
 xEtpnKxDaoSBCat49gxssCHNRDPDgPeIYJnhaoYNLZaARxQmwZ7nHKI7/jfIeNKhbKNPbOary
 LgC6fAqsAOcYkOgSheSh7+KVpr9LEi/B9xiLYGnorLWvRC3zdLFyQhu4RHIZEBBp9lG7U9J1w
 hnjzaJlavIXkorD7IRCl5rvgX2eSsBHYbmeR7USkr9ZvlI26zZZioDdTNLh6XvPXOHmpYTLhz
 7TcppunPQMBcw4mCK0ykZH4cr402jCy82VFXSkNuWo00MiUB95fPuoiYAt39c/+Y5Aj0iTjA1
 hyhJMOjqPPzwZVcVt0CG4hpjOpM=
Resent-Message-Id: <20221206155805.4EE8DF8014E@alsa1.perex.cz>
Cc: Philipp Jungkamp <p.jungkamp@gmx.net>, alsa-devel@alsa-project.org,
 lakotamm@gmail.com, tom@tlvince.com
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

The Dell Inspiron Plus 16, in both laptop and 2in1 form factor, has top
speakers connected on NID 0x17, which the codec reports as unconnected.
These speakers should be connected to the DAC on NID 0x03.

Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
=2D--
This is a pretty late follow up to the v1 in september.
Two people have tested this patch, one for each subsystem id.
The popping sound on the headphone jack after audio playback stopped was
gone after adding the suggested alc_fixup_no_shutup.

Regards,
Philipp Jungkamp

v2:
- add 'Signed-off-by' to commit
- add subsystem of the 2-in-1 version of the laptop
- add alc_fixup_no_shutup to stop headphone jack popping sound on audio su=
spend

 sound/pci/hda/patch_realtek.c | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index cf7c825078dc..5f51f8fc7fdc 100644
=2D-- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6903,6 +6903,34 @@ static void alc287_fixup_yoga9_14iap7_bass_spk_pin(=
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
+	alc_fixup_no_shutup(codec, fix, action);
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
@@ -7146,6 +7174,7 @@ enum {
 	ALC287_FIXUP_LEGION_16ITHG6,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK,
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN,
+	ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS,
 };

 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -9095,6 +9124,12 @@ static const struct hda_fixup alc269_fixups[] =3D {
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
@@ -9195,6 +9230,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[]=
 =3D {
 	SND_PCI_QUIRK(0x1028, 0x0a9e, "Dell Latitude 5430", ALC269_FIXUP_DELL4_M=
IC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0b19, "Dell XPS 15 9520", ALC289_FIXUP_DUAL_SPK)=
,
 	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_S=
PK),
+	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC29=
5_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
+	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP=
_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x164a, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE=
),
 	SND_PCI_QUIRK(0x1028, 0x164b, "Dell", ALC293_FIXUP_DELL1_MIC_NO_PRESENCE=
),
 	SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
=2D-
2.38.1

