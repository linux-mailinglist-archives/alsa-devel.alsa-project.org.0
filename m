Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3E766E41E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 17:53:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA617506A;
	Tue, 17 Jan 2023 17:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA617506A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673974410;
	bh=YQ4olIC9vGy0t9hWkxBQyUX2A13fumOigHDoNWaAVnc=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZsSRuybf3Q92iUUGt/igazEdWVM7hPpvvjMjji404aMmEQOD0gCnGvnolvqO9T9di
	 N9rJ6MItu2BH1qKnJZQ3KmgsP+Fx6dzzQBbHivaPXmEk01SWqb8ZiN/L6MUsxHF8jm
	 vGdoSXEtez/29cbneRqHAHkF2TOQbPAx2yO4vwP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2582AF804DE;
	Tue, 17 Jan 2023 17:52:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09804F8047B; Tue, 17 Jan 2023 17:52:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6D66F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 17:52:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6D66F8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HScpHokU; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=NntryFEI
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 691EB1FE16;
 Tue, 17 Jan 2023 16:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673974346; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TR/ATiBe1ydQMMqik5gXESbDdDu3yuM/iJMZIo3aUFc=;
 b=HScpHokUQH+NahNC7udUAvM3V6dTcfX1K8Hv/jnkBvH9Jy+NSH3LSviq/bdpUWQdNmu16M
 eypto1SGvv6o7X4ph1DeQCDHXzwA3kmkFJFoL1Eah1AbRUqY2hN7v8kmQl0c8RZ+2bHHUe
 EKpNe5iue9i9vy7NbrbGyUGZ0BEvYRo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673974346;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TR/ATiBe1ydQMMqik5gXESbDdDu3yuM/iJMZIo3aUFc=;
 b=NntryFEIxqILmwbWT5ehIxLXmx1SuFLmViEKDsbPQCCBwb4+8zXOGqSHck8kjazX7NfzVy
 BAq8mViisthfbqAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5016B1390C;
 Tue, 17 Jan 2023 16:52:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3ODxEkrSxmMEewAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 17 Jan 2023 16:52:26 +0000
Date: Tue, 17 Jan 2023 17:52:25 +0100
Message-ID: <874jsp6r3q.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
In-Reply-To: <Y8bRmWMBVFVk0WZc@mail-itl>
References: <Y5MssNfvE+mUyyZR@mail-itl> <Y5PaF4LhQGIrKthy@mail-itl>
 <Y5SxJ3IkhHSC/Psu@mail-itl> <87o7rv507o.wl-tiwai@suse.de>
 <Y6sOvyYwuR8Pu0wj@mail-itl> <87bkmya2zk.wl-tiwai@suse.de>
 <87tu0p8uda.wl-tiwai@suse.de> <Y8aIPPcPuDeNkVEy@mail-itl>
 <Y8au5JiQ3w1YPZ8d@mail-itl> <87tu0p6xix.wl-tiwai@suse.de>
 <Y8bRmWMBVFVk0WZc@mail-itl>
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

On Tue, 17 Jan 2023 17:49:28 +0100,
Marek Marczykowski-Górecki wrote:
> 
> On Tue, Jan 17, 2023 at 03:33:42PM +0100, Takashi Iwai wrote:
> > On Tue, 17 Jan 2023 15:21:23 +0100,
> > Marek Marczykowski-Górecki wrote:
> > > 
> > > On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marczykowski-Górecki wrote:
> > > > On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai wrote:
> > > > > On Mon, 16 Jan 2023 16:55:11 +0100,
> > > > > Takashi Iwai wrote:
> > > > > > 
> > > > > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > 
> > > > > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrote:
> > > > > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > 
> > > > > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > > > > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Under Xen PV dom0, with Linux >= 5.17, sound stops working after few
> > > > > > > > > > > > > hours. pavucontrol still shows meter bars moving, but the speakers
> > > > > > > > > > > > > remain silent. At least on some occasions I see the following message in
> > > > > > > > > > > > > dmesg:
> > > > > > > > > > > > > 
> > > > > > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (18144 >= 6396); disabling LPIB delay counting
> > > > > > > > > > 
> > > > > > > > > > Hit the issue again, this message did not appear in the log (or at least
> > > > > > > > > > not yet).
> > > > > > > > > > 
> > > > > > > > > > (...)
> > > > > > > > > > 
> > > > > > > > > > > > In anyway, please check the behavior with 6.1-rc8 + the commit
> > > > > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > > > > > >     ALSA: memalloc: Allocate more contiguous pages for fallback case
> > > > > > > > > > > > from for-next of my sound git tree (which will be in 6.2-rc1).
> > > > > > > > > > 
> > > > > > > > > > This did not helped.
> > > > > > > > > > 
> > > > > > > > > > > Looking at the mentioned commits, there is one specific aspect of Xen PV
> > > > > > > > > > > that may be relevant. It configures PAT differently than native Linux.
> > > > > > > > > > > Theoretically Linux adapts automatically and using proper API (like
> > > > > > > > > > > set_memory_wc()) should just work, but at least for i915 driver it
> > > > > > > > > > > causes issues (not fully tracked down yet). Details about that bug
> > > > > > > > > > > report include some more background:
> > > > > > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> > > > > > > > > > > 
> > > > > > > > > > > Anyway, I have tested it on a Xen modified to setup PAT the same way as
> > > > > > > > > > > native Linux and the audio issue is still there.
> > > > > > > > > > > 
> > > > > > > > > > > > If the problem persists, another thing to check is the hack below
> > > > > > > > > > > > works.
> > > > > > > > > > 
> > > > > > > > > > Trying this one now.
> > > > > > > > > 
> > > > > > > > > And this one didn't either :/
> > > > > > > > 
> > > > > > > > (Sorry for the late reply, as I've been off in the last weeks.)
> > > > > > > > 
> > > > > > > > I think the hack doesn't influence on the PCM buffer pages, but only
> > > > > > > > about BDL pages.  Could you check the patch below instead?
> > > > > > > > It'll disable the SG-buffer handling on x86 completely. 
> > > > > > > 
> > > > > > > This seems to "fix" the issue, thanks!
> > > > > > > I guess I'll run it this way for now, but a proper solution would be
> > > > > > > nice. Let me know if I can collect any more info that would help with
> > > > > > > that.
> > > > > > 
> > > > > > Then we seem to go back again with the coherent memory allocation for
> > > > > > the fallback sg cases.  It was changed because the use of
> > > > > > dma_alloc_coherent() caused a problem with IOMMU case for retrieving
> > > > > > the page addresses, but since the commit 9736a325137b, we essentially
> > > > > > avoid the fallback when IOMMU is used, so it should be fine again.
> > > > > > 
> > > > > > Let me know if the patch like below works for you instead of the
> > > > > > previous hack to disable SG-buffer (note: totally untested!)
> > > > > 
> > > > > Gah, there was an obvious typo, scratch that.
> > > > > 
> > > > > Below is a proper patch.  Please try this one instead.
> > > > 
> > > > Thanks, I'll give it a try.
> > > 
> > > Unfortunately, it doesn't help, it stopped working again, after about 3h
> > > uptime.
> > 
> > Aha, then it might be rather other way round;
> > dma_alloc_noncontiguous() doesn't work on Xen properly.
> > 
> > Could you try the one below instead of the previous?
> 
> Unfortunately, this one doesn't fix it either :/

Hmm.  Then how about applying both of the last two patches?  The last
one to enforce the fallback allocation and the previous one to use
dma_alloc_coherent().  It should be essentially reverting to the old
way.


Takashi
