Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A365E89A97A
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:11:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A68E62D16;
	Sat,  6 Apr 2024 09:11:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A68E62D16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712387488;
	bh=p7BCWML6FR8IUZ131P5oKg1I0CJdZ+QR6Akdg0RubUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rxsOizDWNsg5QnRpgEa3yCSAnJZ6T8j0XAz1X1r4xHFVq8n0v0qVUpsV+jYq4WC3z
	 DypJ4vkdkY4cm+brh9WvDdlu5Ub/SGoceJ2Qo0kUhLAcPgcw7tOpb/aCO/voFlbFrd
	 s2MCpo1cWTQfEFHkTcCdIQTj73DT6f7qkL9BJy2A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1CEAF8057E; Sat,  6 Apr 2024 09:11:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F152FF8058C;
	Sat,  6 Apr 2024 09:11:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A6DCF8020D; Sat,  6 Apr 2024 08:49:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8514BF80571
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 08:48:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8514BF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ery4oyYt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386111; x=1712990911;
	i=oswald.buddenhagen@gmx.de;
	bh=dID5lRQmSL5xQmZb/PuLDbnEgvU6o/RD1hxxbtU8cYQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=ery4oyYtdjJ9vcfRLHKtsrr5eddPl9jjr4o+B6EqVxFJ/bzLeO3GQY1mcCJBbkG2
	 QzryYB9TSHxXbFxG0vNuunQjOk2RuCF0CNwEoVotDiRY2ttz0m81XlnYnw+mbf+n0
	 FbXvicaGhzaxVOxVIGwMqVnC2+vpBr88jLPePdsNN/9N/gBj72g155UfbQT6LGfGl
	 kVL1cBnebW8uAvTRtW3wGc7/0oMrGCR89eOaL3La2yboQz9t0n1Y6VDIT+VyymPp6
	 gwk9PtdwDADOdm2IRJzen3plhnlhEp1BBVQ4vwdJVZzPqhfVU3hfy0x4q1uSx04ra
	 VR50Tqfk3rnWFwuKSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNbp3-1s999Q0SC3-00P2ee; Sat, 06
 Apr 2024 08:48:31 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-Jr5-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 08/17] ALSA: emu10k1: move patch loader assertions into
 low-level functions
Date: Sat,  6 Apr 2024 08:48:21 +0200
Message-ID: <20240406064830.1029573-9-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fIpfomWooofCrLI3+c0bKi1/0aKLBboPyjR1UlaFDrsiHRmm+RJ
 SvESc55zf72HXY41zVuV4QuFySISCpRSTD8SNj9EiLsp/Gt9rXT6rNWJX0CjHKdBg/f4EWB
 bCutGpvsvYEFueMKc3MLHS7UJObYPQcBHv2DJFNsT2GvKRcXaEU0dxRYqPUzCtStqATwkjn
 E58rji2rNKeVDLisSWTrA==
UI-OutboundReport: notjunk:1;M01:P0:FxPeO3sGi/0=;/LPsxlrBrJ+Edq0oQ/ANR+hCSIi
 84LazBRQPNExPP7UM3zZnt5XHG1nI8y1wRknWe5t94B4Oz6tWYSgJI99Q8v2QmGaRwi1i2PCZ
 xbxj4P41YzGApqZ8QRfwsfYKzdq79nrldcjsuTVPqvagZrvj0vvr7jJ9HiEF5NNNLxbnSeqxV
 ECJbX+h1Lxf7GH3SADOsJu+rN60ZEq7CRbz5eqQOs26IGfZ49SbDWXvfPiNShoJAP2XhV8Hz9
 v2PPVwMTZAY7j4QJCl5Uzv6T3gRypB3FaqfTVGp/cd+5Y7yNtHlpsUUKsKgKJp7/6MDpG/nZt
 ARMLXRruv54T0I8Dr3/9YrzlO1MEgZTIhPhKUcdDl1InlDkgE7B6j7OVHmjdKMQG69piZaWAB
 BgCQW5xX9bGNJKIMDCzyeV1UmnN29L/ElhUcSCveN5OTp3KuDS7p5/u8OsolfpyLleMJj1y+Q
 YSEe/TyKtD6iU5SsCN4ggioHRYx5L9gsiaEzNSb5niyLT9jWw8TR5GGg3x1gZ6w1y+WHGmBbl
 bf042Sm+SfLjKrCp6Gh09Wu5KapkMkXsTl93lutP7lX/hXiMmDtYexBsKg5kPqlAsN1tfU6Ll
 TjYogj8S4tkud5h+kgZ7fHR0mAfKDwTWOF/xQDacnD7eMJBmGuzbYJzGNxEmzx4LlGh9MbEWt
 KeKRcA1UXC0y6xEwBesYehHm0/Uk2sAEaamCFpQS38bHPM+/DKDryREr0lnWzA3+/5+JA4SG7
 Gnad0hzjEHRaK70cqzPvsRKPo0HqSUEYXUFNn86ObLJptTaAZbN4gMAaHKsW2mJZ95WUvCsG1
 3IpgIWYaeqIIJB4Q6nwiu0JnQI1oLZ6W55WSsjgcis/sE=
