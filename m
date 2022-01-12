Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A45D848BDC5
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 04:52:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 343D21931;
	Wed, 12 Jan 2022 04:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 343D21931
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641959568;
	bh=Rpu2udWKXMhE+xvszYC5p3o4VSzF9QGBXNgCZuFtwyE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UDOJKLz5ySTO62Z1/e9FkUMQL3RDVbJxyEuPfuBJq21aeF/cr0ITxMkTstUISbXl8
	 8bnJCZ8PqLJud9lwWjg+f88sCcyRWWz+nnm2+ZI1FObwNuvZhBVGqL89OM0fNEv/3e
	 c4hb3+D2Gu/nMkowiNV/d6DSslEAPiYk2Y0c/PUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5F15F80054;
	Wed, 12 Jan 2022 04:51:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A996F8026A; Wed, 12 Jan 2022 04:51:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FCEDF80054
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 04:51:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FCEDF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Mycbv/xm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="kmP4fLlO"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BA76E320167D;
 Tue, 11 Jan 2022 22:51:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 11 Jan 2022 22:51:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=cPPCjW0++zs5j1BPECt8fbcKsS3
 R/TgbbewmfZx6kS0=; b=Mycbv/xmkNCGIvmdvQRqd5qmGXjmN22OACHXD3vEihP
 +wZ9PiGK7MtO/eKtnqwHZQH7s3HsbgS4Hq7F79wABVSaFTDICaMOcgZtxoakP7Yr
 7IYxz+TmJPNj5fnzaVCl/qv6x9g1jJ2AwzSDMsqK6elihGLO1HYV5sfItMzgBPi7
 kZVXaxChxsx5YcKKa5VieU8evfVtSGC+/xqiSul3sBgIxPdXnkvW1kGOOaGhHvIP
 N42x3WTsjT5TcwpbPSiR/be5lB6aIShtDIS9pcnRd4JdpaE1Art4smCFz6sMwuNc
 mG0cqcN5isN3PhQv3bjyqBxa4C1zpE4UumFxwPgPKwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cPPCjW
 0++zs5j1BPECt8fbcKsS3R/TgbbewmfZx6kS0=; b=kmP4fLlO7ppe2GRHsMlvON
 qfHmAQENdYCE+z6g9W9LIH7rg1ZCN67Qx5zAUqtwY8+ozh+2K6kGHqQIvZLNEfXo
 9bKh5+LP97KwSDH9VzYWLGT0i/uYpFXb66WYJul+3K0CvS9/mI6vVdqtymLDQHrR
 AuJ8jq6YWC3ic4a/wX70gl00dwqKfcfXTRgQ8gWRsiRtBZ+T/C4FTyi02YKYAzn2
 ErJvvxreRAjCMj55CaCrxyJhZcNLqtfjZzKhFNSrXM6N6uSIovRU8r4lMeQ3p3Jk
 hYyslVdn0IaKzoeIkf66UbMC0P/kuyeh+qa3eV7iOwe8VXYqFcEyyUEn5F9l6G8A
 ==
X-ME-Sender: <xms:O1DeYTI9JtqiTyLBk3hklhpMyh1A-8T314X4NJUfChZYb-Pwnv2LqQ>
 <xme:O1DeYXIWUUvJd4g8oUFebDJrhsdYZBho3Ac22tCqfCL2W9z6BzmYQiWrzINQ_F9tv
 BA-3zapAQVPDJzTrHI>
X-ME-Received: <xmr:O1DeYbtSKXC4tSgdfW8Vzb02NBfq8EmKh2UQH4Ad7OZRCGsMbGDqLHaItSvKe8QwIkf53vxa0PEYrUoh0_jZSIGZ1Zj9XqFmhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehgedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepjeegieefue
 evueefieeggeejledvgfejgeffjefgvdekleehgfdtfeetjeelkeejnecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:O1DeYcanM5X5wgDAWQGKg709O0DgC6iL2S_wP6CkE1_nSrh5rBAfNA>
 <xmx:O1DeYaYXhoq_-EX_RbkYJya82uhHoHkGwC3OjWk7r8VTlQ9904_jRQ>
 <xmx:O1DeYQDSRbYnQ5gQRqW2UYGdWXC8tOpv6rP8lj19Q3CpjIgFtduxqg>
 <xmx:PFDeYaF3FhyFtbVWrwImjfHw8nRRsk9yjqSuJ8lI2vAigi6JH7wI0g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Jan 2022 22:51:21 -0500 (EST)
Date: Wed, 12 Jan 2022 12:51:18 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: stefanr@s5r6.in-berlin.de, alsa-devel@alsa-project.org,
 linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 marcan@marcan.st
Subject: Re: [PATCH 0/3] firewire: assist unit driver to compute packet
 timestamp
