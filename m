Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988D3C5ED3
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 17:05:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6BFC169F;
	Mon, 12 Jul 2021 17:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6BFC169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626102353;
	bh=rluwW6y8nVcOb3m+0LUyNE4F6mvAXFue6/Y51oqSnMc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E35Cb7QPVFV4JMZMRGiQgmccqGbJ0gtGxu0qcfkiEktLZ6TE226vR4zSQoVV2fC75
	 kb8406GBsL9VKUMqwZIinTUlzgG4C+I4Nd953YM/sc/oEf0cQlXFQ6RCmKxURaf7jb
	 ITLBOwLVstvEGRctnJBYKnrqIQGHLyDzIlKPoPvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B2A6F80253;
	Mon, 12 Jul 2021 17:04:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 270D1F800EB; Mon, 12 Jul 2021 17:04:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BC6EF80083
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 17:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BC6EF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Aw75TgH1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CBD2611CC;
 Mon, 12 Jul 2021 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626102257;
 bh=rluwW6y8nVcOb3m+0LUyNE4F6mvAXFue6/Y51oqSnMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Aw75TgH1AegpEkKY53N/iVUdwiEfgp58DilBSbdlXjdGLQCmQRAekTf31k9r11HLU
 atU+mG9zBI7G4gYYteGoHnd4IxviCb2w9Se2aws9uxqmj/JWJm0vQks/HbmOURQ2C8
 9xdl0AtCgDdkUywGGzPUqIZoaulRIjPbdq9edn2rGxoGgnRmhx9PQ3Sh+dUs9sd2wH
 yIWgud8w0OMn4AY2tGI2FaSJZKDSd0dG82JTCOSi3O24AlNVsNNcgrvEfSXRGXwUBC
 h9dbUKiGeiyWjkrrbopcdWXxwAocpXEUxxAFb54ch53lfYWFEChCM6M818kgj6FFXA
 2/78BUuXzwoTw==
Date: Mon, 12 Jul 2021 16:03:41 +0100
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210712150341.GF4435@sirena.org.uk>
References: <20210702205127.1400539-1-drhodes@opensource.cirrus.com>
 <20210702205127.1400539-2-drhodes@opensource.cirrus.com>
 <20210705192054.GG4574@sirena.org.uk>
 <b9627394-4d71-cafa-0944-14dad137ffdd@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="SnV5plBeK2Ge1I9g"
Content-Disposition: inline
In-Reply-To: <b9627394-4d71-cafa-0944-14dad137ffdd@opensource.cirrus.com>
X-Cookie: Hailing frequencies open, Captain.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com
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


--SnV5plBeK2Ge1I9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 09, 2021 at 06:11:28PM -0500, David Rhodes wrote:
> On 7/5/21 2:20 PM, Mark Brown wrote:

> > > +	case SND_SOC_DAPM_POST_PMD:
> > > +		regmap_read(cs35l41->regmap, CS35L41_PWR_CTRL1, &val);
> > > +		if (val & CS35L41_GLOBAL_EN_MASK) {
> > > +			regmap_update_bits(cs35l41->regmap, CS35L41_PWR_CTRL1,
> > > +					CS35L41_GLOBAL_EN_MASK, 0);

> > I can't see any references to GLOBAL_EN outside this function, why might
> > it not be set?

> This check prevents an incorrect 'PDN Failed' message if DAPM initializes
> and turns the widget off at boot (with no prior power-up).

In what way does it prevent this message and why is this a good approach
to the issue?

--SnV5plBeK2Ge1I9g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDsWcwACgkQJNaLcl1U
h9Bqbwf8ChpbNX3xhN+1UYIYz4EUtQOPDYMHOQ6hiQXU+9YFaTCh8hFdm93sKIi/
jqpljRFCpilwxR7NMxuUtg/5REWzJ66esaO96thEQ1RRZ6hYXjj3oTPoO01h7LKL
giL3zBxkOsii+z54WMnAF7px+PgCgfTCqz0euvnmw1N4L9ZBXQA9gc+gIRGcyrZz
a5lu5pM++lAT8kmLir1GpbibvhM4Iri/wN9YMaQstGW7dPUTwz5cL0NWQkOhraH3
/pNVAw2Dzh9jSUAZnBiV0isndc0E/OGyoXfdKiz3WXJ1nwaPwY5vSBeNeTOTyTOh
9oJLK6j3PedewvcOseccyr8+6wbhVQ==
=vh/D
-----END PGP SIGNATURE-----

--SnV5plBeK2Ge1I9g--
