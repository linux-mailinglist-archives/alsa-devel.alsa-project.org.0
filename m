Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A691FCEB2
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 15:38:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A311F1675;
	Wed, 17 Jun 2020 15:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A311F1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592401139;
	bh=30FiJ0YBzJjzOPsWcLHLh3+x+Rbf5t/2uKG51ymvAX0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pIgAwe1icuLD7jc47FqEbljTDTDacuz8I+ksQ7kPxlnnLZBqMoNOmUKDAevKPVeit
	 bxlocOlHekFx3UKF6yi6n8vN5ZIlzyzGbWlqyAl3zgeukJk1FNcEnevttHrhiKGZ0l
	 cl5KnGN+gaiGOjOdkFc6EGhYE3BGLAagd/EsUkuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A968DF80162;
	Wed, 17 Jun 2020 15:37:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EEDCF801D9; Wed, 17 Jun 2020 15:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C38FDF80162
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 15:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C38FDF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="T3kRs2zF"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="E+iheR0x"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 70F635C00EA;
 Wed, 17 Jun 2020 09:37:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 17 Jun 2020 09:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5Kl8yo2T9c1QR8jDn7Y/mc0vzVP
 h9Ggxb+pcsISl50o=; b=T3kRs2zFX6kDAi8/QQY5zP7JGVviIr1WE0ejEe5knnD
 RYKJOfU1HCO6yVtXC6P8CoatoH/WSb6v42NQYmaGg6zwdihdwpDI6Qg3hiit93Pj
 b0mLH7BQhVoTBHEJfpMSeYbN4yE1X4dEVn/+E9ZBtu2SHkGwJhndiR4ESbbWbAAh
 GVIbMfEUunuJaUOyYLOw5WGH8wYjCY4ynmPAiVwA11wfneWK3QYgFMPuldFa7RsQ
 +xthWzy3TAdHGu3M0uzug3uUhbFTLuwBcIU3nutUBG4Dqt8IWDp3IdHfe/CxVAZc
 Hr+st9lQHO4nWzPvYalx4P0AtEtVrCTgY2uOjEqhOlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5Kl8yo
 2T9c1QR8jDn7Y/mc0vzVPh9Ggxb+pcsISl50o=; b=E+iheR0xNPdxGiqx09g9/a
 oEtSkPeL/WimQrZjXOUOUiDgnZksHoj6SlHDFocOqVPwxDowWDGuCKzitpp4/znF
 0DQM3KOkZ3XtyVLQLZEyf9bZ9EDiYnE8Qs5Y4BQVX6uJWKOK0T4EPSY4lv4astkT
 FcVPdiyZx51tZwfwVgj9BSlG9D97gKl8BDZ5gspWibxN648oeM/5SYeUKq7pPML3
 ZqrG2NtdNOUm1C62li5OZc0s90wkkj4brZA8THYixjAZOxpZu6EFNBzXakx3YU1Y
 tsLO2fd/Kebff2e3/BcCK0wVp4XP0n/De8ECoRJdpE4n0cP/hwe0OEv1KKS2+spw
 ==
X-ME-Sender: <xms:gxzqXmEdxuiTi7asOwwxpreTfEjHjBTqW90jOF_3WpfMHCWtPiYQtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepleefleeike
 eiieevtdfffeeiheefhfdufeeiieffhfetffefheefvdevuddugfdtnecuffhomhgrihhn
 pehgihhthhhusgdrtghomhenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihes
 shgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:gxzqXnXEIZbs-Ohi7eMKp8x4ZY5PBx4Y2tTRxaRUyR-35xRb6oTtNA>
 <xmx:gxzqXgIcHsy6IU5wMT489TxmJG_Txr4X0lcsFkc74lvbSy5ZEieksg>
 <xmx:gxzqXgElt8hi_are3qsUklekiCasVByCQ9-nP0A2ysOD3SThs_OGDQ>
 <xmx:hBzqXkhzHhieB1ZKZ_ucHJrtQy1komRLKl4rnWoh5jGY92EN8dueOQ>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0B8A63061856;
 Wed, 17 Jun 2020 09:37:06 -0400 (EDT)
Date: Wed, 17 Jun 2020 22:37:04 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "m.eik michalke" <alsa@reaktanz.de>
Subject: Re: presonus StudioLive 24.4.2
Message-ID: <20200617133704.GB274842@workstation>
Mail-Followup-To: "m.eik michalke" <alsa@reaktanz.de>,
 alsa-devel@alsa-project.org
References: <1859294.RmyynjnHiM@meadow> <20200616121829.GA204160@workstation>
 <5770610.t4SrzthkjT@yrla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5770610.t4SrzthkjT@yrla>
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

Thanks for the information.

On Wed, Jun 17, 2020 at 03:00:49PM +0200, m.eik michalke wrote:
> > > in case that as of now the studiolive isn't officially supported or the
> > > above behavior is due to the fact that so far only the 16.4.2 is known to
> > > the module, i'm willing to help as far as i can ;) i hope that already
> > > seeing 16 channels is a good point to start and that it's not too hard to
> > > make the remaining 8 show up as well...
> > 
> > Would you get output from '/proc/asound/pcm'?
> 
> $ cat /proc/asound/pcm
> [...]
> 04-00: DICE : StudioLive : playback 1 : capture 1
> 04-01: DICE : StudioLive : playback 1 : capture 1
> 
> 
> all looks to me like you were right. IIUC the board provides a total of 32 
> output channels and 26 for input. does this mean the device is already fully 
> recognized and functional? can alsa be configured to provide all channels as 
> one "sound card" so they become available in, say, ardour?

ALSA dice driver is functional expectedly in the case, with the inconvenience
that you noted... The driver adds two pair of PCM playback/capture device so
that each of them handles corresponding single isochronous packet streaming.

I suggest users to use 'alsa_in' and 'alsa_out' in jackd
session. Two pairs of PCM device (hw:x,0 and hw:x,1) need to be handled
for all of PCM channels. I'm sorry but at present total channels are not
available via one pair of PCM device.


Well, this is a request from me. In IEEE 1394 bus, each device has
'configuration ROM' which the other device can read. Linux FireWire
subsystem read it for device detection. I gather the ROM image[1] for
better detection and would I request you to send the ROM image to me
by following below instruction?

After detected, FireWire character device corresponding to your device
is added to Linux system. Typically it's '/dev/fw1'. At the same time,
the ROM image is served via node on sysfs. In the case of '/dev/fw1',
it's '/sys/bus/firewire/devices/fw1/config_rom'. I'd like you to
redirect its content to file and send it to me (or send pull request
by github service).

[1] https://github.com/takaswie/am-config-roms/


Thanks

Takashi Sakamoto
