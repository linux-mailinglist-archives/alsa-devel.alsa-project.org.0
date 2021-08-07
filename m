Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC5B3E5628
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 11:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5299F1672;
	Tue, 10 Aug 2021 11:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5299F1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628586136;
	bh=mQJB+0ykg5fFImIhdJrCAXN1kHD+nrXv6DFv1eUhN5U=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D0r8LHllc0LZVvdAgb39oJjRWZ80EWAw9cUvL1Z8HX+5lGt2IAFRkOAGv5lfRjDbO
	 HMzG+dNXVUPwHJRggcdlhyBFI7tPX00bCv1GpeyEeZtvjBSmLinLxDqWy8yE1HELUg
	 F5Te9//DolpH8Olrtau6hwqQ1iRjNRGwwUELAubk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1DB6F8016B;
	Tue, 10 Aug 2021 11:00:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 328C3F8027C; Sun,  8 Aug 2021 00:52:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sender4-of-o58.zoho.com (sender4-of-o58.zoho.com
 [136.143.188.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26BA4F800FD
 for <alsa-devel@alsa-project.org>; Sun,  8 Aug 2021 00:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26BA4F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=fnordco.com header.i=jwoods@fnordco.com
 header.b="M6Zf6ZAV"
ARC-Seal: i=1; a=rsa-sha256; t=1628376701; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Uq9Jnkwu6Lf33mNAiTq+xJcJ+Yy0vdrfxFv5+aGRXrqdKA48uq19HF9a0xVV4NnzpJCeUQIT975Lp/1qwSaj2JuSMlYM+LGZz1kjXGADzF/4WKTfL2MutsKjec1WHe7lc0kSn6Yc05NuB1+jDFlpOWBkfXbLa5o8nlu4ZjoMonU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1628376701;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=oIL8wY2/tB6WwxSMqwVq41qtFCqxg2Snu1RM+GA1M2w=; 
 b=KgY4CGG9AEI1swLpAuyUndzK5N4YTIBGHJ8H4hK7v1vh7wzuq69x1PapFOuBt7sj2Rz4aHbdgN/hwO7/EI0yTuaKZx77kyUMatuCIB12nvDJ+rssds5tt0xnR5aTTNvni7u8RzJpo3033h/FkeQ0kA5KeVtnFwbX2A5gIUVR580=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=fnordco.com;
 spf=pass  smtp.mailfrom=klaatu@fnordco.com;
 dmarc=pass header.from=<jwoods@fnordco.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1628376701; 
 s=zoho; d=fnordco.com; i=jwoods@fnordco.com;
 h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=oIL8wY2/tB6WwxSMqwVq41qtFCqxg2Snu1RM+GA1M2w=;
 b=M6Zf6ZAVevMhjFE1yTkKqXkbRmMnbXAlKM7njDODZS9fW7zkmrnlRVHMhFsFZvga
 DeaJ6rN5JB9vkbui5PDeGnnFJcM/k2lvmc35DT5ohexYZGcKJ7IlsHYFIwv2gdEyCaF
 OBMTlb6ui/9hv2o4jq/pxE/ltGH1G+1w+dnRYmb4=
Received: from mail.zoho.com by mx.zohomail.com
 with SMTP id 1628376695657906.428746929873;
 Sat, 7 Aug 2021 15:51:35 -0700 (PDT)
Date: Sat, 07 Aug 2021 15:51:35 -0700
From: Jeff Woods <jwoods@fnordco.com>
To: "Takashi Iwai" <tiwai@suse.de>
Message-ID: <17b22d08355.f21da1f938057.6900412371441404465@fnordco.com>
In-Reply-To: <s5htuk1ppvb.wl-tiwai@suse.de>
References: <17b1f9647ee.1179b6a05461889.5940365952430364689@fnordco.com>
 <YQ5Bb+mPgPivLqvX@kroah.com> <s5htuk1ppvb.wl-tiwai@suse.de>
Subject: Re: Kernel 5.13.6 breaks mmap with snd-hdsp module
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Tue, 10 Aug 2021 11:00:44 +0200
Cc: Greg KH <gregkh@linuxfoundation.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
 regressions <regressions@lists.linux.dev>, stable <stable@vger.kernel.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 ---- On Sat, 07 Aug 2021 02:26:32 -0700 Takashi Iwai <tiwai@suse.de> wrote=
 ----
 > On Sat, 07 Aug 2021 10:16:47 +0200,
 > Greg KH wrote:
 > >=20
 > > On Sat, Aug 07, 2021 at 12:49:07AM -0700, Jeff Woods wrote:
 > > > Specifically, commit c4824ae7db418aee6f50f308a20b832e58e997fd trigge=
rs the problem. Reverting this change restores functionality.
 > > >=20
 > > > The device is an RME Multiface II, using the snd-hdsp driver.
 > > >=20
 > > > Expected behavior: Device plays sound normally
 > > >=20
 > > > Exhibited behavior: When a program attempts to open the device, the =
following ALSA lib error happens:
 > > >=20
 > > > ALSA lib pcm_direct.c:1169:(snd1_pcm_direct_initialize_slave) slave =
plugin does not support mmap interleaved or mmap noninterleaved access
 > > >=20
 > > > This change hasn't affected my other computers with less esoteric ha=
rdware, so probably the problem lies with the snd-hdsp driver, but the devi=
ce is unusable without reverting that commit.
 > > >=20
 > > > I am available to test any patches for this issue.
 > >=20
 > > Have you notified the developers involved in this change about this
 > > issue?
 >=20
 > No, it's a new report :)
 >=20
 > > Adding them now...
 >=20
 > Could you try the patch below?
 >=20
 >=20
 > thanks,
 >=20
 > Takashi
 >=20
 > -- 8< --
 > From: Takashi Iwai <tiwai@suse.de>
 > Subject: [PATCH] ALSA: pci: rme: Fix mmap breakage
 >=20
 > The recent change in the PCM core restricts the mmap of unknown buffer
 > type, and this broke the mmap on RME9652 and HDSP drivers that didn't
 > set up properly.  Actually those driver do use the buffers allocated
 > in a standard way, and the proper calls should fix the breakage.
 >=20
 > Fixes: c4824ae7db41 ("ALSA: pcm: Fix mmap capability check")
 > Cc: <stable@vger.kernel.org>
 > Signed-off-by: Takashi Iwai <tiwai@suse.de>
 > ---
 >  sound/pci/rme9652/hdsp.c    | 6 ++----
 >  sound/pci/rme9652/rme9652.c | 6 ++----
 >  2 files changed, 4 insertions(+), 8 deletions(-)
 >=20
 > diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
 > index 8457a4bbc3df..b32a72e28917 100644
 > --- a/sound/pci/rme9652/hdsp.c
 > +++ b/sound/pci/rme9652/hdsp.c
 > @@ -4518,8 +4518,7 @@ static int snd_hdsp_playback_open(struct snd_pcm_s=
ubstream *substream)
 >      snd_pcm_set_sync(substream);
 > =20
 >          runtime->hw =3D snd_hdsp_playback_subinfo;
 > -    runtime->dma_area =3D hdsp->playback_buffer;
 > -    runtime->dma_bytes =3D HDSP_DMA_AREA_BYTES;
 > +    snd_pcm_set_runtime_buffer(substream, hdsp->playback_dma_buf);
 > =20
 >      hdsp->playback_pid =3D current->pid;
 >      hdsp->playback_substream =3D substream;
 > @@ -4595,8 +4594,7 @@ static int snd_hdsp_capture_open(struct snd_pcm_su=
bstream *substream)
 >      snd_pcm_set_sync(substream);
 > =20
 >      runtime->hw =3D snd_hdsp_capture_subinfo;
 > -    runtime->dma_area =3D hdsp->capture_buffer;
 > -    runtime->dma_bytes =3D HDSP_DMA_AREA_BYTES;
 > +    snd_pcm_set_runtime_buffer(substream, hdsp->capture_dma_buf);
 > =20
 >      hdsp->capture_pid =3D current->pid;
 >      hdsp->capture_substream =3D substream;
 > diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
 > index f1aad38760d6..8036ed761d53 100644
 > --- a/sound/pci/rme9652/rme9652.c
 > +++ b/sound/pci/rme9652/rme9652.c
 > @@ -2279,8 +2279,7 @@ static int snd_rme9652_playback_open(struct snd_pc=
m_substream *substream)
 >      snd_pcm_set_sync(substream);
 > =20
 >          runtime->hw =3D snd_rme9652_playback_subinfo;
 > -    runtime->dma_area =3D rme9652->playback_buffer;
 > -    runtime->dma_bytes =3D RME9652_DMA_AREA_BYTES;
 > +    snd_pcm_set_runtime_buffer(substream, rme9652->playback_dma_buf);
 > =20
 >      if (rme9652->capture_substream =3D=3D NULL) {
 >          rme9652_stop(rme9652);
 > @@ -2339,8 +2338,7 @@ static int snd_rme9652_capture_open(struct snd_pcm=
_substream *substream)
 >      snd_pcm_set_sync(substream);
 > =20
 >      runtime->hw =3D snd_rme9652_capture_subinfo;
 > -    runtime->dma_area =3D rme9652->capture_buffer;
 > -    runtime->dma_bytes =3D RME9652_DMA_AREA_BYTES;
 > +    snd_pcm_set_runtime_buffer(substream, rme9652->capture_dma_buf);
 > =20
 >      if (rme9652->playback_substream =3D=3D NULL) {
 >          rme9652_stop(rme9652);
 > --=20
 > 2.26.2
 >=20
=20
I applied the patch to kernel 5.13.8, but compilation fails with these erro=
rs:

sound/pci/rme9652/hdsp.c: In function =E2=80=98snd_hdsp_playback_open=E2=80=
=99:
sound/pci/rme9652/hdsp.c:4505:51: error: incompatible type for argument 2 o=
f =E2=80=98snd_pcm_set_runtime_buffer=E2=80=99
 4505 |         snd_pcm_set_runtime_buffer(substream, hdsp->playback_dma_bu=
f);
      |                                               ~~~~^~~~~~~~~~~~~~~~~=
~
      |                                                   |
      |                                                   struct snd_dma_bu=
ffer
In file included from sound/pci/rme9652/hdsp.c:23:
./include/sound/pcm.h:1154:70: note: expected =E2=80=98struct snd_dma_buffe=
r *=E2=80=99 but argument is of type =E2=80=98struct snd_dma_buffer=E2=80=
=99
 1154 |                                               struct snd_dma_buffer=
 *bufp)
      |                                               ~~~~~~~~~~~~~~~~~~~~~=
~~^~~~
sound/pci/rme9652/hdsp.c: In function =E2=80=98snd_hdsp_capture_open=E2=80=
=99:
sound/pci/rme9652/hdsp.c:4581:51: error: incompatible type for argument 2 o=
f =E2=80=98snd_pcm_set_runtime_buffer=E2=80=99
 4581 |         snd_pcm_set_runtime_buffer(substream, hdsp->capture_dma_buf=
);
      |                                               ~~~~^~~~~~~~~~~~~~~~~
      |                                                   |
      |                                                   struct snd_dma_bu=
ffer
In file included from sound/pci/rme9652/hdsp.c:23:
./include/sound/pcm.h:1154:70: note: expected =E2=80=98struct snd_dma_buffe=
r *=E2=80=99 but argument is of type =E2=80=98struct snd_dma_buffer=E2=80=
=99
 1154 |                                               struct snd_dma_buffer=
 *bufp)
      |                                               ~~~~~~~~~~~~~~~~~~~~~=
~~^~~~
make[3]: *** [scripts/Makefile.build:273: sound/pci/rme9652/hdsp.o] Error 1
make[2]: *** [scripts/Makefile.build:516: sound/pci/rme9652] Error 2
make[1]: *** [scripts/Makefile.build:516: sound/pci] Error 2

I also patched and compiled 5.14-rc4, but got the same errors.

Next I tried cloning git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.gi=
t.

The patch applied and compiled, but I get the same "does not support mmap" =
error when trying to play anything.

Let me know if there's any other info I can provide.

Thanks,
Jeff

