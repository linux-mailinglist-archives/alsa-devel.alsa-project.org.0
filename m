Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056EE77C16E
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 22:21:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95FFA1CE;
	Mon, 14 Aug 2023 22:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95FFA1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692044510;
	bh=iIh358NYlMirfNWdxYXjIpt6ooXT2xcPYRLDOQwcQzs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=szWi/6/VQR1XO16X1EfWbiAyyh3ybMkUfoeJkPZA+85LBMQmf8nJZ1riffV7Q7upN
	 9bh+F9/2HMj70IUNhyhnA2QvQryyMtewmmHEV5XRniUdcUVTVJC1QIkQRMYLyUYKDD
	 KuaEXp1fFC8pU4/0CU62S+cmA49giqDcGcpsNeRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4FB9F800EE; Mon, 14 Aug 2023 22:20:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 609CCF80254;
	Mon, 14 Aug 2023 22:20:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CA63F8025F; Mon, 14 Aug 2023 22:20:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0C61F800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 22:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0C61F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=F8z1jnL4
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5657add1073so2072581a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 14 Aug 2023 13:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692044441; x=1692649241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUCcq2SiexmlsG3ryBeTuRdj/QbPyChxBWalOaaO2rQ=;
        b=F8z1jnL4DjIoBB5oRHiWRC1B+e9BBjE9Jcazm3ARz4g6DPzk4dKRWk16ZudowTFcnX
         r6dgcNsijPVDM3GEJjQ7/fNKxTxVydg85YiL0jOtw4XZKOd8nfUiv0oGcRr4s3DdIVha
         btpC58r9huQkpXUTUYhPqmnqxVLmaU7uEjyH0fT5AG19d7B7szVmijV7R4RlXWstYTm0
         P0VFxwV+jwzXQqnR+v8D/HhqtWpnFlfOmDeAwt3k9hAXMsZugaHRTdXvboyuuifXyiTM
         ti1GmHkBKxhLIk/UfrOZWsJfFGuAYm/bMEGUjSh1dyIQrpHhGn4RRzSmf5UV/WOVY7la
         q+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692044441; x=1692649241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUCcq2SiexmlsG3ryBeTuRdj/QbPyChxBWalOaaO2rQ=;
        b=YmENhO4DE3t5eSZDCSGzMW6I62t13U4A6a1Kpx1NBKmhqt5paLlsqFn5njzoFjYB+2
         yby9TWh1UBdV3PPSE0pG8EEaOeWgyKsPpsGyxw7sZgxu4EyUDugS8x3w9rjqBjr8YIxH
         EYFCrsxOC6C9FvCRgYxRenT0P8Cv8UKiMlFSetRi1sWVi3Z4UxjBJ9BmJ1TzVLmpvnyV
         lUz7gc+XadK3L2mModWf7C9S0Qw7KYfHO8hc771/JT8YBbzJ0c2kNtMumL/yYnY9Qquo
         W9nIv9dmMW0X+C7gP9KtO7RYXdEMpdVNeLAhjbJmSMVi8PwWgwodEnhAh2Xk2/XpakBS
         CMxg==
X-Gm-Message-State: AOJu0YySz28ZFhEXtzNgSo2FeOq8x/5hcbFf9pmg0gk7Hg7KgNw3jkLf
	5TL+y4Ee7SBWJg2U5trKhpcYLpg8kqAkbxHoAtcs7Q==
X-Google-Smtp-Source: 
 AGHT+IF02tNmtlMEmPmu66nbFSEx2aZbA2frt/J3983u6fWnjdhh/Z44JChxBujupefCmgutT/Um4qogs6qJvIfdBFU=
