Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83079514093
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 04:30:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B7E282A;
	Fri, 29 Apr 2022 04:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B7E282A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651199444;
	bh=EO7bF/7L/OvyY1Tyamq2gcICuYXrM0VVOnnlK/8gX1Y=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uF7nlA4L6tjjNa0RxvuwvXtzHVJUCr+RIfpTd1EQk6DX79kKpV5kqmUP4zKkHv+s6
	 j/YDk6s8eOKUNvdI+FzmKw53l4diZvYFg+Qy0GFoVv0jcTSQCEC5IU3U7PUZaU5CtH
	 qLiyJo5W9Ib51VOR75zqDUYA1BjKVKsQzYNMdwfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80AA0F8016E;
	Fri, 29 Apr 2022 04:29:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88C10F8025D; Fri, 29 Apr 2022 04:29:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26A71F8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 04:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26A71F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="qNMbdzen"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="hS4uSMMY"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8B1DC32009C7;
 Thu, 28 Apr 2022 22:29:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 28 Apr 2022 22:29:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1651199367; x=1651285767; bh=RCetkmc2Y5
 ChsyxDtmedXQH+Or6XeLqnf9MrYBim9WM=; b=qNMbdzen6aFGo2Gw2b90++xbFx
 pfK1QNUwbrmbvEob/1mFMfk7O4j91S1O5E1R6YDRd2angC1+SLGQmJjorJ7U8jkq
 PIFZomh/qCaM9KUknetKDfHcGBzXkU5JXaKzRgY3v1vy2APfOxZqsgGlqs5MA2ZY
 OUaGJfLNniH2ryJfGWWhtidAl+XkambwWZO4pgjL7vAxz8JbyrlUuDquOYSdKlyr
 FqbzXvd+3mgSYiqnvMSLwqluetSdNIEOUPM/tMGyFv9jdCTGfUV4CfhuOTKcTZdk
 D6HuWqkG9NLB7sLuGibrE7LbxcZn7jIL8cqrgUYyTtli574gpezKmmy79rCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651199367; x=
 1651285767; bh=RCetkmc2Y5ChsyxDtmedXQH+Or6XeLqnf9MrYBim9WM=; b=h
 S4uSMMY8dU1KW2b1SLBtbiisxyNt8eGKhsrMe1DGhELJ9+nqnjPr0KoBmwffqvKL
 cp9rk8IsfUlMjCfN57LR0kBAqc/UTIVmaGBI6x0WEdJIt7l/OnFhRe/lJhDDmFgC
 /S/EAMQi06eKFhSR8s6Oq8+7nn77ok475PkNk6uue/Fy+MvcYqlmDrKP+0q0pmNE
 vk5kWu8Q3XDPZIQjxPB3+RISIWJoyIB3rjSCjtORbAvBqy9LJdURydrnXljoZITt
 WAHz5fg71RPBRvhlmZC8gBxUM7lVn8EDuhbC3YY9TE/YZEaW6PYiDuD1VApM4zEP
 UPcR9vXnwUgmx8ZGldJRA==
X-ME-Sender: <xms:hk1rYsy37KLa4F9Y7GfByx0x_fLVJm1M3RAnz_AVzbVO7VrZD_Cysw>
 <xme:hk1rYgSm8atz9fUOC-u0u4kdzIf8HIUS5U8KjiJ7q6J_9CWiRziUSwrLuSt85vMgs
 kOxpaWZFPdeSoVud0U>
X-ME-Received: <xmr:hk1rYuWfG8w3yGRNLuF69YuHPy4UCMdjEbv4QkJMNsDRLGhsYYFk93RUWmDf1EyZQbmwCSpwJmTaIKDMnPUdH9V5Y1AN3tit>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgrshhh
 ihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 eqnecuggftrfgrthhtvghrnhepledvgeduieffkeettedtieelleekheelleehgfegveej
 geeihffgueeileeviefhnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhithhhuh
 gsrdhiohenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:hk1rYqg-avsyC3ZcLcxNwvtl-hBQWDw8_axvy7x4_EitzNXCiOl0Bw>
 <xmx:hk1rYuBhqy-lDWTsV3JL7wM1ipZmPxIZWBNQPvVCU1ENu0erhc5q2g>
 <xmx:hk1rYrKITkGXQPM2EGYNFBQhChl71YvDmceR8cCOWRbr_HpKYv1fvQ>
 <xmx:h01rYv52O-fbuwjvFIuN9nX5dwfVVmgsNtxhe_pzESBRb4qMnZYFkw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 22:29:25 -0400 (EDT)
Date: Fri, 29 Apr 2022 11:29:22 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.de,
 alsa-devel@alsa-project.org
Subject: Re: Request for setup of new repositories
Message-ID: <YmtNgqfFREYKZM6t@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.de,
 alsa-devel@alsa-project.org
References: <YmagC3V3t0k84k9A@workstation>
 <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
 <YmfZxmfv5dfgdYG1@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmfZxmfv5dfgdYG1@workstation>
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

Hi Jaroslav,

On Tue, Apr 26, 2022 at 08:38:46PM +0900, Takashi Sakamoto wrote:
> Hi Jaroslav,
> 
> On Tue, Apr 26, 2022 at 09:23:38AM +0200, Jaroslav Kysela wrote:
> > On 25. 04. 22 15:20, Takashi Sakamoto wrote:
> > > Hi Jaroslav, Iwai-san,
> > > 
> > > Thanks for your maintenance for alsa-project organization in github.com.
> > > Currently I'd like to add new three repositories under the organization
> > > as a part of my work for ALSA firewire stack.
> > > 
> > > I've been maintaining libhinawa since 2014 and recently realized that
> > > current design is not necessarily convenient since it includes two
> > > functions; operation to Linux FireWire cdev, and operation of ALSA HwDep
> > > cdev. Currently I'm working for new library to split the latter operation.
> > > Then I'd like you to setup below repositories:
> > > 
> > >   * 'libhitaki'
> > >   * 'libhitaki-doc'
> > >   * 'hitaki-rs'
> > > 
> > > The library itself and its Rust binding are utilized by
> > > 'snd-firewire-ctl-services'[2], thus it's preferable to register them under
> > > 'GObject Introspection' Team.
> > > 
> > > Thanks for your assist for my work.
> > 
> > Hi Takashi,
> > 
> > All is set on github. Let me know, if you need other changes.
> 
> Thanks for your arrangement. At present, I have no with for additional
> changes.
> 
> However for settings of libhinwa repository, I'd like you to change URL
> of documentation. We can see it in right side of top page.
> 
>  * https://github.com/alsa-project/libhinawa
> 
> Currently it points to 'https://takaswie.github.io/libhinawa-docs/'
> while it should be 'https://alsa-project.github.io/libhinawa-docs/'.

Additionally today I push documentation for libhitaki into the added
repository:

 * https://github.com/alsa-project/libhitaki-doc
 
I expect Github Pages makes association between the content and publish
URI:

 * https://alsa-project.github.io/libhitaki-doc

However it doesn't. I think we have missing configuration. Would I ask
you to change settings following to this instruction?

https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site


Regards

Takashi Sakamoto
