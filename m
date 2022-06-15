Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C20B54BF3E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 03:29:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6E40195A;
	Wed, 15 Jun 2022 03:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6E40195A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655256547;
	bh=yQQ+qjE5bMoVuw36wzhZ5f3rO+hjLUmFCIKwBjhXpW0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VYXGHlG/VWC9MXUvQgDYbNv3KkTzBcJ/2l882hx4whh9ge9AimwCDw+0GgLeH8/z7
	 rQwOeuxUCgKU5IOWGLkV6DVhWYwTPg8drWRqCvGB6Mrhhmvirua0IwpU6EeT3A3FIq
	 fCEyXr3epLJQJB+QSX8EH49kBJ+Vt043yYmtoroA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42916F80528;
	Wed, 15 Jun 2022 03:27:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50DE5F80528; Wed, 15 Jun 2022 03:27:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D7CDF804B0
 for <alsa-devel@alsa-project.org>; Wed, 15 Jun 2022 03:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7CDF804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="UfN+ywYT"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CjvdDfOv"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7355632009A3;
 Tue, 14 Jun 2022 21:27:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 14 Jun 2022 21:27:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1655256457; x=1655342857; bh=qX
 AlvhaK46hv0TIdkAPi1AoeYyTIvpjOQn5HCdOpeoo=; b=UfN+ywYTJHUQZGGwAW
 DLMzXNL68rWDh+SlI8LldIA51C+Ab80XlVqVHNwa3Qx2CbDESHCVlTo+sy0ZRS5g
 IxE7qJP2SYcvgNTJIPnXZ/FhjapbhHZNO+wED9Fa2TtSfDyAWxQWbCz8kPGn9srM
 1s+0OCSjPeomTx8x9kZxzzpP0d5tgL+doUKTYiShtK5j25C9Jn3F5FHykrwCMDKx
 ClYpiW5xtME15gY1rjk1seNkINxhAKsvYnTx6QQo/aQ0ChjjH/jFac2m69dIc7xb
 /dVjwZddKHD8pJs/yCNbD8y7NkE6Kniifv99z8107jzNkesfCLM9MzS88Q7XItBV
 tSCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655256457; x=1655342857; bh=qXAlvhaK46hv0TIdkAPi1AoeYyTI
 vpjOQn5HCdOpeoo=; b=CjvdDfOvUja1MxXMsyx1W6nAREnctZ9pfN4W+aKF5aRM
 OoXc+1CLyeSqGaTX5ptRShC46uM+mm/qfW94q1IknXhb/hSTS/ti6DViTqesnBW/
 Ydku9YsXY+OOjYXMHt+s7mzzLA0iL0uhldPgTuE0Zy0bfCjBuKZZ7ZgcDuJsiK1J
 mScza8GtrxCN56TpaePsY9IqQyoIal+1KmXK0yCFduC8jAe4paPnhzm2FI3nfj44
 EFQf3f0cbOsW6Q3RmvRTxqHluC+XneLyLg3l4zr6R3QWTyDxlqzyuo5IWvrM1/hl
 Jbn82SIkcR08r/1fjSc3T6k/Oz9uk0P68IeC14wlZQ==
X-ME-Sender: <xms:iTWpYrarb0q0k9jeWHmZeQwNnIYXPffptKTq8eq-N4kFZWznzPgbGQ>
 <xme:iTWpYqa8j23A71y955rCm5VGUw83nkOfOC12Blb4TZQTBOHakp8N8V6_Hht8kMRTE
 hxWQHcsJeEl0vg_BeI>
X-ME-Received: <xmr:iTWpYt_OGJ7oabjn13J82LtCw2endWvztBBotL2dwwKl7MvgqbLMk7ZcnVMX5Bue3-8rGcqPq6zSyVknpmtH7LcKBBb-Mtq_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvtddggeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepveeilefhudekffehkeffudduvedvfeduleelfeeg
 ieeljeehjeeuvdeghfetvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:iTWpYhrb4_YOt2qmPdCxgTVZVAutmeRnf_5FOxDW1HKlG6DqQ-EFng>
 <xmx:iTWpYmpqGZqYg_iivdUvhu2Ivf4ME1YNXtRD1HzcMiyzgXiceE9OGw>
 <xmx:iTWpYnQnDPlYyk7Ea7XiVDMxY1P9UpovUDGOmfeYMMMgIV0InX9UTA>
 <xmx:iTWpYpWHfkxIf93PcAAlHI6VLnEXK4JMY2VVqb7Tle74yAg60I3BkA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jun 2022 21:27:35 -0400 (EDT)
Date: Wed, 15 Jun 2022 10:27:33 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] firewire: cdev: fix potential leak of kernel stack due
 to uninitialized value
Message-ID: <Yqk1hXsJ3DMtfEJS@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, stefanr@s5r6.in-berlin.de,
 alsa-devel@alsa-project.org, linux1394-devel@lists.sourceforge.net,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220512112037.103142-1-o-takashi@sakamocchi.jp>
 <Yqh/bDB+Bvwcjjrh@workstation> <87o7yvpf4t.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7yvpf4t.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, stefanr@s5r6.in-berlin.de,
 linux1394-devel@lists.sourceforge.net,
 Dan Carpenter <dan.carpenter@oracle.com>
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

On Tue, Jun 14, 2022 at 03:07:46PM +0200, Takashi Iwai wrote:
> On Tue, 14 Jun 2022 14:30:36 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi Iwai-san,
> > 
> > I have a moderate request to you for the patch which fixes an issue
> > included in v5.19-rc1. If it's applicable and I can borrow your help
> > again, I'd like you to send the patch to mainline via your tree.
> 
> Do you have the lore URL I can get a patch from?
 
Here it is:

https://lore.kernel.org/alsa-devel/20220512112037.103142-1-o-takashi@sakamocchi.jp/

> > If possible, it's preferable to apply additional three patches I
> > respined[1], but it could be optional since not so critical.
> > 
> > [1] https://lore.kernel.org/alsa-devel/20220512111756.103008-1-o-takashi@sakamocchi.jp/
> 
> I can merge those, but now looking at the patches, I'm afraid that the
> patch 2 ("firewire: use struct_size over open coded arithmetic") is
> wrong; struct_size() takes the number of elements, and the element
> type is u32, hence you're allocating 4 times large data with that
> patch.

Indeed, I overlooked it. The length should be quadlet count instead of
byte count in the case. I'll post revised patches later. Thanks for your
review.


Regards

Takashi Sakamoto
