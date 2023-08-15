Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BB277D521
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 23:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C279B1CE;
	Tue, 15 Aug 2023 23:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C279B1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692135238;
	bh=h0x6Ss1jKWpMJx2hFeBSeKHeCsDjWTM2iv6mIraJ4b0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A3o/RczcFGmiYdGFSSy+Xosv7D63PQ69r2sQmPWAj0opTRKfI6dm3CsZF6k8GOEsk
	 IElyHyGA/jOXzxKkVi8d2mHBua3p85U6eBO0BjIqCsO69IrJxlb9MQdWguGy9BDm/M
	 AJs+SSTgLh0MpKQQTQT2W+Wf6QwXAtkTTZn7v0gQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CEDBF800EE; Tue, 15 Aug 2023 23:33:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58DA0F800EE;
	Tue, 15 Aug 2023 23:33:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BED77F8016A; Tue, 15 Aug 2023 23:33:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 314B9F80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 23:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 314B9F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20221208 header.b=kXhJhBYO
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-26b47df332eso1617418a91.2
        for <alsa-devel@alsa-project.org>;
 Tue, 15 Aug 2023 14:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692135163; x=1692739963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXqDPZegCVRIcy9GPIRY4ba6PSa9hbS6cOcSnTJRLio=;
        b=kXhJhBYOErDI2gIEaCVnOc++gPNONu834W89OQkQanS1ZOPTwV59amGU0XyiJ7NTAY
         ouT0ytboSa4gx0A1zLM7DWgGj8q/j/H3FetrRd3GY/CmkTwWV6jj45NMlclZGcI6JsEr
         qzE9hqSgn/fOdbNM1pMoBgh9x3cmdcmyenB0jpkBjclKFZQc3glZnPT7pHf+H+TVBW7n
         oDjaRcBDO52ybWqPMrrOwwgGUWtCa1BHwMEV31BQndB2xB5KlBoXYD83YIY2jdco99AO
         G9+uLGDZTu/YxgB6rNrzLtaRzZ5tXudYXWxfLJuGh2rboJ7idbEpV1HwhELwc36IOzP6
         14UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692135163; x=1692739963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXqDPZegCVRIcy9GPIRY4ba6PSa9hbS6cOcSnTJRLio=;
        b=N6wpdJ/S7fYr/qLnPofE8Gsm7ya4MwktaIl/ebnj0bTD0i/xJ+xQKh3Qt5NT8EnVvs
         TzfzZ9MFmckhmmY7g9R48qzQo+Y93Ta2dTU3hDK5MwnhiHwOo3P/RoKyBoUlNo8aUPZS
         lX1ZmgsAsoRGBEQQRUd7gOIoA3TDTaQxt/RELuvfOzWdTSlD2ur1GzFE4qoXrEEMFqjq
         aE0nyi/3TAnxZikptNBzRy+PtOhKQ91GLFfb4MQuoyUwRPB/VQjg8SNgfv7GKYFXd7sU
         ajpHztmiPxK7Sn1Dpq7k3yhTXsHdhrw4bjdd+cZPiL0APGgWwBjr7+UDIl2VKw0HMdkE
         oEqA==
X-Gm-Message-State: AOJu0YzsXcJms3qvfJhO8QrkzTtgl5eNBRUrMjgxKl4Bm9NK61Eo65Ws
	FNfESD4JJgic5uUJeY1SdMwTR3Zak8Ar22JROzwWrg==
X-Google-Smtp-Source: 
 AGHT+IFB8Nb5R54H5uHyvW2x1F6EoMQaha8FoEmfIi9mHvrvR6bK5dmh3Y7DkfWQd0pzmVZr02LdrRRNbkbp5mvCFGY=
X-Received: by 2002:a17:90a:fb96:b0:269:851:4f00 with SMTP id
 cp22-20020a17090afb9600b0026908514f00mr8582926pjb.35.1692135162505; Tue, 15
 Aug 2023 14:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230807135207.17708-1-tiwai@suse.de>
 <CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
 <CAOReqxgCDdXAEyF8pt4dePQ2H_ub=hYczvO1xGpKWAt35z5B2Q@mail.gmail.com>
 <87o7jgfxgj.wl-tiwai@suse.de> <87sf8se471.wl-tiwai@suse.de>
 <CAOReqxjnWruX20YyUcAjwv8zLourFv4hUKGq9_1FBsXA6Fra9Q@mail.gmail.com>
 <87ttt3pdp5.wl-tiwai@suse.de>
 <CAOReqxhtcyePP+B6egNufuzM_ML3W7PVPNEENqxDfa605DoP9w@mail.gmail.com>
 <87msysxp9z.wl-tiwai@suse.de>
