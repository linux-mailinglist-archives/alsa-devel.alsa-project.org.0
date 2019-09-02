Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9DA5745
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 15:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F22116C8;
	Mon,  2 Sep 2019 15:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F22116C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567429687;
	bh=A1oBi5KdKvBnfCY2Bk0G730pekjKFRyJ4KTmzezArVg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HARPVQ6AeMH5dwz49I4ukA4UeOthMokFDhAjdUOQsqK1QQ0LUpyAK+9rskf3Gk0U1
	 XAnOTqID/eX9E14ArnKWezADd7sRswvWnLBWc5rOhpa3IIaL4jLZNcxBVFKEnaKEQz
	 OdGjGKpd65A2HtrA0y8NmRMuLhXN06yvT6RcRAIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8476F80447;
	Mon,  2 Sep 2019 15:06:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A63C1F803D0; Mon,  2 Sep 2019 15:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D6A6F802E0
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 15:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D6A6F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="k5nhFxPC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="vfB+yjts"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CD49521F82;
 Mon,  2 Sep 2019 09:06:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 02 Sep 2019 09:06:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=jio5oeCCv7++0D6N2w9CzCnXMzI
 EA6Rtbg+Pk7TcSh4=; b=k5nhFxPC67p4BdTOLxv0ox6QC1lQMhkgi9RbyMaWe0y
 1ha7VtafZOPJjTG5spKKEnZezD+JSC0EaIcbA3ebR/9mjyncUtjRKIZ96NH/oiTm
 sRAPoog7JIvunoQyr+gJa87LlGTcnpHhov0qm/wHsk+c/6/JDn5KgrF0+KD5dGgv
 4YrY4yBYBSyTdcwRJTD5yRjhXPD5Y/4yYQ77GBj9ZxV9Z8OMn5YmxnpEuru55VAX
 uQpLtLuG00dazJd2AqyZZOTg854RpmMgjAQVhuao9ZbsYgbB/xJJfQV3aajcjLsp
 3PHUqtwowxkFH9/KGDK51BITAe8DHf8Sf3HbuVEDynQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jio5oe
 CCv7++0D6N2w9CzCnXMzIEA6Rtbg+Pk7TcSh4=; b=vfB+yjtsGuqCGBEHspdSfh
 08j8xMVkPREQiMsnBUflDASDSy3PNtAAD3yAW0xw7pAkmLIyz/SWZQAh1YxX+Mw5
 3Yz26g4vQWWfr+2ZNTaXvU0ypuIf86GR1zPMu/RxAGZoZ8AZC04i3nwqdbZNxj9s
 S6sUdwE3BTo84DikkmMHOd7exmS2p31jommfTVeGqGBE1oKl6AfLa1Bir7Oax7Wz
 ulmS8LIjfWkt/UODlZYmQJBJI4+zMFmgN9CdkugLTvIo0U6+a/Ra5EIy1tZiBCq/
 Eqkw6vlWQKQOH1bsNFewenpc9Fg/qM44Dh19fSjKQs0ucBV3EIdtHmz8uhQKCe9w
 ==
X-ME-Sender: <xms:wxNtXQKLTSKciYCNEtUgQVVhGIhSk2rchZ8-ddL1bhjr24MYvQCCxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejtddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujggfsehttd
 ertddtredvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucffohhmrghinhepghhithhhuhgsrd
 gtohhmnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:xBNtXUbx5MhuvifQbs19nyVsbPZx5aAjjdjaiwbDUAN7y-2-L9dYyA>
 <xmx:xBNtXbuLchyxxptlTWO13R8eyRBUkPxwoeyoM1PSH2wFxRRgnDSUyA>
 <xmx:xBNtXRuKsg8WbST8qBvckzLbIYmT2FZqhdG1F806EjOaM6geqUbmtw>
 <xmx:xRNtXdZZPK459wvzzKOmrxKVw-D3DwSm6OPXK8UckxdvaQ-ykFys3A>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E0CB80059;
 Mon,  2 Sep 2019 09:06:10 -0400 (EDT)
Date: Mon, 2 Sep 2019 22:06:07 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Hin-Tak Leung <htl10@users.sourceforge.net>
Message-ID: <20190902130606.GA4911@workstation>
Mail-Followup-To: Hin-Tak Leung <htl10@users.sourceforge.net>,
 alsa-devel@alsa-project.org, tiwai@suse.de, g@b4.vu
References: <1091462655.1815609.1567426196596@mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1091462655.1815609.1567426196596@mail.yahoo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, g@b4.vu
Subject: Re: [alsa-devel] sound/usb kernel modules as a DKMS package.
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

On Mon, Sep 02, 2019 at 12:09:56PM +0000, Hin-Tak Leung wrote:
> Hi all,
> 
> I (We... this is kind of my 9-5 job) have been having some reliability
> issue with a Focusrite Scarlett Gen 2 18i20, and I was almost tempted
> to start looking at the windows driver, when I came upon Geoffrey's
> work. So I made the bleeding-edge sound/usb modules (for the 5.4 time
> frame) from Takashi's tree built as dkms modules against main line 5.2.
> I hope this is useful for other people using USB sound devices.
> 
> https://github.com/HinTak/sound-usb-dkms
> 
> This make it easier  / faster to try out new code, without building
> the whole kernel.
> 
> I would appreciate tips and tricks about the Scarlett 18i20, as well
> as general recommendation for new professional gear of the same sort
> to buy.
> 
> Incidentally, Tobias Hoffmann (who wrote the first gen driver about
> 5 years ago) was my GSoC student working on printer-related matters
> more than a decade ago; I did some wifi/USB related work in the kernel
> (am listed in linux/MAINTAINERS) so you can assume that I am relatively
> happy with driver-related matters.

As a quick glance, the repository is just for deb-based distributions.
From my experience, users who eager to use the latest source codes tend
to use Arch Linux and Gentoo Linux. It's helpful for the users to
include some instructions just to use the code with DKMS system. Then
you could get any feedback from them as well.

For your information, I maintain out-of-tree codes to develop ALSA
firewire stack for a couple of years, as you start:
https://github.com/takaswie/snd-firewire-improve


Cheers

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
