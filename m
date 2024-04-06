Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDDD89A988
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:17:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DFCB2D54;
	Sat,  6 Apr 2024 09:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DFCB2D54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712387843;
	bh=dSXheRU0j/Whxk1vwWTLbQWWaJKt2GeZKLjQGMz0D1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iJ/qHcqXH3NND5kE9jULucS6R7+SQU08QfryV599niBZcjkPBav9/wspIjoWfMjrh
	 7/9aiU/zYjwKCpta51+diC8R5gBQDLzCi4p96wDLcDmYBHfTfzmcP7KnLzVqhUR+HM
	 hmBUpZiL5QQ37S88qUrlYEcVwXb89JsUqRTtIqm4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71B52F8065D; Sat,  6 Apr 2024 09:15:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14F7FF80568;
	Sat,  6 Apr 2024 09:15:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D157F8055C; Sat,  6 Apr 2024 09:01:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6965F80236
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 09:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6965F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=pFgCjxJU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386852; x=1712991652;
	i=oswald.buddenhagen@gmx.de;
	bh=oLPP5MolUCUmNN2tCoRHgXVR+DS5YFmKxl4kPpbFj3Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=pFgCjxJUz4Tsq4tr3kbrZTYjf33nafS0DaHnLCJAs/uqirRwvEZVm0+9sWSeL5K/
	 zSS21eIyFjYQNp02lC6n/DY9+iD+22+2TbxWPMbYKSBEdySyCqi8QAQTEKHBPbbED
	 rUY9XAikq2BonXo/IerV98bvi0vDdJ6Ghgut9sXMYt86s03uYgoPYIC2LjF1gQazn
	 Y2aZkMwX+z9yRTONMH2jUqfD9dNLkQv8EichnNXv23Rmrv2m4XkgWse23lXySsUUt
	 VI7I9Ap85Ot90y/FYwSKTgLB7+I2ezzwTZp7Ig8wvq007xUr/vZKNjT+Z8LRcRPFi
	 rAtYVIKsVu3b2dlE1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0oFz-1sgYIT1bgT-00wk2y; Sat, 06
 Apr 2024 09:00:52 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-Jre-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 15/17] ALSA: emu10k1: fix wavetable playback position and
 caching, take 2
Date: Sat,  6 Apr 2024 08:48:28 +0200
Message-ID: <20240406064830.1029573-16-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PcuwWBN/iOVG4ANsUivDJ1NRk61tGsabPrXKnHKdWhmr3YOG/Kl
 4E6tcLqCTAB3pzYNkJLwtTfd+zMG8Cy5kV5BcDzyNcnyeHgQYkMu5cyWcXu4Q/Gnecz1T/A
 74GbtYhIHdh3qVGyplcYXxE2gQS1SWRdczi6VKms6RmM2HnIARRAbPRs50TCMgMoFeZRxJJ
 eGW9YGckWTKh3Q9Qk9JPg==
