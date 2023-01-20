Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A51D9674E16
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:27:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33A0F2DFA;
	Fri, 20 Jan 2023 08:26:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33A0F2DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674199633;
	bh=dOtTUn+amQzz3mJOGVDc6nEV4mU98FhjoP9LrSNrRTM=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=M0nDcmT7OJW791v5Ho3kr8Bme0UWrTMpbLA4SBzdTet9vzosnkdT93ODZ2ku099tp
	 xjhy7qKdCuCI1ane15N+s9jMAdI+tCjwzmppQN5t+8Qu3BSt5f3dktX0jWuvNhtU28
	 pueeeegZn7rWFsFMI4pwcYcgHg1GWgv+5uBpeW40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4E2DF80482;
	Fri, 20 Jan 2023 08:26:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71E4EF8026D; Fri, 20 Jan 2023 08:26:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DB99F80246
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:26:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DB99F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=AmAWOSUA; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/6rDFW7h
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 640175D8CF;
 Fri, 20 Jan 2023 07:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674199570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qfQbrp+Op32A9vINjhZs6TKAdcZy9ZqDxcMj9zP1l8=;
 b=AmAWOSUAfeJcjovRs9UVjDorh0zL50jzzO44SDJso2yubEVgnpAvZk2qndW5kaZ1hQZT3S
 tLcGn1NH3jeUHUk4AxoBUr1l8pAkuRIh5yPUEl/3mh98ZUa5+cpMZLGEv4nMEdbHB5+ZCc
 KtQKHpmAoj+zC1H8SPzvKoCttnPvVEo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674199570;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7qfQbrp+Op32A9vINjhZs6TKAdcZy9ZqDxcMj9zP1l8=;
 b=/6rDFW7h+IOyiJ7m7QmdcvxT7ecjEJU7+hZyoH7TpzGrjByXRE9mHs0n+FILOa1pKHE/Xh
 rK/lCC368s/pLHCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3CC391390C;
 Fri, 20 Jan 2023 07:26:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TaYaDhJCymPObAAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 20 Jan 2023 07:26:10 +0000
Date: Fri, 20 Jan 2023 08:26:09 +0100
Message-ID: <87zgadpsz2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
In-Reply-To: <Y8n7XkbM0aIEshlX@mail-itl>
References: <Y8aIPPcPuDeNkVEy@mail-itl> <Y8au5JiQ3w1YPZ8d@mail-itl>
 <87tu0p6xix.wl-tiwai@suse.de> <Y8bRmWMBVFVk0WZc@mail-itl>
 <874jsp6r3q.wl-tiwai@suse.de> <Y8cGVGCWjODvMXUe@mail-itl>
 <87sfg85ic1.wl-tiwai@suse.de> <Y8fMVtWshr+yFLWk@mail-itl>
 <87fsc8t3s3.wl-tiwai@suse.de> <Y8nqIBJISq9Vm710@mail-itl>
 <Y8n7XkbM0aIEshlX@mail-itl>
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

