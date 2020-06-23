Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A222050FE
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 13:43:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 966DA17D4;
	Tue, 23 Jun 2020 13:42:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 966DA17D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592912594;
	bh=xL362neu+ZwR/eJ9Qd6PkbohcgjquwFOhvGToHvZZtQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LBRDZolCzCcrnmTLcQNpHyfPrq+Su3K4YpjdrhMKvYvPH4Jnv0qNyHcZFIHu1EFN3
	 JOEmcPw0TriNopZaFcyS2rarvZ49urkJEtqvhN4iAKDwjsH/vL37uKMAluJblrpJPd
	 XyX1O4PYgRwied7QJ9B4UaN6e4rcf7Y7/ZCaQJz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14C6DF8023E;
	Tue, 23 Jun 2020 13:42:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65690F80234; Tue, 23 Jun 2020 13:42:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jazz.pogo.org.uk (jazz.pogo.org.uk [213.138.114.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F846F800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 13:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F846F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=pogo.org.uk header.i=@pogo.org.uk
 header.b="aHyBiIu2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
 ; s=a;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:
 cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HVDVBI949rru3jNbOAQ5K34gdyUDuMZUgqiaBH5G/E8=; b=aHyBiIu2smEQERTljLdA1N9/ay
 ktn02K6srcOETWhyxBe7/Gm4ODO5C5nav5cYMeuhgHXatlNNuGHAzJ7paUzcKfRs+S1LQklS7LYNO
 CRXr85NllNwN3Rfh6o+f0cpjYQcWrgFgicgLBARjJFSHH2yHXF824qZ/ft6UJ+05He9j5umZQ9H2G
 6wtaHduo6saf6OlrfDerGDDXSRwBgQKVGV2XawLuEtXpJIy9mhkN/TIxgAzTCw1/+qmQcH72G7lg1
 TqQSwU3oIHmpvRwXzAR99ASCNhdsok7Z8rh1f1+K1gFBv23VBYZvAe3iR05jAovWblLMK2AkTbVOz
 HO3SI1Zw==;
Received: from cpc1-hari17-2-0-cust102.20-2.cable.virginm.net ([86.18.4.103]
 helo=stax.localdomain) by jazz.pogo.org.uk with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94 (FreeBSD))
 (envelope-from <mark@xwax.org>)
 id 1jnhJc-000Efs-EP; Tue, 23 Jun 2020 12:42:12 +0100
Received: from mark (helo=localhost)
 by stax.localdomain with local-esmtp (Exim 4.84)
 (envelope-from <mark@xwax.org>)
 id 1jnhJc-0006cl-52; Tue, 23 Jun 2020 12:42:12 +0100
Date: Tue, 23 Jun 2020 12:42:12 +0100 (BST)
From: Mark Hills <mark@xwax.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 3/9] conf: Read a host-specific asoundrc
In-Reply-To: <s5hv9jinhre.wl-tiwai@suse.de>
Message-ID: <2006231233530.6847@stax.localdomain>
References: <2006221356390.20421@stax.localdomain>
 <20200622131515.23385-3-mark@xwax.org> <s5hbllaoxwk.wl-tiwai@suse.de>
 <2006231204280.1412@stax.localdomain> <s5hv9jinhre.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org
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

On Tue, 23 Jun 2020, Takashi Iwai wrote:

> On Tue, 23 Jun 2020 13:18:49 +0200,
> Mark Hills wrote:
> > 
> > On Tue, 23 Jun 2020, Takashi Iwai wrote:
> > 
> > > On Mon, 22 Jun 2020 15:15:09 +0200,
> > > Mark Hills wrote:
> > > > 
> > > > On systems with a network mounted home directory this is thoroughly
> > > > useful to allow for a core set of asoundrc settings, but with different
> > > > settings on different hosts.
> > > > 
> > > > It's not possibly to implement this in our own asoundrc or local
> > > > customisation, as it's too late. The installation file must be modified.
> > > > 
> > > > This is similar to ~/.Xdefaults-* on some systems.
> > > > 
> > > > Signed-off-by: Mark Hills <mark@xwax.org>
> > > 
> > > This kind of change popping up sometimes in the past, too, and I have
> > > a mixed feeling whether to take such a change globally or not.
> > > 
> > > In one side, it can work, but OTOH, if you can deal with that detail,
> > > you're certainly able to set up the environment variable easily, too.
> > 
> > I'm happy for a concern to be raised.
> > 
> > Can you clarify, which environment variable?
> > 
> > I wasn't aware it was possible to override asoundrc with an environment 
> > variable, until I looked up just now and found ALSA_CONFIG_PATH in the 
> > code.
> 
> Hrm, you're right, I thought we had a simple override, but it doesn't
> look so.
> 
> OK, then it makes sense to take your patch.  Or rather better to allow
> an own environment variable (e.g. $ASOUNDRC) instead?  It's more
> flexible.

Why not let me experiment, I'll check ALSA_CONFIG_PATH, and then see what 
patch I can come up with, at least for my own use case.

Something like $ASOUNDRC will depend on whether we want it to augment, or 
fully replace the configuration.

I did do some experiments some time ago with fully replacing ALSA 
configuration; I find the defaults (eg. "Surround speakers" etc.) to be 
not a good match for my setup. I found it quite difficult to reason about 
the variable-driven design of the default asoundrc files and for me it 
seemed to cause more problems that it was solving. But then I think I 
discovered I could hack it with 'namehint' and moved on.

But in general something which allows policy to be passed to shell profile 
scripts is often not a bad thing.

-- 
Mark
