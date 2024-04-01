Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69D98939FC
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45DDD22A7;
	Mon,  1 Apr 2024 12:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45DDD22A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711966142;
	bh=p5H8qT3c61nxNpGeIRjF9vQy0bV7RzOPQCe3zgQYZS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rDtoTlsH+RC7y2iZPHTVBUsPzve5X8oZBZSdaDQGSz84tKnAJ49NHkVDQgHk6S+Z7
	 SYRtsiba/pqh0byotXF60cNFMwwQX3y5kMLF7t9+DVU7DzxiWQKpzKllT1UTvcFvcw
	 TWB6Ml0lGwNiuYkfv/BnJMr8XXU61NGLUCRyAaJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6660F805F0; Mon,  1 Apr 2024 12:08:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74B55F805FB;
	Mon,  1 Apr 2024 12:08:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5910F805F0; Mon,  1 Apr 2024 12:08:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 50A79F8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50A79F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ZhP/vasr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711966066; x=1712570866;
	i=oswald.buddenhagen@gmx.de;
	bh=wc/b2wKYlaKGB4GrE+oPQYlWRWZPL4Kua9Hy2ujNQDM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=ZhP/vasrcWPejFV4GRPcvKBd7bh55z8QW31t8MVYmsShAE8OIxlX3niYGIco5vfh
	 x3wReWzgPw5ElNpeoSvswvoW6kKX6jXdOe1zPwtPTbANFnsPonz7tHLEVuDoBZdum
	 SL75A/nlfn+Lrby5weIeDcZEA9lxiAJTAwreujnDwYXl/aUP+M0q3J27rFzXI0rpF
	 9FdTl1jozTngXmQy11Vyl5ZwqMQrgAEqFBTK0YOJnjE3SaWJBxOJb4ZTyHM0UicQZ
	 81cFqigZ+IHH7r8SNMdEcbuqF+3RE0/pMWMyEtaQK/HkQf2U4r4+GDAucArsjlnNU
	 eXCPuZb0W60O+7R4pg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7zBb-1suw0r3SuB-0150ig; Mon, 01
 Apr 2024 12:07:45 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7eE-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 06/18] ALSA: emux: centralize & improve patch info validation
Date: Mon,  1 Apr 2024 12:07:30 +0200
Message-ID: <20240401100742.506001-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VNDo2xugJQJxXq3f1LZ+BDg+tTOX4UYnl2gMicSjvO9RaqXpSpY
 v32NFAMgUBMjHTpvFbbBeoqx7MgDE44EY9pUI0K1eYStfILFcxEyMX5aHU8WtGzs8/j2wXG
 kLnFxDMbHOyiJ73kSCBHj8kVEsYsl848Lo4xl5aF3X7ZFmRq/asS8uuh+FHdVPfCAzD/AFO
 fbxZalIFcVp7gUb7b90Tw==
UI-OutboundReport: notjunk:1;M01:P0:tTYLddqBOfo=;8wtnKcddPeo9RjUW3aX08antoZT
 VibbQtL2X2D8WWKrM/BlrEIGVEwm2zgRw9Goe84PCbb3MRq1OAC5t3jZ37az4Q8LmUlrzADqw
 Q6w0XpVyP27Qy5nd8BhFUYV2crnmxGjPVflE9zMo0Hor2Z1XXoikQbhXc/5SOdZQuzqy7zzFa
 S5CFer4ylBeBpdAtX32ijqmV9h/sljRiQIDG4tbDYKz8z3Y1h5KAuCrK4RhVOgJeN3u4Xp3Wb
 kWw6OOYVnMu60fMf2MyG4117QK+EJtiBIOAuXPUokQMcTAmrEUKTI3a/TA2SdkrWpZoTfhibU
 oeFDQLQzD9/9f//oQRxg5cor1mNQgHX7yXyL+J1Cg8agqo/NNFM7u0gI6wAbLrNgsO66+Ezv6
 Mj6UI8a8GKcfL/VxnPsvFXetwINOor6bVTYRY666wxF/LK9aSge1bIJqxeVmuDutqBgCWqfN+
 2+oyYedTnvMNSmXBJlW6Uj9eb7V+igEt2KK/i/bRmhhI9+pP4QMKBHPQqmYVdk0ME6LTHNO2f
 VF2H8HFM6/W7xuP/Mx3OpZS+KcDD1PXGYbODUws+lS6h4RW+Hk+bqzlBXbLzqsVxqDPGPirXr
 ZRzMtdtLGKfmv/okhzFI7/cs6ArOAIhaS0gW7JMYQxiW6Bq7rXUucDCnKIoSxk9V901Y3lWJM
 iQWWQoi0i9gGjj4V9KfjjNkaF5eYHX5F5VSDbS9VqU57WQZxXUT0vj3L97BTqLsZYlQMa2KY/
 MspDbQ/vW/SihL18SHFf7uqzZdx1s/EnTBTi9FjgK5NaMJnyj8ktWZvjS/KdHd7dzByo7HHXy
 rFwF0mlCJCquoTRNQKF5y0QK94BGhbnudXOGQjVCmPgQg=
Message-ID-Hash: RTBGDSQEVLLIBFO2XSVAQSAPW3P7YJHE
X-Message-ID-Hash: RTBGDSQEVLLIBFO2XSVAQSAPW3P7YJHE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTBGDSQEVLLIBFO2XSVAQSAPW3P7YJHE/>
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

