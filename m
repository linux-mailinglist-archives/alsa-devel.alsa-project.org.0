Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2035C01EC
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 17:43:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A8B1673;
	Wed, 21 Sep 2022 17:43:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A8B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663775036;
	bh=d44X2ywoXsq9lpOp5JBRGMCfdVwwsMQaLllyFceQFjI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UKqpWnM5x/UKZnPBDGd8woEA3hT5kZGBJ40lSPkUs/t6OOtmZwyWolf4kx6W4ZXP+
	 7nWv/31YHBpBRM6EVXCF/uFoOW6Cb0On6OkEaDyzGUHXGveK7B/fnIGHiwA1ULIotb
	 Anyawp7deqNQ9hHOYRQymBx1UY8Ij/oZrebHtt0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D844F80425;
	Wed, 21 Sep 2022 17:42:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 317E7F80256; Wed, 21 Sep 2022 17:42:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FD76F800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 17:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FD76F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j6PEQKDX"
Received: by mail-vk1-xa2d.google.com with SMTP id b81so3409154vkf.1
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 08:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=KFeAEomN6wc2bkWtpf7+3E3G4vNJtHK0TABPjM591K4=;
 b=j6PEQKDXbzUpUGsJj0J+L4yZap4hN7mS78EpJrWYFNixgNWVKNiEtyDcTICM/z3M5n
 +tDBwuVpgHHKDRFmb9RlDE9xeSbsI7mWOO/Sz5aqrtbnhjY6hlM9Y2fXwWwo9voH1TO8
 Xw5zZfYWWY/wbEFAbrOv/3c+hwsND/kX6/yxGbu1aUIkmLoTT6KyS+g9QGRwz7JcKqg5
 rb6TdYJ3+OkZGAyDjq3wPqTfbFCKYJVkM1BjYOn58bhAPG0dXkhCZhm0g96pkBdbOm61
 v7+RDpgU6n9f3+F39IHq/X9vB/tSQTzVAvV4aW6hL8Nvke04kTTqfFHUjvMZvwTNlIjT
 juZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=KFeAEomN6wc2bkWtpf7+3E3G4vNJtHK0TABPjM591K4=;
 b=C8shXNi0/LfdcVMn8qTJQY/ucs9AZITaPR8UdeRCg9A0yjAC2koE1S1yHaGxyYb0FK
 AWjlk/gThCM27PXpaeZb4+DgGHJi6oJ64jZ9t/HUzRZDQg2mFp0WcxT8vsNWJj6phuwZ
 npWUgbNTkkFmMMRaSrBaQgwzFMUZFwuwVtEMR25Y5l59BWu6oZX61sRIxzwM2FrLvJrf
 Riocnh10ebQQYETCCtxrndCxC0+zJcEKVHpVZs2UAFbT87QLWk8/xMJJubcpPOG9+FIo
 Q5YKN0wwyXP6JYh2iprTPPvOAHZ0i2iz0U+rrstZW32J0ZqqRNiLC/MA3Z8aqLb/bX4G
 PHrw==
X-Gm-Message-State: ACrzQf39NHZxHzinvvftAt76zKTDzvBtm/x8Svgc4RML/yavr1fe13os
 qiC4ZrJ+Fsxv7RGt+1phMkGchfwuR6JcIVoGtN8=
X-Google-Smtp-Source: AMsMyM5mjgzhOyC1PfAPpGTaYduU7yMyFn4EYyHHMTNna6jnabAfwzyN0ukBimpQT8PKeQpgILa2hQZG5+l4ShB5bcQ=
X-Received: by 2002:a05:6122:a02:b0:3a3:1672:171f with SMTP id
 2-20020a0561220a0200b003a31672171fmr8723463vkn.17.1663774964578; Wed, 21 Sep
 2022 08:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAB7eexJP7w1B0mVgDF0dQ+gWor7UdkiwPczmL7pn91xx8xpzOA@mail.gmail.com>
 <87y1ufh3u9.wl-tiwai@suse.de> <875yhigtxe.wl-tiwai@suse.de>
In-Reply-To: <875yhigtxe.wl-tiwai@suse.de>
From: Rondreis <linhaoguo86@gmail.com>
Date: Wed, 21 Sep 2022 23:42:33 +0800
Message-ID: <CAB7eexJu+4Nc+YA3Bi+1Y1-zU6rfO5YtC6R7c70Qhoj0J36JoA@mail.gmail.com>
Subject: Re: possible deadlock in snd_rawmidi_free
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