UI-OutboundReport: notjunk:1;M01:P0:hehuMRWD5j8=;BZDCdt68rWmbfmTVA2hKTpAR50C
 YqfUvo06F8rHR3D7VZERVPQ+oi+bYgf3A1si24UAgpFMA23UHqsEk9gmg7t6q7e4JFp/J7ioG
 44KrdVy8h6G8CL/zIREstm5i3YiX/C6t8lqkE0emIB5cyl9FSd9JiHCiKajaAe+XyLJQEKpUh
 3LAAwqTotd/o2m3SICqKRMI9WHjJ98jFiCXhOjL0E2tTzUPE5V+qsscu2oiRhec2smHrt3CaI
 truFzRVe9jQz+oe53yQXFDm33yV5ZmRiwNfsZRY0qLmAhD1l7j9YbeGJNpjid9Xj7Wf23Pl4H
 nbU2ys3CwZnhj1YYxrU4Z/R9R7wwZqsTxZQFt+MTU/AQop/XZ+grDL4BKxojgI/A1i7L9rmDg
 tNJYGbD2r9NQp5hJ8ZomKxoAX0tWp4KOdyjbyOw7wvVFBLFfNv8/F9Pv9+88zzZd468Zeeogi
 1DWa7HiwmyyPfEzfW3EW3sGpF3W9f2nB6EtZiw2TUlFn6uXBWnDrSfnURdbK2wWNp1Q4wTn8q
 vI4kJw0QDfY6XzIc+rms5Gd96XIugn4oFn2nXPvGLh388acrHRWkDo3kqg8P53Y43OjX1nbAp
 O2Eayk+yLzxPXep78MooTXntd0TQKZeLZGT9Og9N6kQNi0x2i9Fw3ORG0c5DtTtYym/PDZwYJ
 PXCCpt19rXE8Lg6iG/Vzg5P010flxyt/AkC4IkRyS0vEU091yL7y0tij2TLUUgUz4IJ4zOul4
 8gqCTZjeWZmCmpQCxJN4s0prW5X5sWOfEVBBD9mtM10xp8CDbOIy5qr58LAbyXy3xDRY94uUU
 ++w+/Ei3b8dm4sakMEF92IN+1oQpzSaZd4MK4pZMaspQw=
Message-ID-Hash: RKSRVWML6ZFD2CXIBFWRYSUYXSTW7LMV
X-Message-ID-Hash: RKSRVWML6ZFD2CXIBFWRYSUYXSTW7LMV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RKSRVWML6ZFD2CXIBFWRYSUYXSTW7LMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Compensate for the cache lag of 64 frames, and actually populate the
cache. Without these, the playback would start with garbage (which
would be (mostly?) masqueraded by the note's attack phase).

Note that we set the starting address only 61 frames ahead, to
compensate for the interpolator's epsilon. Unlike for PCM playback, we
don't even need to manually silence-fill the first frames in the cache,
because we insert some silence in front of each sample anyway.

A challenge are extremely short samples with a loop end below the cache
size, because a) we'd have to wrap the current address to be within the
loop and b) automatic pre-filling of the cache with the right data does
not work in this case.

We could pre-fill the cache manually, but that's slow, requires
additional code for each sample width, and is made even more complex by
the driver's virtual address space having no contiguous mapping for the
CPU.

We could have the engine fill the cache piece-wise (which is really what
happens when playback is running), but that would also be complex, and
we'd need to wait for the engine to handle each piece, so it wouldn't be
that much faster than the manual fill.

For the case of requiring only one loop iteration prior to reaching the
cache size, we could leverage the engine's looping mechanism around
CCR_CACHELOOPFLAG, but this special case doesn't seem worth the
complexity.

So we just unroll the loop as far as necessary to be able to play back
the sample without any fiddling.

Pedantically, this would be incorrect for loop-until-release samples
with a low loop end which are released very quickly, but that would be
relatively harmless, is not a plausible use case in the first place, and
SoundFont sample mode 3 isn't actually implemented anyway (it's
conflated with mode 1, infinite looping).

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_callback.c |  7 ++--
 sound/pci/emu10k1/emu10k1_patch.c    | 53 +++++++++++++++++++++++++---
 2 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10=
