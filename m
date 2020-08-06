Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221123DE10
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 19:21:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01F3C82E;
	Thu,  6 Aug 2020 19:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01F3C82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596734508;
	bh=DRGrHfUcDUiAYns8/raVryo2t5vv+BdvUI9PyvG030k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Owx8wunMipv2DZiRdM1QLxCT2uqYdB5cr03lzaIMb7tyZAoBIpDtdMZqOkFE1Zmiw
	 4TUnQwKj2vmVK1/uyfnTsvP9NfxuFgqo3QU+nVA2uvDIbjrBxsoJfFZI5kpQwnVTbI
	 hcAdhbgADLU4477W5mFHLtLi2ycvtPjuBDwjL4vk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23561F8015C;
	Thu,  6 Aug 2020 19:20:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB0C6F80159; Thu,  6 Aug 2020 19:20:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODYSUB_1, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0A69F80124;
 Thu,  6 Aug 2020 19:19:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0A69F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="CjydkKur"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="bbBeb2xW"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 8BCD7C8B;
 Thu,  6 Aug 2020 13:19:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 06 Aug 2020 13:19:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=T68lBLgZnHuZAIz6I7G63Nb8hfk
 wLPrVa4aXyTNBIuA=; b=CjydkKurCXeOCDZk6KU55tJSOPv2ViiIIMWT+mPDMLa
 1+d+NWhB8JTh3EQ2r6Ktl9rMgoAEfhgFR7eHnWbKDeJF69IAgSjj/3AgTjr8TsZ0
 SVjHdXSQU9SjVqrutscBq97zmrZIKwWpSK+0MqHgHEokOJmc3KlTfyjKYSmNRiI9
 Uycw7c3SXLlKpB72YiCKfE0hyH3l10v2OsdwHdnf+854Wf/bt/mtotghMeBrvMii
 2o8NnGB8PThDsfXaTGSi+Q42GpNqQDh7+aKSf0LK+hDgEuFM5WIav+4jp/qUkNtp
 N2aD99Xjy3J2Qn/rvWN/8BCdFO4NlZxZQjfLtjbjlyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=T68lBL
 gZnHuZAIz6I7G63Nb8hfkwLPrVa4aXyTNBIuA=; b=bbBeb2xW8yqjIhwvrC/yF+
 OtYsUGl+C/q0oKosM1eKnK65B6c2RsRC74GCod8bAxAMTzZjwV/X7e/rkeukNb02
 zw51Lx6FrY/6mJaW5Sf5pKPAssc2jzAl+dz70ofiWGirILb7quH/50eSwPg9PLDx
 HyRhdwW7B5MmHg8L8J7Y/GfNJxY0iSDjfGpO5f+etiIhrmL3J2/iwG2bRBb21M78
 u5sbpALvopxJE4KdN9LIVnL8pDxhQhh2e8pi+X0W3T+SkZ7/MfiG84v4xwLMrj5f
 iKGls75QxUg+f4DLMY+j9ggZUoi4kOZWIsg8aHfGd27Uza7hUdtqSeLl4kTGE0xw
 ==
X-ME-Sender: <xms:qzssX1zfwRWyLt69Hj_EMR6MQlzddgj8sPcT8poIlukVKqk6cEo6OA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnheplefhueegvd
 ejgfejgfdukeefudetvddtuddtueeivedttdegteejkedvfeegfefhnecukfhppedukedt
 rddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:qzssX1Te_mrXvcfG3bYi8lEbt6pisTraZ-8UKcy3Hpm8D5buWf7OGA>
 <xmx:qzssX_V5FE_VXOYrpUvZmoAsvgNJ4NCt0sUlgOpCN-hOaXLjFguCHA>
 <xmx:qzssX3h3CTrQzLt0wdbC_7V57eMpvdW3kv_JpzWCbVPfcJuGTcHwPw>
 <xmx:rDssX875GkTGCeJS_Ir1mm9Zxb81wKxgA4ljvM-BgvjRohElzxNjRA>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 34795328005E;
 Thu,  6 Aug 2020 13:19:38 -0400 (EDT)
Date: Fri, 7 Aug 2020 02:19:36 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Tom Yan <tom.ty89@gmail.com>
Subject: Re: Why doesn't mixer control (values) have some kind of locking
 mechanism? (mutex?)
