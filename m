Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE743BDC7F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jul 2021 19:52:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 209AF1658;
	Tue,  6 Jul 2021 19:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 209AF1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625593923;
	bh=VwsATNVOM7Ven+7TY5jGecho0jxA13IO2s3QTWCUtwY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJShe39nDJ4mDmfBEiPVQVUovB+4q+PzsMyag9PsAc8nChm+/RVABxgXP1n1RnyWS
	 dVknOVX3tizIlhFO/e15GcCiV0FMBy4xEFb0c/0ZFIKdREkBfsAzrCc2tDSsCZTwG9
	 6ecg6D6fAyx//mPBAmvnQ+QfAGk+lxz6Gb8YMmuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E341F8012F;
	Tue,  6 Jul 2021 19:50:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FE96F80249; Tue,  6 Jul 2021 19:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HK_RANDOM_ENVFROM,
 HK_RANDOM_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 099E9F80134
 for <alsa-devel@alsa-project.org>; Tue,  6 Jul 2021 19:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 099E9F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZK5ph7qg"
Received: by mail-ej1-x629.google.com with SMTP id hr1so32122429ejc.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Jul 2021 10:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6DuWZClbtqSNRCL74r09dT/s/L0004bm2wkFZOdkvpw=;
 b=ZK5ph7qgcPxnERLJlXiaKwif1UGvAh0MNRyOUwu1anV3qdewHWs7RJ3fNaIC25N/eG
 VdPmq3DIY/QQbUTWx027eaOcuuwyDfEYrzkBpkUlTlnFgRgTy4yjpFYJUcksvve3frt4
 vmHo+Yb/TyQaXZYUfwNGSFUqJRGQeCexQh+rNcA4LZFZR3sK+Khuk7W5exjgrb8QuSuf
 NZbOIDiL/H/S7FwP80p3QyEEw81k6CnKxSVVqPevZ8OjHWnaa1BS0lZJpBOA/KEl3AKk
 I+O1ZbZXR+5aSWrFeGFM6Jcl9iJGm17EHYvA3SQmCPkaF5K+HU8aQjnvb6g7cER7cewK
 0jDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6DuWZClbtqSNRCL74r09dT/s/L0004bm2wkFZOdkvpw=;
 b=n9mdQv8G4fXugIUEabN4MWql/u4s/rYPE35W07VuWvgg+OYa5EfcZWakWKJT36dBbN
 n1qlp+eThe8rv4D+rf0O8waLcytYQVz3JI/u10NAYD0liFI9TIjkkk5ZrNYmV4x6q8CD
 C6hLu/yOWiu3GnqF2l+kHnOPHiJcnErsUIAzvh9t+FXZ3M/2tHn22Xd/0AhM/eD1OOaD
 /3OLLFkuQna2RB3wcKm+QodrWDOQ72Esal3ZGfa/K4ME0WAy3Jx4vRmtJ2GANVI0BZ5x
 NZlfXSqNiPC4nn9GJjKu1s2CNarzOeSmejmPAAEeNcWaOl73DEqtt3T0M3ldt7Au0WW1
 LZlw==
X-Gm-Message-State: AOAM531RcDTj11vchGGRTb43w1938sSyh9qaNJFCpWWgbDAmgMptp6cu
 2q9DrVROHbhuU42WPx2GDPxF3O34CfrZJCmvEUA=
X-Google-Smtp-Source: ABdhPJz9S+/08teCkrSYtov5TVXHjlhnkYqXtiynqti4U2t6y6GyLIbc6CDS+kdJpadP1XHXIbp3FuZ6ZiufSdFBQEs=
X-Received: by 2002:a17:906:5d12:: with SMTP id
 g18mr19803542ejt.186.1625593819751; 
 Tue, 06 Jul 2021 10:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <YJ4yBmIV6RJCo42U@google.com> <s5hk0o18tio.wl-tiwai@suse.de>
 <YJ5cHdv6MVmAKD3b@google.com> <YKDYQfDf7GiMfGCN@google.com>
 <YKDYbaprE3K2QpCe@google.com> <s5hbl9b6mah.wl-tiwai@suse.de>
In-Reply-To: <s5hbl9b6mah.wl-tiwai@suse.de>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 6 Jul 2021 10:50:08 -0700
Message-ID: <CAMo8BfKKMQkcsbOQaeEjq_FsJhdK=fn598dvh7YOcZshUSOH=g@mail.gmail.com>
Subject: Re: ALSA: intel8x0: div by zero in snd_intel8x0_update()
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
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

Hello,

On Sun, May 16, 2021 at 2:50 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sun, 16 May 2021 10:31:41 +0200,
> Sergey Senozhatsky wrote:
> >
> > On (21/05/16 17:30), Sergey Senozhatsky wrote:
> > > On (21/05/14 20:16), Sergey Senozhatsky wrote:
> > > > > --- a/sound/pci/intel8x0.c
> > > > > +++ b/sound/pci/intel8x0.c
> > > > > @@ -691,6 +691,9 @@ static inline void snd_intel8x0_update(struct intel8x0 *chip, struct ichdev *ich
> > > > >         int status, civ, i, step;
> > > > >         int ack = 0;
> > > > >
> > > > > +       if (!ichdev->substream || ichdev->suspended)
> > > > > +               return;
> > > > > +
> > > > >         spin_lock_irqsave(&chip->reg_lock, flags);
> > > > >         status = igetbyte(chip, port + ichdev->roff_sr);
> > > > >         civ = igetbyte(chip, port + ICH_REG_OFF_CIV);
> > >
> > > This does the problem for me.
> >
> >        ^^^ does fix
>
> OK, thanks for confirmation.  So this looks like some spurious
> interrupt with the unexpected hardware bits.
>
> However, the suggested check doesn't seem covering enough, and it
> might still hit if the suspend/resume happens before the device is
> opened but not set up (and such a spurious irq is triggered).
>
> Below is more comprehensive fix.  Let me know if this works, too.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> Subject: [PATCH] ALSA: intel8x0: Don't update period unless prepared
>
> The interrupt handler of intel8x0 calls snd_intel8x0_update() whenever
> the hardware sets the corresponding status bit for each stream.  This
> works fine for most cases as long as the hardware behaves properly.
> But when the hardware gives a wrong bit set, this leads to a NULL
> dereference Oops, and reportedly, this seems what happened on a VM.
>
> For fixing the crash, this patch adds a internal flag indicating that
> the stream is ready to be updated, and check it (as well as the flag
> being in suspended) to ignore such spurious update.
>
> Cc: <stable@vger.kernel.org>
> Reported-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/intel8x0.c | 7 +++++++
>  1 file changed, 7 insertions(+)

linux v5.13 booting on qemu-system-xtensa virt board gets stuck inside
snd_intel8x0_probe -> intel8x0_measure_ac97_clock with this patch.
Prior to it it boots successfully for me.
I'm curious if this issue has been reported yet.

What I see is an IRQ flood, at some point snd_intel8x0_interrupt
and timer ISR  are called in loop and execution never returns to
the interrupted function intel8x0_measure_ac97_clock.

Any idea what it could be?

--
Thanks.
-- Max
