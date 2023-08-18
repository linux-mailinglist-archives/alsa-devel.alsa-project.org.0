Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881887802C8
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 02:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F18BA845;
	Fri, 18 Aug 2023 02:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F18BA845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692319357;
	bh=AeclgHEWOLmaOoOcgoNIoHPuNoHnAloXUb4MnEcMXZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uQjxpOl9/NEzX1L/y/Fojj1Eexb2rSe0/gJGKleNX0UWek2l2r6CvdlO8G/XKckg0
	 Zj7qB1ol1Fk+jnjnK4Y8Itexmkujk85SiYXBYwaG7IM99VT2ZbpcZpK1Hq27n7tP8I
	 pe4D8e2COZ3Ae+/t3NAWpeXKHOlvFcMsw5RoyB+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29B80F80508; Fri, 18 Aug 2023 02:41:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D50CCF8016D;
	Fri, 18 Aug 2023 02:41:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1ADDF801EB; Fri, 18 Aug 2023 02:41:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DC92F800EE
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 02:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DC92F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=ApGj7Qs4
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-6889078ee66so339516b3a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 17:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692319282; x=1692924082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2O38AUzV5JV5q2bHO3TBvc1Dzm/Oifv6oD5E6Akbnb4=;
        b=ApGj7Qs4h7PHUDMLkBdXc8BLWZc5bYFCgJdohcHLbqUWH25DSUEUyKxPFmXNIJZKFA
         gWpIw+L/LP2xRcQADNVKoxXNpT6UBNb1jrPvpXrmAriKmFiYFi87vmaHReap2KwSw8Mg
         w/9CZJy91bdN7GH28wAJLP+DXSmhIJsV3g+Zis2agKWENokJaTq/w16x7Q1qPcaSe1AF
         I2WxVY1cz9uu29dbZhKJ2GB+YyvN3uerZYoF8vlq1axvWRWd6qbLKwQDPpsx1DI74SP2
         khWl0+V+wOzXwytDO+6VlAvb+8MOvu0EyCMEbHmHzgN6kApcdMqdOKklQbHYRM6d0wIO
         FzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692319282; x=1692924082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2O38AUzV5JV5q2bHO3TBvc1Dzm/Oifv6oD5E6Akbnb4=;
        b=P77abpUvpgObJTu8fM6LARjqzeoEcdYBJXQKHf9dyrQTfwTFo4D7WKiq6fLNbtvrqh
         U/She4cer4hvRoIHpz928YTb049ZCqItzEy0iyx91TFRJk0I6h6JOH1UjZbajKI6rypA
         jw1S7VWfDFA3CGSwSOjCSpc5MGVfG8JYhKYA63yNtMnnmaf0GDaZyJuTPoa4IvJ2J9C2
         e00ke+qDKwnPY2qSdTun+XZAydXWc1iO5U0QDPdGmPWFWRXhvTkALb7LSbDE9QZPqMQP
         0xSUxlEiO1UPVVsbfRf1adm+RZNXGS+d+ORmp8toCZ/k/X+SmDBiS6TlYT2c/GCiLIRO
         shBQ==
X-Gm-Message-State: AOJu0YwPe1Zq64QeSdXybpGfej+z0GFgV/xhbWK/BTFBwCrz7uLir7vK
	f8+6RHwRRIJJQ0J1pGTk36JRCvFSHRW5J7QKzNgA3w==
X-Google-Smtp-Source: 
 AGHT+IGN1cWgkvxURtXTxpB29Ka7b1lS8yEzXyUtUkS15GTlMTffJeiJMKd62xVGG4u1hCRGgylZFKoaOvsiMjgJQN0=
