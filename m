Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6873AB0EC
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 12:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E05E1708;
	Thu, 17 Jun 2021 12:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E05E1708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623924401;
	bh=AnzHO6QtIYC7jcQgLCgKctN26Wod6SOj5O+EwgJ5Ols=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BDY1nmyvUnBApGRRGqMJkoK6FXL3Tj2oWwPhbeqcpd59a6b+FE0fm3koj27MhR0fA
	 JREy2bgDtfomQE0D2qa0by5fpyZ44QQkCy9+WbAuj4dWwp6EQJAY2Kj99oCJDf0Eem
	 JkhpiAci8XzYNvwkMGR3cYwCmKpO6Cp2QDyo9nCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D4D3F804D8;
	Thu, 17 Jun 2021 12:04:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 393CEF8049E; Thu, 17 Jun 2021 12:04:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3448F8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 12:04:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3448F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="z3i7eNvx"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tBZuFjEl"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id CB6B6169C;
 Thu, 17 Jun 2021 06:04:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 17 Jun 2021 06:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=+dPn6PVWaHHCQnOr2QLQefxdOLA
 acaxsHkk35to4F6M=; b=z3i7eNvx/wvy5SkUjUbbBxCCzkemnzcNvn119br0hjE
 lNKscol186cdBrLmDbRTucDKKvtMG06Cpy3R8eFvgOr/WG5Ck/uGftr+BzEs+KEP
 ABX9P7NDajgefsGFInRw9Fs4xs7nO0hxFMP91DNt9wHePPjz+FAf2zM51XyZ8lH2
 uOfmTPdFKaAgXBol+dSXEwDws8WFRlaP0YLGtrNCaJ616nG32Guu1WxTe62dkG11
 KXcfCMlw/ozAc6HG35He/OmCA5MJRz6nvUGUIcTqsXJ8TNb5VgXGBFuZFpa/dfib
 UdyhGwEk53b8j4V6DhlRwVSa032Dj/P+l7uznVgO/FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=+dPn6P
 VWaHHCQnOr2QLQefxdOLAacaxsHkk35to4F6M=; b=tBZuFjEl4IEyvS1Ctb40Bw
 iuM0K9txJM5h+P4iTH33Zuau7DMVKIJTgo6EtUeLUJmbWYPgJjKah9sfQmKokFSw
 IdgdGCVIeS1wryR6M5nBZCgKnviwRCFj6L2Ai2VPEi267dfonH6uCzHOQeIa6h3g
 ViFhJzz8tk9xaBg7m2Z15GM1MXPhLSbbNStKXWXj3nzuhu1Tm4SrpbQlse99ipbP
 Q9tp3yZEjnuMp0c7YxUFdaXJGOZZr29jrBev6moGcKCmYaOaon3YMkl830ka5cRw
 keaS0LFNblrA9CZq1HWYIfYUSAqK/YQtbr4pskisceXpO6+7QaKh2V61Ze3LTwZQ
 ==
X-ME-Sender: <xms:Dx7LYN-n-CAkDVqUTC1jDpx5K6_4SZzPvKXEfonjf5tKcmhy7dxWjA>
 <xme:Dx7LYBvwO9wpjCvCrzFw3m6vvBRKeQ0xMXN49UqSMwhp6utlSmLx5pQXeutzVYrTn
 c6rxDPwY6uakch6B-g>
X-ME-Received: <xmr:Dx7LYLDVgVll0lIoaQeOPn5QpLF88gW8scVEXSc_xtyaNJPtp1ul2NhzEjw6njehB5ed3cCYcWLfM-0o2Q8H4xU1UKsFYHTugg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpefhhfdvjeevffekieffhfeuudefkeekgfdtvdetgeeg
 heegleejudfhvdfhjedvkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Dx7LYBeIZ6XTiNa6cj5kH6A3SArR5aOtVwXRXIlAJaLS3D_TJpfLmw>
 <xmx:Dx7LYCNg0RSzKC7fgje0zrn23V32eo-zBq6oGznetlExERH406Ywww>
 <xmx:Dx7LYDn9r3SazAQDn6QSLW0SqQUAuw6nbNS8rKWheUoWYHf402lSPQ>
 <xmx:EB7LYE3fiK_pcHLOXNkhpIzFwBpMCWRtKlOuklndmklytCKoCAiEFw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 06:03:58 -0400 (EDT)
Date: Thu, 17 Jun 2021 19:03:55 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/2] ALSA: firewire-motu: add support for MOTU 828 and 896
Message-ID: <YMseCwhRcbSsneZo@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20210616082847.124688-1-o-takashi@sakamocchi.jp>
 <s5hfsxgzv9m.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hfsxgzv9m.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

On Thu, Jun 17, 2021 at 11:37:57AM +0200, Takashi Iwai wrote:
> On Wed, 16 Jun 2021 10:28:45 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > This patchset is to add support for Mark of the unicorn (MOTU) 828 and
> > 896, which were shipped two decades ago (2001) and already discontinued.
> > (yes, it's 2021).
> > 
> > It's reasonable to count them as first generation of MOTU FireWire
> > series since they are based on QuickLogic QuickRAM FPGA apart from
> > Altera or Xilinx FPGA in the latter generation. Unlike the latter
> > generation, they doesn't allow software to configure internal
> > multiplexer.
> > 
> > I note that the sequence replay for media clock recovery[1] allows to
> > support them. The device doesn't generate better sound with nominal (ideal)
> > sequence of packets, thus the patches should be applied to development
> > tree for v5.14 kernel.
> > 
> > [1] [PATCH 0/3] ALSA: firewire-motu: media clock recovery for sph-aware devices
> > https://lore.kernel.org/alsa-devel/20210602013406.26442-1-o-takashi@sakamocchi.jp/
> > 
> > Takashi Sakamoto (2):
> >   ALSA: firewire-motu: add support for MOTU 828
> >   ALSA: firewire-motu: add support for MOTU 896
> 
> Applied both patches now.  Thanks.

Thanks for applying them.

I'm glad if getting your care of below fix:

[PATCH] ALSA: firewire-motu: fix stream format for MOTU 8pre FireWire
 * https://lore.kernel.org/alsa-devel/20210614083133.39753-1-o-takashi@sakamocchi.jp/


Thanks

Takashi Sakamoto
