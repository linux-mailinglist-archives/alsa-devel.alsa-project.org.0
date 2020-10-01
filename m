Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD5528024B
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 17:15:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D9EC18D1;
	Thu,  1 Oct 2020 17:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D9EC18D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601565309;
	bh=j0cG0AVHXxhq0HY9ouX7jYmXHnzVhARDESLFI17sAQ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uTZuoX5rBHLNAHC5UbsmygWVkASpi9u3WWCjf6VRy8bUsPsslUCeR3WZSYYT4S3x+
	 WDihnh2vcUzzAXo1asfzrpHSGAMESlMLH/WegN4abRdw1fsG9yQF5gtJmVClVHqbEB
	 s3RtsmaCYU11U7dWoMWKJF9OxSWwcjVZEzmMHdwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCE2BF801D8;
	Thu,  1 Oct 2020 17:13:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBEA4F801F5; Thu,  1 Oct 2020 17:13:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9709F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 17:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9709F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pB+Nwy8E"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 188FB20897;
 Thu,  1 Oct 2020 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601565193;
 bh=j0cG0AVHXxhq0HY9ouX7jYmXHnzVhARDESLFI17sAQ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pB+Nwy8Ek8KcbFMjQfkhcfRpwj6ZG4pPytXbb/e2fRlsUlCSbOW5hvw33PL7umG2q
 EqoBCqEylWuP4KyPZVKMMdSsembza9iD0H3oI7dJnWlHncx2jowhEc791iHGJRxsmp
 YMXW8RORtCKvmDs7xaynbO3oFHQyYPjJUrT8kI4k=
Date: Thu, 1 Oct 2020 16:12:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-pcm: add missing ret=0 at soc_pcm_open()
Message-ID: <20201001151214.GA4939@sirena.org.uk>
References: <87ft6ya65z.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline
In-Reply-To: <87ft6ya65z.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Exact change only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
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


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 01, 2020 at 02:07:41PM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>=20
> commit 140a4532cdb8c ("ASoC: soc-pcm: add soc_pcm_clean() and call it
> from soc_pcm_open/close()") switched to use soc_pcm_clean() at
> soc_pcm_open().

This doesn't apply against current code, please check and resend (does
it depend on your latest series you posted yesterday)?

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl918c0ACgkQJNaLcl1U
h9AaiQf+POkJQ+zUhSCcEKz4Bp6up0/o2LAENEOmNdAgmG8l4ayR+74BydXJ7dB1
rDZ9ujcy6edEn/45EHCnTM61iuPw9vt2jmSih538eEXFOTBnjyjH4JfLBia5mv/j
R4n6cTUMCuyWahTEXCemBzH5MDa/QPfj9KvPzU3Xt1Q32B7xEJl6DVnru3qmR/dn
8EOTYfTsks4qaKIomml3kVZKyILngIwEPOCMI11HuY7KkbVB7nMdIZ2aCfCY2VHm
i3Oa3ccc7uSKkNQ1bTylU6jHO1HdTilNM3JEpe27otkp19szEWtd3TUk7zLo3PXd
ChaYloHrLLjmmYio8+pFMQ2YBONCdw==
=+uk9
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--
