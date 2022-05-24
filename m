Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB3E5328EC
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 13:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F25AD167F;
	Tue, 24 May 2022 13:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F25AD167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653391591;
	bh=295aZRDOyzwlZ4l1xTOHtIOoBKSwIJmX+rOyO42L0r8=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cCQGEualey9D4pefQm8CqnkZ4Ln43rXjaeZPF+Hftdw3/KbfaCgRsYLxU7S1HsTza
	 qfaLB1MrPjJ/eYtQtsoikzfEtg8yVavlJMfBsPY26B/2XkRBL6zuFMpoazpgzRBCGY
	 jiSRWmQdjyxfYToEPFx2FDCJs9pxJ5ESRew9aUTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EDBDF804D6;
	Tue, 24 May 2022 13:25:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17783F804D1; Tue, 24 May 2022 13:25:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4884BF800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 13:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4884BF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="jnrvxvqz"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="usxZyiH9"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8B08C5C027B;
 Tue, 24 May 2022 07:25:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 24 May 2022 07:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1653391517; x=1653477917; bh=295aZRDOyz
 wlZ4l1xTOHtIOoBKSwIJmX+rOyO42L0r8=; b=jnrvxvqzYGUoPJMRa47o3XBPPu
 9u92NU6/82c9EphyBNUpEifbgDfkUYNAteOm1z5OyzFQjjpCJwTiNrMK1vuMs+9k
 8sUxYdFzXCXzb29L+7KpcS41GxhD7jkqqxH2tZqJBQ6bJBBYj0nPaQI7sxXwdizx
 3EMB6f7pVFP57Nr3p6smtw/0ZvjSgtJC324wRGlKYds5v7k8xqhu0qo0rNX10Q/G
 meDz4SZr2NbqDcVcOAhngyH76mSJZ18kVj4Mckek1Y6PFGwcrQogKNUGOIeZJXSm
 IOFww+MyLRSaABlNUoVyB1vymkTHJlTvy5R2toIVT/wAsm8aSvK4phwbc1fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653391517; x=1653477917; bh=295aZRDOyzwlZ4l1xTOHtIOoBKSw
 IJmX+rOyO42L0r8=; b=usxZyiH9MUD7pM3eKZiBUjxgebUsBe3Zt0umkQuMM674
 zeolOp6MP9BLva7zmuxkn/tikmTTI0kpxOg6TD+z8wdxb+tshP/XEmzB5+3/uVGg
 +IS4Rec0IOr2Qj9HSsn2yHdFfM6mVVqU1QWbpUVf8dXe+c/3NntAt3ZCK3X/hnj0
 XOSMk3MD34QWTfTWylGZ7TzdKooG5827TG5DxdbwFeCV0oJcUSwsdVMoS9p3ONJB
 Iumv/GMJ8Yav8O+P7/yTf2XojKV2yau1S0+ysMASxzh88xtpcs2VKvPoMi2oYILL
 MTrdgNHJcwv8W/7CAnODwcegloIwcz3O/vRm8ALSXw==
X-ME-Sender: <xms:ncCMYheX-q1MWWvPSSbYoD_VETJDHwiW_23XntDHpWD2XNJPXZuoPg>
 <xme:ncCMYvMam7pvonglMpIjjndMzEhRQtTjFzM5N9DU9eof1bbpkGSxiJyf9e4LIZJ4B
 RqaX9zaRtv8LZtoxJA>
X-ME-Received: <xmr:ncCMYqgjpVfCAcoBXo5Nk9eoIHOzuTYeUCpY-XkraD-zzOjQGsagNuRAVKqWWHJs8TC6hxZyZVYRqMbF00ja9789A5-E8Dsl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeefgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvuffkfhggtggujges
 thdtredttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqth
 grkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepledv
 geduieffkeettedtieelleekheelleehgfegveejgeeihffgueeileeviefhnecuffhomh
 grihhnpehgihhthhhusgdrtghomhdpghhithhhuhgsrdhiohenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrg
 hmohgttghhihdrjhhp
X-ME-Proxy: <xmx:ncCMYq-KHIN_Y8ZmsvlgUkt-QbEECMUaa4TdUglPkhujO8iElCOIGA>
 <xmx:ncCMYtsKWE9nfXwP9OuFgy3EPkUVfr0z42Q48DF30ASgDWI9JqUfxQ>
 <xmx:ncCMYpH9B08jY5wK0GqKT05KJ6WSpbrjfJx-1Gbv50ZPieFoKF2Jww>
 <xmx:ncCMYuWccnjViCX7hidH4iXkeQv2P9xd7KxgujGFZX5p8eEKvctkuA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 May 2022 07:25:16 -0400 (EDT)
Date: Tue, 24 May 2022 20:25:13 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>
Subject: Re: Request for setup of new repositories
Message-ID: <YozAmQFZ3LhqQoZN@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
References: <YmagC3V3t0k84k9A@workstation>
 <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
 <YmfZxmfv5dfgdYG1@workstation> <YmtNgqfFREYKZM6t@workstation>
 <YnO4A43EUdnG0b7n@workstation>
 <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
 <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
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

On Thu, May 05, 2022 at 09:49:52PM +0900, Takashi Sakamoto wrote:
> At present I prefer separated pages from source since the pages can be
> generated from the source, however as you say the inclusive way is worth
> to reduce repository maintained by the project. I test the idea later in
> my libhinoko repository. When it looks well, I'll request you for
> configuration change.

I'd like to fix the issue for the URL of documentation before releasing
libhitaki since I put the URL to configuration for gi-docgen.

I'm investigating to put the documentation into the same repository
where source is maintained, however I prefer to separate the two into
different repositories. Then I suppose it good to put several
documentations into one repository rather than maintaining them in
different repositories.

At present, three repositories are maintained for documentations:

* https://github.com/alsa-project/alsa-gobject-docs
* https://github.com/alsa-project/libhinawa-docs
* https://github.com/alsa-project/libhitaki-doc

Let us consolidate them in one repository. For example, by referring to
team name:

* https://github.com/alsa-project/gobject-introspection-docs/

The documentations are expected to be public under below URL:

* https://alsa-project.github.io/gobject-introspection-docs/alsa-gobject/
* https://alsa-project.github.io/gobject-introspection-docs/hinawa/
* https://alsa-project.github.io/gobject-introspection-docs/hitaki/

I'd like to ask your opinion about the idea.


Thanks

Takashi Sakamoto
