Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB078F03B3
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 18:04:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F60016ED;
	Tue,  5 Nov 2019 18:03:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F60016ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572973456;
	bh=2iNofPldfrzl2AoEkkoIknej1llMVlm12qNkrtf0khE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j/IqHMgvQKaeNBhLh60hGUDimZi64tEQDeQzPrJQWyjgiop0mMP6478r1wVii+7VP
	 KvxCiCn/4vfSbk3bLSLlsFoMvt7pRSITKxi02owYe0HJd3s1c0mENgoiPuK7D6OLQa
	 qTlyPs9D9xa5JS3W04NgxdCIvkTqK7xxved+C76g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 543A5F80446;
	Tue,  5 Nov 2019 18:02:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8916CF8049B; Tue,  5 Nov 2019 18:02:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F6E6F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 18:02:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F6E6F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="Dw6+oQEz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4M+7ichyAPZEL6AESNwqcRIL14sHkJnW8d2rfDweu/0=; b=Dw6+oQEzEFReVJQml0Asy6oh0
 T3z3EyQgXsbUzLtjYdFQ69Sq8UO5hU41wPBAx3fhEppAxsCLA7ypcn2HisHMbW12DhzFcNB44zyjM
 MwNaDqAsLTjixnMgDY2NAfJNglArprsc4qLNLAPh07uputNHEoK86WnYYFj7HI/SGadXisw2i5rFh
 BBjMQEPDQDYJAepORE836rAWtiefmDuy1e10fuCcRLyCR/daTbdW+CqQ5560e/GQOZZiaqomNlod4
 wDOqKOiQBq+iuCyU7cQgUm9DougmHnmRciZuufdl4+70SZ2uPPsOYgizGorXotoNxLk6Gy1IvleNx
 x04qouMww==;
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:59730)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1iS2DX-0007ce-31; Tue, 05 Nov 2019 17:02:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1iS2DT-0003E6-Oe; Tue, 05 Nov 2019 17:02:03 +0000
Date: Tue, 5 Nov 2019 17:02:03 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191105170203.GR25745@shell.armlinux.org.uk>
References: <s5heeymbvva.wl-tiwai@suse.de>
 <6ad19121-c0e3-d278-2943-ff93ef80353b@baylibre.com>
 <20191105160215.GQ25745@shell.armlinux.org.uk>
 <s5hh83ith93.wl-tiwai@suse.de> <s5heeymtgr9.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5heeymtgr9.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [alsa-devel] Incorrect buffer handling in dw-hdmi bridge audio
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Nov 05, 2019 at 05:44:26PM +0100, Takashi Iwai wrote:
> On Tue, 05 Nov 2019 17:33:44 +0100,
> Takashi Iwai wrote:
> > 
> > On Tue, 05 Nov 2019 17:02:15 +0100,
> > Russell King - ARM Linux admin wrote:
> > > 
> > > On Tue, Nov 05, 2019 at 09:07:43AM +0100, Neil Armstrong wrote:
> > > > Hi,
> > > > 
> > > > On 05/11/2019 08:55, Takashi Iwai wrote:
> > > > > Hi,
> > > > > 
> > > > > while recently working on the ALSA memory allocator API cleanup, I
> > > > > noticed that dw-hdmi bridge driver seems doing weird about the buffer
> > > > > management.  It pre-allocates the usual device buffers fully at the
> > > > > probe time, while each stream allocates the buffer via the vmalloc
> > > > > helpers and replaces with it at each open.
> > > > > 
> > > > > I guess it's no expected behavior?  It's basically a full waste of
> > > > > resources, and the vmalloc buffer isn't guaranteed to work well for
> > > > > mmap on every architecture.
> > > > > 
> > > > > Below is the patch to address it.  Can anyone check whether this still
> > > > > works?
> > > > 
> > > > I don't have the setup to check, but this has been pushed by Russell I Added in CC.
> > > > 
> > > > I also added the imx maintainer since it's (AFAIK) only used on iMX SoCs.
> > > > 
> > > > Neil
> > > > 
> > > > > 
> > > > > Since I have a cleanup series and this is involved, I'd like to take
> > > > > the fix through my tree once after it's confirmed (and get ACK if
> > > > > possible).
> > > > > 
> > > > > 
> > > > > Thanks!
> > > > > 
> > > > > Takashi
> > > > > 
> > > > > -- 8< --
> > > > > From: Takashi Iwai <tiwai@suse.de>
> > > > > Subject: [PATCH] drm/bridge: dw-hdmi: Fix the incorrect buffer allocations
> > > > > 
> > > > > The driver sets up the buffer preallocation with SNDRV_DMA_TYPE_DEV,
> > > > > while it re-allocates and releases vmalloc pages.  This is not only a
> > > > > lot of waste resources but also causes the mmap malfunction.
> > > > > 
> > > > > Change / drop the vmalloc-related code and use the standard buffer
> > > > > allocation / release code instead.
> > > 
> > > I think getting rid of the vmalloc code here is a mistake - I seem to
> > > remember using the standard buffer allocation causes failures, due to
> > > memory fragmentation.  Since the hardware is limited to DMA from at
> > > most one page, there is no reason for this driver to require contiguous
> > > pages, hence why it's using - and should use - vmalloc pages.  vmalloc
> > > is way kinder to the MM subsystem than trying to request large order
> > > contiguous pages.
> > > 
> > > So, NAK on this patch.
> > 
> > OK, then we should do other way round, rather drop the buffer
> > preallocation instead.  Currently vmalloc buffer is always allocated
> > at each open and overrides the preallocated buffer, so the whole 64k
> > and more are wasted for no use.
> > 
> > (BTW, the current code has this snippet:
> > 
> > 	/* Limit the buffer size to the size of the preallocated buffer */
> > 	ret = snd_pcm_hw_constraint_minmax(runtime,
> > 					   SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
> > 					   0, substream->dma_buffer.bytes);
> > 
> > ... and this would have to limit the buffer size only to the
> > preallocated size -- which essentially makes the argument above
> > invalid.  However, this check looks actually bogus, the constraint
> > parameter should be SNDRV_PCM_HW_PARAM_BUFFER_BYTES, not _SIZE.  It
> > might be the reason it worked somehow...)
> > 
> > So below is the revised patch.  Could you guys check it again?
> > 
> > There I copied the comment as is, although the 512k mentioned there
> > looks inconsistent with the actual code.  Should it be 1M?
> 
> ... and reading the patch again, I found that the hw constraint call
> can be dropped as well.  The dw_hdmi_hw definition already contains
> the max buffer size.
> 
> Below is the re-revised patch.  Please check it.

I was slightly wrong - sorry.  It's been a long time since I looked at
this driver, or even used it - but it is the only driver that supports
HDMI audio on iMX6 platforms, so I guess there are lots of users out
there... or maybe not if none of them use mainline kernels.

The hardware is capable of reading across a page.  However, the hardware
is _not_ capable of reading any data that is formatted as ALSA APIs
allow it to be.  The driver has to reformat the ALSA supplied sound
buffers to the layout the hardware requires.

To do this, we have two different buffers:

- The substream buffer is the buffer which the hardware reads from.
- The runtime buffer is the buffer which ALSA uses.

The call to snd_pcm_lib_preallocate_pages_for_all() allocates the
hardware buffer, which is a single contiguous buffer of fixed size.

The user buffer is allocated with snd_pcm_lib_alloc_vmalloc_buffer().

Hence, the driver makes use of both.  You can't get rid of either
of them.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
