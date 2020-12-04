Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C062CF483
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Dec 2020 20:08:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BDC318A5;
	Fri,  4 Dec 2020 20:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BDC318A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607108879;
	bh=ZKw5BBvNgR9SU2Um0x3WIiY+0uK7pql15Ni/pMRAj6U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pIQggqS4qfiTWStFMfGnY4CZYhlu48rK5OlVw7x00g3L9Nj4trwHgynyT453lbRMa
	 nfkNC0Tw7UmN9oNYw4Q943pVGWapk6mo3/3J+d3wue/Rg3Ex5Ue0FEtmAUi58XLSCd
	 xv8Q3bMmG/GV/uBLEMW5UGfThRHm5vQDNlpJb6Rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0CD7F8049C;
	Fri,  4 Dec 2020 20:06:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81AB8F80278; Fri,  4 Dec 2020 20:06:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6137EF800E2
 for <alsa-devel@alsa-project.org>; Fri,  4 Dec 2020 20:06:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6137EF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AAj6uX7d"
Received: by mail-oi1-x244.google.com with SMTP id k2so7271182oic.13
 for <alsa-devel@alsa-project.org>; Fri, 04 Dec 2020 11:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9SSxKWxjnwfp6dFu5W8jyF2oszJ3ecRrLvGt3qF45uk=;
 b=AAj6uX7dLhJArLrZqzoIS4gSWJ0zqnhnymIIpGVGEx+Z8LeBqZWVI4vZ/D6xtf/1Z6
 qf0p9/nnHVMwvNOr+nK9ER1/POhdL5jX9YVTfaYUr8U8StgTh4AIVXQ0zvPpQRrrrAhV
 LIkrlay2JVaxCfIjnaAgfM0qbWO7P1mwwLUmWfD4d6FGsAv6ByNPHvHApm3kTg2AmJXc
 FWaHmxLt7+cRkZdEQQayFYQ9QN4nrR95RnAEt+XmXbScH+61VlzdYU1ilx58J0RGl2ON
 MMas+2g9/kNVLq391dC/pKfhB1VrOaoiKQOyiEBmxx+17LTCBSNt0X/ITTdCqQ9xp1Q4
 eOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9SSxKWxjnwfp6dFu5W8jyF2oszJ3ecRrLvGt3qF45uk=;
 b=fbPU51GbiHQB4p6+2sjsWZ7MFq69WGGtjlUKCKIqxNIa8UzQxfLa0J3WZLx/2KcRtS
 UWmIx+MtnpOzZ5OU/OvzVey+wEw8DO32rQwt8C66Ozd8qiAlTrl3op7szUDPvlOFwKb6
 WXX8cBsnVrYfgqyBSKdvtRUqr7PY5b9uz4VQCADjL/QbKf1VDA/h/mfSqjWrwy1RJFqZ
 prVXfUkPMTE4bs5CxRNJ0O0GZzMnWcAIoCQE291a66ocBBMljgC535/KOyqT+PybQAr8
 gvdapzUPA4m0CtUQcMKq3BqYhAzcroB4qUXt/zQQkwAIkNpyUVkIFZUVc6m1AIIugIkr
 BhxA==
X-Gm-Message-State: AOAM5322gCUgTx12pRYehnVAOgy5rS5nnqKXhrza+noLLnOcFsUIXRpX
 fBqMMhJRA9o/sFz4NHVBmEJPkfiP/204WXqz+JA=
X-Google-Smtp-Source: ABdhPJx8OCr1XmyQ/MaPO23/w2Ar8mjkrNhVQS1ZEr24uEJD4tHHRjEOQDVQF6QAAIwcbCP5iwBy60LlRfw5VacLg1I=
X-Received: by 2002:aca:3305:: with SMTP id z5mr4174797oiz.34.1607108773383;
 Fri, 04 Dec 2020 11:06:13 -0800 (PST)
