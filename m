Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E548598D
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 20:55:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E13A1947;
	Wed,  5 Jan 2022 20:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E13A1947
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641412504;
	bh=/0bIL5kA50MmAcHYPM3g2vV7Qcfm+D/i5qOD4YrHDk0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u0miHMiGIReegDDvpCFQA2eajNcGY5MCPX8mOs9SrPNglwBqp3sRnUhyAjH32hQyi
	 JTDHl6XBqnK2txCE6oKes3zdvAyJSctOvuaHrhw+8pTsTalTvfvG7NnkpQL4Ge16Dn
	 iCkGDU1mXVPr44N0L0OxVg12hgr1y4ng484wPSi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEAD2F8020C;
	Wed,  5 Jan 2022 20:53:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E609F801D8; Wed,  5 Jan 2022 20:53:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3985F800BB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 20:53:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3985F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YGQsoZ3W"
Received: by mail-qv1-xf29.google.com with SMTP id fo11so224173qvb.4
 for <alsa-devel@alsa-project.org>; Wed, 05 Jan 2022 11:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DRhBAdKiVIahb2j3rRhjN4/NO2ntsfev/5E0aPCh4Kk=;
 b=YGQsoZ3WOBW7Fi4HpZ8XIg+x/T3cZTCyPQkZl6f1UV2rA/nMOwcT+qea1xl0x/O5Y9
 sO55LCyFUM6hJpuiL5iFvfOKRQ4zx444NcDXVKFOiVR59oBlcgp4E7XbG3QiWQ+bHoAM
 BGMLDYsZbsQ8VeS6mLJKaJaueTB9jC2htWApmYWgIxYlBoYhuPfSrWJNn+2Yw82+YHLZ
 bs/vGxi9Qls9Y82fj0f7vZsCb/hLAR3DqlLZfzbQzKHDtHovD8vuhW0hDV+37KzreE86
 CIKjeClWwXJRpPKCKhmeOXeYsGBZNJEMmmCoIkwPgOEY9L0Pc4e3UiItpdMwMIPHGkAF
 lIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DRhBAdKiVIahb2j3rRhjN4/NO2ntsfev/5E0aPCh4Kk=;
 b=epl6JsGuOoMZXr1zW52jw0ZMXd/6Wc2ynXxNP1mNw8d1QicG/fFuWIOgr0I1QiND1C
 z92PtQHyUk3Mq/gBMD5gG4Bdm5NonOzPwVBgVQiWlz9xzGC9/Cb0Oh3IXYaelJNO7sM+
 up0E5wK2pg3+WbpqsVMaqbVPylLkEq3sKfpmB0VUIXtUqCGCo9YWE1at7Bosk5W+trhl
 nQrlU3hoHnu5OR/Xqs5sC3VED/Og8IWthM74guCccVrtT2D1XqdXn0CTvoJ2spKXGyzU
 KDHzWQHh5Gm4sfqgj17e7+O6ACzt+ZWCQvnoAUu7qHLS//9It++BGziHY1TwFZjfoAc2
 PDiw==
X-Gm-Message-State: AOAM532gh1jgCGbySULeO3IKTgHxuRz31KdJ/Fvak3t4xvg80HTsW+om
 ODGNLsnlRfCuX/Y/dEgY1+WmVngYYJjaaJdYxw==
X-Google-Smtp-Source: ABdhPJwU5lqzdY5FCJ4BJAGEy2028rT+j9Yw6yS6vJHNwTq9zu+qC/wrvsK3Lk+JHIreglfqp1RmFu7J0WHyr49q1FM=
X-Received: by 2002:a05:6214:ca2:: with SMTP id
 s2mr35496664qvs.90.1641412423806; 
 Wed, 05 Jan 2022 11:53:43 -0800 (PST)
MIME-Version: 1.0
References: <CAJ4JBRO7qE63TAC-=4y=QMaiAEfkyjRmgiZEF_57Hm+ztc8+Qg@mail.gmail.com>
 <s5hiluzjy3d.wl-tiwai@suse.de>
 <CAJ4JBRMKsrJ54ee0gPwRTeScghA4SB8m2iOWybQA=6584ejG-g@mail.gmail.com>
 <s5hlezui82s.wl-tiwai@suse.de>