Thank you for your solution! I am sorry that I was not able to extract
the reproducer. But I am improving the solution to reproduce the crash.
If I succeed in reproducing it, I will check it for you as soon as possible!

Best Regards,
Rondreis

On Tue, Sep 20, 2022 at 7:35 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 19 Sep 2022 15:49:02 +0200,
> Takashi Iwai wrote:
> >
> > On Mon, 19 Sep 2022 14:46:13 +0200,
> > Rondreis wrote:
> > >
> > > Hello,
> > >
> > > When fuzzing the Linux kernel driver v6.0-rc4, the following crash was
> > > triggered.
> > >
> > > HEAD commit: 7e18e42e4b280c85b76967a9106a13ca61c16179
> > > git tree: upstream
> > >
> > > kernel config: https://pastebin.com/raw/xtrgsXP3
> > > console output: https://pastebin.com/raw/9tabWDtu
> > >
> > > Sorry for failing to extract the reproducer, and the crash occurred at
> > > the moment of disconnecting the midi device. On other versions of
> > > Linux, I also triggered this crash.
> > >
> > > I would appreciate it if you have any idea how to solve this bug.
> >
> > I think there are two ways to work around it.
> >
> > The first one is to move the unregister_sound*() calls out of the
> > sound_oss_mutex, something like:
> > -- 8< --
> >
> > --- a/sound/core/sound_oss.c
> > +++ b/sound/core/sound_oss.c
> > @@ -162,7 +162,6 @@ int snd_unregister_oss_device(int type, struct snd_card *card, int dev)
> >               mutex_unlock(&sound_oss_mutex);
> >               return -ENOENT;
> >       }
> > -     unregister_sound_special(minor);
> >       switch (SNDRV_MINOR_OSS_DEVICE(minor)) {
> >       case SNDRV_MINOR_OSS_PCM:
> >               track2 = SNDRV_MINOR_OSS(cidx, SNDRV_MINOR_OSS_AUDIO);
> > @@ -174,12 +173,18 @@ int snd_unregister_oss_device(int type, struct snd_card *card, int dev)
> >               track2 = SNDRV_MINOR_OSS(cidx, SNDRV_MINOR_OSS_DMMIDI1);
> >               break;
> >       }
> > -     if (track2 >= 0) {
> > -             unregister_sound_special(track2);
> > +     if (track2 >= 0)
> >               snd_oss_minors[track2] = NULL;
> > -     }
> >       snd_oss_minors[minor] = NULL;
> >       mutex_unlock(&sound_oss_mutex);
> > +
> > +     /* call unregister_sound_special() outside sound_oss_mutex;
> > +      * otherwise may deadlock, as it can trigger the release of a card
> > +      */
> > +     unregister_sound_special(minor);
> > +     if (track2 >= 0)
> > +             unregister_sound_special(track2);
> > +
> >       kfree(mptr);
> >       return 0;
> >  }
> > -- 8< --
> >
> > This should be OK, as the unregister_sound_*() itself can be called
> > concurrently.
> >
> > Another workaround would be just to remove the register_mutex call at
> > snd_rawmidi_free(), e.g. something like:
> >
> > -- 8< --
> > --- a/sound/core/rawmidi.c
> > +++ b/sound/core/rawmidi.c
> > @@ -1899,10 +1899,8 @@ static int snd_rawmidi_free(struct snd_rawmidi *rmidi)
> >
> >       snd_info_free_entry(rmidi->proc_entry);
> >       rmidi->proc_entry = NULL;
> > -     mutex_lock(&register_mutex);
> >       if (rmidi->ops && rmidi->ops->dev_unregister)
> >               rmidi->ops->dev_unregister(rmidi);
> > -     mutex_unlock(&register_mutex);
> >
> >       snd_rawmidi_free_substreams(&rmidi->streams[SNDRV_RAWMIDI_STREAM_INPUT]);
> >       snd_rawmidi_free_substreams(&rmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT]);
> > -- 8< --
> >
> > This register_mutex there should be superfluous since the device has
> > been already processed and detached by snd_rawmidi_dev_disconnect()
> > beforehand.  But if the first one is confirmed to work, the second one
> > can be left untouched.
>
> Could you check whether one of two changes above fixes the bug?
> Once after confirmed, I'll cook a proper patch for the submission.
>
>
> thanks,
>
> Takashi
