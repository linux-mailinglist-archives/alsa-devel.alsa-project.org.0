Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF0923E9CF
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 11:10:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 626081612;
	Fri,  7 Aug 2020 11:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 626081612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596791442;
	bh=I/GUhA5Z0l9bP9Z+flYQDDjGDNHKV642xJDsh9uBYrE=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pV/SvsRNjWLhc1fRFzabdJjtar3KjUNHu6YSn3FwJazL5ui47l6NKoK5qbY+oGFS9
	 z+4tClPYBu19I0gD9eEvtDBgPmp8cK3PzpsbGB/rvEC5W+/ijhaEktzGR5anlTXGPM
	 HYXWsd06XQ9Eh6xgWPIGrcgxJlhtRq5wqwCSAZ70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C7ACF8020B;
	Fri,  7 Aug 2020 11:09:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 083A0F80218; Fri,  7 Aug 2020 11:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45DC5F801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 11:08:52 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0D12CA003F;
 Fri,  7 Aug 2020 11:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0D12CA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1596791332; bh=6zTHlIL4eV9qVRefKLb1FPd22z0KThRwYv6wefUylE8=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=2cB4mZTK1YEnEfJIxJMgsen1DNu+XAxE6R/KoPYPW1upvx3KVpqQxsNEU5V7dUoTe
 T5N0gjQyf3INcgBP4T92lSea614tXCEO437Y4o/z9n9IEV99Rg/xEaX8gvoEVsz61a
 o7cj7ZMI3+FBH2sxpkxoGGa7gqt7ii2qmTc1qqCw=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  7 Aug 2020 11:08:46 +0200 (CEST)
Subject: Re: Why doesn't mixer control (values) have some kind of locking
 mechanism? (mutex?)
To: Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 pulseaudio-discuss@lists.freedesktop.org,
 pierre-louis.bossart@linux.intel.com
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
 <20200806020601.GA6286@laptop>
 <CAGnHSEnMhF-1y7rL=JsmcFdTNVaA5ygv5N4TS9dhpORyOm+H_A@mail.gmail.com>
 <20200806091458.GA360003@workstation>
 <CAGnHSEkV9cpWoQKP1mT7RyqyTvGrZu045k=3W45Jm=mBidqDnw@mail.gmail.com>
 <20200806144729.GA381789@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <b6a8e6fd-3577-08d3-e289-c7a121450fd3@perex.cz>
Date: Fri, 7 Aug 2020 11:08:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806144729.GA381789@workstation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 06. 08. 20 v 16:47 Takashi Sakamoto napsal(a):
> Hi,
> 
> On Thu, Aug 06, 2020 at 08:31:51PM +0800, Tom Yan wrote:
>> Yeah I suppose a "full" lock would do. (That was what I was trying to
>> point out. I don't really understand Pierre's message. I merely
>> suppose you need some facility in the kernel anyway so that you can
>> lock from userspace.) I hope that amixer the utility will at least have
>> the capability to reschedule/wait by then though (instead of just
>> "failing" like in your python demo).
> 
> As long as I know, neither tools in alsa-utils/alsa-tools nor pulseaudio
> use the lock mechanism. In short, you are the first person to address
> to the issue. Thanks for your patience since the first post in 2015.
> 
>> As for the compare-and-swap part, it's just a plus. Not that
>> "double-looping" for *each* channel doesn't work. It just again seems
>> silly and primitive (and was once confusing to me).
> 
> I prepare a rough kernel patch abount the compare-and-swap idea for
> our discussion. The compare-and-swap is done under lock acquisition of
> 'struct snd_card.controls_rwsem', therefore many types of operations
> to control element (e.g. read as well) get affects. This idea works
> well at first when alsa-lib supports corresponding API and userspace
> applications uses it. Therefore we need more work than changing just
> in userspace.
> 
> But in my opinion, if things can be solved just in userspace, it should
> be done with no change in kernel space.

The compare-and-swap is just a limited mechanism which does not resolve all
possible usage cases (mainly the operation grouping).

I read the whole story and I basically don't think that we need to handle this
in the kernel space. The arbitration should be easily implementable in the
user space. We can agree that we need to add a new extension which will grant
to the user space application the exclusive access to change one or more
control elements exclusively possibly based on the previous contents.

I would propose a new alsa-lib API extension (which may be shared with other
ALSA user space APIs): System V semaphore (man 2 semop). We can use the named
semaphore. Two functions can be added like snd_ctl_transaction_begin() and
snd_ctl_transaction_end() to alsa-lib. The wait condition can be handled
through an argument to snd_ctl_transaction_begin(). It might be probably also
nice to consider the poll multiplexing implementation for the wait condition
(use a message queue to notify other tasks when the semaphore was released).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