Message-ID: <20200806171936.GA400233@workstation>
Mail-Followup-To: Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org,
 alsa-user@alsa-project.org,
 pulseaudio-discuss@lists.freedesktop.org,
 pierre-louis.bossart@linux.intel.com
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
 <20200806020601.GA6286@laptop>
 <CAGnHSEnMhF-1y7rL=JsmcFdTNVaA5ygv5N4TS9dhpORyOm+H_A@mail.gmail.com>
 <20200806091458.GA360003@workstation>
 <CAGnHSEkV9cpWoQKP1mT7RyqyTvGrZu045k=3W45Jm=mBidqDnw@mail.gmail.com>
 <20200806144729.GA381789@workstation>
 <CAGnHSEn+hLKCtyhW8i2PBy2Wo-yMfpK6Jc49avrHXY8BA9N1VQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGnHSEn+hLKCtyhW8i2PBy2Wo-yMfpK6Jc49avrHXY8BA9N1VQ@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, pulseaudio-discuss@lists.freedesktop.org,
 alsa-user@alsa-project.org, pierre-louis.bossart@linux.intel.com
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

On Thu, Aug 06, 2020 at 11:34:12PM +0800, Tom Yan wrote:
> On Thu, 6 Aug 2020 at 22:47, Takashi Sakamoto <o-takashi@sakamocchi.jp> wrote:
> > As long as I know, neither tools in alsa-utils/alsa-tools nor pulseaudio
> > use the lock mechanism. In short, you are the first person to address
> > to the issue. Thanks for your patience since the first post in 2015.
> >
> > > As for the compare-and-swap part, it's just a plus. Not that
> > > "double-looping" for *each* channel doesn't work. It just again seems
> > > silly and primitive (and was once confusing to me).
> >
> > I prepare a rough kernel patch abount the compare-and-swap idea for
> > our discussion. The compare-and-swap is done under lock acquisition of
> > 'struct snd_card.controls_rwsem', therefore many types of operations
> > to control element (e.g. read as well) get affects. This idea works
> > well at first when alsa-lib supports corresponding API and userspace
> > applications uses it. Therefore we need more work than changing just
> > in userspace.
> >
> > But in my opinion, if things can be solved just in userspace, it should
> > be done with no change in kernel space.
> 
> I didn't know much about programming or so back then (even by now I
> know only a little) when I first noticed the problem, so I just
> avoided using amixer / my volume wheel / parts of pulse and resorted
> to alsamixer. For some reason the race didn't *appear to* exist with
> onboard or USB audio but only my Xonar STX (maybe because volume
> adjustments take a bit more time with it), so for a long time I
> thought it's some delicate bug in the oxygen/xonar driver that I
> failed to identify. Only until very recently it gets back to my head
> and becomes clear to me that it's a general design flaw in ALSA.
> 
> Just to confirm, does SNDRV_CTL_IOCTL_ELEM_LOCK currently prevent
> get()/read? Or is it just a write lock as I thought? If that's the
> case, and if the compare-and-swap approach doesn't involve a lot of
> changes (in all the kernel drivers, for example), I'd say we better
> start moving to something neat than using something which is less so
> and wasn't really ever adopted anyway.

In your case, SNDRV_CTL_IOCTL_ELEM_LOCK looks 'write-lock', therefore
any userspace applications can do read operation to the control element
locked by the other processes.

To solve the issue, the pair of read/write operations should be done
between lock/unlock operations. I can consider about two cases.

A case is that all of applications implements the above. This is
already proposed. The case is that the world is universe.

+-----------+-----------+
| process A | process B |
+-----------+-----------+
|   lock    |           |
|   read    |           |
|           |lock(EPERM)| reschedule lock/get/put/unlock actions
|   write   |           |
|           |lock(EPERM)| reschedule lock/get/put/unlock actions
|  unlock   |           |
|           |   lock    |
|           |   read    | calculate for new value
|           |   write   |
|           |  unlock   |
+-----------+-----------+

Another case is that a part of application implements the above. Let
me drill down the case into two cases. These cases are realistic
(sign...):

+-----------+------------+
| process A | process B  |
+-----------+------------+
|   lock    |            |
|   read    |            |
|   write   |            |
|           |    read    | calculate for new value 
|           |write(EPERM)|
|  unlock   |            |
|           |   write    | <- expected value
+-----------+------------+

+-----------+------------+
| process A | process B  |
+-----------+------------+
|   lock    |            |
|   read    |            |
|           |   read     | calculate for new value
|   write   |            |
|           |write(EPERM)|
|  unlock   |            |
|           |   write    | <- unexpected value
+-----------+------------+

The lock/unlock mechanism is not perfect solution as long as any
applications perform like the process.

If we can expect the most of applications to be back to read operation
at failure of write operation, thing goes well.

+-----------+------------+
| process A | process B  |
+-----------+------------+
|   lock    |            |
|   read    |            |
|           |   read     | calculate for new value
|   write   |            |
|           |write(EPERM)|
|  unlock   |            |
|           |   read     | calculate for new value
|           |   write    | <- expected value
+-----------+------------+


Thanks

Takashi Sakamoto
