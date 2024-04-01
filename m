Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 911578939FB
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BA21219F;
	Mon,  1 Apr 2024 12:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BA21219F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711966128;
	bh=iEN1KqrjQn+PNiPB7210cC49xYYGKZcR+MLxEG2w4dE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EAXrTffqybf/8FDwnALYccwix5VWFqz6xuNmS8M275nUBmzrWN4j9srYGEwOhw8Un
	 hwgnbffd9AmCHuG8NAFGdCQ4Y3H8+eUVHVHPHG5zA5JvkttpW/BnB7TIguj8ELgx2b
	 EIGEjndLye7t1rFeVkP+vkyHZjZJp8sdwqTNrT4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8AEBF805ED; Mon,  1 Apr 2024 12:08:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F1C7F805CB;
	Mon,  1 Apr 2024 12:08:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92B20F805BD; Mon,  1 Apr 2024 12:07:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E70AF8020D
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E70AF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Wa3x/XdV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711966066; x=1712570866;
	i=oswald.buddenhagen@gmx.de;
	bh=TUz8ah5z8pNT083e8DQKx/8kl8YBAd0RX2+UgScRUnc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=Wa3x/XdVMcPVhz5ToWJvQtGIC6FIUkjf3OxHBbkQguIFHIts50eRU61rbZCq4afQ
	 ofQ4KR95TfznfFbkRmiJjqLaE1pjZEEuZlSs/LdXPeitZejtNa07m7Mvk0sx5KVZn
	 0L0K4msJ6IrxRkAx8vsU9jpfHprS4woJcgpu9G5c024Iac2G9vrIx/1mREq0Ht9tw
	 B3huvj/EdtQc5aL1j8ESXON7XEFt5J5m0KSEXBdgM4Yzkv19gcShDCKyu1EnoJV+c
	 rcyI5y4JSgxcCAkzGENdgvfwFTEqMPiKngTLKpcbUBhCPFa/xfwMG/7bxUr7cO9+b
	 wh5HimEe1bI3RmgbwA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7K3Y-1ruYUs3ddc-007jWm; Mon, 01
 Apr 2024 12:07:45 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7e9-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 05/18] ALSA: emu10k1: prune vestiges of
 SNDRV_SFNT_SAMPLE_{BIDIR,REVERSE}_LOOP support
Date: Mon,  1 Apr 2024 12:07:29 +0200
Message-ID: <20240401100742.506001-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YNtA1YxaPvWyD+slmpGZQQSEj+m2PmnVNPzrMCStPYfP3yEDFsx
 APkDqKo+XhSBT+w59QdRmMeAmbyoRbwXb7mogTQNQej/igJ3Kr1wzM6/IGwW2uYFH6mZVtS
 mde26jHCBLgjyIT2OA01CKD8VyFUYG0M1FV2pmxD4lSoBThR88gj37bxkQcqsrAwOZHP615
 0+QhlwayALhJifbg0arfg==
UI-OutboundReport: notjunk:1;M01:P0:VG7oq8BLiNA=;vcpCQrTrUMDf1pJ5kYbTzm0CxrK
 Kk7ceDf6dRFmuyAiTpuMKBzVmpq0WMO2yvhRPu3jb0vbvcxtWgmeAw1IoiPSL1z+1RgeQ7s0O
 SMab89jtJmN1A2BfiH72j+QxHS3D3lRlmPbGsUoY4DRyXzm/9TRjifYQIZF+gfSb4ALkj7n0t
 mHvK8d9Q1BlXUt3DimscKHdGCvLaPVES1bioYxEqu7RiElpJ/BeDS0DesaOI0lzVFxX15mmNj
 UuxkyLclV+Xb3/Ctul828v7kM2QjlCTHTJue63a6bXnW+bquuWUafEwhXlIHVakIvvOMnoFw8
 bTfF0cC9IHxiawNjEOy7+Rp3iD6actE+9I6W07vzV+Zawh6KvOW9tKrl664WJ5FJS5sq7Sdi4
 gGtKXsIt24wVdInjpF1uMTCh8/G4k+pWKmSrB/4fJugRqaBdivyxjGn/RMzrN98GqRpjM5VPE
 rqrVF19HMnAegL1RGypEyHcX5eUy9y2lwCmWWvwq34bMAKCm77lxJEr3/kWoy+LYgZ7Q4YwMP
 N+PmmGjB62UZAOLwICsVE5j7pO/cYRv41EYQdme1jCOYFrQXo1a6odHLV5Gn7BG+K41GLBBhB
 dbv7GbXmJ4XP9D3oqeDBK8O60YqecpATxfT29GRXt2pLgbK/FsixgpjZp5B+wAUK5L6rjJdgF
 LvKI320bED5/jS2194hVloKgV+HHwrONd02GavKfcDvh9ohahJHqiV2uMJmngtgyPmQYYE6ok
 NlCSc3/iRpLNSqZ2dOPRpLwk9Cpv3msluapnKLjjbb5pcwwyXFmA66nTQE8NeNWcYSU9nZY21
 IET2rShcibfwdft8yki0txhVGhhGkztzbyp9wQDwyCaE8=
Message-ID-Hash: EIBVPM6I4EZ5KDQQHUGFDL5R7JYKUKRA
X-Message-ID-Hash: EIBVPM6I4EZ5KDQQHUGFDL5R7JYKUKRA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EIBVPM6I4EZ5KDQQHUGFDL5R7JYKUKRA/>
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