In-Reply-To: <87msysxp9z.wl-tiwai@suse.de>
From: Curtis Malainey <cujomalainey@google.com>
Date: Tue, 15 Aug 2023 14:32:31 -0700
Message-ID: 
 <CAOReqxiq86kxj1HEmjYPUZ5gW49y2x9ZFYa8mAH1VWFAF7dEuw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Curtis Malainey <cujomalainey@chromium.org>,
	Stephen Boyd <swboyd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YLVDMZ242KAD7RAADQ7OXVM54JUCEGCQ
X-Message-ID-Hash: YLVDMZ242KAD7RAADQ7OXVM54JUCEGCQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YLVDMZ242KAD7RAADQ7OXVM54JUCEGCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 15, 2023 at 9:07=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 14 Aug 2023 22:20:29 +0200,
> Curtis Malainey wrote:
> >
> > On Sun, Aug 13, 2023 at 1:08=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wr=
ote:
> > >
> > > On Wed, 09 Aug 2023 23:11:45 +0200,
> > > Curtis Malainey wrote:
> > > >
> > > > >
> > > > > And now looking back at kobj code and device code, they do refcou=
nt
> > > > > parent objects.  Maybe the problem is in our side -- the all devi=
ces
> > > > > are created with the original real device as the parent, includin=
g the
> > > > > card_dev, while there are some dependencies among children.  So, =
if we
> > > > > build up a proper tree, pci_dev -> card_dev -> ctl_dev, pcm_dev, =
etc,
> > > > > one of the problems could be solved.  It's more or less similar a=
s
> > > > > what I suggested initially (referring card_dev at pcm), while cha=
nging
> > > > > the parent would make it implicitly.
> > > >
> > > > Yes I think this would be the long term proper way to go, that way
> > > > parents just put children and remove their reference, then they
> > > > cleanup on their own time making everyone happy. My first patch was=
 a
> > > > very lazy attempt that, if we wanted to do the right thing we would
> > > > obviously have to split the structs and free functions to operate i=
n
> > > > their own release. If you have time feel free to take another swing=
 at