X-Received: by 2002:a05:6a21:338a:b0:137:2281:944f with SMTP id
 yy10-20020a056a21338a00b001372281944fmr1659575pzb.40.1692319281857; Thu, 17
 Aug 2023 17:41:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230807135207.17708-1-tiwai@suse.de>
 <CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
 <CAOReqxgCDdXAEyF8pt4dePQ2H_ub=hYczvO1xGpKWAt35z5B2Q@mail.gmail.com>
 <87o7jgfxgj.wl-tiwai@suse.de> <87sf8se471.wl-tiwai@suse.de>
 <CAOReqxjnWruX20YyUcAjwv8zLourFv4hUKGq9_1FBsXA6Fra9Q@mail.gmail.com>
 <87ttt3pdp5.wl-tiwai@suse.de>
 <CAOReqxhtcyePP+B6egNufuzM_ML3W7PVPNEENqxDfa605DoP9w@mail.gmail.com>
 <87msysxp9z.wl-tiwai@suse.de>
 <CAOReqxiq86kxj1HEmjYPUZ5gW49y2x9ZFYa8mAH1VWFAF7dEuw@mail.gmail.com>
 <878raby2fb.wl-tiwai@suse.de>
 <CAOReqxgi4Fr5QtAEDwQXhoPQ1S0h8d27mwLpeJe9Q4O6=GvPPQ@mail.gmail.com>
 <87fs4iw5nu.wl-tiwai@suse.de>
 <CAOReqxjJOGQcdWqz919Z2gZRXhQ=wYm3wtcV1rxzuEd6eeAAHA@mail.gmail.com>
In-Reply-To: 
 <CAOReqxjJOGQcdWqz919Z2gZRXhQ=wYm3wtcV1rxzuEd6eeAAHA@mail.gmail.com>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 17 Aug 2023 17:41:10 -0700
Message-ID: 
 <CAOReqxhACxJL75B00a5sZt1JSnv8ZOgHYt4DWCNu4j=dw2ccqw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@chromium.org>,
	Stephen Boyd <swboyd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: CEBRSNTJ6DYTFGJTU3YW2GXLUOF4FZFG
X-Message-ID-Hash: CEBRSNTJ6DYTFGJTU3YW2GXLUOF4FZFG
X-MailFrom: cujomalainey@google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CEBRSNTJ6DYTFGJTU3YW2GXLUOF4FZFG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 17, 2023 at 10:25=E2=80=AFAM Curtis Malainey
<cujomalainey@google.com> wrote:
>
> On Wed, Aug 16, 2023 at 11:21=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wro=
te:
> >
> > On Wed, 16 Aug 2023 23:46:06 +0200,
> > Curtis Malainey wrote:
> > >
> > > On Tue, Aug 15, 2023 at 10:35=E2=80=AFPM Takashi Iwai <tiwai@suse.de>=
 wrote:
> > > >
> > > > On Tue, 15 Aug 2023 23:32:31 +0200,
> > > > Curtis Malainey wrote:
> > > > >
> > > > > On Tue, Aug 15, 2023 at 9:07=E2=80=AFAM Takashi Iwai <tiwai@suse.=
de> wrote:
> > > > > >
> > > > > > On Mon, 14 Aug 2023 22:20:29 +0200,
> > > > > > Curtis Malainey wrote:
> > > > > > >
> > > > > > > On Sun, Aug 13, 2023 at 1:08=E2=80=AFAM Takashi Iwai <tiwai@s=
use.de> wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > So, if we tie the object resource with each struct device r=
elease, we
> > > > > > > > have a lot of works:
> > > > > > > > 1. Add extra dependencies among device hierarchy
> > > > > > > > 2. Don't use card_dev refcount for managing the sync to dev=
ice closes,
> > > > > > > >    introduce another kref instead; otherwise card_dev refco=
unt would
> > > > > > > >    never reach to zero
> > > > > > > > 3. Fix race of devres vs card_dev release
> > > > > > > > 4. Move the second half part of snd_card_do_free() to the r=
elease
> > > > > > > >    callback of card_dev itself to sync with the top-level r=
elease
> > > > > > > > 5. Rewrite all SNDRV_DEV_LOWLEVEL usages to be called via
> > > > > > > >    card->private_free or such;
> > > > > > > >    maybe the only problem is hda_intel.c and hda_tegra.c th=
at need
> > > > > > > >    some work at the disconnection time, and we may introduc=
e another
> > > > > > > >    hook in the card object to replace that
> > > > > > > >
> > > > > > > > And, at this moment, I feel that it'd be easier to go back =
to the
> > > > > > > > early way of device management, i.e. it'll be just like you=
r patch,
> > > > > > > > managing the device object independently from the rest reso=
urces.
> > > > > > > > (This means also that the way freeing the resource for hwde=
p and
> > > > > > > >  rawmidi will go back again without the embedded device, to=
o; they
> > > > > > > >  also suffer from the same problem of .)
> > > > > > >
> > > > > > > I agree, I think as a simple stopgap, my earlier patch would =
at least
> > > > > > > appease the test until we can figure out the best way to do s=
ome
> > > > > > > heavier work on the kobj. I think the proxy pointer for devre=
s would
> > > > > > > also be the best short term for 3.
> > > > > > >
> > > > > > > >
> > > > > > > > The change 2 and 3 above can be still applied with your cha=
nge, which
> > > > > > > > will fix the remaining devres-vs-card_dev problem.
> > > > > > >
> > > > > > > I am not sure I follow the need for 2. If we broke ctl_dev ou=
t into
> > > > > > > its own memory region and structured everything as a proper t=
ree we
> > > > > > > would have a proper cleanup and be able to use the refcountin=
g
> > > > > > > properly.
> > > > > >
> > > > > > My thought was about the devres release that does kfree() of th=
e card
> > > > > > while the card's card_dev release itself is still delayed.
> > > > > > This might be a needless fear, though, as snd_card_free() shoul=
d sync
> > > > > > with the actual card_dev release.
> > > > > >
> > > > > > But, splitting the release-trigger and the actual memory releas=
e could
> > > > > > be still worth.
> > > > > >
> > > > > > > > Once after fixing the current problem, we may work further =
on other
> > > > > > > > stuff (e.g. item 5), so that we can switch again to the dev=
ice-release
> > > > > > > > model eventually later, too.
> > > > > > >
> > > > > > > Agreed, I don't have any experience with SNDRV_DEV_LOWLEVEL b=
ut I am
> > > > > > > happy to help out here where I can.
> > > > > > >
> > > > > > > I am going to see if I can split the release card as mentione=
d but
> > > > > > > also have refcount work as expected and have the release call=
s roll up
> > > > > > > the tree.
> > > > > >
> > > > > > I quickly worked on and made a patch series.
> > > > > > It's put in topic/dev-split branch of sound git tree
> > > > > >   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.g=
it/log/?h=3Dtopic/dev-split
> > > > > >
> > > > > > It'd be appreciated if you can review / test it.
> > > > >
> > > > > Took a look and ran it through the tests
> > > > >
> > > > > You need to apply this diff
> > > >
> > > > Thanks, I'll fix it up.
> > > >
> > > > >
> > > > > diff --git a/sound/usb/media.c b/sound/usb/media.c
> > > > > index 6d11fedb46326..d48db6f3ae659 100644
> > > > > --- a/sound/usb/media.c
> > > > > +++ b/sound/usb/media.c
> > > > > @@ -35,7 +35,7 @@ int snd_media_stream_init(struct snd_usb_substr=
eam
> > > > > *subs, struct snd_pcm *pcm,
> > > > >  {
> > > > >         struct media_device *mdev;
> > > > >         struct media_ctl *mctl;
> > > > > -       struct device *pcm_dev =3D &pcm->streams[stream].dev;
> > > > > +       struct device *pcm_dev =3D pcm->streams[stream].dev;
> > > > >         u32 intf_type;
> > > > >         int ret =3D 0;
> > > > >         u16 mixer_pad;
> > > > >
> > > > > Hammering probe and remove appears to be fine. Went 45min without=
 issue.
> > > > >
> > > > > Userspace holding references past hw removal appears to still be
> > > > > broken as sound is released while the app is still running.
> > > > >
> > > > > -- remove usb device --
> > > > > [ 4819.827476] kobject: 'controlC1' (00000000255a51c8):
> > > > > fill_kobj_path: path =3D
> > > > > '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/co=
ntrolC1'
> > > > > [ 4819.828114] kobject: 'pcmC1D0p' (00000000f0627532): kobject_ue=
vent_env
> > > > > [ 4819.828145] kobject: 'pcmC1D0p' (00000000f0627532): fill_kobj_=
path:
> > > > > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound=
/card1/pcmC1D0p'
> > > > > [ 4819.828822] kobject: 'pcmC1D0c' (000000001b707a15): kobject_ue=
vent_env
> > > > > [ 4819.828850] kobject: 'pcmC1D0c' (000000001b707a15): fill_kobj_=
path:
> > > > > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound=
/card1/pcmC1D0c'
> > > > > [ 4819.829405] kobject: 'card1' (000000005bce975e): kobject_ueven=
t_env
> > > > > [ 4819.829428] kobject: 'card1' (000000005bce975e): fill_kobj_pat=
h:
> > > > > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound=
/card1'
> > > > > [ 4819.829516] kobject: 'sound' (000000000bb52434): kobject_relea=
se,
> > > > > parent 0000000000000000 (delayed 4000)
> > > > > [ 4823.873625] kobject: 'sound' (000000000bb52434): kobject_clean=
up,
> > > > > parent 0000000000000000
> > > > > [ 4823.873645] kobject: 'sound' (000000000bb52434): calling ktype=
 release
> > > > > [ 4823.873654] kobject: 'sound': free name
> > > > >
> > > > > -- end app --
> > > > > [ 4849.581815] kobject: 'pcmC1D0p' (00000000f0627532):
> > > > > kobject_release, parent 0000000000000000 (delayed 2000)
> > > > > [ 4849.581960] kobject: 'pcmC1D0c' (000000001b707a15):
> > > > > kobject_release, parent 0000000000000000 (delayed 2000)
> > > > > [ 4849.582626] kobject: 'card1' (000000005bce975e): kobject_relea=
se,
> > > > > parent 0000000000000000 (delayed 1000)
> > > > > [ 4850.625615] kobject: 'card1' (000000005bce975e): kobject_clean=
up,
> > > > > parent 0000000000000000
> > > > > [ 4850.625638] kobject: 'card1' (000000005bce975e): calling ktype=
 release
> > > > > [ 4850.625663] kobject: 'card1': free name
> > > > > [ 4851.585647] kobject: 'pcmC1D0c' (000000001b707a15):
> > > > > kobject_cleanup, parent 0000000000000000
> > > > > [ 4851.585672] kobject: 'pcmC1D0c' (000000001b707a15): calling kt=
ype release
> > > > > [ 4851.585708] kobject: 'pcmC1D0c': free name
> > > > > [ 4851.585727] kobject: 'pcmC1D0p' (00000000f0627532):
> > > > > kobject_cleanup, parent 0000000000000000
> > > > > [ 4851.585737] kobject: 'pcmC1D0p' (00000000f0627532): calling kt=
ype release
> > > > > [ 4851.585752] kobject: 'pcmC1D0p': free name
> > > >
> > > > It's the designed behavior.  Those are device *files* that are dele=
ted
> > > > immediately at the disconnection while the application is still
> > > > running.  It's for avoiding a new application to be started after t=
he
> > > > disconnect.  That is, only the device files in /dev/snd/* become
> > > > invisible.  Meanwhile, the already opened objects are still handled
> > > > internally.
> > >
> > > It seems incorrect from a refcounting perspective though. The device
> > > still has active children so we need to remove the entry but should
> > > not be triggering the release yet.
> >
> > Do you mean the release of 'sound'?  It's a sound class, and by
> > calling device_del(), all children are gone at the disconnection, so
> > it must be fine.  All other calls are only about device file deletion,
> > hence no release happened until the end of app.
>
> Thanks for the clarification. Having a parent disappear is very
> strange compared to how I would expect the system to clean up. Removal
> makes sense but I was not expecting the release on the parent.
>
> >
> > > Based on the docs for kobject this is exactly how kobject_del behaves
> > > (remove from sysfs without dropping refcount) so it looks like we jus=
t
> > > need to fix the refcounting part.
> >
> > device_del() decreases the refcount of the *parent*, although it
> > doesn't touch the refcount of the device it self.  So, after
> > device_del(), the tree hierarchy is gone, and that's one of the
> > problems that makes things difficult.
>
> Ah and that is what I missed in the call. Thanks for the pointer.
> Although that seems bizarre, because won't we double put our parent on
> release as well as part of device_put->kobject_cleanup once we are
> actually released?

I think I must be missing a cleanup of the reference to the parent
here, which would explain my logic error.

>
> >
> > > > > I still don't understand why you need the kref. The devices are
> > > > > already reference counting, why not use them? If we split them up=
 into
> > > > > their own structs we could then just device_put everything on rem=
oval
> > > > > and let it roll up the tree with releases automatically, blocking
> > > > > where userspace is still holding references. I will share a patch=
es
> > > > > sometime this week of what I mean. They will probably be a bit bi=
gger
> > > > > blast radius but I think its what is needed here.
> > > >
> > > > We want to trigger the top-level release free procedure once when a=
ll
> > > > files are closed.  This top-level release does put_device() of all
> > > > belonging devices.
> > >
> > > Is there a need for this synchronization?
> >
> > Sort of, yes.
> >
> > > > The card_dev device refcount was used for this purpose.  OTOH, if w=
e
> > > > want to construct the topology of the devices until the actual
> > > > deletion (i.e. keep card_dev until pcm and others are really
> > > > released/deleted), the card_dev refcount will be used for managing
> > > > the topology, too.  So, it'll get a side-effect side-effect that th=
e
> > > > card_dev refcount won't be zero even after all files are closed (it=
's
> > > > referred from the children).
> > >
> > > I think this is the intended use case for this system and would make
> > > it much easier to free the code. This will even allow early partial
> > > removal of the card until user space lets go of whatever parts it's
> > > holding onto (e.g. PCM is still open but controls have cleaned up if
> > > there is no dependency on controls).
> >
> > And, that's the problem.  If the control is cleared before PCM, PCM
> > release may hit another UAF, as it tries to the associated channel map
> > and other controls.  And, for deleting a PCM or a control, it'll touch
> > the card's lock or linked list, so it still relies on the parent.
> > The release of each component can't be done alone, as there are some
> > dependencies.
>
> Makes sense. I guess that raises the question, are there any cyclic
> dependencies in the graph? If yes then this indeed would be a lot
> tougher compared to just letting leaves release in order.
>
> >
> > > It would allow for a lot of
> > > synchronization code to be removed and just let the card handle
> > > itself.
> >
> > I guess it's doable to rewrite many things, but the handling will be
> > still complex.  Imagine you'd need to deal with a dynamic removal of
> > a PCM device while the system is in use (e.g. when a codec is
> > disconnected).  This deletion procedure must access the top-level card
> > stuff for locking or such, so the dependency is still present
> > depending on the situation.
>
> Makes sense. Yea the parent model doesn't work amazingly here does it
> for synchronized release. Makes me think maybe we could just put a
> barrier in the release functions so we know they have all been put to
> 0.

Scratch the barrier idea, the more I think about it, this would vastly
overcomplicate things.

I think your proposal is best that we just split out the devices as
they are intended. Then just unbind and disconnect from userpace, then
once everything is free call put on everything and let release clean
it up in reverse.

>
> >
> >
> > Takashi
