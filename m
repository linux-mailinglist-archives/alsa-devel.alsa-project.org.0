Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E249D47BE7D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 11:56:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65BFB16D3;
	Tue, 21 Dec 2021 11:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65BFB16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640084163;
	bh=o93ByXgnQa+gRy5xhqxup1KW/I85JlCPyw1q54v+OIk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F5H8lZwHJV5uTABEnrI91T4ZRtEe1+wE+F8N9PuoWaBEfvkAs/63+Z7jHpwQ6MOfj
	 sQnydxUj9W16yAl8X5uiUmlhaJ1v492SQCCEfZiFlVDrrAX6xkiirTSfltzDLrWRMK
	 ogp1HkemFcCskK8GaOFO0xLUlB50b2cegpRt+04E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96348F800B5;
	Tue, 21 Dec 2021 11:54:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEB54F80118; Tue, 21 Dec 2021 11:54:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69FBDF800E3
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 11:54:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69FBDF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="J+2hudM1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Ui9Miq0w"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 486135C0305;
 Tue, 21 Dec 2021 05:54:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 21 Dec 2021 05:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=10u2seyTtDKFh00Zfz/k03hmkz3
 kOv0x/W4LJ4OGXIc=; b=J+2hudM1lN3q+QxEDzLvWHX/7r7mxc1nXK5x8lGZ0Fc
 VIDOQjMhbIQy0DpvWntNVfwlwgi4kvK5Uvg9iK8GlIhj3HHLqcQm73wIDt6bvrSU
 3t9xE3E3SkwjEO85VB5CS8lnos2V7/DVQ1yE+5urImo/K3r2quvJ7BCv3JzHdsBH
 8arcYlOKcx6oGMErfbHOh7rZ5602525Jx0EASKqkNkHV87uUUepW2CxOmnkkFvtn
 ALfuTkii2KqLN2ntfDerAoM2yYRDinxJdBDoavS4U6a400i4rcHmzobxo7ROZf6g
 k9R0QxlUK7d+c/ex8v2iUJZ/SajGRBkkmnwORHcnylg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=10u2se
 yTtDKFh00Zfz/k03hmkz3kOv0x/W4LJ4OGXIc=; b=Ui9Miq0wg67yWnAJnd27B/
 7LZlRDrb9vHQuZJYbyq84aAwboetzbrhfzUh4EQ0F5ERO1r0eziu9HM5SARgvzEt
 hjRhLqwzPXNRk8FA14Q7Uyje9cpmcazytyc10SyhJLZg2W5nZMQ8MDBPu8kx/a0g
 F0KzEse27fBuhiTd38EsGxHLvBdDlWNYMNVujlUUE1eGXikzwElI+Zt7n10Z0Egn
 vcWYEruoQhJgWweBeDhvv3DX8p+LSjYzZKyTXvs4L8T9YqzrM99l7QMt+Hv3g7NG
 klPcL2E+Au2wfkvbaT8YTqSG5of9ZJZIzNHsFHCYJn+KMd7rQXgtGX4XlXPTFqFA
 ==
X-ME-Sender: <xms:d7LBYenCx4WpenTpOzYfZqsQyIvZc2PGO1Y26yplXT-2IneSk71hhA>
 <xme:d7LBYV1v7XO8B5QCiQjHe4OYlw02af9L5nL_NsLWrgdOO9cGIcQl7lP5TXh_ZiNE7
 WLwBDjfviYSrigU-RM>
