Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B64FB26456F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 13:46:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 326E8168F;
	Thu, 10 Sep 2020 13:45:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 326E8168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599738362;
	bh=bTEkbH6HW2DF1vdX3JYDJeAfUG5HiHQcw2e4k35usng=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PcEtmAfGxgPbTja2eXJOYlNmlYxLKTheT2/JBBqDX85r3KjcVCgFkzridbDeS8fLK
	 zUMDtFVwQ+MDGDOkq0J5A3FBNOSIUHbr4qSew3RIEj/hs7HRP+7jz2lN3VdACnALBo
	 zeQtxxmkpLwZXOfa1TWmM0PIqq/49y2oypEPat6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CC69F8026F;
	Thu, 10 Sep 2020 13:44:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4C0FF80264; Thu, 10 Sep 2020 13:44:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCCAEF800E9
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 13:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCCAEF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="is4L3/we"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="N9nu+XDe"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 15634A63;
 Thu, 10 Sep 2020 07:44:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 10 Sep 2020 07:44:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=L6aec+5VNbg1vuEtr0xqvRZBfyk
 s20mU6sou+wJVr80=; b=is4L3/welnEADmGHMW7dOsdulV5uq8EMbOE7hRlp5XM
 tJXb44jh0k9Q6qWn6M/oKft4ZjZvz2PXqh6y/vnwdkinPbInJcd4biLK3SfJ9DY2
 XHDe3zZNU+X46D51BxwSmHAdStIpjCWO592Yq2dgwfPrZvOfIqReX1VjBkusw1gt
 x8gtKXdDIRDLgEP580YN4u2NFHwTIDZdNZUpEiNKU6IBEIUHpervcd1ViS6NgruO
 jWtcfOZJUfoyhsI68e8A0gqTowloyx7m93lffCmpl0avLy0S6T1Py8X2+xWrYBWb
 kTm6Uu0nukizM8V816JQ/OHRlR48+d2lxSEXxksqCMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=L6aec+
 5VNbg1vuEtr0xqvRZBfyks20mU6sou+wJVr80=; b=N9nu+XDemjwZm2oO2kQXBz
 FcCqOUerb1lPfTEJTWcjH0qE/mTtTgjgthejVQak6AwOakYoaBKQwh5u7F9BCtP9
 q7JP3TUqIK7BykRVQgMNfa6H3QxM3X03i/zbQ8amgcGUL0EvZGmDJQoKwSE9QBB1
 kjQRJbbgvOoSldRHrE5zyFhQ10ITvjxbUWXU1s8NQ9asFZfwJ7OamRJ4U7v3q+Vj
 S8le0OUs6LxEIEQYuvKLlQsvyTLx+u3chTOXNgvaSIAmlDM4FkzA4oiUj3z53/uy
 rEVkWoddarPBZWoSL36PvgDe756b9JXLGm53MRYejHxp8nUudcE+nwF7f1Zb+UFQ
 ==
X-ME-Sender: <xms:gxFaX2UYmMo8QgFyEPXB6USjfDR63af5QCqmPRAMvwYh5e48QxawZg>
 <xme:gxFaXyk9v0NznOgmBkWtGpHspuOns4xGC5JfGJ6kZlPnoqXDz2oZvm-MtHXYEdaBI
 5DA5anZ-w6mnCmidEU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
 shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:gxFaX6Y4jJAEkthB_8ppNwiK2CGOvaxeZDzQH4O-Sz0an99LEFpUAg>
 <xmx:gxFaX9WuhPhvYhvd831v8DeKlXcejINhKCG9YtUsrA0N98Nfpn3B1Q>
 <xmx:gxFaXwmTMSSY9vML_mB5ER3UAzxEFSa6WKpHz49Ie9l4mfHCxYZfVA>
 <xmx:gxFaXySMVEACoArhjWqnf5oLEVWQOxOcLKpiHWwWDeEZWm2rCp4YNg>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 681A73064685;
 Thu, 10 Sep 2020 07:44:02 -0400 (EDT)
Date: Thu, 10 Sep 2020 20:43:59 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] ALSA: firewire: Replace tasklet with work
Message-ID: <20200910114359.GA16550@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20200909163659.21708-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909163659.21708-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
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

Hi,

On Wed, Sep 09, 2020 at 06:36:59PM +0200, Takashi Iwai wrote:
> The tasklet is an old API that should be deprecated, usually can be
> converted to another decent API.  In FireWire driver, a tasklet is
> still used for offloading the AMDTP PCM stream handling.  It can be
> achieved gracefully with a work queued, too.
> 
> This patch replaces the tasklet usage in firewire-lib driver with a
> simple work.  The conversion is fairly straightforward but for the
> in_interrupt() checks that are replaced with the check using the
> current_work().
> 
> Note that in_interrupt() in amdtp_packet tracepoint is still kept as
> is.  This is the place that is probed by both softirq of 1394 OHCI and
> a user task of a PCM application, and the work handling is already
> filtered in amdtp_domain_stream_pcm_pointer().
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> v1->v2: Drop in_interrupt() conversion in tracepoint
> 
>  sound/firewire/amdtp-stream.c | 25 +++++++++++++------------
>  sound/firewire/amdtp-stream.h |  2 +-
>  2 files changed, 14 insertions(+), 13 deletions(-)

The v2 patch looks good to me.

Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Thanks for your work!


Regards

Takashi Sakamoto
