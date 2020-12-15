Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7602DAD9F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 14:02:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B48E117D5;
	Tue, 15 Dec 2020 14:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B48E117D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608037336;
	bh=fDiP7ilApLHaKkbPhxkJs3BwaJy+ICOzNNwrseuWDDQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TxY6eH6JCSDjnsD3k/0UojBavY8+kRooF5EVpceJtZEjTl8SUur8OmCUOPXHBERWW
	 I+zDluhzBn9m09lH24TtrUWuiIBRNXnKYrIVEQYa2/3K7h2rhhDJmjYZLQ6lIsLuFZ
	 gqXsmjzBsJ/tB104IcMES6cS/4ahxfy0FHX8//A0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1785DF8027B;
	Tue, 15 Dec 2020 14:00:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35ABFF80278; Tue, 15 Dec 2020 14:00:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE17DF8014B
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 14:00:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE17DF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="igylZFgu"
Date: Tue, 15 Dec 2020 13:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608037233;
 bh=fDiP7ilApLHaKkbPhxkJs3BwaJy+ICOzNNwrseuWDDQ=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=igylZFgutp+6ZB0uy7rkm5KPCGAKGCZ3mZ7wmryn8yElieFXFV6sfnel/Cz2/SXqb
 wVQLyLa5IxVG5Y1PuFhaH9N543ogMHakK69qg9PQ+PeykMYouz5iCpi+gD/w/Fk1Po
 IKjH40Ne5hYN0an/elbKmglXRdAddDvi4CYsJM8cLnOoZg56Ap0HTe0oHa55pGFYvu
 sKwEMVM52gRNnoc8m85BwOiTpJnxYjPrc8Fd0LBqAq0k609+tCZSJsVb44grJZeO4u
 gjiE2QIjDnaU2K2pjlAfuu1w3/3WeA5tp665NLBMS8DDdrypBh3+CLDLCjTSUpA8xh
 niVQhMC+fXB/g==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH][RFC] ASoC: rsnd: don't call clk_disable_unprepare() if
 can't use
Message-ID: <20201215130021.GC4738@sirena.org.uk>
References: <CAMuHMdWvB+p=2JqTsO7bR8uJqKqO5A2XgXFXsVAjHk3hcxgcTw@mail.gmail.com>
 <87v9d4gcqt.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="V88s5gaDVPzZ0KCq"
Content-Disposition: inline
In-Reply-To: <87v9d4gcqt.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: In specially marked packages only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
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


--V88s5gaDVPzZ0KCq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 15, 2020 at 09:06:05AM +0900, Kuninori Morimoto wrote:

> -			adg->clk_rate[i] = clk_get_rate(adg->clk[i]);
> +			if (ret < 0)
> +				dev_warn(dev, "can't use clk %d\n", i);
> +			else
> +				adg->clk_rate[i] = clk_get_rate(adg->clk[i]);

We never reset adg->clk_rate[i] so if we use the clock once then get an
error attempting to use it again...

>  		} else {
> -			clk_disable_unprepare(clk);
> +			if (adg->clk_rate[i])
> +				clk_disable_unprepare(clk);

...we'll try to disable twice.  This was already an issue of course, not
something introduced in this patch.

--V88s5gaDVPzZ0KCq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/Ys2QACgkQJNaLcl1U
h9DL3gf+LbNAoq+ie6MXE724oAYdw14gdhZfxkEnqHxElgGxZvKK4DzEZl6tGfvw
pfaEOw057v0Jd+6M7/EgbVW+FEMMHkyrb9HJrsAaQJyBnKE8KreAqVCcsHuCIqGA
z5qEphd6k9vzNByer4Rs+Lo8AAnNSLvEgKDfPjAVyJNOTJjR+C6JbCf/LrXU5u+s
tuar+WbDmCTjX5mRPOqE2jyWt85IL5TFNnEegN80uYwXgpdBoIq25oFOgbzqP9Pg
rW/6/xhRsUQ+WeyBfZrNCxpg0kgQt69OmqfG8uVniwUF0W2BAiYlG8jq46n6CAIB
bzkkTuu/1Sh9yjRVkt9OIcQCjYvt6w==
=B+vF
-----END PGP SIGNATURE-----

--V88s5gaDVPzZ0KCq--
