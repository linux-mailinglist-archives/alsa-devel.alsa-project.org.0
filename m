Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D83173D0E7D
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 14:05:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4308016D6;
	Wed, 21 Jul 2021 14:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4308016D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626869113;
	bh=qmlL+alZi7frGVKV50eK3FDJBv4N3ezQl8BfMmEJbLQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bhbvCc4pTk7qWdhqvFrTIiAmj7NnLwCHPjYDr3TROFMVLN3mar9oWrNsRj4Oesu3I
	 enQWAlN1Iy1FRXzGYoTaMRP49AUSwBBbTSMvG7azkHF1gcQNgVSAAJkushcLqn3u3l
	 yCuTviYgmXk2jMnUaFpqMvdJyMIkYqfqgNHNTYjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B00F7F804AB;
	Wed, 21 Jul 2021 14:03:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8303F804AC; Wed, 21 Jul 2021 14:03:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 583E9F80143
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 14:03:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 583E9F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jUcSEdL6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85D0D611C1;
 Wed, 21 Jul 2021 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626869014;
 bh=qmlL+alZi7frGVKV50eK3FDJBv4N3ezQl8BfMmEJbLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jUcSEdL61dFVhqhLBksgPI8OHzpBZ14Fdbiwj7PcHPysIGBbCm8Udi+mZmBkbX/+D
 HbiA21bq4NKgL8GDdcYKLAa5GxI96rAOMh4czijzQHCkJChIdDEEDFB693qGa2hkY2
 whCQ19O16E69w83aGgLrRl68siB/JExB3DOzfs62SwdNSgbnco5XFSV5LHr9muqge7
 hsnoiUmAYBitg3vJZXCrsQ0CtJYC72zWVEseI85e6GnmLIBsOcQKg+p9xLoiet9eea
 4KLr9n8fkNhPEAqKPSoF/flCsJ6xMx7dHQkgQHGVrMV1dq2aYbnC4Lr3P25xrB7V0x
 GmS59XYqgc1LQ==
Date: Wed, 21 Jul 2021 13:03:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v3 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210721120327.GC4259@sirena.org.uk>
References: <20210702205127.1400539-1-drhodes@opensource.cirrus.com>
 <20210702205127.1400539-2-drhodes@opensource.cirrus.com>
 <20210705192054.GG4574@sirena.org.uk>
 <b9627394-4d71-cafa-0944-14dad137ffdd@opensource.cirrus.com>
 <20210712150341.GF4435@sirena.org.uk>
 <5ab8fd33-3164-8bf5-2fb4-4819ef01a815@opensource.cirrus.com>
 <20210721090104.GJ9223@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline
In-Reply-To: <20210721090104.GJ9223@ediswmail.ad.cirrus.com>
X-Cookie: Many pages make a thick book.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: David Rhodes <drhodes@opensource.cirrus.com>, robh@kernel.org,
 brian.austin@cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, david.rhodes@cirrus.com
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


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 21, 2021 at 09:01:04AM +0000, Charles Keepax wrote:

> why that is necessary in the first place. AFAIK DAPM won't attempt
> to power down a widget without powering it up first. So, at least

If the power control register bit for the widget defaults to enabled
then DAPM will see the widget as initially enabled and power it down
unless it's part of a complete path, that's pretty unusual though.

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD4DQ8ACgkQJNaLcl1U
h9ACAwf/bh09UGzhrazSgz8CDHNuvmNU1CStD9Wx+l6j7JYH/qyaXePYPekxM2XZ
CatMy8lhLg+uZwUd/4soFahjZKUU5kpEHJtW20e25rP0fh59Wv6Kt7MnhIZMBsTh
q8Re2ZKzzgrFBCmDnjStKhF3x3o8i92ED1cfQuTwbNJ0sORmS5zaNk4UdctvG2/6
mV1JtpptfwXC8PC09yvJAj0YkvsL1YFLTUGZ1Unhl90wivkp6l3EdxbYgba5XzLg
ASoTZ0relkZYndER85O4Lx1GaAmPhHQch19sgb1JP3BOkoNarvSGRUMP6EJGj+Rs
Hv9B2DQt4tIIPe+kWGYc3UBQZiVn1A==
=OOKo
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
