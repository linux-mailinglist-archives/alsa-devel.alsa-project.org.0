Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3434F77F072
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Aug 2023 08:24:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA784827;
	Thu, 17 Aug 2023 08:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA784827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692253439;
	bh=NIUXnuzO0CGxZLJZ+B9wEOFkw1he2YR9xEhnP2QYnoY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PXMFbxqgpzLPXbsuR9MXGUMoQcEPmiHch5Ldh1gIcEHp3md8CfpFiUvxKs901l3R0
	 LbwT9yS3azGLl5rOgG0lnJlAl1cltH6mug9a6EB7/v+4cRWIvTjf+PcyvDniDev798
	 4VapUPM3a13kjyne9Cw4drUc89LL0LJH123Y+1Fk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFB5AF8025F; Thu, 17 Aug 2023 08:23:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78057F8016A;
	Thu, 17 Aug 2023 08:23:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9127F8016D; Thu, 17 Aug 2023 08:21:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E747F800D1
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 08:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E747F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0BNNn+Sz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=JRHmGTc4
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 791311F898;
	Thu, 17 Aug 2023 06:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692253270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrrUz51uOfcnmXjAD0tzJcmwUNwnTtjWGCAZHbM/kEc=;
	b=0BNNn+SzQDMVzrHcxmVRaAR20eK0YzGAYM72BWvnLRmuajGR5kq/qeLdLN/NagCOdw3ajY
	IpCP9VZoMAI1eGY0uj6eMsxSYXhg2yN9oi/xChMCtKGvFboRSEgAiP/ydi+NshLATfnP5J
	gof4K+tzlhLeT1pphBy/oeyueaEhAQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692253270;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wrrUz51uOfcnmXjAD0tzJcmwUNwnTtjWGCAZHbM/kEc=;
	b=JRHmGTc4YpNkbqtEkBh7apfYOsZjLmnEBimrmOC1Htv+vOswJS4wvU0V+mjcYXOnRJTRkC
	aJ9WX2nlXsDqPYDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5469C1392B;
	Thu, 17 Aug 2023 06:21:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Vo24E1a83WSTGAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 17 Aug 2023 06:21:10 +0000
Date: Thu, 17 Aug 2023 08:21:09 +0200
Message-ID: <87fs4iw5nu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Curtis Malainey <cujomalainey@google.com>
Cc: alsa-devel@alsa-project.org,
	Curtis Malainey <cujomalainey@chromium.org>,
	Stephen Boyd <swboyd@google.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
In-Reply-To: 
 <CAOReqxgi4Fr5QtAEDwQXhoPQ1S0h8d27mwLpeJe9Q4O6=GvPPQ@mail.gmail.com>
References: <20230807135207.17708-1-tiwai@suse.de>
	<CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
	<CAOReqxgCDdXAEyF8pt4dePQ2H_ub=hYczvO1xGpKWAt35z5B2Q@mail.gmail.com>
	<87o7jgfxgj.wl-tiwai@suse.de>
	<87sf8se471.wl-tiwai@suse.de>
	<CAOReqxjnWruX20YyUcAjwv8zLourFv4hUKGq9_1FBsXA6Fra9Q@mail.gmail.com>
	<87ttt3pdp5.wl-tiwai@suse.de>
	<CAOReqxhtcyePP+B6egNufuzM_ML3W7PVPNEENqxDfa605DoP9w@mail.gmail.com>
	<87msysxp9z.wl-tiwai@suse.de>
	<CAOReqxiq86kxj1HEmjYPUZ5gW49y2x9ZFYa8mAH1VWFAF7dEuw@mail.gmail.com>
	<878raby2fb.wl-tiwai@suse.de>
	<CAOReqxgi4Fr5QtAEDwQXhoPQ1S0h8d27mwLpeJe9Q4O6=GvPPQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VQSEFR3D3DQN45I4VXVZ5HZO3KLHR7B5