In-Reply-To: <s5hlezui82s.wl-tiwai@suse.de>
From: Stefan Sauer <st.kost@gmail.com>
Date: Wed, 5 Jan 2022 20:53:33 +0100
Message-ID: <CAJ4JBRNbi1Suu=uRwe33Wpd-9EPqBEMwnCK1pBh6_TrsmkOGaQ@mail.gmail.com>
Subject: Re: slow snd_rawmidi_drain() for VirMidi devcies
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

From 6b97042bc91ebee267cbb05e6b937cbab5502f61 Mon Sep 17 00:00:00 2001
From: Stefan Sauer <ensonic@google.com>
Date: Wed, 5 Jan 2022 20:44:57 +0100
Subject: [PATCH] ALSA: seq: virmidi: Add a drain operation

If a driver does not supply a drain operation for outputs, a default code
path will execute msleep(50). Especially for a virtual midi device
this severely limits the throughput.

This implementation for the virtual midi driver simply flushes the output
workqueue.
---
 sound/core/seq/seq_virmidi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/core/seq/seq_virmidi.c b/sound/core/seq/seq_virmidi.c
index 4abc38c70cae..1d708dc20443 100644
--- a/sound/core/seq/seq_virmidi.c
+++ b/sound/core/seq/seq_virmidi.c
@@ -262,6 +262,16 @@ static int snd_virmidi_output_close(struct
snd_rawmidi_substream *substream)
  return 0;
 }

+/*
+ * drain output work queue
+ */
+static void snd_virmidi_output_drain(struct snd_rawmidi_substream
*substream)
+{
+ struct snd_virmidi *vmidi = substream->runtime->private_data;
+
+ flush_work(&vmidi->output_work);
+}
+
 /*
  * subscribe callback - allow output to rawmidi device
  */
