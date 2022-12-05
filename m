Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2998D644527
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 14:59:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA23118CD;
	Tue,  6 Dec 2022 14:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA23118CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670335145;
	bh=TDMtuIw66n1/32kerpv7wVaqyX5b8LRtqB1sttnaodg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OtbiUvWyZJoJxQqTW7cc/9EU3PU10zTtcg2r0z0c90XDBAy7JIUusgO1fpNWpLdwv
	 bFIYhawlRdCGI9HHdR5nokuYJOGDJnbz/59RABe66sFxg02CRnGoTkPTWV5idZ7dfG
	 jSTjcLhE0nKh2CrHZihaurYtO8Q6IMhYT+rXw2nE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3565F805E5;
	Tue,  6 Dec 2022 14:53:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9970AF80236; Mon,  5 Dec 2022 17:37:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 474FDF800BD
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 17:37:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 474FDF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.b="G8cxqjXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
 t=1670258256; bh=TDMtuIw66n1/32kerpv7wVaqyX5b8LRtqB1sttnaodg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=G8cxqjXgJYTsALawOim/atZZlgv+aNJVQHvDBAWTG94qiapYt7EHeTXjgRcZfL5i5
 6ZisZDJeouMdgyPfaL6Va/aCTTitkhsTHdK4wSYh3b2VNEy1srQF4ybtn5ntwV4k10
 hZpCL/djGKjXmJVSiff8WcSPX60GSJc2Dw987Et04D+GXDoqtNEDKVBBrrwmF/jF+t
 EqGV8suyiOxlaqyoAFKl4k8zWQnXEDRsddpMwuNCkEpd3tjDRXM4i7TygnjNSXpOZc
 Wn6Fe/kl4QFBymlyAGKdTcRiIm5eq5I0QGSgtEzxhjFZy9pnSn5OAqYVCAN5OrRkgE
 xRQ6BS0qPrlVQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from yoga9 ([46.114.196.142]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QS8-1p6cBz3XZg-004TXg; Mon, 05
 Dec 2022 17:37:36 +0100
From: Philipp Jungkamp <p.jungkamp@gmx.net>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ALSA: patch_realtek: Fix Dell Inspiron Plus 16
Date: Mon,  5 Dec 2022 17:37:13 +0100
Message-Id: <20221205163713.7476-1-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Xn+yN3D8E3HoB6TOrMrwMwzklSkbrClxzOjMWaho3V5jEABIGYK
 x3FG42KWNIXSr/0EaREke+P/mmqKaPzubf1+syyNUDwXci/1efs4mPoTrYouFalpY0rTKrb
 poLOzYzaNeI/hsHy6KtdS9M1w5uygL3aBIpUS2wNF7P3gnsp287a1UCSAWavnA7TNo+4I6d
 4SMVjqxMnmYQYLrjzjoeg==
UI-OutboundReport: notjunk:1;M01:P0:reHec01F1uE=;rdQLzPmAIpwAMiK28d3yTEX/FzG
 ErhjF6GqQKTUP2RtpfhCF2XjAV30R/rArxhY/iglCd1sX9j3Y9y40SJVnqfxSSgatws8uQKaq
 FGuypdKCpRQdjPT39ml5Lv+jv+207Wv3JIQvQywelGmm1OawLp3xi3YeVKNWX9ynGDx8UvUp2
 NdVOMnCXM6HZEDL6ZaTVb6z+jcKwSeWMjE+vy9ZNNOOn26r8tcqHvd7sebcqjS4ltwCDhhWsC
 bNOuuCtC6jXRaQ5K/msupFYOzE5wFuGhX0iMvFF05tHHcfW2rEuncbEJzFF6ZInavJWDQvSFM
 Xt6y6wGHx4Vj5SoYc6Ldr2CCIR5t6tkf1Xhv+fCz/DhoPyGlkC3LNBoXWKcd6VIuqpI0ZxnCS
 JgEDh10X7IyS262kfF5UHzGsZFsk91gEgf+uVEfSxcBjWrVaIJJrE6oTeU2+7yvSY/7K670pc
 UXfZN8egTA/QRHgPRvURWEIJHMwXVAysXjSg8Yk4nEFsKlkHM8X5R+73euWaoLnXPwxYjFQ7m
 SAaAioELS+nVR4yK16VsuiCca1x5fJ2J++326s8hxGgu0oReaJT7p4+tXwPlvYdXi3JRHXLYR
 7xBwSP5j6hwtKaHPb5v5MPzs+/t/fNGWE0yePYlKVE9wyenM8/aLE3YAPtRxUjERLzwd3z47T
 OT/7woFpzY3Z/rcXFuJvDdOeKeCD7aCNPBpERFMFlfCNJEENB9v62hCev6ypTWG5iSh09M3WZ
 8lKxV7QgkvTy+3JpmE5YSr36rNrWZfPewhEseHmdKJ5MvAG+BHEhOQnNKctWwu0Stv76zjMCN
 yDWYLGTAnBrUpxv6BzIOaLXElBWSQfgcpWy6PG3K9aNZS6sdv2ph7n2yaOFVC5AYgo8tKK1lS
 TOkn6oriCDtRt6FUtSK65QfkN3LvHQud4xoCJYPXJMXvgM9q+tyiVc9H5/op/gyuoynlImM+H
 caM3Bg==
X-Mailman-Approved-At: Tue, 06 Dec 2022 14:53:24 +0100
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

