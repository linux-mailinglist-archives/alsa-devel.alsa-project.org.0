Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A4D3493F1
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 15:26:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9D431669;
	Thu, 25 Mar 2021 15:25:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9D431669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616682395;
	bh=PFGAa7DjrxuSwcUgfZucsxIljtbjDmWnY97Kj/KE7j8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=on94BxuEkTekhj3dvqgm99FwPO1RQcVDMW6y9BbxVlk77wUlprD7IdUinIHRPubWD
	 ii9y1h4+5cFUrHWNksmCmMPgKJER+BI/E/ABKM54X0PQL0H3kkzKyb7bQ0fMKNIgjb
	 lKGTCrxDLGeor/diew7r//EX8ZkQIvJ/m8Vqg+ag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 379C0F80268;
	Thu, 25 Mar 2021 15:25:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40C21F8025F; Thu, 25 Mar 2021 15:25:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BB9BF800FF
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 15:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BB9BF800FF
Received: from mail-lj1-f199.google.com ([209.85.208.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1lPQuu-0001Kz-Gb
 for alsa-devel@alsa-project.org; Thu, 25 Mar 2021 14:24:56 +0000
Received: by mail-lj1-f199.google.com with SMTP id f28so3135668ljo.8
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 07:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C6GP4Z3q3QGtdVDSvOH0+jTBijfgDZ/MgAqVve/FMLw=;
 b=EwvRT2pY9i5s5JdRWIKHW1/jRFSQQw1SrqiLhIOMmfiu5sfRiqikGaA3i/Rfxp6vlT
 pftmriweWprLP+QzFEHxGmxCGbUd18+H/B6NYZyzR7n5XWdS/NFnUZv39jHDSyLgCzY4
 5wFd9TeNFxofDO+V3rsXDoF1uWw8/sK0QKhQ/5ZUmYbIB+lYFCV6LX1Ygv8v/C0MYUFc
 F4UvznBCc+ly/d7r5EfJAxmcTgq5MrVmsmLntucqQ0DwpnN7NgeYBEg+svMPsjvGn0RL
 ROzeLUku/AisB4GAc2q6eT2pPCkKq4xVlVnPBjCmBgNJOUdnrlR74sLeCQoIBZaMaU/q
 c/bA==
X-Gm-Message-State: AOAM531ShRtnHjbUBwE504X4/DdEEW6NEYTJg/EaJf9slpq0cUbei/LB
 VSbX+hl63VN9rFiKNuOD6imi3nHPha9/xYNoRdvDjEpKwqR32eJhcg0aTKvY/N9UjxdaVL8g1AG
 GJCr4hQ2IeAoM05cy4TbLCk3479sXUpgchS8JA0y1UbBRckRw5wrpU3bq
X-Received: by 2002:a05:6512:1084:: with SMTP id
 j4mr5089763lfg.194.1616682295899; 
 Thu, 25 Mar 2021 07:24:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybRtwMnLSv5W91bPNdCQ0Ll+OOUT0gDTbVf3mgYnvZsrJS9Lur+rlgxs/FXiQYqkz2/2vgtosKyAFqFIHeoRU=
X-Received: by 2002:a05:6512:1084:: with SMTP id
 j4mr5089742lfg.194.1616682295598; 
 Thu, 25 Mar 2021 07:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210325121250.133009-1-kai.heng.feng@canonical.com>
 <20210325121250.133009-2-kai.heng.feng@canonical.com>
 <s5hczvnmju0.wl-tiwai@suse.de>
 <CAAd53p79HSpNKu69ZM7vRGWQT+9ydf59hGH-yNMT=Ymbg2NebA@mail.gmail.com>
In-Reply-To: <CAAd53p79HSpNKu69ZM7vRGWQT+9ydf59hGH-yNMT=Ymbg2NebA@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 25 Mar 2021 22:24:42 +0800
Message-ID: <CAAd53p4NagjhwSsdGbpzGM7Wwc60kJP53+ew4Ub72KcFB5q-dQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ALSA: usb-audio: Check connector value on resume
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Skripkin <paskripkin@gmail.com>,
 Chris Chiu <chiu@endlessm.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Joe Perches <joe@perches.com>,
 Tom Yan <tom.ty89@gmail.com>, open list <linux-kernel@vger.kernel.org>
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

On Thu, Mar 25, 2021 at 9:55 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Thu, Mar 25, 2021 at 9:41 PM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Thu, 25 Mar 2021 13:12:48 +0100,
> > Kai-Heng Feng wrote:
> > >
> > > Rear Mic on Lenovo P620 cannot record after S3, despite that there's no
> > > error and the other two functions of the USB audio, Line In and Line
> > > Out, work just fine.
> > >
> > > The mic starts to work again after running userspace app like "alsactl
> > > store". Following the lead, the evidence shows that as soon as connector
> > > status is queried, the mic can work again.
> > >
> > > So also check connector value on resume to "wake up" the USB audio to
> > > make it functional.
> > >
> > > This can be device specific, however I think this generic approach may
> > > benefit more than one device.
> > >
> > > While at it, also remove reset-resume path to consolidate mixer resume
> > > path.
> > >
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > ---
> > > v2:
> > >  - Remove reset-resume.
> > >  - Fold the connector checking to the mixer resume callback.
> >
> > That's not what I meant exactly...  I meant to put both into the
> > single resume callback, but handle each part conditionally depending
> > on reset_resume argument.
>
> OK, I get what you mean now.
>
> >
> > But this turned out to need more changes in mixer_quirks.c
> > unnecessarily.  Maybe adding the two resume functions is a better
> > approach in the end, but not for the specific connection thing but
> > generically both resume and reset_resume callbacks.  Something like
> > below.
>
> This approach looks good. Let me send another one.

Actually, it works really well and I don't I think I should send the
code you wrote.
Is it possible to push your version with my commit log, and with my tested tag?

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

> Kai-Heng
>
> >
> >
> > thanks,
> >
> > Takashi
> >
> >
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index b004b2e63a5d..1dab281bb269 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -3615,20 +3615,43 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
> >         return 0;
> >  }
> >
> > +static int default_mixer_resume(struct usb_mixer_elem_list *list)
> > +{
> > +       struct usb_mixer_elem_info *cval = mixer_elem_list_to_info(list);
> > +
> > +       /* get connector value to "wake up" the USB audio */
> > +       if (cval->val_type == USB_MIXER_BOOLEAN && cval->channels == 1)
> > +               get_connector_value(cval, NULL, NULL);
> > +
> > +       return 0;
> > +}
> > +
> > +static int default_mixer_reset_resume(struct usb_mixer_elem_list *list)
> > +{
> > +       int err = default_mixer_resume(list);
> > +
> > +       if (err < 0)
> > +               return err;
> > +       return restore_mixer_value(list);
> > +}
> > +
> >  int snd_usb_mixer_resume(struct usb_mixer_interface *mixer, bool reset_resume)
> >  {
> >         struct usb_mixer_elem_list *list;
> > +       usb_mixer_elem_resume_func_t f;
> >         int id, err;
> >
> > -       if (reset_resume) {
> > -               /* restore cached mixer values */
> > -               for (id = 0; id < MAX_ID_ELEMS; id++) {
> > -                       for_each_mixer_elem(list, mixer, id) {
> > -                               if (list->resume) {
> > -                                       err = list->resume(list);
> > -                                       if (err < 0)
> > -                                               return err;
> > -                               }
> > +       /* restore cached mixer values */
> > +       for (id = 0; id < MAX_ID_ELEMS; id++) {
> > +               for_each_mixer_elem(list, mixer, id) {
> > +                       if (reset_resume)
> > +                               f = list->reset_resume;
> > +                       else
> > +                               f = list->resume;
> > +                       if (f) {
> > +                               err = list->resume(list);
> > +                               if (err < 0)
> > +                                       return err;
> >                         }
> >                 }
> >         }
> > @@ -3647,6 +3670,7 @@ void snd_usb_mixer_elem_init_std(struct usb_mixer_elem_list *list,
> >         list->id = unitid;
> >         list->dump = snd_usb_mixer_dump_cval;
> >  #ifdef CONFIG_PM
> > -       list->resume = restore_mixer_value;
> > +       list->resume = default_mixer_resume;
> > +       list->reset_resume = default_mixer_reset_resume;
> >  #endif
> >  }
> > diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
> > index c29e27ac43a7..e5a01f17bf3c 100644
> > --- a/sound/usb/mixer.h
> > +++ b/sound/usb/mixer.h
> > @@ -69,6 +69,7 @@ struct usb_mixer_elem_list {
> >         bool is_std_info;
> >         usb_mixer_elem_dump_func_t dump;
> >         usb_mixer_elem_resume_func_t resume;
> > +       usb_mixer_elem_resume_func_t reset_resume;
> >  };
> >
> >  /* iterate over mixer element list of the given unit id */
> > diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> > index ffd922327ae4..b7f9c2fded05 100644
> > --- a/sound/usb/mixer_quirks.c
> > +++ b/sound/usb/mixer_quirks.c
> > @@ -151,7 +151,7 @@ static int add_single_ctl_with_resume(struct usb_mixer_interface *mixer,
> >                 *listp = list;
> >         list->mixer = mixer;
> >         list->id = id;
> > -       list->resume = resume;
> > +       list->reset_resume = resume;
> >         kctl = snd_ctl_new1(knew, list);
> >         if (!kctl) {
> >                 kfree(list);
