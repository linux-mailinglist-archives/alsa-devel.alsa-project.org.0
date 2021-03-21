Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47588343347
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Mar 2021 16:52:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C84C782A;
	Sun, 21 Mar 2021 16:51:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C84C782A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616341952;
	bh=h1hQ44H1bNyQ1yAeKqnFN4qCOHZIY8wEVsA3EUfUf38=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EuBkkFF5ymEzaG1rPCjb5IuwDfqmhPPKhCaQu6vpUVrGEKIaeavKyw1PdbIa0HMKR
	 Yl9b7xHS3mLHqKDMEfNamB1nUoKBUw+HWubSfohSN+nYflkSnpi2wogxir81g4p3gf
	 GoVu3B6KG/3bWKMAEudg5Kvhp88bztuj0yW6a/Gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DA6FF80257;
	Sun, 21 Mar 2021 16:51:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39C37F80118; Sun, 21 Mar 2021 16:51:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86366F80118
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 16:50:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86366F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oQ9HC9mp"
Received: by mail-qk1-x72c.google.com with SMTP id c3so8148244qkc.5
 for <alsa-devel@alsa-project.org>; Sun, 21 Mar 2021 08:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=pRtXxeeVswvFh4m5mII+S88RG+PjmUvlHtCqEQjtR28=;
 b=oQ9HC9mpS1yLAZo3gp87dC1fp4w5ChKXWtlUjq2EGtgeR79ynDg21L3X6zRIWHpTK3
 7tBl8dXm5nn6h5XZkA8//YKcjDEMHt5nlPEoCUYSLAVBDf9p2yYHSZlsGrYYC1lEo6oV
 KYDK9Ffm7XD2OZBiI2Rfvqn3Tsu+Dm+pLEBFcxkQUjZ3sW4K7bV56AEyspPkOUmTaggt
 sDg7RAL7vXVzZNaU4/7YZPJLfAbZQc2cMgiv3QPhBzmgLT+KIn4kaVSOoUxTgJldQHp+
 7iThbrS/axGfgrVVurru6levW3X1PgvgYRH60BqTitr44MruywNofRIfiK8hEZZP9fve
 E5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=pRtXxeeVswvFh4m5mII+S88RG+PjmUvlHtCqEQjtR28=;
 b=TDDLFk6xpyVLx3g9942sTe1eoQVPNIEQJ0+9akfPEcCdwlZglY09aREYg4+LytnJOl
 jLrwNOI6MR+dTjTld12+iLEwC4dYMW1Z/gegwex6rFhBC5HjcGRewUd/kse5inD/Pspg
 m+nap4fTYzQOXpwTgsgQVrC1PveDIDB+vktO+oYoEVUrvc/OSxf1LMs7FXVo/lCwyfKF
 yGz6OmpW1FmiOKqEWebp5QFqcagYiSTjra+aNunEyVnNL+Doq31EqivPdDcnWtxt/2Im
 TXac2689GdjANAmUinAia4m6vGuzAwXAfe6CymDpMLg8gTfjstTxIujAonM1n803299v
 0ZIA==
X-Gm-Message-State: AOAM530Gwi5wETtB0HFINfxkeKpdqCE65jbRFRVUqypjhC9FnyQJssX3
 lezSX5b1FHTmytImC2QdYpL23iWlHQ5LgZzkxMe3sGQY
X-Google-Smtp-Source: ABdhPJyLXi7n/uKYaSM2P3HC8k1Pcdhx261k5OgRDsapDxxAPSeXka8vRKmR2py8xPPuSFh97mPIoIgj3pqe0yGU9jo=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr7288468qki.487.1616341857450; 
 Sun, 21 Mar 2021 08:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvctXrHLXK-oz6Zb38t1D28krqUCf73jMU-QJw=i66KZe8g@mail.gmail.com>
 <CAEsQvcsePyrd3Xs4hTUmkxzk84nodL40ytGgjM-66SOgv5ybjw@mail.gmail.com>
 <s5hsg4oex1z.wl-tiwai@suse.de>
 <CAEsQvcuS84fUoaCxsoixCPH7F-XGxbpK067-rxVA+EMDr2KAGg@mail.gmail.com>