X-Received: by 2002:a17:90a:9ce:b0:268:2f6:61c4 with SMTP id
 72-20020a17090a09ce00b0026802f661c4mr41803pjo.12.1692044440806; Mon, 14 Aug
 2023 13:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230807135207.17708-1-tiwai@suse.de>
 <CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
 <CAOReqxgCDdXAEyF8pt4dePQ2H_ub=hYczvO1xGpKWAt35z5B2Q@mail.gmail.com>
 <87o7jgfxgj.wl-tiwai@suse.de> <87sf8se471.wl-tiwai@suse.de>
 <CAOReqxjnWruX20YyUcAjwv8zLourFv4hUKGq9_1FBsXA6Fra9Q@mail.gmail.com>
 <87ttt3pdp5.wl-tiwai@suse.de>
In-Reply-To: <87ttt3pdp5.wl-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Mon, 14 Aug 2023 13:20:29 -0700
Message-ID: 
 <CAOReqxhtcyePP+B6egNufuzM_ML3W7PVPNEENqxDfa605DoP9w@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@chromium.org>,
	Stephen Boyd <swboyd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 2WCO43HV7SAOPF7ZSGXQMDDNPVWGHNJW
X-Message-ID-Hash: 2WCO43HV7SAOPF7ZSGXQMDDNPVWGHNJW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WCO43HV7SAOPF7ZSGXQMDDNPVWGHNJW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Aug 13, 2023 at 1:08=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 09 Aug 2023 23:11:45 +0200,
> Curtis Malainey wrote:
> >
> > >
> > > And now looking back at kobj code and device code, they do refcount
> > > parent objects.  Maybe the problem is in our side -- the all devices
> > > are created with the original real device as the parent, including th=
e
> > > card_dev, while there are some dependencies among children.  So, if w=
e
> > > build up a proper tree, pci_dev -> card_dev -> ctl_dev, pcm_dev, etc,
> > > one of the problems could be solved.  It's more or less similar as
> > > what I suggested initially (referring card_dev at pcm), while changin=
g
> > > the parent would make it implicitly.
> >
> > Yes I think this would be the long term proper way to go, that way
> > parents just put children and remove their reference, then they
> > cleanup on their own time making everyone happy. My first patch was a
> > very lazy attempt that, if we wanted to do the right thing we would
> > obviously have to split the structs and free functions to operate in
> > their own release. If you have time feel free to take another swing at
> > the patches, otherwise I won't be able to start until next week.
>
> Now looking back at the problem again, I noticed that actually my
> previous comment was wrong: as default, the device dependencies aren't
> kept at the release time, but it's already cleared at device_del()
> call.  The device_del() calls kobject_del() and put_device(parent).
> So after this moment, both device releases become independent, and
> it'll hit a problem if the released object has still some dependency
> (such as the case of card vs ctl_dev in our case).
>
> An extra dependency to card_dev as I put in my early patch would "fix"
> it.  But, there is yet another problem: the call of dev_free call for
> snd_device object with SNDRV_DEV_LOWLEVEL can happen before releasing
> PCM and other devices when the delayed kobj release is enabled.  And,
> usually this callback does release the top-level resources, which
> might be still accessed during the other releases.


I was doing some testing late last week that confirms these fears
actually. Basically the rig was opening a non-blocking PCM and just
never sending data, removing the hw sound device (in this case a USB
peripheral) but not closing the userspace app. As a result kobjects
were released out of order with the top level "sound" being released
at disconnect of the USB device, but the actual card not being
released until the app closed. See annotated logs below

