Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7904F8BED
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 04:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED95185C;
	Fri,  8 Apr 2022 04:15:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED95185C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649384189;
	bh=vjwJMrCY9DZGkR0fCILFB/YNtRxgwi8y6n89wUolpzw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqCVLAcFBK/6bN0/2IGKZ9pWWsoKt5E9DgkZ714qV34F5fVyMiKgDzcUd6UOM8RAf
	 wbHf64nlU+geey2ABvYd8fgz7NnJq9tL0VDQdu8xlqNxecGI/itvvDqRJnUcuIu/jD
	 Bnw89lLarXiVmJaeuD5asd4maSAyyAFCsBlGhyiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C474F80054;
	Fri,  8 Apr 2022 04:15:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E980F8014E; Fri,  8 Apr 2022 04:15:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77FB3F80116
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 04:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77FB3F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Png8i7qU"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="DKeAQHx6"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 585305C013B;
 Thu,  7 Apr 2022 22:15:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 07 Apr 2022 22:15:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=nvkFaMbev4/kVyqnJNPqVSo+frUbKl
 NHC+DpOIWGrBw=; b=Png8i7qUPf5HmJFJ58DmULMRRGYoAmB73A3ZOYEqFUm1fU
 43PFXFKD9iepd1G5yZsz9+lMRJAQS+DLN/POwV1J7BJcjFkwz59ZIw9mRnGUwlZf
 Ctmdp0B0Mlqd+9uY+KT/Tyo2fQstOHWVit5j3YtALZkV35WE9UFuUFLCQxj3FZyz
 K6CAF8zwT+X7sLrJIUXQnsl9qILn2iBGw0VHpdRKJC1Gz0qtaCQgra4rauaBPeWN
 RHnLssQtAL378A+ibP0ZN1Hb1LTsKjEVApYDLUggi6QxyFkvw+q59/c37vStoKf1
 pnyPBufUAUHiDOTySi/VebnjcCrd/hiXROBSZnOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nvkFaMbev4/kVyqnJ
 NPqVSo+frUbKlNHC+DpOIWGrBw=; b=DKeAQHx6rcKdL75fyOgCawkzYIYKN2p7X
 10oUueW8uqnBWhrF8gXHfytM87wfwhpkeFUtGtnyb5e+TC9Hu8YyaXi3fvT3mcMG
 PmGAS52g2HN5SXbpqfujsnWEk/Cqb9RY6ekbGCUdxtj2VmQTt+T82wp1b3PpD7u8
 0BhFuD9x3xOuwBICffODz7F4IeiqBsc3EaJpbFleXZSH3Uv5Xvr+2Q7jh5WTtwzc
 xJ3xq/Cabyat4SD0cFcnZlNVjKorCobwz/tU4XP3I8pGD5xCb2GL5HjpqMsCmn8G
 8uF2Log6rcbW5V6kUKC9Zhdp7pZXEIbOGwGYstIUaNDN7qfia2kcw==
X-ME-Sender: <xms:uJpPYh8IWikMqZyG5HWZtkDitNp0CcOBambTyoc2IfoLIh51tZFDvQ>
 <xme:uJpPYltrKyW_iaTQLV6ED03-o7gDHimQJp_2sEQqVqiJOqDTojJOM3PUvUBsrMVK5
 lvEavz7BkcxHnU_uMo>
X-ME-Received: <xmr:uJpPYvDPNK87LZse2QcaukTasHMe3vzByBwzctUwzUux3SAUDeP8qFvTMlraX1dd3O2Xqk0NUoTuPSnHoRwTGmhC0-2rjuX0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejledghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeejgeeifeeuveeufeeigeegjeelvdfgjeegffejgfdv
 keelhefgtdefteejleekjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:uJpPYleVcSI-JrzdC8B_p9WH-4t8mOl-WHN8W6f8_D-INaZlG6mLmQ>
 <xmx:uJpPYmOEABEsKmR-ozhl4WgiKx0aY4VDcuBkuDB6c_XzwHTJ-GjVhw>
 <xmx:uJpPYnnsUxqgkqg5OoZr_nU0HWUhokxzXEiET0sakS6f-VyjGlyjKg>
 <xmx:uZpPYjoI1r7BEHTKCRp2wfHZeTfX9d3uhXAHL7rZSUsdqmo8xAuLtQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Apr 2022 22:15:19 -0400 (EDT)
