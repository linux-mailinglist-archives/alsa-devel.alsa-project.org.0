Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB7023DB64
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 17:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A339411C;
	Thu,  6 Aug 2020 17:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A339411C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596728178;
	bh=uFhpen+DoGODX56ztB4+Jn8lka5VGjZSYR3dx/0kEkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dyF78/ISJkw/htGy5UtMBXyvlgjLxQbJl2x5UsqgGxk++GBxrDuDTB/TxzvUGbHis
	 jnCCtFirddj3319STdci28Uy3uH6LBkt9ssQlSKN/sWyJ9oF94UXUxnjxRl3M5THPB
	 S1thlV++BgsTMxFOeeNTn4oYIa1oVNpiaUlDjM4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D60A6F800B7;
	Thu,  6 Aug 2020 17:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DBEFF80159; Thu,  6 Aug 2020 17:34:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODYSUB_1,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A717EF80086;
 Thu,  6 Aug 2020 17:34:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A717EF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CD65HSCa"
Received: by mail-ej1-x644.google.com with SMTP id a26so25002763ejc.2;
 Thu, 06 Aug 2020 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Ty8r9ogXqm1GgGdWdJaOKJg96lA/AABUeA5med2sLMw=;
 b=CD65HSCaRJkNS1gGPRlmsS9hHKzbSca2eyRU2PECPGABWOXIWnNAvVewx2RyLRI5aT
 lr38bTc9xJ3jWIEp1RN8zcPhMiyAv3DnKQ/eU4Ffe4YEN3yKH3EDZbd+FKpvsX5g6yMV
 02wBClIYOmbPSVfOIqF13/w7PZ35w/itThnAY+3TwdT8GD4E5VEF+5E+7GLC6fIVhrbJ
 zCodGMDEFfTUxyePNLGXAOIiaRsg/dHPvpaeujLXhGQwnOlo4JtDf7qG+XE8U0Mrbnqg
 ECVUEBd1R0em+rqn8DI1pgIQeYI6GWxucVyIa1PnWF7ukomMGK/oIvGyfXaA6RZCwAZC
 S6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Ty8r9ogXqm1GgGdWdJaOKJg96lA/AABUeA5med2sLMw=;
 b=ZtwR6JauG3GRA7wgpDhvZJCXhV9FrZ9jc6uA7O+ZegTW9+bqdC55Q8hnnkKv6ncl7g
 U79rFPKhxFqb3yxRTMKzFYpXq+wD8u2F/5bx+yYAnmBW96HXsy2zK7Igdqk69G8xFwMz
 queV0IHMlNLHWjxatqXvfRdFw662sdC7SbqKwU/+XHrrpBgh+9FI4IeqHoOu9KXrNoxA
 VrSqx1P5H4xNW5CZE3oNEuzbpImCbHLIVTCIx51jSATbmn2snw2m8nWlkVwddT301n31
 t7ifcOKURznBU/NhplvLgkv2UQiv1fQS2yQO5e9WUmSmNB6jKkT0Ba/VAPd0QQKyIB6l
 QX/A==
X-Gm-Message-State: AOAM533+j9f1rrvHS1GXhGvrAyGojSx/GaCMkP83wqWTHU/iWpz5/bCS
 63xShPPGWhPoGqXQUV4gnnyyIVG9uV4lG8DrcKY=
X-Google-Smtp-Source: ABdhPJzeBMzY0fWNur7Wa4/eCCZx9OFh4aL9NXUA6Q+pJIb0b7k9QKIliAHrlYDq2heX5dMV+N8WC+7PZfhr5J7xuck=
X-Received: by 2002:a17:906:26c3:: with SMTP id
 u3mr4828226ejc.483.1596728063683; 
 Thu, 06 Aug 2020 08:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
 <20200806020601.GA6286@laptop>
 <CAGnHSEnMhF-1y7rL=JsmcFdTNVaA5ygv5N4TS9dhpORyOm+H_A@mail.gmail.com>
 <20200806091458.GA360003@workstation>
 <CAGnHSEkV9cpWoQKP1mT7RyqyTvGrZu045k=3W45Jm=mBidqDnw@mail.gmail.com>
 <20200806144729.GA381789@workstation>
In-Reply-To: <20200806144729.GA381789@workstation>
From: Tom Yan <tom.ty89@gmail.com>
Date: Thu, 6 Aug 2020 23:34:12 +0800
Message-ID: <CAGnHSEn+hLKCtyhW8i2PBy2Wo-yMfpK6Jc49avrHXY8BA9N1VQ@mail.gmail.com>
Subject: Re: Why doesn't mixer control (values) have some kind of locking
 mechanism? (mutex?)