X-ME-Received: <xmr:d7LBYcpQQvV_cOmY7A3d8pqTE6PLlhlKyBWG927pDy_QQf05NrvfsFgM6eV2hVrpysry5nVU3bg4erK1d7eC8oA-zHhhffIY2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddruddtgedgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtro
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhephffhvdejve
 ffkeeifffhuedufeekkefgtddvteeggeehgeeljeduhfdvhfejvdeknecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:d7LBYSlO7ey3mSyanWXGQgdOYXw2WlotdYHPCBAh84bF3_7WsRt6nA>
 <xmx:d7LBYc3hUu3PAo0YiSy77pYk7WPoMjlso4vmKMTVEXcyU7DU6Hr7pg>
 <xmx:d7LBYZvuCvMyL9v40I7_3hwib7cuaTZnyKYrk20jLA1dR2edxUiJpw>
 <xmx:eLLBYZxsqsVLwepd4A-bP51zIbADVIE-tMd4mHZzPAGawVjawn9VKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Dec 2021 05:54:46 -0500 (EST)
Date: Tue, 21 Dec 2021 19:54:42 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: stefanr@s5r6.in-berlin.de
Subject: Re: [PATCH 0/3] firewire: assist unit driver to compute packet
 timestamp
Message-ID: <YcGycqUrptkWYeOV@workstation>
Mail-Followup-To: stefanr@s5r6.in-berlin.de, alsa-devel@alsa-project.org,
 linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 marcan@marcan.st
References: <20211202113457.24011-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211202113457.24011-1-o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, marcan@marcan.st
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

Hi Stefan,

Thank you for your long effort to maintain Linux FireWire subsystem. I'd
like to use the timestamp function for my integration in ALSA firewire
stack planned at next version of Linux kernel. I'm glad if getting to
your help for upstreaming.

On Thu, Dec 02, 2021 at 08:34:54PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> In 1394 OHCI specification, each descriptor of IR/IT/AR/AT DMA context
> has timeStamp field. The value of timeStamp field express the time in
> which the controller accept packet. The resolution of value is isochronous
> cycle count (8,000 Hz) with second up to 7.
> 
> I have a plan to use the value of timeStamp field for ALSA firewire stack
> so that userspace ALSA PCM/Rawmidi applications can get converted timestamp
> (ktime) for PCM frame/MIDI message. The timestamp can ideally express
> finer granularity than the time to invoke IRQ handler (and co).
> 
> Current implementation of Linux FireWire subsystem delivers the value of
> timeStamp field to unit driver for IR/IT/AT DMA context, but not for AR
> DMA context. Additionally, the way to refer to Isochronous Cycle Timer
> Register in MMIO region of 1394 OHCI controller is transaction to local
> node. It includes overhead of transaction and it's preferable to add
> less-overhead way available in any type of IRQ context.
> 
> This patchset adds two functions exposed in kernel space:
> 
>  * fw_card_read_cycle_time()
>     * allow unit driver to access to CYCLE_TIME register in MMIO region
>       without initiate transaction
>  * fw_request_get_timestamp()
>     * allow unit driver to get timestamp of request packet inner request
>       handler
> 
> I note that Hector Martin found kernel null pointer dereference during
> process to remove PCI card and has posted a patch:
> 
>  * https://lore.kernel.org/lkml/20211027113130.8802-1-marcan@marcan.st/
> 
> His patch is included in the series with my comment for relevant commit
> 20802224298c ("firewire: core: add forgotten dummy driver methods, remove
> unused ones"). The patch is required since unit driver can refer to dummy
> driver between removal callback of PCI subsystem and removal callback of
> FireWire subsystem.
> 
> Hector Martin (1):
>   firewire: Add dummy read_csr/write_csr functions
> 
> Takashi Sakamoto (2):
>   firewire: add kernel API to access CYCLE_TIME register
>   firewire: add kernel API to access packet structure in request
>     structure for AR context
> 
>  drivers/firewire/core-card.c        | 39 +++++++++++++++++++++++++++++
>  drivers/firewire/core-cdev.c        |  6 +++--
>  drivers/firewire/core-transaction.c | 18 +++++++++++++
>  include/linux/firewire.h            |  3 +++
>  4 files changed, 64 insertions(+), 2 deletions(-)
> 
> -- 
> 2.32.0


Sincerely yours

Takashi Sakamoto
