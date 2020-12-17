Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 243BB2DD0CD
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 12:51:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC71E1873;
	Thu, 17 Dec 2020 12:51:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC71E1873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608205910;
	bh=87q4IOfUoYTn9t414yFUEiu4hr7lvv/p9qbefgUvcLU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W5koKHQLV+ml9frnhGvtWz/HcCgEATeMwfU44sOkC2rRZbAJJqj0P7SUmrESTeW4g
	 DmE+fuQcqnnXUxeMuA6zC5Zmu4O+42YF1tNYTYzgodVlbelGGczQuMEwHpow6HsGq/
	 qiVFPe26woM1bBexCNsOjyd70s8leTvy1r5roXwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32E09F800C7;
	Thu, 17 Dec 2020 12:50:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAF90F80260; Thu, 17 Dec 2020 12:50:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25F7DF800C7
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 12:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25F7DF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oASjuKuU"
Received: by mail-pf1-x430.google.com with SMTP id x126so10064190pfc.7
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 03:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XKB1k0zcpmCbcRTXBIrjLwiqJXxpKCjHh0qvy/6PV3Q=;
 b=oASjuKuUqD6Np33c/A+kwRVmBnuntBUrbZstV3PZRg4JRN2/zFWl6L5UKj0DW/n1s9
 TA38bOzLRkenugP4gB4ymnDIQ6gmqsH7Ubj8P6R6NM4e1GsA5ltf983af640gFoyGenq
 qXY7ToKrpGfOEBBabgzNodrUbeLPr6S9aykySmBcJ7GKltuvR62dtQoeZBveRS311Z8x
 XNsDxJqe7i0INPG8L7ED/7MWKy1gYnDTIl5b0pHQqpQa9dpOEx3UzwhWi2TWap3zf62f
 b9b8bM8vwPIQs842IldfL2vOamXnKksI+vNbemjv8+3UJBzcbvVnPo4Yl1XCYp9BEezR
 TjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XKB1k0zcpmCbcRTXBIrjLwiqJXxpKCjHh0qvy/6PV3Q=;
 b=n/A7PJI775AQsfqRpge0RPw8aJ1il5XT3aaO7A2haJ52Qxzkm6syhUWOMb7HZHybpt
 YKd6zRtEMDvsc+EvK8oTLqNm07moc6uRT84I24QBJaEk5VT0fjT3ef7TAqr9WKd5UqaW
 8yBLwxskWhfUMnKEoBgK3sfHf6jBgLmVWwhCrWPnus4Hr/r7gU/FoYl/pBJlLvkNiXlb
 lx0qvPNoyjP6v1hKZkybeVOrDgPj0HX4l4rdFgtusxRs01zSp8Cya9VVYNgEW8bQ8jQ1
 qXc1nmp+MF1iwwsKfcb2/yAMg1AF/AH6OyZeWEEq9G1U6M0f0oeT/qS96w+4fxbPHVIZ
 ZP5w==
X-Gm-Message-State: AOAM532GUIKD2ZZ6hL+jH2Tws7rfmCOr0eL/lL7cQVTCtKf08rTeDZhz
 yn/is4lC8yyPxbdWrIIBqemlvol8VRUpOy47ceM=
X-Google-Smtp-Source: ABdhPJw83yrn+hdGW0l/nFQ3Eb0MoiGAEHBc1ltgAMrkL9l2PZYzpR/BNzSoxBJz/e9oZfnMUxDtPS+LJT9TdABzrUg=
X-Received: by 2002:a63:5c52:: with SMTP id n18mr6734758pgm.404.1608205804805; 
 Thu, 17 Dec 2020 03:50:04 -0800 (PST)
MIME-Version: 1.0
References: <CAE5BBpTEw2pTzDhLxaQiGwAvnH_q6aChLkuDXxEQrZFvS6wVyQ@mail.gmail.com>
 <s5h8s9wn4lr.wl-tiwai@suse.de>
In-Reply-To: <s5h8s9wn4lr.wl-tiwai@suse.de>
From: Marco Giunta <giun7a@gmail.com>
Date: Thu, 17 Dec 2020 12:49:53 +0100
Message-ID: <CAE5BBpTbyjkd--Nfcqpv01wYyScEgXJSQETYhWyUH9-qPKYw+g@mail.gmail.com>
Subject: Re: [PATCH] Fix mic sound on Jieli webcam
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
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

Hi,
thank you for your reply. As I told you, I'm not the guy who wrote the
patch, but I try to continue his work.

> What's the original datainterval value for those altsettings?
Where I can read the original datainterval value ? Is it an USB
property (so I can search in udev) ? Or can I debug in some way the
snd_usb_audio module load to get the values ?

Thanks,
  Marco


