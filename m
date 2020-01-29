Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD73D14C4CE
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 04:18:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BADD1673;
	Wed, 29 Jan 2020 04:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BADD1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580267931;
	bh=rqWDg8X8m/ibloHxNLl5gA+BYGBJBlzDjqyQ9/0iU2Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pZpyuYNr7fH9/vSbbyU+7llvK+Twz+b3u+7frCWv0CGi6OxD6Npi0NgkMoXIEqiPk
	 zpjpTj/bdMBOvMAYuxHFoRUuOBYwuuxiXQz3SRVezfZeXjirkS+mg61VbiA2ePFvpO
	 WT9guyb+yP4P9jh1umdlO4Qnu2cqEkWFNL+iR1Dg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30D59F80229;
	Wed, 29 Jan 2020 04:17:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEFBFF8021E; Wed, 29 Jan 2020 04:17:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D043F80122
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 04:16:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D043F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="dE3UwUwX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mlFRp44X"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2E40D21FDF;
 Tue, 28 Jan 2020 22:16:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 28 Jan 2020 22:16:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=SjG4EIVbHb7DzF3Q4L6/6RqPYwN
 gwn3ViIkfkcpEG14=; b=dE3UwUwXoSaU0FTjyefBOTxOyHpijNC00tX6SFg+wKE
 8LhB865j2CVxpFa4cZ2fzXwkp9kV0mjojwX+JmalGm9jkh7RQYfzRGSCP11iQ9XO
 qby/gwDfD8VwYYjD/7i7rBD7d7e++iZtjj3+HN1YA9LoRrzdobz8AAiob2TTzjhh
 tIodkynfrT7AS5m8WJvzhcBpR8/x8uq3Ojt6LcIBybkX8MqmnXTP03jSkY4KcOX/
 JT+/NjKOYGr9upRruWb7EEq69kKI67o628pEeFRXZFzCgZjDYkR9dzItHGrrvRJ4
 X18Ocd9Uy2rSOAxDdBxB1T2RiDyEF4LECz0aTI5qsfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SjG4EI
 VbHb7DzF3Q4L6/6RqPYwNgwn3ViIkfkcpEG14=; b=mlFRp44XJs6k5Vhe9zWccA
 Dwwwy92wahNnSr3wgSA27zYGnzP2jY419D05jJ/1pknZx/CFOhvtN7g1ikN1rF/1
 dCwTDr1uc6FLxHQpmh06Lg7L/q7wLkUzp6j6PRw2IxkvkzWQHq2GT5xF804Mv1DJ
 7ula4h9uUHoUFB7f9THMRlv6S8mEKV3OG6EmIhczPkZXLl4Sw0Nh3IxwV8ifG9LX
 rBL/0ZBan99UIyTdPasmpbzzChL3g1ZFdrwiLVqA9RycFR1FXitL9mUvk/Xzp1aO
 AWoNTsXylS9WiInLpck3xdqSrAVqD8egYnInRF+B6ZkBV1lJ3vOKUdCE9VAOBsdg
 ==
X-ME-Sender: <xms:KPkwXk5CuPcyT8OUx5clGNQcdsF1Z0E5tUX-CUpvLrQb_l7efWmz3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeehgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucffohhmrghinhepfihikhhiphgvughirgdrohhrghdpghhithhhuhgsrdgtohhm
 necukfhppedugedrfedrjeegrdduieeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhj
 ph
X-ME-Proxy: <xmx:KPkwXtqRwKMFFAeEodStOrIZZ7ha5PyUkOzcDF6gzC25c0qR_gQ2Bw>
 <xmx:KPkwXodlE5SHFUvt0iv6HRFDdCZeGP23aDPnadxhJpaX622UcMeE7A>
 <xmx:KPkwXhI_wiVs3A1xRk7ufuTpzfwzUIM7ZqkOzhnuaGoeihXbnMbNMA>
 <xmx:KfkwXrbwxTv4PT8eZ4MTfN9O1zFE9f0dZmplG8gIFOb3gNNNtYwMyQ>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id C7C0D3280060;
 Tue, 28 Jan 2020 22:16:55 -0500 (EST)
Date: Wed, 29 Jan 2020 12:16:53 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Daniel Jozsef <daniel.jozsef@gmail.com>
Message-ID: <20200129031652.GA2629@workstation>
Mail-Followup-To: Daniel Jozsef <daniel.jozsef@gmail.com>,
 ffado-user@lists.sourceforge.net, alsa-devel@alsa-project.org
