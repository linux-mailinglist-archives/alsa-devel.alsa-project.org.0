Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0947323D545
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 04:08:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85CD5166A;
	Thu,  6 Aug 2020 04:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85CD5166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596679679;
	bh=bJMDnYDClvI5xtIKBwVHUdgR6/yb9kRDQOr9FzsaGEE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vwzeak8z1ov7iM8YbDf5Yw7d5nPTDrMS9obJEfJ6DwdzTM5zCryAN4L9YvLL28yak
	 k/SlEx42tXUiyVxkjdnrPAWH0/pyhm6sPM5bcKFj8BCK0yPEjLF2EM0+9o0MjFN/bc
	 H5YG+tFPMC7WSGtffHPJVwkpFAsb3XsiM7Q0D4W8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE258F8015A;
	Thu,  6 Aug 2020 04:06:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29147F80159; Thu,  6 Aug 2020 04:06:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,PRX_BODY_30,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32B5CF80086;
 Thu,  6 Aug 2020 04:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32B5CF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Tc9AEl5P"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TxRaPF9o"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 899F15C0066;
 Wed,  5 Aug 2020 22:06:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 05 Aug 2020 22:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=H2Aogu+HjK2+zQjG0j8a44fidly
 rcn46SSfSRh7smOU=; b=Tc9AEl5PZyFkeOXxBME4Im4VLtGnfn/ITld0tWVG4a9
 crxYnlub0r12Q7bICru+LDjxbcQkUyxRijfhxRO17Yh/1klf0zWZdNqbyVqmjfA7
 olc4IKMj0nydj4Au6Ax6QhFkwrhTE6TTd6xsB7tvRpKZ1611zd+y7pbYkwDiSAgC
 k2Tctj/qBpDCL0GoKNF8+qz5swnCqpx7B2nXPpRrLQUfni+RUZGLjDQhsEUQJlG9
 jXWl++/Kf0jGtShhJ/118WWAVJmNNwjQX14IxvRdDCW0tFYiZ+8ggMGzoMWDSRA0
 /BK4hXxT0s4CZ7kSNST14UdeEj3o4WFAX/zEPg3O/rQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=H2Aogu
 +HjK2+zQjG0j8a44fidlyrcn46SSfSRh7smOU=; b=TxRaPF9obTv0qgFOgWFK9p
 +EnO6Gc1EMacb0xzKt56C3KW3aL4LtZ2FaPZxBka62jKQaZdgS/NTB7TjrHXPMk/
 h+fWQIcqkzxAzeQbppbXYgSlgiLfiV7iWvMPi1v97/aKzGxjhHL4jaWY738jOgeK
 Q29/6WA+8CVHsqgnPIfoKnILE3W3yoS+u/9a4ZfgwLpBekBWnUjUutanHCSZnSE/
 ubudnr4OSuocYFT13oVSvT3Js1NKm1qUeLaxrP1QTyHF0qXnazcOpW3RAC0yXhSk
 9ww8aYHVixCuW1LxBvLNhOdb3QvbRZTq8nVRfNG/RKXxQMK1L0N7rgfxe8okJWyQ
 ==
X-ME-Sender: <xms:jGUrX0nwGYtTmn5s6MhpHq2ZSlv8AVhTrMxB5hVKzj8KOzIp-1WCQg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrjeelgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehttdertd
 dttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpefgleeifedtle
 fgtdelgfekkefhvefhkeduffffgeeigedvueelvdevieekueeufeenucffohhmrghinhep
 fhhrvggvuggvshhkthhophdrohhrghdptggrrhgurdhnvgifpdhkvghrnhgvlhdrohhrgh
 dprghlshgrqdhprhhojhgvtghtrdhorhhgpdhgihhthhhusgdrtghomhenucfkphepudek
 tddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:jWUrXz0BL6HnCPhJvt8xsTxSvCG5qwmGEw71XHU3XCZEqIGh5di11g>
 <xmx:jWUrXyqtvN3Elo1_50A5sPRAiRf0XWrwV7vDttuHtN4ooPXBNBa2BQ>
 <xmx:jWUrXwnjhEDVpX1GHGO5Gjks3lXUXoUCdImWxuZ1p3ghbBCN15qOFg>
 <xmx:jWUrX3-FPgp8JoVqXea25sH7JABMMcI9ZoHnXQ4XyOrk9dPkdDajYw>
