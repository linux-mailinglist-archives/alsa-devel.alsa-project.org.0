Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 470443B66E2
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 18:38:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7016167D;
	Mon, 28 Jun 2021 18:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7016167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624898279;
	bh=fM2UYPrxJnpjJzQAfwhDN/Dv4U8bjUg8ETAvFWC4mxw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xw1CNJjrcMD/COJqI7hd/L1T/qMwOryuZ6ApypTDK9caYfI2chpxUeaRBt6ZLquFA
	 Cp4ey8esKTjw2VL2qiF2JDGaeFH1vZulvHiPazbEihBug+GSZDiZ9ngAkhw9nLemkW
	 omP/qkyDp41mMnUt7ScGjGzaJkvvpkV4dHuCCpAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 271A8F80257;
	Mon, 28 Jun 2021 18:36:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACB12F80217; Mon, 28 Jun 2021 18:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9856BF8012A
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 18:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9856BF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UuaXR6cX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28BCE6144F;
 Mon, 28 Jun 2021 16:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624898181;
 bh=fM2UYPrxJnpjJzQAfwhDN/Dv4U8bjUg8ETAvFWC4mxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UuaXR6cXmyMxOTx7grxZ24uIGOf6jgvD8ysUu96av3wk89rlbRPaKiJDI0cmE0QAb
 pM4YS+ZLr/+CDUl5W0J5EF8o6tRDijdh+prAwYToHd5bu5EH0ixh9Tbo0wmXl/OgF3
 oHg4IJ/gq+2ikxlLPqb3xh+q643IGLcP+CmgFMiz5lrnOgSKRIwYmN/3l2e4jBcRT8
 llt+fsOjc3rDiM10+ds3IWilKARbJlkBrYW804L9Q46nzfcSYxdl4hYDoMln95i4DD
 ZUsSkZUsKS1Ex1jFK6nNPGGWbOFBcT3rNxb1qQNzaLTo4uGamDys6hG2cweh4FifRu
 d57SPXviKUlDA==
Date: Mon, 28 Jun 2021 17:35:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: atmel: ATMEL drivers depend on HAS_DMA
Message-ID: <20210628163553.GD4492@sirena.org.uk>
References: <20210530204851.3372-1-rdunlap@infradead.org>
 <9ba0da3b-dbdb-c91d-2def-f3dcd30cbde3@infradead.org>
 <20210628130214.GB4492@sirena.org.uk>
 <6734cd67-ae14-74f4-a78e-b6a810c1cdec@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Content-Disposition: inline
In-Reply-To: <6734cd67-ae14-74f4-a78e-b6a810c1cdec@infradead.org>
X-Cookie: Someone is speaking well of you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Bo Shen <voice.shen@atmel.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 28, 2021 at 09:03:25AM -0700, Randy Dunlap wrote:
> On 6/28/21 6:02 AM, Mark Brown wrote:

> > Please don't send content free pings and please allow a reasonable time
> > for review.  People get busy, go on holiday, attend conferences and so=
=20

> a. The entire email/patch was there. Should I put the ping _after_ the pa=
tch?
> Would that help?

Never send content free pings of any kind.  There's an "and" there.
Quoted patches can't be applied.

> b. What do you consider a reasonable time?  The patch was sent 28 days
> prior to this gentle ping.

As the mail you are replying to suggests this depends on the patch, some
things are more urgent than others, and in any case like I say content
free pings no matter how content free are just nose.

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDZ+mkACgkQJNaLcl1U
h9DblggAhwS5IQqddFnWasPd9h6yF5OEbnQV1e2IYp81mj/NjDG7RNdMlWkXl7B7
2Cap8Kax2DtjMNHdykf0pbs4jJzgYxMcuuobtGXFWpTs6+gPm9LcP8R7DYg7c+ok
b54DvQ085VHJc2yYMGn6HFq5vBKTJMav4SxMRUjfBzvb9wIqXnn9JQQVRAa8XluV
qFJ7+R4VbHILOaRWZqkeVtMGrxlbjQhegTDBmKZhESVSWffUL+I0J1TCrEgQXllq
qVrtMGoDVMb7606DbkkKJ8IK8RtWmlwJjXDVnDkZIqphiZ4KVa32CsMK2dXMDz5e
AF7qY99WHxYObQaNO9pfnoBaKNVItg==
=X13a
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