References: <CAK5Eu=tVQjBn+YvsHOLqSEir5aV8Q0hA1OgFiJZYdqnspdMz-Q@mail.gmail.com>
 <CAK5Eu=snx3s9r9hoeF4Th0V0YXJYa=7PKUqDn3W4NdWZben-zg@mail.gmail.com>
 <CAK5Eu=v2x+zFhCygKq8DPWd+CH5JTpZEayg=k2NvaTY7DUNA9g@mail.gmail.com>
 <CAK5Eu=ucuW6Pp=+j7afPoYgPUdFXjh+PZ-PK6mc+m61M80ZndA@mail.gmail.com>
 <20200119164335.GA11974@workstation>
 <CAK5Eu=sS8kMe5hCPgTx+V6AjzcCo3vN73tEQ1f=kY03Y2_CcJQ@mail.gmail.com>
 <20200120141901.GA32472@workstation>
 <CAK5Eu=tX=87xD0xt-UdrDWTsxw9Y4xOrvAV8pHKyYC7tau==XA@mail.gmail.com>
 <20200125031801.GA5554@workstation>
 <CAK5Eu=tV+T4OupWNToLE8nfG00Y68kiTRcUGia9YOFtzYQNSRg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK5Eu=tV+T4OupWNToLE8nfG00Y68kiTRcUGia9YOFtzYQNSRg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, ffado-user@lists.sourceforge.net
Subject: Re: [alsa-devel] Toneweal / Trigaudio FW66 device
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

On Tue, Jan 28, 2020 at 10:28:20PM +0000, Daniel Jozsef wrote:
> I'm a little baffled by what my device just did. :P
> 
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000100ffff00
> response: 000: 0c 60 02 c0 00 01 00 ff ff 00 00                .`.........
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000101ffff00
> response: 000: 0c 60 02 c0 00 01 01 ff ff 00 00                .`.........
> (<- didn't fail)
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000102ffff00
> response: 000: 0c 60 02 c0 00 01 02 ff ff 00 00                .`.........
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000103ffff00
> response: 000: 0c 60 02 c0 00 01 03 ff ff 00 00                .`.........
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000104ffff00
> response: 000: 0c 60 02 c0 00 01 04 ff ff 00 02                .`.........
> (<- didn't fail)
> 
> In fact...
> 
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000105ffff00
> response: 000: 0c 60 02 c0 00 01 05 ff ff 00 03                .`.........
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000106ffff00
> response: 000: 08 60 02 c0 00 01 06 ff ff 00                   .`........
> (<- shorter)
> $ ./firewire-request /dev/fw1 fcp 0x016002c0000107ffff00
> response: 000: 08 60 02 c0 00 01 07 ff ff 00                   .`........
> $ ./firewire-request /dev/fw1 fcp 0x016002c00001ffffff00
> response: 000: 08 60 02 c0 00 01 ff ff ff 00                   .`........
> (<-srsly?)
> 
> As for the second batch:
> 
> $ ./firewire-request /dev/fw1 fcp 0x016002c0010100ffff00
> response: 000: 0c 60 02 c0 01 01 00 ff ff 00 00                .`.........
> $ ./firewire-request /dev/fw1 fcp 0x016002c0010101ffff00
> response: 000: 0c 60 02 c0 01 01 01 ff ff 00 00                .`.........
> (<- didn't fail)
> 
> So again...
> 
> $ ./firewire-request /dev/fw1 fcp 0x016002c0010102ffff00
> response: 000: 0c 60 02 c0 01 01 02 ff ff 00 00                .`.........
> $ ./firewire-request /dev/fw1 fcp 0x016002c0010103ffff00
> response: 000: 0c 60 02 c0 01 01 03 ff ff 00 02                .`.........
> $ ./firewire-request /dev/fw1 fcp 0x016002c0010104ffff00
> response: 000: 0c 60 02 c0 01 01 04 ff ff 00 03                .`.........
> $ ./firewire-request /dev/fw1 fcp 0x016002c0010105ffff00
> response: 000: 08 60 02 c0 01 01 05 ff ff 00                   .`........
> (<- shorter)
> $ ./firewire-request /dev/fw1 fcp 0x016002c0010106ffff00
> response: 000: 08 60 02 c0 01 01 06 ff ff 00                   .`........
> $ ./firewire-request /dev/fw1 fcp 0x016002c001010fffff00
> response: 000: 08 60 02 c0 01 01 0f ff ff 00                   .`........
> 
> Honestly I have no idea what is going on. :D
 
It looks to work well.

You tried for input plugs of audio subunit, thus the shorter
response with 0x08 in the first byte (=NOT IMPLEMENTED) is
expected for inquiry to 6th input plug.

Hm. I guess your issue is a kind of Heisenbugs[1]. It seems to
depend on case. To drill down the case in which the issue
appears, I'd like you to investigate whether you can see the
same log every time you run with libffado (jackd with Firewire
backend, or ffado-dbus-server) or not:

> Error (bebob_avplug.cpp)[ 237] discoverPlugType: Plug does not implement extended plug info plug type info command
> Error (bebob_avplug.cpp)[ 120] discover: discover: Could not discover plug type (1,1,0,0,1)


Additionally, I write a patch for ALSA bebob driver to support
your device[2]. If you need a prompt solution to use the device in
Linux-based system, it's available in topic branch of my remote
repository. But it's required for you to study the way to update
installed driver modules...

I note that ALSA bebob driver supports transmission of audio frames
and MIDI messages, thus it's not available to control internal DSP.

[1] https://en.wikipedia.org/wiki/Heisenbug
[2] https://github.com/takaswie/snd-firewire-improve/commit/1c9fabb7dd9de36ea829700df7eb13a40393a679
[3] https://github.com/takaswie/snd-firewire-improve/tree/topic/fw66


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