In-Reply-To: <CAEsQvcuS84fUoaCxsoixCPH7F-XGxbpK067-rxVA+EMDr2KAGg@mail.gmail.com>
From: Geraldo <geraldogabriel@gmail.com>
Date: Sun, 21 Mar 2021 12:47:32 -0300
Message-ID: <CAEsQvcsupySi4Zr3wKkwy38Et3bE-EmRQJ4cZjRt2gXSoKdb+g@mail.gmail.com>
Subject: Fwd: Pioneer DJ DDJ-SR2 sound degradation
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Good news: my JACK transport has been rolling for more than 2 hours
without sound degradation. I'll leave it overnight just to be sure
sound degradation has been fixed and not just postponed.

But yes, I think I managed to engage implicit feedback sync for the
playback on my Pioneer DJ DDJ-SR2.

Dr. Iwai, my initial assesment was ALSA not honoring .ep_attr on
quirks-table.h was the culprit for the Incompatible EP Setup messages.

Turns out that for implicit feedback sync the EP is opened twice, and
the ep->opened refcount prevents that.

Once I commented out ep->opened++; inside snd_usb_endpoint_open on
endpoint.c the kernel was able to open the EP twice(one time for data,
second time for sync).

I could use some help in coding an elegant way of going around the
ep->opened refcount instead of simpy disabling it!

Once that particular problem is sorted out I'll be able to provide a
proper PATCH for all users of Pioneer gear to test implicit feedback
sync.

Here's the relevant dyndbg info for the success case:

[35084.131891] usb 3-2: 0:1: added playback implicit_fb sync_ep 82, iface 0=
:1
[35084.131905] usb 3-2: Creating new data endpoint #1
[35084.131911] usb 3-2: Creating new data endpoint #82
[35084.131917] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for
udev 0000000052e95692
[35084.132102] usb 3-2: 0:1 Set sample rate 44100, clock 0
[35084.132116] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for
udev 0000000052e95692
[35084.132163] usb 3-2: 0:1 Set sample rate 44100, clock 0
[35084.132592] usbcore: registered new interface driver snd-usb-audio
[35096.805245] usb 3-2: Open EP 0x82, iface=3D0:1, idx=3D1
[35096.805254] usb 3-2:   channels=3D6, rate=3D44100, format=3DS24_3LE,
period_bytes=3D9216, periods=3D2, implicit_fb=3D0
[35096.805259] usb 3-2: Setting usb interface 0:0 for EP 0x82
[35096.805264] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for
udev 0000000052e95692
[35096.805475] usb 3-2: Setting usb interface 0:1 for EP 0x82
[35096.805486] xhci_hcd 0000:00:14.0: add ep 0x1, slot id 32, new drop
flags =3D 0x0, new add flags =3D 0x5
[35096.805492] xhci_hcd 0000:00:14.0: add ep 0x82, slot id 32, new
drop flags =3D 0x0, new add flags =3D 0x25
[35096.805495] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for
udev 0000000052e95692
[35096.805499] xhci_hcd 0000:00:14.0: Adding 2 ep ctxs, 6 now active.
[35096.805503] xhci_hcd 0000:00:14.0: Recalculating BW for rootport 2
[35096.805505] xhci_hcd 0000:00:14.0: Final bandwidth: 282, Limit:
1607, Reserved: 322, Available: 62 percent
[35096.805510] xhci_hcd 0000:00:14.0: // Ding dong!
[35096.805652] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[35096.805895] usb 3-2: 0:1 Set sample rate 44100, clock 0
[35096.805902] usb 3-2: Setting params for data EP 0x82, pipe 0x14180
[35096.805910] usb 3-2: Set up 12 URBS, ret=3D0
[35096.805996] usb 3-2: Open EP 0x1, iface=3D0:1, idx=3D0
[35096.806000] usb 3-2:   channels=3D4, rate=3D44100, format=3DS24_3LE,
period_bytes=3D6144, periods=3D2, implicit_fb=3D1
[35096.806003] usb 3-2: Open EP 0x82, iface=3D0:1, idx=3D1
[35096.806005] usb 3-2:   channels=3D6, rate=3D44100, format=3DS24_3LE,
period_bytes=3D9216, periods=3D2, implicit_fb=3D0
[35096.806008] usb 3-2: 0:1 Set sample rate 44100, clock 0
[35096.806011] usb 3-2: Setting params for data EP 0x1, pipe 0xc100
[35096.806018] usb 3-2: Set up 12 URBS, ret=3D0
[35096.806021] usb 3-2: 0:1 Set sample rate 44100, clock 0
[35096.806025] usb 3-2: Setting params for data EP 0x82, pipe 0x14180
[35096.806029] usb 3-2: Set up 12 URBS, ret=3D0
[35096.806048] usb 3-2: Starting data EP 0x1 (running 0)
[35096.806051] usb 3-2: No URB submission due to implicit fb sync
[35096.806053] usb 3-2: Starting data EP 0x82 (running 0)
[35096.806076] usb 3-2: 12 URBs submitted for EP 0x82
[35096.807337] usb 3-2: Starting data EP 0x82 (running 1)
[35096.807343] usb 3-2: 0:1 Start Capture PCM
[35096.807346] usb 3-2: 0:1 Start Playback PCM

