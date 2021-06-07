Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBB939D33F
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Jun 2021 05:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEA4E1677;
	Mon,  7 Jun 2021 05:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEA4E1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623035235;
	bh=i4Z9KHD4pS1pPKmI6OmM40n1wQLxItgORLnGP11mnWQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U+BUz2zQDT5ChSGTJeaYW3MvgUDnin5CDdtG7vnsS9aXXTT5d2qs5G7ejYY05Ga57
	 oaWvAkql8GO5WqrD6Gwr+3VDCNVZQUGVH7aFUSJ5fTqxq6HdJX9KiFA5B9Eg8uxWR3
	 xEjfxduT2Ge0pCfy2jddIE7m0qLXKUvRu0Dzk83c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D96AF80212;
	Mon,  7 Jun 2021 05:05:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73677F80212; Mon,  7 Jun 2021 05:05:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C450EF800DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Jun 2021 05:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C450EF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PLXgKQqA"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="btLuVGeU"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id BEE4116B8;
 Sun,  6 Jun 2021 23:05:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 06 Jun 2021 23:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Bk1LFvTVmoYEnyiwi8zAwGElV5v
 UPr0ynlv4HC0/TOE=; b=PLXgKQqAQjX72WDoZbiYnDK+RWof1SRZZ3rnZPTnQic
 VzbOr5YDYvLXGJ4ZGT/3Fj+x1Ge58TKgQSy1cmYDSRA2m+aBhZkuM6vhBzMper5Q
 XsMwvWthzoECsVHdJtFtgvlCK4bfCtjdCyGY1GWhGNzFzgkkKM8MUsC8/gUJxZNX
 1BZ+n8jEQPtmPkiQ+MSWjhBsop6KxzmBsg/91WT6J/0JKCGW7PJ4zD8TKlydKJB4
 Re9TaL1bC3wM4aYVlOy9elMyfgr1hw18aea2vVkVq2SHzM6Uygq6lsCg+eLRKfES
 Wqyrd//IfXKogx6bjnFIWQ/E6yS85YTmegH+i5bek/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Bk1LFv
 TVmoYEnyiwi8zAwGElV5vUPr0ynlv4HC0/TOE=; b=btLuVGeUq0F+d8GUKD2zN+
 v63KAurGZ2Zb2rR7VHzQtXYHiRg1ZIj//KQexYHKEMrRLDgIVrJ82Zc3v1YvY7F3
 w6AOL3iV2zFMdJKTcQsDxetwMCssvyrSEjHSY46OO3AMpjWGJrhEJJQ5mbc77TNU
 mcL+q8aNSw0AGQXPGMUDgh5SWuY+UzhlZizwSBaiMetzNQz3Ufhvvmb+LC7S/kZE
 824jxyVc9pVE9ZkWgTkmxVV4v4dMeCiBAgLFpoXuB3gKRPpxaulH70W2XJxy2a88
 YJZuSa+L7QX4KwkvG4O7VabFQAxqJseguGqX30tr/UFlpOzbL5ebN67OoNywXZhw
 ==
X-ME-Sender: <xms:-oy9YEK_bAIBQSu8Mlus7_9WMDakVUJmv_egIdVv48jXHdRfQYcUnw>
 <xme:-oy9YELX8JBCD3RCn9EZ7k6kCsxXrrEXzwcaMuKh6TPz5C0uqvaPuw296TKEFZVwA
 TbM3K9XVe5u47yOCCo>
X-ME-Received: <xmr:-oy9YEtLKbx4L9U2KMHF5EKlOR-7qrRg-QKyTQnRQksP3cCt667sKyPPC1yrjpsjxhGtyjJ7en-Fws4gF115OzC7f4otff7TiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtiedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:-oy9YBbdQe_CO__4BQjktB3IlY2qsSqUSTDRasBRwrkSqdqzSspxSQ>
 <xmx:-oy9YLaqOCxgNMH8CwY_S0OiJJlkctrAiVV-Bn3mc9qIUIqkg0KeQw>
 <xmx:-oy9YNDPLnIqEUdB8CE0pA9AbC8bvAlFEPI0HSnguOJtW95SMBaygg>
 <xmx:-4y9YCw1U3lHGIuvu4kUHQYX-L7LJmDCquMu9vaiZ-odSrDn0WZ0PQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jun 2021 23:05:29 -0400 (EDT)
Date: Mon, 7 Jun 2021 12:05:26 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [RFC][PATCH 0/3] ALSA: pcm/firewire: allow to queue period
 elapse event in process context
Message-ID: <20210607030526.GA28941@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20210606091838.80812-1-o-takashi@sakamocchi.jp>
 <s5h5yyrfg52.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h5yyrfg52.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

On Sun, Jun 06, 2021 at 12:20:57PM +0200, Takashi Iwai wrote:
> On Sun, 06 Jun 2021 11:18:35 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > All of drivers in ALSA firewire stack processes two chances to process
> > isochronous packets in any isochronous context; in software IRQ context
> > for 1394 OHCI, and in process context of ALSA PCM application.
> > 
> > In the process context, callbacks of .pointer and .ack are utilized. The
> > callbacks are done by ALSA PCM core under acquiring lock of PCM substream,
> > 
> > In design of ALSA PCM core, call of snd_pcm_period_elapsed() is used for
> > drivers to awaken user processes from waiting for available frames. The
> > function voluntarily acquires lock of PCM substream, therefore it is not
> > called in the process context since it causes dead lock. As a workaround
> > to avoid the dead lock, all of drivers in ALSA firewire stack uses
> > workqueue to delegate the call.
> > 
> > This patchset is my attempt for the issue. A variant of 
> > 'snd_pcm_period_elapsed()' without lock acquisition is going to be added,
> > named 'snd_pcm_period_elapsed_without_lock()'. This is used in callbacks
> > of .pointer and .ack of snd_pcm_ops structure.
> > 
> > The patchset is still under my test, but it looks to work well in my
> > easy and rough test. Before posting for merge, I'd like to get your
> > comment to the idea. When evaluating, please merge below two histories:
> >  * 64584f329352 (for-next)
> >  * 9981b20a5e36 (for-linus)
> > 
> > Takashi Sakamoto (3):
> >   ALSA: pcm: add snd_pcm_period_elapsed() variant without acquiring lock
> >     of PCM substream
> >   ALSA: firewire-lib: queue event of period elapse in process context
> >   ALSA: firewire-lib: obsolete workqueue for period update
> 
> The idea is fine, but moving snd_pcm_period_elapsed() as inline static
> doesn't give much benefit, IMO.  Although it can avoid an exported
> symbol, its cost is much higher, since it'd expand the code at each
> place of snd_pcm_period_elapsed(), i.e. almost in all driver code.
> Just provide two exported functions instead in a more straightforward
> way.

Thanks for your positive comment.

I agree with it. When adding parameters for function internal, we will
discuss about the inlining for variations of kernel API again, I guess.

After merging for-linus branch into for-next branch, I'm going to post
it again. At the time, I may finish enough test.


Thanks

Takashi Sakamoto