[  690.528577] kobject: 'sound' (00000000266cd308):
kobject_add_internal: parent: '3-9:1.0', set: '(null)' <----- plug in
device
[  690.528607] kobject: 'card1' (00000000f7fa0903):
kobject_add_internal: parent: 'sound', set: 'devices'
[  690.528732] kobject: 'card1' (00000000f7fa0903): kobject_uevent_env
[  690.528756] kobject: 'card1' (00000000f7fa0903): fill_kobj_path:
path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1'
[  690.528988] kobject: 'pcmC1D0p' (0000000095ff4473):
kobject_add_internal: parent: 'card1', set: 'devices'
[  690.529640] kobject: 'pcmC1D0p' (0000000095ff4473): fill_kobj_path:
path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcm=
C1D0p'
[  690.529778] kobject: 'pcmC1D0c' (00000000c4879d24):
kobject_add_internal: parent: 'card1', set: 'devices'
[  690.530006] kobject: 'pcmC1D0c' (00000000c4879d24): fill_kobj_path:
path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcm=
C1D0c'
[  690.530108] kobject: 'controlC1' (00000000a0a25449):
kobject_add_internal: parent: 'card1', set: 'devices'
[  690.530373] kobject: 'controlC1' (00000000a0a25449):
fill_kobj_path: path =3D
'/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/controlC1'
[  690.671889] kobject: 'card1' (00000000f7fa0903): kobject_uevent_env
[  690.671906] kobject: 'card1' (00000000f7fa0903): fill_kobj_path:
path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1'
[  700.009244] kobject: 'controlC1' (00000000a0a25449):
fill_kobj_path: path =3D
'/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/controlC1'
[  700.010131] kobject: 'pcmC1D0p' (0000000095ff4473): fill_kobj_path:
path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcm=
C1D0p'
[  700.011344] kobject: 'pcmC1D0c' (00000000c4879d24): fill_kobj_path:
path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcm=
C1D0c'
[  700.012916] kobject: 'card1' (00000000f7fa0903): kobject_uevent_env
[  700.012951] kobject: 'card1' (00000000f7fa0903): fill_kobj_path:
path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1'
 <---- start blocked playback here
[  700.013057] kobject: 'sound' (00000000266cd308): kobject_release,
parent 0000000000000000 (delayed 1000) <--- unplug usb device
[  701.054221] kobject: 'sound' (00000000266cd308): kobject_cleanup,
parent 0000000000000000
[  701.054236] kobject: 'sound' (00000000266cd308): calling ktype release
[  701.054257] kobject: 'sound': free name
[  713.639843] kobject: 'card1' (00000000f7fa0903): kobject_release,
parent 0000000000000000 (delayed 3000) <--- Send EOF to playback
stream
[  716.669776] kobject: 'card1' (00000000f7fa0903): kobject_cleanup,
parent 0000000000000000
[  716.669810] kobject: 'card1' (00000000f7fa0903): calling ktype release
[  716.670834] kobject: 'card1': free name

>
>
> So, if we tie the object resource with each struct device release, we
> have a lot of works:
> 1. Add extra dependencies among device hierarchy
> 2. Don't use card_dev refcount for managing the sync to device closes,
>    introduce another kref instead; otherwise card_dev refcount would
>    never reach to zero
> 3. Fix race of devres vs card_dev release
> 4. Move the second half part of snd_card_do_free() to the release
>    callback of card_dev itself to sync with the top-level release
> 5. Rewrite all SNDRV_DEV_LOWLEVEL usages to be called via
>    card->private_free or such;
>    maybe the only problem is hda_intel.c and hda_tegra.c that need
>    some work at the disconnection time, and we may introduce another
>    hook in the card object to replace that
>
> And, at this moment, I feel that it'd be easier to go back to the
> early way of device management, i.e. it'll be just like your patch,
> managing the device object independently from the rest resources.
> (This means also that the way freeing the resource for hwdep and
>  rawmidi will go back again without the embedded device, too; they
>  also suffer from the same problem of .)

I agree, I think as a simple stopgap, my earlier patch would at least
appease the test until we can figure out the best way to do some
heavier work on the kobj. I think the proxy pointer for devres would
also be the best short term for 3.

>
> The change 2 and 3 above can be still applied with your change, which
> will fix the remaining devres-vs-card_dev problem.

I am not sure I follow the need for 2. If we broke ctl_dev out into
its own memory region and structured everything as a proper tree we
would have a proper cleanup and be able to use the refcounting
properly.

>
> Once after fixing the current problem, we may work further on other
> stuff (e.g. item 5), so that we can switch again to the device-release
> model eventually later, too.

Agreed, I don't have any experience with SNDRV_DEV_LOWLEVEL but I am
happy to help out here where I can.

I am going to see if I can split the release card as mentioned but
also have refcount work as expected and have the release calls roll up
the tree.

Curtis

>
>
> Takashi
