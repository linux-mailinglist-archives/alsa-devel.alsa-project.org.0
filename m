Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB53EBCAE
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 21:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 903C0183B;
	Fri, 13 Aug 2021 21:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 903C0183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628883923;
	bh=BQM7OXN/2UL+STIrqUiInZGjpsx6qajPpHnXFh5ZTJQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZPOjU12l3jG1w9XgKjHQU6ZctKyshGp9fdTYl6vs0RTlz/ixecx8FQMrtsvtfWnre
	 AgS3f3uX1AQoDKSAmgrHBuq0JbU1YDblRVKwkitWIc5VaocA13eh2g4FWLtxvMtpyG
	 sHom4FoV6eDM08loJi5G/1Zf9g0dhlQV54OHaoIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D921CF8032D;
	Fri, 13 Aug 2021 21:43:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2F4EF802D2; Fri, 13 Aug 2021 21:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D62CFF800AF
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 21:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D62CFF800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AFjkrEjN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9311460F21;
 Fri, 13 Aug 2021 19:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628883826;
 bh=BQM7OXN/2UL+STIrqUiInZGjpsx6qajPpHnXFh5ZTJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AFjkrEjN/Ek96kVEfmIg53xDYLM5DoadxtgsKiEQzHbGfodVWRR9SzMx1N3uTm7mF
 /T/ilnvnSgKyPpmbe2gXU3I8VqaFhiegp72ZjinQKRyW4vK9RrhYLMcEp88OAxh1CE
 yZvTQzLfZZtjMblxOfPLtoqMieSaktfpIOTay0vYpIJW5VLEjln3z04ldfKYEaw8xQ
 PK+iNHIorc8YDi4BowAOezrZzuBRnzhPm/wmwUUPVqzFhB6qswwCc4eA/towP++/wE
 GCcTOQ9cfPzesjVIuUG7xwtwputQ6cf1EN4BKuRGKjhWuTd5Um5qie3BKmrzbXWIxi
 fY5FgHB81Ed5g==
Date: Fri, 13 Aug 2021 20:43:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 09/14] ASoC: audio-graph-card2: add Yaml Document
Message-ID: <20210813194325.GH5209@sirena.org.uk>
References: <87a6mhwyqn.wl-kuninori.morimoto.gx@renesas.com>
 <87wnplvk2a.wl-kuninori.morimoto.gx@renesas.com>
 <CAL_JsqJKZ-sjbnihAkdXDk4tW8xVmyhwkHLHWouZg6da0cc99g@mail.gmail.com>
 <87lf60v9xk.wl-kuninori.morimoto.gx@renesas.com>
 <20210721115433.GB4259@sirena.org.uk>
 <87fsw124wn.wl-kuninori.morimoto.gx@renesas.com>
 <20210803165328.GO4668@sirena.org.uk>
 <87mtpyuj8c.wl-kuninori.morimoto.gx@renesas.com>
 <20210804171748.GC26252@sirena.org.uk>
 <875ywkvkkd.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nFBW6CQlri5Qm8JQ"
Content-Disposition: inline
In-Reply-To: <875ywkvkkd.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: E Pluribus Unix
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


--nFBW6CQlri5Qm8JQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 05, 2021 at 08:47:46AM +0900, Kuninori Morimoto wrote:

> > The -mf- there reads unfortunately differently in English so we
> > definitely don't want to go with that one I think.  I do agree that it's
> > hard to come up with a name, possibly rich-link-graph-card or something?

> Thanks. It is a little bit long name, so,
> rich-graph-card, or rich-link-card is nice for me.

Yeah, let's go with that for now.

>=20
> > Actually, looking at the bindings documents I'm not 100% clear what the
> > differences in the binding (as opposed to the code that parses it) are -
> > this may just be the examples being too cut down to show them.  I'm not
> > 100% clear why we have the three different compatibles in there, that
> > feels like something that should just be in the graph description,

> Ohhhh, yes, indeed. I didn't notice about that !
> If my understanding was correct, it can be something like ...

> 	card {
> 		compatible =3D "rich-graph-card";
> 		...
> 		links =3D ...
> 	=09
> 		mix {
> 			...
> 		}
> 		multi {
> 			...
> 		}
> 		codec2codec {
> 			...
> 		}
> 	}
>=20
> Hmm, nice idea.

Can we merge some of these types - for example what happens if we get a
CODEC to CODEC link with TDM (eg, a DSP with a link to two mono speakers).
I think we should at least be able to merge TDM with anything else, I
guess we could have all three if we had a DPCM SoC with two CODECs on a
single link though that feels a bit pathological.

> > especially codec2codec since we might have for example both a DSP and a
> > codec2codec link in the same card.

> It is possible in my understanding, but am I misunderstanding ?

> ... is it naming issue ?
> In my understanding, both "DSP" and "MIXer" are using "DPCM" connection,
> but driver/sample is calling it as "DSP".
> I think "MIXer" and "Codec2Codec" in same card is possible.
> I'm not sure about "DSP" case...

I think you're understanding it right - I'm using DSP to mean a SoC
needing DPCM because of the DSP here, sorry that wasn't the clearest way
to describe things.

--nFBW6CQlri5Qm8JQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEWy1wACgkQJNaLcl1U
h9B7UQf/ep+WMpE7AspjbAKovrm5JNw41JSzFQntHBgji5Qqea+1X5v9AeXhGtdi
rjTdaTNWIID288gR5QROi6cEWJE4vi2+ZgBk4/zr16GjUGOSQXnKWS8wbUujUwrS
SMt+2YhewfknIZ2ppryIt1h1x74bi5tRuVsl1xS0fxiwpXFO6x6WnLWvz9wWiMUi
VaQ/bbPfydn9nBX16GOTvX+0LAgDrUccurTRLGhWfoATrPgtdww+uTKfb0rACH/9
eO172ncTNOrhX8FJ0LX9xTgglsDHKMPJW8r3b1I6Bd/fEEsb7CORymtijNJp1S8e
q8nvfVW3Xq+r4+S/HjcaZvXfur7mMA==
=xZPG
-----END PGP SIGNATURE-----

--nFBW6CQlri5Qm8JQ--