> > > > the patches, otherwise I won't be able to start until next week.
> > >
> > > Now looking back at the problem again, I noticed that actually my
> > > previous comment was wrong: as default, the device dependencies aren'=
t
> > > kept at the release time, but it's already cleared at device_del()
> > > call.  The device_del() calls kobject_del() and put_device(parent).
> > > So after this moment, both device releases become independent, and
> > > it'll hit a problem if the released object has still some dependency
> > > (such as the case of card vs ctl_dev in our case).
> > >
> > > An extra dependency to card_dev as I put in my early patch would "fix=
"
> > > it.  But, there is yet another problem: the call of dev_free call for
> > > snd_device object with SNDRV_DEV_LOWLEVEL can happen before releasing
> > > PCM and other devices when the delayed kobj release is enabled.  And,
> > > usually this callback does release the top-level resources, which
> > > might be still accessed during the other releases.
> >
> >
> > I was doing some testing late last week that confirms these fears
> > actually. Basically the rig was opening a non-blocking PCM and just
> > never sending data, removing the hw sound device (in this case a USB
> > peripheral) but not closing the userspace app. As a result kobjects
> > were released out of order with the top level "sound" being released
> > at disconnect of the USB device, but the actual card not being
> > released until the app closed. See annotated logs below
> >
> > [  690.528577] kobject: 'sound' (00000000266cd308):
> > kobject_add_internal: parent: '3-9:1.0', set: '(null)' <----- plug in
> > device
> > [  690.528607] kobject: 'card1' (00000000f7fa0903):
> > kobject_add_internal: parent: 'sound', set: 'devices'
> > [  690.528732] kobject: 'card1' (00000000f7fa0903): kobject_uevent_env
> > [  690.528756] kobject: 'card1' (00000000f7fa0903): fill_kobj_path:
> > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1=
'
> > [  690.528988] kobject: 'pcmC1D0p' (0000000095ff4473):
> > kobject_add_internal: parent: 'card1', set: 'devices'
> > [  690.529640] kobject: 'pcmC1D0p' (0000000095ff4473): fill_kobj_path:
> > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1=
/pcmC1D0p'
> > [  690.529778] kobject: 'pcmC1D0c' (00000000c4879d24):
> > kobject_add_internal: parent: 'card1', set: 'devices'
> > [  690.530006] kobject: 'pcmC1D0c' (00000000c4879d24): fill_kobj_path:
> > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1=
/pcmC1D0c'
> > [  690.530108] kobject: 'controlC1' (00000000a0a25449):
> > kobject_add_internal: parent: 'card1', set: 'devices'
> > [  690.530373] kobject: 'controlC1' (00000000a0a25449):
> > fill_kobj_path: path =3D
> > '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/controlC=
1'
> > [  690.671889] kobject: 'card1' (00000000f7fa0903): kobject_uevent_env
> > [  690.671906] kobject: 'card1' (00000000f7fa0903): fill_kobj_path:
> > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1=
'
> > [  700.009244] kobject: 'controlC1' (00000000a0a25449):
> > fill_kobj_path: path =3D
> > '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/controlC=
1'
> > [  700.010131] kobject: 'pcmC1D0p' (0000000095ff4473): fill_kobj_path:
> > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1=
/pcmC1D0p'
> > [  700.011344] kobject: 'pcmC1D0c' (00000000c4879d24): fill_kobj_path:
> > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1=
/pcmC1D0c'
> > [  700.012916] kobject: 'card1' (00000000f7fa0903): kobject_uevent_env
> > [  700.012951] kobject: 'card1' (00000000f7fa0903): fill_kobj_path:
> > path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1=
'
> >  <---- start blocked playback here
> > [  700.013057] kobject: 'sound' (00000000266cd308): kobject_release,
> > parent 0000000000000000 (delayed 1000) <--- unplug usb device
> > [  701.054221] kobject: 'sound' (00000000266cd308): kobject_cleanup,
> > parent 0000000000000000
> > [  701.054236] kobject: 'sound' (00000000266cd308): calling ktype relea=
se
> > [  701.054257] kobject: 'sound': free name
> > [  713.639843] kobject: 'card1' (00000000f7fa0903): kobject_release,
> > parent 0000000000000000 (delayed 3000) <--- Send EOF to playback
> > stream
> > [  716.669776] kobject: 'card1' (00000000f7fa0903): kobject_cleanup,
> > parent 0000000000000000
> > [  716.669810] kobject: 'card1' (00000000f7fa0903): calling ktype relea=
se
> > [  716.670834] kobject: 'card1': free name
> >
> > >
> > >
> > > So, if we tie the object resource with each struct device release, we
> > > have a lot of works:
> > > 1. Add extra dependencies among device hierarchy
> > > 2. Don't use card_dev refcount for managing the sync to device closes=
,
> > >    introduce another kref instead; otherwise card_dev refcount would
> > >    never reach to zero
> > > 3. Fix race of devres vs card_dev release
> > > 4. Move the second half part of snd_card_do_free() to the release
> > >    callback of card_dev itself to sync with the top-level release
> > > 5. Rewrite all SNDRV_DEV_LOWLEVEL usages to be called via
> > >    card->private_free or such;
> > >    maybe the only problem is hda_intel.c and hda_tegra.c that need
> > >    some work at the disconnection time, and we may introduce another
> > >    hook in the card object to replace that
> > >
> > > And, at this moment, I feel that it'd be easier to go back to the
> > > early way of device management, i.e. it'll be just like your patch,
> > > managing the device object independently from the rest resources.
> > > (This means also that the way freeing the resource for hwdep and
> > >  rawmidi will go back again without the embedded device, too; they
> > >  also suffer from the same problem of .)
> >
> > I agree, I think as a simple stopgap, my earlier patch would at least
> > appease the test until we can figure out the best way to do some
> > heavier work on the kobj. I think the proxy pointer for devres would
> > also be the best short term for 3.
> >
> > >
> > > The change 2 and 3 above can be still applied with your change, which
> > > will fix the remaining devres-vs-card_dev problem.
> >
> > I am not sure I follow the need for 2. If we broke ctl_dev out into
> > its own memory region and structured everything as a proper tree we
> > would have a proper cleanup and be able to use the refcounting
> > properly.
>
> My thought was about the devres release that does kfree() of the card
> while the card's card_dev release itself is still delayed.
> This might be a needless fear, though, as snd_card_free() should sync
> with the actual card_dev release.
>
> But, splitting the release-trigger and the actual memory release could
> be still worth.
>
> > > Once after fixing the current problem, we may work further on other
> > > stuff (e.g. item 5), so that we can switch again to the device-releas=
e
> > > model eventually later, too.
> >
> > Agreed, I don't have any experience with SNDRV_DEV_LOWLEVEL but I am
> > happy to help out here where I can.
> >
> > I am going to see if I can split the release card as mentioned but
> > also have refcount work as expected and have the release calls roll up
> > the tree.
>
> I quickly worked on and made a patch series.
> It's put in topic/dev-split branch of sound git tree
>   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=
=3Dtopic/dev-split
>
> It'd be appreciated if you can review / test it.