On Fri, 20 Jan 2023 03:24:30 +0100,
Marek Marczykowski-Górecki wrote:
> 
> On Fri, Jan 20, 2023 at 02:10:37AM +0100, Marek Marczykowski-Górecki wrote:
> > On Wed, Jan 18, 2023 at 01:39:56PM +0100, Takashi Iwai wrote:
> > > On Wed, 18 Jan 2023 11:39:18 +0100,
> > > Marek Marczykowski-Górecki wrote:
> > > > 
> > > > On Wed, Jan 18, 2023 at 09:59:26AM +0100, Takashi Iwai wrote:
> > > > > On Tue, 17 Jan 2023 21:34:11 +0100,
> > > > > Marek Marczykowski-Górecki wrote:
> > > > > > 
> > > > > > On Tue, Jan 17, 2023 at 05:52:25PM +0100, Takashi Iwai wrote:
> > > > > > > On Tue, 17 Jan 2023 17:49:28 +0100,
> > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > 
> > > > > > > > On Tue, Jan 17, 2023 at 03:33:42PM +0100, Takashi Iwai wrote:
> > > > > > > > > On Tue, 17 Jan 2023 15:21:23 +0100,
> > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > 
> > > > > > > > > > On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai wrote:
> > > > > > > > > > > > On Mon, 16 Jan 2023 16:55:11 +0100,
> > > > > > > > > > > > Takashi Iwai wrote:
> > > > > > > > > > > > > 
> > > > > > > > > > > > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > > > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrote:
> > > > > > > > > > > > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > > > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > > > > > > > > > > > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > > > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > > Under Xen PV dom0, with Linux >= 5.17, sound stops working after few
> > > > > > > > > > > > > > > > > > > > hours. pavucontrol still shows meter bars moving, but the speakers
> > > > > > > > > > > > > > > > > > > > remain silent. At least on some occasions I see the following message in
> > > > > > > > > > > > > > > > > > > > dmesg:
> > > > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (18144 >= 6396); disabling LPIB delay counting
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > Hit the issue again, this message did not appear in the log (or at least
> > > > > > > > > > > > > > > > > not yet).
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > (...)
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > In anyway, please check the behavior with 6.1-rc8 + the commit
> > > > > > > > > > > > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > > > > > > > > > > > > >     ALSA: memalloc: Allocate more contiguous pages for fallback case
> > > > > > > > > > > > > > > > > > > from for-next of my sound git tree (which will be in 6.2-rc1).
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > This did not helped.
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > Looking at the mentioned commits, there is one specific aspect of Xen PV
> > > > > > > > > > > > > > > > > > that may be relevant. It configures PAT differently than native Linux.
> > > > > > > > > > > > > > > > > > Theoretically Linux adapts automatically and using proper API (like
> > > > > > > > > > > > > > > > > > set_memory_wc()) should just work, but at least for i915 driver it
> > > > > > > > > > > > > > > > > > causes issues (not fully tracked down yet). Details about that bug
> > > > > > > > > > > > > > > > > > report include some more background:
> > > > > > > > > > > > > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > Anyway, I have tested it on a Xen modified to setup PAT the same way as
> > > > > > > > > > > > > > > > > > native Linux and the audio issue is still there.
> > > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > > > If the problem persists, another thing to check is the hack below
> > > > > > > > > > > > > > > > > > > works.
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > Trying this one now.
> > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > And this one didn't either :/
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > (Sorry for the late reply, as I've been off in the last weeks.)
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > I think the hack doesn't influence on the PCM buffer pages, but only
> > > > > > > > > > > > > > > about BDL pages.  Could you check the patch below instead?
> > > > > > > > > > > > > > > It'll disable the SG-buffer handling on x86 completely. 
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > This seems to "fix" the issue, thanks!
> > > > > > > > > > > > > > I guess I'll run it this way for now, but a proper solution would be
> > > > > > > > > > > > > > nice. Let me know if I can collect any more info that would help with
> > > > > > > > > > > > > > that.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Then we seem to go back again with the coherent memory allocation for
> > > > > > > > > > > > > the fallback sg cases.  It was changed because the use of
> > > > > > > > > > > > > dma_alloc_coherent() caused a problem with IOMMU case for retrieving
> > > > > > > > > > > > > the page addresses, but since the commit 9736a325137b, we essentially
> > > > > > > > > > > > > avoid the fallback when IOMMU is used, so it should be fine again.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Let me know if the patch like below works for you instead of the
> > > > > > > > > > > > > previous hack to disable SG-buffer (note: totally untested!)
> > > > > > > > > > > > 
> > > > > > > > > > > > Gah, there was an obvious typo, scratch that.
> > > > > > > > > > > > 
> > > > > > > > > > > > Below is a proper patch.  Please try this one instead.
> > > > > > > > > > > 
> > > > > > > > > > > Thanks, I'll give it a try.
> > > > > > > > > > 
> > > > > > > > > > Unfortunately, it doesn't help, it stopped working again, after about 3h
> > > > > > > > > > uptime.
> > > > > > > > > 
> > > > > > > > > Aha, then it might be rather other way round;
> > > > > > > > > dma_alloc_noncontiguous() doesn't work on Xen properly.
> > > > > > > > > 
> > > > > > > > > Could you try the one below instead of the previous?
> > > > > > > > 
> > > > > > > > Unfortunately, this one doesn't fix it either :/
> > > > > > > 
> > > > > > > Hmm.  Then how about applying both of the last two patches?  The last
> > > > > > > one to enforce the fallback allocation and the previous one to use
> > > > > > > dma_alloc_coherent().  It should be essentially reverting to the old
> > > > > > > way.
> > > > > > 
> > > > > > Oh, I noticed only now: the last patch made it fail to initialize.
> > > > > 
> > > > > The "last patch" means the patch to enforce the fallback allocation?
> > > > 
> > > > Yes, the one about dma_alloc_noncontiguous().
> > > > 
> > > > > > I
> > > > > > don't see obvious errors in dmesg, but when trying aplay, I get:
> > > > > > 
> > > > > >     ALSA lib pcm_direct.c:1284:(snd1_pcm_direct_initialize_slave) unable to install hw params
> > > > > >     ALSA lib pcm_dmix.c:1087:(snd_pcm_dmix_open) unable to initialize slave
> > > > > >     aplay: main:830: audio open error: Cannot allocate memory
> > > > > 
> > > > > It's -ENOMEM, so it must be from there.  Does it appear always?  If
> > > > > yes, your system is with IOMMU, and the patch made return always NULL
> > > > > intentionally.
> > > > 
> > > > While the system do have IOMMU, it isn't configured by Linux, but by
> > > > Xen. And it maps all the memory that Linux see.
> > > > 
> > > > > If that's the case, the problem is that IOMMU doesn't handle the
> > > > > coherent memory on Xen.
> > > > > 
> > > > > Please check more explicitly, whether get_dma_ops(dmab->dev.dev) call
> > > > > in snd_dma_noncontig_alloc() returns NULL or not.
> > > > 
> > > > Will do.
> > > 
> > > If get_dma_ops() is non-NULL, 
> > 
> > Yes, it's non-NULL.
> > 
> > > it means we need some Xen-specific
> > > workaround not to use dma_alloc_noncontiguous().
> > > What's the best way to see whether the driver is running on Xen PV?
> > 
> > Usually it's this: cpu_feature_enabled(X86_FEATURE_XENPV)
> > 
> > > Meanwhile, it's helpful if you can try the combo of my last two
> > > patches, too.  It should work, and if it doesn't, it implies that
> > > we're looking at a wrong place.
> > 
> > It doesn't because the last of them causes "Cannot allocate memory".
> > I'm trying now with this on top:
> > 
> > ---8<---
> > diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
> > index 97d7b8106869..e927d18d1ebb 100644
> > --- a/sound/core/memalloc.c
> > +++ b/sound/core/memalloc.c
> > @@ -545,7 +545,7 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
> >  	// sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
> >  	//	      DEFAULT_GFP, 0);
> >  #ifdef CONFIG_SND_DMA_SGBUF
> > -	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
> > +	if (!sgt) { // && !get_dma_ops(dmab->dev.dev)) {
> >  		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
> >  			dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
> >  		else
> > ---8<---
> 
> Unfortunately, the above doesn't help. I mean, I don't get an error
> anymore, but no sound output either (even though pavucontrol says I
> should hear it). So, it's like the original issue, but without any
> delay, just straight from the start.

Hmm, it's the result with the combination of both patches, right?
What I meant as the combo is something like below.


Takashi

-- 8< --
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -15,6 +15,7 @@
 #include <linux/vmalloc.h>
 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
+#include <xen/xen.h>
 #endif
 #include <sound/memalloc.h>
 #include "memalloc_local.h"
@@ -541,10 +542,8 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct sg_table *sgt;
 	void *p;
 
-	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
-				      DEFAULT_GFP, 0);
 #ifdef CONFIG_SND_DMA_SGBUF
-	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
+	if (xen_domain() || !get_dma_ops(dmab->dev.dev)) {
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
 
@@ -738,9 +752,8 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	struct snd_dma_sg_fallback *sgbuf;
 	struct page **pagep, *curp;
 	size_t chunk, npages;
-	dma_addr_t addr;
+	dma_addr_t *addrp;
 	void *p;
-	bool wc = dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
 
 	sgbuf = kzalloc(sizeof(*sgbuf), GFP_KERNEL);
 	if (!sgbuf)
@@ -748,14 +761,16 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
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
+		p = dma_alloc_coherent(dmab->dev.dev, chunk, addrp, DEFAULT_GFP);
 		if (!p) {
 			if (chunk <= PAGE_SIZE)
 				goto error;
@@ -767,6 +782,8 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 		size -= chunk;
 		/* fill pages */
 		npages = chunk >> PAGE_SHIFT;
+		*addrp |= npages; /* store in lower bits */
+		addrp += npages;
 		curp = virt_to_page(p);
 		while (npages--)
 			*pagep++ = curp++;
@@ -775,6 +792,10 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 	p = vmap(sgbuf->pages, sgbuf->count, VM_MAP, PAGE_KERNEL);
 	if (!p)
 		goto error;
+
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		set_pages_array_wc(sgbuf->pages, sgbuf->count);
+
 	dmab->private_data = sgbuf;
 	/* store the first page address for convenience */
 	dmab->addr = snd_sgbuf_get_addr(dmab, 0);
@@ -787,7 +808,11 @@ static void *snd_dma_sg_fallback_alloc(struct snd_dma_buffer *dmab, size_t size)
 
 static void snd_dma_sg_fallback_free(struct snd_dma_buffer *dmab)
 {
+	struct snd_dma_sg_fallback *sgbuf = dmab->private_data;
+
 	vunmap(dmab->area);
+	if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK)
+		set_pages_array_wb(sgbuf->pages, sgbuf->count);
 	__snd_dma_sg_fallback_free(dmab, dmab->private_data);
 }
 
