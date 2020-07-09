Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6A5219E2D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 12:48:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 088B11654;
	Thu,  9 Jul 2020 12:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 088B11654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594291733;
	bh=6/rApGkbbYST5JvxhRUvbAUGIMJ3KILYpTuJ0fuqsNU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hpg8OOqR2osSD7/cT9SKnprmoGToOExiKTh3uZlRokwKyh0zZDyrYBk4ZAKgqHOpB
	 oyBOZI0SxWMDozrX9bWLIhfGzNc14O5DclBxuz+JdpMP1wd7MyX2sBvRCbTbLM2NNU
	 VnHRWCRUZkg2fLd2szDqAx1KVSx/bQYEMs+b6d2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FE1EF8011F;
	Thu,  9 Jul 2020 12:47:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDB94F80216; Thu,  9 Jul 2020 12:47:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A68DCF8011F
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 12:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A68DCF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V99vztrV"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E429206DF;
 Thu,  9 Jul 2020 10:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594291622;
 bh=6/rApGkbbYST5JvxhRUvbAUGIMJ3KILYpTuJ0fuqsNU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V99vztrVZEtPZ16vKtfDrScur775LyWVD/FeT2ujdUXaXwnv+wxabLt3zCN5U1A7q
 sRWJWsfAJiUBGnYiz+7pu1qVjwBZu+okaiFZqqJudnE0Cqhy3kP4lafUVlzQ7WbZDp
 d/jpgvuQmhJ5BkJfPy4E4c6hhIfqoPHPw/fiyOm0=
Date: Thu, 9 Jul 2020 11:46:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH 0/3] ASoC: mediatek: mt8183: support machine driver for
 rt1015
Message-ID: <20200709104656.GC4960@sirena.org.uk>
References: <20200708113233.3994206-1-tzungbi@google.com>
 <159422758800.28431.1053466753613230176.b4-ty@kernel.org>
 <CA+Px+wXPoW-VU-SXSZoBdMY7zSxWf3qxWJZGOE2hT4riwT8XtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline
In-Reply-To: <CA+Px+wXPoW-VU-SXSZoBdMY7zSxWf3qxWJZGOE2hT4riwT8XtA@mail.gmail.com>
X-Cookie: You will be married within a year.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, ALSA development <alsa-devel@alsa-project.org>,
 Rob Herring <robh+dt@kernel.org>
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


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 09, 2020 at 10:31:04AM +0800, Tzung-Bi Shih wrote:
> On Thu, Jul 9, 2020 at 1:00 AM Mark Brown <broonie@kernel.org> wrote:

> > [2/3] ASoC: mt8183: add compatible string for using rt1015
> >       commit: ab1ba5252f611c0efabca5fca81f5717445da47b

> I am curious about the 2nd patch's title.  Did you change it from
> "dt-bindings" to "ASoC" intentionally?

Yes.

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8G9Z8ACgkQJNaLcl1U
h9CenAf/UZi7LX4cjS0ryll6n/UDNUo7KrxtJ3eY8wRmFfmNLnHFu/rSsRkpgIGk
h2YIl2qhHps9r8Ru5m0G2Flj4B5e9GjKAtEjKB3zqKHY+wCKt+shVOAH9nKw4tF9
cXZl7Mnap837vbzqtO4443S/N9Xpa2RfPdLC7/7R+veTbb7f/+kM+yYM9DOE4FiH
JWhPMrJUDVF6bTcHG6N/n2/9mmv25rhkTnv/ogYVGc4ekZe6nPc0QzU9UCIbGGHd
zMUXFSJwt6VtydcZlvIwh+OdjO5fAvz2YSw6hvAXR+qCFmPrwVVgPJqgmyA/PlXZ
eXBdS/A4GQ84XKWvbmrpJVUIb0SSkg==
=yswb
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
