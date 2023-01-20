Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3331E675593
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 14:20:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAB50329E;
	Fri, 20 Jan 2023 14:19:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAB50329E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674220812;
	bh=FKRAssXKbfts+uaPAl9KG7f7rK/5pQLKk+6TPXLKuH4=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pcSyeyw33qvv2XBY4/uC6Dqnt7I6t0tehmflYd5Lj4mnnO1qmqvrgW22rVUEiLmdb
	 ia8MU1PzN1OaOBfyPavnwJF9N1rDTmiuahlqvNkE0JNfB5VDxEyr4aBa7uR0PlAG7L
	 gdKWKhfgKMFK44IgJmf2cvpS6eGhfEu3Ozr+Uuos=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 448C0F80246;
	Fri, 20 Jan 2023 14:19:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 101F5F8026D; Fri, 20 Jan 2023 14:19:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1B16F8024C
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 14:19:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1B16F8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=rjGoqfog; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NxyG3CrM
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F630219A3;
 Fri, 20 Jan 2023 13:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674220749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vi4lQW0Wr4ovPA3ROOGQJbuWMhetkepqxxQA5U2JDg4=;
 b=rjGoqfog8jj28TYgeAPUSXzOgApnIEi7BmZ9l80hC+R0xY5A9p2msCD3/S6APDLr9eIcm9
 GwTf8TGT/VLsB5H/uTyiZa/YQBuCFSCa5Aw+3cbSJmOGHjbGFRDrXxW1srTNPx64n/OZuW
 OXOORqQ2heTLEiAAqBnrM7oKwndnYPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674220749;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vi4lQW0Wr4ovPA3ROOGQJbuWMhetkepqxxQA5U2JDg4=;
 b=NxyG3CrMXrVELhNhuQUNR2OkYyn+E+2IXZiSiqJ6jFpbwo0b0bYIC40wS+FspYd+gr/9ay
 Fn4GIOg1mqX7z/Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFBC013251;
 Fri, 20 Jan 2023 13:19:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Z8XLOMyUymMxNwAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 20 Jan 2023 13:19:08 +0000
Date: Fri, 20 Jan 2023 14:19:08 +0100
Message-ID: <878rhxpcmr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
In-Reply-To: <Y8qE9qBUi6Tuj0SS@mail-itl>
References: <87tu0p6xix.wl-tiwai@suse.de> <Y8bRmWMBVFVk0WZc@mail-itl>
 <874jsp6r3q.wl-tiwai@suse.de> <Y8cGVGCWjODvMXUe@mail-itl>
 <87sfg85ic1.wl-tiwai@suse.de> <Y8fMVtWshr+yFLWk@mail-itl>
 <87fsc8t3s3.wl-tiwai@suse.de> <Y8nqIBJISq9Vm710@mail-itl>
 <Y8n7XkbM0aIEshlX@mail-itl> <87zgadpsz2.wl-tiwai@suse.de>
 <Y8qE9qBUi6Tuj0SS@mail-itl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Harald Arnesen <harald@skogtun.org>,
 Alex Xu <alex_y_xu@yahoo.ca>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 20 Jan 2023 13:11:34 +0100,
Marek Marczykowski-Górecki wrote:
> 
> On Fri, Jan 20, 2023 at 08:26:09AM +0100, Takashi Iwai wrote:
> > On Fri, 20 Jan 2023 03:24:30 +0100,
> > Marek Marczykowski-Górecki wrote:
> > > 
> > > On Fri, Jan 20, 2023 at 02:10:37AM +0100, Marek Marczykowski-Górecki wrote:
> > > > On Wed, Jan 18, 2023 at 01:39:56PM +0100, Takashi Iwai wrote:
> > > > > On Wed, 18 Jan 2023 11:39:18 +0100,
> > > > > Marek Marczykowski-Górecki wrote:
> > > > > > 
> > > > > > On Wed, Jan 18, 2023 at 09:59:26AM +0100, Takashi Iwai wrote:
> > > > > > > On Tue, 17 Jan 2023 21:34:11 +0100,
> > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > 
> > > > > > > > On Tue, Jan 17, 2023 at 05:52:25PM +0100, Takashi Iwai wrote:
> > > > > > > > > On Tue, 17 Jan 2023 17:49:28 +0100,
> > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > 
> > > > > > > > > > On Tue, Jan 17, 2023 at 03:33:42PM +0100, Takashi Iwai wrote:
> > > > > > > > > > > On Tue, 17 Jan 2023 15:21:23 +0100,
> > > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > 
> > > > > > > > > > > > On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai wrote:
> > > > > > > > > > > > > > On Mon, 16 Jan 2023 16:55:11 +0100,
> > > > > > > > > > > > > > Takashi Iwai wrote:
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > > > > > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrote:
> > > > > > > > > > > > > > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > > > > > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > > > > > > > > > > > > > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > > > > > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > > > > Under Xen PV dom0, with Linux >= 5.17, sound stops working after few
> > > > > > > > > > > > > > > > > > > > > > hours. pavucontrol still shows meter bars moving, but the speakers
> > > > > > > > > > > > > > > > > > > > > > remain silent. At least on some occasions I see the following message in
> > > > > > > > > > > > > > > > > > > > > > dmesg:
> > > > > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (18144 >= 6396); disabling LPIB delay counting
> > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > Hit the issue again, this message did not appear in the log (or at least
> > > > > > > > > > > > > > > > > > > not yet).
> > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > (...)
> > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > > > In anyway, please check the behavior with 6.1-rc8 + the commit
> > > > > > > > > > > > > > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > > > > > > > > > > > > > > >     ALSA: memalloc: Allocate more contiguous pages for fallback case
> > > > > > > > > > > > > > > > > > > > > from for-next of my sound git tree (which will be in 6.2-rc1).
> > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > This did not helped.
> > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > > Looking at the mentioned commits, there is one specific aspect of Xen PV
> > > > > > > > > > > > > > > > > > > > that may be relevant. It configures PAT differently than native Linux.
> > > > > > > > > > > > > > > > > > > > Theoretically Linux adapts automatically and using proper API (like
> > > > > > > > > > > > > > > > > > > > set_memory_wc()) should just work, but at least for i915 driver it
> > > > > > > > > > > > > > > > > > > > causes issues (not fully tracked down yet). Details about that bug
> > > > > > > > > > > > > > > > > > > > report include some more background:
> > > > > > > > > > > > > > > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> > > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > > Anyway, I have tested it on a Xen modified to setup PAT the same way as
> > > > > > > > > > > > > > > > > > > > native Linux and the audio issue is still there.
> > > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > > > If the problem persists, another thing to check is the hack below
> > > > > > > > > > > > > > > > > > > > > works.
> > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > Trying this one now.
> > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > And this one didn't either :/
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > (Sorry for the late reply, as I've been off in the last weeks.)
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > I think the hack doesn't influence on the PCM buffer pages, but only
> > > > > > > > > > > > > > > > > about BDL pages.  Could you check the patch below instead?
> > > > > > > > > > > > > > > > > It'll disable the SG-buffer handling on x86 completely. 
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > This seems to "fix" the issue, thanks!
> > > > > > > > > > > > > > > > I guess I'll run it this way for now, but a proper solution would be
> > > > > > > > > > > > > > > > nice. Let me know if I can collect any more info that would help with
> > > > > > > > > > > > > > > > that.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Then we seem to go back again with the coherent memory allocation for
> > > > > > > > > > > > > > > the fallback sg cases.  It was changed because the use of
> > > > > > > > > > > > > > > dma_alloc_coherent() caused a problem with IOMMU case for retrieving
> > > > > > > > > > > > > > > the page addresses, but since the commit 9736a325137b, we essentially
> > > > > > > > > > > > > > > avoid the fallback when IOMMU is used, so it should be fine again.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Let me know if the patch like below works for you instead of the
> > > > > > > > > > > > > > > previous hack to disable SG-buffer (note: totally untested!)
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Gah, there was an obvious typo, scratch that.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Below is a proper patch.  Please try this one instead.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Thanks, I'll give it a try.
> > > > > > > > > > > > 
> > > > > > > > > > > > Unfortunately, it doesn't help, it stopped working again, after about 3h
> > > > > > > > > > > > uptime.
> > > > > > > > > > > 
> > > > > > > > > > > Aha, then it might be rather other way round;
> > > > > > > > > > > dma_alloc_noncontiguous() doesn't work on Xen properly.
> > > > > > > > > > > 
> > > > > > > > > > > Could you try the one below instead of the previous?
> > > > > > > > > > 
> > > > > > > > > > Unfortunately, this one doesn't fix it either :/
> > > > > > > > > 
> > > > > > > > > Hmm.  Then how about applying both of the last two patches?  The last
> > > > > > > > > one to enforce the fallback allocation and the previous one to use
> > > > > > > > > dma_alloc_coherent().  It should be essentially reverting to the old
> > > > > > > > > way.
> > > > > > > > 
> > > > > > > > Oh, I noticed only now: the last patch made it fail to initialize.
> > > > > > > 
> > > > > > > The "last patch" means the patch to enforce the fallback allocation?
> > > > > > 
> > > > > > Yes, the one about dma_alloc_noncontiguous().
> > > > > > 
> > > > > > > > I
> > > > > > > > don't see obvious errors in dmesg, but when trying aplay, I get:
> > > > > > > > 
> > > > > > > >     ALSA lib pcm_direct.c:1284:(snd1_pcm_direct_initialize_slave) unable to install hw params
> > > > > > > >     ALSA lib pcm_dmix.c:1087:(snd_pcm_dmix_open) unable to initialize slave
> > > > > > > >     aplay: main:830: audio open error: Cannot allocate memory
> > > > > > > 
> > > > > > > It's -ENOMEM, so it must be from there.  Does it appear always?  If
> > > > > > > yes, your system is with IOMMU, and the patch made return always NULL
> > > > > > > intentionally.
> > > > > > 
> > > > > > While the system do have IOMMU, it isn't configured by Linux, but by
> > > > > > Xen. And it maps all the memory that Linux see.
> > > > > > 
> > > > > > > If that's the case, the problem is that IOMMU doesn't handle the
> > > > > > > coherent memory on Xen.
> > > > > > > 
> > > > > > > Please check more explicitly, whether get_dma_ops(dmab->dev.dev) call
> > > > > > > in snd_dma_noncontig_alloc() returns NULL or not.
> > > > > > 
> > > > > > Will do.
> > > > > 
> > > > > If get_dma_ops() is non-NULL, 
> > > > 
> > > > Yes, it's non-NULL.
> > > > 
> > > > > it means we need some Xen-specific
> > > > > workaround not to use dma_alloc_noncontiguous().
> > > > > What's the best way to see whether the driver is running on Xen PV?
> > > > 
> > > > Usually it's this: cpu_feature_enabled(X86_FEATURE_XENPV)
> > > > 
> > > > > Meanwhile, it's helpful if you can try the combo of my last two
> > > > > patches, too.  It should work, and if it doesn't, it implies that
> > > > > we're looking at a wrong place.
> > > > 
> > > > It doesn't because the last of them causes "Cannot allocate memory".
> > > > I'm trying now with this on top:
> > > > 
> > > > ---8<---
> > > > diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
> > > > index 97d7b8106869..e927d18d1ebb 100644
> > > > --- a/sound/core/memalloc.c
> > > > +++ b/sound/core/memalloc.c
> > > > @@ -545,7 +545,7 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
> > > >  	// sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
> > > >  	//	      DEFAULT_GFP, 0);
> > > >  #ifdef CONFIG_SND_DMA_SGBUF
> > > > -	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
> > > > +	if (!sgt) { // && !get_dma_ops(dmab->dev.dev)) {
> > > >  		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
> > > >  			dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
> > > >  		else
> > > > ---8<---
> > > 
> > > Unfortunately, the above doesn't help. I mean, I don't get an error
> > > anymore, but no sound output either (even though pavucontrol says I
> > > should hear it). So, it's like the original issue, but without any
> > > delay, just straight from the start.
> > 
> > Hmm, it's the result with the combination of both patches, right?
> 
> Yes.
> 
> > What I meant as the combo is something like below.
> 
> Something like this, yes.

It's puzzling, then.  The patch changes the allocation with the
dma_alloc_coherent(), and that's what does with the Kconfig hack
you've tested.  One possible significant difference is the use of the
DMA address.

> BTW, xen_domain() will also return true on PVH/HVM domain, which should
> not need any of this special treatment. It's PV that is weird.

OK, then it can be an overkill.

Below is another try: it changes the different use of the DMA buffer
address.  Let's cross fingers.


thanks,

Takashi

-- 8< --
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -541,10 +541,9 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct sg_table *sgt;
 	void *p;
 
-	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
-				      DEFAULT_GFP, 0);
 #ifdef CONFIG_SND_DMA_SGBUF
-	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
+	if (cpu_feature_enabled(X86_FEATURE_XENPV) ||
+	    !get_dma_ops(dmab->dev.dev)) {
 		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
 			dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
 		else
@@ -552,6 +551,8 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 		return snd_dma_sg_fallback_alloc(dmab, size);
 	}
 #endif
+	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
+				      DEFAULT_GFP, 0);
 	if (!sgt)
 		return NULL;
 
@@ -719,17 +720,30 @@ static const struct snd_malloc_ops snd_dma_sg_wc_ops = {
 struct snd_dma_sg_fallback {
 	size_t count;
 	struct page **pages;
+	dma_addr_t *addrs;
 };
 
 static void __snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab,
 				       struct snd_dma_sg_fallback *sgbuf)
 {
-	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
-	size_t i;
-
-	for (i = 0; i < sgbuf->count && sgbuf->pages[i]; i++)
-		do_free_pages(page_address(sgbuf->pages[i]), PAGE_SIZE, wc);
+	size_t i, size;
+
+	if (sgbuf->pages && sgbuf->addrs) {
+		i = 0;
+		while (i < sgbuf->count) {
+			if (!sgbuf->pages[i] || !sgbuf->addrs[i])
+				break;
+			size = sgbuf->addrs[i] & ~PAGE_MASK;
+			if (WARN_ON(!size))
+				break;
+			dma_free_coherent(dmab->dev.dev, size,
+					  page_address(sgbuf->pages[i]),
+					  sgbuf->addrs[i] & PAGE_MASK);
+			i += size;
+		}
+	}
 	kvfree(sgbuf->pages);
+	kvfree(sgbuf->addrs);
 	kfree(sgbuf);
 }
 
