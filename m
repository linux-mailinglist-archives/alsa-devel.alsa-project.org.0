Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E3F77A588
	for <lists+alsa-devel@lfdr.de>; Sun, 13 Aug 2023 10:10:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A47741;
	Sun, 13 Aug 2023 10:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A47741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691914219;
	bh=IiqSWLsnl9b7YDrLpRBuaBxuh3uoFJF3RCN2d4qjR70=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LJtdCU2Jnr5soXZku7mc+2Arihq6N/ZOUx4OSALBmlPuYaVHui8Lxhv+J1e4rkELy
	 JrjgsITB3DHx9RXTC/r49Mjaol9XniCJop+s9f0vCu3Ym1qrN+DnawrLqyv3fb3wz/
	 vnJFxEDjiP6vd28Sx0Qmp+HbAo5ihDYAF3aFsAO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCF00F80290; Sun, 13 Aug 2023 10:09:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4B62F80254;
	Sun, 13 Aug 2023 10:09:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68C7FF8025F; Sun, 13 Aug 2023 10:08:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5659AF801EB
	for <alsa-devel@alsa-project.org>; Sun, 13 Aug 2023 10:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5659AF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0xMoKsD0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TMjWq9ey
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A06091F8BF;
	Sun, 13 Aug 2023 08:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691914087;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zX3lLZRj+qaNuYNZxzi8dUsrC4lpkvE9Ou0lach3MKE=;
	b=0xMoKsD0k/qhMAhiDP3AE9ySzVtNtO9jbBzVKfIkI2ApPqPZmLI7COPBmyxMlv2OZ+vGBo
	EaSRgAOK3yfx6I3sROjzKI/dljcmMeOxJdfgVQ/vQ2ZGprPyLmAerYw+iL0XUnn56Hg1nc
	HOAOrtxFSLt8ezSawaO08xi3kiNrdbA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691914087;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zX3lLZRj+qaNuYNZxzi8dUsrC4lpkvE9Ou0lach3MKE=;
	b=TMjWq9ey8FPXfyqt23ZbT32RZRGJ0OIqxAnJOOlqYQab3o3KrG9FhqYPuzoL2+3mkZaEY1
	3zN31SpdhFKcYSDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7ACA01322C;
	Sun, 13 Aug 2023 08:08:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id orD/HGeP2GT6HgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 13 Aug 2023 08:08:07 +0000
Date: Sun, 13 Aug 2023 10:08:06 +0200
Message-ID: <87ttt3pdp5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Curtis Malainey <cujomalainey@google.com>
Cc: alsa-devel@alsa-project.org,
	Curtis Malainey <cujomalainey@chromium.org>,
	Stephen Boyd <swboyd@google.com>
Subject: Re: [PATCH RFC 0/6] ALSA: Fix UAF with delayed kobj release
In-Reply-To: 
 <CAOReqxjnWruX20YyUcAjwv8zLourFv4hUKGq9_1FBsXA6Fra9Q@mail.gmail.com>
References: <20230807135207.17708-1-tiwai@suse.de>
	<CAOReqxhV=gfwNpxnEU+ruOx6gjD2BSZbYPJ6+iWzkPCidFmCBA@mail.gmail.com>
	<CAOReqxgCDdXAEyF8pt4dePQ2H_ub=hYczvO1xGpKWAt35z5B2Q@mail.gmail.com>
	<87o7jgfxgj.wl-tiwai@suse.de>
	<87sf8se471.wl-tiwai@suse.de>
	<CAOReqxjnWruX20YyUcAjwv8zLourFv4hUKGq9_1FBsXA6Fra9Q@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: JV4JRX2MAHWIHKMBKW72ALOJUDJQMN6M
X-Message-ID-Hash: JV4JRX2MAHWIHKMBKW72ALOJUDJQMN6M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JV4JRX2MAHWIHKMBKW72ALOJUDJQMN6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 09 Aug 2023 23:11:45 +0200,
Curtis Malainey wrote:
> 
> >
> > And now looking back at kobj code and device code, they do refcount
> > parent objects.  Maybe the problem is in our side -- the all devices
> > are created with the original real device as the parent, including the
> > card_dev, while there are some dependencies among children.  So, if we
> > build up a proper tree, pci_dev -> card_dev -> ctl_dev, pcm_dev, etc,
> > one of the problems could be solved.  It's more or less similar as
> > what I suggested initially (referring card_dev at pcm), while changing
> > the parent would make it implicitly.
> 
> Yes I think this would be the long term proper way to go, that way
> parents just put children and remove their reference, then they
> cleanup on their own time making everyone happy. My first patch was a
> very lazy attempt that, if we wanted to do the right thing we would
> obviously have to split the structs and free functions to operate in
> their own release. If you have time feel free to take another swing at
> the patches, otherwise I won't be able to start until next week.

Now looking back at the problem again, I noticed that actually my
previous comment was wrong: as default, the device dependencies aren't
kept at the release time, but it's already cleared at device_del()
call.  The device_del() calls kobject_del() and put_device(parent).
So after this moment, both device releases become independent, and
it'll hit a problem if the released object has still some dependency
(such as the case of card vs ctl_dev in our case).

An extra dependency to card_dev as I put in my early patch would "fix"
it.  But, there is yet another problem: the call of dev_free call for
snd_device object with SNDRV_DEV_LOWLEVEL can happen before releasing
PCM and other devices when the delayed kobj release is enabled.  And,
usually this callback does release the top-level resources, which
might be still accessed during the other releases.

So, if we tie the object resource with each struct device release, we
have a lot of works:
1. Add extra dependencies among device hierarchy
2. Don't use card_dev refcount for managing the sync to device closes,
   introduce another kref instead; otherwise card_dev refcount would
   never reach to zero
3. Fix race of devres vs card_dev release
4. Move the second half part of snd_card_do_free() to the release
   callback of card_dev itself to sync with the top-level release
5. Rewrite all SNDRV_DEV_LOWLEVEL usages to be called via
   card->private_free or such;
   maybe the only problem is hda_intel.c and hda_tegra.c that need
   some work at the disconnection time, and we may introduce another
   hook in the card object to replace that

And, at this moment, I feel that it'd be easier to go back to the
early way of device management, i.e. it'll be just like your patch,
managing the device object independently from the rest resources.
(This means also that the way freeing the resource for hwdep and
 rawmidi will go back again without the embedded device, too; they
 also suffer from the same problem of SNDRV_DEV_LOWLEVEL.)

The change 2 and 3 above can be still applied with your change, which
will fix the remaining devres-vs-card_dev problem.

Once after fixing the current problem, we may work further on other
stuff (e.g. item 5), so that we can switch again to the device-release
model eventually later, too.


Takashi
