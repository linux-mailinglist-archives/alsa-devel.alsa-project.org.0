Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC92555B4F0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 03:30:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 890AF163C;
	Mon, 27 Jun 2022 03:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 890AF163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656293419;
	bh=pwTie4IT05B/bjRWmdZ/f8D+F2HjbdH8Dzb1w7FU0JE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h2MyCFXEMSIY7u6XzRC+vPXWF7dF431ykk+fQb5ncmWSR5/8VkGbbKq65m7cyNhNh
	 tfOIpg9Hx3V6HswXwd+sF1N0R3nevTdebGfN5b1r8D/Vpk2TC9+/5va0gZfo92YmY9
	 cmTWmcL09XemSZoqUy3KGfZSLryXIXmHk/IyBObg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04252F8023A;
	Mon, 27 Jun 2022 03:29:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79509F8016B; Mon, 27 Jun 2022 03:29:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C40DF8012F
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 03:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C40DF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="id7XZtXq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="YXT0YyuR"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id DA39B32008FC;
 Sun, 26 Jun 2022 21:28:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 26 Jun 2022 21:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1656293336; x=1656379736; bh=GL
 hDAxAL+XCx4WNW03Mhf6ZwdbJsN4fb8RvGLLN1g2o=; b=id7XZtXq/+5/kz9V4m
 Ozpybe1gWXu57erEHOT5a++LX6PDxOf+5A5IrQj+Zejdx4TtR2Ys1xvm+rGRh+3i
 0QGELHhzr8aglozBdXoGIj4BWU8bDrTVm9cfDtg/2tCLs9Tn2ksp7EPjSaJQ/bkF
 lRySAx5swb6Pzexc3yonuhC1nOIS4jVXwB+LClQsXS5XWOdmO7vNyNUm3lwRZkh7
 OjjH7JOUnVHjBw0scDi7a0RN6UR+Ur9TG5nLAhrNankGGgQyq3/mUi+/X89/Nzdd
 Wik2WPQhzxDPIbEFlbItlPiTNcq9rUOaI8RMgbkgIaLzcYPkdP9L/K9qVeVu9195
 wIVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656293336; x=1656379736; bh=GLhDAxAL+XCx4WNW03Mhf6ZwdbJs
 N4fb8RvGLLN1g2o=; b=YXT0YyuRjsgtzgVvQKF4aH6RZ/hdQfSqQcR2LLIYX03u
 mwn0W9lNrQ2ObMgt0hAqwqgjUshR+SxL62bnk7g54mmWzRwToIYJ0/HDu+onmMZ6
 ccZeqGge5T6UqgO1qqbOumGZu7eAsP66aVlN/Yux7PUM4Fayc4UQ7FF2LMBhT6K0
 GUmRYgIqZkuDribXdI4qhXFSHnxnoRJpqXtZ7AEZCfZuLMDh3OShT3WUysPqtAYn
 cLMTiUjgAXj7M1FconW7Be2Fffom2pNbjKqG9tjVpbBvVFtjMNIfSt3hGCTUCIEk
 Wnlcbhja7gTIXkKAlDgaSupwzgN/GtACxCGU54i8oA==
X-ME-Sender: <xms:1we5Yl44lEaKGMZCYuXApJGaSvcc6SNtQw_bfl42VAuJ3KWSLatc_A>
 <xme:1we5Yi6QXvrE8K4ezOaxoDFCwJCUxm2k6LZaL-kQMStfAKx0xpcjEx6FbWpBXzAlJ
 5qJbKq_p4SAP-ywbnk>
