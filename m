Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F390D1F39FC
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 13:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9183716A8;
	Tue,  9 Jun 2020 13:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9183716A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591702967;
	bh=DvP+eiGbN/joLZqWcQBwRhmjit6JufckPTFS21InOoc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U62zeNdpE4f2oOHY4/DcL6owlSIUNrItvCDmz6Xjh4eSeCl4nAzG+2Wgz9Ia57gKE
	 0rFvx1OF4FL3ZHFzlQewjSLtbFtRxwj+4ZUEahCmaN9rupg8i3gKiHjjmyXiuHzrDn
	 nrbtu3uC3ytXz+8syv26h/hLl/6GwoG/tJ997lVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B190FF80278;
	Tue,  9 Jun 2020 13:41:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1552FF8028C; Tue,  9 Jun 2020 13:41:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EAB3F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 13:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EAB3F80124
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9D76568AFE; Tue,  9 Jun 2020 13:40:59 +0200 (CEST)
Date: Tue, 9 Jun 2020 13:40:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: next-0519 on thinkpad x60: sound related? window manager crash
Message-ID: <20200609114059.GA1228@lst.de>
References: <1591624340.z01ejtod28.none@localhost>
 <alpine.DEB.2.22.394.2006081928070.148886@chino.kir.corp.google.com>
 <20200609054306.GA9606@lst.de> <s5hsgf4irzt.wl-tiwai@suse.de>
 <20200609084305.GA21671@lst.de> <s5hlfkwip1h.wl-tiwai@suse.de>
 <20200609091727.GA23814@lst.de> <s5hh7vkio0n.wl-tiwai@suse.de>
 <20200609113123.GA547@lst.de> <s5h3674ii49.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h3674ii49.wl-tiwai@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: alsa-devel@alsa-project.org, x86@kernel.org, hpa@zytor.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>,
 hch@infradead.org, mingo@redhat.com, bp@alien8.de, Pavel Machek <pavel@ucw.cz>,
 David Rientjes <rientjes@google.com>, tglx@linutronix.de,
 Christoph Hellwig <hch@lst.de>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jun 09, 2020 at 01:38:46PM +0200, Takashi Iwai wrote:
> On Tue, 09 Jun 2020 13:31:23 +0200,
> Christoph Hellwig wrote:
> > 
> > On Tue, Jun 09, 2020 at 11:31:20AM +0200, Takashi Iwai wrote:
> > > > > How would be a proper way to get the virtually mapped SG-buffer pages
> > > > > with coherent memory?  (Also allowing user-space mmap, too)
> > > > 
> > > > dma_mmap_coherent / dma_mmap_attrs for userspace.  We don't really
> > > > have a good way for kernel space mappings.
> > > 
> > > And that's the missing piece right now...  :-<
> > 
> > Can you point me to the relevant places (allocation and vmap mostly)
> > so that I can take a look at how to fix this mess?
> 
> Found in sound/core/sgbuf.c.  It's specific to x86.

So it looks like we could just turn off CONFIG_SND_DMA_SGBUF and
be done with it?  After all this works on other architectures
just fine..
