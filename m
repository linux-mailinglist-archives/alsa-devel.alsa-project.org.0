Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B95B7983FD
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 10:26:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D987C84B;
	Fri,  8 Sep 2023 10:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D987C84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694161616;
	bh=9V/0jHw0oKw+I7V/6rNfKLEpa79QEvUh0Mprx7QMCvQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FA1UNS9kqlTaU463INueGd2AcTovIRIM7BIDTUe6tjDDyQXimxbC2oeiGCkWM0cKR
	 ixyYvnKmV+RHJaac2f5JrS817Y59OOo5N7TVHTLEXwMazaXRUoGWWjFGrlFzNd37Nz
	 ibaSFScWQY32gvcNwFXxTZha2SIhbif417/5Erl8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5DD9F80549; Fri,  8 Sep 2023 10:25:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67B4AF8047D;
	Fri,  8 Sep 2023 10:25:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78B63F80494; Fri,  8 Sep 2023 10:25:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75CD2F800F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 10:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75CD2F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256
 header.s=dc header.b=LeTIGAwi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gY8pEmTJXtv0dZXhERhTMp3aYH17SPJkChNTv4UmRQ4=;
  b=LeTIGAwi1VAW5MN0IgTVK3AyllpkDb36k0TRwKVJ6qHjrjArO6FDgV9A
   MFl+q1+Ws1s+6mm6ROcsvuiwuemuiOmF38jkJb2DTjcNefFmP4rtxDwie
   OMtO/c2KywOJoPQDtl2lHkfNjjE0+w93pAe/0UiMmgPpWpbg+YrTItHfL
   g=;
Authentication-Results: mail3-relais-sop.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.02,236,1688421600";
   d="scan'208";a="65421870"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 10:25:35 +0200
Date: Fri, 8 Sep 2023 10:25:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
cc: Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org,
    Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
    Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] ASoC: rsnd: add missing of_node_put
In-Reply-To: <874jk55heh.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <6348f825-645b-14ed-31e-7ef7f607a29@inria.fr>
References: <20230907095521.14053-1-Julia.Lawall@inria.fr>
 <20230907095521.14053-11-Julia.Lawall@inria.fr>
 <874jk55heh.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: OILYCOL6FS2WGATKJJQIBJCPJKYNEUPM
X-Message-ID-Hash: OILYCOL6FS2WGATKJJQIBJCPJKYNEUPM
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OILYCOL6FS2WGATKJJQIBJCPJKYNEUPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On Fri, 8 Sep 2023, Kuninori Morimoto wrote:

>
> Hi Julia
>
> Thank you for the patch
>
> > for_each_child_of_node performs an of_node_get on each
> > iteration, so a break out of the loop requires an
> > of_node_put.
> >
> > This was done using the Coccinelle semantic patch
> > iterators/for_each_child.cocci
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> >
> > ---
> >  sound/soc/sh/rcar/core.c |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff -u -p a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
> > --- a/sound/soc/sh/rcar/core.c
> > +++ b/sound/soc/sh/rcar/core.c
> > @@ -1303,6 +1303,7 @@ audio_graph:
> >  		if (i >= RSND_MAX_COMPONENT) {
> >  			dev_info(dev, "reach to max component\n");
> >  			of_node_put(node);
> > +			of_node_put(ports);
> >  			break;
> >  		}
> >  	}
>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> I noticed that existing "of_node_put(node)" itself is not needed.
> We can remove it, and I will post the patch next week.

Oops, indeed the better way to make the change would have been to convert
node to ports.  It's just a copy paste error with respect to the code
above the audio_graph label.  Do you want me to send this change instead?

julia

>
>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto
>