X-ME-Received: <xmr:1we5YscPlVV1yWg848F7Ywz_o3cOWdRWx_eDh4pVPMgikaKxi25K9O-u11FqO8INnV_o7xMy0t1oAitD0WJ8RGz00amEfqgI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeggedggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnheptefhledtuddvleeuheeiveethfeltdegudfhieeh
 ueevudekkeevteeiueevtedunecuffhomhgrihhnpehgihhthhhusgdrtghomhdpfhhrvg
 gvuggvshhkthhophdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:1we5YuLt-77gGbU6HRaeqXdun5gSEAGFPcMw8GZ2y1-Gc2RQUJB7YA>
 <xmx:1we5YpIZmS1ipT7IV8GnOBQHSRU9ldnR79H9BK-3H1PDsJZETQKpvg>
 <xmx:1we5Ynyrp6Zn_TZ-7JOOhl1b3cZvJ4LLSf3LEcddoZ3FkIQkwqrvqQ>
 <xmx:2Ae5Yry-E6agFanXfS2bLpJhX4Ti5PanwcjineOxuh-7CMhvewHsTw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Jun 2022 21:28:54 -0400 (EDT)
Date: Mon, 27 Jun 2022 10:28:52 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: attach/detach by mixer class implementation of alsa-lib mixer API
Message-ID: <YrkH1NSlAICYVWYv@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <YrbxZ2b+3rIdi7Ut@workstation>
 <119caa05-b6ca-ecd0-919f-b6ec8257824b@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <119caa05-b6ca-ecd0-919f-b6ec8257824b@perex.cz>
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

On Sun, Jun 26, 2022 at 07:23:23PM +0200, Jaroslav Kysela wrote:
> On 25. 06. 22 13:28, Takashi Sakamoto wrote:
> > Hi Jaroslav,
> > 
> > Recent years I'm bothered about unexpected abort of pulseaudio and
> > pipewire processes when testing user-defined control element set.
> > They aborts at element removal event.
> > 
> > ```
> > pulseaudio: mixer.c:149: hctl_elem_event_handler: Assertion `bag_empty(bag)' failed.
> > wireplumber: mixer.c:149: hctl_elem_event_handler: Assertion `bag_empty(bag)' failed.
> > ```
> > 
> > Would I ask your opinion about the design of alsa-lib mixer API?
> > 
> > As long as I investigate, these programs seem to have careless coding as
> > alsa-lib mixer API application. Both of them attaches an instance of
> > snd_mixer_elem_t to an instance of snd_hctl_elem_t by calling
> > snd_mixer_elem_attach() when detecting element addition, but never detach
> > it even if detecting element removal.
> > 
> > In the case, the link list (=bag) of mixer API internal never becomes empty.
> > It has link entries as much as the number of registered mixer classes which
> > attaches snd_mixer_elem_t. Then it hits the assertion.
> > 
> > I think the design of alsa-lib mixer API demands mixer class implementation
> > to detach at element removal which attached at element addition. But I have
> > less conviction about it since enough unfamiliar.
> 
> Yes, if the REMOVE event is delivered to the mixer class, the reference to
> the associated hctl element should be removed. The assert does the check for
> this consistency.
> 
> > I'm glad if receiving your opinion about it.
> > 
> > I wrote test program for the issued behaviour:
> >   - https://gist.github.com/takaswie/8378fe3bc04652d83428694cd7573bc0
> > 
> > For test, please use sample script in alsa-gobject project:
> >   - https://github.com/alsa-project/alsa-gobject/blob/master/samples/ctl
> > 
> > The patches for pulseaudio/pipewire are prepared:
> >   - https://gitlab.freedesktop.org/takaswie/pulseaudio/-/commit/topic/fix-wrong-handling-alsa-ctl-event
> >   - https://gitlab.freedesktop.org/takaswie/pipewire/-/commits/topic/fix-wrong-handling-alsa-ctl-event
> 
> Your fixes seem correct. Please, create the PA/PW merge request with this
> code. Please add me (@perexg) to your merge message.
> 
> Thank you for your work on this.
 
Thanks for your confirmation and reviewing.

In my opinion, it's better to have enough explanation about the
postcondition in alsa-lib documentation so that developer for
implementation of mixer class takes care of the postcondition. I filed a
request to alsa-lib repository.

 * https://github.com/alsa-project/alsa-lib/pull/244

Then I filed to each project with reference to your account:

 * https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/728
 * https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/1296

> 						Jaroslav
> 
> 
> -- 
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.


Thanks

Takashi Sakamoto