k1_callback.c
index 5f6c47cbb809..ef26e4d3e2a3 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -255,7 +255,7 @@ lookup_voices(struct snd_emux *emu, struct snd_emu10k1 =
*hw,
 		/* check if sample is finished playing (non-looping only) */
 		if (bp !=3D best + V_OFF && bp !=3D best + V_FREE &&
 		    (vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_SINGLESHOT)) {
-			val =3D snd_emu10k1_ptr_read(hw, CCCA_CURRADDR, vp->ch);
+			val =3D snd_emu10k1_ptr_read(hw, CCCA_CURRADDR, vp->ch) - 64 + 3;
 			if (val >=3D vp->reg.loopstart)
 				bp =3D best + V_OFF;
 		}
@@ -364,7 +364,7 @@ start_voice(struct snd_emux_voice *vp)
=20
 	map =3D (hw->silent_page.addr << hw->address_mode) | (hw->address_mode ? =
MAP_PTI_MASK1 : MAP_PTI_MASK0);
=20
-	addr =3D vp->reg.start;
+	addr =3D vp->reg.start + 64 - 3;
 	temp =3D vp->reg.parm.filterQ;
 	ccca =3D (temp << 28) | addr;
 	if (vp->apitch < 0xe400)
@@ -432,6 +432,9 @@ start_voice(struct snd_emux_voice *vp)
 		/* Q & current address (Q 4bit value, MSB) */
 		CCCA, ccca,
=20
+		/* cache */
+		CCR, REG_VAL_PUT(CCR_CACHEINVALIDSIZE, 64),
+
 		/* reset volume */
 		VTFT, vtarget | vp->ftarget,
 		CVCF, vtarget | CVCF_CURRENTFILTER_MASK,
diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1_=
patch.c
index 481fe03fef4d..2a13fb32c1d2 100644
--- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -31,6 +31,7 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_s=
f_sample *sp,
 	int shift;
 	int offset;
 	int truesize, size, blocksize;
+	int loop_start, loop_end, loop_size, data_end, unroll;
 	struct snd_emu10k1 *emu;
=20
 	emu =3D rec->hw;
@@ -64,12 +65,35 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 		}
 	}
=20
+	loop_start =3D sp->v.loopstart;
+	loop_end =3D sp->v.loopend;
+	loop_size =3D loop_end - loop_start;
+	if (!loop_size)
+		return -EINVAL;
+	data_end =3D sp->v.end;
+
 	/* recalculate offset */
 	sp->v.start +=3D BLANK_HEAD_SIZE;
 	sp->v.end +=3D BLANK_HEAD_SIZE;
 	sp->v.loopstart +=3D BLANK_HEAD_SIZE;
 	sp->v.loopend +=3D BLANK_HEAD_SIZE;
=20
+	// Automatic pre-filling of the cache does not work in the presence
+	// of loops (*), and we don't want to fill it manually, as that is
+	// fiddly and slow. So we unroll the loop until the loop end is
+	// beyond the cache size.
+	// (*) Strictly speaking, a single iteration is supported (that's
+	// how it works when the playback engine runs), but handling this
+	// special case is not worth it.
+	unroll =3D 0;
+	while (sp->v.loopend < 64) {
+		truesize +=3D loop_size;
+		sp->v.loopstart +=3D loop_size;
+		sp->v.loopend +=3D loop_size;
+		sp->v.end +=3D loop_size;
+		unroll++;
+	}
+
 	/* try to allocate a memory block */
 	blocksize =3D truesize << shift;
 	sp->block =3D snd_emu10k1_synth_alloc(emu, blocksize);
@@ -89,19 +113,38 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 	offset +=3D size;
=20
 	/* copy provided samples */
-	size =3D sp->v.size << shift;
-	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size, =
xor)) {
-		snd_emu10k1_synth_free(emu, sp->block);
-		sp->block =3D NULL;
-		return -EFAULT;
+	if (unroll && loop_end <=3D data_end) {
+		size =3D loop_end << shift;
+		if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size,=
 xor))
+			goto faulty;
+		offset +=3D size;
+
+		data +=3D loop_start << shift;
+		while (--unroll > 0) {
+			size =3D loop_size << shift;
+			if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size=
, xor))
+				goto faulty;
+			offset +=3D size;
+		}
+
+		size =3D (data_end - loop_start) << shift;
+	} else {
+		size =3D data_end << shift;
 	}
+	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size, =
xor))
+		goto faulty;
 	offset +=3D size;
=20
 	/* clear rest of samples (if any) */
 	if (offset < blocksize)
 		snd_emu10k1_synth_memset(emu, sp->block, offset, blocksize - offset, fil=
l);
=20
 	return 0;
+
+faulty:
+	snd_emu10k1_synth_free(emu, sp->block);
+	sp->block =3D NULL;
+	return -EFAULT;
 }
=20
 /*
--=20
2.44.0.701.g2cf7baacf3.dirty