Took a look and ran it through the tests

You need to apply this diff

diff --git a/sound/usb/media.c b/sound/usb/media.c
index 6d11fedb46326..d48db6f3ae659 100644
--- a/sound/usb/media.c
+++ b/sound/usb/media.c
@@ -35,7 +35,7 @@ int snd_media_stream_init(struct snd_usb_substream
*subs, struct snd_pcm *pcm,
 {
        struct media_device *mdev;
        struct media_ctl *mctl;
-       struct device *pcm_dev =3D &pcm->streams[stream].dev;
+       struct device *pcm_dev =3D pcm->streams[stream].dev;
        u32 intf_type;
        int ret =3D 0;
        u16 mixer_pad;

Hammering probe and remove appears to be fine. Went 45min without issue.

Userspace holding references past hw removal appears to still be
broken as sound is released while the app is still running.

-- remove usb device --
[ 4819.827476] kobject: 'controlC1' (00000000255a51c8):
fill_kobj_path: path =3D
'/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/controlC1'
[ 4819.828114] kobject: 'pcmC1D0p' (00000000f0627532): kobject_uevent_env
[ 4819.828145] kobject: 'pcmC1D0p' (00000000f0627532): fill_kobj_path:
path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcm=
C1D0p'
[ 4819.828822] kobject: 'pcmC1D0c' (000000001b707a15): kobject_uevent_env
[ 4819.828850] kobject: 'pcmC1D0c' (000000001b707a15): fill_kobj_path:
path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcm=
C1D0c'
[ 4819.829405] kobject: 'card1' (000000005bce975e): kobject_uevent_env
[ 4819.829428] kobject: 'card1' (000000005bce975e): fill_kobj_path:
path =3D '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1'
[ 4819.829516] kobject: 'sound' (000000000bb52434): kobject_release,
parent 0000000000000000 (delayed 4000)
[ 4823.873625] kobject: 'sound' (000000000bb52434): kobject_cleanup,
parent 0000000000000000
[ 4823.873645] kobject: 'sound' (000000000bb52434): calling ktype release
[ 4823.873654] kobject: 'sound': free name

-- end app --
[ 4849.581815] kobject: 'pcmC1D0p' (00000000f0627532):
kobject_release, parent 0000000000000000 (delayed 2000)
[ 4849.581960] kobject: 'pcmC1D0c' (000000001b707a15):
kobject_release, parent 0000000000000000 (delayed 2000)
[ 4849.582626] kobject: 'card1' (000000005bce975e): kobject_release,
parent 0000000000000000 (delayed 1000)
[ 4850.625615] kobject: 'card1' (000000005bce975e): kobject_cleanup,
parent 0000000000000000
[ 4850.625638] kobject: 'card1' (000000005bce975e): calling ktype release
[ 4850.625663] kobject: 'card1': free name
[ 4851.585647] kobject: 'pcmC1D0c' (000000001b707a15):
kobject_cleanup, parent 0000000000000000
[ 4851.585672] kobject: 'pcmC1D0c' (000000001b707a15): calling ktype releas=
e
[ 4851.585708] kobject: 'pcmC1D0c': free name
[ 4851.585727] kobject: 'pcmC1D0p' (00000000f0627532):
kobject_cleanup, parent 0000000000000000
[ 4851.585737] kobject: 'pcmC1D0p' (00000000f0627532): calling ktype releas=
e
[ 4851.585752] kobject: 'pcmC1D0p': free name

I still don't understand why you need the kref. The devices are
already reference counting, why not use them? If we split them up into
their own structs we could then just device_put everything on removal
and let it roll up the tree with releases automatically, blocking
where userspace is still holding references. I will share a patches
sometime this week of what I mean. They will probably be a bit bigger
blast radius but I think its what is needed here.

Curtis

>
> I'll submit the patch set once (likely in tomorrow) after running a
> quick smoke test.
>
>
> thanks,
>
> Takashi
