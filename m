Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01997898499
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B2562C8B;
	Thu,  4 Apr 2024 12:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B2562C8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225045;
	bh=iEN1KqrjQn+PNiPB7210cC49xYYGKZcR+MLxEG2w4dE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ctm8gbr49iHPyI3SUue0DjC+xrF2iJThBpDmL+qMopkUDNe8RikxivfNiP5fayNqC
	 ONd7wemxRW0FifQwltET55RRTuO7BhUIVLhpDWWxjb2RlhMDOmFS1SKcWd55OZm/2x
	 f5oFHTp2hTmvH2/r1f7rwUCHyDjftdK5CHVnrXF0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27781F80620; Thu,  4 Apr 2024 12:02:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93ACBF8060D;
	Thu,  4 Apr 2024 12:02:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8DC3F8016E; Thu,  4 Apr 2024 12:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4797F80570
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4797F80570
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Y7DcyFbn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224851; x=1712829651;
	i=oswald.buddenhagen@gmx.de;
	bh=TUz8ah5z8pNT083e8DQKx/8kl8YBAd0RX2+UgScRUnc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=Y7DcyFbnfDt1ZThlGI2cPGkDU+D4nryak0719ue5hvoO37qDmm9MhoJ5pKJEpDlW
	 iIApHK0qDacyiZhs7aPHWJgKPm8zvjYSVJgxCIihswTorHWSmsf0TS5eqN08Ioyn6
	 GnaCCwqjiQa92Ts1M8kV+CO54oehqVj/w7YkE6IkB2niZQdvfW4O5AhD0mZDFeS9a
	 qeEw+EtlXVYkRVYbHCU7X34YlmW7SEmtBlutcCa45orVBHkqLkihYN5pCCVCXB9lb
	 GiaT+1Gn2x7I+NmEqi/wTbojVAZfKjdzQj94Ylu9fT9sbvgsoKlEaDgRV8ibO4k54
	 uNIT5XWjeLtq0/k76w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqaxO-1sensB0mrQ-00mfMg; Thu, 04
 Apr 2024 12:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RFN-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 05/17] ALSA: emu10k1: prune vestiges of
 SNDRV_SFNT_SAMPLE_{BIDIR,REVERSE}_LOOP support
Date: Thu,  4 Apr 2024 12:00:36 +0200
Message-ID: <20240404100048.819674-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ESkvr/u4kvFeDcA3F2nAvwudrXYtfhJK34kNYdS2pmpIgFwkF1d
 Jb/rXopYDzGFksZ/yMUXzxjtKv+8HHTrUBh5P8Pb12NnELw3/y0W/2E9HUjFD4pufhvBqiJ
 aGYpWGCyh6oQZFd4CUIRl8JsFBwpNBBCTB5eqsRhTc7kMCUwu5CzYjzMrGvCQZsSGYR+LVW
 m99J4FWVH0JUOcXpp7N0A==
UI-OutboundReport: notjunk:1;M01:P0:UfHc/XmSlUQ=;e0gyY8qJMXf9Xr2ShsupMA7GQYu
 47DHqAjs3ogsF0bKcswx2acoo+ddodDvSz9hhGSfWPk5RFguc5Y4KZWyi1ygfaojMts45MdE2
 0EUXCFMu7Xvat/BxjZFWT+g7/PG7LCS2HEvUtqguuBQrSe66u3jpR/glcKgfsq0rFf4a++NtM
 aCqDGHYhKOmOPxc4Q8sI/RfQIY0KlkDJy9WxyPWOTSDTwcJSt8Egv9N9L5VG0cERNQV+wNzEq
 M/M9d5O++FnToVO8oN0s11WoBr3XFOotjb9WUOpWOmWnanqPb0KcpoLkJjRajQqZA/dwFA1oS
 LWt7nm+vJqc+YiHgoEUkncO+veO3AmUtAz6DzXDRVqI622hYXVafvG4IicyaMjIOJ5m6Bb8R2
 YdEqK+JWAnVR2bH6wTeEWCDywBw3B/srCDREhNeuC8qBMcRUHxjrWsLrYoBl7vhx+YnSrtxMv
 NkGvotFZh2UMm3eJnZSgT9vQwC2h9EnLp/z5vwpOglX1uWf9R/zCOo9dPWwXQxj2+ClH9Iecq
 IG9rWvQq7Nbh302FXsnqg3r0Uyqd+cSvKHeDoQkV1JoyjT65P3bZZmn2afUb6V3zYRqQEldXF
 9EOR+P/Yp4rF9BTpLnSvvPqhDefH2gJNV1V67mqrCxVKzvKVAI++XME8ZQs7Kf2ISSyCrc3qf
 j+MVYPw+mlyoYPstiRIW7SWgx2BbHiX5uUCqLgbeEV6dKSANudDgDQV/WVkwEXIV1h+Q3ovZV
 0fBGoJhuhDsmlEMh3ChH8VSDFIGvZ/SC+NDbAqWnqyKgkgdp1iQAo85O8XbBWib3bILasDGj9
 gY3KuQI30E3ost61G7xNIkon7OwWasM9Cd5CR6jhfKcHo=
