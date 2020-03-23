Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A22F518EEE5
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 05:39:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24DDF1607;
	Mon, 23 Mar 2020 05:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24DDF1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584938351;
	bh=jjcykooMSoObdXnVfV7+IYY3XHmQGVVFq/arn6nOMsU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pco1roOkfV4lQOnEuPOo6b9PrEwCW07C1RYJtWrcD4GBdBHSly34xccf/UPNhG802
	 OThQjQFhXHdya9K2bKAVE8fFlX+aShHmLkKJxY7hJI/4E1W2u6cvFlfMpljZuTgZz7
	 3EfVy3UErU5qs4QRgrh1+b4Ei8B4cIVQWW5rMl5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CF2AF800B9;
	Mon, 23 Mar 2020 05:37:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F2D9F80158; Mon, 23 Mar 2020 05:37:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_PASS,SPF_NEUTRAL,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E281AF800F6
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 05:37:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E281AF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="siiBqbIg"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6DF3B5C01C5;
 Mon, 23 Mar 2020 00:37:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 23 Mar 2020 00:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ZXM+7JaBf5iyOz+jWKhmgi6uD+E54YaLtCRymWsWu
 mY=; b=siiBqbIg5eSPsu3I5J7Dh6170jCAGZBPNaCQsCMbWWiXXryW6oYhyRFGv
 Zv7Q8aF/x/ddCozp5WlINEJwU1kIVfo7u+JmVmCEw+r6QXeJz6oqR/zwznnqyQip
 LTYMBkGBtP5ogYKBDFI9Ya4bcVhccS+OqQ10VPoSHC1ehLe+eJXmVnULVeAtmem9
 AiYil9v2Ft9Guiawxa7jY8+zDX+kOOZG47CHpppLV/AZrJKPamncqf6uD+9JxAOE
 l/WaT56URkVe3j4qigDZqjSESzN0imgU6eiDJaWtqwZU76qMJRAv2Y38GULw0Tyq
 0HGMfDIj48zMVc7L4A5eeQomkHbqA==
X-ME-Sender: <xms:-jx4XtdiZ31XlPt9Syu1SgNgqpX66SrKJX4O6Ay-S2cm8F2BrH0oAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudegjedgiedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
 ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehprg
 htrhgvohhnrdgtohhmpdhlihgsvghrrghprgihrdgtohhmnecukfhppeduleeirddvgeeg
 rdduledurddvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehtrghnuhhksehikhhirdhfih
X-ME-Proxy: <xmx:-jx4Xqx-JHYpikz5mtB7ESJEgbqB0VrTT6bCXSoqz6ZQOz3tHGohgw>
 <xmx:-jx4Xq0KZOiWjI_Wqe1DQzIBTL5qIa5dkOWoHuB4TlnPV6GiriwQfg>
 <xmx:-jx4Xpd5jPLdR44qLY3-hO36SV28sZHa-PX_GKG0m41Mse7Ap83Jqw>
 <xmx:_Dx4XkujD-uicWLd2RFOdPA48PX4yW0ywoWvMehfBMXA-IVpIoHFOA>
Received: from laptop (unknown [196.244.191.26])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0C1C328005A;
 Mon, 23 Mar 2020 00:37:13 -0400 (EDT)
Message-ID: <cb2473421b72960cda83488a7bdc4629469131d6.camel@iki.fi>
Subject: Re: UCM ConflictingDevice/Priority concepts
From: Tanu Kaskinen <tanuk@iki.fi>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jaroslav
 Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
Date: Mon, 23 Mar 2020 06:37:09 +0200
In-Reply-To: <75799302-0f0a-1a9a-369e-36b3eef2080a@linux.intel.com>
References: <c67a5e0d-c5dc-9ce6-73e5-e7fe602177d8@intel.com>
 <576f09dc-7968-3555-2aa4-e99c8ac5acbe@perex.cz>
 <885ad95f-3a98-92a5-5539-41779e783e75@linux.intel.com>
 <5435543d-ef49-f9df-7d1a-e1b69bfaeb4e@perex.cz>
 <75799302-0f0a-1a9a-369e-36b3eef2080a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
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

On Thu, 2020-03-19 at 14:27 -0500, Pierre-Louis Bossart wrote:
> > > > Also, we need to consider this to have the whole picture:
> > > > 
> > > > Tanu (the pulseaudio maintainer) has also good question how to ensure,
> > > > that the stream can be re-used for the multiple devices. Actually, PA
> > > > does not re-open PCM device when the PCM device name and parameters
> > > > are similar for the switched devices. I also think that this is also
> > > > missing in the UCM specification to resolve this requirement. Usually,
> > > > the stream transfer mechanism is separate from the routing control.
> > > > But I can assume, that we may have the hardware which will need extra
> > > > setup for the streaming (not routing) when the devices are switched.
> > > > 
> > > > I think that adding something like "PlaybackStream" to "PlaybackPCM"
> > > > for the stream identification might be sufficient to cover those
> > > > cases. So, keep "PlaybackPCM" usage and if "PlaybackStream" exists,
> > > > use this value to determine the stream identification. Similar
> > > > situation is for the capture direction, of course.
> > > 
> > > I am not sure I understand the notion of stream and stream transfer. Is
> > > there a pointer to this so that I could understand the problem statement?
> > 
> > Example:
> > 
> > Device1:
> >    ... some enable sequence ...
> >    PlaybackPCM "hw:0"
> >    PlaybackStream "DAC1"
> > 
> > Device2:
> >    ... another enable sequence ...
> >    PlaybackPCM "hw:0"
> >    PlaybackStream "DAC2"
> > 
> > In this case, PCM names for alsa-lib are same, but there's a different 
> > setup to route signal to different DAC which cannot be executed without 
> > the PCM re-open task (when the PCM "hw:0" is active).
> 
> I see, thanks for the explanations.
> 
> Indeed in the past we had similar routing issues that required 
> re-configuration and possibly stopping the stream or changing clock 
> settings/ownership.
> 
> However I would argue that the solution is more to define additional 
> steps than add additional qualifiers in the enable/disable steps.
> 
> FWIW in the Android solutions from Intel, we had 5 steps for each 
> routing change:
> - mute old paths
> - disable streaming on old paths
> - configure new paths
> - enable streaming on new paths
> - unmute new paths
> 
> At each step we could describe what actions were necessary or if the 
> step could be skipped. That allowed us to deal nicely with transitions, 
> I don't think we encountered any case that these steps couldn't handle.

It seems that Pierre understood the idea behind the PlaybackStream
proposal, but I still don't understand what problem it's solving. Is
the problem that PulseAudio doesn't reopen the stream when it should?
So in the example, there are two DACs, and selecting the DAC is done
via the mixer, but the switch can't be done while the stream is open? I
haven't seen such devices, so this is a new problem to me.

The "problem" that I brought up earlier in the device variant
discussion was different: the PulseAudio profile scheme that Jaroslav
proposed would mean that PulseAudio would always reopen the stream even
when it would be sufficient to just change a setting in the mixer. I
don't think this is a significant problem. When changing routing, it's
not important to keep the stream running without any interruption.

The 5-step process that Pierre described is good, in particular it
allows setting the volume at the right time (currently PulseAudio
doesn't follow that process, and as a result there can be volume
glitches when changing routing). To me it seems that following this
process is already possible without changes to UCM, so I don't know
what Pierre meant by defining additional steps.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk

