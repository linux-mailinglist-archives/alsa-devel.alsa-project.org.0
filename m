Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7EF386F91
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 03:46:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A1671679;
	Tue, 18 May 2021 03:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A1671679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621302403;
	bh=Q7YUoi25whXBFYId3XvNtt0aje9smOQA1G0WJJCfnrc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=grfsiaVUxPOz9b0g0IBe9OBQj7+5ZdwTz8mR1KWEF5XPZ/hb8trzSAXHXvF154ZC5
	 CODmTT38c2rRcz91s8B3PoUHVDXFuwPDoz/6LIMEgFrKxA+bKPh00LhHge7yLNJjS/
	 Ui+3zQPzv6GUXWLK+s4nDJRAxWJnbRWcZ5/poVNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8216FF80229;
	Tue, 18 May 2021 03:45:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D8C4F80217; Tue, 18 May 2021 03:45:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3281F8014C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 03:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3281F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="n9QYpSCJ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tEKnI21F"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 468845C01BB;
 Mon, 17 May 2021 21:45:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 17 May 2021 21:45:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=OXdUO0nI8k9ua96ECoPJOJzL0Bw
 ECiv2zYij67hM+d4=; b=n9QYpSCJMZjrbniz+BSgtJPlPJzX7wKjWO+J7VNBkmQ
 Ums6uY4GehZn/l9AMLqZUNBNMNxxBed51o5kZg/73+lsit3R5KFMeSUjnMOjBT4e
 6Na4CZlPvrJdTnb0gvvrz11BI+qXwmZdZKxPzCvFKkHc2soPKRywSsQTI2edLiGF
 /HVfiIAVdBEhRoqEdFzXoXb2eH6OVDxVlanFZe/8MoWCWcVKouYq77UiiLo0WHHM
 p9orokMQUepDlHFvshDKBUMXrO/lTo46K62WV+19POIcNwEA3bp8haYHqdVIkZTf
 CJCarf6nsskXkd7vSbwwDQIp6nOs6LRg5mEJbzfrz3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OXdUO0
 nI8k9ua96ECoPJOJzL0BwECiv2zYij67hM+d4=; b=tEKnI21FB0Y6IsYmReKCGR
 4IcrmKL6iZX1YEJ0ExZrM15f4jIoAvdCJ2Ybm3bT3ZbSz5lJ1dmzqZR7Lclv8qIo
 R9MxzkpQsVwkLCnfHyGttk2i9ykt82vPah7zacSOCI7OOWjzPAfgT+rcW4XGJwIW
 62Hs+cbkHJqUphzoxVkUW4xo+AGcK1g9s3t/SBZuzpde3+hJDg2h0iLGjhnN/uBC
 q99F58C+U4SwWc65MrPZ7d2z6cAcKkr/DLv8Zyc9P9EckTHJsPGZBm8AnaPzOA9m
 Lw51sSqKvq+TH8Q+2YqeCGvGJScyB6kdkaZx3B38WOQ1nIy0sAy2zqiWH3/BUIWQ
 ==
X-ME-Sender: <xms:IRyjYEzvg2WWYEjvn03-oBDvUbs4iJA1ekjT7CgNZWn-_xsw_labMQ>
 <xme:IRyjYIRHMYzsGDO7uOSC_yZqtN9B8A0SflGQFk1eiwUoPq3U8HW5O4OsG0F-B4bf6
 Mw6U674c03oF5tNlRM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiiedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:IRyjYGVjTFRAv0cJ41jnAm5eE4JmlILS9gFuDbgViUsMUlAMJsor9Q>
 <xmx:IRyjYCh80gEQxeXwybzLM2f_BeePPhnfoY9EqG-lR_DN2oatWNEi0w>
 <xmx:IRyjYGCRTkMWXwEobFV1Oq87kxIMBvK0fm0LJxf4TFygMNwJLhVN_A>
 <xmx:IhyjYBqoepBzvB2AP0BeSG9xrexlRJVn988zM_EXJEcz6tt25d6n0w>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 21:45:04 -0400 (EDT)
Date: Tue, 18 May 2021 10:45:01 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 07/10] ALSA: oxfw: code refactoring for jumbo-payload
 quirk in OXFW970
Message-ID: <20210518014501.GA37317@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20210515071112.101535-1-o-takashi@sakamocchi.jp>
 <20210515071112.101535-8-o-takashi@sakamocchi.jp>
 <s5hsg2l67ys.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hsg2l67ys.wl-tiwai@suse.de>
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

On Mon, May 17, 2021 at 11:11:07AM +0200, Takashi Iwai wrote:
> On Sat, 15 May 2021 09:11:09 +0200,
> Takashi Sakamoto wrote:
> > --- a/sound/firewire/oxfw/oxfw.h
> > +++ b/sound/firewire/oxfw/oxfw.h
> > @@ -32,6 +32,12 @@
> >  #include "../amdtp-am824.h"
> >  #include "../cmp.h"
> >  
> > +enum snd_oxfw_quirk {
> > +	// Postpone transferring packets during handling asynchronous transaction. As a result,
> > +	// next isochronous packet includes more events than one packet can include.
> > +	SND_OXFW_QUIRK_JUMBO_PAYLOAD = 0x01,
> > +};
> > +
> >  /* This is an arbitrary number for convinience. */
> >  #define	SND_OXFW_STREAM_FORMAT_ENTRIES	10
> >  struct snd_oxfw {
> > @@ -43,6 +49,7 @@ struct snd_oxfw {
> >  	bool registered;
> >  	struct delayed_work dwork;
> >  
> > +	enum snd_oxfw_quirk quirks;
> 
> Declaring the field as this enum type for bit flags isn't really
> right, IMO.  Usually an enum *type* is used for storing only the
> enumerated values as-is, but the actual code (in a later patch) stores
> the combination of the defined values as bits.
> That is, if a field is defined with an enum type, readers and
> compilers may believe that only the defined values are stored there,
> while the code doesn't follow that, which is a confusing situation.
> 
> I see that a similar pattern is used already in the firewire code, but
> I don't think this justifies to introduce it to yet another place.

The concern is in the category of human practice, and heuristics, in my
opinion.

I check C language specification and it says that enumeration-constant
has type int, and enumerated type shall be compatible with char, a signed
integer type, or an unsigned integer type and the choice of type is
implementation-defined. The assignment of ORed enumeration-constant (int)
to enumerated type (int with 32 bit storage in most System V ABIs) is not
forbidden past and future though the specification mentions about its
warnings in the annex.

Nevertheless, the practical point should be respected as well. I'll
prepare take 3 patchset including fix for some issued points.


Thanks

Takashi Sakamoto
