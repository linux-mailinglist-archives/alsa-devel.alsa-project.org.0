Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6EC64494
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 11:46:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D2641684;
	Wed, 10 Jul 2019 11:45:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D2641684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562751993;
	bh=EuCccdaYYkNR7vN3nu2tyyJw9yX8JDP5yrX6r5NBZKA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKEhwADBt2tMEIF6SGSYygfUT+rmRMJvsLyAvwV/oqr22Os4swEdpuImPn/N9sFw/
	 gclFu70rUTt7IlWqOLmjlg1bv72nI/DFSmfEXfN9KWl9Vpx5AeMdT+S7PdLtuKk4cq
	 Q/SsXBYtBgn81SKNixQgtEiEq+spWfJvfmy0lhf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AD27F802A1;
	Wed, 10 Jul 2019 11:44:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBE9BF802A1; Wed, 10 Jul 2019 11:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_135,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE80EF800DE
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 11:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE80EF800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="SuuW/7NN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j/WSDXca8rXK9NsDZMmI4ZGVD5lmMYmQNn9cX+c1P0c=; b=SuuW/7NN1z53N126yQd0mfU0n
 ntWsBeL22jFfrqe6UV7yYYjaWAb/mGvo82v/VpffWPeHAXC8qvHdMVqjvTeqQYorTqKjPyjcVkd0Y
 ehhidoReYAcrBOGYvK5hg+mxgyuD5Njr2SLIjID07Kvs0w8adz+Czb2UlD+NlXUjcnJQShORaFQ6X
 Xl3J1vYZGJzoNp6wHmHn8OimwqiNyO9IG6bSDFpjxItLMpKnIWdEU05QuowI2tkahamV/uty376Ez
 mf5JMQomwfeTQc+3SQ9pZj0NiYOkjfuIR3hSKUK/aQunmlQ7Q5KSFX7XpTfFzFgMc9EjJ+4N1wSfg
 nEpyIjNkA==;
Received: from shell.armlinux.org.uk
 ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:59340)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hl98c-0005tt-RN; Wed, 10 Jul 2019 10:43:47 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hl98T-0003nw-5z; Wed, 10 Jul 2019 10:43:37 +0100
Date: Wed, 10 Jul 2019 10:43:37 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Johannes Berg <johannes@sipsolutions.net>
Message-ID: <20190710094337.wf2lftxzfjq2etro@shell.armlinux.org.uk>
References: <cover.1562734889.git.joe@perches.com>
 <5fa1fa6998332642c49e2d5209193ffe2713f333.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5fa1fa6998332642c49e2d5209193ffe2713f333.camel@sipsolutions.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: devel@driverdev.osuosl.org, linux-mmc@vger.kernel.org,
 alsa-devel@alsa-project.org, Benjamin Fair <benjaminfair@google.com>,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Nancy Yuen <yuenn@google.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, Joe Perches <joe@perches.com>,
 linux-amlogic@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 00/12] treewide: Fix GENMASK misuses
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

On Wed, Jul 10, 2019 at 11:17:31AM +0200, Johannes Berg wrote:
> On Tue, 2019-07-09 at 22:04 -0700, Joe Perches wrote:
> > These GENMASK uses are inverted argument order and the
> > actual masks produced are incorrect.  Fix them.
> > 
> > Add checkpatch tests to help avoid more misuses too.
> > 
> > Joe Perches (12):
> >   checkpatch: Add GENMASK tests
> 
> IMHO this doesn't make a lot of sense as a checkpatch test - just throw
> in a BUILD_BUG_ON()?

My personal take on this is that GENMASK() is really not useful, it's
just pure obfuscation and leads to exactly these kinds of mistakes.

Yes, I fully understand the argument that you can just specify the
start and end bits, and it _in theory_ makes the code more readable.

However, the problem is when writing code.  GENMASK(a, b).  Is a the
starting bit or ending bit?  Is b the number of bits?  It's confusing
and causes mistakes resulting in incorrect code.  A BUILD_BUG_ON()
can catch some of the cases, but not all of them.

For example:

	GENMASK(6, 2)

would satisify the requirement that a > b, so a BUILD_BUG_ON() will
not trigger, but was the author meaning 0x3c or 0xc0?

Personally, I've decided I am _not_ going to use GENMASK() in my code
because I struggle to get the macro arguments correct - I'm _much_
happier, and it is way more reliable for me to write the mask in hex
notation.

I think this is where use of a ternary operator would come in use.  The
normal way of writing a number of bits tends to be "a:b", so if GENMASK
took something like GENMASK(6:2), then I'd have less issue with it,
because it's argument is then in a familiar notation.

Yes, I'm sure that someone will point out that the GENMASK arguments
are just in the same order, but that doesn't prevent _me_ frequently
getting it wrong - and that's the point.  The macro seems to me to
cause more problems than it solves.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