To: Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org, 
 alsa-user@alsa-project.org, pulseaudio-discuss@lists.freedesktop.org, 
 pierre-louis.bossart@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 6 Aug 2020 at 22:47, Takashi Sakamoto <o-takashi@sakamocchi.jp> wrote:
>
> Hi,
>
> As long as I know, neither tools in alsa-utils/alsa-tools nor pulseaudio
> use the lock mechanism. In short, you are the first person to address
> to the issue. Thanks for your patience since the first post in 2015.
>
> > As for the compare-and-swap part, it's just a plus. Not that
> > "double-looping" for *each* channel doesn't work. It just again seems
> > silly and primitive (and was once confusing to me).
>
> I prepare a rough kernel patch abount the compare-and-swap idea for
> our discussion. The compare-and-swap is done under lock acquisition of
> 'struct snd_card.controls_rwsem', therefore many types of operations
> to control element (e.g. read as well) get affects. This idea works
> well at first when alsa-lib supports corresponding API and userspace
> applications uses it. Therefore we need more work than changing just
> in userspace.
>
> But in my opinion, if things can be solved just in userspace, it should
> be done with no change in kernel space.

I didn't know much about programming or so back then (even by now I
know only a little) when I first noticed the problem, so I just
avoided using amixer / my volume wheel / parts of pulse and resorted
to alsamixer. For some reason the race didn't *appear to* exist with
onboard or USB audio but only my Xonar STX (maybe because volume
adjustments take a bit more time with it), so for a long time I
thought it's some delicate bug in the oxygen/xonar driver that I
failed to identify. Only until very recently it gets back to my head
and becomes clear to me that it's a general design flaw in ALSA.

Just to confirm, does SNDRV_CTL_IOCTL_ELEM_LOCK currently prevent
get()/read? Or is it just a write lock as I thought? If that's the
case, and if the compare-and-swap approach doesn't involve a lot of
changes (in all the kernel drivers, for example), I'd say we better
start moving to something neat than using something which is less so
and wasn't really ever adopted anyway.

>
> ======== 8< --------
>
> From 54832d11b9056da2883d6edfdccaab76d8b08a5c Mon Sep 17 00:00:00 2001
> From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Date: Thu, 6 Aug 2020 19:34:55 +0900
> Subject: [PATCH] ALSA: control: add new ioctl request for compare_and_swap
>  operation to element value
>
> This is a rough implementation as a solution for an issue below. This is
> not tested yet. The aim of this patch is for further discussion.
>
> Typical userspace applications decide write value to control element
> according to value read preliminarily. In the case, if multiple
> applications begin a pair of read and write operations simultaneously,
> the result is not deterministic without any lock mechanism. Although
> ALSA control core has lock/unlock mechanism to a control element for
> the case, the mechanism is not so popular. The mechanism neither not
> used by tools in alsa-utils, alsa-tools, nor PulseAudio, at least.
>
> This commit is an attempt to solve the case by introducing new ioctl
> request. The request is a part of 'compare and swap' mechanism. The
> applications should pass ioctl argument with a pair of old and new value
> of the control element. ALSA control core read current value and compare
> it to the old value under acquisition of lock. If they are the same,
> the new value is going to be written at last.
>
> Reported-by: Tom Yan <tom.ty89@gmail.com>
> Reference: https://lore.kernel.org/alsa-devel/CAGnHSEkV9cpWoQKP1mT7RyqyTvGrZu045k=3W45Jm=mBidqDnw@mail.gmail.com/T/
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  include/uapi/sound/asound.h |  6 ++++
>  sound/core/control.c        | 56 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 62 insertions(+)
>
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index 535a7229e1d9..ff8d5416458d 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -1074,6 +1074,11 @@ struct snd_ctl_tlv {
>         unsigned int tlv[0];    /* first TLV */
>  };
>
> +struct snd_ctl_elem_compare_and_swap {
> +       struct snd_ctl_elem_value old;
> +       struct snd_ctl_elem_value new;
> +};
> +
>  #define SNDRV_CTL_IOCTL_PVERSION       _IOR('U', 0x00, int)
>  #define SNDRV_CTL_IOCTL_CARD_INFO      _IOR('U', 0x01, struct snd_ctl_card_info)
>  #define SNDRV_CTL_IOCTL_ELEM_LIST      _IOWR('U', 0x10, struct snd_ctl_elem_list)
> @@ -1089,6 +1094,7 @@ struct snd_ctl_tlv {
>  #define SNDRV_CTL_IOCTL_TLV_READ       _IOWR('U', 0x1a, struct snd_ctl_tlv)
>  #define SNDRV_CTL_IOCTL_TLV_WRITE      _IOWR('U', 0x1b, struct snd_ctl_tlv)
>  #define SNDRV_CTL_IOCTL_TLV_COMMAND    _IOWR('U', 0x1c, struct snd_ctl_tlv)
> +#define SNDRV_CTL_IOCTL_ELEM_COPARE_AND_SWAP   _IOWR('U', 0x1d, struct snd_ctl_elem_compare_and_swap)
>  #define SNDRV_CTL_IOCTL_HWDEP_NEXT_DEVICE _IOWR('U', 0x20, int)
>  #define SNDRV_CTL_IOCTL_HWDEP_INFO     _IOR('U', 0x21, struct snd_hwdep_info)
>  #define SNDRV_CTL_IOCTL_PCM_NEXT_DEVICE        _IOR('U', 0x30, int)
> diff --git a/sound/core/control.c b/sound/core/control.c
> index aa0c0cf182af..0ac1f7c489be 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -1684,6 +1684,60 @@ static int snd_ctl_tlv_ioctl(struct snd_ctl_file *file,
>         return -ENXIO;
>  }
>
> +static int snd_ctl_elem_compare_and_swap(struct snd_ctl_file *ctl_file,
> +                                        struct snd_ctl_elem_compare_and_swap *cas)
> +{
> +       struct snd_card *card = ctl_file->card;
> +       // TODO: too much use on kernel stack...
> +       struct snd_ctl_elem_value curr;
> +       struct snd_ctl_elem_info info;
> +       unsigned int unit_size;
> +       int err;
> +
> +       info.id = cas->old.id;
> +       err = snd_ctl_elem_info(ctl_file, &info);
> +       if (err < 0)
> +               return err;
> +       if (info.type < SNDRV_CTL_ELEM_TYPE_BOOLEAN || info.type > SNDRV_CTL_ELEM_TYPE_INTEGER64)
> +               return -ENXIO;
> +       unit_size = value_sizes[info.type];
> +
> +       curr.id = cas->old.id;
> +       err = snd_ctl_elem_read(card, &curr);
> +       if (err < 0)
> +               return err;
> +
> +       // Compare.
> +       if (memcmp(&cas->old.value, &curr.value, unit_size * info.count) != 0)
> +               return -EAGAIN;
> +
> +       // Swap.
> +       return snd_ctl_elem_write(card, ctl_file, &cas->new);
> +}
> +
> +static int snd_ctl_elem_compare_and_swap_user(struct snd_ctl_file *ctl_file,
> +                                             struct snd_ctl_elem_compare_and_swap __user *argp)
> +{
> +       struct snd_card *card = ctl_file->card;
> +       struct snd_ctl_elem_compare_and_swap *cas;
> +       int err;
> +
> +       cas = memdup_user(argp, sizeof(*cas));
> +       if (IS_ERR(cas))
> +               return PTR_ERR(cas);
> +
> +       err = snd_power_wait(card, SNDRV_CTL_POWER_D0);
> +       if (err < 0)
> +               goto end;
> +
> +       down_read(&card->controls_rwsem);
> +       err = snd_ctl_elem_compare_and_swap(ctl_file, cas);
> +       up_read(&card->controls_rwsem);
> +end:
> +       kfree(cas);
> +       return err;
> +}
> +
>  static long snd_ctl_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  {
>         struct snd_ctl_file *ctl;
> @@ -1737,6 +1791,8 @@ static long snd_ctl_ioctl(struct file *file, unsigned int cmd, unsigned long arg
>                 err = snd_ctl_tlv_ioctl(ctl, argp, SNDRV_CTL_TLV_OP_CMD);
>                 up_write(&ctl->card->controls_rwsem);
>                 return err;
> +       case SNDRV_CTL_IOCTL_ELEM_COPARE_AND_SWAP:
> +               return snd_ctl_elem_compare_and_swap_user(ctl, argp);
>         case SNDRV_CTL_IOCTL_POWER:
>                 return -ENOPROTOOPT;
>         case SNDRV_CTL_IOCTL_POWER_STATE:
> --
> 2.25.1
>
> ======== 8< --------
>
> Thanks
>
> Takashi Sakamoto
