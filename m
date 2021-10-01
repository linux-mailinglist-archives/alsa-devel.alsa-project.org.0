Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C64341F61D
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 22:03:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8AB316D0;
	Fri,  1 Oct 2021 22:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8AB316D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633118634;
	bh=/5SG7ro55QxYqcml1D2hhiJu+t5F54qi7GZ0R3edcv4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EHknRKlu054RFfx1cpVCH7t5nM1TLM2mFmhsGvq9mia13MCAPZ6KXC1NIYoyjiUsZ
	 /CcX3jm06a6oIfUKqiJ//fvhZ1b9QFS8lc/oGhyAdMCvzu638XYePrDf3IwQa9joRo
	 ytYPKO0EfshQd+SCEGnaDUCLf9QmYM8ze5WsdXXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A9E3F80165;
	Fri,  1 Oct 2021 22:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47F0AF80245; Fri,  1 Oct 2021 22:02:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7339EF800F3
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 22:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7339EF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FB9YhYL0"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 968E361A63;
 Fri,  1 Oct 2021 20:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633118549;
 bh=/5SG7ro55QxYqcml1D2hhiJu+t5F54qi7GZ0R3edcv4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FB9YhYL0T1udI4WLvwisRUqRugmEcSLVDiZ+Ld4DpdpM/B0VQxfSK24a2tQ11b7gy
 Q3PV3m97FkRVxCqX6Q28mwrPbORktWqm764vWzA1T0yxHwrueIt4zIm6b7P1NgJD7l
 YusMPVFL8xMXMkpSbC44lKWHc3jbfMuyg2aUQ4QVVfUadlxn5eqRXNhK/syL21f7J+
 V/UVXKhryutDiYdKhdRUNev3mrHmSerhhFWVMXEpNz2DxO563PLnTmJC1dVVtVhChK
 fRFj+GCV9AQbT8meapgu7CX2JqWmacVHV1LdmBq5hpx4T/nprFeSylLPPoTTb5GgiT
 JXToG8r23jybA==
Date: Fri, 1 Oct 2021 21:01:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3 00/16] ASoC: Add Rich Graph Card support
Message-ID: <20211001200137.GC5080@sirena.org.uk>
References: <87tuitusy4.wl-kuninori.morimoto.gx@renesas.com>
 <b0dfcb22-f805-b751-3c04-ffc435df5f4e@linux.intel.com>
 <87a6jt9r5x.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline
In-Reply-To: <87a6jt9r5x.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: "Pok pok pok, P'kok!"
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
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


--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 01, 2021 at 03:48:26PM +0900, Kuninori Morimoto wrote:

> > The current generation of graph based generic audio card is
> > audio-graph-card

> > This is going to be an (incompatible) evolution, the Next/New
> > Generation. Would it sound better if it is named
> > audio-graph-card-ng / ng-audio-graph-card

> > The 'rich' sound really out of place (if not rich then poor?).

Wealthy, billionaire, oligarch...  :P

> > Next Generation, New Generation, Extended, etc
> > or just drop the graph and
> > generic-audio-card

> To be honest, I don't think this version will be final version of
> Generic audio card driver.
> We will want to have more advanced generic audio card if framework was updated,
> and/or new feature was added, and/or want to use more complex connection,
> etc, etc, etc...

> Thus, my honest opinion is that using v2, v3, ... is easy to understand,
> especially for audio-graph-card. (audio-graph-card2, audio-graph-card3, ...)

I think part of the thing that pushed me towards suggesting a more
descriptive name was that your original posting made it sound like this
wasn't going to replace the existing card for all applications which
looking again isn't really the case and just numbering might be better.
Sorry about the hassle there :/

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFXaSEACgkQJNaLcl1U
h9DsXAf/QSzAYnMKMTtnbHG6Y1K1Q+Yh3M84ad7w0vFpizyiDn4GMNQ3TlyA7AkJ
j0ssp/XLXkO6gSB+4K31MztHIU7VQPMxB02mmA6LrPVqcBTGS3/hJ5Zf+2i1xDTq
58AyQd0mQlJ202dy5IgIEvCqvNYBc8e8DY2UBw+ItKpqK1V0YhVHuzhh08BpB8xi
TGkqy/ymnWMjWRbnV0IkX2VCWMX2jah5qnqPzMwcYdWr9IYIDCn4Osifr6DfrKpy
wtqcX3agbkIBtSNxMugrBBKKa4uxK1aYQ50gt2X/5zNW1ZHr9V0X/fl21BekGCIz
po0FWRd+kk4chfc9AQ9aVMzB8a37Qg==
=xhhD
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--