On Sun, Mar 21, 2021 at 5:22 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sun, 21 Mar 2021 05:31:11 +0100,
> Geraldo wrote:
> >
> > Until we manage to engage implicit feedback sync for Pioneer gear I'm
> > afraid the clock will drift on DUPLEX mode.
> >
> > I reread the Pioneer related source code and implicit feedback sync was
> > disabled because it gave Incompatible EP Setup messages. I should know,=
 I
> > was a reporter on that regression.
> >
> > Only those messages are fake. They arise because our ALSA code it's not
> > honoring .ep_attr on quirks-table.h specifically in regards to
> > USB_ENDPOINT_USAGE_IMPLICIT_FB.
>
> That's right.  The parser reads from the original descriptor, not the
> one from the quirk table.  That is, the implicit fb quirk has to be
> declared explicitly in another quirk table.  And, the implicit fb is
> skipped for those devices because they didn't work; see
> sound/usb/implicit.c.
>
> > In fact the new improved implicit feedback sync code inside pcm.c that =
sets
> > sync upon probe is failing to set implicit_fb to 1. I commented the
> > conditional for testing and I told endpoint_compatible to always return
> > true.
> >
> > Voil=C3=A0, JACK started in duplex mode without nasty Incompatible EP S=
etup
> > problems and supposedly with implicit feedback sync on. We are not sett=
ing
> > bits 5..7 of bmAttributes, at least that's what I get from the missing
> > Usage field in lsusb.
> >
> > My JACK transport has been rolling for 17 minutes and if it goes for tw=
o
> > complete hours without distortion passing-thru vinyl on Mixxxx I'll pro=
vide
> > the list with a more elegant PATCH and not this gambiarra as we say on
> > Brazil.
> >
> > Hopefully their will be implicit feedback sync for Pioneer :-)
>
> I know there are quite a few users with Pioneer devices around here,
> so let's hope that they can test the implicit feedback things and find
> the culprit of the buggy behavior.  Unfortunately it's quite hard to
> debug such a thing remotely without the hardware from my side.
>
>
> Takashi
>
>
> >
> >
> > On Thu, Mar 18, 2021 at 7:41 PM Geraldo <geraldogabriel@gmail.com> wrot=
e:
> > >
> > > Hi everyone,
> > >
> > > I'm running stable kernel 5.11.6 together with my Pioneer DJ DDJ-SR2 =
and
> > JACK. Mixxx is running on top of JACK.
> > >
> > >
> > > After I start JACK I have about 40 minutes of good sound quality from=
 the
> > inputs. After this period the sound will begin to degrade slowly until =
it
> > is almost pure distortion.
> > >
> > > The issue is gone if I restart the JACK server, no need to reboot the
> > hardware. The description I gave above sounds a lot like soundcard cloc=
k
> > drift (which happens to those using more than one soundcard. You know)
> > which motivates me to believe we missed a bug somewhere around the rece=
nt
> > changes introduced in implicit feedback sync for Pioneer devices
> > >
> > > Dyndbg shows nothing useful I guess. No xruns reported.
> > >
> > > I've recorded a 1KHz tone and after 50+ minutes the sound degradation
> > kicks in. Only problem is even after cutting and encoding to mp3 128kbp=
s
> > it's still a 10 megabytes file. I suppose I could post it to Soundcloud=
 or
> > Mixcloud if anyone is interested.
> > >
> > > Is anyone else experiencing these symptoms with Pioneer hardware? Not=
e
> > that the sound degradation kicks in after about an hour, more or less, =
and
> > it's for the inputs only. Outputs continue to operate fine without the =
need
> > to restart the JACK server every hour.
> > >
> > > Thanks everybody,
> > > Geraldo
> >
