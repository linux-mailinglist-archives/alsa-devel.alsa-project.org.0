Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C1889849C
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:04:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E4A13E;
	Thu,  4 Apr 2024 12:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E4A13E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225079;
	bh=UVaRbStp7hUjjGdyl2p8A28xU1X5HHz84M1EfTPwcXg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MJT1f6vZUHkpsdwAa34qHOJ9ZZoFcKMk3FZgukcHm9k7wNFC7kz+Ma25iKQjIPT5t
	 RPw72mCqhpcqukBxmbgosiMdoeakZoLhSqMfNbwPw48XC6N2dvh2puniXDs56EH0tx
	 Andn0I9wD82ApV18AhneXnehNn8ss/z9VH9689t4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE7AEF805EA; Thu,  4 Apr 2024 12:03:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4A63F805E4;
	Thu,  4 Apr 2024 12:03:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B086F805CB; Thu,  4 Apr 2024 12:03:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57A8BF805C3
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A8BF805C3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=nISaqBOs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224978; x=1712829778;
	i=oswald.buddenhagen@gmx.de;
	bh=xQbIjFYLrIebpq0KXYLOANYrTHMgZbtxlkCRs6zkRSk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=nISaqBOszsfRfaZVSjqj3sIrwd33eZuHAqQhZTocIiJodh+tyvvFFQ5wNdEvDmup
	 4Zed7JahkurWLuaAF3ZJ3w+bHIizOJvYD7OX+jYk5d05lHKXtWYzdqR6WEg9/UIMT
	 cCJxwWgXUSB5eo75+1zv7vU687nyOtCnsUSlQ3FlLv7oJ0oWRDn1ZUOAsX3l5Yf7Q
	 eKZWqgSZQyzp+3vZoqZirbe0bOujHiU4eecQx5vgiF1yZKvKdRrD9EwIRzYj3s1cu
	 NrlcaSEJLJMcTw9rwObrxMJtOyf3jlP7xOPDGmTpvZT6Yee+V/jWjaNVqZMvfl2n5
	 jE9z/bkqErgcjvoC1w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b2T-1rtfuW3V77-0080bl; Thu, 04
 Apr 2024 12:02:57 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RGB-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 15/17] ALSA: emu10k1: fix wavetable playback position and
 caching, take 2
Date: Thu,  4 Apr 2024 12:00:46 +0200
Message-ID: <20240404100048.819674-16-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tr87jKOq6VdhwboNFWnkw/9G95FOaxyKvtEKdzYtyeUyeOyzbDK
 tJ8B5nOELsHgGgcNf1H1uwSCIRNOQrItyWDAFyKT15PGAP27J/9Zxbswe0iKpZ4wA6rEL7A
 uX/lP4NfRPJ1m3nMxNwQgjYlVSbZuM1DZjQ7cj4ysm2pkgHtJUo3p+u86DeZlN0P0Z5P5gL
 qMH2xpzZ2kmrOJYHMSgeg==
UI-OutboundReport: notjunk:1;M01:P0:v4cfGg9Sgdo=;ol6KXKETxqzy4wxex25peJKH1M6
 5VNB1iI06ePmR9FwFyeHR79+zGhRgId2h2vJdGL5U0+MwReibBqwRiNUtulyv4EU1FyTm/mAW
 hwQk2M7V4XWqOoPL+t6QCohshhghOgdIjh8+fDvE2a7p4HCtdcQwLx2X8Vq0dqH+sS9f5vxMg
 eNhlt6j2IzR8bhUwpHI46xx4POPjWJmdqWHBH1PIuVR2W5AubB9Xxd4XiYBFcIgmHIwHU3XnD
 VnXivdyiQnVZ/Q1uZf3h4BmBCW1Za8PHqsw5L6mZ20tItP1jx4le+r0XjfqXzsGEPR+wS9ahZ
 0lMBOwQ856L2s55v9Fx5qtj0iTguqjyXObloX3+rLMZVoMmqGY8Q+mye60zJYJ5Ez4u4m03En
 YWZ9Y0S6FgW5LJjhJhbOHglywYGvi+KCUywRNk8bXUxgkbEKynMp8zgbjTBbG5jAHfW56+vQZ
 5IrKgrdAkwV4MoEbEND91NxlBTzr1LRySNdzsZ1/R0KMqVZCt/wBy6g0U7pfPHDkDLWl6i5hI
 fODXD4nt8/TSeXfRffdKtuWpePB+kcaMpK+wWfZbwCl+0cUIxQ0tVDY/43OKdDe1pONYOR/wK
 AwVOFp6sYR9WMIZivoNROgOlqunzZrXLk4QGfv7mujdvaFkD2YpHa+lhZ/lf84mOy9pM5YHp3
 kumvQjNc49ngk5MuNQpYkznLJy/Rpw8e4h+ByT13OuDp7fZJfuyb26zvb/y2Q1/KObpeFH//0
 TT519JMC+s1IqWKdQ8orFiRdfYvoO4FN/IO74M3Vct/3SnrG5gezlmkO+67tNFs0PuYJC+aY/
 uEd6gJQDqX3YPuTRut8Z/xOrVyWUb6mj78gn0jYw8+6l8=
