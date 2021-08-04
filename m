Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 373DB3E06A4
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Aug 2021 19:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC99168F;
	Wed,  4 Aug 2021 19:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC99168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628097581;
	bh=w3g9di0uKCNKpTWayQSuOwVPF2uQr+amMkwbgQIc6l4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DTnIkiA1tTO/0jY9zvUWy4+fjE4Zo7ApRzQpCjgoCBIrYGfffKeOR4sAIMVBVDe9O
	 SYepRHW12S0TVIkDmvk3eldrjx4UQsFczkxV6V6QKz9RJPpoNy+1oJisDEawmW3viG
	 XrQECjiV6NuRAY3ylI5I/1MuAib9pI8DfDR5pSdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6621F80268;
	Wed,  4 Aug 2021 19:18:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4346AF8025F; Wed,  4 Aug 2021 19:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8833AF8014D
 for <alsa-devel@alsa-project.org>; Wed,  4 Aug 2021 19:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8833AF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sZvRW6P7"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD1EE60E53;
 Wed,  4 Aug 2021 17:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628097483;
 bh=w3g9di0uKCNKpTWayQSuOwVPF2uQr+amMkwbgQIc6l4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sZvRW6P73sLwIr/QqduEUX6My7MvMaCnaujgDDI34903hG7ZDuM705zw8XDnminx8
 tmKFm0G/gqjSj40GgFpVebxab0CETgGjZ0V8zW6KYB3aAm0r2CLsy3xaqG+GN/3q6f
 +sCZFl+RaybxPIbAHa+l1T3Zo3Ti6WNJsCsJ5F/4TOWQ9XTDMSolghGxJHuEppPPnh
 lqVe7VQn+XjBI2j7RH/Ho//hlqS/+RZl5Ftk6GuIDQMaHi3gkXovW4XZbmv8BMqAkP
 iuTRVM7dekYceq5dEzOEJCRwmxt6uNObB6fOW5qAqPmdPFOLqIxRYkYBVgtSoBndeI
 f5jurxp+2GNZw==
Date: Wed, 4 Aug 2021 18:17:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 09/14] ASoC: audio-graph-card2: add Yaml Document
Message-ID: <20210804171748.GC26252@sirena.org.uk>
References: <87a6mhwyqn.wl-kuninori.morimoto.gx@renesas.com>
 <87wnplvk2a.wl-kuninori.morimoto.gx@renesas.com>
 <CAL_JsqJKZ-sjbnihAkdXDk4tW8xVmyhwkHLHWouZg6da0cc99g@mail.gmail.com>
 <87lf60v9xk.wl-kuninori.morimoto.gx@renesas.com>
 <20210721115433.GB4259@sirena.org.uk>
 <87fsw124wn.wl-kuninori.morimoto.gx@renesas.com>
 <20210803165328.GO4668@sirena.org.uk>
 <87mtpyuj8c.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline
In-Reply-To: <87mtpyuj8c.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: MOUNT TAPE U1439 ON B3, NO RING
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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


--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 04, 2021 at 09:49:39AM +0900, Kuninori Morimoto wrote:

> OK, it is nice idea for me, "descriptive" is difficult,
> but for example...

> 	- audio-link-card
> 	- multi-graph-card
> 	- link-graph-card
> 	- audio-mf-graph-card (mf = multi functional)

The -mf- there reads unfortunately differently in English so we
definitely don't want to go with that one I think.  I do agree that it's
hard to come up with a name, possibly rich-link-graph-card or something?
Actually, looking at the bindings documents I'm not 100% clear what the
differences in the binding (as opposed to the code that parses it) are -
this may just be the examples being too cut down to show them.  I'm not
100% clear why we have the three different compatibles in there, that
feels like something that should just be in the graph description,
especially codec2codec since we might have for example both a DSP and a
codec2codec link in the same card.

> Other one is that new card is assuming that using auto format
> (= using .get_fmt on each driver), but we can use "format" property for it
> and possible to overwrite.
> So, I noticed that keeping Normal connection compatibility on new card
> is not super difficult, and "un-recommended" is very small (In my quick check).

> Ahh, new card is not supporting "platform" so far (it is supported on audio-graph-card),
> and maybe other options/property which I'm not using too.
> But it is not a big problem I think, we can add these later.

Yes, these both feel like things we can do on both cards.

> I want to tell here is that, we can add new card (by new name), and
> I think we can keep audio-graph-card's *normal* compatibility on it, (not DPCM).
> Of cource we can keep existing audio-graph-card, but easy to switch to new card (?).

> I'm not sure it is OK for DT maintainer.

Well, I think the big issue from a DT point of view is needing to add a
new generic card at all - there's much less problem with keeping the old
ones around than there is with keeping on adding new generic cards.

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEKy7sACgkQJNaLcl1U
h9BT9Qf8DITWZIzEHfgWEnrEVm1ZIyqSZ/invl4qaXH6bCcdfMn4YdCoyxZEcsv0
epUsUCI5Rfr9/qOjYqZn9LmsjEG+yJ5Ha7+mgWNryQhaU60tLu1/OwGCEEuYnhAw
7uXZMNXwN/ksULuDb6GAQaprstBlFu4/aDW7CEGBRssUCHNSeVpIwu/ntBfRG/Mz
pT1eocCeb0WFZTl3GL9j7HbaTw1aGslRSBbtu1fB9hEJFzH6/rfstkJt1tGrWeUa
AwEZWDqA/OUOOiz7KBUlu1aFStkI8pAZyqAqtuyaSUg0+HS/GjYYBoapjlFgThyT
96gpUuY6ViNqyPxOdoHZTJZ3PvpygQ==
=qK5/
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