Received: from laptop (ad003054.dynamic.ppp.asahi-net.or.jp [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id D61EC3280066;
 Wed,  5 Aug 2020 22:06:03 -0400 (EDT)
Date: Thu, 6 Aug 2020 11:06:01 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Tom Yan <tom.ty89@gmail.com>
Subject: Re: Why doesn't mixer control (values) have some kind of locking
 mechanism? (mutex?)
Message-ID: <20200806020601.GA6286@laptop>
Mail-Followup-To: Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org,
 alsa-user@alsa-project.org,
 pulseaudio-discuss@lists.freedesktop.org
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
Cc: alsa-devel@alsa-project.org, pulseaudio-discuss@lists.freedesktop.org,
 alsa-user@alsa-project.org
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

On Thu, Aug 06, 2020 at 01:31:03AM +0800, Tom Yan wrote:
> Hi all,
> 
> I just wonder if it's a "no one cares" or a "no one was aware of it"
> issue (or maybe both?).
> 
> When you change (integer) values (e.g. volume) of a mixer control, it
> usually (if not always) involves calling two functions/methods of a
> snd_kcontrol_new, which are get and put, in order to do relative
> volume adjustments. (Apparently it is often done relatively even if we
> have absolute values, for reasons.)
> 
> While these two "actions" can be and probably are mostly "atomic"
> (with the help of mutex) in the kernel drivers *respectively*, they
> are not and cannot be atomic as a whole.
> 
> This won't really be an issue when the actions (either for one or
> multiple channels) are done "synchronously" in *one* program run (e.g.
> amixer -c STX set Master 1+). However, if such a program run is issued
> multiple times "asynchronously" (e.g. binding it to some
> XF86Audio{Raise,Lower}Volume scroll wheel), volume adjustment becomes
> a total mess / failure.
> 
> If it isn't obvious enough. it could happen like the following:
> get1(100 100)
> set1(101 100)
> get2(101 100)
> set2(102 100)
> ...
> 
> Or worse:
> get1(100 100)
> get2(100 100)
> set1(101 100)
> set2(100 101)
> ...
> 
> Not only that it may/will not finish the first set of adjustments for
> all channels before the second, get() from the second set could happen
> before set() from the first, reverting the effect of the earlier
> one(s).
> 
> Certainly one can use something like `flock` with amixer to make sure
> the atomicity of each issue/run, but not only that it looks silly and
> primitive, we don't always manipulate the mixer control with an
> "executable". For example, this weird issue in pulseaudio is probably
> related: https://bugs.freedesktop.org/show_bug.cgi?id=92717
> 
> So I wonder, is there a particular reason that mixer control doesn't
> possess some form of lock, which allows any form of userspace
> manipulation to lock it until what should be / is considered atomic is
> finished?

ALSA control core allows applications to lock/unlock a control element
so that any write opreation to the control element fails for processes
except for owner process.

When a process requests `SNDRV_CTL_IOCTL_ELEM_LOCK`[1] against a
control element. After operating the request, the control element is
under 'owned by the process' state. In this state, any request of
`SNDRV_CTL_IOCTL_ELEM_WRITE` from the other processes fails with
`-EPERM`[2]. The write operation from the owner process is successful
only. When the owner process is going to finish, the state is
released[3].

ALSA userspace library, a.k.a alsa-lib, has a pair of
`snd_ctl_elem_lock()` and `snd_ctl_elem_unlock()` as its exported
API[4].

If application developers would like to bring failure to
requests of `SNDRV_CTL_IOCTL_ELEM_WRITE` from the other processes in
the period that the process requests `SNDRV_CTL_IOCTL_ELEM_READ` and
`SNDRV_CTL_IOCTL_ELEM_WRITE` as a transaction, the lock/unlock
mechanism is available. However, as long as I know, it's not used
popularly.


This is a simple demonstration about the above mechanism. PyGObject and
alsa-gobject[5] is required to install:

```
#!/usr/bin/env python3

import gi
gi.require_version('ALSACtl', '0.0')
from gi.repository import ALSACtl

import subprocess

def run_amixer(should_err):
  cmd = ('amixer', '-c', str(card_id),
    'cset',
    'iface={},name="{}",index={},device={},subdevice={},numid={}'.format(
        eid.get_iface().value_nick, eid.get_name(),
        eid.get_index(), eid.get_device_id(),
        eid.get_subdevice_id(), eid.get_numid()),
    '0,0',
  )

  result = subprocess.run(cmd, capture_output=True)
  if result.stderr:
    err = result.stderr.decode('UTF-8').rstrip()
    print(' ', 'expected' if should_err else 'unexpected')
    print('   ', err)
  if result.stdout:
    output = result.stdout.decode('UTF-8').rstrip().split('\n')
    print(' ', 'expected' if not should_err else 'unexpected')
    print('   ', output[-2])

card_id = 0
card = ALSACtl.Card.new()
card.open(card_id, 0)

for eid in card.get_elem_id_list():
  prev_info = card.get_elem_info(eid)
  if (prev_info.get_property('type') != ALSACtl.ElemType.INTEGER or
      'write' not in prev_info.get_property('access').value_nicks or
      'lock' in prev_info.get_property('access').value_nicks):
      continue

  card.lock_elem(eid, True)
  print('  my program locks: "{}"'.format(eid.get_name()))
  run_amixer_subprocess(True)

  card.lock_elem(eid, False)
  print('  my program unlocks: "{}"'.format(eid.get_name()))
  run_amixer_subprocess(False)
```

You can see the result of amixer execution is different in the cases of
locked and unlocked, like:

```
$ /tmp/lock-demo
  ...
  my program locks: "Headphone Playback Volume"
  expected
    amixer: Control hw:1 element write error: Operation not permitted
  my program unlocks: "Headphone Playback Volume"
  expected
      : values=0,0
  ...
```


[1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/include/uapi/sound/asound.h#n1083
[2] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/core/control.c#n1108
[3] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/tree/sound/core/control.c#n122
[4] https://www.alsa-project.org/alsa-doc/alsa-lib/group___control.html#ga1fba1f7e08ab11505a617af5d54f4580
[5] https://github.com/alsa-project/alsa-gobject


Regards

Takashi Sakamoto