Message-ID-Hash: YZQIVSQEXL6CTB2E42QZ5MWOW4QL5ILW
X-Message-ID-Hash: YZQIVSQEXL6CTB2E42QZ5MWOW4QL5ILW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZQIVSQEXL6CTB2E42QZ5MWOW4QL5ILW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert some checks in snd_emu10k1_sample_new() back into assertions (as
they were prior to da3cec35dd (ALSA: Kill snd_assert() in sound/pci/*,
2008-08-08)), and move them into the low-level memory access functions
they protect.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

Side note: this eliminates the memory leaks in the now gone error paths.
I don't think it was actually possible to trigger these even before the
foregoing cleanups. But if it were, it would allow a user with access to
the audio device a scope-limited DoS attack on it. This would be only a
very minor security hole, given that on modern systems it would merely
enable the current seat owner to be a nuisance to their successor, by
making a reboot necessary.
---
 sound/pci/emu10k1/emu10k1_patch.c | 4 ----
 sound/pci/emu10k1/memory.c        | 6 ++++++
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1_=
patch.c
index 47d69a0e44bc..55bb60d31fe4 100644
--- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -65,17 +65,13 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 	size =3D BLANK_HEAD_SIZE;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
-	if (offset + size > blocksize)
-		return -EINVAL;
 	snd_emu10k1_synth_bzero(emu, sp->block, offset, size);
 	offset +=3D size;
=20
 	/* copy provided samples */
 	size =3D sp->v.size;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
-	if (offset + size > blocksize)
-		return -EINVAL;
 	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size))=
 {
 		snd_emu10k1_synth_free(emu, sp->block);
 		sp->block =3D NULL;
diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index 20b07117574b..fc9444404151 100644
--- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -574,6 +574,9 @@ int snd_emu10k1_synth_bzero(struct snd_emu10k1 *emu, st=
ruct snd_util_memblk *blk
 	void *ptr;
 	struct snd_emu10k1_memblk *p =3D (struct snd_emu10k1_memblk *)blk;
=20
+	if (snd_BUG_ON(offset + size > p->mem.size))
+		return -EFAULT;
+
 	offset +=3D blk->offset & (PAGE_SIZE - 1);
 	end_offset =3D offset + size;
 	page =3D get_aligned_page(offset);
@@ -604,6 +607,9 @@ int snd_emu10k1_synth_copy_from_user(struct snd_emu10k1=
 *emu, struct snd_util_me
 	void *ptr;
 	struct snd_emu10k1_memblk *p =3D (struct snd_emu10k1_memblk *)blk;
=20
+	if (snd_BUG_ON(offset + size > p->mem.size))
+		return -EFAULT;
+
 	offset +=3D blk->offset & (PAGE_SIZE - 1);
 	end_offset =3D offset + size;
 	page =3D get_aligned_page(offset);
--=20
2.44.0.701.g2cf7baacf3.dirty