@@ -738,9 +752,9 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct snd_dma_sg_fallback *sgbuf;
 	struct page **pagep, *curp;
 	size_t chunk, npages;
+	dma_addr_t *addrp;
 	dma_addr_t addr;
 	void *p;
-	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
 
 	sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (!sgbuf)
@@ -748,14 +762,16 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	size = PAGE_ALIGN(size);
 	sgbuf->count = size >> PAGE_SHIFT;
 	sgbuf->pages = kvcalloc(sgbuf->count, sizeof(*sgbuf->pages), GFP_KERNEL);
-	if (!sgbuf->pages)
+	sgbuf->addrs = kvcalloc(sgbuf->count, sizeof(*sgbuf->addrs), GFP_KERNEL);
+	if (!sgbuf->pages || !sgbuf->addrs)
 		goto error;
 
 	pagep = sgbuf->pages;
-	chunk = size;
+	addrp = sgbuf->addrs;
+	chunk = (PAGE_SIZE - 1) << PAGE_SHIFT; /* to fit in low bits in addrs */
 	while (size > 0) {
 		chunk = min(size, chunk);
-		p = do_alloc_pages(dmab->dev.dev, chunk, &addr, wc);
+		p = dma_alloc_coherent(dmab->dev.dev, chunk, &addr, DEFAULT_GFP);
 		if (!p) {
 			if (chunk <= PAGE_SIZE)
 				goto error;
@@ -767,17 +783,25 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 		size -= chunk;
 		/* fill pages */
 		npages = chunk >> PAGE_SHIFT;
+		*addrp = npages; /* store in lower bits */
 		curp = virt_to_page(p);
-		while (npages--)
+		while (npages--) {
 			*pagep++ = curp++;
+			*addrp++ |= addr;
+			addr += PAGE_SIZE;
+		}
 	}
 
 	p = vmap(sgbuf->pages, sgbuf->count, VM_MAP, PAGE_KERNEL);
 	if (!p)
 		goto error;
+
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		set_pages_array_wc(sgbuf->pages, sgbuf->count);
+
 	dmab->private_data = sgbuf;
 	/* store the first page address for convenience */
-	dmab->addr = snd_sgbuf_get_addr(dmab, 0);
+	dmab->addr = sgbuf->addrs[0] & PAGE_MASK;
 	return p;
 
  error:
@@ -787,10 +811,23 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 
 static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
 {
+	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
+
 	vunmap(dmab->area);
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		set_pages_array_wb(sgbuf->pages, sgbuf->count);
 	__snd_dma_sg_fallback_free(dmab, dmab->private_data);
 }
 
+static dma_addr_t snd_dma_sg_fallback_get_addr(struct snd_dma_buffer *dmab,
+					       size_t offset)
+{
+	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
+	size_t index = offset >> PAGE_SHIFT;
+
+	return (sgbuf->addrs[index] & PAGE_MASK) | (offset & ~PAGE_MASK);
+}
+
 static int snd_dma_sg_fallback_mmap(struct snd_dma_buffer *dmab,
 				    struct vm_area_struct *area)
 {
@@ -805,8 +842,8 @@ static const struct snd_malloc_ops snd_dma_sg_fallback_ops = {
 	.alloc = snd_dma_sg_fallback_alloc,
 	.free = snd_dma_sg_fallback_free,
 	.mmap = snd_dma_sg_fallback_mmap,
+	.get_addr = snd_dma_sg_fallback_get_addr,
 	/* reuse vmalloc helpers */
-	.get_addr = snd_dma_vmalloc_get_addr,
 	.get_page = snd_dma_vmalloc_get_page,
 	.get_chunk_size = snd_dma_vmalloc_get_chunk_size,
 };