@@ -336,6 +346,7 @@ static const struct snd_rawmidi_ops
snd_virmidi_output_ops = {
  .open = snd_virmidi_output_open,
  .close = snd_virmidi_output_close,
  .trigger = snd_virmidi_output_trigger,
+ .drain = snd_virmidi_output_drain,
 };

 /*
-- 
2.34.1


Am Mi., 5. Jan. 2022 um 15:13 Uhr schrieb Takashi Iwai <tiwai@suse.de>:
>
> On Wed, 05 Jan 2022 14:39:05 +0100,
> Stefan Sauer wrote:
> >
> > -   28,78%     0,00%  rawmidi_alsa  [snd_rawmidi]         [k]
> > snd_rawmidi_drain_output
> >    - snd_rawmidi_drain_output
> >       - 26,59% msleep
> >            schedule_timeout
> >            schedule
> >          + __schedule
> >       + 2,13% schedule_timeout
> >
> > Seems to be because of:
> > https://github.com/torvalds/linux/blob/master/sound/core/rawmidi.c#L244
> > if (substream->ops->drain)
> >   substream->ops->drain(substream);
> > else
> >   msleep(50);
> >
> > It see what fileops have no drain impl:
> > https://github.com/torvalds/linux/blob/master/sound/core/rawmidi.c#L1708
> > and I see
> >
https://github.com/torvalds/linux/blob/master/sound/core/seq/seq_virmidi.c#L329
> > that define no drain op. Not which ones are actually used here :/
> >
> > The docs confirm teh 50 ms wait though:
> >
https://github.com/torvalds/linux/blob/master/Documentation/sound/kernel-api/writing-an-alsa-driver.rst#drain-callback
> >
> > would it make sense to have a dummy drain function for the seq_virmidi
output
> > ops?
>
> Yes, a proper drain implementation is definitely better.
> I guess just calling flush_work(&vmidi->output_work) there would
> suffice.
>
>
> thanks,
>
> Takashi
>
> >
> > Stefan
> >
> > Am Di., 4. Jan. 2022 um 16:54 Uhr schrieb Takashi Iwai <tiwai@suse.de>:
> >
> >     On Sat, 01 Jan 2022 12:49:13 +0100,
> >     Stefan Sauer wrote:
> >     >
> >     > hi,
> >     >
> >     > I've tried to link BitwigStudio to the webapp cables.gl over
virmidi.
> >     > Unfortunately Bitwig Studio only supports rawmidi. What I
discovered is
> >     > that there is a strange slowness when sending data to virmidi
caused
> >     > by snd_rawmidi_drain().
> >     >
> >     > I've posted two tiny, self-contained c apps to:
> >     > https://gist.github.com/ensonic/c7588b87fa6c1fa94a8f753b1e0aa394
> >     > See some examples below. 2 observations:
> >     > * snd_rawmidi_type() is *not* reporting virmidi as VIRTUAL
> >     > * snd_rawmidi_drain() takes about 60ms! on virtual vs. less that
0.1 ms
> >     on
> >     > usb midi (I checked all my hw midi and the worst was avg=1ms on
physical
> >     > midi image unitor8)
> >     >
> >     > When comparing the implementations:
> >     >
> >
https://github.com/alsa-project/alsa-lib/blob/master/src/rawmidi/rawmidi_virt.c#L173
> >     >
> >
https://github.com/alsa-project/alsa-lib/blob/master/src/rawmidi/rawmidi_hw.c#L164
> >     > I see that the hw one results in an IOCTL which I can see when
striking
> >     the
> >     > code and I wonder if this is the root cause? Why is
rawmidi_virt.c not
> >     used
> >     > for virmidi?
> >     > >From poking at snd_rawmidi_open_conf() I have not yet figured
where
> >     this is
> >     > decided ....
> >     >
> >     > Stefan
> >     >
> >     > > amidi -l
> >     > Dir Device    Name
> >     > IO  hw:0,0,0  Scarlett 18i20 USB MIDI 1
> >     > IO  hw:3,0,0  nanoKEY2 nanoKEY2 _ KEYBOARD
> >     > IO  hw:5,0,0  nanoKONTROL nanoKONTROL _ SLIDE
> >     > IO  hw:10,0    Virtual Raw MIDI (16 subdevices)
> >     > IO  hw:11,0    Virtual Raw MIDI (16 subdevices)
> >     >
> >     > # using direct i/o to virmidi - all good
> >     > > ./rawmidi_oss /dev/midi11 0
> >     > Using device '/dev/midi11' without draining
> >     > write took min=  0.0015 ms, avg=  0.0016 ms, max=  0.0110 ms
> >     > > ./rawmidi_oss /dev/midi11 1
> >     > Using device '/dev/midi11' with draining
> >     > write took min=  0.0015 ms, avg=  0.0017 ms, max=  0.0101 ms
> >     > drain took min=  0.0001 ms, avg=  0.0001 ms, max=  0.0008 ms
> >     >
> >     > # using snd_rawmidi to virmidi - slow drain operations
> >     > > ./rawmidi_alsa hw:11,0 0
> >     > Using device 'hw:11,0' without draining
> >     > SND_RAWMIDI_TYPE_HW
> >     > write took min=  0.0010 ms, avg=  0.0011 ms, max=  0.0056 ms
> >     > > ./rawmidi_alsa hw:11,0 1
> >     > Using device 'hw:11,0' with draining
> >     > SND_RAWMIDI_TYPE_HW
> >     > write took min=  0.0016 ms, avg=  0.0040 ms, max=  0.0077 ms
> >     > drain took min= 55.9951 ms, avg= 60.4330 ms, max= 64.0653 ms
> >     >
> >     > # using snd_rawmidi to usb hw - all good
> >     > > ./rawmidi_alsa hw:3,0 0
> >     > Using device 'hw:3,0' without draining
> >     > SND_RAWMIDI_TYPE_HW
> >     > write took min=  0.0012 ms, avg=  0.0015 ms, max=  0.0121 ms
> >     > > ./rawmidi_alsa hw:3,0 1
> >     > Using device 'hw:3,0' with draining
> >     > SND_RAWMIDI_TYPE_HW
> >     > write took min=  0.0024 ms, avg=  0.0032 ms, max=  0.0110 ms
> >     > drain took min=  0.0293 ms, avg=  0.0636 ms, max=  0.2277 ms
> >
> >     This kind of thing needs profiling.  You can try perf or whatever
> >     available, and identify which call takes long.  My wild guess is
> >     something about snd_seq_sync_output_queue(), maybe poll syscall
takes
> >     unexpected long.
> >
> >     thanks,
> >
> >     Takashi
> >
> >
