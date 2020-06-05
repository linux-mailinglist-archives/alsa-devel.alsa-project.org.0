Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 180481EEEFA
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jun 2020 03:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B12166D;
	Fri,  5 Jun 2020 03:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B12166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591320042;
	bh=//sK2hn/BtKdPLbkAUEPosEIwfrRNh5yQ/asV/lInO0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u9WTKzsb7DJoWRyYZyLR/jKb7EKhvE0S/YcTsxGzsgWCfXJ6Zm91b6EcfLBH3JAW6
	 HCiyZJdSZM2sfCETJdoRGFBt7gMGKbzo/HxPgv54oqjhlzo18maSl+NscY58HoQZlF
	 1RQsn7jzntEOD4xnwzjUgWE0sqFCJxd6Q+m+CzFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88B25F80260;
	Fri,  5 Jun 2020 03:19:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EA3EF80254; Fri,  5 Jun 2020 03:18:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB38FF8013C
 for <alsa-devel@alsa-project.org>; Fri,  5 Jun 2020 03:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB38FF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Xc2SYidh"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uiKtzrzr"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 72488714;
 Thu,  4 Jun 2020 21:18:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 04 Jun 2020 21:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=8r3opCeYiIXINxGcOSRJsEHarPk
 ow1GsNvGEej3S8DY=; b=Xc2SYidhIPa4ac5BmAN7eaFQ1mJorXh/zWLzT9Mjo5Q
 JJnkFSlqdvMpqAwfqpwy1A/6wmMsGyd88PgMai/uLrDr4AbO7fndPSChuANvg5Rf
 HoMDRxoIQUFDArq8kZ/iKC6PNf98XxRd/ZbOaKRB3IRZVZz0PRxVOkkF2WcXhYY6
 pUj02TxseQ7YPm0zugI6DgFV/rxLSxMa8vR67jl63x65oVdaOHJbd0MrKuDj2n3/
 BU2bm6ymxWy3B3IudY8XZuNVYWhBy67NCINH10/az0UnZCQe9Jb38q1uq5uFObGN
 Wob3pWWLqLydXcH9/oHsA+OB6N9nc+fDqlAKqHLtZew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8r3opC
 eYiIXINxGcOSRJsEHarPkow1GsNvGEej3S8DY=; b=uiKtzrzrNIzYW2R57TB9H+
 DQokEF1vHMj8oRHcCYqzjf+VTnGFG75NySoSQThBxQ1FSsLLQyTjznBPAlmNRJ9x
 WZoC6NQ5FrjYz6JTu9bik0VWCZHX4wf7Ppx9yUJfB7DACG+QX6fQr1E6iZ5LidHa
 CjoNoDVHD3ijjF9t9vRXO+v7iBN0uuc0no16bUqkAFd4B3j7eIQGvXExwGtOBZNt
 usIPMrn9r59PFADoX0Qgcr4CUKNiwAK7rjcP/vWAcgafQnRSyNIDy2RgzxYU5EI0
 GTT7a9PmAcj8ye/rlkjXjgdhQNUXse8Q28wPbH+/5an8rvwC8HwH1M2cLlAVQrBA
 ==
X-ME-Sender: <xms:dp3ZXit6DBr4KGKcjvMH9CTtam2DDx3r-2XuzxNaRAfG24AEC0uMFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudegvddggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelfffgfffgvdefgfeihfdvtedvtdejtdejffehfffh
 uedvheeghfeljeeiiedujeenucffohhmrghinhepghhithhlrggsrdgtohhmpdhgihhthh
 husgdrtghomhenucfkphepudektddrvdefhedrfedrheegnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmh
 hotggthhhirdhjph
X-ME-Proxy: <xmx:dp3ZXnfCrH4mN6gG-0GL5Z0jNgcQ-j0Sh2CBsb8vtmPK2z2KUWpzSA>
 <xmx:dp3ZXtwOWpX2r8VRQfmvGhkxQXhiiL-3OvQI085LeZ4LzxAV5rPBoA>
 <xmx:dp3ZXtNnZUDtjieUWiG927UXWP6PGuegdBDvoVqRiPjxVzy-dKjPHQ>
 <xmx:d53ZXjItBBX_drid_5XyjWThQZOTPh2tp6CgO1HQtzohGPi2ciDZgw>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id A17253280059;
 Thu,  4 Jun 2020 21:18:45 -0400 (EDT)
