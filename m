Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3977FCFC
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 19:27:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53E5827;
	Thu, 17 Aug 2023 19:26:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53E5827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692293224;
	bh=cSpTTHEbXbZS4uP9p38mcV+r/Ym86YkqNNTVWWibtXM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IIBxJcW4wgs9iNElIjjlpRo+QXw+xuCW7yacV2p2xjmoB0BcCVRjqSo86I4uaxokm
	 Ic2Cal1baXKwWP8itWqnILLiNamA/TOC8Zv7J84qmY3fDmwrgq40Apy95mbLk7K9Pg
	 1tx2fQDhG8XmC4M+0IqDrATB59XO4a9usyYy01Ns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFE5FF8025F; Thu, 17 Aug 2023 19:26:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E0BDF8016A;
	Thu, 17 Aug 2023 19:26:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C69E0F8016D; Thu, 17 Aug 2023 19:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14951F800D1
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 19:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14951F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=75oOliO3
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-26948743648so36530a91.0
        for <alsa-devel@alsa-project.org>;
 Thu, 17 Aug 2023 10:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692293156; x=1692897956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+55ygHw5bg7v2J6ioMfsKB6tEun51DaTpOvIHrbfsOI=;
        b=75oOliO3euuIDei5qCF2PZtWQ3qGtqcTJ2xW3r85tYGKxdEx63YPcewTgfjXUg4nmb
         ChDfbLfZRjDTOf4ajeYMi+FRES/SpbqJF/82qX2xbB8i00XHSqIhaqDaBjNz8CQajQQt
         Bc2EOMuFoCeaXbMhmyQ6NPSvTfop7uR+/IrVrvUM+lwfqsXzkLTF5ox0ivKqmeTlgROO
         Mx/unflmqDXQl8IXWvRynxGv7cT7IknbX3yxzRHrMDjwY1QZZGYXO6uxbRTazcn2U7ru
         WCZQnkEVNEgqDCCBAbdKr3KK60k97cO497RewPwQa5WDFQk8CWCLHir+gfwIpuo37Qbl
         JV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692293156; x=1692897956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+55ygHw5bg7v2J6ioMfsKB6tEun51DaTpOvIHrbfsOI=;
        b=hQDPsiilg47+ZzHlP89koLdKkyLv9sEML0qh7p/wmSHR4pZPyQCpih/D6ArNGCQXoT
         4J30ai9GUeaJTIB8dkVrLq7ir9OvIokLn6rVte+B3kfTeYnzDKbd/wS/r3bU1VD2cxGp
         E7dXEQyHzWB6gWCRzDh3rGtvRhEV84tXwSQRe4MOP92DP+n6e2SdQ87zlcI5+K9+JB8b
         dtF/xTjg8LkVF2vdVuT0n16/3aI4QHDnfmRwurDyqH1V+7YgVuFqiigbIsxwWVT2jxS+
         89spTYuarBnQBxmP0j4LhntN4O64ZVQBrRjlHIuuvtmvjar5RI4WZfMN49Fm7emI4Och
         96+Q==
X-Gm-Message-State: AOJu0Yyy5nDJ8KSVt8FmJPnZXtr+dHlOZ1yO+hWt4vAHZT5JwoRC8HxG
	1FibuejX2cZaUcMMVk6Rwq0soP0RzBdIG5mLbjQj2ltJi4w7j3u1A+g=
X-Google-Smtp-Source: 
 AGHT+IHAYdiSx1p61s3DWw1v1jr1wlbgxpna1pxdUfvJEJVBz3Mscp3TkqRSbo1h/23P/Jdsy2D2eUY0Cwlm7lEirnE=
X-Received: by 2002:a17:90a:e7d2:b0:268:29cf:3231 with SMTP id
 kb18-20020a17090ae7d200b0026829cf3231mr84802pjb.3.1692293155802; Thu, 17 Aug
 2023 10:25:55 -0700 (PDT)
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
In-Reply-To: <87fs4iw5nu.wl-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Thu, 17 Aug 2023 10:25:43 -0700
Message-ID: 
 <CAOReqxjJOGQcdWqz919Z2gZRXhQ=wYm3wtcV1rxzuEd6eeAAHA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@chromium.org>,
	Stephen Boyd <swboyd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TYG66IZIVUVBZ2DEXPZXIP6RSSH37PGI