Date: Fri, 8 Apr 2022 11:15:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3 0/3] firewire: assist unit driver to compute packet
 time stamp
Message-ID: <Yk+atHM5c9EI3584@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
References: <20220405072221.226217-1-o-takashi@sakamocchi.jp>
 <s5hczhv5wjc.wl-tiwai@suse.de> <Yk4r7VcotHz0iMOU@workstation>
 <s5htub52zz1.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5htub52zz1.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 clemens@ladisch.de, linux-kernel@vger.kernel.org
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

On Thu, Apr 07, 2022 at 08:02:10AM +0200, Takashi Iwai wrote:
> On Thu, 07 Apr 2022 02:10:21 +0200,
> Takashi Sakamoto wrote:
> > 
> > On Tue, Apr 05, 2022 at 06:23:35PM +0200, Takashi Iwai wrote:
> > > On Tue, 05 Apr 2022 09:22:18 +0200,
> > > Takashi Sakamoto wrote:
> > > > 
> > > > Hi,
> > > > 
> > > > Current implementation of Linux FireWire subsystem doesn't allow unit
> > > > driver to operate content of packet in IR context according to
> > > > time stamp. Additionally it doesn't allow unit driver to read current value
> > > > of CYCLE_TIME register in OHCI 1394 controller. It brings disadvantages to
> > > > drivers in Linux sound subsystem in regards of handling time for sampled
> > > > data such as PCM frames and MIDI messages.
> > > > 
> > > > This rerolled patchset is first step to improve the situation.
> > > > 
> > > > Changes in v3:
> > > >  * Rebase v2 patchset to v5.18-rc1
> > > > Changes in v2:
> > > >  * Rebase v1 patchset to v5.16 release
> > > >  * https://lore.kernel.org/lkml/20220212022131.199855-1-o-takashi@sakamocchi.jp/
> > > > V1:
> > > >  * https://lore.kernel.org/lkml/20211202113457.24011-1-o-takashi@sakamocchi.jp/
> > > > 
> > > > Hector Martin (1):
> > > >   firewire: Add dummy read_csr/write_csr functions
> > > > 
> > > > Takashi Sakamoto (2):
> > > >   firewire: add kernel API to access CYCLE_TIME register
> > > >   firewire: add kernel API to access packet structure in request
> > > >     structure for AR context
> > > 
> > > Thanks, applied all three patches now to for-next branch.
> > 
> > Although thanks for your applying them into your tree, I apologize to
> > trouble you if you overlook that the included changes is just for Linux
> > FireWire subsystem. It's my fault to send them only to Linux sound
> > subsystem, but the changes are required to my work in sound drivers... 
> > 
> > If you are willing to include patches to Linux FireWire subsystem for
> > your pull-request to Linus, I can prepare respined patches for it since
> > I have the list of patches posted to LKML as bug fixes for Linux FireWire
> > subsystem.
> > 
> > I need any help to solve current situation of Linux FireWire subsystem
> > that bug fixes and new changes are hardly merged. Of course, IEEE 1394 bus
> > is already outdated and legacy, but I know that some users still work
> > with it. If your path is available for it, it's the easiest and the most
> > convenient way for upstreaming, I think.
> 
> Ah OK, it's fine for me in either way.  I can keep up those changes in
> my tree, or go through others.  I leave the decision Firewire
> subsystem people.  Just let me know.

That's great. I think we can see few objections.

In this weekend, I'll send two respined patchset. One is for bug fixes for
your for-linus and living stables. Another is for your linux-next.

Thanks for your kindness.


Takashi Sakamoto
