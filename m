Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 907BF387423
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EB4C16AB;
	Tue, 18 May 2021 10:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EB4C16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621327039;
	bh=z+/ubAYRBrzl9LRhEGTt7kuggw1/r11Q1vJsbYTV7bs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hof0tAdsR2EVBu/wyu8d0B4LEdvd9qQjle1XE15jUkqlNyng8MmdUY9mJV+ylgJb8
	 fDX/Qp8x44jDD/vVs4oA/7vNPjIs+nOMBOvRa0x0VzPlvyiq6k5zGJOfjRk7H1+xjt
	 gcauxDzJjHYZ9FeC9AZH2gmaQ8CHkQv3oP9JVZWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80A77F80229;
	Tue, 18 May 2021 10:35:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD885F80217; Tue, 18 May 2021 10:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AE5AF8012C
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AE5AF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="bDOs2iWW"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="ULXt8Jox"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 0F4335C0163;
 Tue, 18 May 2021 04:35:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 18 May 2021 04:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=kdHtUfCL7maaorkxWyZAAJIo0vY
 Hk/wGG8S4TtBfyF8=; b=bDOs2iWWhw/Q/eXpwVhB5s40wh5bnOdxxIDw1+ZYJFz
 kdVkrKDP47cROiDfk0VlUPzHaDBe8RpUh1195xINXlqL19B85+BibIJdW3s5D7ni
 u628RexmCi+NHNQElM9ESQ7vUdTsNciyU5/DUWEh4bloHXZfVxcFRy6jEhgpN4Th
 gUZF137SUZ3o5p4pQADTdc/g+bI3bv2WwazEgBSRpuDvUwvN2E3PG6K0y0qVRxPp
 ZCv140C5uNSgIMWfASvNmxgg7hs1Ep0dEk13rV7ULhWx0j450+fehq+mJVy3Od9i
 U9FCW+KxdydALA6Y8Qy+/IW/wAgLthhwBEgtBAJAN5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kdHtUf
 CL7maaorkxWyZAAJIo0vYHk/wGG8S4TtBfyF8=; b=ULXt8Jox3uyzWA2lt6tWSi
 V5ZylPrKgZAAO3XwNxQK0+4muK+AUOTraYvjbSzuOloE//EBu+ENltqxuQNQQJM0
 bdJKNL7YrAUE3QHC17RCCTB94kvQnv97hqyif4GTnjEb4O+iR/cmFIIwD8v5HpiI
 kAe/8tWW7eREYxYGJM3ghlhl4Ou7Ra9m4InhJjQ1WYsEL2Emfes/DQgcYCVx1qRN
 qcZ4MrBta6ki3ADDcu5jCNLkryTX0Cd30GLusIVyWji8qjdTB1IOabMtt/i5O31z
 ixCsPcR+cDSNrIl1xMJzjgBTwo/de7RS2jvvU+uJR2RxXRt6szJAcO3AhgXtFGOQ
 ==
X-ME-Sender: <xms:XHyjYLnlgeGwTUeP1shBO9f3zFcXC2uoykicXHrxipGhTF245Fw-Kg>
 <xme:XHyjYO0hNTU1K_YqmSd5db-cHDoA85UdgVq28ch9gOs-4e_AGc6mkhHKhsqruEtAE
 jMjx46fMmTUT-jt8Wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:XHyjYBq49idpmWsiXP8YMoui_sb6YDTO1cjwcgqJ7nCKYIILcOfXEA>
 <xmx:XHyjYDkrTzZvrr7cypjatMddq4A5H7ik4lFol2VG0uroJ2gV54IP2A>
 <xmx:XHyjYJ1hWsPhJpMcNMwg0F-m3-73h2zxqOk80ZjwU-Etlneonvax8w>
 <xmx:XXyjYG_-NE3jpFjnxXtMQlP0kwxk7KcM2u4yTcQp5Wy92bV6-kkcPA>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 04:35:39 -0400 (EDT)
Date: Tue, 18 May 2021 17:35:36 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3 02/11] ALSA: firewire-lib/motu: use int type for the
 value of bitwise OR with enumerator-constant
Message-ID: <20210518083536.GA86229@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org
References: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
 <20210518024326.67576-3-o-takashi@sakamocchi.jp>
 <s5hsg2kmsm9.wl-tiwai@suse.de> <20210518081334.GA84841@workstation>
 <s5him3gmovx.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5him3gmovx.wl-tiwai@suse.de>
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

On Tue, May 18, 2021 at 10:23:30AM +0200, Takashi Iwai wrote:
> On Tue, 18 May 2021 10:13:34 +0200,
> Takashi Sakamoto wrote:
> > 
> > On Tue, May 18, 2021 at 09:02:54AM +0200, Takashi Iwai wrote:
> > > On Tue, 18 May 2021 04:43:17 +0200,
> > > Takashi Sakamoto wrote:
> > > > 
> > > > It brings some inconvenience in practice to use enumerated type for
> > > > variable to which bitwise OR with enumerator constant is assigned.
> > > > 
> > > > This commit replaces declarations of enumerated type with int type.
> > > 
> > > Better to use unsigned int for bit flags.  Otherwise the highest bit
> > > becomes harder to use.
> > 
> > I can't imagine such situation that the signed value causes issue. Would
> > I request actual example with such issue? At least, the highest bit is
> > still available as bit even if the value is negative by assigning
> > 0x80000000...
> 
> It's available in signed int, but this is inconvenient, e.g. if you
> shift the bit.  Maybe I forgot something else, too.
> 
> You may still use signed int if you are sure that you'll never reach
> to the highest number, but other than that, using unsigned for bit
> flags is a *VERY* common practice in the kernel programming, so there
> is no reason to ignore it.

Ok. I just follow to the convention under the Linux kernel development.


Thanks

Takashi Sakamoto