MIME-Version: 1.0
References: <1605220482-28487-1-git-send-email-ruslan.bilovol@gmail.com>
 <1j360vyx9h.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j360vyx9h.fsf@starbuckisacylon.baylibre.com>
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date: Fri, 4 Dec 2020 21:06:00 +0200
Message-ID: <CAB=otbRXPa7572jacacsWpTsiemBUc1BgDUT3Qx751Uwg4qUOA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] alsaloop: add feedback frequency control support
 for UAC2 gadgets
To: Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Linux USB <linux-usb@vger.kernel.org>,
 Glenn Schmottlach <gschmottlach@gmail.com>
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

On Fri, Nov 27, 2020 at 11:17 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu 12 Nov 2020 at 23:34, Ruslan Bilovol <ruslan.bilovol@gmail.com> wrote:
>
> > Add support of special "PCM Feedback Frequency Hz"
> > UAC2 Gadget mixer control that is designed to notify
> > host about real sampling frequency of the gadget so
> > it can adjust number of samples that hosts sends to
> > the gadget.
> >
> > This is useful if both host and gadget has its own
> > internal freerunning clock, so host can adjust
> > number of samples sent, preventing overrun/underrun
> > conditions.
> >
> > This patch reuses logic of the "PCM Rate Shift 100000"
> > control used in case of in-kernel ALSA loopback
> > driver. The only difference is alsaloop reports not
> > rate shift but frequency in Hz
> >
> > Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> > ---
> >  alsaloop/alsaloop.h |  1 +
> >  alsaloop/pcmjob.c   | 35 +++++++++++++++++++++++++----------
> >  2 files changed, 26 insertions(+), 10 deletions(-)
> >
> > diff --git a/alsaloop/alsaloop.h b/alsaloop/alsaloop.h
> > index c4aa618..9a50a42 100644
> > --- a/alsaloop/alsaloop.h
> > +++ b/alsaloop/alsaloop.h
> > @@ -122,6 +122,7 @@ struct loopback_handle {
> >       unsigned int ctl_pollfd_count;
> >       snd_ctl_elem_value_t *ctl_notify;
> >       snd_ctl_elem_value_t *ctl_rate_shift;
> > +     snd_ctl_elem_value_t *ctl_fback_freq;
> >       snd_ctl_elem_value_t *ctl_active;
> >       snd_ctl_elem_value_t *ctl_format;
> >       snd_ctl_elem_value_t *ctl_rate;
> > diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
> > index 6a9aff4..b3802a8 100644
> > --- a/alsaloop/pcmjob.c
> > +++ b/alsaloop/pcmjob.c
> > @@ -1058,15 +1058,22 @@ static int set_notify(struct loopback_handle *lhandle, int enable)
> >
> >  static int set_rate_shift(struct loopback_handle *lhandle, double pitch)
> >  {
> > -     int err;
> > +     int err = 0;
> >
> > -     if (lhandle->ctl_rate_shift == NULL)
> > -             return 0;
> > -     snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
> > -     err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
> > -     if (err < 0) {
> > -             logit(LOG_CRIT, "Cannot set PCM Rate Shift element for %s: %s\n", lhandle->id, snd_strerror(err));
> > -             return err;
> > +     if (lhandle->ctl_rate_shift) {
> > +             snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
> > +             err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
> > +             if (err < 0) {
> > +                     logit(LOG_CRIT, "Cannot set PCM Rate Shift element for %s: %s\n", lhandle->id, snd_strerror(err));
> > +                     return err;
> > +             }
> > +     } else if (lhandle->ctl_fback_freq) {
> > +             snd_ctl_elem_value_set_integer(lhandle->ctl_fback_freq, 0, lhandle->rate * (2.0 - pitch));
> > +             err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_fback_freq);
> > +             if (err < 0) {
> > +                     logit(LOG_CRIT, "Cannot set PCM Feedback Frequency element for %s: %s\n", lhandle->id, snd_strerror(err));
> > +                     return err;
> > +             }
>
> Hi Ruslan,
>
> I wonder why bother adding a control of another type for the audio
> gadget ? Why not give the gadget a "Rate Shift" control, instead "Feedback
> Frequency" and let the driver deal with shift as necessary ?
>
> It would be easier for the applications to re-use the same logic.

I actually initially implemented "Rate Shift" control which simplified
brignup of UAC2 feedback support.

However, there is an issue with it.
The way how it's supposed to work is next - userspace calculates
real sampling frequency at which it consumes samples (usually it's
some internal clock frequency) then tells the real sampling frequency
to UAC2 gadget drivers which notifies the host which can adjust the
number of samples it sends to the gadget.

With "Rate Shift" control userspace has to convert measured absolute clock
frequency to relative 100000 format, then write this to UAC2 gadget which has
to convert it back from relative 100000 format to absolute frequency in Hz,
so it does a lot of unneeded conversions here.
Another issue with this approach is userspace can't know at which resolution
works feedback endpoint, so it continuously updates UAC's feedback frequency
"Rate Shift" control without any effect (because current feedback implementation
works with 1Hz resolution)

So what was designed to work with in-kernel alsaloop 'aloop' loopback, doesn't
fit well in the UAC2 case.

However, I want to improve resolution of feedback frequency, it can be better as
per USB spec, so this interface may be changed in next versions of
this patch set

Thanks,
Ruslan

>
> >       }
> >       return 0;
> >  }
> > @@ -1195,6 +1202,7 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
> >       int err;
> >
> >       lhandle->ctl_rate_shift = NULL;
> > +     lhandle->ctl_fback_freq = NULL;
> >       if (lhandle->loopback->play == lhandle) {
> >               if (lhandle->loopback->controls)
> >                       goto __events;
> > @@ -1204,6 +1212,8 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
> >                       &lhandle->ctl_notify);
> >       openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
> >                       &lhandle->ctl_rate_shift);
> > +     openctl_elem(lhandle, device, subdevice, "PCM Feedback Frequency Hz",
> > +                     &lhandle->ctl_fback_freq);
> >       set_rate_shift(lhandle, 1);
> >       openctl_elem(lhandle, device, subdevice, "PCM Slave Active",
> >                       &lhandle->ctl_active);
> > @@ -1289,6 +1299,9 @@ static int closeit(struct loopback_handle *lhandle)
> >       if (lhandle->ctl_rate_shift)
> >               snd_ctl_elem_value_free(lhandle->ctl_rate_shift);
> >       lhandle->ctl_rate_shift = NULL;
> > +     if (lhandle->ctl_fback_freq)
> > +             snd_ctl_elem_value_free(lhandle->ctl_fback_freq);
> > +     lhandle->ctl_fback_freq = NULL;
> >       if (lhandle->ctl)
> >               err = snd_ctl_close(lhandle->ctl);
> >       lhandle->ctl = NULL;
> > @@ -1334,9 +1347,11 @@ int pcmjob_init(struct loopback *loop)
> >       snprintf(id, sizeof(id), "%s/%s", loop->play->id, loop->capt->id);
> >       id[sizeof(id)-1] = '\0';
> >       loop->id = strdup(id);
> > -     if (loop->sync == SYNC_TYPE_AUTO && loop->capt->ctl_rate_shift)
> > +     if (loop->sync == SYNC_TYPE_AUTO && (loop->capt->ctl_rate_shift ||
> > +                     loop->capt->ctl_fback_freq))
> >               loop->sync = SYNC_TYPE_CAPTRATESHIFT;
> > -     if (loop->sync == SYNC_TYPE_AUTO && loop->play->ctl_rate_shift)
> > +     if (loop->sync == SYNC_TYPE_AUTO && (loop->play->ctl_rate_shift ||
> > +                     loop->play->ctl_fback_freq))
> >               loop->sync = SYNC_TYPE_PLAYRATESHIFT;
> >  #ifdef USE_SAMPLERATE
> >       if (loop->sync == SYNC_TYPE_AUTO && loop->src_enable)
>
