Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE96348A2B
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 08:28:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17ACE166C;
	Thu, 25 Mar 2021 08:27:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17ACE166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616657282;
	bh=A78Q+zkPq2nEQbSmxqUMSf33n3aYVSl9ujs/T0G+WV4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cXlSbRYMQgNXNnh0Nr3LWHySyNqlBLGbRVuNNJjRJy0aEaWniAs2gA1jYWzG7ZVlc
	 29qCA3zSjNoJ9wnOIIykJFyDvEGqdPpfgGnD5smu21S1DwVkgGHRmuSTRbKjnRRxtb
	 gQ/Ie5jDg3XV+WYQnOe3vISDNBT1EI2R9c/LGbcw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46801F80268;
	Thu, 25 Mar 2021 08:26:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B38FCF8025F; Thu, 25 Mar 2021 08:26:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAEDBF80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 08:26:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAEDBF80104
Received: from mail-lj1-f198.google.com ([209.85.208.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1lPKNp-0006HN-G6
 for alsa-devel@alsa-project.org; Thu, 25 Mar 2021 07:26:21 +0000
Received: by mail-lj1-f198.google.com with SMTP id b24so2566245ljf.11
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 00:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h65iB8fJxtr3WXADdRV0fzAhv+9Eb2KmvqOOMl04h9E=;
 b=Y3jdG0hysXAvV9gCl+UlNCgRsrTH+epXAU4JnPvlbv/w+GwwW3nWAsHJhzRJWsbBbO
 DgNRLc4V0tDp5k9KQ4+wBNgzre/FP00MqqCBntBlctDY5aXFcKzP2S7MER/Iu+Lwwy5e
 QmZrWytxhoMZDYOMfuZZsmplMC1AuSdY2Yo0FzZjvgoDC6ByBaO6M+Cx/RI/0pjUZE+i
 4+KrCDOXjRUDzRGQUcU/peR4OnxT1eHnGm/+c7GUlEHIPRFs/TU1dAYtQnj3lMtb14Ap
 ftAFkyn5nY70eUvc68W0VrtembIO4Kxrb2KRO8cVzGlB/f/pmwoI6HmKI4mYCZ3EXI4r
 VjBA==
X-Gm-Message-State: AOAM530BpGkr1kx/ruJeP8OYF/XV+/2F8CottsTqpYSOJRk5nIqFu2Nw
 x8H1aeQ+Hp67M7SBx8r0bdfnm+pZJh3z4Xzjw2W/DQ4MuM9tN4O91twsZlBxtWZxaN5CMczDmTO
 OsMzjmHCn2gyym3xE7leTKlkOi74sUMDPhK5Nb6MTUeeHHsgomDmVyRJN
X-Received: by 2002:a05:6512:3582:: with SMTP id
 m2mr4267458lfr.10.1616657180880; 
 Thu, 25 Mar 2021 00:26:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWhSFaP7Ao1JcRgKv4+ndiMSYVHoI38U66PJbVh7i1QaGIDxdSdC/uz+tig0tTd5RsHT71ayOnRogMl8iDzOs=
X-Received: by 2002:a05:6512:3582:: with SMTP id
 m2mr4267441lfr.10.1616657180598; 
 Thu, 25 Mar 2021 00:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210324171410.285848-1-kai.heng.feng@canonical.com>
 <20210324171410.285848-2-kai.heng.feng@canonical.com>
 <s5hzgyrn1id.wl-tiwai@suse.de>
In-Reply-To: <s5hzgyrn1id.wl-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 25 Mar 2021 15:26:09 +0800
Message-ID: <CAAd53p7F=TWu5aYT00C03kDvtF-Wfw2YzeweGHecRHT87oNb+A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Check connector value on resume
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Lars-Peter Clausen <lars@metafoo.de>, open list <linux-kernel@vger.kernel.org>,
 Chris Chiu <chiu@endlessm.com>, Takashi Iwai <tiwai@suse.com>,
 Tom Yan <tom.ty89@gmail.com>, Joe Perches <joe@perches.com>
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

On Thu, Mar 25, 2021 at 3:19 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 24 Mar 2021 18:14:08 +0100,
> Kai-Heng Feng wrote:
> >
> > Rear Mic on Lenovo P620 cannot record after S3, despite that there's no
> > error and the other two functions of the USB audio, Line In and Line
> > Out, work just fine.
> >
> > The mic starts to work again after running userspace app like "alsactl
> > store". Following the lead, the evidence shows that as soon as connector
> > status is queried, the mic can work again.
> >
> > So also check connector value on resume to "wake up" the USB audio to
> > make it functional.
> >
> > This can be device specific, however I think this generic approach may
> > benefit more than one device.
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> Just to be sure: this workaround is always needed no matter whether
> reset_resume is set or not?

Yes, reset_resume is irrelevant for this issue. Getting connector
status is the key.

> If so, it's better to change the resume
> callback to take reset_resume argument and call it always.  The
> resume_connector() can be folded into there.

OK, will send V2.

Kai-Heng

>
>
> thanks,
>
> Takashi
>
> > ---
> >  sound/usb/mixer.c | 18 ++++++++++++++++++
> >  sound/usb/mixer.h |  1 +
> >  2 files changed, 19 insertions(+)
> >
> > diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> > index 98f5417a70e4..6a553d891b0f 100644
> > --- a/sound/usb/mixer.c
> > +++ b/sound/usb/mixer.c
> > @@ -3631,11 +3631,28 @@ static int restore_mixer_value(struct usb_mixer_elem_list *list)
> >       return 0;
> >  }
> >
> > +static int resume_connector(struct usb_mixer_elem_list *list)
> > +{
> > +     struct usb_mixer_elem_info *cval = mixer_elem_list_to_info(list);
> > +
> > +     if (cval->val_type != USB_MIXER_BOOLEAN || cval->channels != 1)
> > +             return 0;
> > +
> > +     return get_connector_value(cval, NULL, NULL);
> > +}
> > +
> >  int snd_usb_mixer_resume(struct usb_mixer_interface *mixer, bool reset_resume)
> >  {
> >       struct usb_mixer_elem_list *list;
> >       int id, err;
> >
> > +     for (id = 0; id < MAX_ID_ELEMS; id++) {
> > +             for_each_mixer_elem(list, mixer, id) {
> > +                     if (list->resume_connector)
> > +                             list->resume_connector(list);
> > +             }
> > +     }
> > +
> >       if (reset_resume) {
> >               /* restore cached mixer values */
> >               for (id = 0; id < MAX_ID_ELEMS; id++) {
> > @@ -3664,5 +3681,6 @@ void snd_usb_mixer_elem_init_std(struct usb_mixer_elem_list *list,
> >       list->dump = snd_usb_mixer_dump_cval;
> >  #ifdef CONFIG_PM
> >       list->resume = restore_mixer_value;
> > +     list->resume_connector = resume_connector;
> >  #endif
> >  }
> > diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
> > index c29e27ac43a7..843ccff0eea3 100644
> > --- a/sound/usb/mixer.h
> > +++ b/sound/usb/mixer.h
> > @@ -69,6 +69,7 @@ struct usb_mixer_elem_list {
> >       bool is_std_info;
> >       usb_mixer_elem_dump_func_t dump;
> >       usb_mixer_elem_resume_func_t resume;
> > +     usb_mixer_elem_resume_func_t resume_connector;
> >  };
> >
> >  /* iterate over mixer element list of the given unit id */
> > --
> > 2.30.2
> >