Message-ID-Hash: IYCARJ3H76JPHJUEKSBPCY6LZUQ2B5EC
X-Message-ID-Hash: IYCARJ3H76JPHJUEKSBPCY6LZUQ2B5EC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYCARJ3H76JPHJUEKSBPCY6LZUQ2B5EC/>
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
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 73 ++++---------------------------
 1 file changed, 8 insertions(+), 65 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index 89890f24509f..49214c226808 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -28,8 +28,6 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 {
 	int offset;
 	int truesize, size, blocksize;
-	__maybe_unused int loopsize;
-	int loopend, sampleend;
 	unsigned int start_addr;
 	struct snd_emu10k1 *emu;

@@ -43,32 +41,24 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 		return 0;
 	}

+	if (sp->v.mode_flags & (SNDRV_SFNT_SAMPLE_BIDIR_LOOP | SNDRV_SFNT_SAMPLE=
_REVERSE_LOOP)) {
+		/* should instead return -ENOTSUPP; but compatibility */
+		printk(KERN_WARNING "Emu10k1 wavetable patch %d with unsupported loop f=
eature\n",
+		       sp->v.sample);
+	}
+
 	/* recalculate address offset */
 	sp->v.end -=3D sp->v.start;
 	sp->v.loopstart -=3D sp->v.start;
 	sp->v.loopend -=3D sp->v.start;
 	sp->v.start =3D 0;

-	/* some samples have invalid data.  the addresses are corrected in voice=
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

 	/* compute true data size to be loaded */
 	truesize =3D sp->v.size + BLANK_HEAD_SIZE;
-	loopsize =3D 0;
-#if 0 /* not supported */
-	if (sp->v.mode_flags & (SNDRV_SFNT_SAMPLE_BIDIR_LOOP|SNDRV_SFNT_SAMPLE_R=
EVERSE_LOOP))
-		loopsize =3D sp->v.loopend - sp->v.loopstart;
-	truesize +=3D loopsize;
-#endif
 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK)
 		truesize +=3D BLANK_LOOP_SIZE;

@@ -96,65 +86,18 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 	snd_emu10k1_synth_bzero(emu, sp->block, offset, size);
 	offset +=3D size;

-	/* copy start->loopend */
-	size =3D loopend;
+	/* copy provided samples */
+	size =3D sp->v.size;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
 	if (offset + size > blocksize)
 		return -EINVAL;
 	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size)=
) {
 		snd_emu10k1_synth_free(emu, sp->block);
 		sp->block =3D NULL;
 		return -EFAULT;
 	}
 	offset +=3D size;
-	data +=3D size;
-
-#if 0 /* not supported yet */
-	/* handle reverse (or bidirectional) loop */
-	if (sp->v.mode_flags & (SNDRV_SFNT_SAMPLE_BIDIR_LOOP|SNDRV_SFNT_SAMPLE_R=
EVERSE_LOOP)) {
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
-	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size)=
) {
-		snd_emu10k1_synth_free(emu, sp->block);
-		sp->block =3D NULL;
-		return -EFAULT;
-	}
-	offset +=3D size;

 	/* clear rest of samples (if any) */
 	if (offset < blocksize)
=2D-
2.42.0.419.g70bf8a5751