On Thu, Dec 17, 2020 at 10:50 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 15 Dec 2020 10:44:45 +0100,
> Marco Giunta wrote:
> >
> > Hi,
> > recently I've bought a usb webcam with integrated mic:
> >
> >   Jieli Technology USB PHY 2.0 (1224:2a25)
> >
> > The video part works well, but the mic sound is speedups, "like
> > minions" (cit.). When I connect the camera, these are the dmesg
> > messages:
> >
> > kernel: usb 1-8: current rate 0 is different from the runtime rate 8000
> > kernel: usb 1-8: current rate 0 is different from the runtime rate 16000
> > kernel: usb 1-8: current rate 0 is different from the runtime rate 44100
> > kernel: usb 1-8: current rate 0 is different from the runtime rate 48000
> > kernel: usb 1-8: Warning! Unlikely big volume range (=4096), cval->res
> > is probably wrong.
> > kernel: usb 1-8: [3] FU [Mic Capture Volume] ch = 1, val = 0/4096/1
> > kernel: usbcore: registered new interface driver snd-usb-audio
> >
> > and after a while, dmesg log is filled, every 5 seconds, with:
> >
> > kernel: retire_capture_urb: 84 callbacks suppressed
> > kernel: retire_capture_urb: 1714 callbacks suppressed
> >
> > A guy reports on ArchLinux bug website the same problem
> > (https://bugs.archlinux.org/task/68141?opened=12995&status%5B0%5D=)
> > and provides a patch to fix the sound issue. I've applied the patch on
> > kernel 5.9.13 (Fedora 33 x86_64) and now the mic works, no more
> > minions voice effect. Now dmesg messages are only:
> >
> > kernel: usb 1-8: Warning! Unlikely big volume range (=4096), cval->res
> > is probably wrong.
> > kernel: usb 1-8: [3] FU [Mic Capture Volume] ch = 1, val = 0/4096/1
> > kernel: usbcore: registered new interface driver snd-usb-audio
> >
> > the retire_capture_urb messages are gone.
> >
> > All credits for the patch go to him but I don't know how to contact
> > that guy nor I don't know if he has already contacted you, so my
> > question is if you could review his patch and finally apply upstream.
> >
> > If you need other information or you need a tester, I'm here.
>
> Thanks for the patch.  The still remaining warnings are about the
> mixer, and your patch doesn't touch about it.  You may apply the
> similar change in volume_control_quirks() like other webcams.
>
> And now about the patch:
>
> > --- a/sound/usb/format.c    2020-10-01 18:36:35.000000000 +0300
> > +++ b/sound/usb/format.c    2020-10-04 02:10:21.678685952 +0300
> > @@ -217,6 +217,21 @@
> >                  (chip->usb_id == USB_ID(0x041e, 0x4064) ||
> >                   chip->usb_id == USB_ID(0x041e, 0x4068)))
> >                  rate = 8000;
> > +
> > +            // hack for "Jieli Technology USB PHY 2.0" webcam
> > +            if (chip->usb_id == USB_ID(0x1224, 0x2a25)) {
> > +                switch (rate) {
> > +                case 8000:
> > +                    fp->datainterval += 4;
> > +                    break;
> > +                case 16000:
> > +                    fp->datainterval += 3;
> > +                    break;
> > +                default:
> > +                    fp->datainterval += 1;
> > +                    break;
> > +                }
> > +            }
>
> Modifying datainterval at this point doesn't look intuitive.
> What's the original datainterval value for those altsettings?
> The value is retrieved in snd_usb_parse_datainterval() in helper.c,
> and if any, the correction there would be more sensible.
>
>
> >              fp->rate_table[fp->nr_rates] = rate;
> >              if (!fp->rate_min || rate < fp->rate_min)
> > --- a/sound/usb/endpoint.c    2020-10-01 18:36:35.000000000 +0300
> > +++ b/sound/usb/endpoint.c    2020-10-04 02:09:09.471978982 +0300
> > @@ -882,6 +882,8 @@
> >      if (snd_usb_get_speed(ep->chip->dev) != USB_SPEED_FULL) {
> >          packs_per_ms = 8 >> ep->datainterval;
> >          max_packs_per_urb = MAX_PACKS_HS;
> > +        if (!packs_per_ms)
> > +            packs_per_ms = 1;
>
> This rather indicates that the datainterval is somehow wrong.
>
> >      } else {
> >          packs_per_ms = 1;
> >          max_packs_per_urb = MAX_PACKS;
> > --- a/sound/usb/quirks.c    2020-10-01 18:36:35.000000000 +0300
> > +++ b/sound/usb/quirks.c    2020-10-04 02:14:04.532196519 +0300
> > @@ -1516,6 +1516,7 @@
> >      case USB_ID(0x1901, 0x0191): /* GE B850V3 CP2114 audio interface */
> >      case USB_ID(0x21b4, 0x0081): /* AudioQuest DragonFly */
> >      case USB_ID(0x2912, 0x30c8): /* Audioengine D1 */
> > +    case USB_ID(0x1224, 0x2a25): /* Jieli Technology USB PHY 2.0 */
> >          return true;
> >      }
>
> This looks fine.
>
>
> thanks,
>
> Takashi
