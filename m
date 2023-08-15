Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8127177CFE5
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 18:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5795F1F2;
	Tue, 15 Aug 2023 18:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5795F1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692115730;
	bh=Hs+H2tf9I9P2icpYT8waTUXax6xI2A/FrFkfLRzrHqA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cdjghnoQW75nTy8L2pZF9/JSLthVUbnBQXnRZ6srHgwXRVGoHdQfFgeOuaVn9MbCm
	 6aR1FwZz4H+qqhJYVVo7eORUi6HnIcWZ1vFjAdf4Y8dfKcdXB62XAlPT9sUOaFo9IH
	 qDXbiBkvATUMhwCCJP4gMazsVcXcvvYLW8jLV7QA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C732F8016A; Tue, 15 Aug 2023 18:07:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E9C9F8016A;
	Tue, 15 Aug 2023 18:07:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42718F8016D; Tue, 15 Aug 2023 18:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5A24F80027
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 18:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5A24F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=onfaki2U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gkTbixxb
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EBAC121887;
	Tue, 15 Aug 2023 16:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692115656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mU5q3WpGEMYvwlnyWBgRlccES7aFVi6q28vdqqwBoAY=;
	b=onfaki2U3NqxaOchv6zasAnAAUU+dOuO/q5A9uAM/HdHJPcEdwSN09EgG7O5tFwqPx8BV2
	+Ia6cbZ/YouIgRh+rciu7t7XgH2lhu3ElMAKFKwNa/8mbiFqpgdGrbRhX0NXEVUibygI6y
	KfPh9EaqsOwXna/f8c84yTrcMuzQQYk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692115656;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mU5q3WpGEMYvwlnyWBgRlccES7aFVi6q28vdqqwBoAY=;
	b=gkTbixxbrhQElUKRPbdM8nc0wfX8XjvYtNCmAaDIPwEsMEt9nxgUBvJy6Hc1UbDrA7GK+3
	283g2Hl5ALTkd9AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C64061353E;
	Tue, 15 Aug 2023 16:07:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id RoeAL8ii22SwBgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 16:07:36 +0000
Date: Tue, 15 Aug 2023 18:07:36 +0200
Message-ID: <87msysxp9z.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Curtis Malainey <cujomalainey@google.com>
Cc: alsa-devel@alsa-project.org,
	Curtis Malainey <cujomalainey@chromium.org>,
	Stephen Boyd <swboyd@google.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
In-Reply-To: 
 <CAOReqxhtcyePP+B6egNufuzM_ML3W7PVPNEENqxDfa605DoP9w@mail.gmail.com>
References: <20230807135207.17708-1-tiwai@suse.de>
	<CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
	<CAOReqxgCDdXAEyF8pt4dePQ2H_ub=hYczvO1xGpKWAt35z5B2Q@mail.gmail.com>
	<87o7jgfxgj.wl-tiwai@suse.de>
	<87sf8se471.wl-tiwai@suse.de>
	<CAOReqxjnWruX20YyUcAjwv8zLourFv4hUKGq9_1FBsXA6Fra9Q@mail.gmail.com>
	<87ttt3pdp5.wl-tiwai@suse.de>
	<CAOReqxhtcyePP+B6egNufuzM_ML3W7PVPNEENqxDfa605DoP9w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CCEDNPAKSKAMEPQOVRH5WJNJYDND5RKA
