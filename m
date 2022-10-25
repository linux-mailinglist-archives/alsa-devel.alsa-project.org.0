Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9888660CA8E
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Oct 2022 13:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F8294E86;
	Tue, 25 Oct 2022 13:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F8294E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666695875;
	bh=fdcC4mR4dB/QFx3WrYK6jDAfOS5Cp8jhgwy0xEun364=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uOjXBDK3ppJr2kCFaFVuJe9E8j+EOTVOHSnWJ20GHkoD4T2DGfXVJwugguE4wSn34
	 kf4sqKa+dtL0+rkAAOw44DGew0o4zJpFhuwCJ2xPCrOylt84SqBF3ncEpMkpGv09o8
	 Govuv5qo2pDjgLA40DrC4SwIBLHtDhdOQ0oEPdCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99C93F80448;
	Tue, 25 Oct 2022 13:03:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 031C6F80431; Tue, 25 Oct 2022 13:03:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_155,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0389F80115
 for <alsa-devel@alsa-project.org>; Tue, 25 Oct 2022 13:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0389F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nKazl75o"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A39E3CE1D14;
 Tue, 25 Oct 2022 11:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B6AC433D6;
 Tue, 25 Oct 2022 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666695811;
 bh=fdcC4mR4dB/QFx3WrYK6jDAfOS5Cp8jhgwy0xEun364=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nKazl75omI35NaM4AI2u4k7W5QiR9pAJRt1uiREc6D9JOG0NtBkXFx60eYJJ3s3vx
 z8Fi1DuCZYyslE9JG9lszhv1LRjqS88Wv5q8jdxMol+kMjqm9DBQzbstW/JDWonxHu
 ILgo+cQHum2iXzIJGrjlVB2Z5z7d9N7qGhN7QE/d8Hdw2+vpPgzeZtHJq8fFau9GXz
 vMTpeyGLs7FgaKTv5+O1tJI5CGYXlCQaT6vhfeSFdB2+QQyx8o/TH3HvX9rFDXxR1U
 WCGDJP5c2y3Qt9P4q8qZerE+VNeu3NFJkfyKs04C5lOBVLDNl7fieU4Jk1EsupmK/G
 tguviyOcG63DQ==
Date: Tue, 25 Oct 2022 12:03:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: simple-card: Support custom DAI system
 clock IDs
Message-ID: <Y1fCfej+/WH8TI39@sirena.org.uk>
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <Y1Z74/vKHbnaCLrX@sirena.org.uk>
 <XaoRSEMyUlabAR8wEJITmm2lGCjwfPZg@localhost>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iUFfooZ1kpfKCAGd"
Content-Disposition: inline
In-Reply-To: <XaoRSEMyUlabAR8wEJITmm2lGCjwfPZg@localhost>
X-Cookie: Your step will soil many countries.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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


--iUFfooZ1kpfKCAGd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 25, 2022 at 12:17:25AM +0100, Aidan MacDonald wrote:
> Mark Brown <broonie@kernel.org> writes:

> > We already have clock bindings, if we need to configure clocks we should
> > be using those to configure there.

> The existing clock bindings are only useful for setting rates, and
> .set_sysclk() does more than that. See my reply to Krzysztof if you
> want an explanation, check nau8821 or tas2552 codecs for an example
> of the kind of thing I'm talking about.

I thought there was stuff for muxes, but in any case if you are adding a
new binding here you could just as well add one to the clock bindings.

> I picked those codecs at random, but they are fairly representative:
> often a codec will allow the system clock to be derived from another
> I2S clock (eg. BCLK), or provided directly, or maybe generated from an
> internal PLL. In cases like that you need to configure the codec with
> .set_sysclk() to select the right input. Many card drivers need to do
> this, it's just as important as .set_fmt() or .hw_params().

There is a strong case for saying that all the clocking in CODECs might
fit into the clock API, especially given the whole DT thing.

--iUFfooZ1kpfKCAGd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNXwnwACgkQJNaLcl1U
h9DI6Af8Cuqiya/+8/lme/cDu+8TN8e8NuItmTYE0zwwWFnj4moKAKOKjnbxCrq3
H8QZEZheZKL8XP4bCWHLQufnlxwzDApe7++u7t8EtX9EL8mV+cUmtSaOt+fkhBBf
4lv32bLyPe5OX2a/mr7+ZlFWU3Zx3Y4/ZoYNsQnuQvfNtaM057yFyLdkYi2kMhUn
MfUL8GEQS6Nu8+IqNxlRlgtE3wFr31DByy/pe74Ly+dbj85UMltrMgke/bMcsXPB
GtTGf22OV2ZuaOWiW0PgGg7wLoqFzgK1Fg04aF5EMHtoF3eiLzIPxOJH+4tZJEkf
Q8lfomo8CA2QoBibB2zP3gBeIFjDig==
=+vuf
-----END PGP SIGNATURE-----

--iUFfooZ1kpfKCAGd--
