Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA61689A979
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:09:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DAFA2D25;
	Sat,  6 Apr 2024 09:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DAFA2D25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712387399;
	bh=BEuFMy2pqu7TGRas3rY5lil+/UYJzKp66XWxPYjr/aU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iOLx1kyFFGlOjSqtRMAv8M0wC+52vLX1/qrl0hioHvhfkbxejrb9lDRtXg96OEFV4
	 lauuoevNkVq+U8pM4PFCDEJAjTfvMkk9YmL9MLSyy6AzavShTPtQU0WVoISH9SRd7U
	 b6SEpQBNrAo6yqkNDb7/5EOjWoJkzV0O7fyVsNVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1204EF80570; Sat,  6 Apr 2024 09:09:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1101F80588;
	Sat,  6 Apr 2024 09:09:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E1F1F8020D; Sat,  6 Apr 2024 08:49:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11E63F80570
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 08:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E63F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=nRTIzDc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386111; x=1712990911;
	i=oswald.buddenhagen@gmx.de;
	bh=wMBTvJmAvSsnYPNg7taC7rcPrmaCF3wZy8DyeRm4ZW8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=nRTIzDc6feP0iKtajQ5nV7Z5hZs2qpU+2HSiXf3pyOTaMIbzK8bRKcAPBGcKAwGl
	 rq6oiLiLMp5ersliAHmODBH9YjeCyfBXrZChQmahKPHYUgwCU5YpTMtNWT2awjiHI
	 NSttbw5ZjE9EI00eUxHFVto0rZXmOWdl/OGetfJW4sFZZLNAtoc1z7JodI16NEg2+
	 8MhDwUssxloVw5kMhI++60szUyyyVzkafufLErYjZrijH5g+VdWf1t9eQd+fonaIg
	 XteKpGIgCF59GqEdPMUP+SoAucU+DG8VFdt1l/Z5ehJnNsD9nM6amTw2U/rqXqs/R
	 IU3tPhGVx8xoKHUnKA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1s9yUr0SOU-00PsIe; Sat, 06
 Apr 2024 08:48:31 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-Jqq-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 05/17] ALSA: emu10k1: prune vestiges of
 SNDRV_SFNT_SAMPLE_{BIDIR,REVERSE}_LOOP support
Date: Sat,  6 Apr 2024 08:48:18 +0200
Message-ID: <20240406064830.1029573-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bvj/GQ7WslqAzG8kNT2sOurxtm67KT9kqDVH2EEH+3EpyRsGhr1
 A/H8qH/auP6YVtYJ+vA5FMCisM11FRsqfVCzbe/YwTA4FHxzhl5Dh9kF3UsxkgR5ic6HqSj
 pnhUEFz2QaHFKPEw0CseUAeV6Na36ICVgs/Elm0NHyk9JujyUGbvFOvJNqie5urWzeWpa9f
 vt1BTAfrQFeShJ3PPUPJw==
UI-OutboundReport: notjunk:1;M01:P0:2LIpGgFpTGM=;ubrftGn6pET6IOuU7CCvbCrpbGx
 38W3u3aXNoFbyNUOlUX526vOWK3C8K4zV5YvREisq01PdPOQe4TBb2S+CR4+0f8ZwCtmkB86T
 /5NF3mfa9qIXevsdLHwbJ2c52e/LstmW10mtc/JjG8NI2RwUeGXt//NWKq41AWbx8ZvfWjfAk
 an80pYHK0IrwIfjw3qCiSsUN0MtjcE/K9+zpxVBR8lJOHUw3RSGZhaLI4EQp1CkcEj3gBrjc3
 y7UUEhRBv+c2INBWugX/sdwG93N83H8AxxKQtFzWXPD1UfWd5LT63TZ14trTgI2NUsDF5L3E+
 Q45pOyOU1RFpOhAY9C9BGhngd3WAd0UnpK0pscGJL7Tgfu/dC+Jz9LgMXOoiDVkOYFaPewASA
 gWqQCUW4SbCwq6fLOjG9HZRu7/HCLXDcGN6hiYziBQHx3FDVF1vXEfTQjHPoLj5D4yXIfPlKf
 RKnSjpw4jiv/9lvEZXdN81nksf1x/gKVRIrGnCmP7G1NwaR9qE56U29KgYlitqCg2Lcj8oOkx
 qcD1H771Yw7O332EjFsHCtGkdwR6u/wpA+Aa/51Dy00RZ9k9TgWhiOq6MAoa+sk22zaHSpN85
 JosWyG3BBHbUmJ+axcrLlL3VXWabrrZxTZh58RdFZCQh+HCRNHqaTWFKVZrGqwx0X7ompkbuh
 hDPf65/CpFuLefqZns2BwPPfusB/cOYMkOTKTeRz4k90v1KYbwsu7tQRVyGcdW28usO8yL4pB
 UH42Nzjh0nAMxSJe+KQpt675IQrpxnGLg+FrSJzB8xTBdJwJVQ39FK6/rA4rSYc0/gtdQXV/3
 d4275gTnVjbiSaOUgxLXxPKUMSj07IG9Og83dWg5sR7nw=
Message-ID-Hash: CBBJ5NVDAOQMLL3RYHW3L3E7ZKGG37QM
X-Message-ID-Hash: CBBJ5NVDAOQMLL3RYHW3L3E7ZKGG37QM
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is required only to implement WAVE_BIDIR_LOOP and WAVE_LOOP_BACK in
the GUS patch loader. It has not worked on emu10k1 since before ALSA hit
mainline, yet nobody appears to have complained. And as it isn't super
easy to implement, just admit defeat and clean up the code.

