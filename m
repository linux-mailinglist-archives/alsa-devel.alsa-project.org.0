Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63A8984A9
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:06:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B70D2CB7;
	Thu,  4 Apr 2024 12:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B70D2CB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225210;
	bh=p5H8qT3c61nxNpGeIRjF9vQy0bV7RzOPQCe3zgQYZS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I+cnc1HhK/L9Hxym9oKv7YFSNCn3oShDvcj0TaWYReAachF09QEyFgGZp8MjmxZLU
	 EebvVs9rgFgLQoxUsgbos8xAAFnC0u6CE/pB/rTaOFItjZkCghBOf3gffTS6sYGlDF
	 2L2qMFuyzDLNaH4OPyHkBx/hGrsKozg3beibbbi4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1067F80792; Thu,  4 Apr 2024 12:03:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C2F2F80771;
	Thu,  4 Apr 2024 12:03:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB678F8060F; Thu,  4 Apr 2024 12:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75258F80568
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75258F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=EaMRzeET
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224851; x=1712829651;
	i=oswald.buddenhagen@gmx.de;
	bh=wc/b2wKYlaKGB4GrE+oPQYlWRWZPL4Kua9Hy2ujNQDM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=EaMRzeETOgCRJkneGqpPrKJxS0jPQdj8oTrL1ucHo//Xj+TlCUM9NTqCVlUz83N2
	 3/fmREpWENK2lIdgeldvIMWTg9BqJH4HBPS5V90IduEugyV42aBZogTqkpy0+soTF
	 6tL5RAYppSzBxVrHKCiHhmvOC0lDP1zY5giyicPcar6Rc5tPX9zHjCz2iqgpuD+0q
	 r7oy8PI7JNc+Te7We6+5DOokUM4QpTw72hrwevt5v6ergXGU3mPO9GsvGNW8u/mMq
	 H8sPbdBjMii96sg6/lTQpMxaTVQfTiCYD5y/IAKQX+TPwH/HjGrzNd7bbBYWC9GOD
	 VbPJWBCTM0UCYMlKMw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QsO-1sqIqr0dx0-011Q7g; Thu, 04
 Apr 2024 12:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RFS-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 06/17] ALSA: emux: centralize & improve patch info
 validation
Date: Thu,  4 Apr 2024 12:00:37 +0200
Message-ID: <20240404100048.819674-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Agec8423UNwgTmIPHB/JY3Scx73I78tY1GaTiBH+HkBo0zYKxS4
 sfqnemtwBEV4tsoBJU06y3uMMDNID56xvtqHhoQfU+p2jTWRYEs1Qm6+1CCY9h4N8fVCwys
 mT24m9Br5LwpT0TfrkCD7GL+y5Vive+4K2exCeyPqKC+FYmamZpPNbPj+nSzfvNbWExr6AZ
 hXirwyl3h7dm9EmrVTOUQ==
UI-OutboundReport: notjunk:1;M01:P0:GvLFlI9TuI4=;I3pNPhChd2eRiUYtDr58DXCXKdl
 0YXeDX0eNFLEYGjMqaWGRAKEfLP3HswL9YeMNdxZ1KLirNsx6IFuhHUg+YknhU7IFl3uTikU8
 rI0HvvZ+5pL3nlg8cseb5oDvecPrkUlwlAT+n38/iArBLb5b6aF3/YpRNIwnImj1UMFDuLpU+
 hN1s3CPa3kMrHVN54ZNk/IYbu/xJomG6gMfbptd46P1UfSxKz+dJQTBWIb29gxZE9l/dF1+pa
 A5fSxJ6aogshRp6KLywHofvYHlSf6MwMd0cTqQbfD3s4d4O2YAsTFhmDQeCrr7KiAWpogaZvG
 ZqbQIC/Lyvqsgs0LNuo2cMD1p/jUWRRMElqOQQNCHdQSk1CwyMwUt7/q3a3th1WBNVsNjVn+z
 Jv/9/yvFdl3DxN7Wog8kisZF9EiBVe3X7Ck7J+j0FKQuhyHeaJeOQwZ8zid0XsRrk5dY3ME44
 /njTXs0E9hIZC0xMzgdW69G7rgSr0g0c4rd1CREaHtttiXUJn8nfGH4i04h+Ay/LVueDp/0P8
 7m37DmDDS2u06tt5l9KuXHDSfJ2i1dFKWa1/c1671IY+YLR5dBCZyxlvwWDwXq4muzyhzZBUE
 KJS64AIowuuS61keB6VyqlrDFEH0aZvCFanorwCmUrkpOh8vtqRn+T+3xdsisSCInytpCjn1k
 2pTxT4XPimCpcyCWYrXdfEppo7r9OJg92kq7ZZFeDn9H0RlUl3XFi0CLPIQ8FHBGJnG3RhlCi
 TYhpxvJ8+Pkz+pCmDnCUrUX8uhhwIDCof9G+PVAlUJH8A1XBjL6ilr2POiCwkMnKk8eodWOwe
 x8di5RRVLdoYDb/G7b1SeLnxKWNpKulYqkirMCdHtPo7k=
