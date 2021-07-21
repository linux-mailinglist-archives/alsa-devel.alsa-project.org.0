Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB953D0E2F
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 13:56:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B50C416DC;
	Wed, 21 Jul 2021 13:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B50C416DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626868578;
	bh=baLtFlAJEjIPiYNy/i8p2sM/a2bagW2pCQyLdYEmwbI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ktKqxwMqAerN9zaoZcKZOJXVzLGEfqWnRbm4TSTiamuwOVIsLkk4BFYyFJ8gWJLKs
	 /2wkBdudjAEwr1B7Gc3MIkUF2JwlAjs0uN1Y3mofFMuXG/TMcvvtzJCTQvnBKfReJ9
	 9mdOPiEzJy3xCI5aAL4NC7Ia34EmGnSG06HmXBX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20205F804AD;
	Wed, 21 Jul 2021 13:54:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BA6EF804AC; Wed, 21 Jul 2021 13:54:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94AC1F80143
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 13:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94AC1F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d+GRbb0t"
Received: by mail.kernel.org (Postfix) with ESMTPSA id EEDB160E08;
 Wed, 21 Jul 2021 11:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626868478;
 bh=baLtFlAJEjIPiYNy/i8p2sM/a2bagW2pCQyLdYEmwbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d+GRbb0t02nycmuFooMKU66BHuLCLb4ribUOQr+lyhRrzfVFNHg8K7/kuL6jMwB3e
 d5Hho0Mtt+DKktalG2nLOVK8He92IIO+ci3Yu8Z9mavtep0WUryBKc0DVI4Ck3lmly
 +ReG/mDwkFMi5LC+ab3F4ZHIMcMFEClwNPRho76euxerSyQgCn6h7c9ieAYgOVuUZf
 u3OXdEYUDBURSTnZw/71x4wtmQRBh8VTOY8HB5/WdesGheu1K2ti1wVEm+duhU7nVj
 EshXBdoD4gW7EHtIgcA+C+nVnk/2wMbWQcnt6YzePSfsE3gT5Cuq6FiI1vsjMtwaMx
 iXw9Rp3M8Ofbg==
Date: Wed, 21 Jul 2021 12:54:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 09/14] ASoC: audio-graph-card2: add Yaml Document
Message-ID: <20210721115433.GB4259@sirena.org.uk>
References: <87a6mhwyqn.wl-kuninori.morimoto.gx@renesas.com>
 <87wnplvk2a.wl-kuninori.morimoto.gx@renesas.com>
 <CAL_JsqJKZ-sjbnihAkdXDk4tW8xVmyhwkHLHWouZg6da0cc99g@mail.gmail.com>
 <87lf60v9xk.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Content-Disposition: inline
In-Reply-To: <87lf60v9xk.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Many pages make a thick book.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 devicetree@vger.kernel.org
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


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 21, 2021 at 08:32:07AM +0900, Kuninori Morimoto wrote:

> > Why do we need these changes? I'm not wild about a new generic binding
> > replacing an existing one which only has 2 or 3 users IIRC. Plus
> > there's already the Renesas variant. (On the flip side, only a few
> > users, easier to deprecate the old binding.)

> Sorry I don't understand
> 	- Who is "2 or 3 users" ?

Just that there's not that many users of the existing audio-graph-card
(though it's a bit more than 2 or 3 and it's newer stuff rather than
old).

> 	- What is "Renesas variant" ?

I think that's the rsrc-card though that got removed.  There's also the
Tegra audio graph card though.

> audio-graph-card2 is based on audio-graph-card,
> but different driver not minor variant.
> Becase these are different, it can't keep compatibility.
> This is the reason why we need audio-graph-card2 instead of expanding
> audio-graph-card.

I think what Rob is looking for here is a more detailed description of
what the problems are with the existing binding that require a new
binding - what's driving these big changes?  TBH this is part of why
I've been holding off on review, I need to get my head round why we
can't fix the existing binding in place.

> > I also would like to see the graph card replace the simple card
> > binding. Surely it can handle the 'simple' case too.

> Do you mean you want to merge audio-graph-card and simple-card DT binding ??
> audio-graph-card and simple-card are different drivers.

It's more about making sure that new users that currently use
simple-card are using audio-graph-card instead - we need to keep
simple-card around for existing users (or at least the binding but
probably it's more effort than it's worth to merge the binding parsing
code elsewhere) but we should be avoiding adding new users of it.  I've
been pushing people to use audio-graph-card for a while, TBH we should
probably just go ahead and flag simple-card as deprecated in the binding
now since I don't think there's any reason anyone is forced to use it at
this point.

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD4CvgACgkQJNaLcl1U
h9CUugf+OgqBJP57PKzCBUfTJszQ4Wy+rLHO2QvYlJP9P1skokZ42H/MLODKVeBF
C1eQJcxxIw6Ygh2gkd5sY5NcLgw1RSRzgG58bB2doFdrEjgiTE0WfjcpIvKa+9RL
ThPtldYruMmIei4On/RQMLcfnVR1dXo1uvHAtimoctDBzleTYiTFJluhfg1wJ9dW
xRmwc2G0LGv00KdArl4dA5ZJpGbmozj+sUz4hUX5IJ4Y1RDJNfFn9wk9rZtcCGPu
OwEqUks7VSU2uVHHYOumy6cRxHkjosbVseLwmF4FFJNJjxpP8UJqp6JY0w+3RlFU
wZVAu0UrVO3sXv59QT6FeMY79D1yCA==
=RubF
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