If somebody wanted to resurrect the feature, the emu8k driver could
serve as a template, but the code would be quite different. But
arguably, this should be done in user space in the first place, as this
doesn't represent a hardware feature (somewhat ironically, the actual
GUS driver has no synth support, and therefore no GUS patch loader).

Note that instead of properly rejecting affected samples, we continue to
just pretend that the feature wasn't requested. This is extremely
questionable behavior, but avoids that possibly unused instruments
suddenly prevent loading the entire file, which would break backwards
compatibility. But at least we log a warning now.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_patch.c | 73 ++++---------------------------
 1 file changed, 8 insertions(+), 65 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1_=
patch.c
index 89890f24509f..49214c226808 100644
--- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -28,8 +28,6 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_s=
f_sample *sp,
 {
 	int offset;
 	int truesize, size, blocksize;
-	__maybe_unused int loopsize;
-	int loopend, sampleend;
 	unsigned int start_addr;
 	struct snd_emu10k1 *emu;
=20
@@ -43,32 +41,24 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 		return 0;
 	}
=20
+	if (sp->v.mode_flags & (SNDRV_SFNT_SAMPLE_BIDIR_LOOP | SNDRV_SFNT_SAMPLE_=
REVERSE_LOOP)) {
+		/* should instead return -ENOTSUPP; but compatibility */
+		printk(KERN_WARNING "Emu10k1 wavetable patch %d with unsupported loop fe=
ature\n",
+		       sp->v.sample);
+	}
+
 	/* recalculate address offset */
 	sp->v.end -=3D sp->v.start;
 	sp->v.loopstart -=3D sp->v.start;
 	sp->v.loopend -=3D sp->v.start;
 	sp->v.start =3D 0;
=20
-	/* some samples have invalid data.  the addresses are corrected in voice =
info */
-	sampleend =3D sp->v.end;
-	if (sampleend > sp->v.size)
-		sampleend =3D sp->v.size;
-	loopend =3D sp->v.loopend;
-	if (loopend > sampleend)
-		loopend =3D sampleend;
-
 	/* be sure loop points start < end */
 	if (sp->v.loopstart >=3D sp->v.loopend)
 		swap(sp->v.loopstart, sp->v.loopend);
=20
 	/* compute true data size to be loaded */
 	truesize =3D sp->v.size + BLANK_HEAD_SIZE;
-	loopsize =3D 0;
-#if 0 /* not supported */
-	if (sp->v.mode_flags & (SNDRV_SFNT_SAMPLE_BIDIR_LOOP|SNDRV_SFNT_SAMPLE_RE=
VERSE_LOOP))
-		loopsize =3D sp->v.loopend - sp->v.loopstart;
-	truesize +=3D loopsize;
-#endif
 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK)
 		truesize +=3D BLANK_LOOP_SIZE;
=20
@@ -96,65 +86,18 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 	snd_emu10k1_synth_bzero(emu, sp->block, offset, size);
 	offset +=3D size;
=20
-	/* copy start->loopend */
-	size =3D loopend;
+	/* copy provided samples */
+	size =3D sp->v.size;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
 	if (offset + size > blocksize)
 		return -EINVAL;
 	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size))=
 {
 		snd_emu10k1_synth_free(emu, sp->block);
 		sp->block =3D NULL;
 		return -EFAULT;
 	}
 	offset +=3D size;
-	data +=3D size;
-
-#if 0 /* not supported yet */
-	/* handle reverse (or bidirectional) loop */
-	if (sp->v.mode_flags & (SNDRV_SFNT_SAMPLE_BIDIR_LOOP|SNDRV_SFNT_SAMPLE_RE=
VERSE_LOOP)) {
-		/* copy loop in reverse */
-		if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS)) {
-			int woffset;
-			unsigned short *wblock =3D (unsigned short*)block;
-			woffset =3D offset / 2;
-			if (offset + loopsize * 2 > blocksize)
-				return -EINVAL;
-			for (i =3D 0; i < loopsize; i++)
-				wblock[woffset + i] =3D wblock[woffset - i -1];
-			offset +=3D loopsize * 2;
-		} else {
-			if (offset + loopsize > blocksize)
-				return -EINVAL;
-			for (i =3D 0; i < loopsize; i++)
-				block[offset + i] =3D block[offset - i -1];
-			offset +=3D loopsize;
-		}
-
-		/* modify loop pointers */
-		if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_BIDIR_LOOP) {
-			sp->v.loopend +=3D loopsize;
-		} else {
-			sp->v.loopstart +=3D loopsize;
-			sp->v.loopend +=3D loopsize;
-		}
-		/* add sample pointer */
-		sp->v.end +=3D loopsize;
-	}
-#endif
-
-	/* loopend -> sample end */
-	size =3D sp->v.size - loopend;
-	if (size < 0)
-		return -EINVAL;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		size *=3D 2;
-	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size))=
 {
-		snd_emu10k1_synth_free(emu, sp->block);
-		sp->block =3D NULL;
-		return -EFAULT;
-	}
-	offset +=3D size;
=20
 	/* clear rest of samples (if any) */
 	if (offset < blocksize)
--=20
2.44.0.701.g2cf7baacf3.dirty

