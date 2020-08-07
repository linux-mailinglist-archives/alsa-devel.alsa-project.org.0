Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B118923EE85
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 16:02:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D3181614;
	Fri,  7 Aug 2020 16:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D3181614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596808944;
	bh=E1l2Y5ZIjWI5QG7qOlzxqvOBRIRXBvhbLk0WYq3N6Dk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VqJPl86/YDVNV/NDGM7qEDM65L3QXGiAm0xtXyPKD5RLJ+l4K0zf6VmXX9tRvQQAK
	 kQa51t/2lCKttdAKDsCup93sjHBmmDYi7kDS+LFgcuk7dzcPPUSuJk+M9v5RmPrf/X
	 FMWqfNmjB8lXdwtm3pjLfPpmMnQJwVteHNvOA0IY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3347BF8020B;
	Fri,  7 Aug 2020 16:00:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF24EF80218; Fri,  7 Aug 2020 16:00:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C630F801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 16:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C630F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="QQ/T6vfa"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="H/B6qni4"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id AB6CDB67;
 Fri,  7 Aug 2020 10:00:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 07 Aug 2020 10:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=mWSkS+mfjNKEGI2aeMrwmTsHZZd
 wBq26FhEdVwDj3y0=; b=QQ/T6vfaneXf1gDbI/5vkik2U9gzMYw6CwmorUhElrc
 OFu5FzEgWI/YbrozppKs9zu65hZ9YgYmGTRhjsQuHg8MZIQta9HYugI6HzU4xk5m
 NsQR/U9nfVmLpqnQ9nRS9GC4z2BedIVkWAAEQzWPN0RM6vIewoi8knrxquEHylu/
 vsKqnOCSkhp3h8rgBOM407TDFGjKyvay7dOU8LGVVF5fncUqdGr95/YnYYM5Jo2w
 AWkiTHnsY3lMSqVFunVHcIscR7S4fCyzTTdjUal00kpQSa5hqa0GaCv6YtCise8M
 bk0oNEtixVNpZVPnYWH+LPBjWQacL2T3hPmXRw9u4iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=mWSkS+
 mfjNKEGI2aeMrwmTsHZZdwBq26FhEdVwDj3y0=; b=H/B6qni4vo7hsXsSHDPxXI
 SMCjbFUtQKf8kYf9tn9aSuiSsEDD81a5C9F0h+8FqTxNa1FMSH1RfVunB3FGye3K
 pMu8jrZZdcC/TISxlkPiiuf+FIl0czu8Oli38mImTRclQ76+MQTEE02UkKleakEx
 2dalyTNbaVkOZJi0ppcbWV3cE9Kgi9lTTnMgwSgH+IQEUSrqYjpPFdAQyVaWuIkx
 AdE6w98Q1vH7hWGOvZU4Ux2ZWsLTSY425CGsAHOGu2dVoRZvqrZnTKZcYYXT7g8P
 SQlLT3Bp2ZLis7Zh87rWKeKAKc52od88By85unIAq0pNziKq/24jRZ7d/ud9l/sw
 ==
X-ME-Sender: <xms:e14tXwEOprAjx-ELwtIJbsJc8p6K2Uz_ai082wBBSh7Un1sM03Az_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrkedvgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvuffkfhggtggujges
 thdtredttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqth
 grkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepledv
 geduieffkeettedtieelleekheelleehgfegveejgeeihffgueeileeviefhnecuffhomh
 grihhnpehgihhthhhusgdrtghomhdpghhithhhuhgsrdhiohenucfkphepudektddrvdef
 hedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:e14tX5X4KnbZ7I_fCeTlehFmjvLRcLZtxyHk6embDU8FsuECjKgAAg>
 <xmx:e14tX6INXkIoRniIWgQ0nC1qjDARx2G2qT3-MIfVHP0KN-bWQjm34w>
 <xmx:e14tXyHGhhRS8aKxo7Hu7jInJiRdTPQFgKZvypH6oMpLKycTg7wTmg>
 <xmx:fV4tXxDJO9T3w27NOxxQk1V5wqlNxp8EG3SByRo71wjxuo68YueNFw>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74DBA3280063;
 Fri,  7 Aug 2020 10:00:26 -0400 (EDT)
Date: Fri, 7 Aug 2020 23:00:24 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: request for missing access permission to libhinawa repository
Message-ID: <20200807140024.GA476204@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
 Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20200807051853.GA453546@workstation>
 <e45a2bc4-af63-3996-35f6-6558261c9106@perex.cz>
 <s5hv9huanoi.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hv9huanoi.wl-tiwai@suse.de>
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On Fri, Aug 07, 2020 at 10:02:37AM +0200, Takashi Iwai wrote:
> On Fri, 07 Aug 2020 09:52:36 +0200,
> Jaroslav Kysela wrote:
> > 
> > Dne 07. 08. 20 v 7:18 Takashi Sakamoto napsal(a):
> > > Hi Iwai-san,
> > > 
> > > As Jaroslav is absent so long[1] (summer vacation?), I would like you to
> > > arrange some team/repository settings for libhinawa.
> > > 
> > > I lost my write permission to libhinawa repository[2] since Jaroslav's
> > > arrangement for github team. You are an owner of 'alsa-project' team in
> > > github.com, and I guess you have enough permission to configure below items:
> > > 
> > > 1. setting enough permission for my account to libhinawa repository
> > > 2. add libhinawa repository to 'GObject Introspection' team[2]
> > 
> > Oops. The permissions are fixed now. Sorry for the long delay.
> > 
> > 						Jaroslav
> 
> Ah, you already fixed, that's why I didn't find anything wrong :)

At last I can push into the remote branch. Thank you.

And I'd like Jaroslav to fix repository desctiption with correct URL to
documentation so that a few users are not puzzled. At present, it's
https://takaswie.github.io/libhinawa-docs/ but should be
https://alsa-project.github.io/libhinawa-docs/.


Regards

Takashi Sakamoto
