Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5012D1FB03B
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 14:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8C991672;
	Tue, 16 Jun 2020 14:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8C991672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592310025;
	bh=/kQSsXvIF1OuRq33Pz0yJkn1PqehAI3ZDmbEON7heEc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OQeq+F51817U3l6bydQpzjwPZ3h4mU0m9Uvs+yXTUABtqYAwdLoWUkUtiZ3rQ4LZT
	 Q/93wVAeIGJOCf3sdLpYUpJLeSmskAFYQQcH14x3kEzeD2b5IDarwCMB56uaqRJVeB
	 F0EmqcbShHnGTDCZXdLjbBn+jMGhpVs8emC4m6Qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15C05F800EF;
	Tue, 16 Jun 2020 14:18:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B57E7F8022B; Tue, 16 Jun 2020 14:18:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_65,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1783F800EF
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 14:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1783F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mxJoAy2L"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VWIVvAfE"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 965345C00DE;
 Tue, 16 Jun 2020 08:18:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 16 Jun 2020 08:18:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=gwFMrPz2RqOKPw5qyn3CpCNuQlb
 lO6AH+OgASuorE58=; b=mxJoAy2LL3shOaZblxqCyx4NUybHnmLBeC9b1A1wUF9
 h1HpkZXm7ht0OgXHZKyX4KCtEE5ensEpZnkr0OJnW1RrrXC77N+/6XaUFabzz8+l
 3rCfN2l1SMcaBYeJ1Us/lU4U7KmvUdquV6AeOHO1qV7LcFWHFwJ+5vnwjPtd9Xwd
 aVAG7QCJms1YfnVpGxarrul4UjEMCgpMBnXE36c39BZCkvmNPfsfXRjfP5OQj1jQ
 VfO9vMT5QyXTM+RbarvprWUna5q5nodjVHoxKhiLvhGcSethCTbqzouL8EZZjI/Z
 /nmjakD844yyF95+Bqf1IjSQalnssGzLdYL3gNKAKMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gwFMrP
 z2RqOKPw5qyn3CpCNuQlblO6AH+OgASuorE58=; b=VWIVvAfELRkyuL/45K09/x
 0iwCTGImZvj8DD2XvhyKcIDXtlj+lf9N9+1SmQmOeA/8J6UVuImaUezT9HII9xQu
 vCq2ooeYsW/SCW1t84lw1H6kfBo9hWQXlxrYnlbe4YjPtb1yNSFH70VFYLRgCiVc
 /xIfXDq+JAiWemVzUdPKB6iHRqpy8V/xS76i3AotZPmh22wD87VIAxd9u3sooArn
 Sg/TM3FK92/2Wfw41776mfubwWEKqevSNnP3rVIdCxeKnEnny1TVGoDMgTj8UzJP
 1HoSnrTl6AWGyWOMaSnKmnyFrURMsABUqPk1tjXqxGERHYrtQNdtDcB+7SUqrrYw
 ==
X-ME-Sender: <xms:l7joXnbxl1OHBmmRt7h6rtuTcEGBrfkZhO_QS-AOivAy1KJoDykPfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejtddgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepuefhheeige
 evieejhfeivdekueegvefhtdelhedtffeulefflefgffevuedufeetnecuffhomhgrihhn
 pehprhgvshhonhhushdrtghomhenucfkphepudektddrvdefhedrfedrheegnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:l7joXmbvX0-RvXv-DH94XKVEuGCJt21C8I5fzT4nRlFeZZ6hXbFwDQ>
 <xmx:l7joXp_qVhpiIbGHm5qxRq7n12AI_f92Ro_BzF14azMp9nJYVpY7Dg>
 <xmx:l7joXtorRL-z8tLLqQycjQYSz7tCYF_OmzZ_mE2MP4wKBedjywl43A>
 <xmx:mLjoXv3U7OFZEgw3n-zO_57dMCMZ2rJTp14yRmuuOLUCoXjT8tvnrA>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 377793061CB6;
 Tue, 16 Jun 2020 08:18:31 -0400 (EDT)
Date: Tue, 16 Jun 2020 21:18:29 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "m.eik michalke" <alsa@reaktanz.de>
Subject: Re: presonus StudioLive 24.4.2
Message-ID: <20200616121829.GA204160@workstation>
Mail-Followup-To: "m.eik michalke" <alsa@reaktanz.de>,
 alsa-devel@alsa-project.org
References: <1859294.RmyynjnHiM@meadow>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1859294.RmyynjnHiM@meadow>
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

I'm a developer for ALSA firewire stack.

On Tue, Jun 16, 2020 at 10:11:57AM +0200, m.eik michalke wrote:
> i'm trying to get a presonus StudioLive 24.4.2 up and running:
> 
>   https://www.presonus.com/products/studiolive-24.4.2
> 
> so far i'm partly successful -- looks like the board is automatically detected 
> and supported by the firewire dice module.
 
Thanks for your trial to the device. For my information, would you show
your kernel version?

> however, i'm only offered 16 of the 24 supported audio channels. in the list 
> of soundcards it is merely shown as "studiolive" without further info on the 
> model. i wasn't able to find further info on this board's status with regards 
> to alsa, so if there's documentation on this somewhere, could someone please 
> point me to it?

I guess that Dice ASIC in your device can process two pairs of
isochronous packet streams. In the case, the driver adds two PCM devices
to system. I think you saw the first PCM device and it can handle 16 PCM
channels. Another can handle the rest 8 channels.

Would you find below procfs nodes and dump their contents?

* /proc/asound/cardX/firewire/dice
* /proc/asound/cardX/firewire/formation

Here, the 'X' should be replaced with the one in your system.

> in case that as of now the studiolive isn't officially supported or the above 
> behavior is due to the fact that so far only the 16.4.2 is known to the 
> module, i'm willing to help as far as i can ;) i hope that already seeing 16 
> channels is a good point to start and that it's not too hard to make the 
> remaining 8 show up as well...

Would you get output from '/proc/asound/pcm'?

For example, in the case of M-Audio Profire 610:

$ cat /proc/asound/pcm 
...
02-00: DICE : FW610 : playback 1 : capture 1
02-01: DICE : FW610 : playback 1

We can see two PCM devices in the above for playback PCM substream.


Thanks

Takashi Sakamoto