X-Message-ID-Hash: VQSEFR3D3DQN45I4VXVZ5HZO3KLHR7B5
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQSEFR3D3DQN45I4VXVZ5HZO3KLHR7B5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 16 Aug 2023 23:46:06 +0200,
Curtis Malainey wrote:
> 
> On Tue, Aug 15, 2023 at 10:35 PM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Tue, 15 Aug 2023 23:32:31 +0200,
> > Curtis Malainey wrote:
> > >
> > > On Tue, Aug 15, 2023 at 9:07 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > >
> > > > On Mon, 14 Aug 2023 22:20:29 +0200,
> > > > Curtis Malainey wrote:
> > > > >
> > > > > On Sun, Aug 13, 2023 at 1:08 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > So, if we tie the object resource with each struct device release, we
> > > > > > have a lot of works:
> > > > > > 1. Add extra dependencies among device hierarchy
> > > > > > 2. Don't use card_dev refcount for managing the sync to device closes,
> > > > > >    introduce another kref instead; otherwise card_dev refcount would
> > > > > >    never reach to zero
> > > > > > 3. Fix race of devres vs card_dev release
> > > > > > 4. Move the second half part of snd_card_do_free() to the release
> > > > > >    callback of card_dev itself to sync with the top-level release
> > > > > > 5. Rewrite all SNDRV_DEV_LOWLEVEL usages to be called via
> > > > > >    card->private_free or such;
> > > > > >    maybe the only problem is hda_intel.c and hda_tegra.c that need
> > > > > >    some work at the disconnection time, and we may introduce another
> > > > > >    hook in the card object to replace that
> > > > > >
> > > > > > And, at this moment, I feel that it'd be easier to go back to the
> > > > > > early way of device management, i.e. it'll be just like your patch,
> > > > > > managing the device object independently from the rest resources.
> > > > > > (This means also that the way freeing the resource for hwdep and
> > > > > >  rawmidi will go back again without the embedded device, too; they
> > > > > >  also suffer from the same problem of .)
> > > > >
> > > > > I agree, I think as a simple stopgap, my earlier patch would at least
> > > > > appease the test until we can figure out the best way to do some
> > > > > heavier work on the kobj. I think the proxy pointer for devres would
> > > > > also be the best short term for 3.
> > > > >
> > > > > >
> > > > > > The change 2 and 3 above can be still applied with your change, which
> > > > > > will fix the remaining devres-vs-card_dev problem.
> > > > >
> > > > > I am not sure I follow the need for 2. If we broke ctl_dev out into
> > > > > its own memory region and structured everything as a proper tree we
> > > > > would have a proper cleanup and be able to use the refcounting
> > > > > properly.
> > > >
> > > > My thought was about the devres release that does kfree() of the card
> > > > while the card's card_dev release itself is still delayed.
> > > > This might be a needless fear, though, as snd_card_free() should sync
> > > > with the actual card_dev release.
> > > >
> > > > But, splitting the release-trigger and the actual memory release could
> > > > be still worth.
> > > >
> > > > > > Once after fixing the current problem, we may work further on other
> > > > > > stuff (e.g. item 5), so that we can switch again to the device-release
> > > > > > model eventually later, too.
> > > > >
> > > > > Agreed, I don't have any experience with SNDRV_DEV_LOWLEVEL but I am
> > > > > happy to help out here where I can.
> > > > >
> > > > > I am going to see if I can split the release card as mentioned but
> > > > > also have refcount work as expected and have the release calls roll up
> > > > > the tree.
> > > >
> > > > I quickly worked on and made a patch series.
> > > > It's put in topic/dev-split branch of sound git tree
> > > >   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=topic/dev-split
> > > >
> > > > It'd be appreciated if you can review / test it.
> > >
> > > Took a look and ran it through the tests
> > >
> > > You need to apply this diff
> >
> > Thanks, I'll fix it up.
> >
> > >
> > > diff --git a/sound/usb/media.c b/sound/usb/media.c
> > > index 6d11fedb46326..d48db6f3ae659 100644
> > > --- a/sound/usb/media.c
> > > +++ b/sound/usb/media.c
> > > @@ -35,7 +35,7 @@ int snd_media_stream_init(struct snd_usb_substream
> > > *subs, struct snd_pcm *pcm,
> > >  {
> > >         struct media_device *mdev;
> > >         struct media_ctl *mctl;
> > > -       struct device *pcm_dev = &pcm->streams[stream].dev;
> > > +       struct device *pcm_dev = pcm->streams[stream].dev;
> > >         u32 intf_type;
> > >         int ret = 0;
> > >         u16 mixer_pad;
> > >
> > > Hammering probe and remove appears to be fine. Went 45min without issue.
> > >
> > > Userspace holding references past hw removal appears to still be
> > > broken as sound is released while the app is still running.
> > >
> > > -- remove usb device --
> > > [ 4819.827476] kobject: 'controlC1' (00000000255a51c8):
> > > fill_kobj_path: path =
> > > '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/controlC1'
> > > [ 4819.828114] kobject: 'pcmC1D0p' (00000000f0627532): kobject_uevent_env
> > > [ 4819.828145] kobject: 'pcmC1D0p' (00000000f0627532): fill_kobj_path:
> > > path = '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcmC1D0p'
> > > [ 4819.828822] kobject: 'pcmC1D0c' (000000001b707a15): kobject_uevent_env
> > > [ 4819.828850] kobject: 'pcmC1D0c' (000000001b707a15): fill_kobj_path:
> > > path = '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcmC1D0c'
> > > [ 4819.829405] kobject: 'card1' (000000005bce975e): kobject_uevent_env
> > > [ 4819.829428] kobject: 'card1' (000000005bce975e): fill_kobj_path:
> > > path = '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1'
> > > [ 4819.829516] kobject: 'sound' (000000000bb52434): kobject_release,
> > > parent 0000000000000000 (delayed 4000)
> > > [ 4823.873625] kobject: 'sound' (000000000bb52434): kobject_cleanup,
> > > parent 0000000000000000
> > > [ 4823.873645] kobject: 'sound' (000000000bb52434): calling ktype release
> > > [ 4823.873654] kobject: 'sound': free name
> > >
> > > -- end app --
> > > [ 4849.581815] kobject: 'pcmC1D0p' (00000000f0627532):
> > > kobject_release, parent 0000000000000000 (delayed 2000)
> > > [ 4849.581960] kobject: 'pcmC1D0c' (000000001b707a15):
> > > kobject_release, parent 0000000000000000 (delayed 2000)
> > > [ 4849.582626] kobject: 'card1' (000000005bce975e): kobject_release,
> > > parent 0000000000000000 (delayed 1000)
> > > [ 4850.625615] kobject: 'card1' (000000005bce975e): kobject_cleanup,
> > > parent 0000000000000000
> > > [ 4850.625638] kobject: 'card1' (000000005bce975e): calling ktype release
> > > [ 4850.625663] kobject: 'card1': free name
> > > [ 4851.585647] kobject: 'pcmC1D0c' (000000001b707a15):
> > > kobject_cleanup, parent 0000000000000000
> > > [ 4851.585672] kobject: 'pcmC1D0c' (000000001b707a15): calling ktype release
> > > [ 4851.585708] kobject: 'pcmC1D0c': free name
> > > [ 4851.585727] kobject: 'pcmC1D0p' (00000000f0627532):
> > > kobject_cleanup, parent 0000000000000000
> > > [ 4851.585737] kobject: 'pcmC1D0p' (00000000f0627532): calling ktype release
> > > [ 4851.585752] kobject: 'pcmC1D0p': free name
> >
> > It's the designed behavior.  Those are device *files* that are deleted
> > immediately at the disconnection while the application is still
> > running.  It's for avoiding a new application to be started after the
> > disconnect.  That is, only the device files in /dev/snd/* become
> > invisible.  Meanwhile, the already opened objects are still handled
> > internally.
> 
> It seems incorrect from a refcounting perspective though. The device
> still has active children so we need to remove the entry but should
> not be triggering the release yet.

Do you mean the release of 'sound'?  It's a sound class, and by
calling device_del(), all children are gone at the disconnection, so
it must be fine.  All other calls are only about device file deletion,
hence no release happened until the end of app.

> Based on the docs for kobject this is exactly how kobject_del behaves
> (remove from sysfs without dropping refcount) so it looks like we just
> need to fix the refcounting part.

device_del() decreases the refcount of the *parent*, although it
doesn't touch the refcount of the device it self.  So, after
device_del(), the tree hierarchy is gone, and that's one of the
problems that makes things difficult.

> > > I still don't understand why you need the kref. The devices are
> > > already reference counting, why not use them? If we split them up into
> > > their own structs we could then just device_put everything on removal
> > > and let it roll up the tree with releases automatically, blocking
> > > where userspace is still holding references. I will share a patches
> > > sometime this week of what I mean. They will probably be a bit bigger
> > > blast radius but I think its what is needed here.
> >
> > We want to trigger the top-level release free procedure once when all
> > files are closed.  This top-level release does put_device() of all
> > belonging devices.
> 
> Is there a need for this synchronization?

Sort of, yes.

> > The card_dev device refcount was used for this purpose.  OTOH, if we
> > want to construct the topology of the devices until the actual
> > deletion (i.e. keep card_dev until pcm and others are really
> > released/deleted), the card_dev refcount will be used for managing
> > the topology, too.  So, it'll get a side-effect side-effect that the
> > card_dev refcount won't be zero even after all files are closed (it's
> > referred from the children).
> 
> I think this is the intended use case for this system and would make
> it much easier to free the code. This will even allow early partial
> removal of the card until user space lets go of whatever parts it's
> holding onto (e.g. PCM is still open but controls have cleaned up if
> there is no dependency on controls).

And, that's the problem.  If the control is cleared before PCM, PCM
release may hit another UAF, as it tries to the associated channel map
and other controls.  And, for deleting a PCM or a control, it'll touch
the card's lock or linked list, so it still relies on the parent.
The release of each component can't be done alone, as there are some
dependencies.

> It would allow for a lot of
> synchronization code to be removed and just let the card handle
> itself.

I guess it's doable to rewrite many things, but the handling will be
still complex.  Imagine you'd need to deal with a dynamic removal of
a PCM device while the system is in use (e.g. when a codec is
disconnected).  This deletion procedure must access the top-level card
stuff for locking or such, so the dependency is still present
depending on the situation.


Takashi
