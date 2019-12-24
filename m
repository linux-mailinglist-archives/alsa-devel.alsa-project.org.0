Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96639129FEC
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Dec 2019 11:04:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B8D5169C;
	Tue, 24 Dec 2019 11:03:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B8D5169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577181847;
	bh=s1wQW/0WzDNI4szTpWVmwxsiT2h33HQGOx/kBWBd6XU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=muodsRwNb93QIEzZ1v/GdvURai96x/qAXyzaGja0ogy9hNvvQK0+4f0y4kk6KUcZI
	 OgXunTdDQQkQAwSEYMx58Gyb938ZLZ1x3d3DGA04fHPn9WcnUc7fvmdoVyef4oF3di
	 W8dKf2gsz2amHYC66RK//fojDcPRWGzIM+yCU8lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53EB1F80136;
	Tue, 24 Dec 2019 11:02:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA57EF80138; Tue, 24 Dec 2019 11:02:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54862F800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 Dec 2019 11:02:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54862F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GC9Yyu2d"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uZsxiXea"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0BF6521E44;
 Tue, 24 Dec 2019 05:02:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 24 Dec 2019 05:02:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=KEv6i2D5lh74fXi/Kb+Y/is6PCX
 jyUghrd2ERasvWFE=; b=GC9Yyu2dKdbnzYzVGE1A1wOGppZa4IqaAkzhwYzHOHX
 04FcplbA4Lx2+slAG/Mi0zpLev/m3VBmrdRosHjAPGGLEUQQfdSPuA09VxiTqC2Y
 rtCseqJIAeB9xPzt5eWs3c0WNHhig/cUjYiWoOKKaIo9p7p/Pqy7YnKhsGkDYEAX
 9h1IW9kBfxLQhZVkMRKw/HwTYAm4jR6vBwtaiq75JBMMjkz+VCQNRJH7ZHlqT5he
 OR5MJK/L6YPzvk/uOXVrCptU8d/dYeleQc6rK+mOys4Omsx7+qOZBHsQZ/spPKUe
 oHxRL+sOGrZIheJOPwfjcfmUf8/advtedTNPf3UuAeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KEv6i2
 D5lh74fXi/Kb+Y/is6PCXjyUghrd2ERasvWFE=; b=uZsxiXeaoB7P6nnJFz39fW
 UaBA/324erPSSk/EVrCAQ7SK+MlPx8Uvny3xE1C/xgTmV1dUV8KNYQaMsyg7PM0Y
 OmiUxRqtaXbc0heJgPDHtJtUbmhAmWfTtatI6nuVeq8qBwLSs3+VcYquzdxqn/Kk
 tbvPEVwj6O3xLTh5pRKMsgjCqXFbghJbCYbGtBxfx+IHbkZg1reJTxlKyn3G3NCw
 HLHZMdNjNqirZxhgCbxSmqNbmLlv8KWpY8lc4tab1Ro9GND1T9iZmK+SoeBuY40L
 vNKQcQvzQhOWiXSkOruInEin2VhVcq9OrqgkC2ObjoHD1PVJOB4GIFaTScGg2CMA
 ==
X-ME-Sender: <xms:JeIBXpj1csWQwftYdlgxxb6qt4dCpRrrZWbkhkMiSi64lAD7hMoC3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvvddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudegrdefrdejhedr
 udekudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmh
 hotggthhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:JeIBXpnIyli9sI0GRzrL-mhClCTcwTZ-4YImLyPsAp7eYKl3-_xnjA>
 <xmx:JeIBXpF7l2fnN7f3zEI2wt5HL-B1dCBhLu1uqovSHcYXpM39vPBmMA>
 <xmx:JeIBXjPWgN5MMT8HzjDcFPAu_TSQyP2l_3dBmY4AgVW7Q9v7qxVnOQ>
 <xmx:JuIBXoAIlpwwcpCly0we50yXlfGW41qNwBuI_uFosyYx8DQLvKZviw>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id BFC093060802;
 Tue, 24 Dec 2019 05:02:12 -0500 (EST)
Date: Tue, 24 Dec 2019 19:02:10 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191224100209.GA28396@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20191223093347.15279-1-o-takashi@sakamocchi.jp>
 <s5ho8vzw0bq.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5ho8vzw0bq.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: ctl: allow TLV read operation for
 callback type of element in locked case
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

On Mon, Dec 23, 2019 at 04:03:53PM +0100, Takashi Iwai wrote:
> On Mon, 23 Dec 2019 10:33:47 +0100,
> Takashi Sakamoto wrote:
> > 
> > A design of ALSA control core allows applications to execute three
> > operations for TLV feature; read, write and command. Furthermore, it
> > allows driver developers to process the operations by two ways; allocated
> > array or callback function. In the former, read operation is just allowed,
> > thus developers uses the latter when device driver supports variety of
> > models or the target model is expected to dynamically change information
> > stored in TLV container.
> > 
> > The core also allows applications to lock any element so that the other
> > applications can't perform write operation to the element for element
> > value and TLV information. When the element is locked, write and command
> > operation for TLV information are prohibited as well as element value.
> > Any read operation should be allowed in the case.
> > 
> > At present, when an element has callback function for TLV information,
> > TLV read operation returns EPERM if the element is locked. On the
> > other hand, the read operation is success when an element has allocated
> > array for TLV information. In both cases, read operation is success for
> > element value expectedly.
> > 
> > This commit fixes the bug. This change can be backported to v4.14
> > kernel or later.
> 
> The patch looks good but your sign-off is missing...

Oops, I was in the festive mood...

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Besides, let us backport this patch to older kernels? As long as I
investigate, this bug exists since v2.6.19 kernel, in which TLV feature
was firstly introduced and extended[1]. When I worked for refactoring to
control core in v4,14 kernel, the bug remains kept as is[2].

It's possible to apply this patch to the longterm v4.14.160 kernel. But
when fixing this bug for the older kernels. we need to prepare an
alternative patch. In my opinion, the disadvantage of the bug is not so
critical, thus it's reasonable to abandon the older kernels.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=8aa9b586e4209
[2] https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?h=450296f305f13


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
