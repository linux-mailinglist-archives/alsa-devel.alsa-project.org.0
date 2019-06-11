Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BB53C7F9
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 12:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E34E16CA;
	Tue, 11 Jun 2019 12:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E34E16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560247268;
	bh=lQVfWePTLYM/tabFJZwXnBkNS6T7zQGJojhyNkC0q3w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZ3vqYjyKfs4tN4fCNR0JojVuwst6wBjnpRz3dsBt4rssOpr23laKaMXlfelIlQyV
	 9ExE+OMZpApbi1EUWVGxEYAuoON43/DBo8MxsRjZGCjfNkW6jVLD3HW2N9jExgpYUU
	 nDFEFE2TysfgyliwsVZO+3frewfTSnmShDdq/3RM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E9CCF89711;
	Tue, 11 Jun 2019 11:59:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95103F8970F; Tue, 11 Jun 2019 11:59:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71CA3F806F5
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 11:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71CA3F806F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="orVQeVq+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="FN/vuRDI"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 85BC821D51;
 Tue, 11 Jun 2019 05:59:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 05:59:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=eL40BhETybV7qfNl5GXtNsQ7UXA
 aZCPiaSPNyjHHymk=; b=orVQeVq+UDYfILzAsU6x7Sd3wfQgvlTADr49SSvF6x5
 OMjhKz2fZQytfy18EowhG7k5X2tRLpWXdwfQyl+A93Pe5IAS7UvjMHT7DtQ0ckwz
 sEEgQhZ5CMOKFvzIU3pTDBttX4VIK1SCWvyYPdTbbONHgTCJPkZmij7cX13IdIGt
 +wVsfpTC4N7VJkqSRNCtcbvxu9wyRPqKiGlpEuQBXw1nOvAemCX4g6g5M2UVvp/d
 v5hW0iFUdg0YyPC33SifFxVuFw6xOFFLB19XzJ8u2xOl/8TqcNurUlB7ovsPe0bH
 F10azF73undcXO+DfFHThuraFNIL/rINCIAXnb7luUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=eL40Bh
 ETybV7qfNl5GXtNsQ7UXAaZCPiaSPNyjHHymk=; b=FN/vuRDI56ApSJGGVVCILz
 /o2jwZp0F3R+Fmz2EqQp+pwDgPjrdjno2FFl1SD41WyaTkPtQ4bXOA/+4chDZhzS
 sJklGghW+GcTvMeqJFlGIa1g/XUyDHYRbiSQqCpvGuvPPPo0ED8Q3QPHwQn7qMH2
 CLj5pTwb6dgjxHpyuHNMJvlqxAOg13bszEnTJBhHhDzX8hRSHzCBoIcUUecWYuS9
 uUPnViOmdDAWDq/Kf1cJZg0eIfTunT49f53FVl4jQmuJSHcouL0eRGyvN8Fsa1Cu
 KJoLHnG76I9eSOG7LiepdJszyIVji0K4ib4TzmPxWIqnI7bj4Zhc+R+dbqlo3sPw
 ==
X-ME-Sender: <xms:cnv_XOT7QjholOVJz-qfjnnI4cUL11TUcD7ccNt25iL2YCBS9XDOBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:cnv_XJQOY7nPv7BFQTr1qgsYDPUt38OTa2zJfyK1jkpQElmyupfxbQ>
 <xmx:cnv_XOiWONHvPpOIeL6U6tklrZubFy5dQ_G0aJ4tmotpE72SGnzUJA>
 <xmx:cnv_XHYwuzq5ZxTYnUDQWbxOhyRhKpnytKMQRauiAc-tLX4iRDum5w>
 <xmx:c3v_XBNlk8GpL5IDjS5_q8Bb-Tz7PLjGwXROcoa8m0PA5JtWj_SrXQ>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id EC765380084;
 Tue, 11 Jun 2019 05:59:12 -0400 (EDT)
Date: Tue, 11 Jun 2019 18:59:10 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190611095909.GA19071@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
 <s5hblz4bgyy.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hblz4bgyy.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
Subject: Re: [alsa-devel] [PATCH 00/15] ALSA: firewire-tascam/fireface:
 reserve/release isochronous resources in pcm.hw_params/hw_free callbacks
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

On Tue, Jun 11, 2019 at 11:37:25AM +0200, Takashi Iwai wrote:
> On Sun, 02 Jun 2019 09:12:44 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > This patchset is a part of series of patches for all of drivers in
> > ALSA firewire stack to reserve/release isochronous resources in
> > pcm.hw_params/hw_free callbacks.
> > 
> > In current implementation, the resources are reserved at the same time
> > to start packet streaming, and released at the same time to stop packet
> > streaming. However, once allocated, the resources are available
> > independent of lifetime of packet streaming.
> > 
> > The isochronous resources are the resources of IEEE 1394 bus. On the
> > other side of view, it's a kind of resources of hardware to maintain
> > the bus (isochronous resource manager). For this kind of reservation and
> > release, hw_params and hw_free operations are suitable in ALSA PCM
> > interface.
> > 
> > Ideally, the operation to reserve/release isochronous resource should
> > be separated from the operation to start/stop packet streaming. However,
> > IEEE 1394 bus has reset event. Once reset occurs, isochronous resource
> > manager releases allocated resources. The resources should be
> > reallocated by requesters themselves. For this reason, in this patchset,
> > bus generation is checked before starting packet streaming. If
> > generation is updated, reallocation is requested to isochronous
> > resource manager, then packet streaming starts.
> > 
> > Takashi Sakamoto (15):
> >   ALSA: firewire-tascam: code refactoring for registration of
> >     isochronous channels
> >   ALSA: firewire-tascam: code refactoring for reservation of isochronous
> >     resources
> >   ALSA: firewire-tascam: code refactoring for release of isochronous
> >     resources
> >   ALSA: firewire-tascam: reserve/release isochronous resources in
> >     pcm.hw_params/hw_free callbacks
> >   ALSA: firewire-tascam: update isochronous resources when starting
> >     packet streaming after bus reset
> >   ALSA: firewire-tascam: minor code refactoring to finish streaming
> >     session
> >   ALSA: firewire-tascam: code refactoring for pcm.hw_params/hw_free
> >     callbacks
> >   ALSA: fireface: add protocol-specific operation to allocate
> >     isochronous resources
> >   ALSA: fireface: support allocate_resources operation in ff800 protocol
> >   ALSA: fireface: support allocate_resources operation in ff400 protocol
> >   ALSA: fireface: support allocate_resources operation in latter
> >     protocol
> >   ALSA: fireface: reserve/release isochronous resources in
> >     pcm.hw_params/hw_free callbacks
> >   ALSA: fireface: update isochronous resources when starting packet
> >     streaming after bus-reset
> >   ALSA: fireface: minor code refactoring to finish streaming session
> >   ALSA: fireface: code refactoring for pcm.hw_params/hw_free callbacks
> 
> Applied all 15 patches now.  Thanks.

Welcome back ;)

I've already prepared similar patchsets for the other drivers in ALSA
firewire stack. You'll receive the patchset several times in this week.
I'm happy if you review and apply them.


Thanks

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