X-Message-ID-Hash: TYG66IZIVUVBZ2DEXPZXIP6RSSH37PGI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYG66IZIVUVBZ2DEXPZXIP6RSSH37PGI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 16, 2023 at 11:21=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote=
:
>
> On Wed, 16 Aug 2023 23:46:06 +0200,
> Curtis Malainey wrote:
> >
> > On Tue, Aug 15, 2023 at 10:35=E2=80=AFPM Takashi Iwai <tiwai@suse.de> w=
rote:
> > >
> > > On Tue, 15 Aug 2023 23:32:31 +0200,
> > > Curtis Malainey wrote:
> > > >
> > > > On Tue, Aug 15, 2023 at 9:07=E2=80=AFAM Takashi Iwai <tiwai@suse.de=
> wrote:
> > > > >
> > > > > On Mon, 14 Aug 2023 22:20:29 +0200,
> > > > > Curtis Malainey wrote:
> > > > > >
> > > > > > On Sun, Aug 13, 2023 at 1:08=E2=80=AFAM Takashi Iwai <tiwai@sus=
e.de> wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > So, if we tie the object resource with each struct device rel=
ease, we
> > > > > > > have a lot of works:
> > > > > > > 1. Add extra dependencies among device hierarchy
> > > > > > > 2. Don't use card_dev refcount for managing the sync to devic=
e closes,
> > > > > > >    introduce another kref instead; otherwise card_dev refcoun=
t would
> > > > > > >    never reach to zero
> > > > > > > 3. Fix race of devres vs card_dev release
> > > > > > > 4. Move the second half part of snd_card_do_free() to the rel=
ease
> > > > > > >    callback of card_dev itself to sync with the top-level rel=
ease
> > > > > > > 5. Rewrite all SNDRV_DEV_LOWLEVEL usages to be called via
> > > > > > >    card->private_free or such;
> > > > > > >    maybe the only problem is hda_intel.c and hda_tegra.c that=
 need
> > > > > > >    some work at the disconnection time, and we may introduce =
another
> > > > > > >    hook in the card object to replace that
> > > > > > >
> > > > > > > And, at this moment, I feel that it'd be easier to go back to=
 the
> > > > > > > early way of device management, i.e. it'll be just like your =
patch,
> > > > > > > managing the device object independently from the rest resour=
ces.
> > > > > > > (This means also that the way freeing the resource for hwdep =
and
> > > > > > >  rawmidi will go back again without the embedded device, too;=
 they
> > > > > > >  also suffer from the same problem of .)
> > > > > >
> > > > > > I agree, I think as a simple stopgap, my earlier patch would at=
 least
> > > > > > appease the test until we can figure out the best way to do som=
e
> > > > > > heavier work on the kobj. I think the proxy pointer for devres =
would
> > > > > > also be the best short term for 3.
> > > > > >
> > > > > > >
> > > > > > > The change 2 and 3 above can be still applied with your chang=
e, which
> > > > > > > will fix the remaining devres-vs-card_dev problem.
> > > > > >
> > > > > > I am not sure I follow the need for 2. If we broke ctl_dev out =
into
> > > > > > its own memory region and structured everything as a proper tre=
e we
> > > > > > would have a proper cleanup and be able to use the refcounting
> > > > > > properly.
> > > > >
> > > > > My thought was about the devres release that does kfree() of the =
card
> > > > > while the card's card_dev release itself is still delayed.
> > > > > This might be a needless fear, though, as snd_card_free() should =
sync
> > > > > with the actual card_dev release.
> > > > >
> > > > > But, splitting the release-trigger and the actual memory release =
could
> > > > > be still worth.
> > > > >
> > > > > > > Once after fixing the current problem, we may work further on=
 other
> > > > > > > stuff (e.g. item 5), so that we can switch again to the devic=
e-release
> > > > > > > model eventually later, too.
> > > > > >
> > > > > > Agreed, I don't have any experience with SNDRV_DEV_LOWLEVEL but=
 I am