Message-ID-Hash: XLDIBU6ELG3V3U6QKKWLVFUDHYWM6QH7
X-Message-ID-Hash: XLDIBU6ELG3V3U6QKKWLVFUDHYWM6QH7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XLDIBU6ELG3V3U6QKKWLVFUDHYWM6QH7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This does several closely related things:
- Move the code from the drivers into the SoundFont loader, which
  de-duplicates it.
- Sort of explain the weird "recalculate address offset" feature. Note
  that I don't think it actually makes any sense - the calling user
  space code should do that. The background is certainly that the source
  data (the SoundFont format) uses pointers into a single wave block
  (and the API allows doing the same for on-board ROM), but the API
  expects the wave data from user space to be pre-chopped into
  individual patches anyway.
- Make sure that the specified offsets actually lie within the supplied
  wave data. Note that we don't validate ROM offsets, so one can play
  back anything within the sound card's address space.
- In load_guspatch(), don't call the sample_new callback anymore when
  the patch size is zero, as was already the case in load_data(). The
  callbacks would instantly return in that case anyway; these checks are
  now removed.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/isa/sb/emu8000_patch.c      | 13 -----------
 sound/pci/emu10k1/emu10k1_patch.c | 16 -------------
 sound/synth/emux/soundfont.c      | 37 ++++++++++++++++++++++++++++++-
 3 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/sound/isa/sb/emu8000_patch.c b/sound/isa/sb/emu8000_patch.c
index 8c1e7f2bfc34..ab4f988f080d 100644
=2D-- a/sound/isa/sb/emu8000_patch.c
+++ b/sound/isa/sb/emu8000_patch.c
@@ -148,13 +148,6 @@ snd_emu8000_sample_new(struct snd_emux *rec, struct s=
nd_sf_sample *sp,
 	if (snd_BUG_ON(!sp))
 		return -EINVAL;

-	if (sp->v.size =3D=3D 0)
-		return 0;
-
-	/* be sure loop points start < end */
-	if (sp->v.loopstart > sp->v.loopend)
-		swap(sp->v.loopstart, sp->v.loopend);
-
 	/* compute true data size to be loaded */
 	truesize =3D sp->v.size;
 	if (sp->v.mode_flags & (SNDRV_SFNT_SAMPLE_BIDIR_LOOP|SNDRV_SFNT_SAMPLE_R=
EVERSE_LOOP))
@@ -177,12 +170,6 @@ snd_emu8000_sample_new(struct snd_emux *rec, struct s=
nd_sf_sample *sp,
 			return -EFAULT;
 	}

-	/* recalculate address offset */
-	sp->v.end -=3D sp->v.start;
-	sp->v.loopstart -=3D sp->v.start;
-	sp->v.loopend -=3D sp->v.start;
-	sp->v.start =3D 0;
-
 	/* dram position (in word) -- mem_offset is byte */
 	dram_offset =3D EMU8000_DRAM_OFFSET + (sp->block->offset >> 1);
 	dram_start =3D dram_offset;
diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index 49214c226808..47d69a0e44bc 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -35,28 +35,12 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 	if (snd_BUG_ON(!sp || !hdr))
 		return -EINVAL;

-	if (sp->v.size =3D=3D 0) {
-		dev_dbg(emu->card->dev,
-			"emu: rom font for sample %d\n", sp->v.sample);
-		return 0;
-	}
-
 	if (sp->v.mode_flags & (SNDRV_SFNT_SAMPLE_BIDIR_LOOP | SNDRV_SFNT_SAMPLE=
_REVERSE_LOOP)) {
 		/* should instead return -ENOTSUPP; but compatibility */
 		printk(KERN_WARNING "Emu10k1 wavetable patch %d with unsupported loop f=
eature\n",
 		       sp->v.sample);
 	}

-	/* recalculate address offset */
-	sp->v.end -=3D sp->v.start;
-	sp->v.loopstart -=3D sp->v.start;
-	sp->v.loopend -=3D sp->v.start;
-	sp->v.start =3D 0;
-
-	/* be sure loop points start < end */
-	if (sp->v.loopstart >=3D sp->v.loopend)
-		swap(sp->v.loopstart, sp->v.loopend);
-
 	/* compute true data size to be loaded */
 	truesize =3D sp->v.size + BLANK_HEAD_SIZE;
 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK)
diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index ad0231d7a39d..6d6f0102ed5b 100644
=2D-- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -689,6 +689,21 @@ find_sample(struct snd_soundfont *sf, int sample_id)
 }


+static int
+validate_sample_info(struct soundfont_sample_info *si)
+{
+	if (si->end < 0 || si->end > si->size)
+		return -EINVAL;
+	if (si->loopstart < 0 || si->loopstart > si->end)
+		return -EINVAL;
+	if (si->loopend < 0 || si->loopend > si->end)
+		return -EINVAL;
+	/* be sure loop points start < end */
+	if (si->loopstart > si->loopend)
+		swap(si->loopstart, si->loopend);
+	return 0;
+}
+
 /*
  * Load sample information, this can include data to be loaded onto
  * the soundcard.  It can also just be a pointer into soundcard ROM.
@@ -727,6 +742,21 @@ load_data(struct snd_sf_list *sflist, const void __us=
er *data, long count)
 		return -EINVAL;
 	}

+	if (sample_info.size > 0) {
+		if (sample_info.start < 0)
+			return -EINVAL;
+
+		// Here we "rebase out" the start address, because the
+		// real start is the start of the provided sample data.
+		sample_info.end -=3D sample_info.start;
+		sample_info.loopstart -=3D sample_info.start;
+		sample_info.loopend -=3D sample_info.start;
+		sample_info.start =3D 0;
+
+		if (validate_sample_info(&sample_info) < 0)
+			return -EINVAL;
+	}
+
 	/* Allocate a new sample structure */
 	sp =3D sf_sample_new(sflist, sf);
 	if (!sp)
@@ -974,6 +1004,11 @@ load_guspatch(struct snd_sf_list *sflist, const char=
 __user *data, long count)
 	smp->v.loopend =3D patch.loop_end;
 	smp->v.size =3D patch.len;

+	if (validate_sample_info(&smp->v) < 0) {
+		sf_sample_delete(sflist, sf, smp);
+		return -EINVAL;
+	}
+
 	/* set up mode flags */
 	smp->v.mode_flags =3D 0;
 	if (!(patch.mode & WAVE_16_BITS))
@@ -1011,7 +1046,7 @@ load_guspatch(struct snd_sf_list *sflist, const char=
 __user *data, long count)
 	/*
 	 * load wave data
 	 */
-	if (sflist->callback.sample_new) {
+	if (smp->v.size > 0 && sflist->callback.sample_new) {
 		rc =3D sflist->callback.sample_new
 			(sflist->callback.private_data, smp, sflist->memhdr,
 			 data, count);
=2D-
2.42.0.419.g70bf8a5751

