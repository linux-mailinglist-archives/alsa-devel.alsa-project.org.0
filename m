Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7AA893ADF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 14:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8422322CB;
	Mon,  1 Apr 2024 14:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8422322CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711974145;
	bh=p8VmdSIv36jVt1+XfF+1230eiSuQYLGhBqA4Dda0Zts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=luykSqOsVfDRVB9Kf6++3LdBKgMhnknUkY7/7qgi/ZjGAT5S+8kurfR63EdW/RF+3
	 /OZEjGMu5QGsUNM2bVMNdtiubHDseGh3ozPvIRlmAMvi13aIqsQpTfLGEtV1uM7dm+
	 88iULyNanLe0gGv/II2YYdhMBk5SHgrYBU9OMUK0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1786BF805C5; Mon,  1 Apr 2024 14:21:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62BCCF805C7;
	Mon,  1 Apr 2024 14:21:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2D52F805A9; Mon,  1 Apr 2024 14:21:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C0EDF80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 14:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C0EDF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=DxUnoiMP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711974087; x=1712578887;
	i=oswald.buddenhagen@gmx.de;
	bh=E1WN3O0eUQEwMp/eD3Qkah51/EPsPD29CUxxCxLVB1M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=DxUnoiMPokkLBXoPYaEIRbop4kksKtBblTeu820kgP2Azn6+jfrdKRvNtLS8Uhni
	 rO7DQicPbq4CtNun4M86f+a5eJOFy4RGlQv8sfV+IFouXY5YDeSOkZJnS4SMdFlGQ
	 OMX/K4oo5u6SABwNKCDTNnHYQqHJUVtE0Sc15FnqvAVnxorrlTjYxFRbpPaGx3y9c
	 OGPveoqd7GiDof4x9B7S1tcOLnSIgnaPODp9TnvWuvI8ySdUuU7ZN9GSt3n8S2XeA
	 Ip5w4QJYlDoFOQBm8MZ7rWF9pP8uYO2lILrcSEJS+dmYdJ1sgVkP4yBpkFG/VVYmF
	 HEuNSBUZ8AJamJ+1Vg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYXs-1sXReL1sn0-00m5kB; Mon, 01
 Apr 2024 14:21:27 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7f7-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 17/18] ALSA: emu10k1: fix playback of short wavetable samples
Date: Mon,  1 Apr 2024 12:07:41 +0200
Message-ID: <20240401100742.506001-18-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wsylWHzTkGnzHdAfoNc3djnONHlB7kuKB2dB3Z6YZWW8I/jCxGi
 E2d5e1YUm8I8T+D++gCpBH4WMCmyhx+GMq2VVvwbFr1wfTgrEKeLFkDZH3dHXkTpZgnN1Qy
 xkZ1oUIJzkskmKCtZVEIOYY/hYmmZwKJU4yFDwJfyBHXZ2YMCWKZFhYNv27UmaEUAFtQuR9
 oUqdsOA+ps0oNIHxwV/Sw==
UI-OutboundReport: notjunk:1;M01:P0:fX2A6gU7Zus=;aW6K/avbk5PVSZRjBp8/PIQCHSR
 sY3jTr15WSlh5teNQ3EfZUuaYh4t0TIvBYXbnKpps0plXLvObDz5QWOXIlM+XY5KjtFuFy0ud
 +H4ZgniSKfEG0Eq/y1NdA8ohjd7FQ4UlcurOh1GhF0aCR4tcHvCt1/dPSAg84Qgito27zLX9p
 C2t94bTAs5BNEXACKXcP+ZImBf1YirP9BavbxLs7rTs9qo8491RO7eFAy2cG5+JUvQ62dK8BX
 2er6/m1KlKReMDEd1b1b6N7GEImy661UsCR0ljO2/vNCKZKqlvWRIJEhJlZQt1Un/7ZTCqmF6
 5am5LPfu1y7bFhWIVYuJLs88DGHc4tfbzLak/VPI8gYItHf+yJ6+uffzHLgtIHQu6lq3xs2vv
 oTOckk2cdsRv7nX0Us44yCMqEeu1bVzi8ReVuqBJNp3FTa1ou6X4lsBxvCr5KeiMqCrz5yr83
 kXMOX2Jwg+dwr1U90srpJrhgMifzh3pqHL3tUvB6qcYewe6pSznlRQ5pGsF1ohNKMAK3VSalx
 7vNo9mvbBZ6XxjCsWzPSiZKS22m9zYCVIeatZJ9vfGS8s5pP267h+8btwxlYffdJf0S+UYJBA
 GKi9mtcpZyyHoteXE9hO2u4U3pK2Deg6dW6xl2wyP32OwNHfmZj7zPxCmspWOU8z9MBhmtZoG
 LGgocHNKYfnh8quTBkzuoKOxQPWjndgPRYbJK4uHqFY5Cp4aqMsRL2x+DFebdxw0lWcpkley3
 lKZHUhWB3JycHNDNQIXgiZCTKjkkOgmbjhFd7sgfKKGhMEmuFpIDtL+06MY/176kMdCl4Tvrh
 ivPRVdFAC4wFUv8SG3A7i7jaP5TT/8I87wsk3O6oBEeY4=
Message-ID-Hash: ZFJMFHCMGRR6UT6A5BHM67UJCEVUMSID
X-Message-ID-Hash: ZFJMFHCMGRR6UT6A5BHM67UJCEVUMSID
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFJMFHCMGRR6UT6A5BHM67UJCEVUMSID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As already anticipated in the linked commit, playback was broken for
very short samples. That's because we'd set the current position beyond
the end of the loop, so while the start would now be correct (due to the
cache lag), we'd run off the end of the sample and play garbage.

Fixing the playback position itself wouldn't be that hard (just modulo
it), but this wouldn't address pre-filling the cache with the right
data.

We could pre-fill the cache manually, but that's slow, requires
additional code for each sample width, and is made even more complex by
the driver's virtual address space having no contiguous mapping for the
CPU.

We could have the engine fill the cache piece-wise (which is really what
happens when playback is running), but that would also be complex, and
we'd need to wait for the engine to handle each piece, so it wouldn't be
that much faster than the manual fill.

For the case of requiring only one loop iteration prior to reaching the
cache size, one could leverage the engine's looping mechanism around
CCR_CACHELOOPFLAG, but this special case doesn't seem worth the
complexity.

So we just unroll the loop as far as necessary to be able to play back
the sample without any fiddling.

Pedantically, this would be incorrect for loop-until-release samples
with a low loop end which are released very quickly, but that would be
relatively harmless, is not a plausible use case in the first place, and
SoundFont sample mode 3 isn't actually implemented anyway (it's
conflated with mode 1, infinite looping).

Fixes: df335e9a8b (ALSA: emu10k1: fix synthesizer sample playback position=
 and caching, 2023-05-18)
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218625
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 53 ++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index 699aa0fec97b..dbfa89435ac2 100644
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