X-Message-ID-Hash: CCEDNPAKSKAMEPQOVRH5WJNJYDND5RKA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCEDNPAKSKAMEPQOVRH5WJNJYDND5RKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 14 Aug 2023 22:20:29 +0200,
Curtis Malainey wrote:
> 
> On Sun, Aug 13, 2023 at 1:08 AM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Wed, 09 Aug 2023 23:11:45 +0200,
> > Curtis Malainey wrote:
> > >
> > > >
> > > > And now looking back at kobj code and device code, they do refcount
> > > > parent objects.  Maybe the problem is in our side -- the all devices
> > > > are created with the original real device as the parent, including the
> > > > card_dev, while there are some dependencies among children.  So, if we
> > > > build up a proper tree, pci_dev -> card_dev -> ctl_dev, pcm_dev, etc,
> > > > one of the problems could be solved.  It's more or less similar as
> > > > what I suggested initially (referring card_dev at pcm), while changing
> > > > the parent would make it implicitly.
> > >
> > > Yes I think this would be the long term proper way to go, that way
> > > parents just put children and remove their reference, then they
> > > cleanup on their own time making everyone happy. My first patch was a
> > > very lazy attempt that, if we wanted to do the right thing we would
> > > obviously have to split the structs and free functions to operate in
> > > their own release. If you have time feel free to take another swing at
> > > the patches, otherwise I won't be able to start until next week.
> >
> > Now looking back at the problem again, I noticed that actually my
> > previous comment was wrong: as default, the device dependencies aren't
> > kept at the release time, but it's already cleared at device_del()
> > call.  The device_del() calls kobject_del() and put_device(parent).
> > So after this moment, both device releases become independent, and
> > it'll hit a problem if the released object has still some dependency
> > (such as the case of card vs ctl_dev in our case).
> >
> > An extra dependency to card_dev as I put in my early patch would "fix"
> > it.  But, there is yet another problem: the call of dev_free call for
> > snd_device object with SNDRV_DEV_LOWLEVEL can happen before releasing
> > PCM and other devices when the delayed kobj release is enabled.  And,
> > usually this callback does release the top-level resources, which
> > might be still accessed during the other releases.
> 
> 
> I was doing some testing late last week that confirms these fears
> actually. Basically the rig was opening a non-blocking PCM and just
> never sending data, removing the hw sound device (in this case a USB
> peripheral) but not closing the userspace app. As a result kobjects
> were released out of order with the top level "sound" being released
> at disconnect of the USB device, but the actual card not being
> released until the app closed. See annotated logs below
> 
> [  690.528577] kobject: 'sound' (00000000266cd308):
> kobject_add_internal: parent: '3-9:1.0', set: '(null)' <----- plug in
> device
> [  690.528607] kobject: 'card1' (00000000f7fa0903):
> kobject_add_internal: parent: 'sound', set: 'devices'
> [  690.528732] kobject: 'card1' (00000000f7fa0903): kobject_uevent_env
> [  690.528756] kobject: 'card1' (00000000f7fa0903): fill_kobj_path:
> path = '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1'
> [  690.528988] kobject: 'pcmC1D0p' (0000000095ff4473):
> kobject_add_internal: parent: 'card1', set: 'devices'
> [  690.529640] kobject: 'pcmC1D0p' (0000000095ff4473): fill_kobj_path:
> path = '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcmC1D0p'
> [  690.529778] kobject: 'pcmC1D0c' (00000000c4879d24):
> kobject_add_internal: parent: 'card1', set: 'devices'
> [  690.530006] kobject: 'pcmC1D0c' (00000000c4879d24): fill_kobj_path:
> path = '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcmC1D0c'
> [  690.530108] kobject: 'controlC1' (00000000a0a25449):
> kobject_add_internal: parent: 'card1', set: 'devices'
> [  690.530373] kobject: 'controlC1' (00000000a0a25449):
> fill_kobj_path: path =
> '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/controlC1'
> [  690.671889] kobject: 'card1' (00000000f7fa0903): kobject_uevent_env
> [  690.671906] kobject: 'card1' (00000000f7fa0903): fill_kobj_path:
> path = '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1'
> [  700.009244] kobject: 'controlC1' (00000000a0a25449):
> fill_kobj_path: path =
> '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/controlC1'
> [  700.010131] kobject: 'pcmC1D0p' (0000000095ff4473): fill_kobj_path:
> path = '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcmC1D0p'
> [  700.011344] kobject: 'pcmC1D0c' (00000000c4879d24): fill_kobj_path:
> path = '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1/pcmC1D0c'
> [  700.012916] kobject: 'card1' (00000000f7fa0903): kobject_uevent_env
> [  700.012951] kobject: 'card1' (00000000f7fa0903): fill_kobj_path:
> path = '/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9:1.0/sound/card1'
>  <---- start blocked playback here
> [  700.013057] kobject: 'sound' (00000000266cd308): kobject_release,
> parent 0000000000000000 (delayed 1000) <--- unplug usb device
> [  701.054221] kobject: 'sound' (00000000266cd308): kobject_cleanup,
> parent 0000000000000000
> [  701.054236] kobject: 'sound' (00000000266cd308): calling ktype release
> [  701.054257] kobject: 'sound': free name
> [  713.639843] kobject: 'card1' (00000000f7fa0903): kobject_release,
> parent 0000000000000000 (delayed 3000) <--- Send EOF to playback
> stream
> [  716.669776] kobject: 'card1' (00000000f7fa0903): kobject_cleanup,
> parent 0000000000000000
> [  716.669810] kobject: 'card1' (00000000f7fa0903): calling ktype release
> [  716.670834] kobject: 'card1': free name
> 
> >
> >
> > So, if we tie the object resource with each struct device release, we
> > have a lot of works:
> > 1. Add extra dependencies among device hierarchy
> > 2. Don't use card_dev refcount for managing the sync to device closes,
> >    introduce another kref instead; otherwise card_dev refcount would
> >    never reach to zero
> > 3. Fix race of devres vs card_dev release
> > 4. Move the second half part of snd_card_do_free() to the release
> >    callback of card_dev itself to sync with the top-level release
> > 5. Rewrite all SNDRV_DEV_LOWLEVEL usages to be called via
> >    card->private_free or such;
> >    maybe the only problem is hda_intel.c and hda_tegra.c that need
> >    some work at the disconnection time, and we may introduce another
> >    hook in the card object to replace that
> >
> > And, at this moment, I feel that it'd be easier to go back to the
> > early way of device management, i.e. it'll be just like your patch,
> > managing the device object independently from the rest resources.
> > (This means also that the way freeing the resource for hwdep and
> >  rawmidi will go back again without the embedded device, too; they
> >  also suffer from the same problem of .)
> 
> I agree, I think as a simple stopgap, my earlier patch would at least
> appease the test until we can figure out the best way to do some
> heavier work on the kobj. I think the proxy pointer for devres would
> also be the best short term for 3.
> 
> >
> > The change 2 and 3 above can be still applied with your change, which
> > will fix the remaining devres-vs-card_dev problem.
> 
> I am not sure I follow the need for 2. If we broke ctl_dev out into
> its own memory region and structured everything as a proper tree we
> would have a proper cleanup and be able to use the refcounting
> properly.

My thought was about the devres release that does kfree() of the card
while the card's card_dev release itself is still delayed.
This might be a needless fear, though, as snd_card_free() should sync
with the actual card_dev release.

But, splitting the release-trigger and the actual memory release could
be still worth.

> > Once after fixing the current problem, we may work further on other
> > stuff (e.g. item 5), so that we can switch again to the device-release
> > model eventually later, too.
> 
> Agreed, I don't have any experience with SNDRV_DEV_LOWLEVEL but I am
> happy to help out here where I can.
> 
> I am going to see if I can split the release card as mentioned but
> also have refcount work as expected and have the release calls roll up
> the tree.

I quickly worked on and made a patch series.
It's put in topic/dev-split branch of sound git tree
  https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/log/?h=topic/dev-split

It'd be appreciated if you can review / test it.

I'll submit the patch set once (likely in tomorrow) after running a
quick smoke test.


thanks,

Takashi
