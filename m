Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307589848F
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:02:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51EA2C7D;
	Thu,  4 Apr 2024 12:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51EA2C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712224960;
	bh=QkfNAiDSNvw4HDF9IAG3GweNjgJwMxMVQuifEYn6CBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jE52PtMbtV8CFNquVHP3gFe2w+CntP8raTL5CHRWciOxwdtno/Gkw6IjGjaE4gpD2
	 GOe2ZdHTnGQ+QfOqrXctRQ8V6m9by4H8Gk7wzDeaYaBpOzsVpgLxmDJEf7ghu2gytX
	 prUw5f+5hkV18z9osUJR7dvhrsFtu/PLx9ks6d5I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 625ACF805AC; Thu,  4 Apr 2024 12:02:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2F53F805A8;
	Thu,  4 Apr 2024 12:02:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A995FF80579; Thu,  4 Apr 2024 12:01:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0078F80007
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0078F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Kufm4905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224851; x=1712829651;
	i=oswald.buddenhagen@gmx.de;
	bh=MIfdnOpAF4SC3w5tCHsYtBAisxAuFKXcIIE5ASAQfmg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=Kufm4905F50l1lQLsLBbHqG3A/o98Ev9uWkIFtirXtxjQDAMnTCZ2wZuO85ommFK
	 Wy92TOA2T2mHthcpXtubpOuJrP8IqrSWrFngeFJh2kd69omGqJe3qxj/HQr4yt/rV
	 aGMGTwJ1azE6myU3IrE8J84cvmM0JucY5p7BTfWzy9Qzb5SM9JA9k2R/EQStme1Qb
	 ogykziLsjWm07aEujrzaQYe854YIgBpJbTYicj3Ucd93xQSG5dZ22dh99tDuBVGnW
	 WgaNlVgdK2n4cE8GAzE2I+B0+6iydhIRUrv4tIxSY2ZY6nkAEyBwmtoesTh2/DY9x
	 Dtos+J4gSVilTWB+5Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MBm1e-1rxmUW3G8K-00C76n; Thu, 04
 Apr 2024 12:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RG1-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 13/17] ALSA: emu10k1: de-duplicate size calculations for
 16-bit samples
Date: Thu,  4 Apr 2024 12:00:44 +0200
Message-ID: <20240404100048.819674-14-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jZjutnPYZxsxlAkZENVGY0Cl0UP3gVaeZHGCPqb1E7rSTYXZ3Y+
 TkjGunkNgtLIgijQXqDDc3DrNoe6FJ/wbC30ghnV8dhclTrVv4ID39jD9c/UP6/dD3fU9P7
 IQvvcpX0bBwFiIkboWzvK4Jff+gWYsSreQNX1H9hE13cXjBLWLaF19xpqDTmK0O2eqs9sHb
 R3xPxk1TBkmpWayTJD/Aw==
UI-OutboundReport: notjunk:1;M01:P0:O2sjyQn7NGU=;xoZp14iWUSmxdXttwuMtxrOk+Ub
 7q8Yfssp9uDR2l/T4igXim3ex+ONlCTvj/aPwpQrs36jpO29jeG2CyzYy6FJmbuIOtpyTpXU2
 UAfKgx8IswCb+PYfhtSOO7LKQwumeYGZl96HnIxlOpN2O6uNAJUaxv9x4+EcbkZzOkMyjQYaC
 u7AOnG07m5pApo0amip7FyTsULDtgFWJtT5Y/xgqGfFxu3QNQxqYE1IwZgjFu/Y4TdttVYg53
 dkE1b7QEvC37Jl6meEQAstLE/tbjWaTW7jH9hUqZoTBsJ37rf8qR40AzGzZVlw/hHfj44Yeld
 ogsV0Uohglgw+KEIe94eLeOlbgTDYy5P3u2Dx+O0TYSjYWmOwyk3dUO+lflyW0DHinj07Rvl3
 C94sgGlo3OgbXz9br20I7dMA6v4yMXkTQL1grMsFNmITq1fvqJg1ifV1msnkQE65Vs5xpkJci
 mncjplIihdrEKbYikQp0vqQmc6vJl+KNL+ti1lrv4I34pLNNu9wlTRteh8tdk8xYKQ8juRpmp
 16m6QfzX6G3HF6PZdsX7TtltdFKJToAVq1NfDH1esSD/wQb10Xh5voxIWhwydFddFgU0wIcVI
 EWJD05LMNLjvMYqYUshV0Drb/tNYOZ88KKvtNkXUvvgfr0o2VR3RkP//1uvrvAvnk6Bk+s2WG
 2jfp44IPe4frADWl8TOL1AOigbfNqQH7FnaNOiWi24OQLBkOR/rjjH1JQ2kjR2ET3NSwmtAwA
 yoiFrERl7Db1MzsU4uFEn5M4s1XEWCJfXh9M8eyZ+90kH4iNiBXaCVZki6GOKDnxaDEfLRp4E
 4Vy7OHdyAppxiSFUqNEw5OlyrlpMOe/fU9NrCBUIZjIpg=
Message-ID-Hash: YM4B3OYNEV46N5NZQPPO5T57JCQYJSKX
X-Message-ID-Hash: YM4B3OYNEV46N5NZQPPO5T57JCQYJSKX
X-MailFrom: oswald.buddenhagen@gmx.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YM4B3OYNEV46N5NZQPPO5T57JCQYJSKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of repeatedly checking the sample width, assign a size shift
centrally.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index ad16de99b800..481fe03fef4d 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -28,6 +28,7 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 {
 	u8 fill;
 	u32 xor;
+	int shift;
 	int offset;
 	int truesize, size, blocksize;
 	struct snd_emu10k1 *emu;
@@ -43,9 +44,11 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 	}

 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS) {
+		shift =3D 0;
 		fill =3D 0x80;
 		xor =3D (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_UNSIGNED) ? 0 : 0x8080808=
0;
 	} else {
+		shift =3D 1;
 		fill =3D 0;
 		xor =3D (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_UNSIGNED) ? 0x80008000 : =
0;
 	}
@@ -68,9 +71,7 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 	sp->v.loopend +=3D BLANK_HEAD_SIZE;

 	/* try to allocate a memory block */
-	blocksize =3D truesize;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		blocksize *=3D 2;
+	blocksize =3D truesize << shift;
 	sp->block =3D snd_emu10k1_synth_alloc(emu, blocksize);
 	if (sp->block =3D=3D NULL) {
 		dev_dbg(emu->card->dev,
@@ -83,16 +84,12 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,

 	/* write blank samples at head */
 	offset =3D 0;
-	size =3D BLANK_HEAD_SIZE;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		size *=3D 2;
+	size =3D BLANK_HEAD_SIZE << shift;
 	snd_emu10k1_synth_memset(emu, sp->block, offset, size, fill);
 	offset +=3D size;

 	/* copy provided samples */
-	size =3D sp->v.size;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		size *=3D 2;
+	size =3D sp->v.size << shift;
 	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size,=
 xor)) {
 		snd_emu10k1_synth_free(emu, sp->block);
 		sp->block =3D NULL;
=2D-
2.42.0.419.g70bf8a5751