Message-ID: <Yd5QNs/YnvzGOy0g@workstation>
Mail-Followup-To: stefanr@s5r6.in-berlin.de, alsa-devel@alsa-project.org,
 linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 marcan@marcan.st
References: <20211202113457.24011-1-o-takashi@sakamocchi.jp>
 <YcGycqUrptkWYeOV@workstation> <YdgdfrcvhJrUXwYF@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdgdfrcvhJrUXwYF@workstation>
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

Hi Stefan,

I'm sorry to post messages several times for the patchset if you are
still busy. But I'm still waiting for any reaction.

I note that Linus have announced merge window for v5.17 kernel.
 * https://lore.kernel.org/lkml/CAHk-=wgUkBrUVhjixy4wvrUhPbW-DTgtQubJWVOoLW=O0wRKMA@mail.gmail.com/T/#u

I'm glad if seeing your action for pull request as a response to the
window.


Kind Regards

Takashi Sakamoto

On Fri, Jan 07, 2022 at 08:01:18PM +0900, Takashi Sakamoto wrote:
> Hi Stefan,
> 
> Wishing you a happy new year.
> 
> We are in the last week for release of v5.16 kernel, and soon merge
> window for v5.17 kernel will be opened if thing goes well. I wish any
> action for the review process to merge these patches into upstream.
> 
> 
> Thanks
> 
> Takashi Sakamoto
> 
> On Tue, Dec 21, 2021 at 07:54:42PM +0900, Takashi Sakamoto wrote:
> > Hi Stefan,
> > 
> > Thank you for your long effort to maintain Linux FireWire subsystem. I'd
> > like to use the timestamp function for my integration in ALSA firewire
> > stack planned at next version of Linux kernel. I'm glad if getting to
> > your help for upstreaming.
> > 
> > On Thu, Dec 02, 2021 at 08:34:54PM +0900, Takashi Sakamoto wrote:
> > > Hi,
> > > 
> > > In 1394 OHCI specification, each descriptor of IR/IT/AR/AT DMA context
> > > has timeStamp field. The value of timeStamp field express the time in
> > > which the controller accept packet. The resolution of value is isochronous
> > > cycle count (8,000 Hz) with second up to 7.
> > > 
> > > I have a plan to use the value of timeStamp field for ALSA firewire stack
> > > so that userspace ALSA PCM/Rawmidi applications can get converted timestamp
> > > (ktime) for PCM frame/MIDI message. The timestamp can ideally express
> > > finer granularity than the time to invoke IRQ handler (and co).
> > > 
> > > Current implementation of Linux FireWire subsystem delivers the value of
> > > timeStamp field to unit driver for IR/IT/AT DMA context, but not for AR
> > > DMA context. Additionally, the way to refer to Isochronous Cycle Timer
> > > Register in MMIO region of 1394 OHCI controller is transaction to local
> > > node. It includes overhead of transaction and it's preferable to add
> > > less-overhead way available in any type of IRQ context.
> > > 
> > > This patchset adds two functions exposed in kernel space:
> > > 
> > >  * fw_card_read_cycle_time()
> > >     * allow unit driver to access to CYCLE_TIME register in MMIO region
> > >       without initiate transaction
> > >  * fw_request_get_timestamp()
> > >     * allow unit driver to get timestamp of request packet inner request
> > >       handler
> > > 
> > > I note that Hector Martin found kernel null pointer dereference during
> > > process to remove PCI card and has posted a patch:
> > > 
> > >  * https://lore.kernel.org/lkml/20211027113130.8802-1-marcan@marcan.st/
> > > 
> > > His patch is included in the series with my comment for relevant commit
> > > 20802224298c ("firewire: core: add forgotten dummy driver methods, remove
> > > unused ones"). The patch is required since unit driver can refer to dummy
> > > driver between removal callback of PCI subsystem and removal callback of
> > > FireWire subsystem.
> > > 
> > > Hector Martin (1):
> > >   firewire: Add dummy read_csr/write_csr functions
> > > 
> > > Takashi Sakamoto (2):
> > >   firewire: add kernel API to access CYCLE_TIME register
> > >   firewire: add kernel API to access packet structure in request
> > >     structure for AR context
> > > 
> > >  drivers/firewire/core-card.c        | 39 +++++++++++++++++++++++++++++
> > >  drivers/firewire/core-cdev.c        |  6 +++--
> > >  drivers/firewire/core-transaction.c | 18 +++++++++++++
> > >  include/linux/firewire.h            |  3 +++
> > >  4 files changed, 64 insertions(+), 2 deletions(-)
> > > 
> > > -- 
> > > 2.32.0
> > 
> > 
> > Sincerely yours
> > 
> > Takashi Sakamoto
