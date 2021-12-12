Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD01471A49
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 14:05:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7970C1ACD;
	Sun, 12 Dec 2021 14:04:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7970C1ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639314317;
	bh=+8c9qiSOdqrEOlDMfzpOQ7YRL0BrCu0ThKu031Nm7Nk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKEwFBrh31Dn7M2diJMR9Q7h0mE2xln+JsYwgAUG6f29NhcVyI6ieONxD9GsTn3ZX
	 1OCnzjU38chY4uMbR61g1O3ZNfRtu8Ale74TpkJ+MWDB/H1lQbY2//GKF818XW7NJG
	 8Fxi4u7r/d+twjVlEmym3j71UN/8THJbUH8wza/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7065F80249;
	Sun, 12 Dec 2021 14:04:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD800F80246; Sun, 12 Dec 2021 14:04:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mailrelay1.jaist.ac.jp (mailrelay1.jaist.ac.jp
 [IPv6:2001:df0:2ed:8200::22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF4A3F80161
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 14:03:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF4A3F80161
IronPort-SDR: 9W5YYExOZyFeAeiNTFWiatzJ6NJ6FS9ayfxoDdqacjdRzZo/lpur3HVC+3TJdOwuJxWYr4DA4q
 BA5rWLLtGcYGUVYYiEwm3tCAvSKFOf7WGMGo2XODtluKPknbLkwtRZM0EVxOHB4ci5E0cW4vKZ
 MVwQN8jp/xATUfkbBj9u8qql5uMnwP+TSfb1LiBV3w/IUWS+ltPDzPVupReKjADZCM6WETPUii
 oSycpNioQXlnVy/6+yAfYIV9z3CS46voYPInFz0J9ezpsSvemcRapJVXUjcL1W31jnWoBBembN
 QmI=
X-IPAS-Result: =?us-ascii?q?A+ElAACh8rVh/4d6BCSPi4OGAIbX/IAAoAtaHAEBAQEBA?=
 =?us-ascii?q?QcBARIBAQQEAQFAgUUHAQELAYFRAYFSV2uESIgjYIgQA5EMizqBfAIJAQEBR?=
 =?us-ascii?q?gcBAgQBAQMEhH8CgyMmNAkOAQIEAQEBAQMCAwEBBwEBAQUBAQEBAQEFAwECA?=
 =?us-ascii?q?oEYhS85g2CBCAEBAQEBAQEBAQEBAQEBAQEBAQEWAg1SZwEFIxVBEAgDDQEKA?=
 =?us-ascii?q?gImAgJXBgoDBgIBAYJtAYMYDrBYgTEaZ4NOAYQMJU2BJgaBECoBiiiECUOCD?=
 =?us-ascii?q?YE8DAOCdD6CTBcEhHaCZQSSboExEIEFQBlUHI1lB5MRXosdkkyDSoQChmGUM?=
 =?us-ascii?q?AYPBS6Db4wBhSKBFgORJZYsixmBZJoBgSyCFTMaCDCDJREBPo5UFohkhVkyM?=
 =?us-ascii?q?wIBNQIGCwEBAwmFRAgBFQgSAQoBimgBAQ?=
IronPort-Data: A9a23:gM7wWqALqc1BrxVW/33iw5YqxClBgxIJ4kV8jS/XYbTApD8l0z0Dy
 TcWDW+AMv3eamb3e94ia4yxp0gEuZHQmNQwTANkpHpgZkwRpJueD7x1DKtQ0wB+jyHnZBg6h
 ynLQoCYdKjYdpJdz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En5400s5w7dRbrNA2LBVPSvc6
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKkiyZSZdBMUdGX08tmSH
 I4vxJnhlo/QEoxE5tmNyt4XeWVSKlLe0JTnZtO7lMFOjzAbzhHe3JrXO9I+bnVoigjWo+pv7
 +91rrKSTjkrA4TTzbF1vxlwS0mSPIV12Yf5fyrl7ZTPnRLPIyS+zawwVBM9ZtVAqLh+D28cp
 6VAcDo4BvyBr7jqmO7pFeA82ZYtdZezbohE4ikykzjXA6R0GMibSc0m5vcBtNs0rttLFOzfY
 NExazNudwiGahYJOE9/5JcWx7fx2iSkL1W0rnrJr/QRwU7+xjcs66i9PPjZQ/PVSdVKyxPwS
 mXuuj6R7gshHNva1TOG+2msh8fUlCDyXYUZH725sPxy6HWawncaTREbS1a/ifC9kUf7Q8hYK
 UEf5mwpt6dayaCwZoOhB0Hq/3fU4UwSAoQIQeZhsFnflKPa7VTLXzBcRFatdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:TdGLxaDcUgnbXnrlHemt55DYdb4zR+YMi2TDGXoBKiC9Afb3qy
 nIpoV96faUskd0ZJhOo7q90cW7MBHhHNtOkOws1NSZMTUO2lHCEGgK1+KL/9SjIU3DH4Vmup
 uIHZIeNDS9NzRHsfo=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.88,200,1635174000"; 
   d="scan'208";a="3814534"
Received: from unknown (HELO [IPV6:2404:7a87:f160:c300:6aff::100b])
 ([IPv6:2404:7a87:f160:c300:6aff::100b])
 by mailrelay1.jaist.ac.jp with ESMTP; 12 Dec 2021 22:03:32 +0900
Message-ID: <2b54cb06-0c26-86d5-6249-180700e212c2@jaist.ac.jp>
Date: Sun, 12 Dec 2021 22:03:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: S24LE and S32LE format equivalency
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <2a4907ee-96d2-9969-de47-80b77b7444d1@jaist.ac.jp>
 <YbXiNdYIp99Df47Q@workstation>
From: Marios Sioutis <smarios@jaist.ac.jp>
In-Reply-To: <YbXiNdYIp99Df47Q@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa <alsa-devel@alsa-project.org>
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

Takashi,

Thanks for taking the time to answer.

On 12/12/21 20:51, Takashi Sakamoto wrote:
> Hi,
>
> On Sun, Dec 12, 2021 at 08:16:57PM +0900, Marios Sioutis wrote:
>> Hi all,
>>
>> Quick question, I was troubleshooting a 24bit USB device and got down the
>> rabbit hole of sample formats. The device advertises itself as S24LE (4byte
>> payload) but it appears as S32LE under alsa, something that bothered me a
>> lot initially. However, If the conversion between the two formats is to just
>> << 8 i.e. put a zero byte as LSB, then the two formats are essentially
>> equivalent.
>>
>> Is this actually the case? If yes, who performs the conversion? Is it on the
>> alsa side, or the device already adds a zero byte LSB?
>>
>> Thank you in advance,
>>
>> Marios
>   
> I think the format of sample is 'left-justified' or 'right-padding' 24
> bit in 32 bit frame. For the case, in ALSA PCM interface, [S|U]32 sample format is
> used with 'msbits' hardware parameter. The snd-ua101 USB driver might be
> an good example for the case.
>
>   * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/usb/misc/ua101.c#n615
>
> In detail, please refer to my previous patch:
>
>   * https://lore.kernel.org/alsa-devel/20210529033353.21641-1-o-takashi@sakamocchi.jp/

A left-justified format, with USB being a LSB first protocol would mean 
that an S24LE device would send a sample as:

(LSB) oooooooo oooooooo oooooooo xxxxxxxx(MSB)

x = zeroes, garbage, who knows! (trailing bits)

o = actual payload.

I was wondering how these trailing x bits are treated and I looked up 
the USB specification for the Audio Data Formats. Section 2.2.2. states:

"AudioStreaming endpoints must be constructed in such a way that a valid 
transfer can take place as long
as the reported audio subframe size (bSubframeSize) is respected during 
transmission. If the reported bits
per sample (bBitResolution) do not correspond with the number of 
significant bits actually used during
transfer, the device will either discard trailing significant bits 
([actual_bits_per_sample] >
bBitResolution) or interpret trailing zeros as significant bits 
([actual_bits_per_sample] <
bBitResolution)."

That is, in our case the trailing x bits should be discarded. I had a 
problem that could be explained if these trailing x bits *weren't* 
discarded, but I'm sure alsa is doing the correct thing here, or else 
pretty much every 24bit device in existence would be broken.

This is good enough for me. Unless there's a serious mistake in anything 
said above, consider my question answered.

Thank you for your time!

