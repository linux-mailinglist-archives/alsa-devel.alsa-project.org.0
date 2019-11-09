Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 236B1F5F26
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2019 13:38:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89642167D;
	Sat,  9 Nov 2019 13:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89642167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573303116;
	bh=VvM4vlIxKFJvAd/Kj/JhZ7M+yXcXa72b1JSLPD7VxfY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ef2uHxi+zlAqYbrdff9Q3gTa28IVYoAJhIURtq21rlbPtrmimXNm1PvS5Zw/3iZDx
	 AW+DbYEUm0lOR64xsMrj9SBl0wrHTCtMymriSON/v5cihh7rWuo7kIvz+P1kBBh0vN
	 6DFV/afhF96B1ruy4RzC8arz4IdYpVYGYj44B5Os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9008F8049B;
	Sat,  9 Nov 2019 13:36:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 700B0F8049B; Sat,  9 Nov 2019 13:36:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 311BAF80111
 for <alsa-devel@alsa-project.org>; Sat,  9 Nov 2019 13:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 311BAF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="0bCf4HZT"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="aID8e6Zk"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C64821236;
 Sat,  9 Nov 2019 07:36:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 09 Nov 2019 07:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=CVJZ5DpgoxteJIqeCeCaZOXKaU4
 w9qsvEwVwdm3iTTY=; b=0bCf4HZT0jORAakNINK046y+XNHv+vpkYBVNAXZ1HDI
 Q6ILQySAeIjzeJ6KpDSiEMPo6TEhnyY0E3WZdGLpLf8MULYNfCHHXBcBun1Bn0Sm
 gokKb1FZKh4eHf04+5yz2Y3zFz/NSr4Snr+2KHbAGamouMaHQP9Jv6BGni7I939L
 eZSJI0rxhuA5JNl/KkdGfgRYaN1z3nri0NhegyozO8no1V8Re43sNZ+Tf4fB0yjt
 W7VpPXIrwDX7uUK/kifj/Y8R6DRcMyQouuAe5Vm+iNz6cxaam2sKXx0XmNQxFeho
 bGZVHijL4PssJcbqC4p/rJofQ2456ZGPtHX8rM53mGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CVJZ5D
 pgoxteJIqeCeCaZOXKaU4w9qsvEwVwdm3iTTY=; b=aID8e6ZkThzzXYHS6MVzfS
 R6luFjeZeNof4fZZzrvPkEe9HuzJ7QtlZxwsrNDN2uvcyc1/AhoHdGknvZGZtdf+
 0qWYg/uTFj2uIB+nUdxxtQulpfSqENIOl//K6Tx5wh062Ui2yoC414APrlJ/E3IH
 DzW6g/TR+YkdkaNVx0KMeqNAvk0smDiSnFiA7qs/FrYqJZ7pcIII4yb8zcO8ystv
 bbxX6q6LZRUFDGnuex88ligWfPg29rp5Rqb/8HVOUQ8aTuKDwAds+DN/vexf9Dvy
 EkpOYZdjiufBJxKAEa1gxQ7KjYbFlvmXdWznA4ane42YwKtzdssY6Hj86D4e7oiQ
 ==
X-ME-Sender: <xms:17LGXdhtwAGK-0tmTOuDydrAFEi2Ht4Vipz7D29rx0gJ0KeJeNXyNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvfedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecu
 kfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrg
 hkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:17LGXRR2u5MbqQWqgBx38-x6RyW5lYhg7pM1mu0Bbo-28qaod8iMpQ>
 <xmx:17LGXZTTt8PIHlwyeJRDZNoZ97IAcMjEvvmm2OIc8LQDc_FYwLmBKQ>
 <xmx:17LGXdBGvX2SBAKAz9oHGTTHeTsypKnN99H4JovTgge9Q5y66LgpPQ>
 <xmx:17LGXak1rBXdIkOSnGSOZB-eXTmjmxdNyTHzQj2aegrT21LVr36xHQ>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2C93580059;
 Sat,  9 Nov 2019 07:36:37 -0500 (EST)
