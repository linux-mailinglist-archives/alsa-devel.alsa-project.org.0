Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 954A51FF433
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 16:08:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 291871795;
	Thu, 18 Jun 2020 16:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 291871795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592489302;
	bh=IADRxEKb3EDIavTcnmTwT2PU+PM5F9WEI/gadp7AQI4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebxYiKVTxoLoXtN52biGwGJw+18Uly9zDn2dzdxrTPVxZCZh6ZFVjbrWNUi9pod1d
	 Oft4T87sRKpQDLb6D6qhmmeLWl/kawg87ViTvkbX8dfJQer8JVzMC7OomIB50Fqw6R
	 yIdvx52YR/2piMe8Y3R4cJE9XyGVn6I0LLTQyQPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 420A0F800D1;
	Thu, 18 Jun 2020 16:06:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52157F80116; Thu, 18 Jun 2020 16:06:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B634EF80101
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 16:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B634EF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XltKQcES"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="UL9B4wMD"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id EE7FE5C010F;
 Thu, 18 Jun 2020 10:06:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 18 Jun 2020 10:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Yc9syGFolV11kD/X8d3GbgjhJCG
 6167kD0lMUsiY0A4=; b=XltKQcESOi0zevjnzSSuT2NRL1lXBTlz9Bp7I1deI7A
 SAVry65DKqwcLadFN0kbqkuqEbV0sTcCnyg/AytXZIuk3NxrNTz1m+397IPPPJMz
 LZcNy6zL2gUjE/r2mzVFB2mtvZxJ9lZ1UlwvJ57NdopHbpSLKA2C/p9zTyJzMik0
 CWK9NIXVEOQoCAWDoS1DVVr3GjvLNGeZH/V95z8l/37luAavGicDyYinFfFPRTXi
 hWHQQJqqw/1+bbFcTM/a6CBCAx1S+UF7+HC42GucNcYaeRa9dMmyycgA/swL2x7n
 xpLls9dW9pgZLjlGHMxUFWcYvwQlzBSZohuM0nMdWFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Yc9syG
 FolV11kD/X8d3GbgjhJCG6167kD0lMUsiY0A4=; b=UL9B4wMDXpnvk5dwQcSonH
 MNc2Uo8Goe0Jmgk1orAwyWU1kl7MB5C/9piDuMDjPxyA1EEZYABf8zk80S/vh2qo
 iBBXsvXwnVa8AwnK1mNe236FXNN3d9XhJiEMyFRcafzHrEQWBCbSKhxtBeknYQsH
 G6cHFLes22DRQHfHN7Zggt5FVDrgqgemqDvJgLsf70LdgkZaQxoP13K5fj772fqS
 a3OP4Ck/ERPAWGu7++8QjP7kXtTcv3/C7yUV3nKzi0ZYxjTFamIa5vGGc4Yy1+0U
 uGUG9biy9Xv+dZenUEIX+lkj5mqiIXXXHgT6lFz84ObBZNa7ZFQw2avI3R7iPp1A
 ==
X-ME-Sender: <xms:4nTrXgWvXLfv-mD0yv230r1ouDYPL94ymNO-NqmnB9KXfsdu7i0vMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejgedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepueefvdevue
 ffteeigffffeejveevkedvveeuhefgvefhffdtieefvedvhefhkeetnecuffhomhgrihhn
 pehjrhhighhgrdgtohdruhhkpdgrlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepud
 ektddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:4nTrXkkfR04zMBrJt9REr9eQLWoV8DCT8XSocquUGBtdAp5jmFOfew>
 <xmx:4nTrXkZAEFcfFdw3nuIXab7NryqT954VF7-WuuOZoknfMHM_pM3EPw>
 <xmx:4nTrXvWtFeV1cnytYf2hX2a7Pm_llhTRmkHeuwrJ-ee5tpD8ZiHJ7A>
 <xmx:43TrXmwVsCZ1DLgKde1MDAERd5WoneK6w9EqivLxmZv2JmBt_RxWRg>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id F15943280065;
 Thu, 18 Jun 2020 10:06:25 -0400 (EDT)
Date: Thu, 18 Jun 2020 23:06:23 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "m.eik michalke" <alsa@reaktanz.de>
Subject: Re: presonus StudioLive 24.4.2
Message-ID: <20200618140623.GA314288@workstation>
Mail-Followup-To: "m.eik michalke" <alsa@reaktanz.de>,
 alsa-devel@alsa-project.org
References: <1859294.RmyynjnHiM@meadow> <1950143.FVrUTiCnyk@yrla>
 <20200617233213.GA281450@workstation> <4447737.uXMYkMNjJ4@yrla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4447737.uXMYkMNjJ4@yrla>
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

On Thu, Jun 18, 2020 at 12:14:41PM +0200, m.eik michalke wrote:
> hi,
> 
> Am Donnerstag, 18. Juni 2020, 01:32:13 CEST schrieb Takashi Sakamoto:
> > > ok, could a hack like this also help me out?
> > > 
> > >   http://www.jrigg.co.uk/linuxaudio/ice1712multi.html
> > 
> > Yep, the PCM multi plugin in alsa-lib seems to be available as well.
> 
> that's encouraging. now i only have to figure that out ;) never had to deal 
> with .asoundrc before (which is testament to the hard work of all of you, 
> thx!).
 
The domain specific language in alsa-lib is not so easy to understand
and control. The result affects to all of ALSA applications like pulseaudio.
It's better to use alsa_in/alsa_out for the purpose to avoid unexpected
influences, IMO...

> > From my curiousity, would I ask you extra check in system log (like
> > journalctl -k)? ALSA Dice driver supports TCAT protocol extension, and
> > it firstly attempts to detect it for all of devices without explicit
> > flags (in your case). If the device doesn't support the extension, the
> > attempt fails and we can see below log:
> > 
> > ```
> > kernel: snd_dice fw1.0: transaction failed: timeout
> > ```
> 
> here's what i see in journalctl -k when the device is being plugged in:
> 
> kernel: firewire_ohci 0000:05:00.0: isochronous cycle inconsistent
> kernel: firewire_core 0000:05:00.0: created device fw1: GUID 000a920404af7744, 
> S400
> kernel: firewire_core 0000:05:00.0: phy config: new root=ffc1, gap_count=5
> kernel: firewire_core 0000:05:00.0: IRM is not 1394a compliant, making local 
> node (ffc0) root
> kernel: firewire_core 0000:05:00.0: phy config: new root=ffc0, gap_count=5
> kernel: snd_dice fw1.0: transaction failed: address error

Thanks. Now we confirm that the device doesn't support the protocol
extension. (And I realize there're two cases; the device doesn't just respond,
or returns RCODE_ADDRESS_ERROR.)

> let me know if you need anything else.

Hm. If you hear sound with periodical noise, please report it. The dice-based
device is known as one of the devices to require drivers for media clock
recovery. In detail, please read the other case[1].

[1] https://mailman.alsa-project.org/pipermail/alsa-devel/2020-May/167413.html


Regards

Takashi Sakamoto