Date: Fri, 5 Jun 2020 10:18:43 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Scott Bahling <sbahling@suse.com>
Subject: Re: ALSA control service in user space
Message-ID: <20200605011843.GA268102@workstation>
Mail-Followup-To: Scott Bahling <sbahling@suse.com>,
 alsa-devel@alsa-project.org, guy@guysherman.com
References: <20200603100556.GA198303@workstation>
 <4c046724106e88b69584c6bf5604a5e7f7189c1f.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c046724106e88b69584c6bf5604a5e7f7189c1f.camel@suse.com>
Cc: alsa-devel@alsa-project.org, guy@guysherman.com
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

Hi Scott,

On Thu, Jun 04, 2020 at 09:02:23PM +0200, Scott Bahling wrote:
> Hi Takashi,
> 
> On Wed, 2020-06-03 at 19:05 +0900, Takashi Sakamoto wrote:
> > Now instead of Python 3, I select Rust language to write the server
> > programs for audio and music units on IEEE 1394 bus. The hinawa-rs helps
> > the third and fourth of the above tasks.
> 
> What does this mean for the future of hinawa-utils?

I'm sorry to puzzle you but I shift my effort of userspace applications
from hinawa-utils into the services.

As you can see, Python 3 scripts in hinawa-utils depends on 'libhinawa 1'
which produces 'Hinawa-2.0.gir'. On the other hand, libhinawa 2 produces
'Hinawa-3.0.gir'. Although hinawa-utils needs to be arranged for its
dependency to the latest libhinawa, at present I have no plan for it due
to the rest of my time... Therefore hinawa-utils is actually going to become
abandoned now at least Python 3 areas, unfortunately.

> I have created an OSC server interface[1] to the Tascam FW-1884 control
> surface using a fork of the hinawa-utils with a few enhancements[2]. The
> OSC server works great for controlling applications like Ardour with the
> FW-1884.

I'm interested in Open Sound Control protocol itself, and I would use it
if I were a developer out of alsa-project. However it's secondary option
to me if any ALSA interface assists me to achieve the aim.

Now I made the repository public[1] for your information. The 'topic/work'
branch includes the latest codes for the services[2]. You can see many
protocols are already added. (The most of them are just makeshift...)

For Tascam FireWire series, I uses two types of ALSA interfaces for
inter-process communication between the service and ALSA applications:

- interface on ALSA control character device
- interface on ALSA sequencer character device

For FW-1884, below elements are transparently visible for ALSA control
applications (e.g. amixer, qashctl):

 * clock-source
 * clock-rate
 * input-threshold
 * coax-output-source
 * master-fader-assign
 * host-mode
 * opt-output-source
 * spdif-input-source
 * monitoring (to start polling for below elements)
 * monitor-rotary (readonly)
 * solo-rotary (readonly)
 * input-meters (readonly)
 * output-meters (readonly)
 * detected-clock-source (readonly)
 * detected-clock-rate (readonly)
 * monitor-meters (readonly)
 * analog-mixer-meters (readonly)
 * monitor-mode (readonly)

Additionally, 'FW-1884' port is opened to ALSA Sequencer. The events generated
by touching control surfaces such as fader, rotary are converted to standard
MIDI messages and sent to the port. Any ALSA Sequencer application can receive
the messages via the port. Ardour is such an application.

You can see the conversion in 'src/tascam/isoch/seq_ctl.rs'[3] and everything
is hard-coded. It's possible to be more inconvenient than your implementation.

> I was just cleaning up the code and was prepared to submit my patches for
> hinawa-utils, but if that will go unmaintained, I might just integrate the
> hinawa-utils parts into my OSC server code and only depend on libhinawa
> directly. What do you recommend?
> 
> [1] https://gitlab.com/tascam-fw-1884/tascam-fw-osc
> [2] https://github.com/sbahling/hinawa-utils/compare/master...fw-1884

The integration into your repository is easy and convenient to you. I
recommend it. But I'm welcome your comment and patches for the service itself
when the service officially starts for public development.


Well, from my interests, how do you implement to blight 'REC' LEDs? It's my
concern when using ALSA Sequencer because MIDI standard has no
specification to associate LED and messages.

[1] https://github.com/takaswie/snd-firewire-ctl-services
[2] https://github.com/takaswie/snd-firewire-ctl-services/tree/topic/work/src
[3] https://github.com/takaswie/snd-firewire-ctl-services/blob/topic/work/src/tascam/isoch/seq_ctl.rs


Thanks

Takashi Sakamoto
