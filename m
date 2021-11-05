Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C34E4461F1
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 11:07:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A36C1167B;
	Fri,  5 Nov 2021 11:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A36C1167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636106830;
	bh=cd/S6J3NTr0KSnFTcDF2vPBr2Cyr3eEqmfCvfbw5Nig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ul/ZSdR4GUaDjboh6FeRqfyQRAY5KxWOJGRFrfVs4rgdU5t7h8k3Jd6NL+hX23ykj
	 +EBJioJEm7EgVfaR4CvgvJhvSrS/a9Pqjuaz7jA657HMq4+/xhU6reV+0QnOXoMrsm
	 P4t/Y+F2gqLE/deFwIZZwGaa5i/FKeHAtj4NN1xs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC3EDF80148;
	Fri,  5 Nov 2021 11:05:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEBF9F80269; Fri,  5 Nov 2021 11:05:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FE02F8012A
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 11:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FE02F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="oN4VawOf"
Received: by mail-wm1-x32d.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso9148529wmd.3
 for <alsa-devel@alsa-project.org>; Fri, 05 Nov 2021 03:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eQQN3cZ3ZYlOP1SKU3EWm5fltXMaM6QENqiHQxObiAk=;
 b=oN4VawOfayhXGFcjL/OY2ByxHZvv++a/hppSofBR49CrQU33NcF4lE3glygk4GVzNm
 U0z58kWz6nSroAZwHZCgXRbFH4m73K5hEde27MrnQkGqOL/7qm6lPGMLq9N4wuR79zaK
 A3Fw04dffqRaOScpUz3wzf6cysPPr1GHiASKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eQQN3cZ3ZYlOP1SKU3EWm5fltXMaM6QENqiHQxObiAk=;
 b=S8UdW0x3UOzyG+RfpCj0EYJoXjYSnGmnpQSRsuwIPz1SicODIjWb6w3H5rEMWVVcZf
 +0PeoPaiLvWCCzVn6UljKYhrv43w+/srOvAhkT3X8YJn/etK+FVrJYNCDuuPgGsJ0AHU
 +TFl8R1jMMgqOj+bARZPq1KXc5BvEvqSgeSUnvrdNOHVoUNUBSYleTSNmemjt9/56ak0
 fj42E/kByYZC9ka+MEPkbp2d7YMoqfy/uKq7JhoiTu7ufkVX2sYet7BB9b6qkiPfHI/c
 eL/eMNz/8wqlTyK+uXdqZKrtrhsmeVjiwK/V9Ci4RFNCMReXNU7EVZ1zA8RJITFQGsXQ
 Nh9Q==
X-Gm-Message-State: AOAM533c6ZJM7rlHYJLTUgbfeVy3JlIcKRFA9Ti9IDDisUBbGEs4DgJd
 6e0Q8uMwrrr7nUvShbDn4a2mzm29xZtDsNv6LNVqwfFyBcYH2w==
X-Google-Smtp-Source: ABdhPJxd9nbygh1z/X3OnfURMe4VbA6b7ONLmPfjo7fL2PQYINP61arIPwHV+35s2VwdKsauPvFFurspLvoOHvaX8jY=
X-Received: by 2002:a05:600c:2dc1:: with SMTP id
 e1mr28904927wmh.170.1636106741147; 
 Fri, 05 Nov 2021 03:05:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAGvk5PoVp7LoFbaq93_F0Mf9xHzOqSt-HpK0gYh4WMAHrJ6vag@mail.gmail.com>
 <s5hmtmjgir3.wl-tiwai@suse.de>
 <CAGvk5PoWi9sCiEAG84qmfH67nshFZOtX2r+z6P3vsJ5=7_pPHA@mail.gmail.com>
 <s5hilx7gfou.wl-tiwai@suse.de> <s5hcznfgece.wl-tiwai@suse.de>
