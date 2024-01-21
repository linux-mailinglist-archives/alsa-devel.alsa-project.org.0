Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660C83561A
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jan 2024 15:31:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E5783B;
	Sun, 21 Jan 2024 15:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E5783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705847506;
	bh=fFJI4JE9TrhUfRiKbiSUBfJ7ezAkpkPs8aNRSfTJsjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bjUusRwkHE481iz0+Rp4r9gjP50+cQKU8yFpkSzowcrIt4rmXzMBHlQsKCTDyOnwd
	 wf3kEN/ZHuW+WQVhsfkOm9XwdATD/C3MVBZQ98F5LC/8KQKrIe8j+caDCLpSp5Sfjd
	 OZB7Kd+l6m/juROJZDfIPF0kPMeO0aOnAW4WQLD8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0325F80579; Sun, 21 Jan 2024 15:31:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D608BF80564;
	Sun, 21 Jan 2024 15:31:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13C5CF8025F; Sun, 21 Jan 2024 15:31:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E77E0F8003A
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 15:30:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E77E0F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm3 header.b=GpPl6Ag2;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=oWpM8WrO
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 527CF5C008F;
	Sun, 21 Jan 2024 09:30:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 21 Jan 2024 09:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1705847452; x=
	1705933852; bh=bmzKAKGSPl039UCfLQEWDFYU5bg1TOs5nod+Ya9XZng=; b=G
	pPl6Ag298rrPfQaxyYOuxRk4O6Q4Zf+cRwEE9UjCDzGP6GtE6ZFRRmuuNjprXq4u
	N6+7uJPnesi04jjws6XiWGbiGE2Iovujpy5BcgO90w9P9+GdBoBQysUyowDq2ZCa
	A53UqxOebv/1dUzMOAJ4zcUnfwKOouwX0jayVj5PNkkuIlvdeY65moDVksLvAQU8
	x/6JtPsPCWbxhispYCUZedg3tJp9ON+FubkGYkwWCQBH3mv/pR768O+bdFZA9Dac
	crBeiq4cKseDj/P8ktEt+OnhZRcXewK61LYbcJeiezOudWffrcTm29mDfnA+FmwT
	lchlG2S464rvOnlCVepRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705847452; x=1705933852; bh=bmzKAKGSPl039UCfLQEWDFYU5bg1
	TOs5nod+Ya9XZng=; b=oWpM8WrO4o9NRBQ9CadrOet/7NxHv1sOLYvyxiI0thfp
	v9J8urUfGduOSe7G0PkXiLvq0p3ZLjTgGfgxC46XcYCk7/Hfs2xuhvvU2s8mVO9L
	THrouIwiBMQ3meK+nEwLolYm2C+KDG8ihbGxIwhlwmh8ZfHcaSvSYPfMLcR+Aa0h
	Y5aDUjZkh5xiSKzwXxJ49rDIFfwDv5UIskoj0mc2Xdpr7B6TUdVexC4WR3vpi7OG
	ZS454FrwD5Qmc87SQ62IQxo8rvrXAxr/Rwck82+SfILpwHCIuWNDTorX1w2Ym1bm
	9qn6qQbst6XeYVmb2AEjfQvlpN9U8DwCPFru8QiQrg==
X-ME-Sender: <xms:myqtZRjvJOUEwKVRexR0QEm8nsha155aDhsWj951pyxT_OA_YG1aoQ>
    <xme:myqtZWB5n0HmhJoBpMgq88HaCzR0r5_-5ybTAZOy0Y7pGDgZ-IbG3IU15r9x05KtN
    DJb3PsLWWsnel76KxI>
X-ME-Received: 
 <xmr:myqtZRFG01PeljOLf75b2f3iK5MaTCQFFxmrnMHHJ6eUQBzfuBkk9Xf0-I6WKQUGLw7EPPuDM9TmfaK_1zJz_0QToiqFI_IfPQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrvdekgedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhepfffhveellefghffgleehfeehhfevtdfhvdfhvddv
    feelgefhgeefuefhgfeiieetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdprghvtg
    drrhhsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    ohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:myqtZWSHdxy2F0lEOLGoYBfx1_O2McMEkhiHjecOg8iL9jy17h8JDQ>
    <xmx:myqtZexB_EbhTFfW0SxVLM-rNBxlLVQbrxF5RzZbMrhhd37kni3KYA>
    <xmx:myqtZc61GMscS87Ky7alUmK1yqnko5xfclF2LOfIm7Lrn__YuP1ROA>
    <xmx:nCqtZTqbSrELOUK0YSbxHAt6NqtQwrHhM9gcmKIqRKYZ-i5ZtaRYuQ>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Jan 2024 09:30:50 -0500 (EST)
Date: Sun, 21 Jan 2024 23:30:48 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michele Perrone <michele.perrone@weiss.ch>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>
Cc: alsa-devel@alsa-project.org
Subject: Re: MAN301 internal routing (Re: [PATCH] ALSA: dice: add stream
 format parameters for Weiss devices)
Message-ID: <20240121143048.GA191130@workstation.local>
Mail-Followup-To: Michele Perrone <michele.perrone@weiss.ch>,
	Rolf Anderegg <rolf.anderegg@weiss.ch>, alsa-devel@alsa-project.org
References: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
 <20240121140748.GA189921@workstation.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240121140748.GA189921@workstation.local>
Message-ID-Hash: O4A6EDQJVUMGNIPJAHZZD5FBFDHPMVDW
X-Message-ID-Hash: O4A6EDQJVUMGNIPJAHZZD5FBFDHPMVDW
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O4A6EDQJVUMGNIPJAHZZD5FBFDHPMVDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Sun, Jan 21, 2024 at 11:07:48PM +0900, Takashi Sakamoto wrote:
> Then I have some questions.
> 
> 1. The signal source designated for stream-output-1/2
> I think it is any type of digital input designated by control element
> "Digital Input Capture Route", or source ID block which generates
> silence.
> 
> 2. The signal sources designated for the outputs
> According to the manual of MAN301, the sources are selectable somehow.
> There are two ways at least for pre-amp and player modes. I guess that
> any interface is defined to configure internal router for the purpose.
> 
> [1] https://github.com/alsa-project/snd-firewire-ctl-services/tree/topic/weiss-support
> [2] https://github.com/alsa-project/snd-firewire-ctl-services/blob/topic/weiss-support/protocols/dice/src/weiss/avc.rs#L12

I have an extra question.

3. store/load router configuration

In my understanding, TCAT DICE firmware stores configurations per three
rate modes. When switching between the rate modes, corresponding
configuration is loaded automatically. In the case of MAN301, the
configurations done via AV/C command is loaded in the way?


Regards

Takashi Sakamoto