> > > > > > happy to help out here where I can.
> > > > > >
> > > > > > I am going to see if I can split the release card as mentioned =
but
> > > > > > also have refcount work as expected and have the release calls =
roll up
> > > > > > the tree.
> > > > >
> > > > > I quickly worked on and made a patch series.
> > > > > It's put in topic/dev-split branch of sound git tree
> > > > >   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git=
/log/?h=3Dtopic/dev-split
> > > > >
> > > > > It'd be appreciated if you can review / test it.
> > > >
> > > > Took a look and ran it through the tests
> > > >
> > > > You need to apply this diff
> > >
> > > Thanks, I'll fix it up.
> > >
> > > >
> > > > diff --git a/sound/usb/media.c b/sound/usb/media.c
> > > > index 6d11fedb46326..d48db6f3ae659 100644
> > > > --- a/sound/usb/media.c
> > > > +++ b/sound/usb/media.c
> > > > @@ -35,7 +35,7 @@ int snd_media_stream_init(struct snd_usb_substrea=
m
> > > > *subs, struct snd_pcm *pcm,
> > > >  {
> > > >         struct media_device *mdev;
> > > >         struct media_ctl *mctl;
> > > > -       struct device *pcm_dev =3D &pcm->streams[stream].dev;
> > > > +       struct device *pcm_dev =3D pcm->streams[stream].dev;
> > > >         u32 intf_type;
> > > >         int ret =3D 0;
> > > >         u16 mixer_pad;
> > > >
> > > > Hammering probe and remove appears to be fine. Went 45min without i=
ssue.
> > > >
> > > > Userspace holding references past hw removal appears to still be
> > > > broken as sound is released while the app is still running.
> > > >
> > > > -- remove usb device --
> > > > [ 4819.827476] kobject: 'controlC1' (00000000255a51c8):
> > > > fill_kobj_path: path =3D
> > > > '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/cont=
rolC1'
> > > > [ 4819.828114] kobject: 'pcmC1D0p' (00000000f0627532): kobject_ueve=
nt_env
> > > > [ 4819.828145] kobject: 'pcmC1D0p' (00000000f0627532): fill_kobj_pa=
th:
> > > > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/c=
ard1/pcmC1D0p'
> > > > [ 4819.828822] kobject: 'pcmC1D0c' (000000001b707a15): kobject_ueve=
nt_env
> > > > [ 4819.828850] kobject: 'pcmC1D0c' (000000001b707a15): fill_kobj_pa=
th:
> > > > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/c=
ard1/pcmC1D0c'
> > > > [ 4819.829405] kobject: 'card1' (000000005bce975e): kobject_uevent_=
env
> > > > [ 4819.829428] kobject: 'card1' (000000005bce975e): fill_kobj_path:
> > > > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/c=
ard1'
> > > > [ 4819.829516] kobject: 'sound' (000000000bb52434): kobject_release=
,
> > > > parent 0000000000000000 (delayed 4000)
> > > > [ 4823.873625] kobject: 'sound' (000000000bb52434): kobject_cleanup=
,
> > > > parent 0000000000000000
> > > > [ 4823.873645] kobject: 'sound' (000000000bb52434): calling ktype r=
elease
> > > > [ 4823.873654] kobject: 'sound': free name
> > > >
> > > > -- end app --
> > > > [ 4849.581815] kobject: 'pcmC1D0p' (00000000f0627532):
> > > > kobject_release, parent 0000000000000000 (delayed 2000)
> > > > [ 4849.581960] kobject: 'pcmC1D0c' (000000001b707a15):
> > > > kobject_release, parent 0000000000000000 (delayed 2000)
> > > > [ 4849.582626] kobject: 'card1' (000000005bce975e): kobject_release=
,
> > > > parent 0000000000000000 (delayed 1000)
> > > > [ 4850.625615] kobject: 'card1' (000000005bce975e): kobject_cleanup=
,
> > > > parent 0000000000000000
> > > > [ 4850.625638] kobject: 'card1' (000000005bce975e): calling ktype r=
elease
> > > > [ 4850.625663] kobject: 'card1': free name
> > > > [ 4851.585647] kobject: 'pcmC1D0c' (000000001b707a15):
> > > > kobject_cleanup, parent 0000000000000000
> > > > [ 4851.585672] kobject: 'pcmC1D0c' (000000001b707a15): calling ktyp=
e release
> > > > [ 4851.585708] kobject: 'pcmC1D0c': free name
> > > > [ 4851.585727] kobject: 'pcmC1D0p' (00000000f0627532):
> > > > kobject_cleanup, parent 0000000000000000
> > > > [ 4851.585737] kobject: 'pcmC1D0p' (00000000f0627532): calling ktyp=
e release
> > > > [ 4851.585752] kobject: 'pcmC1D0p': free name
> > >
> > > It's the designed behavior.  Those are device *files* that are delete=
d
> > > immediately at the disconnection while the application is still
> > > running.  It's for avoiding a new application to be started after the
> > > disconnect.  That is, only the device files in /dev/snd/* become
> > > invisible.  Meanwhile, the already opened objects are still handled
> > > internally.
> >
> > It seems incorrect from a refcounting perspective though. The device
> > still has active children so we need to remove the entry but should
> > not be triggering the release yet.
>
> Do you mean the release of 'sound'?  It's a sound class, and by
> calling device_del(), all children are gone at the disconnection, so
> it must be fine.  All other calls are only about device file deletion,
> hence no release happened until the end of app.

Thanks for the clarification. Having a parent disappear is very
strange compared to how I would expect the system to clean up. Removal
makes sense but I was not expecting the release on the parent.

>
> > Based on the docs for kobject this is exactly how kobject_del behaves
> > (remove from sysfs without dropping refcount) so it looks like we just
> > need to fix the refcounting part.
>
> device_del() decreases the refcount of the *parent*, although it
> doesn't touch the refcount of the device it self.  So, after
> device_del(), the tree hierarchy is gone, and that's one of the
> problems that makes things difficult.

Ah and that is what I missed in the call. Thanks for the pointer.
Although that seems bizarre, because won't we double put our parent on
release as well as part of device_put->kobject_cleanup once we are
actually released?

>
> > > > I still don't understand why you need the kref. The devices are
> > > > already reference counting, why not use them? If we split them up i=
nto
> > > > their own structs we could then just device_put everything on remov=
al
> > > > and let it roll up the tree with releases automatically, blocking
> > > > where userspace is still holding references. I will share a patches
> > > > sometime this week of what I mean. They will probably be a bit bigg=
er
> > > > blast radius but I think its what is needed here.
> > >
> > > We want to trigger the top-level release free procedure once when all
> > > files are closed.  This top-level release does put_device() of all
> > > belonging devices.
> >
> > Is there a need for this synchronization?
>
> Sort of, yes.
>
> > > The card_dev device refcount was used for this purpose.  OTOH, if we
> > > want to construct the topology of the devices until the actual
> > > deletion (i.e. keep card_dev until pcm and others are really
> > > released/deleted), the card_dev refcount will be used for managing
> > > the topology, too.  So, it'll get a side-effect side-effect that the
> > > card_dev refcount won't be zero even after all files are closed (it's
> > > referred from the children).
> >
> > I think this is the intended use case for this system and would make
> > it much easier to free the code. This will even allow early partial
> > removal of the card until user space lets go of whatever parts it's
> > holding onto (e.g. PCM is still open but controls have cleaned up if
> > there is no dependency on controls).
>
> And, that's the problem.  If the control is cleared before PCM, PCM
> release may hit another UAF, as it tries to the associated channel map
> and other controls.  And, for deleting a PCM or a control, it'll touch
> the card's lock or linked list, so it still relies on the parent.
> The release of each component can't be done alone, as there are some
> dependencies.

Makes sense. I guess that raises the question, are there any cyclic
dependencies in the graph? If yes then this indeed would be a lot
tougher compared to just letting leaves release in order.

>
> > It would allow for a lot of
> > synchronization code to be removed and just let the card handle
> > itself.
>
> I guess it's doable to rewrite many things, but the handling will be
> still complex.  Imagine you'd need to deal with a dynamic removal of
> a PCM device while the system is in use (e.g. when a codec is
> disconnected).  This deletion procedure must access the top-level card
> stuff for locking or such, so the dependency is still present
> depending on the situation.

Makes sense. Yea the parent model doesn't work amazingly here does it
for synchronized release. Makes me think maybe we could just put a
barrier in the release functions so we know they have all been put to
0.

>
>
> Takashi
