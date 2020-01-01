Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D38512E049
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jan 2020 20:25:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B796D16CF;
	Wed,  1 Jan 2020 20:24:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B796D16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577906712;
	bh=2D9eSOK83RZFvONTswx9G5+I3J4Sbkm4sWzapFS2K1c=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g79TsWgsb8LYzUb/TTrVfC4IBznyfrcf904psMtXnT46A8rL1AvwVYPGxnsY5ty2F
	 Oy42nogjtTpyRxqpCcdO/7vUKovLkOaVMIorFpnb4uJhLtmdrhka7qHqZRGQNcrz+D
	 DRLCDCkUhEtC4+2lOwNRj43NFLhFTrf5xeHQDzBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0BB2F8015C;
	Wed,  1 Jan 2020 20:23:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB3C4F8015D; Wed,  1 Jan 2020 20:23:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE1A3F8011E
 for <alsa-devel@alsa-project.org>; Wed,  1 Jan 2020 20:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE1A3F8011E
X-IronPort-AV: E=Sophos;i="5.69,384,1571695200"; d="scan'208";a="334543739"
Received: from abo-154-110-68.mrs.modulonet.fr (HELO hadrien) ([85.68.110.154])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jan 2020 20:23:24 +0100
Date: Wed, 1 Jan 2020 20:23:24 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5hmub72dh3.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.2001012022380.3262@hadrien>
References: <1577900990-8588-1-git-send-email-Julia.Lawall@inria.fr>
 <1577900990-8588-3-git-send-email-Julia.Lawall@inria.fr>
 <s5hmub72dh3.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH 02/10] ALSA: ml403-ac97cr: use resource_size
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

On Wed, 1 Jan 2020, Takashi Iwai wrote:

> On Wed, 01 Jan 2020 18:49:42 +0100,
> Julia Lawall wrote:
> >
> > Use resource_size rather than a verbose computation on
> > the end and start fields.
> >
> > The semantic patch that makes this change is as follows:
> > (http://coccinelle.lip6.fr/)
> >
> > <smpl>
> > @@ struct resource *ptr; @@
> > - ((ptr->end) - (ptr->start) + 1)
> > + resource_size(ptr)
> > </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> Unfortunately this doesn't apply cleanly on my tree.  I guess you
> worked on linux-next which contains a change outside the sound git
> tree that converts ioremap_nocache() to ioremap().
>
> We may apply it in sound git tree and let conflicts resolved at the
> merge time.  OTOH, it's no urgent fix at all and can be postponed
> after 5.6-rc1 merge, too -- then everything can be applied in a
> cleaner way.
>
> Let me know your preference.

It's from linux-next.  No hurry.  Postponing it is fine.

thanks,
julia
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
