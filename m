Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F0283540
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:29:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B001D1669;
	Tue,  6 Aug 2019 17:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B001D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565105347;
	bh=9Usvb5eytbseCoGx7R7mD6w8QT3msNuZmBbfK3L015g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r9i0bre7eRsRNsL+fWC5xAlYfb+SNCzRJbXbWMIi3GLyKo4gR27w+iQ/VmeEx6IaL
	 SCxsHJ2gLm/WzLMxOJYDFrY3RNr+6e5I23h252xv7YkURDc0v+w4W7PjjnPM1RTH4C
	 o98xPQ/BcYmdTS2OA2RbBMhYw4Iuw+UEvQEtgy5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4DD9F80290;
	Tue,  6 Aug 2019 17:27:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 008B5F80483; Tue,  6 Aug 2019 17:27:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 355E2F8011B
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 355E2F8011B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="1aQbys/7"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0523521F14;
 Tue,  6 Aug 2019 11:27:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 06 Aug 2019 11:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=imTAjex9xyGhSUBWu+vwiVJj/98JlHOV04JwgcIvH
 8A=; b=1aQbys/71jKEuqZBp5pYUHNaTLu8anWqkqxAyb7GHJCrdAG6384qawMac
 K0swmP0Hj6zunrXaoFzoCmS17BtDkUK7wRkyFU4HPemV3hYQl7gVeQH/HxSJYyWd
 1MdXikvsGVL349tG98UH81YOv5z5HV2yzlxnuiolqdlZ/qic3h0EuvQQVw/b7ejZ
 oZi2Vm6NPMt19dzN7PR5gsCf/gFEWnU80yQO3eesAU1bdtQDVX1VM4BX/n/4PwfY
 SrMZxkaHXL46v9nFEt4KqMlSWYsPjKmC57r8KyHg2zyNIl16jw5/LOHw/3Om/JEF
 NmyFjmq906qrKxwe0EKc88UbSaoCA==
X-ME-Sender: <xms:U5xJXaSRpse82kyq8wPl2mPV59NVte-LLmFy5d9aQOLPAJ1LAZHPtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddutddgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
 ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehlih
 gsvghrrghprgihrdgtohhmpdhmvghgrgdqnhgvrhgurdgtohhmpdhrvghpohhlohhghidr
 ohhrghdprghlshgrqdhprhhojhgvtghtrdhorhhgpdhprghtrhgvohhnrdgtohhmnecukf
 hppeduleeirddvgeegrdduledurddutdeinecurfgrrhgrmhepmhgrihhlfhhrohhmpeht
 rghnuhhksehikhhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:U5xJXTGfzni-Ufe8HZl8VB0zwBYXQayyODU34V7SZIHj7FSqIJ-ZLg>
 <xmx:U5xJXTq8vUjByvLq41y2qankcAArH-LUTkzaeDKfFYV7Cf5sQrzuLQ>
 <xmx:U5xJXZPqlE-xrZPKAiAaasNuXDyvP1Ud8IeGsXhEMbQnPCKl3O0_Ng>
 <xmx:U5xJXQQbE1ULrecPeQBflwRRcUQ4xFnryacP8oKRjQUiYVdwNstoJA>
Received: from laptop (unknown [196.244.191.106])
 by mail.messagingengine.com (Postfix) with ESMTPA id 420BA38009A;
 Tue,  6 Aug 2019 11:27:14 -0400 (EDT)
Message-ID: <9579b65b633a4199e7728f68968c669cb8390302.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: karina filer <kafiler0911@gmail.com>, alsa-devel@alsa-project.org
Date: Tue, 06 Aug 2019 18:27:10 +0300
In-Reply-To: <5e969a5245d6922d28d71a7c453dd6e3f5fd2228.camel@iki.fi>
References: <CAM+cExGffwFD7U--tZqd_PxFwgdy6YA_tZHvw6B3au9KNygEhA@mail.gmail.com>
 <CAM+cExEBpgWctFLKcVej9UnLS2VVx9CoaOigu9y3BvYGNOi1zA@mail.gmail.com>
 <5e969a5245d6922d28d71a7c453dd6e3f5fd2228.camel@iki.fi>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] Alsa-Plugin 1.0.25 License
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

On Tue, 2019-08-06 at 16:20 +0300, Tanu Kaskinen wrote:
> On Mon, 2019-08-05 at 22:44 +0530, karina filer wrote:
> > Hi Team,
> > 
> > Greetings !!
> > 
> > I am facing difficulty to understand the Alsa-Plugin Licensing, Could you
> > please help me to make understand?, Is it under GPL 2.0 or LGPL 2.1 because
> > after extracting the folder I can see 2 copying file one for GPL and other
> > for LGPL.
> > 
> > https://repology.org/project/alsa-plugins/packages
> 
> alsa-plugins seems to lack a README or other overview document about
> the licensing... alsa-plugins is primarily licensed under LGPL 2.1, and
> to my knowledge the only exception is the libsamplerate based rate
> plugin.

I now had a look at the link you provided, and there I saw that BSD-3-
Clause and MIT were also mentioned. I had a closer look at the code,
and I found two more exceptions: the libspeexdsp based rate plugin
(under the pph directory) seems to be licensed under BSD-3-Clause, and
rate-lav/gcd.h is licensed under MIT (rate-lav/rate_lavrate.c is LGPL,
however).

> The licensing is explained here:
> 
> https://git.alsa-project.org/?p=alsa-plugins.git;a=blob;f=rate/rate_samplerate.c
> 
> So this particluar rate plugin is licensed under GPL 2.0 "to follow the
> license of libsamplerate", unless you have a commercial license to
> libsamplerate. I don't think the rationale for that exception makes
> much sense (LGPL would have worked just fine, as far as I can tell),
> but at this point relicensing may be very difficult due to many
> contributors.
> 
> libsamplerate was relicensed under the 2-clause BSD license in 2016[1],
> which may or may not allow you to apply LGPL to the rate plugin (my
> guess would be that it doesn't allow you to do that, but IANAL).
> 
> [1] http://www.mega-nerd.com/SRC/license.html

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