Message-ID-Hash: OD6XUHJ64QWDTX37SDIJ6NL2PO3LKT5O
X-Message-ID-Hash: OD6XUHJ64QWDTX37SDIJ6NL2PO3LKT5O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OD6XUHJ64QWDTX37SDIJ6NL2PO3LKT5O/>
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
=2D--
 sound/pci/emu10k1/emu10k1_callback.c |  7 ++--
 sound/pci/emu10k1/emu10k1_patch.c    | 53 +++++++++++++++++++++++++---
 2 files changed, 53 insertions(+), 7 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu1=
0k1_callback.c
index 5f6c47cbb809..ef26e4d3e2a3 100644
=2D-- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -255,7 +255,7 @@ lookup_voices(struct snd_emux *emu, struct snd_emu10k1=
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

 	map =3D (hw->silent_page.addr << hw->address_mode) | (hw->address_mode ?=
 MAP_PTI_MASK1 : MAP_PTI_MASK0);

-	addr =3D vp->reg.start;
+	addr =3D vp->reg.start + 64 - 3;
 	temp =3D vp->reg.parm.filterQ;
 	ccca =3D (temp << 28) | addr;
 	if (vp->apitch < 0xe400)
@@ -432,6 +432,9 @@ start_voice(struct snd_emux_voice *vp)
 		/* Q & current address (Q 4bit value, MSB) */
 		CCCA, ccca,

+		/* cache */
+		CCR, REG_VAL_PUT(CCR_CACHEINVALIDSIZE, 64),
+
 		/* reset volume */
 		VTFT, vtarget | vp->ftarget,
 		CVCF, vtarget | CVCF_CURRENTFILTER_MASK,
diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index 481fe03fef4d..2a13fb32c1d2 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -31,6 +31,7 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 	int shift;
 	int offset;
 	int truesize, size, blocksize;
+	int loop_start, loop_end, loop_size, data_end, unroll;
 	struct snd_emu10k1 *emu;

 	emu =3D rec->hw;
@@ -64,12 +65,35 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 		}
 	}

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
@@ -89,19 +113,38 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct s=
nd_sf_sample *sp,
 	offset +=3D size;

 	/* copy provided samples */
-	size =3D sp->v.size << shift;
-	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size,=
 xor)) {
-		snd_emu10k1_synth_free(emu, sp->block);
-		sp->block =3D NULL;
-		return -EFAULT;
+	if (unroll && loop_end <=3D data_end) {
+		size =3D loop_end << shift;
+		if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size=
, xor))
+			goto faulty;
+		offset +=3D size;
+
+		data +=3D loop_start << shift;
+		while (--unroll > 0) {
+			size =3D loop_size << shift;
+			if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, siz=
e, xor))
+				goto faulty;
+			offset +=3D size;
+		}
+
+		size =3D (data_end - loop_start) << shift;
+	} else {
+		size =3D data_end << shift;
 	}
+	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size,=
 xor))
+		goto faulty;
 	offset +=3D size;

 	/* clear rest of samples (if any) */
 	if (offset < blocksize)
 		snd_emu10k1_synth_memset(emu, sp->block, offset, blocksize - offset, fi=
ll);

 	return 0;
+
+faulty:
+	snd_emu10k1_synth_free(emu, sp->block);
+	sp->block =3D NULL;
+	return -EFAULT;
 }

 /*
=2D-
2.42.0.419.g70bf8a5751

