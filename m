Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F366E0D3
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 15:34:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 256C2652A;
	Tue, 17 Jan 2023 15:34:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 256C2652A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673966092;
	bh=fieUxPoa2F+7WuAa9U/Hl1w0iH0y2dKt1mEFMIFDzOY=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bN8HyQAqCqZOzBk7J8NogKk5Z1bkV/4+LugJFc7veSvFoCt+dTK/eMYTxmc8EVKZo
	 U6ZCqaNeNgBHcIBJpHA9X115w+XEkvvFEhKbuselGAw8VkN5hapMwe9MIYcvtEaaaw
	 9U3oGQvhAcz/MnI3GboWRTQgUNmdrNg1iy9Zo3QI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C68CAF804DE;
	Tue, 17 Jan 2023 15:33:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12736F8047B; Tue, 17 Jan 2023 15:33:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD188F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 15:33:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD188F8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=dQg/7Cn2; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YeXWrg2F
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E529386EC;
 Tue, 17 Jan 2023 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673966023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOWvbQxV86BPByVhx38GAmMRWDHbT9IqXk6xEQSHQbE=;
 b=dQg/7Cn217sYSDENe80ODuFk83nocHPYEELd/9sJsLCeUcbWfRgNqShZojULeeVACikCvp
 eJfvcdpFhc25xwzSe1cQ9D5ZQW2d+tu2aaLPJbdbFx8RVOqui2J5Wj0VbiHmP017zPrSaG
 12kbud8IMseJ8rTlSg2xl6p8WAX8Z8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673966023;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOWvbQxV86BPByVhx38GAmMRWDHbT9IqXk6xEQSHQbE=;
 b=YeXWrg2FbtP4jKRVYTe6Oqn3Wv310VbcuPp41I0CXyezqyWl43oP2ZTO2XnHoU/SCdGUhr
 b2ueaku63Q1DbtDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B60E13357;
 Tue, 17 Jan 2023 14:33:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OgQqFcexxmPHLAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 17 Jan 2023 14:33:43 +0000
Date: Tue, 17 Jan 2023 15:33:42 +0100
Message-ID: <87tu0p6xix.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Marek =?ISO-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
In-Reply-To: <Y8au5JiQ3w1YPZ8d@mail-itl>
References: <Y5KPAs6f7S2dEoxR@mail-itl> <87tu256lqs.wl-tiwai@suse.de>
 <Y5MssNfvE+mUyyZR@mail-itl> <Y5PaF4LhQGIrKthy@mail-itl>
 <Y5SxJ3IkhHSC/Psu@mail-itl> <87o7rv507o.wl-tiwai@suse.de>
 <Y6sOvyYwuR8Pu0wj@mail-itl> <87bkmya2zk.wl-tiwai@suse.de>
 <87tu0p8uda.wl-tiwai@suse.de> <Y8aIPPcPuDeNkVEy@mail-itl>
 <Y8au5JiQ3w1YPZ8d@mail-itl>
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

On Tue, 17 Jan 2023 15:21:23 +0100,
Marek Marczykowski-Górecki wrote:
> 
> On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marczykowski-Górecki wrote:
> > On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai wrote:
> > > On Mon, 16 Jan 2023 16:55:11 +0100,
> > > Takashi Iwai wrote:
> > > > 
> > > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > > Marek Marczykowski-Górecki wrote:
> > > > > 
> > > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrote:
> > > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > 
> > > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > > Marek Marczykowski-Górecki wrote:
> > > > > > > > > > > 
> > > > > > > > > > > Hi,
> > > > > > > > > > > 
> > > > > > > > > > > Under Xen PV dom0, with Linux >= 5.17, sound stops working after few
> > > > > > > > > > > hours. pavucontrol still shows meter bars moving, but the speakers
> > > > > > > > > > > remain silent. At least on some occasions I see the following message in
> > > > > > > > > > > dmesg:
> > > > > > > > > > > 
> > > > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (18144 >= 6396); disabling LPIB delay counting
> > > > > > > > 
> > > > > > > > Hit the issue again, this message did not appear in the log (or at least
> > > > > > > > not yet).
> > > > > > > > 
> > > > > > > > (...)
> > > > > > > > 
> > > > > > > > > > In anyway, please check the behavior with 6.1-rc8 + the commit
> > > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > > > >     ALSA: memalloc: Allocate more contiguous pages for fallback case
> > > > > > > > > > from for-next of my sound git tree (which will be in 6.2-rc1).
> > > > > > > > 
> > > > > > > > This did not helped.
> > > > > > > > 
> > > > > > > > > Looking at the mentioned commits, there is one specific aspect of Xen PV
> > > > > > > > > that may be relevant. It configures PAT differently than native Linux.
> > > > > > > > > Theoretically Linux adapts automatically and using proper API (like
> > > > > > > > > set_memory_wc()) should just work, but at least for i915 driver it
> > > > > > > > > causes issues (not fully tracked down yet). Details about that bug
> > > > > > > > > report include some more background:
> > > > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> > > > > > > > > 
> > > > > > > > > Anyway, I have tested it on a Xen modified to setup PAT the same way as
> > > > > > > > > native Linux and the audio issue is still there.
> > > > > > > > > 
> > > > > > > > > > If the problem persists, another thing to check is the hack below
> > > > > > > > > > works.
> > > > > > > > 
> > > > > > > > Trying this one now.
> > > > > > > 
> > > > > > > And this one didn't either :/
> > > > > > 
> > > > > > (Sorry for the late reply, as I've been off in the last weeks.)
> > > > > > 
> > > > > > I think the hack doesn't influence on the PCM buffer pages, but only
> > > > > > about BDL pages.  Could you check the patch below instead?
> > > > > > It'll disable the SG-buffer handling on x86 completely. 
> > > > > 
> > > > > This seems to "fix" the issue, thanks!
> > > > > I guess I'll run it this way for now, but a proper solution would be
> > > > > nice. Let me know if I can collect any more info that would help with
> > > > > that.
> > > > 
> > > > Then we seem to go back again with the coherent memory allocation for
> > > > the fallback sg cases.  It was changed because the use of
> > > > dma_alloc_coherent() caused a problem with IOMMU case for retrieving
> > > > the page addresses, but since the commit 9736a325137b, we essentially
> > > > avoid the fallback when IOMMU is used, so it should be fine again.
> > > > 
> > > > Let me know if the patch like below works for you instead of the
> > > > previous hack to disable SG-buffer (note: totally untested!)
> > > 
> > > Gah, there was an obvious typo, scratch that.
> > > 
> > > Below is a proper patch.  Please try this one instead.
> > 
> > Thanks, I'll give it a try.
> 
> Unfortunately, it doesn't help, it stopped working again, after about 3h
> uptime.

Aha, then it might be rather other way round;
dma_alloc_noncontiguous() doesn't work on Xen properly.

Could you try the one below instead of the previous?


Takashi

-- 8< --
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -538,11 +538,11 @@ static const struct snd_malloc_ops snd_dma_wc_ops = {
  */
 static void *snd_dma_noncontig_alloc(struct snd_dma_buffer *dmab, size_t size)
 {
-	struct sg_table *sgt;
+	struct sg_table *sgt = NULL;
 	void *p;
 
-	sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
-				      DEFAULT_GFP, 0);
+	// sgt = dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
+	//			      DEFAULT_GFP, 0);
 #ifdef CONFIG_SND_DMA_SGBUF
 	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
 		if (dmab->dev.type == SNDRV_DMA_TYPE_DEV_WC_SG)