Date: Sat, 9 Nov 2019 21:36:35 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jean-Paul Argudo <jpa@argudo.org>
Message-ID: <20191109123634.GA22893@workstation>
Mail-Followup-To: Jean-Paul Argudo <jpa@argudo.org>,
 alsa-devel@alsa-project.org
References: <769b9f5dae864cf1eb433ab84eed385a161931c8.camel@argudo.org>
 <20191030091540.GA1856@workstation>
 <ad6f8c036538aa755017efe976ac223bb7c90be3.camel@argudo.org>
 <c4b792255de178094fd53d80a25fc75b795e3acb.camel@argudo.org>
 <20191030115001.GB6313@workstation>
 <b5a6913851d53f19a892ee88042921a38b1a7628.camel@argudo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b5a6913851d53f19a892ee88042921a38b1a7628.camel@argudo.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] snd-bebob : from kernel 4.13 to 5.3.19 and .20
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

Hi,

I'm sorry to be late for reply but I have a short vacation in this week.

On Wed, Oct 30, 2019 at 03:40:03PM +0100, Jean-Paul Argudo wrote:
> >  * /proc/asound/cardX/firewire/firmware
> 
> $ cat /proc/asound/card3/firewire/firmware 
> Manufacturer:	bridgeCo
> Protocol Ver:	1
> Build Ver:	0
> GUID:		0x00130E010004394C
> Model ID:	0x02
> Model Rev:	1
> Firmware Date:	20061207
> Firmware Time:	140826
> Firmware ID:	0x0
> Firmware Ver:	16850194
> Base Addr:	0x20080000
> Max Size:	1572864
> Loader Date:	20051019
> Loader Time:	094952

Before vacation I made arrangement to buy Focusrite Saffire LE in used
market and today it arrived. As long as I can see, the unit uses the same
firmware which your unit uses.

>>> At startup it lights green ok, but no sound is playable, then the
>>> lights turn orange (like it is when it's not working), I hear a
>>> "relay sound" (a electric clic of a relay), then, the Saffire LE
>>> disapears from the sound menu in Ubuntu sound menu.

I can regenerate this phenomena.

>>> I can see this in dmesg:
>>> 
>>> [   19.083583] snd-bebob fw1.0: Detect discontinuity of CIP: 10 50
>>> [   19.746665] snd-bebob fw1.0: Detect discontinuity of CIP: A0 A8
>>> ...
>>> [  284.965508] snd-bebob fw1.0: Detect discontinuity of CIP: D0 10
>>> [  285.469348] snd-bebob fw1.0: Detect discontinuity of CIP: 68 A8
>>> [  285.965174] snd-bebob fw1.0: Detect discontinuity of CIP: 20 60
>>> [  285.981618] firewire_core 0000:05:01.0: phy config: new root=ffc1,
>>> gap_count=5
>>> [  290.103982] firewire_core 0000:05:01.0: phy config: new root=ffc1, gap_count=5

I can see as well.

Then, I realized that these discontinuity occurs in packet streaming
of 'second or later'. In short, once disconnection of packet streaming,
the unit transfers packets with discontinuity in packet streaming of
reconnection. Furthermore, the discontinuity is in the early isoc
cycles of packet streaming.

I've already commit to avoid the detection of discontinuity in recent
commit for v5.5 kernel (under development):
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/sound/firewire/bebob?id=acfedcbe1ce4c69e1da914f39c02d945c80198d4

In this patch, isoc packets from the device are captured enough after
connection to skip early cycles of packet streaming, thus the
discontinuity is not detected.

As long as I tested, this version of ALSA BeBoB driver works well with
the device. I'd like you to test with backport drivers as well:
https://github.com/takaswie/snd-firewire-improve


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
