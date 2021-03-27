Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F21834B3A1
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Mar 2021 02:53:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA8D71678;
	Sat, 27 Mar 2021 02:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA8D71678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616810007;
	bh=hZeebRbhrL1F0D6vF+HExdNp4HGLkvsGMdTECIrBq+o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=afqSqtK2kJCx7O/Q/IhoYNMEQoz551xlIeM5Cfpb/GV3Hev6AhO5DG21DerQpmqBg
	 4jd9ZjSDMVCkBMXTWYAp1Fv19K2+uQpltjsPHpXz9NMu1AD8+KAdMau4r/06CoYXVU
	 0o/8pO7RPU76SaZ3mrNXQ2B27Szq8lCPJXtuzFgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66E25F800D0;
	Sat, 27 Mar 2021 02:52:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B42C0F8016B; Sat, 27 Mar 2021 02:51:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B678F80104
 for <alsa-devel@alsa-project.org>; Sat, 27 Mar 2021 02:51:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B678F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="1yEovc5O"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="sfZ+nsEC"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B28A31AB4;
 Fri, 26 Mar 2021 21:51:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 26 Mar 2021 21:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=VlJf3IN69ugE1yjjf3bE0Y4tID/
 r70g8YzTQ4XQ6g+g=; b=1yEovc5OhcbAaIXu3G6PvSTnY+LPvPrs++A5ApQEK+l
 BGbzZAWuWyN2E7N10Qm6yns7scWiQj5z2btuvukxah5ultocggNr+LTD9tjvTeZR
 J6A7LsVj49mNAU+CUH+HobOmxYYfbc7TRoXQ1GlEOAqlNU0yH1z6XyJ2L8Onj9un
 2Xi+fvNScDdtz3fI6UgafUgslo8YjACuFubx3QNA7Yj0VFqY9MB2HWvUFSb4v+gl
 Pa7vt6dnGDbxzNVycMVfBg0in0fauK7iDnBhOtGij+PQZxPjeCvIbGd3RhmIcr3m
 07HyDL/MrDeCTP4LazUJXIbfk9/ILhpweNwO9LFA+ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=VlJf3I
 N69ugE1yjjf3bE0Y4tID/r70g8YzTQ4XQ6g+g=; b=sfZ+nsEC7rmPU0M/DAdpP1
 ltpxUepKb4+5jh+yIBeA5xZPdRc+VnnYkKukE3IDzwHJl+zsRqrTRNndiuvD+wLA
 ENIVM+QYDbQMS0HfTFcO0wfxsTgQOmnyWwnY/GpbA69PTHZiEBhzcarmrmUKYiMx
 agv7oXhfyB6OXQIsB5ZDf2XTQ+8g9uMYID8Jma6ufst/OJMJT+SaAdNEXhY4i3WQ
 qwkQNfp1LXqwMcbPUrCNNqIRuzA6CZM0jXU1mw0ZRHTZVu9aS0PiF6kUqsmh2w+0
 S2yFXR5z6OM7KK4WFQa6syAhH+eNz1HR0IU8xWN0EU+Wz3RghGRMXwWr9ETLEGZg
 ==
X-ME-Sender: <xms:r49eYHEAsOUNl8bujlXJgmEBrIJX_V9cMgnz9MP991lL42_9SE93Yg>
 <xme:r49eYEXSd5pWRdeiIx13r5YoBDQpJpbFmHvNAxAlH3frdxqtPF4F-h9t98DjH2_XF
 SpGaoAYZ54F_3-8h9k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehfedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:r49eYJLd6hCezVvgtkRo0Iz6Ut1OUMe6lVimFyXwGs28ivWmcUdRaA>
 <xmx:r49eYFHvjFrKSpkaLm7fCvErXq4rm4bLfL4SGU1QpiQalWTOgwgenw>
 <xmx:r49eYNVv9EXvTukLxYzK6trU9ZBDWZAHaw2ZPrf3dHHUHMFOwKnICg>
 <xmx:sI9eYMcz2jUCqUkaGdtcYGqdTcF5nvjxlKOqaNuulqtJsAPmQxXaLA>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 63E6424005B;
 Fri, 26 Mar 2021 21:51:42 -0400 (EDT)
Date: Sat, 27 Mar 2021 10:51:39 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2] sound: rawmidi: Add framing mode
Message-ID: <20210327015139.GA9070@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>,
 David Henningsson <coding@diwic.se>, alsa-devel@alsa-project.org,
 perex@perex.cz
References: <20210324054253.34642-1-coding@diwic.se>
 <20210324124430.GA3711@workstation>
 <057ef387-9ee1-2678-29ce-d644f2a3a90a@diwic.se>
 <20210326044615.GA51246@workstation> <s5hr1k2l56t.wl-tiwai@suse.de>
 <2ca71809-9872-bfee-c19d-76b6ce143212@diwic.se>
 <s5h1rc1lva7.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h1rc1lva7.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, David Henningsson <coding@diwic.se>
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

On Fri, Mar 26, 2021 at 05:44:16PM +0100, Takashi Iwai wrote:
> On Fri, 26 Mar 2021 17:29:04 +0100,
> David Henningsson wrote:
> > 
> > > But actually I'd like to see some measurement how much we can improve
> > > the timestamp accuracy by shifting the post office.  This may show
> > > interesting numbers.
> > 
> > Sorry, I don't know the idiom "shifting the post office" and neither
> > does the urban dictionary, so I have no idea what this means. :-)
> 
> It was just joking; you basically moved the place to stamp the
> incoming data from one place (at the delivery center of a sequencer
> event) to another earlier place (at the irq handler).
 
Aha. I also have another image to estimate the time when public bus
have left terminal, by the time when we see the bus at bus stop. Traffic
jam makes the estimation difficult even if we have standard time table.


Just my two cents,

Takashi Sakamoto
