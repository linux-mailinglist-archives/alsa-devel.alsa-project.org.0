Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE632671C4C
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 13:41:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66E4A516F;
	Wed, 18 Jan 2023 13:40:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66E4A516F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674045664;
	bh=ACRnkIWGJQeWSigXs9bLw+5CKw9b25V+e2wFvdW3++s=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MB7miYAkY9Sv4jeVqxroaCPwDHn7M/f6M7c7ctfnQKlc6TiW2s6j7DRwme1n6g/Do
	 8D1zQNO85W5TpNQFTGWCn//KRjfzvHcyg5RZuR3IV3u0czF6jweASYCR8YWYuQ+EcH
	 aYnzvAJe8ocBQ5tbWmePOwIRpUISTfQHCw9EgWkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 152AAF8021D;
	Wed, 18 Jan 2023 13:40:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D805F8026D; Wed, 18 Jan 2023 13:40:04 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E152F8021D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 13:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E152F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=mJWIwjmP; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9ofnJwUu
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 49B8A3E945;
 Wed, 18 Jan 2023 12:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674045597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NJgbil3YmkXaDCbI5fdiIZ4SDvyYqA3R3w8/uE6chs=;
 b=mJWIwjmPPewa9RRsV7PYHYGWKXUDrlDI5fu5eguEThuEeXt25JZQSvRRKBS/S9PJD0vCIX
 LBKucuLAeoCHTuxfqCIeG0g9AZcDNAaxNiNXvvgSZYmGY+NOKhOSurXChBqOlCIyhV3nF6
 oAs84llWt0tfXvftBXC4KchCKs6Z6+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674045597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NJgbil3YmkXaDCbI5fdiIZ4SDvyYqA3R3w8/uE6chs=;
 b=9ofnJwUuduwolPbxkaox5IBfl5Lahw1V3gfdu47caVF8xWXqoZmutx1oVQ49OaLYa+n2LW
 DYLkqpMTyHLQUuAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3970E138FE;
 Wed, 18 Jan 2023 12:39:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id h3ogDZ3ox2PyIwAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 18 Jan 2023 12:39:57 +0000
Date: Wed, 18 Jan 2023 13:39:56 +0100
Message-ID: <87fsc8t3s3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
In-Reply-To: <Y8fMVtWshr+yFLWk@mail-itl>
References: <Y6sOvyYwuR8Pu0wj@mail-itl> <87bkmya2zk.wl-tiwai@suse.de>
 <87tu0p8uda.wl-tiwai@suse.de> <Y8aIPPcPuDeNkVEy@mail-itl>
 <Y8au5JiQ3w1YPZ8d@mail-itl> <87tu0p6xix.wl-tiwai@suse.de>
 <Y8bRmWMBVFVk0WZc@mail-itl> <874jsp6r3q.wl-tiwai@suse.de>
 <Y8cGVGCWjODvMXUe@mail-itl> <87sfg85ic1.wl-tiwai@suse.de>
 <Y8fMVtWshr+yFLWk@mail-itl>
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

On Wed, 18 Jan 2023 11:39:18 +0100,
Marek Marczykowski-Górecki wrote:
> 
> On Wed, Jan 18, 2023 at 09:59:26AM +0100, Takashi Iwai wrote:
> > On Tue, 17 Jan 2023 21:34:11 +0100,
> > Marek Marczykowski-Górecki wrote:
> > > 
> > > On Tue, Jan 17, 2023 at 05:52:25PM +0100, Takashi Iwai wrote:
> > > > On Tue, 17 Jan 2023 17:49:28 +0100,
> > > > Marek Marczykowski-Górecki wrote:
> > > > > 
> > > > > On Tue, Jan 17, 2023 at 03:33:42PM +0100, Takashi Iwai wrote:
> > > > > > On Tue, 17 Jan 2023 15:21:23 +0100,
> > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > 
> > > > > > > On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai wrote:
> > > > > > > > > On Mon, 16 Jan 2023 16:55:11 +0100,
> > > > > > > > > Takashi Iwai wrote:
> > > > > > > > > > 
> > > > > > > > > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > 
> > > > > > > > > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrote:
> > > > > > > > > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > 
> > > > > > > > > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > > > > > > > > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > > Under Xen PV dom0, with Linux >= 5.17, sound stops working after few
> > > > > > > > > > > > > > > > > hours. pavucontrol still shows meter bars moving, but the speakers
> > > > > > > > > > > > > > > > > remain silent. At least on some occasions I see the following message in
> > > > > > > > > > > > > > > > > dmesg:
> > > > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (18144 >= 6396); disabling LPIB delay counting
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Hit the issue again, this message did not appear in the log (or at least
> > > > > > > > > > > > > > not yet).
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > (...)
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > In anyway, please check the behavior with 6.1-rc8 + the commit
> > > > > > > > > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > > > > > > > > > >     ALSA: memalloc: Allocate more contiguous pages for fallback case
> > > > > > > > > > > > > > > > from for-next of my sound git tree (which will be in 6.2-rc1).
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > This did not helped.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Looking at the mentioned commits, there is one specific aspect of Xen PV
> > > > > > > > > > > > > > > that may be relevant. It configures PAT differently than native Linux.
> > > > > > > > > > > > > > > Theoretically Linux adapts automatically and using proper API (like
> > > > > > > > > > > > > > > set_memory_wc()) should just work, but at least for i915 driver it
> > > > > > > > > > > > > > > causes issues (not fully tracked down yet). Details about that bug
> > > > > > > > > > > > > > > report include some more background:
> > > > > > > > > > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > Anyway, I have tested it on a Xen modified to setup PAT the same way as
> > > > > > > > > > > > > > > native Linux and the audio issue is still there.
> > > > > > > > > > > > > > > 
> > > > > > > > > > > > > > > > If the problem persists, another thing to check is the hack below
> > > > > > > > > > > > > > > > works.
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Trying this one now.
> > > > > > > > > > > > > 
> > > > > > > > > > > > > And this one didn't either :/
> > > > > > > > > > > > 
> > > > > > > > > > > > (Sorry for the late reply, as I've been off in the last weeks.)
> > > > > > > > > > > > 
> > > > > > > > > > > > I think the hack doesn't influence on the PCM buffer pages, but only
> > > > > > > > > > > > about BDL pages.  Could you check the patch below instead?
> > > > > > > > > > > > It'll disable the SG-buffer handling on x86 completely. 
> > > > > > > > > > > 
> > > > > > > > > > > This seems to "fix" the issue, thanks!
> > > > > > > > > > > I guess I'll run it this way for now, but a proper solution would be
> > > > > > > > > > > nice. Let me know if I can collect any more info that would help with
> > > > > > > > > > > that.
> > > > > > > > > > 
> > > > > > > > > > Then we seem to go back again with the coherent memory allocation for
> > > > > > > > > > the fallback sg cases.  It was changed because the use of
> > > > > > > > > > dma_alloc_coherent() caused a problem with IOMMU case for retrieving
> > > > > > > > > > the page addresses, but since the commit 9736a325137b, we essentially
> > > > > > > > > > avoid the fallback when IOMMU is used, so it should be fine again.
> > > > > > > > > > 
> > > > > > > > > > Let me know if the patch like below works for you instead of the
> > > > > > > > > > previous hack to disable SG-buffer (note: totally untested!)
> > > > > > > > > 
> > > > > > > > > Gah, there was an obvious typo, scratch that.
> > > > > > > > > 
> > > > > > > > > Below is a proper patch.  Please try this one instead.
> > > > > > > > 
> > > > > > > > Thanks, I'll give it a try.
> > > > > > > 
> > > > > > > Unfortunately, it doesn't help, it stopped working again, after about 3h
> > > > > > > uptime.
> > > > > > 
> > > > > > Aha, then it might be rather other way round;
> > > > > > dma_alloc_noncontiguous() doesn't work on Xen properly.
> > > > > > 
> > > > > > Could you try the one below instead of the previous?
> > > > > 
> > > > > Unfortunately, this one doesn't fix it either :/
> > > > 
> > > > Hmm.  Then how about applying both of the last two patches?  The last
> > > > one to enforce the fallback allocation and the previous one to use
> > > > dma_alloc_coherent().  It should be essentially reverting to the old
> > > > way.
> > > 
> > > Oh, I noticed only now: the last patch made it fail to initialize.
> > 
> > The "last patch" means the patch to enforce the fallback allocation?
> 
> Yes, the one about dma_alloc_noncontiguous().
> 
> > > I
> > > don't see obvious errors in dmesg, but when trying aplay, I get:
> > > 
> > >     ALSA lib pcm_direct.c:1284:(snd1_pcm_direct_initialize_slave) unable to install hw params
> > >     ALSA lib pcm_dmix.c:1087:(snd_pcm_dmix_open) unable to initialize slave
> > >     aplay: main:830: audio open error: Cannot allocate memory
> > 
> > It's -ENOMEM, so it must be from there.  Does it appear always?  If
> > yes, your system is with IOMMU, and the patch made return always NULL
> > intentionally.
> 
> While the system do have IOMMU, it isn't configured by Linux, but by
> Xen. And it maps all the memory that Linux see.
> 
> > If that's the case, the problem is that IOMMU doesn't handle the
> > coherent memory on Xen.
> > 
> > Please check more explicitly, whether get_dma_ops(dmab->dev.dev) call
> > in snd_dma_noncontig_alloc() returns NULL or not.
> 
> Will do.

If get_dma_ops() is non-NULL, it means we need some Xen-specific
workaround not to use dma_alloc_noncontiguous().
What's the best way to see whether the driver is running on Xen PV?

Meanwhile, it's helpful if you can try the combo of my last two
patches, too.  It should work, and if it doesn't, it implies that
we're looking at a wrong place.


thanks,

Takashi