In-Reply-To: <s5hcznfgece.wl-tiwai@suse.de>
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Date: Fri, 5 Nov 2021 18:05:30 +0800
Message-ID: <CAGvk5PrUhmeWeqHujY-LJ7M=K5=17v6WWq7aKoUQ8HZ0-9OcZg@mail.gmail.com>
Subject: Re: The regression caused by snd_soc_dapm_enable_pin
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Takashi Iwai <tiwai@suse.de> =E6=96=BC 2021=E5=B9=B411=E6=9C=885=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=885:07=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, 05 Nov 2021 09:38:41 +0100,
> Takashi Iwai wrote:
> >
> > On Fri, 05 Nov 2021 09:33:52 +0100,
> > Yu-Hsuan Hsu wrote:
> > >
> > > Takashi Iwai <tiwai@suse.de> =E6=96=BC 2021=E5=B9=B411=E6=9C=885=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:32=E5=AF=AB=E9=81=93=EF=BC=9A
> > > >
> > > > On Fri, 05 Nov 2021 03:58:46 +0100,
> > > > Yu-Hsuan Hsu wrote:
> > > > >
> > > > > Hi Takashi,
> > > > >
> > > > > The patch 5af82c81b2c49cfb1cad84d9eb6eab0e3d1c4842(ASoC: DAPM: Fi=
x
> > > > > missing kctl change notifications) caused the regression on some
> > > > > ChromeBook.
> > > > >
> > > > > The reason is that some drivers check the return value of
> > > > > snd_soc_dapm_enable_pin, like kabylake_ssp0_trigger(Which caused =
a
> > > > > regression). In addition, some SOF drivers may be also affected b=
y
> > > > > this change(e.g. sof_sdw_max98373.c). Could you help to fix it?
> > > >
> > > > Does the patch below fix the problem?
> > > >
> > > >
> > > > Takashi
> > > >
> > > >
> > > > --- a/sound/soc/soc-dapm.c
> > > > +++ b/sound/soc/soc-dapm.c
> > > > @@ -3589,10 +3589,10 @@ int snd_soc_dapm_put_pin_switch(struct snd_=
kcontrol *kcontrol,
> > > >         const char *pin =3D (const char *)kcontrol->private_value;
> > > >         int ret;
> > > >
> > > > -       if (ucontrol->value.integer.value[0])
> > > > -               ret =3D snd_soc_dapm_enable_pin(&T->dapm, pin);
> > > > -       else
> > > > -               ret =3D snd_soc_dapm_disable_pin(&card->dapm, pin);
> > > > +       mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLA=
SS_RUNTIME);
> > > > +
> > > > +       ret =3D snd_soc_dapm_set_pin(dapm, pin, !!ucontrol->value.i=
nteger.value[0]);
> > > > +       mutex_unlock(&dapm->card->dapm_mutex);
> > > >
> > > >         snd_soc_dapm_sync(&card->dapm);
> > > >         return ret;
> > > > @@ -4506,7 +4506,9 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_stream_stop);
> > > >  int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *=
dapm,
> > > >                                    const char *pin)
> > > >  {
> > > > -       return snd_soc_dapm_set_pin(dapm, pin, 1);
> > > > +       int err =3D snd_soc_dapm_set_pin(dapm, pin, 1);
> > > > +
> > > > +       return err < 0 ? err : 0;
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(snd_soc_dapm_enable_pin_unlocked);
> > > >
> > > > @@ -4527,7 +4529,7 @@ int snd_soc_dapm_enable_pin(struct snd_soc_da=
pm_context *dapm, const char *pin)
> > > >
> > > >         mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLA=
SS_RUNTIME);
> > > >
> > > > -       ret =3D snd_soc_dapm_set_pin(dapm, pin, 1);
> > > > +       ret =3D snd_soc_dapm_enable_pin_unlocked(dapm, pin);
> > > >
> > > >         mutex_unlock(&dapm->card->dapm_mutex);
> > > >
> > > > @@ -4618,7 +4620,9 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_force_enable_p=
in);
> > > >  int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context =
*dapm,
> > > >                                     const char *pin)
> > > >  {
> > > > -       return snd_soc_dapm_set_pin(dapm, pin, 0);
> > > > +       int err =3D snd_soc_dapm_set_pin(dapm, pin, 0);
> > > > +
> > > > +       return err < 0 ? err : 0;
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(snd_soc_dapm_disable_pin_unlocked);
> > > >
> > > > @@ -4639,7 +4643,7 @@ int snd_soc_dapm_disable_pin(struct snd_soc_d=
apm_context *dapm,
> > > >
> > > >         mutex_lock_nested(&dapm->card->dapm_mutex, SND_SOC_DAPM_CLA=
SS_RUNTIME);
> > > >
> > > > -       ret =3D snd_soc_dapm_set_pin(dapm, pin, 0);
> > > > +       ret =3D snd_soc_dapm_disable_pin_unlocked(dapm, pin);
> > > >
> > > >         mutex_unlock(&dapm->card->dapm_mutex);
> > > >
> > >
> > > No, it's not compilable. There is no variable "dapm" in
> > > snd_soc_dapm_put_pin_switch.
> >
> > Doh, I should have at least build-tested before posting :-<
> >
> > > After changing to
> > > &card->dapm.card->dapm_mutex, the issue is fixed. Thanks!
> >
> > OK, good to hear.  I'm going to submit the proper patch soon later.
>
> I found yet one more place that calls snd_soc_dapm_set_pin().
> So it's maybe better to restore the behavior of snd_soc_dapm_set_pin()
> like before.
>
> I'll submit the revised patch.
>
>
> Takashi

The new patch also works on my device. Thanks for the quick fix!
